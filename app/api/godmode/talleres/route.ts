import { createClient } from '@supabase/supabase-js';
import { NextRequest, NextResponse } from 'next/server';

const supabaseUrl = process.env.NEXT_PUBLIC_SUPABASE_URL!;
const serviceRoleKey = process.env.SUPABASE_SERVICE_ROLE_KEY!;
const anonKey = process.env.NEXT_PUBLIC_SUPABASE_ANON_KEY!;

// Cliente con SERVICE_ROLE para bypass de RLS — lee TODOS los talleres
const supabaseAdmin = createClient(supabaseUrl, serviceRoleKey, {
    auth: { autoRefreshToken: false, persistSession: false },
});

export async function GET(req: NextRequest) {
    try {
        // Verificar que el solicitante sea flusize_admin
        const authHeader = req.headers.get('Authorization') || '';
        const token = authHeader.replace('Bearer ', '').trim();

        if (!token) {
            return NextResponse.json({ error: 'No autorizado' }, { status: 401 });
        }

        // Verificar identidad del solicitante
        const supabaseClient = createClient(supabaseUrl, anonKey, {
            auth: { autoRefreshToken: false, persistSession: false },
            global: { headers: { Authorization: `Bearer ${token}` } },
        });

        const { data: { user } } = await supabaseClient.auth.getUser();
        if (!user) return NextResponse.json({ error: 'Sesión inválida' }, { status: 401 });

        // Verificar que sea flusize_admin
        const { data: perfil } = await supabaseAdmin
            .from('perfiles')
            .select('rol')
            .eq('id', user.id)
            .maybeSingle();

        if (perfil?.rol !== 'flusize_admin') {
            return NextResponse.json({ error: 'Acceso denegado: solo fundadores de Flusize' }, { status: 403 });
        }

        // Fetch ALL talleres + conteo de perfiles por taller
        const { data: talleres, error } = await supabaseAdmin
            .from('talleres')
            .select(`
                id, nombre, email, telefono, 
                plan_suscripcion, activo, creado_en, slug
            `)
            .order('creado_en', { ascending: false });

        if (error) throw error;

        // Para cada taller, contar cuántos perfiles tiene
        const talleresConStats = await Promise.all(
            (talleres || []).map(async (t) => {
                const { count: totalUsuarios } = await supabaseAdmin
                    .from('perfiles')
                    .select('*', { count: 'exact', head: true })
                    .eq('taller_id', t.id);

                const { count: totalOrdenes } = await supabaseAdmin
                    .from('ordenes')
                    .select('*', { count: 'exact', head: true })
                    .eq('taller_id', t.id);

                return { ...t, totalUsuarios: totalUsuarios || 0, totalOrdenes: totalOrdenes || 0 };
            })
        );

        return NextResponse.json({ talleres: talleresConStats }, { status: 200 });
    } catch (e: any) {
        console.error('[API /godmode/talleres] Error:', e);
        return NextResponse.json({ error: e.message }, { status: 500 });
    }
}

export async function PATCH(req: NextRequest) {
    const authHeader = req.headers.get('Authorization') || '';
    const token = authHeader.replace('Bearer ', '').trim();
    if (!token) return NextResponse.json({ error: 'No autorizado' }, { status: 401 });

    const supabaseClient = createClient(supabaseUrl, anonKey, {
        auth: { autoRefreshToken: false, persistSession: false },
        global: { headers: { Authorization: `Bearer ${token}` } },
    });

    const { data: { user } } = await supabaseClient.auth.getUser();
    if (!user) return NextResponse.json({ error: 'Sesión inválida' }, { status: 401 });

    const { data: perfil } = await supabaseAdmin
        .from('perfiles').select('rol').eq('id', user.id).maybeSingle();

    if (perfil?.rol !== 'flusize_admin') {
        return NextResponse.json({ error: 'Acceso denegado' }, { status: 403 });
    }

    const body = await req.json();
    const { tallerId, activo, plan_suscripcion } = body;

    const updates: Record<string, any> = {};
    if (activo !== undefined) updates.activo = activo;
    if (plan_suscripcion !== undefined) updates.plan_suscripcion = plan_suscripcion;

    const { error } = await supabaseAdmin
        .from('talleres').update(updates).eq('id', tallerId);

    if (error) return NextResponse.json({ error: error.message }, { status: 500 });
    return NextResponse.json({ success: true }, { status: 200 });
}

export async function POST(req: NextRequest) {
    const authHeader = req.headers.get('Authorization') || '';
    const token = authHeader.replace('Bearer ', '').trim();
    if (!token) return NextResponse.json({ error: 'No autorizado' }, { status: 401 });

    const supabaseClient = createClient(supabaseUrl, anonKey, {
        auth: { autoRefreshToken: false, persistSession: false },
        global: { headers: { Authorization: `Bearer ${token}` } },
    });

    const { data: { user } } = await supabaseClient.auth.getUser();
    if (!user) return NextResponse.json({ error: 'Sesión inválida' }, { status: 401 });

    const { data: perfil } = await supabaseAdmin
        .from('perfiles').select('rol').eq('id', user.id).maybeSingle();

    if (perfil?.rol !== 'flusize_admin') {
        return NextResponse.json({ error: 'Acceso denegado' }, { status: 403 });
    }

    const body = await req.json();
    const { nombre, email, telefono, plan_suscripcion } = body;

    if (!nombre?.trim()) return NextResponse.json({ error: 'Nombre requerido' }, { status: 400 });

    const slug = nombre.toLowerCase().replace(/\s+/g, '-').replace(/[^a-z0-9-]/g, '').substring(0, 50);

    const { data, error } = await supabaseAdmin
        .from('talleres')
        .insert({ nombre: nombre.trim(), email: email?.trim() || null, telefono: telefono?.trim() || null, plan_suscripcion: plan_suscripcion || 'GRATIS', activo: true, slug })
        .select()
        .single();

    if (error) return NextResponse.json({ error: error.message }, { status: 500 });
    return NextResponse.json({ taller: data }, { status: 201 });
}
