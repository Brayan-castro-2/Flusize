import { NextRequest, NextResponse } from 'next/server'
import { createClient } from '@supabase/supabase-js'

const supabaseUrl = process.env.NEXT_PUBLIC_SUPABASE_URL!
const supabaseServiceKey = process.env.SUPABASE_SERVICE_ROLE_KEY || process.env.NEXT_PUBLIC_SUPABASE_ANON_KEY!

export async function POST(request: NextRequest) {
    try {
        const { email, password } = await request.json()

        console.log('🔐 Intentando login para:', email)

        // Crear cliente de Supabase con service role para bypass RLS
        const supabase = createClient(supabaseUrl, supabaseServiceKey)

        // 1. Autenticar con Supabase
        const { data: authData, error: authError } = await supabase.auth.signInWithPassword({
            email,
            password
        })

        if (authError) {
            console.error('❌ Error de autenticación:', authError.message)
            return NextResponse.json(
                { error: 'Credenciales incorrectas' },
                { status: 401 }
            )
        }

        console.log('✅ Autenticación exitosa para:', authData.user.email)

        // 2. Obtener perfil del usuario (sin RLS)
        const { data: perfil, error: perfilError } = await supabase
            .from('perfiles')
            .select('*')
            .eq('id', authData.user.id)
            .single()

        if (perfilError || !perfil) {
            console.error('❌ Error al obtener perfil:', perfilError?.message)
            return NextResponse.json(
                { error: 'Usuario sin perfil configurado' },
                { status: 404 }
            )
        }

        console.log('✅ Perfil encontrado:', perfil.email, '- Rol:', perfil.rol)

        // 3. Verificar que tenga taller asignado
        if (!perfil.taller_id) {
            console.error('❌ Usuario sin taller asignado')
            return NextResponse.json(
                { error: 'Usuario sin taller asignado. Contacta al administrador.' },
                { status: 403 }
            )
        }

        console.log('✅ Login completo exitoso')

        // 4. Retornar datos del usuario
        return NextResponse.json({
            success: true,
            user: authData.user,
            perfil: perfil,
            session: authData.session
        })

    } catch (error) {
        console.error('❌ Error en login:', error)
        return NextResponse.json(
            { error: 'Error interno del servidor' },
            { status: 500 }
        )
    }
}


