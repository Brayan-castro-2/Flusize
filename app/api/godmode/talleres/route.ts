import { createClient } from '@supabase/supabase-js';
import { NextRequest, NextResponse } from 'next/server';
import { revalidatePath } from 'next/cache';

const supabaseUrl = process.env.NEXT_PUBLIC_SUPABASE_URL!;
const serviceRoleKey = process.env.SUPABASE_SERVICE_ROLE_KEY!;
const anonKey = process.env.NEXT_PUBLIC_SUPABASE_ANON_KEY!;

const supabaseAdmin = createClient(supabaseUrl, serviceRoleKey, {
    auth: { autoRefreshToken: false, persistSession: false },
});

async function verifyFlusizeAdmin(req: NextRequest) {
    const token = (req.headers.get('Authorization') || '').replace('Bearer ', '').trim();
    if (!token) return null;

    const supabaseClient = createClient(supabaseUrl, anonKey, {
        auth: { autoRefreshToken: false, persistSession: false },
        global: { headers: { Authorization: `Bearer ${token}` } },
    });

    const { data: { user } } = await supabaseClient.auth.getUser();
    if (!user) return null;

    const { data: perfil } = await supabaseAdmin
        .from('perfiles')
        .select('rol')
        .eq('id', user.id)
        .maybeSingle();

    return perfil?.rol === 'flusize_admin' ? user : null;
}

// ── GET: Listar todos los talleres + stats ────────────────────────────────────
export async function GET(req: NextRequest) {
    try {
        const user = await verifyFlusizeAdmin(req);
        if (!user) return NextResponse.json({ error: 'Acceso denegado' }, { status: 403 });

        const { data: talleres, error } = await supabaseAdmin
            .from('talleres')
            .select('id, nombre, email, telefono, plan_suscripcion, activo, creado_en, slug, ciudad, dueno_nombre, modulos_activos')
            .order('creado_en', { ascending: false });

        if (error) throw error;

        const talleresConStats = await Promise.all(
            (talleres || []).map(async (t) => {
                const [{ count: totalUsuarios }, { count: totalOrdenes }] = await Promise.all([
                    supabaseAdmin.from('perfiles').select('*', { count: 'exact', head: true }).eq('taller_id', t.id),
                    supabaseAdmin.from('ordenes').select('*', { count: 'exact', head: true }).eq('taller_id', t.id),
                ]);
                return { ...t, totalUsuarios: totalUsuarios || 0, totalOrdenes: totalOrdenes || 0 };
            })
        );

        return NextResponse.json({ talleres: talleresConStats }, { status: 200 });
    } catch (e: any) {
        return NextResponse.json({ error: e.message }, { status: 500 });
    }
}

// ── PATCH: Actualizar activo/plan de un taller ────────────────────────────────
export async function PATCH(req: NextRequest) {
    const user = await verifyFlusizeAdmin(req);
    if (!user) return NextResponse.json({ error: 'Acceso denegado' }, { status: 403 });

    const body = await req.json();
    const { tallerId, activo, plan_suscripcion, modulos_activos } = body;

    const updates: Record<string, any> = {};
    if (activo !== undefined) updates.activo = activo;
    if (plan_suscripcion !== undefined) updates.plan_suscripcion = plan_suscripcion;
    if (modulos_activos !== undefined) updates.modulos_activos = modulos_activos;

    const { error } = await supabaseAdmin.from('talleres').update(updates).eq('id', tallerId);
    if (error) return NextResponse.json({ error: error.message }, { status: 500 });

    // Revalidación instantánea para que el taller vea los cambios
    revalidatePath('/admin');
    revalidatePath('/(dashboard)/admin');
    revalidatePath('/superadmin');

    return NextResponse.json({ success: true }, { status: 200 });
}

