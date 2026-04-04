import { createServerClient, type CookieOptions } from '@supabase/ssr'
import { NextResponse, type NextRequest } from 'next/server'
import { normalizePlan, planCanAccess } from '@/lib/plan-config'

export async function middleware(request: NextRequest) {
    let supabaseResponse = NextResponse.next({
        request,
    })

    const supabase = createServerClient(
        process.env.NEXT_PUBLIC_SUPABASE_URL!,
        process.env.NEXT_PUBLIC_SUPABASE_ANON_KEY!,
        {
            cookies: {
                getAll() {
                    return request.cookies.getAll()
                },
                setAll(cookiesToSet) {
                    cookiesToSet.forEach(({ name, value, options }) => request.cookies.set(name, value))
                    supabaseResponse = NextResponse.next({
                        request,
                    })
                    cookiesToSet.forEach(({ name, value, options }) =>
                        supabaseResponse.cookies.set(name, value, options)
                    )
                },
            },
        }
    )

    // Autenticar la sesión en este request y potencialmente refrescar los tokens (via setAll)
    const {
        data: { user },
    } = await supabase.auth.getUser()

    const url = request.nextUrl.clone()

    // --- REGLAS DE REDIRECCIÓN ESTRICTA ---
    const isAuthRoute = url.pathname === '/login' || url.pathname === '/validando-sesion' || url.pathname === '/'
    const isAdminRoute = url.pathname.startsWith('/admin') || url.pathname.startsWith('/recepcion')
    const isGarageRoute = url.pathname.startsWith('/mi-garage')
    const isSuperAdminRoute = url.pathname.startsWith('/superadmin') || url.pathname.startsWith('/super-admin')

    const FOUNDER_EMAILS = [
        'flusize@gmail.com',
        'brayan.castro.2@gmail.com',
        'founder@flusize.com'
    ];
    const isFounder = user && user.email && FOUNDER_EMAILS.includes(user.email.toLowerCase());

    // 1. Visitante sin cuenta queriendo entrar a zonas protegidas
    if (!user && (isAdminRoute || isGarageRoute || isSuperAdminRoute)) {
        url.pathname = '/login'
        return NextResponse.redirect(url)
    }

    // --- REGLA ESPECIAL PARA SUPERADMIN (FUNDERS) ---
    // Si es founder, siempre puede entrar a superadmin (Early Return)
    if (user && isSuperAdminRoute) {
        if (!isFounder) {
            url.pathname = '/recepcion' // Redirigir a recepcion si no es founder
            return NextResponse.redirect(url)
        }
        // Early return si es founder entrando a /superadmin
        return supabaseResponse
    }

    // 2. Usuario con cuenta decidiendo a dónde ir (o entrando de un link)
    if (user && isAuthRoute) {
        if (isFounder) {
            url.pathname = '/superadmin'
            return NextResponse.redirect(url)
        }

        // Usar Supabase SSR Client para chequear el ROL y PLAN en Base de datos
        const { data: perfil } = await supabase
            .from('perfiles')
            .select('rol, talleres(plan_suscripcion)')
            .eq('id', user.id)
            .single()

        if (perfil) {
            const plan = (perfil as any).talleres?.plan_suscripcion || 'Gratis'

            // Existe en perfiles de Taller → landing siempre en /recepcion
            if (['taller_admin', 'admin', 'superadmin', 'mecanico'].includes(perfil.rol)) {
                url.pathname = '/recepcion'
                return NextResponse.redirect(url)
            } else {
                // Es rol cliente u otro
                url.pathname = '/mi-garage'
                return NextResponse.redirect(url)
            }
        } else {
            // No existe en perfiles, deducimos que es Cliente
            url.pathname = '/mi-garage'
            return NextResponse.redirect(url)
        }
    }

    // 3. Usuario ya validado y en su zona correcta (o yendo a otra API, etc). 
    // OJO: Podríamos validar que un cliente no entre a /admin aquí.
    if (user && isAdminRoute) {
        const { data: perfil } = await supabase
            .from('perfiles')
            .select('rol, taller_id, talleres(plan_suscripcion, modulos_activos)')
            .eq('id', user.id)
            .single()

        if (!perfil || !['taller_admin', 'admin', 'superadmin', 'mecanico'].includes(perfil.rol)) {
            // Un cliente tratando de hackear /admin
            url.pathname = '/mi-garage'
            return NextResponse.redirect(url)
        }

        let userPlan = (perfil as any).talleres?.plan_suscripcion
        let userModulos = (perfil as any).talleres?.modulos_activos || {}

        // --- FALLBACK PARA CUENTAS DONDE taller_id ESTÁ SOLO EN METADATA ---
        if (!userPlan && user.user_metadata?.taller_id) {
            const { data: tallerFb } = await supabase
                .from('talleres')
                .select('plan_suscripcion, modulos_activos')
                .eq('id', user.user_metadata.taller_id)
                .single()
            if (tallerFb) {
                userPlan = tallerFb.plan_suscripcion
                userModulos = tallerFb.modulos_activos || {}
            }
        }
        userPlan = userPlan || 'Gratis'

        const plan = normalizePlan(userPlan);

        const isFlusize = isFounder || perfil.rol === 'flusize_admin';

        // Mapeo dinámico para módulos a la carta (ej. un plan Premium que compra Flota)
        let hasAclModulo = false;
        const rootPath = url.pathname;
        if (rootPath.startsWith('/admin/flota') && userModulos['flota'] === true) hasAclModulo = true;
        if (rootPath.startsWith('/admin/contratos') && userModulos['contratos'] === true) hasAclModulo = true;
        if (rootPath.startsWith('/admin/inventario') && userModulos['inventario'] === true) hasAclModulo = true;
        if (rootPath.startsWith('/admin/clientes') && userModulos['clientes'] === true) hasAclModulo = true;
        if (rootPath.startsWith('/admin/citas') && userModulos['agenda'] === true) hasAclModulo = true;
        if (rootPath.startsWith('/admin/agenda') && userModulos['agenda'] === true) hasAclModulo = true;
        if (rootPath.startsWith('/recepcion') && userModulos['recepcion'] === true) hasAclModulo = true;
        if (rootPath.startsWith('/admin/ordenes') && userModulos['ordenes'] === true) hasAclModulo = true;

        if (!isFlusize && !planCanAccess(plan, url.pathname) && !hasAclModulo) {
            console.log(`🚫 [Plan Guard] Plan "${plan}" no puede acceder a ${url.pathname} → redirigiendo a /admin/perfil`)
            url.pathname = '/admin/perfil'
            return NextResponse.redirect(url)
        }
    }

    if (user && isGarageRoute) {
        // Admin queriendo ver mi-garage (puede permitirse o redirigirse, por ahora lo permito o restrinjo)
        const { data: perfil } = await supabase.from('perfiles').select('rol').eq('id', user.id).single()
        if (perfil && ['taller_admin', 'admin', 'superadmin', 'mecanico'].includes(perfil.rol)) {
            // Es admin/taller. No debería estar en garage de clientes
            url.pathname = '/recepcion'
            return NextResponse.redirect(url)
        }
    }

    return supabaseResponse
}

export const config = {
    matcher: [
        /*
         * Match all request paths except for the ones starting with:
         * - api (API routes)
         * - _next/static (static files)
         * - _next/image (image optimization files)
         * - favicon.ico (favicon file)
         */
        '/((?!api|_next/static|_next/image|favicon.ico).*)',
    ],
}
