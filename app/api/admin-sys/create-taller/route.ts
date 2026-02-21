import { NextRequest, NextResponse } from 'next/server';
import { createClient } from '@supabase/supabase-js';

// Usamos service role para poder crear usuarios y talleres sin restricciones
const supabaseAdmin = createClient(
    process.env.NEXT_PUBLIC_SUPABASE_URL!,
    process.env.SUPABASE_SERVICE_ROLE_KEY!,
    {
        auth: {
            autoRefreshToken: false,
            persistSession: false
        }
    }
);

function generateSlug(name: string) {
    return name
        .toLowerCase()
        .normalize('NFD') // Elimina acentos
        .replace(/[\u0300-\u036f]/g, '')
        .replace(/[^a-z0-9]+/g, '-')
        .replace(/(^-|-$)/g, '');
}

export async function POST(req: NextRequest) {
    try {
        const body = await req.json();
        const { nombre, direccion, emailAdmin } = body;

        // 1. Validaciones
        if (!nombre || !emailAdmin) {
            return NextResponse.json({ error: 'Nombre y email son requeridos' }, { status: 400 });
        }

        console.log(`🔨 Creando taller: ${nombre} para ${emailAdmin}`);

        // 2. Crear Taller en DB
        // Nota: La tabla talleres NO tiene slug, según aprendimos
        const { data: taller, error: tallerError } = await supabaseAdmin
            .from('talleres')
            .insert([{
                nombre,
                direccion: direccion || '',
                telefono: '', // Opcional
                email: emailAdmin, // Email de contacto del taller
                activo: true
            }])
            .select()
            .single();

        if (tallerError) {
            console.error('Error creando taller:', tallerError);
            throw new Error(`Error BD: ${tallerError.message}`);
        }

        console.log('✅ Taller creado:', taller.id);

        // 3. Crear Usuario en Auth de Supabase
        const tempPassword = 'Flusize2026!'; // Default temp password
        const { data: authUser, error: authError } = await supabaseAdmin.auth.admin.createUser({
            email: emailAdmin,
            password: tempPassword,
            email_confirm: true,
            user_metadata: {
                nombre_completo: 'Administrador ' + nombre
            }
        });

        if (authError) {
            // Si el usuario ya existe, intentamos buscarlo
            console.warn('Usuario auth ya existe o error:', authError.message);
            // TODO: Manejar lógica si usuario ya existe (quizás solo asignarle el taller)
            // Por ahora fallamos para mantenerlo simple en MVP
            if (!authError.message.includes('already registered')) {
                throw new Error(`Error Auth: ${authError.message}`);
            }
        }

        const userId = authUser.user?.id || (await supabaseAdmin.from('perfiles').select('id').eq('email', emailAdmin).single()).data?.id;

        if (!userId) {
            throw new Error('No se pudo obtener ID de usuario');
        }

        // 4. Crear/Actualizar Perfil (Vincular con Taller)
        // Upsert para manejar si ya existía
        const { error: perfilError } = await supabaseAdmin
            .from('perfiles')
            .upsert({
                id: userId,
                email: emailAdmin,
                nombre_completo: 'Admin ' + nombre,
                rol: 'admin',
                activo: true,
                taller_id: taller.id
            });

        if (perfilError) {
            console.error('Error en perfil:', perfilError);
            throw new Error(`Error Perfil: ${perfilError.message}`);
        }

        console.log('✅ Perfil vinculado exitosamente');

        return NextResponse.json({
            success: true,
            tallerId: taller.id,
            adminId: userId,
            password: tempPassword
        });

    } catch (error: any) {
        console.error('❌ Error general:', error);
        return NextResponse.json(
            { error: error.message || 'Error interno del servidor' },
            { status: 500 }
        );
    }
}