// ── POST: Crear nuevo taller completo (Asistente de Registro Pro) ──────────────
export async function POST(req: NextRequest) {
    const user = await verifyFlusizeAdmin(req);
    if (!user) return NextResponse.json({ error: 'Acceso denegado' }, { status: 403 });

    const body = await req.json();
    const {
        // Datos base
        nombre, rut, dueno_nombre,
        // Ubicación
        direccion, ciudad, latitud, longitud,
        // Contacto
        telefono, email, whatsapp,
        // Redes sociales
        instagram, facebook,
        // Config fiscal
        aplica_iva, porcentaje_iva,
        // Plan y servicios
        plan_suscripcion, servicios_base,
        // Micro-Fase 45: Dinámicos
        tipo, servicios_flex,
        // Micro-Fase 47: Módulos
        modulos_activos,
    } = body;

    if (!nombre?.trim()) {
        return NextResponse.json({ error: 'El nombre del taller es obligatorio.' }, { status: 400 });
    }

    // Generar slug único
    const baseSlug = nombre.toLowerCase()
        .normalize('NFD').replace(/[\u0300-\u036f]/g, '')
        .replace(/\s+/g, '-').replace(/[^a-z0-9-]/g, '').substring(0, 45);
    const slug = `${baseSlug}-${Date.now().toString(36)}`;

    // Paso A: Insertar el taller
    const { data: nuevoTaller, error: tallerError } = await supabaseAdmin
        .from('talleres')
        .insert({
            nombre: nombre.trim(),
            rut: rut?.trim() || null,
            dueno_nombre: dueno_nombre?.trim() || null,
            direccion: direccion?.trim() || null,
            ciudad: ciudad?.trim() || null,
            latitud: latitud ? parseFloat(latitud) : null,
            longitud: longitud ? parseFloat(longitud) : null,
            telefono: telefono?.trim() || null,
            email: email?.trim() || null,
            whatsapp: whatsapp?.trim() || null,
            instagram: instagram?.trim() || null,
            facebook: facebook?.trim() || null,
            aplica_iva: aplica_iva !== false,
            porcentaje_iva: porcentaje_iva ? parseInt(porcentaje_iva) : 19,
            plan_suscripcion: plan_suscripcion || 'GRATIS',
            tipo: tipo || null,
            servicios: servicios_flex
                ? servicios_flex.split(',').map((s: string) => s.trim()).filter(Boolean)
                : [],
            // Micro-Fase 47: Lógica de Monetización (Feature Gating)
            modulos_activos: plan_suscripcion === 'GRATIS'
                ? { agenda: false, tracking: false, inventario: false, fiscal: false, checklist: false }
                : (modulos_activos || { agenda: true, tracking: true, inventario: false, fiscal: false, checklist: false }),
            activo: true,
            slug,
        })
        .select()
        .single();

    if (tallerError) {
        return NextResponse.json({ error: tallerError.message }, { status: 500 });
    }

    // Paso B: Insertar servicios base si fueron provistos
    let serviciosInsertados = 0;
    if (servicios_base && Array.isArray(servicios_base) && servicios_base.length > 0) {
        const serviciosRows = servicios_base
            .filter((s: any) => s.descripcion && s.descripcion.trim())
            .map((s: any) => ({
                descripcion: s.descripcion.trim(),
                taller_id: nuevoTaller.id,
                precio_base: parseFloat(s.precio) || 0,
                activo: true,
            }));

        if (serviciosRows.length > 0) {
            const { error: serviciosError } = await supabaseAdmin
                .from('servicios_frecuentes')
                .insert(serviciosRows);

            if (!serviciosError) {
                serviciosInsertados = serviciosRows.length;
            }
        }
    }

    // Paso C: Crear Usuario Auth para el Dueño
    let userCreated = false;
    if (email?.trim() && body.password_dueno) {
        const { data: authUser, error: authError } = await supabaseAdmin.auth.admin.createUser({
            email: email.trim(),
            password: body.password_dueno,
            email_confirm: true,
            user_metadata: {
                nombre_completo: dueno_nombre || `Admin ${nombre}`
            }
        });

        if (!authError && authUser.user) {
            // Paso D: Crear Perfil vinculado
            const { error: perfilError } = await supabaseAdmin
                .from('perfiles')
                .insert({
                    id: authUser.user.id,
                    email: email.trim(),
                    nombre_completo: dueno_nombre || `Admin ${nombre}`,
                    rol: 'taller_admin',
                    taller_id: nuevoTaller.id,
                    activo: true
                });

            if (!perfilError) userCreated = true;
        } else {
            console.error("Error creando auth user:", authError);
        }
    }

    return NextResponse.json({
        success: true,
        taller: nuevoTaller,
        serviciosInsertados,
        userCreated,
        passwordUsed: body.password_dueno,
        accesUrl: `/admin/ordenes`,
        slug: nuevoTaller.slug,
    }, { status: 201 });

    // Revalidación para listar el nuevo taller
    revalidatePath('/superadmin');
    revalidatePath('/admin');
}
