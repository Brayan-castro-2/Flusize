import { NextResponse } from 'next/server';
import { createClient } from '@supabase/supabase-js';

// Inicializar supabaseAdmin dentro de la función para evitar errores en tiempo de construcción (build) si faltan variables de entorno
const getSupabaseAdmin = () => createClient(
    process.env.NEXT_PUBLIC_SUPABASE_URL!,
    process.env.SUPABASE_SERVICE_ROLE_KEY!
);

export async function POST(req: Request) {
    const supabaseAdmin = getSupabaseAdmin();
    try {
        const { userId, email, nombre } = await req.json();

        if (!userId || !email) {
            return NextResponse.json({ error: 'Faltan campos requeridos (userId, email)' }, { status: 400 });
        }

        // 1. Crear o actualizar el Perfil Global
        // Primero, intentar buscar un perfil global existente por email
        const { data: existingPerfilGlobal, error: searchError } = await supabaseAdmin
            .from('perfiles_globales')
            .select('id')
            .eq('email', email)
            .single();

        let perfilGlobalId = existingPerfilGlobal?.id;

        if (!perfilGlobalId) {
            // Upsert / Insert Perfil Global si no existe
            const { data: newPerfilGlobal, error: insertError } = await supabaseAdmin
                .from('perfiles_globales')
                .insert({
                    id: userId, // Vincular ID de auth directamente
                    email: email,
                    nombre_completo: nombre || email.split('@')[0],
                    saldo_puntos: 0,
                    es_super_admin: false,
                })
                .select('id')
                .single();

            if (insertError) {
                console.error('Error insertando perfil global:', insertError);
                // Si falla porque el auth trigger ya lo creo, probamos buscarlo nuevamente de fallback
                const { data: fallbackPerfil } = await supabaseAdmin
                    .from('perfiles_globales')
                    .select('id')
                    .eq('email', email)
                    .single();

                if (fallbackPerfil) {
                    perfilGlobalId = fallbackPerfil.id;
                } else {
                    return NextResponse.json({ error: 'No se pudo crear el perfil global' }, { status: 500 });
                }
            } else {
                perfilGlobalId = newPerfilGlobal?.id;
            }
        } else {
            // Si ya existía, pero el auth ID es nuevo, actualizar el ID no es posible si es PK, pero 
            // asumimos que el trigger no interfirió o que ya existía correctamente.
            // Para asegurar, actualizamos el nombre si venía uno mejor
            await supabaseAdmin
                .from('perfiles_globales')
                .update({ nombre_completo: nombre || email.split('@')[0] })
                .eq('id', perfilGlobalId);
        }

        // 2. Vincular "Clientes" locales de talleres a este perfil global (por email)
        if (perfilGlobalId) {
            const { error: updateClientesError } = await supabaseAdmin
                .from('clientes')
                .update({ perfil_global_id: perfilGlobalId })
                .eq('email', email)
                .is('perfil_global_id', null);

            if (updateClientesError) {
                console.warn('Advertencia vinculando clientes locales:', updateClientesError);
                // No lanzamos error para no detener el flujo de registro, solo advertimos
            }
        }

        return NextResponse.json({ success: true, perfilGlobalId });
    } catch (error: any) {
        console.error('Error en activate-client:', error);
        return NextResponse.json({ error: error.message || 'Ocurrió un error en el servidor.' }, { status: 500 });
    }
}
