'use server';

import { createClient } from '@supabase/supabase-js';
import { cookies } from 'next/headers';

const supabaseUrl = process.env.NEXT_PUBLIC_SUPABASE_URL!;
const supabaseServiceKey = process.env.SUPABASE_SERVICE_ROLE_KEY || process.env.NEXT_PUBLIC_SUPABASE_ANON_KEY!;

const supabaseAdmin = createClient(supabaseUrl, supabaseServiceKey, {
    auth: {
        autoRefreshToken: false,
        persistSession: false
    }
});

export async function crearUsuarioAdminAction(data: {
    email: string,
    password: string,
    nombreCompleto: string,
    rol: 'mecanico' | 'taller_admin' | 'superadmin',
    tallerId: string
}) {
    const { email, password, nombreCompleto, rol, tallerId } = data;

    if (!email || !password || !nombreCompleto || !tallerId) {
        return { error: 'Faltan campos obligatorios' };
    }

    try {
        // 1. Crear el auth user con la Admin API (no cierra sesión al creador)
        const { data: authData, error: authError } = await supabaseAdmin.auth.admin.createUser({
            email,
            password,
            email_confirm: true,
            user_metadata: {
                nombre_completo: nombreCompleto,
                rol: rol,
                activo: true
            }
        });

        if (authError) {
            return { error: `Error de Auth: ${authError.message}` };
        }

        const userId = authData.user.id;

        // 2. Asegurarnos que el perfil existe y tiene el taller_id correcto
        const { data: perfil } = await supabaseAdmin
            .from('perfiles')
            .select('id')
            .eq('id', userId)
            .maybeSingle();

        if (perfil) {
            // Actualizar si el trigger lo creó
            const { error: updError } = await supabaseAdmin.from('perfiles').update({
                nombre_completo: nombreCompleto,
                rol: rol,
                taller_id: tallerId,
                activo: true
            }).eq('id', userId);

            if (updError) return { error: updError.message };
        } else {
            // Insertar manualmente si no hay trigger
            const { error: insError } = await supabaseAdmin.from('perfiles').insert({
                id: userId,
                email,
                nombre_completo: nombreCompleto,
                rol: rol,
                taller_id: tallerId,
                activo: true
            });

            if (insError) return { error: insError.message };
        }

        return { success: true };
    } catch (e: any) {
        return { error: e.message || 'Error interno del servidor' };
    }
}
