import { createClient } from '@supabase/supabase-js';
import { NextRequest, NextResponse } from 'next/server';

const supabaseUrl = process.env.NEXT_PUBLIC_SUPABASE_URL!;
const serviceRoleKey = process.env.SUPABASE_SERVICE_ROLE_KEY!;

// Instanciamos el cliente admin SOLO con la service role key
// Este cliente tiene permisos de admin y NO afecta la sesión del usuario que hace la petición
const supabaseAdmin = createClient(supabaseUrl, serviceRoleKey, {
    auth: {
        autoRefreshToken: false,
        persistSession: false,
    },
});

export async function POST(req: NextRequest) {
    try {
        if (!serviceRoleKey) {
            return NextResponse.json(
                { error: 'Configuración de servidor incompleta: falta SERVICE_ROLE_KEY' },
                { status: 500 }
            );
        }

        const body = await req.json();
        const { email, password, nombreCompleto, rol, tallerId } = body;

        // Validaciones básicas
        if (!email || !password || !nombreCompleto || !tallerId || !rol) {
            return NextResponse.json(
                { error: 'Faltan campos obligatorios: email, password, nombre, rol, tallerId' },
                { status: 400 }
            );
        }

        if (password.length < 6) {
            return NextResponse.json(
                { error: 'La contraseña debe tener al menos 6 caracteres' },
                { status: 400 }
            );
        }

        const rolesValidos = ['mecanico', 'taller_admin', 'superadmin'];
        if (!rolesValidos.includes(rol)) {
            return NextResponse.json(
                { error: `Rol inválido: ${rol}` },
                { status: 400 }
            );
        }

        // PASO A: Crear el usuario en el sistema de Auth de Supabase
        // Usamos admin.createUser para que NO se interrumpa la sesión del Admin actual
        const { data: authData, error: authError } = await supabaseAdmin.auth.admin.createUser({
            email,
            password,
            email_confirm: true, // El usuario queda confirmado sin necesidad de verificación por email
            user_metadata: {
                nombre_completo: nombreCompleto,
                rol,
                activo: true,
            },
        });

        if (authError) {
            // Manejo amigable de errores comunes de Supabase Auth
            if (authError.message.toLowerCase().includes('already registered') ||
                authError.message.toLowerCase().includes('already been registered') ||
                authError.message.toLowerCase().includes('email address is already')) {
                return NextResponse.json(
                    { error: 'Este correo electrónico ya está registrado en el sistema.' },
                    { status: 400 }
                );
            }
            return NextResponse.json(
                { error: `Error de autenticación: ${authError.message}` },
                { status: 400 }
            );
        }

        const userId = authData.user.id;

        // PASO B: Verificar si el trigger de Supabase ya creó el perfil o si hay que crearlo manualmente
        const { data: perfilExistente } = await supabaseAdmin
            .from('perfiles')
            .select('id')
            .eq('id', userId)
            .maybeSingle();

        if (perfilExistente) {
            // El trigger de DB ya creó el perfil → solo actualizamos los campos necesarios
            const { error: updError } = await supabaseAdmin
                .from('perfiles')
                .update({
                    nombre_completo: nombreCompleto,
                    rol,
                    taller_id: tallerId,
                    activo: true,
                })
                .eq('id', userId);

            if (updError) {
                return NextResponse.json(
                    { error: `Error al actualizar perfil: ${updError.message}` },
                    { status: 500 }
                );
            }
        } else {
            // No hay trigger → insertamos el perfil manualmente
            const { error: insError } = await supabaseAdmin.from('perfiles').insert({
                id: userId,
                email,
                nombre_completo: nombreCompleto,
                rol,
                taller_id: tallerId,
                activo: true,
            });

            if (insError) {
                // Si el perfil falló, intentamos hacer rollback del usuario de auth
                await supabaseAdmin.auth.admin.deleteUser(userId).catch(() => { });
                return NextResponse.json(
                    { error: `Error al crear perfil: ${insError.message}` },
                    { status: 500 }
                );
            }
        }

        return NextResponse.json(
            {
                success: true,
                message: `Usuario ${nombreCompleto} creado correctamente.`,
                userId,
            },
            { status: 201 }
        );
    } catch (e: any) {
        console.error('[API /usuarios/crear] Error inesperado:', e);
        return NextResponse.json(
            { error: e.message || 'Error interno del servidor' },
            { status: 500 }
        );
    }
}
