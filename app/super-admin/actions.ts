'use server';

import { createClient } from '@supabase/supabase-js';

const supabaseUrl = process.env.NEXT_PUBLIC_SUPABASE_URL!;
const supabaseServiceKey = process.env.SUPABASE_SERVICE_ROLE_KEY || process.env.NEXT_PUBLIC_SUPABASE_ANON_KEY!;

const supabaseAdmin = createClient(supabaseUrl, supabaseServiceKey, {
    auth: {
        autoRefreshToken: false,
        persistSession: false
    }
});

export async function crearTallerAction(formData: FormData) {
    const nombre = formData.get('nombre') as string;
    const email = formData.get('email') as string;
    const telefono = formData.get('telefono') as string;
    const password = formData.get('password') as string;

    if (!nombre || !email || !password) {
        return { error: 'Por favor, completa todos los campos obligatorios.' };
    }

    try {
        // 1. Validar que no exista un taller con el mismo nombre (opcional pero seguro)
        // 2. Crear Taller
        const { data: taller, error: tallerError } = await supabaseAdmin
            .from('talleres')
            .insert({
                nombre,
                telefono: telefono || null,
                activo: true,
                plan_suscripcion: 'Pro Tracking'
            })
            .select()
            .single();

        if (tallerError) throw new Error(`Error creando el taller: ${tallerError.message}`);

        // 3. Crear Auth User
        const { data: authData, error: authError } = await supabaseAdmin.auth.admin.createUser({
            email,
            password,
            email_confirm: true,
            user_metadata: {
                nombre_completo: `Admin ${nombre}`
            }
        });

        if (authError) {
            // Intento de Rollback del taller
            await supabaseAdmin.from('talleres').delete().eq('id', taller.id);
            throw new Error(`Error al registrar el usuario: ${authError.message}`);
        }

        const userId = authData.user.id;

        // 4. Asegurar el registro en la tabla 'perfiles' (puede que un trigger lo haya creado)
        const { data: perfil } = await supabaseAdmin
            .from('perfiles')
            .select('id')
            .eq('id', userId)
            .maybeSingle();

        if (perfil) {
            // Update al perfil creado por el trigger
            const { error: updError } = await supabaseAdmin.from('perfiles').update({
                rol: 'taller_admin',
                taller_id: taller.id,
                activo: true
            }).eq('id', userId);
            if (updError) throw updError;
        } else {
            // Si el trigger no lo creó, insertamos
            const { error: insError } = await supabaseAdmin.from('perfiles').insert({
                id: userId,
                email,
                nombre_completo: `Admin ${nombre}`,
                rol: 'taller_admin',
                taller_id: taller.id,
                activo: true
            });
            if (insError) throw insError;
        }

        return { success: true, message: `El taller "${nombre}" fue creado con éxito y el plan Pro asignado.` };

    } catch (e: any) {
        console.error('[Action] Error en crearTallerAction:', e);
        return { error: e.message || 'Error desconocido al crear el taller.' };
    }
}
