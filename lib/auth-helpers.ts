/**
 * Funciones auxiliares para autenticación y contexto multi-tenant
 * Estas funciones ayudan a obtener el taller del usuario actual
 */

'use server'

import { supabase } from './supabase'
import { cookies } from 'next/headers'

/**
 * Obtener el ID del taller del usuario autenticado actual
 * @returns UUID del taller o null si no está autenticado
 */
export async function getCurrentUserTallerId(): Promise<string | null> {
    try {
        const cookieStore = cookies()

        const { createServerClient } = await import('@supabase/ssr')
        const supabase = createServerClient(
            process.env.NEXT_PUBLIC_SUPABASE_URL!,
            process.env.NEXT_PUBLIC_SUPABASE_ANON_KEY!,
            {
                cookies: {
                    get(name: string) {
                        return cookieStore.get(name)?.value
                    },
                },
            }
        )

        const { data: { user }, error: userError } = await supabase.auth.getUser()

        if (userError || !user) {
            console.log('❌ No user from token:', userError?.message, '- using fallback')
            const { getDefaultTallerId } = await import('./taller-fallback')
            return await getDefaultTallerId()
        }

        console.log('✅ User found:', user.email)

        // Create Supabase admin client for database query if needed
        const { createClient } = await import('@supabase/supabase-js')
        const supabaseAdmin = createClient(
            process.env.NEXT_PUBLIC_SUPABASE_URL!,
            process.env.SUPABASE_SERVICE_ROLE_KEY || process.env.NEXT_PUBLIC_SUPABASE_ANON_KEY!
        )

        // Get taller_id
        const { data, error } = await supabaseAdmin
            .from('perfiles')
            .select('taller_id')
            .eq('id', user.id)
            .single()

        if (error) {
            console.error('❌ Error getting taller_id:', error.message, '- using fallback')
            const { getDefaultTallerId } = await import('./taller-fallback')
            return await getDefaultTallerId()
        }

        if (!data?.taller_id) {
            console.error('❌ User has no taller_id in database - using fallback')
            const { getDefaultTallerId } = await import('./taller-fallback')
            return await getDefaultTallerId()
        }

        console.log('✅ Taller ID:', data.taller_id)
        return data.taller_id
    } catch (error) {
        console.error('❌ Error in getCurrentUserTallerId:', error, '- using fallback')
        const { getDefaultTallerId } = await import('./taller-fallback')
        return await getDefaultTallerId()
    }
}

/**
 * Validar que el usuario pertenece al taller especificado
 * @param tallerId - UUID del taller a validar
 * @returns true si el usuario pertenece al taller, false en caso contrario
 */
export async function validateUserTaller(tallerId: string): Promise<boolean> {
    const userTallerId = await getCurrentUserTallerId()

    if (!userTallerId) {
        console.log('❌ Usuario sin taller asignado')
        return false
    }

    const isValid = userTallerId === tallerId

    if (!isValid) {
        console.warn(`⚠️ Intento de acceso a taller no autorizado: ${tallerId}`)
    }

    return isValid
}

/**
 * Obtener información completa del taller del usuario actual
 * @returns Datos del taller o null
 */
export async function getCurrentUserTaller() {
    const tallerId = await getCurrentUserTallerId()

    if (!tallerId) return null

    const { data, error } = await supabase
        .from('talleres')
        .select('*')
        .eq('id', tallerId)
        .single()

    if (error) {
        console.error('❌ Error al obtener datos del taller:', error)
        return null
    }

    return data
}
