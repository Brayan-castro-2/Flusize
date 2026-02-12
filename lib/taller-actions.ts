/**
 * Server Actions para operaciones multi-tenant del taller
 * Estas son las "funciones mágicas" que Bastián consumirá desde el frontend
 */

'use server'

import { supabase, TallerDB, VehiculoDB, CitaDB } from './supabase'
import { getCurrentUserTallerId, validateUserTaller } from './auth-helpers'

// ============================================
// FUNCIONES PÚBLICAS PARA BASTIÁN (Frontend)
// ============================================

/**
 * Obtener información del taller por ID
 * @param id - UUID del taller
 * @returns Detalles del taller (nombre, logo, dirección, etc.)
 * 
 * Ejemplo de uso:
 * ```typescript
 * const taller = await getTallerInfo('uuid-del-taller')
 * console.log(taller.nombre) // "Electromecánica JR"
 * ```
 */
export async function getTallerInfo(id: string): Promise<TallerDB | null> {
    const { data, error } = await supabase
        .from('talleres')
        .select('*')
        .eq('id', id)
        .eq('activo', true)
        .single()

    if (error) {
        console.error('❌ Error al obtener info del taller:', error)
        return null
    }

    return data
}

/**
 * Obtener vehículo por patente (filtrado automáticamente por taller)
 * Esta función SOLO retorna vehículos del taller del usuario autenticado
 * 
 * @param patente - Número de patente (ej: "ABC123")
 * @returns Vehículo con info del cliente y órdenes, o null si no existe
 * 
 * Ejemplo de uso:
 * ```typescript
 * const auto = await getAutoByPatente('ABC123')
 * if (auto) {
 *   console.log(`Dueño: ${auto.clientes.nombre_completo}`)
 *   console.log(`Órdenes activas: ${auto.ordenes.length}`)
 * }
 * ```
 */
export async function getAutoByPatente(patente: string): Promise<any | null> {
    const tallerId = await getCurrentUserTallerId()

    if (!tallerId) {
        throw new Error('Usuario no asociado a un taller')
    }

    const patenteNormalizada = patente.toUpperCase().replace(/[^A-Z0-9]/g, '')

    const { data, error } = await supabase
        .from('vehiculos')
        .select(`
            *,
            clientes (*),
            ordenes (
                id,
                estado,
                descripcion_ingreso,
                fecha_ingreso,
                fecha_entrega,
                precio_total,
                metodo_pago
            )
        `)
        .eq('patente', patenteNormalizada)
        .eq('taller_id', tallerId) // ← Filtro automático por taller
        .maybeSingle()

    if (error) {
        console.error('❌ Error al buscar vehículo:', error)
        return null
    }

    if (!data) {
        console.log(`ℹ️ Vehículo ${patenteNormalizada} no encontrado en este taller`)
        return null
    }

    return data
}

/**
 * Crear cita para un cliente (con alcance de taller automático)
 * La cita se crea automáticamente asociada al taller del usuario autenticado
 * 
 * @param datos - Datos de la cita
 * @returns Cita creada o lanza error
 * 
 * Ejemplo de uso:
 * ```typescript
 * await createCita({
 *   titulo: 'Revisión técnica',
 *   fecha_inicio: '2026-02-15T10:00:00',
 *   fecha_fin: '2026-02-15T11:00:00',
 *   cliente_nombre: 'Juan Pérez',
 *   cliente_telefono: '+56912345678',
 *   patente_vehiculo: 'ABC123',
 *   notas: 'Cliente prefiere mañana'
 * })
 * ```
 */
export async function createCita(datos: {
    titulo: string
    fecha_inicio: string
    fecha_fin: string
    cliente_nombre?: string
    cliente_telefono?: string
    patente_vehiculo?: string
    notas?: string
}): Promise<CitaDB> {
    const tallerId = await getCurrentUserTallerId()

    if (!tallerId) {
        throw new Error('Usuario no asociado a un taller')
    }

    const { data, error } = await supabase
        .from('citas')
        .insert([{
            ...datos,
            taller_id: tallerId, // ← Auto-inyección del taller
            estado: 'pendiente'
        }])
        .select()
        .single()

    if (error) {
        console.error('❌ Error al crear cita:', error)
        throw new Error(`Error al crear cita: ${error.message}`)
    }

    console.log('✅ Cita creada exitosamente:', data.id)
    return data
}

// ============================================
// FUNCIONES ADICIONALES ÚTILES
// ============================================

/**
 * Obtener todas las órdenes activas de un vehículo
 * @param patente - Patente del vehículo
 * @returns Lista de órdenes activas (pendiente, en_progreso)
 */
export async function getOrdenesActivasByPatente(patente: string) {
    const tallerId = await getCurrentUserTallerId()

    if (!tallerId) return []

    const patenteNormalizada = patente.toUpperCase().replace(/[^A-Z0-9]/g, '')

    const { data, error } = await supabase
        .from('ordenes')
        .select('*')
        .eq('patente_vehiculo', patenteNormalizada)
        .eq('taller_id', tallerId)
        .in('estado', ['pendiente', 'en_progreso'])
        .order('fecha_ingreso', { ascending: false })

    if (error) {
        console.error('❌ Error al obtener órdenes activas:', error)
        return []
    }

    return data || []
}

/**
 * Buscar cliente por teléfono (filtrado por taller)
 * @param telefono - Número de teléfono
 * @returns Cliente o null
 */
export async function buscarClientePorTelefono(telefono: string) {
    const tallerId = await getCurrentUserTallerId()

    if (!tallerId) return null

    const { data, error } = await supabase
        .from('clientes')
        .select('*')
        .eq('telefono', telefono)
        .eq('taller_id', tallerId)
        .maybeSingle()

    if (error) {
        console.error('❌ Error al buscar cliente:', error)
        return null
    }

    return data
}
