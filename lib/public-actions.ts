/**
 * Server Actions PÚBLICAS (sin autenticación)
 * Para que los clientes puedan ver el estado de su auto
 */

'use server'

import { supabase } from './supabase'

// ============================================
// FUNCIONES PÚBLICAS (SIN AUTENTICACIÓN)
// ============================================

/**
 * Obtener taller por slug (público)
 * @param slug - Slug del taller (ej: "electromecanica-jr")
 * @returns Información pública del taller
 */
export async function getTallerBySlug(slug: string) {
    const { data, error } = await supabase
        .from('talleres')
        .select('id, nombre, logo_url, direccion, telefono, email, slug')
        .eq('slug', slug)
        .eq('activo', true)
        .single()

    if (error) {
        console.error('❌ Error al obtener taller por slug:', error)
        return null
    }

    return data
}

/**
 * Obtener orden pública (sin autenticación)
 * Para que el cliente vea el estado de su auto desde el enlace compartido
 * 
 * @param ordenId - ID de la orden
 * @param tallerSlug - Slug del taller (para validación)
 * @returns Información pública de la orden
 */
export async function getOrdenPublica(ordenId: number, tallerSlug: string) {
    // 1. Obtener el taller por slug
    const taller = await getTallerBySlug(tallerSlug)
    if (!taller) {
        console.error('❌ Taller no encontrado:', tallerSlug)
        return null
    }

    // 2. Obtener la orden (verificando que pertenezca al taller)
    const { data, error } = await supabase
        .from('ordenes')
        .select(`
            id,
            patente_vehiculo,
            descripcion_ingreso,
            estado,
            fecha_ingreso,
            fecha_entrega,
            fecha_lista,
            precio_total,
            fotos_urls,
            observaciones_mecanico,
            vehiculos (
                marca,
                modelo,
                anio,
                color,
                clientes (
                    nombre_completo,
                    telefono,
                    email
                )
            )
        `)
        .eq('id', ordenId)
        .eq('taller_id', taller.id)
        .single()

    if (error) {
        console.error('❌ Error al obtener orden pública:', error)
        return null
    }

    // 3. Retornar datos públicos (sin información sensible)
    return {
        orden: data,
        taller: taller
    }
}

/**
 * Generar enlace público para compartir con el cliente
 * @param ordenId - ID de la orden
 * @param tallerId - ID del taller
 * @returns URL pública para compartir
 */
export async function generarEnlaceOrden(ordenId: number, tallerId: string): Promise<string | null> {
    // 1. Obtener el slug del taller
    const { data: taller, error } = await supabase
        .from('talleres')
        .select('slug')
        .eq('id', tallerId)
        .single()

    if (error || !taller) {
        console.error('❌ Error al obtener slug del taller:', error)
        return null
    }

    // 2. Generar URL pública
    const baseUrl = process.env.NEXT_PUBLIC_APP_URL || 'http://localhost:3000'
    const enlace = `${baseUrl}/taller/${taller.slug}/orden/${ordenId}`

    console.log('✅ Enlace generado:', enlace)
    return enlace
}

/**
 * Obtener historial de órdenes de un cliente (por email o teléfono)
 * Para mostrar en la vista pública cuando el cliente se registra
 * 
 * @param email - Email del cliente
 * @param telefono - Teléfono del cliente
 * @returns Lista de órdenes del cliente en diferentes talleres
 */
export async function getHistorialCliente(email?: string, telefono?: string) {
    if (!email && !telefono) {
        return []
    }

    // Buscar cliente por email o teléfono
    let query = supabase
        .from('clientes')
        .select(`
            id,
            nombre_completo,
            telefono,
            email,
            taller_id,
            talleres (
                nombre,
                slug,
                logo_url
            ),
            vehiculos (
                patente,
                marca,
                modelo,
                ordenes (
                    id,
                    estado,
                    descripcion_ingreso,
                    fecha_ingreso,
                    precio_total
                )
            )
        `)

    if (email) {
        query = query.eq('email', email)
    } else if (telefono) {
        query = query.eq('telefono', telefono)
    }

    const { data, error } = await query

    if (error) {
        console.error('❌ Error al obtener historial del cliente:', error)
        return []
    }

    return data || []
}

/**
 * Verificar si un cliente ya tiene cuenta en Fluesize
 * @param email - Email del cliente
 * @returns true si ya tiene cuenta, false si no
 */
export async function clienteTieneCuenta(email: string): Promise<boolean> {
    // Verificar en auth.users de Supabase
    const { data, error } = await supabase.auth.admin.listUsers()

    if (error) {
        console.error('❌ Error al verificar cuenta:', error)
        return false
    }

    return data.users.some(user => user.email === email)
}
