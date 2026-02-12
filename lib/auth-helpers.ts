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
    const { data: { session } } = await supabase.auth.getSession()

    if (!session?.user) {
        console.log('❌ No hay sesión activa')
        return null
    }

    const { data, error } = await supabase
        .from('perfiles')
        .select('taller_id')
        .eq('id', session.user.id)
        .single()

    if (error) {
        console.error('❌ Error al obtener taller_id del usuario:', error)
        return null
    }

    return data?.taller_id || null
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
