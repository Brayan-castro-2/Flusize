import { createServerClient, type CookieOptions } from '@supabase/ssr'
import { NextResponse, type NextRequest } from 'next/server'

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
    const isAdminRoute = url.pathname.startsWith('/admin')
    const isGarageRoute = url.pathname.startsWith('/mi-garage')
    const isSuperAdminRoute = url.pathname.startsWith('/super-admin')

    const FOUNDER_EMAILS = [
        'flusize@gmail.com'
    ];
    const isSuperAdmin = user && FOUNDER_EMAILS.includes(user.email || '');

    // 1. Visitante sin cuenta queriendo entrar a zonas protegidas
    if (!user && (isAdminRoute || isGarageRoute || isSuperAdminRoute)) {
        url.pathname = '/login'
        return NextResponse.redirect(url)
    }

    if (user && isSuperAdminRoute && !isSuperAdmin) {
        url.pathname = '/mi-garage'
        return NextResponse.redirect(url)
    }

    // 2. Usuario con cuenta decidiendo a dónde ir (o entrando de un link)
    if (user && isAuthRoute) {
        if (isSuperAdmin) {
            url.pathname = '/super-admin'
            return NextResponse.redirect(url)
        }

        // Usar Supabase SSR Client para chequear el ROL en Base de datos `perfiles`
        const { data: perfil } = await supabase
            .from('perfiles')
            .select('rol')
            .eq('id', user.id)
            .single()

        if (perfil) {
            // Existe en perfiles de Taller
            if (perfil.rol === 'taller_admin' || perfil.rol === 'admin' || perfil.rol === 'superadmin' || perfil.rol === 'mecanico') {
                url.pathname = '/admin/ordenes'
                return NextResponse.redirect(url)
            }
        } else {
            // No existe en perfiles (admin taller), deducimos que es Cliente
            url.pathname = '/mi-garage'
            return NextResponse.redirect(url)
        }
    }

    // 3. Usuario ya validado y en su zona correcta (o yendo a otra API, etc). 
    // OJO: Podríamos validar que un cliente no entre a /admin aquí.
    if (user && isAdminRoute) {
        const { data: perfil } = await supabase.from('perfiles').select('id').eq('id', user.id).single()
        if (!perfil) {
            // Un cliente tratando de hackear /admin
            url.pathname = '/mi-garage'
            return NextResponse.redirect(url)
        }
    }

    if (user && isGarageRoute) {
        // Admin queriendo ver mi-garage (puede permitirse o redirigirse, por ahora lo permito o restrinjo)
        const { data: perfil } = await supabase.from('perfiles').select('id').eq('id', user.id).single()
        if (perfil) {
            // Es admin/taller. No debería estar en garage de clientes
            url.pathname = '/admin/ordenes'
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
        '/((?!api|_next/static|_next/image|favicon.ico|.*\\.(?:svg|png|jpg|jpeg|gif|webp)$).*)',
    ],
}
