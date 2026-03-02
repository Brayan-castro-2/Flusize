import { createClient } from '@supabase/supabase-js';
import { NextRequest, NextResponse } from 'next/server';

const supabaseUrl = process.env.NEXT_PUBLIC_SUPABASE_URL!;
const serviceRoleKey = process.env.SUPABASE_SERVICE_ROLE_KEY!;

const supabaseAdmin = createClient(supabaseUrl, serviceRoleKey, {
    auth: {
        autoRefreshToken: false,
        persistSession: false,
    },
});

export async function POST(req: NextRequest) {
    try {
        const { token, password } = await req.json();

        if (!token || !password) {
            return NextResponse.json({ error: 'Token y contraseña son obligatorios' }, { status: 400 });
        }

        // 1. Validar token
        const { data: tokenData, error: tokenError } = await supabaseAdmin
            .from('tokens_activacion')
            .select('*')
            .eq('token', token)
            .eq('usado', false)
            .single();

        if (tokenError || !tokenData) {
            return NextResponse.json({ error: 'Token inválido o ya utilizado' }, { status: 404 });
        }

        // Verificar expiración
        if (new Date(tokenData.expira_en) < new Date()) {
            return NextResponse.json({ error: 'El token ha expirado' }, { status: 410 });
        }

        // 2. Crear usuario en Auth
        const { data: authData, error: authError } = await supabaseAdmin.auth.admin.createUser({
            email: tokenData.email,
            password: password,
            email_confirm: true,
            user_metadata: {
                nombre_completo: tokenData.nombre_completo,
                rol: tokenData.rol,
                taller_id: tokenData.taller_id
            }
        });

        if (authError) {
            return NextResponse.json({ error: `Error al crear usuario: ${authError.message}` }, { status: 400 });
        }

        const userId = authData.user.id;

        // 3. Crear/Actualizar Perfil (El trigger suele hacerlo, pero aseguramos data extendida)
        const { error: perfilError } = await supabaseAdmin
            .from('perfiles')
            .upsert({
                id: userId,
                email: tokenData.email,
                nombre_completo: tokenData.nombre_completo,
                rol: tokenData.rol,
                taller_id: tokenData.taller_id,
                activo: true
            });

        if (perfilError) {
            // Rollback auth user
            await supabaseAdmin.auth.admin.deleteUser(userId);
            return NextResponse.json({ error: `Error al crear perfil: ${perfilError.message}` }, { status: 500 });
        }

        // 4. Marcar token como usado
        await supabaseAdmin
            .from('tokens_activacion')
            .update({ usado: true })
            .eq('id', tokenData.id);

        return NextResponse.json({
            success: true,
            message: 'Cuenta activada exitosamente',
            userId
        });

    } catch (error: any) {
        console.error('Error en activación:', error);
        return NextResponse.json({ error: 'Error interno del servidor' }, { status: 500 });
    }
}
