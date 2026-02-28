// Servicios de Supabase para operaciones de base de datos
import { supabase, VehiculoDB, OrdenDB, PerfilDB, CitaDB, ClienteDB, ServicioDB, ClienteWithStats } from './supabase';
import { createClient } from '@supabase/supabase-js';
import { getCurrentUserTallerId } from './auth-helpers';

// ============ VEHÍCULOS ============

// Buscar vehículo por patente (la función "mágica") - MULTI-TENANT
export async function buscarVehiculoPorPatente(patente: string, tallerIdOverride?: string): Promise<VehiculoDB | null> {
    const tallerId = tallerIdOverride || await getCurrentUserTallerId();
    if (!tallerId) {
        console.error('❌ Usuario sin taller asignado');
        return null;
    }

    const patenteNormalizada = patente.toUpperCase().replace(/[^A-Z0-9]/g, '');

    // Estrategia: Buscar Local PRIMERO (Lectura Legacy)
    // Si quisiéramos migrar lectura, buscaríamos en Global y luego enriqueceríamos con Local (cliente_id).
    // Por ahora, mantenemos Lectura Local para no romper UI.

    const { data, error } = await supabase
        .from('vehiculos')
        .select(`
            *,
            anio: ano,
            clientes (*)
        `)
        .eq('patente', patenteNormalizada)
        .eq('taller_id', tallerId)
        .maybeSingle();

    if (error || !data) {
        console.log('Vehículo no encontrado (Local):', error?.message);
        return null;
    }

    return data;
}

// INTERNAL HELPER: Ensure Hub (Global) Vehicle Exists (Spanish Schema)
// Returns the Global ID
async function _ensureGlobalVehicle(vehiculo: Partial<VehiculoDB>): Promise<string | null> {
    const patenteUpper = vehiculo.patente?.toUpperCase().replace(/[^A-Z0-9]/g, '') || '';
    if (!patenteUpper) return null;

    console.log('🌍 Checking Global Vehicle (vehiculos_globales):', patenteUpper);

    // 1. Check existence
    const { data: existing, error: findError } = await supabase
        .from('vehiculos_globales')
        .select('id')
        .eq('patente', patenteUpper)
        .maybeSingle();

    if (existing) {
        console.log('🌍 Global Vehicle Found:', existing.id);
        return existing.id;
    }

    // 2. Create if not exists
    const anioInt = vehiculo.anio ? parseInt(vehiculo.anio.toString()) : null;

    // Map to Spanish Schema
    const payload = {
        patente: patenteUpper,
        marca: vehiculo.marca,
        modelo: vehiculo.modelo,
        anio: isNaN(anioInt!) ? null : anioInt,
        vin: vehiculo.vin,
        motor: vehiculo.motor,
        // tipo_combustible: vehiculo.fuel_type, // If we had it
        // datos_api: {},
        // color: Not in Global Schema V4 (Spanish)
    };

    const { data: newGlobal, error: createError } = await supabase
        .from('vehiculos_globales')
        .insert([payload])
        .select('id')
        .single();

    if (createError) {
        console.error('❌ Error creating Global Vehicle:', createError);
        return null;
    }

    console.log('🌍 Created Global Vehicle:', newGlobal.id);
    return newGlobal.id;
}

// Crear nuevo vehículo (o actualizar si ya existe) - MULTI-TENANT (HUB & SPOKE ADAPTED)
export async function crearVehiculo(vehiculo: Partial<VehiculoDB> & { cliente_rut?: string }, tallerIdOverride?: string): Promise<VehiculoDB | null> {
    const tallerId = tallerIdOverride || await getCurrentUserTallerId();
    if (!tallerId) {
        console.error('❌ Usuario sin taller asignado');
        return null;
    }

    const patenteUpper = vehiculo.patente?.toUpperCase() || '';
    console.log('🚗 Creating vehicle (Hub & Spoke Spanish):', vehiculo);

    // 1. Ensure Global Vehicle (Source of Truth)
    const globalId = await _ensureGlobalVehicle(vehiculo);
    if (!globalId) {
        console.warn('⚠️ Could not sync with vehiculos_globales. Proceeding with Local only (Legacy Risk).');
    }

    // 2. Validate cliente_id (Required for Local)
    let clienteId = vehiculo.cliente_id;

    if (!clienteId && vehiculo.cliente_rut) {
        const cliente = await buscarClientePorRut(vehiculo.cliente_rut);
        if (cliente) {
            clienteId = cliente.id;
            console.log('✅ Found client by RUT:', cliente.id);
        }
    }

    if (!clienteId) {
        console.error('❌ Error: cliente_id is required to create a local vehicle link');
        return null;
    }

    // 3. Sync to Local (Legacy Mirror)
    // Prepare payload with taller_id
    const vehiculoData = {
        patente: patenteUpper,
        marca: vehiculo.marca || 'Desconocida',
        modelo: vehiculo.modelo || 'Desconocido',
        ano: vehiculo.anio || new Date().getFullYear().toString(), // Legacy field 'ano' (string)
        motor: vehiculo.motor || null,
        color: vehiculo.color || '-',
        vehiculo_global_id: globalId || null, // Hub Link
        cliente_id: clienteId,
        taller_id: tallerId
    };

    console.log('📤 Sending to Supabase Local:', vehiculoData);

    const { data, error } = await supabase
        .from('vehiculos')
        .upsert([vehiculoData], {
            onConflict: 'patente',
            ignoreDuplicates: false
        })
        .select(`
            *,
            anio: ano
        `)
        .single();

    if (error) {
        console.error('❌ Error creating/updating local vehicle:', error);
        return null;
    }

    console.log('✅ Vehicle saved (Local Sync):', data);
    return data;
}



// Obtener todos los vehículos - MULTI-TENANT
export async function obtenerVehiculos(): Promise<VehiculoDB[]> {
    const tallerId = await getCurrentUserTallerId();
    if (!tallerId) return [];

    const { data, error } = await supabase
        .from('vehiculos')
        .select('*')
        .eq('taller_id', tallerId);

    if (error) {
        console.error('Error al obtener vehículos:', error);
        return [];
    }

    return data || [];
}

// ============ ALMACENAMIENTO ============

// Subir imagen al bucket
export async function subirImagen(file: File, carpeta: string = 'ordenes'): Promise<string | null> {
    try {
        const fileExt = file.name.split('.').pop();
        const fileName = `${Math.random().toString(36).substring(2, 15)}_${Date.now()}.${fileExt}`;
        const filePath = `${carpeta}/${fileName}`;

        const { error: uploadError } = await supabase.storage
            .from('imagenes')
            .upload(filePath, file);

        if (uploadError) {
            console.error('Error al subir imagen:', uploadError);
            return null;
        }

        const { data } = supabase.storage
            .from('imagenes')
            .getPublicUrl(filePath);

        return data.publicUrl;
    } catch (error) {
        console.error('Error en subida de imagen:', error);
        return null;
    }
}

// ============ ÓRDENES ============

// Obtener todas las órdenes
// ============ CLIENTES (CRM) ============ - MULTI-TENANT

export async function obtenerClientes(busqueda?: string): Promise<ClienteWithStats[]> {
    const tallerId = await getCurrentUserTallerId();
    if (!tallerId) return [];

    let query = supabase
        .from('clientes')
        .select(`
            *,
            vehiculos (
                patente,
                marca,
                modelo,
                ordenes (
                    id,
                    fecha_ingreso,
                    precio_total,
                    estado,
                    descripcion_ingreso,
                    patente_vehiculo
                )
            )
        `)
        .eq('taller_id', tallerId)
        .order('nombre_completo', { ascending: true });

    if (busqueda) {
        query = query.or(`nombre_completo.ilike.%${busqueda}%,rut_dni.ilike.%${busqueda}%,telefono.ilike.%${busqueda}%`);
    }

    const { data, error } = await query;

    if (error) {
        console.error('❌ Error al obtener clientes:', error);
        return [];
    }

    // Calcular estadísticas en el cliente (más eficiente que subqueries complejas en esta etapa)
    return (data || []).map((cliente: any) => {
        let totalOrdenes = 0;
        let totalGastado = 0;
        let ultimaVisitaStr: string | undefined;
        let ultimaVisitaTime = 0;

        if (cliente.vehiculos) {
            cliente.vehiculos.forEach((vehiculo: any) => {
                if (vehiculo.ordenes) {
                    vehiculo.ordenes.forEach((orden: any) => {
                        totalOrdenes++;
                        totalGastado += (orden.precio_total || 0);

                        // Encontrar la fecha más reciente
                        const fecha = new Date(orden.fecha_ingreso).getTime();
                        if (fecha > ultimaVisitaTime) {
                            ultimaVisitaTime = fecha;
                            ultimaVisitaStr = orden.fecha_ingreso;
                        }
                    });
                }
            });
        }

        return {
            ...cliente,
            total_ordenes: totalOrdenes,
            total_gastado: totalGastado,
            ultima_visita: ultimaVisitaStr
        };
    });
}

// Buscar cliente por Teléfono (Identificador Principal V3.1) - MULTI-TENANT
export async function buscarClientePorTelefono(telefono: string): Promise<ClienteDB | null> {
    const tallerId = await getCurrentUserTallerId();
    if (!tallerId) return null;

    const { data, error } = await supabase
        .from('clientes')
        .select('*')
        .eq('telefono', telefono)
        .eq('taller_id', tallerId)
        .maybeSingle();

    if (error) return null;
    return data;
}

// Buscar cliente por RUT - MULTI-TENANT
export async function buscarClientePorRut(rut: string): Promise<ClienteDB | null> {
    const tallerId = await getCurrentUserTallerId();
    if (!tallerId) return null;

    // Mantener por compatibilidad, pero ya no es el ID principal
    const { data, error } = await supabase
        .from('clientes')
        .select('*')
        .eq('rut_dni', rut)
        .eq('taller_id', tallerId)
        .maybeSingle();

    if (error) return null;
    return data;
}

// Crear cliente - MULTI-TENANT
export async function crearCliente(cliente: Omit<ClienteDB, 'id' | 'fecha_creacion' | 'taller_id'>): Promise<ClienteDB | null> {
    const tallerId = await getCurrentUserTallerId();
    if (!tallerId) {
        console.error('❌ Usuario sin taller asignado');
        return null;
    }

    const { data, error } = await supabase
        .from('clientes')
        .insert([{ ...cliente, taller_id: tallerId }])
        .select()
        .single();

    if (error) {
        console.error('❌ Error al crear cliente:', error);
        return null;
    }
    return data;
}



// ============ ÓRDENES ============

// Obtener todas las órdenes
// Obtener todas las órdenes (con paginación opcional) - MULTI-TENANT
// Obtener todas las órdenes (con paginación opcional) - MULTI-TENANT
export async function obtenerOrdenes(limit?: number, offset?: number): Promise<OrdenDB[]> {
    const tallerId = await getCurrentUserTallerId();
    if (!tallerId) return [];

    let query = supabase
        .from('ordenes')
        .select(`
            *,
            cliente:clientes (
                id,
                nombre_completo,
                telefono
            ),
            vehiculos:vehiculos!vehiculo_local_id (
                id,
                patente,
                marca,
                modelo,
                ano,
                color
            ),
            asignado:perfiles!ordenes_asignado_a_fkey (
                id,
                nombre_completo,
                email
            ),
            creado_por_perfil:perfiles!ordenes_creado_por_fkey (
                id,
                nombre_completo
            )
        `)
        .eq('taller_id', tallerId)
        .order('creado_en', { ascending: false });

    // Aplicar paginación si se proporciona
    if (limit !== undefined && offset !== undefined) {
        query = query.range(offset, offset + limit - 1);
    }

    const { data, error } = await query;

    if (error) {
        console.error('❌ Error al obtener órdenes:', error);
        return [];
    }

    return data || [];
}

// Obtener conteo total de órdenes
export async function obtenerOrdenesCount(): Promise<number> {
    const tallerId = await getCurrentUserTallerId();
    if (!tallerId) return 0;

    const { count, error } = await supabase
        .from('ordenes')
        .select('*', { count: 'exact', head: true })
        .eq('taller_id', tallerId);

    if (error) {
        console.error('❌ Error al obtener conteo:', error);
        return 0;
    }

    return count || 0;
}

// Obtener órdenes optimizadas para Dashboard (Light)
export async function obtenerOrdenesLight(mecanicoId?: string): Promise<OrdenDB[]> {
    let query = supabase
        .from('ordenes')
        .select(`
            id,
            fecha_ingreso,


            estado,
            precio_total,
            metodo_pago,
            creado_por,
            asignado_a,
            patente_vehiculo,
            vehiculo_local_id,
            vehiculo_global_id,
            descripcion_ingreso,
            fotos_urls,
            cliente:clientes (
                nombre_completo
            ),
            vehiculos:vehiculos!vehiculo_local_id (
                marca,
                modelo
            ),
            creado:perfiles!ordenes_creado_por_fkey (
                nombre_completo
            ),
            asignado:perfiles!ordenes_asignado_a_fkey (
                nombre_completo
            )
        `)
        .order('fecha_ingreso', { ascending: false });

    // Si es mecánico, filtrar solo sus órdenes asignadas
    if (mecanicoId) {
        query = query.eq('asignado_a', mecanicoId);
    }

    const { data, error } = await query;

    if (error) {
        console.error('❌ Error al obtener órdenes light:', error);
        return [];
    }

    // Cast seguro ya que devolvemos un subset compatible
    return (data as any[]) || [];
}

// Obtener órdenes del día
export async function obtenerOrdenesHoy(): Promise<OrdenDB[]> {
    const hoy = new Date();
    hoy.setHours(0, 0, 0, 0);

    const { data, error } = await supabase
        .from('ordenes')
        .select(`
            *,
            *,
            vehiculos (
                *,
                clientes (*)
            )
        `)
        .gte('fecha_ingreso', hoy.toISOString())
        .order('fecha_ingreso', { ascending: false });

    if (error) {
        console.error('Error al obtener órdenes de hoy:', error);
        return [];
    }

    return data || [];
}

// Obtener orden por ID
export async function obtenerOrdenPorId(id: string): Promise<OrdenDB | null> {
    console.log('🔍 [SupabaseService] Obteniendo orden por ID:', id);

    // Query simplificada pero efectiva
    const { data, error } = await supabase
        .from('ordenes')
        .select(`
            *,
            vehiculos:vehiculos!vehiculo_local_id (
                id,
                marca,
                modelo,
                patente,
                ano,
                color,
                motor,
                clientes (*)
            ),
            asignado:perfiles!asignado_a (
                id,
                nombre_completo,
                rol
            ),
            creado:perfiles!creado_por (
                id,
                nombre_completo,
                rol
            )
        `)
        .eq('id', id)
        .single();

    if (error) {
        console.warn('⚠️ Error en consulta principal de orden (400?), intentando fallback simple...');

        // Fallback ultra-básico para asegurar que al menos la orden se cargue
        const { data: fallbackData, error: fallbackError } = await supabase
            .from('ordenes')
            .select('*')
            .eq('id', id)
            .single();

        if (fallbackError) {
            console.error('❌ Error fatal al obtener orden (Fallback falló):', fallbackError);
            return null;
        }

        console.log('✅ Orden recuperada vía fallback (sin relaciones)');
        return fallbackData;
    }

    return data;
}

// Crear nueva orden (Lógica V3 Inteligente) - MULTI-TENANT
export async function crearOrden(orden: {
    patente_vehiculo: string;
    descripcion_ingreso: string;
    creado_por: string;
    estado?: any;
    fotos?: string[];
    // Datos Legacy / Simplificados del Formulario
    cliente_nombre?: string;
    cliente_telefono?: string;
    cliente_email?: string;
    cliente_rut?: string;

    // Datos del Vehículo (para creación automática)
    vehiculo_marca?: string;
    vehiculo_modelo?: string;
    vehiculo_anio?: string;
    vehiculo_motor?: string;
    vehiculo_color?: string;

    precio_total?: number;
    metodo_pago?: string;
    asignado_a?: string;
    detalles_vehiculo?: string;
    detalle_trabajos?: string;
}): Promise<OrdenDB | null> {
    const tallerId = await getCurrentUserTallerId();
    if (!tallerId) {
        console.error('❌ Usuario sin taller asignado');
        return null;
    }

    const patenteNormalizada = orden.patente_vehiculo.toUpperCase().replace(/[^A-Z0-9]/g, '');

    // 1. Verificar Vehículo y Dueño (filtrado por taller)
    let { data: vehiculo } = await supabase
        .from('vehiculos')
        .select('*, clientes(*)')
        .eq('patente', patenteNormalizada)
        .eq('taller_id', tallerId)
        .maybeSingle();

    // 2. Si no existe el vehículo, necesitamos un Cliente para crearlo
    let clienteId: string | undefined;

    if (!vehiculo) {
        console.log(`🚗 Vehículo nuevo detectado: ${patenteNormalizada}`);

        // PRIORIDAD 1: Buscar por Teléfono (ID Principal)
        if (orden.cliente_telefono) {
            const clienteExistente = await buscarClientePorTelefono(orden.cliente_telefono);
            if (clienteExistente) {
                console.log('✅ Cliente encontrado por teléfono:', clienteExistente.nombre_completo);
                clienteId = clienteExistente.id;
            }
        }

        // PRIORIDAD 2: Buscar por RUT si no se encontró por teléfono
        if (!clienteId && orden.cliente_rut) {
            const clienteExistente = await buscarClientePorRut(orden.cliente_rut);
            if (clienteExistente) {
                console.log('✅ Cliente encontrado por RUT:', clienteExistente.nombre_completo);
                clienteId = clienteExistente.id;
            }
        }

        // Si no tenemos ID, creamos un cliente nuevo
        if (!clienteId && orden.cliente_nombre && orden.cliente_telefono) {
            console.log('👤 Creando cliente nuevo (V3.1 - Phone ID)...');
            const nuevoCliente = await crearCliente({
                nombre_completo: orden.cliente_nombre,
                telefono: orden.cliente_telefono, // OBLIGATORIO AHORA
                email: orden.cliente_email || null,
                tipo: 'persona',
                rut_dni: orden.cliente_rut || null
            });
            if (nuevoCliente) clienteId = nuevoCliente.id;
        }

        // Si falló todo y es urgente
        if (!clienteId) {
            console.error('❌ No se pudo crear/encontrar cliente. Se requiere Nombre y Teléfono obligatorios.');
            return null;
        }

        if (clienteId) {
            // Crear el vehículo vinculado al cliente (con taller_id)
            const { data: nuevoVehiculo, error: vError } = await supabase
                .from('vehiculos')
                .insert([{
                    patente: patenteNormalizada,
                    marca: orden.vehiculo_marca || 'Por definir',
                    modelo: orden.vehiculo_modelo || 'Por definir',
                    ano: orden.vehiculo_anio || new Date().getFullYear().toString(), // Map 'anio' -> 'ano'
                    motor: orden.vehiculo_motor || null,
                    color: orden.vehiculo_color || '-',
                    cliente_id: clienteId,
                    taller_id: tallerId
                }])
                .select(`*, anio:ano`) // Alias for frontend consistency
                .single();

            if (vError) {
                console.error('❌ Error creando vehículo:', vError);
                return null;
            }
            vehiculo = nuevoVehiculo;
        }
    }

    // 3. Crear la Orden (con taller_id y access_token)
    const { generateAccessToken, generatePublicOrderLink } = await import('./token-utils');
    const accessToken = generateAccessToken();

    // HUB & SPOKE: Ensure Global Vehicle Link
    let globalVehicleId: string | null = null;
    try {
        globalVehicleId = await _ensureGlobalVehicle({
            patente: orden.patente_vehiculo,
            marca: orden.vehiculo_marca,
            modelo: orden.vehiculo_modelo,
            anio: orden.vehiculo_anio,
            motor: orden.vehiculo_motor,
            color: orden.vehiculo_color
        });
    } catch (gErr) {
        console.error('⚠️ Failed to link Global Vehicle:', gErr);
    }

    const { data, error } = await supabase
        .from('ordenes')
        .insert([{
            patente_vehiculo: patenteNormalizada,
            vehiculo_global_id: globalVehicleId,
            vehiculo_local_id: vehiculo?.id || null, // Spoke Link
            descripcion_ingreso: orden.descripcion_ingreso,
            creado_por: orden.creado_por,
            asignado_a: orden.asignado_a || orden.creado_por,
            estado: orden.estado || 'pendiente',
            fotos_urls: orden.fotos || [], // V3 usa fotos_urls
            precio_total: orden.precio_total || 0,
            metodo_pago: orden.metodo_pago,

            detalle_trabajos: orden.detalle_trabajos, // Mapeo Corregido a Schema V3
            taller_id: tallerId,
            cliente_id: vehiculo?.cliente_id || clienteId || null, // FIX: Link Order to Client
            numero_orden: `ORD-${Date.now().toString().slice(-6)}`, // GEN: Simple Auto-ID
            access_token: accessToken,
            token_created_at: new Date().toISOString()
        }])
        .select()
        .single();

    if (error) {
        console.error('❌ Error al crear orden:', error);
        return null;
    }

    console.log('✅ Orden V3 creada exitosamente:', data.id);

    // 4. Enviar notificación por email (si el cliente tiene email)
    if (orden.cliente_email && data.id) {
        const publicLink = generatePublicOrderLink(data.id, accessToken);
        console.log('📧 Enlace público generado:', publicLink);

        try {
            const { sendOrderCreatedNotification } = await import('./notification-service');
            await sendOrderCreatedNotification(
                data as any,
                {
                    email: orden.cliente_email,
                    telefono: orden.cliente_telefono
                },
                publicLink
            );
            console.log('✅ Notificación enviada al cliente');
        } catch (notifError) {
            console.error('⚠️ Error enviando notificación (no crítico):', notifError);
            // No fallar la creación de orden si falla el email
        }
    }

    return data;
}

// Actualizar orden
export async function actualizarOrden(
    id: string,
    updates: Partial<OrdenDB>
): Promise<OrdenDB | null> {
    console.log('🚀 [SupabaseService] Enviando actualización para orden:', id);

    // Lista Blanca de columnas reales en la tabla 'ordenes' segun esquema Supabase
    const validColumns = [
        'numero_orden',
        'taller_id',
        'cliente_id',
        'patente_vehiculo',
        'vehiculo_local_id',
        'vehiculo_global_id',
        'estado',
        'fecha_ingreso',
        'fecha_estimada_salida',
        'fecha_salida',
        'descripcion_problema',
        'diagnostico',
        'trabajos_realizados',
        'descripcion_ingreso',
        'detalle_trabajos',
        'fotos_urls',
        'precio_total',
        'cotizacion_items',
        'subtotal',
        'iva',
        'metodo_pago',
        'metodos_pago',
        'asignado_a',
        'creado_por',
        'access_token',
        'token_created_at',
        'last_public_view',
        'actualizado_en',
        'updated_at'
    ];

    const datosParaActualizar: any = {};

    const updatesAny = updates as any;

    // Solo permitir columnas válidas que no sean undefined
    Object.keys(updates).forEach(key => {
        if (validColumns.includes(key) && updatesAny[key] !== undefined) {
            datosParaActualizar[key] = updatesAny[key];
        }
    });

    // Forzar actualizado_en si existe en el esquema para tracking manual
    datosParaActualizar.actualizado_en = new Date().toISOString();

    console.log('🐞 [DEBUG] actualizarOrden Payload final (Whitelisted):', JSON.stringify(datosParaActualizar));

    const { data, error } = await supabase
        .from('ordenes')
        .update(datosParaActualizar)
        .eq('id', id)
        .select()
        .single();

    if (error) {
        console.error('❌ Error al actualizar orden en Supabase:', error);
        return null;
    }

    return data;
}

// Eliminar orden
// Eliminar orden
export async function eliminarOrden(id: string): Promise<boolean> {
    console.log(`🗑️ Eliminando orden ${id} de Supabase`);

    const { error } = await supabase
        .from('ordenes')
        .delete()
        .eq('id', id);

    if (error) {
        console.error('❌ Error al eliminar orden:', error);
        return false;
    }

    console.log('✅ Orden eliminada de Supabase');
    return true;
}

// ============ PERFILES/USUARIOS ============

// Obtener todos los perfiles
export async function obtenerPerfiles(): Promise<PerfilDB[]> {
    const { data, error } = await supabase
        .from('perfiles')
        .select('*');

    if (error) {
        console.error('Error al obtener perfiles:', error);
        return [];
    }

    return data || [];
}

// Obtener perfil por ID
export async function obtenerPerfilPorId(id: string): Promise<PerfilDB | null> {
    console.log('🔍 Buscando perfil con ID:', id);

    const { data, error } = await supabase
        .from('perfiles')
        .select('*')
        .eq('id', id)
        .single();

    if (error) {
        console.error('❌ Error al obtener perfil:', error);
        console.error('❌ ID buscado:', id);
        return null;
    }

    console.log('✅ Perfil encontrado:', data);
    return data;
}

export async function actualizarCliente(id: string, updates: Partial<ClienteDB>): Promise<ClienteDB | null> {
    const { data, error } = await supabase
        .from('clientes')
        .update(updates)
        .eq('id', id)
        .select()
        .single();

    if (error) {
        console.error('Error al actualizar cliente:', error);
        return null;
    }

    return data;
}

// Actualizar perfil
export async function actualizarPerfil(
    id: string,
    updates: Partial<Omit<PerfilDB, 'id'>>
): Promise<PerfilDB | null> {
    console.log(`🔵 Actualizando perfil ${id} en Supabase:`, updates);

    const { data, error } = await supabase
        .from('perfiles')
        .update(updates)
        .eq('id', id)
        .select()
        .single();

    if (error) {
        console.error('❌ Error al actualizar perfil:', error);
        return null;
    }

    console.log('✅ Perfil actualizado en Supabase:', data);
    return data;
}

// Obtener órdenes de un usuario
export async function obtenerOrdenesPorUsuario(userId: string): Promise<{
    creadas: OrdenDB[];
    asignadas: OrdenDB[];
}> {
    const [creadasRes, asignadasRes] = await Promise.all([
        supabase.from('ordenes').select('*').eq('creado_por', userId),
        supabase.from('ordenes').select('*').eq('asignado_a', userId),
    ]);

    return {
        creadas: creadasRes.data || [],
        asignadas: asignadasRes.data || [],
    };
}

// ============ AUTENTICACIÓN ============

// Login con email/password
export async function loginConCredenciales(email: string, password: string): Promise<{
    user: { id: string; email: string } | null;
    perfil: PerfilDB | null;
    error: string | null;
}> {
    const { data, error } = await supabase.auth.signInWithPassword({
        email,
        password,
    });

    if (error || !data.user) {
        return { user: null, perfil: null, error: error?.message || 'Error de autenticación' };
    }

    // Obtener el perfil del usuario
    const perfil = await obtenerPerfilPorId(data.user.id);

    if (!perfil) {
        return { user: null, perfil: null, error: 'Perfil no encontrado' };
    }

    if (!perfil.activo) {
        await supabase.auth.signOut();
        return { user: null, perfil: null, error: 'Usuario desactivado' };
    }

    return {
        user: { id: data.user.id, email: data.user.email! },
        perfil,
        error: null,
    };
}

// Logout
export async function logout(): Promise<void> {
    await supabase.auth.signOut();
}

// Obtener sesión actual
export async function obtenerSesionActual(): Promise<{
    user: { id: string; email: string } | null;
    perfil: PerfilDB | null;
}> {
    const { data: { session } } = await supabase.auth.getSession();

    if (!session?.user) {
        return { user: null, perfil: null };
    }

    const perfil = await obtenerPerfilPorId(session.user.id);

    return {
        user: { id: session.user.id, email: session.user.email! },
        perfil,
    };
}

// Crear nuevo usuario
export async function crearUsuario(
    email: string,
    password: string,
    nombreCompleto: string,
    rol: 'taller_admin' | 'superadmin' | 'mecanico'
): Promise<{ success: boolean; error?: string; user?: PerfilDB }> {
    try {
        // 1. Crear usuario en Auth
        const { data: authData, error: authError } = await supabase.auth.signUp({
            email,
            password,
            options: {
                emailRedirectTo: undefined,
                data: {
                    nombre_completo: nombreCompleto,
                    rol: rol,
                    activo: true,
                },
            },
        });

        if (authError) {
            return { success: false, error: authError.message };
        }

        if (authData.user) {
            // 2. Crear perfil (Trigger should handle this, but explicit ensure)
            // NOTA: El taller_id debe ser asignado después de crear el usuario
            // por un admin, ya que el usuario nuevo no tiene contexto de taller aún
            return {
                success: true,
                // No retornamos el perfil completo porque falta taller_id
                // El admin debe asignarlo después
            };
        }

        return { success: false, error: 'No se pudo crear el usuario' };
    } catch (error) {
        console.error('Error al crear usuario:', error);
        return { success: false, error: 'Error interno del servidor' };
    }
}





// ============ CITAS/AGENDAMIENTO ============

export async function obtenerCitas(): Promise<CitaDB[]> {
    const tallerId = await getCurrentUserTallerId();
    if (!tallerId) return [];

    const { data, error } = await supabase
        .from('citas')
        .select('*')
        .eq('taller_id', tallerId)
        .order('fecha_hora', { ascending: true });

    if (error) {
        console.error('Error al obtener citas:', error);
        return [];
    }

    return (data || []).map(row => {
        const partes = (row.motivo || '').split(' - ');
        return {
            ...row,
            fecha_inicio: row.fecha_hora,
            fecha: row.fecha_hora,
            titulo: partes[0] || 'Cita',
            servicio_solicitado: partes.slice(1).join(' - ') || '',
        };
    }) as any;
}

// Obtener citas de hoy (con datos de cliente)
export async function obtenerCitasHoy(): Promise<CitaDB[]> {
    const tallerId = await getCurrentUserTallerId();
    if (!tallerId) return [];

    const today = new Date();
    today.setHours(0, 0, 0, 0);
    const tomorrow = new Date(today);
    tomorrow.setDate(tomorrow.getDate() + 1);

    const { data, error } = await supabase
        .from('citas')
        .select('*')
        .eq('taller_id', tallerId)
        .gte('fecha_hora', today.toISOString())
        .lt('fecha_hora', tomorrow.toISOString())
        .order('fecha_hora', { ascending: true });

    if (error) {
        console.error('❌ Error al obtener citas de hoy:', error);
        return [];
    }

    return (data || []).map(row => {
        const partes = (row.motivo || '').split(' - ');
        return {
            ...row,
            fecha_inicio: row.fecha_hora,
            fecha: row.fecha_hora,
            titulo: partes[0] || 'Cita',
            servicio_solicitado: partes.slice(1).join(' - ') || '',
        };
    }) as any;
}

// Obtener servicios frecuentes (V3.1)
export async function obtenerServiciosFrecuentes(): Promise<ServicioDB[]> {
    const { data, error } = await supabase
        .from('servicios_frecuentes')
        .select('*')
        .eq('activo', true)
        .order('descripcion', { ascending: true });

    if (error) {
        console.error('Error al obtener servicios frecuentes:', error);
        return [];
    }

    return data || [];
}

export async function obtenerCitasSemana(startDate: Date, endDate: Date): Promise<CitaDB[]> {
    const tallerId = await getCurrentUserTallerId();
    if (!tallerId) return [];

    const { data, error } = await supabase
        .from('citas')
        .select('*')
        .eq('taller_id', tallerId)
        .gte('fecha_hora', startDate.toISOString())
        .lte('fecha_hora', endDate.toISOString())
        .order('fecha_hora', { ascending: true });

    if (error) {
        console.error('Error al obtener citas de la semana:', error);
        return [];
    }

    return (data || []).map(row => {
        const partes = (row.motivo || '').split(' - ');
        return {
            ...row,
            fecha_inicio: row.fecha_hora,
            fecha: row.fecha_hora,
            titulo: partes[0] || 'Cita',
            servicio_solicitado: partes.slice(1).join(' - ') || '',
        };
    }) as any;
}

export async function crearCita(cita: any): Promise<CitaDB | null> {
    const tallerId = await getCurrentUserTallerId();
    if (!tallerId) return null;

    console.log('📅 Creando cita (V4 Full Mapping)...', cita);

    let clienteId = cita.cliente_id;
    const patenteNormalizada = cita.patente_vehiculo
        ? cita.patente_vehiculo.toUpperCase().replace(/[^A-Z0-9]/g, '')
        : null;

    // 1. Buscar/Crear Cliente si no viene ID
    if (!clienteId && cita.cliente_telefono) {
        const telefonoLimpio = cita.cliente_telefono.replace(/\D/g, '');
        const telefono = telefonoLimpio.length > 0
            ? `+569${telefonoLimpio.slice(-8)}`
            : '';

        if (telefono) {
            try {
                const existe = await buscarClientePorTelefono(telefono);
                if (existe) {
                    clienteId = existe.id;
                } else if (cita.cliente_nombre) {
                    const nuevo = await crearCliente({
                        nombre_completo: cita.cliente_nombre,
                        telefono: telefono,
                        tipo: 'persona',
                        taller_id: tallerId
                    } as any);
                    if (nuevo) clienteId = nuevo.id;
                }
            } catch (e) {
                console.warn('⚠️ No se pudo crear/buscar cliente:', e);
            }
        }
    }

    // 2. Construir Payload completo mapeando todos los campos del modal
    const dbPayload: Record<string, any> = {
        taller_id: tallerId,
        estado: cita.estado || 'pendiente',
    };

    // Campos de fecha (múltiples formatos soportados)
    if (cita.fecha_inicio) dbPayload.fecha_inicio = cita.fecha_inicio;
    if (cita.fecha_fin) dbPayload.fecha_fin = cita.fecha_fin;
    if (cita.fecha) dbPayload.fecha = cita.fecha;
    // fecha_hora = alias de fecha_inicio para compatibilidad
    dbPayload.fecha_hora = cita.fecha_hora || cita.fecha_inicio || cita.fecha || null;

    // Campos del cliente / vehículo
    if (patenteNormalizada) dbPayload.patente_vehiculo = patenteNormalizada;
    if (cita.cliente_nombre) dbPayload.cliente_nombre = cita.cliente_nombre;
    if (cita.cliente_telefono) dbPayload.cliente_telefono = cita.cliente_telefono;
    if (clienteId) dbPayload.cliente_id = clienteId;

    // Campos descriptivos
    if (cita.titulo) dbPayload.titulo = cita.titulo;
    if (cita.motivo) dbPayload.motivo = cita.motivo || cita.titulo;
    if (cita.servicio_solicitado) dbPayload.servicio_solicitado = cita.servicio_solicitado;
    if (cita.notas) dbPayload.notas = cita.notas;
    if (cita.creado_por) dbPayload.creado_por = cita.creado_por;

    console.log('📤 Payload cita a insertar:', dbPayload);

    const { data, error } = await supabase
        .from('citas')
        .insert([dbPayload])
        .select()
        .single();

    if (error) {
        console.error('❌ Error al crear cita:', error);
        return null;
    }

    console.log('✅ Cita creada correctamente:', data.id);
    return data;
}


export async function actualizarCita(id: string, updates: any): Promise<CitaDB | null> {
    const dbPayload: any = {};

    // Map fields (Legacy -> V3)
    if (updates.fecha_hora !== undefined || updates.fecha_inicio !== undefined) {
        dbPayload.fecha_hora = updates.fecha_hora || updates.fecha_inicio;
    }
    if (updates.motivo !== undefined || updates.titulo !== undefined) {
        dbPayload.motivo = updates.motivo || updates.titulo;
    }
    if (updates.estado !== undefined) dbPayload.estado = updates.estado;
    if (updates.patente_vehiculo !== undefined) dbPayload.patente_vehiculo = updates.patente_vehiculo;
    if (updates.notas !== undefined) dbPayload.notas = updates.notas;

    if (Object.keys(dbPayload).length === 0) return null;

    const { data, error } = await supabase
        .from('citas')
        .update(dbPayload)
        .eq('id', id)
        .select()
        .single();

    if (error) {
        console.error('Error al actualizar cita:', error);
        return null;
    }

    return data;
}

export async function eliminarCita(id: string): Promise<boolean> {
    const { error } = await supabase
        .from('citas')
        .delete()
        .eq('id', id);

    if (error) {
        console.error('Error al eliminar cita:', error);
        return false;
    }

    return true;
}



// Confirmar revisión de ingreso (Mecánico)
// Confirmar revisión de ingreso (Mecánico) - AHORA checklist de salida
export async function confirmarRevisionIngreso(
    checklistId: number | string,
    datosSalida?: {
        detalles_salida: any,
        fotos_salida: any,
        confirmado_por: string
    }
): Promise<boolean> {
    const updates: any = {
        revisado_por_mecanico_at: new Date().toISOString() // Mantener legacy por si acaso
    };

    // Si vienen datos de salida (Nuevo flujo)
    if (datosSalida) {
        updates.detalles_salida = datosSalida.detalles_salida;
        updates.fotos_salida = datosSalida.fotos_salida;
        updates.confirmado_salida_en = new Date().toISOString();
        updates.confirmado_salida_por = datosSalida.confirmado_por;
    }

    // 1. Update Checklist
    const { data: checklistData, error } = await supabase
        .from('listas_chequeo')
        .update(updates)
        .eq('id', checklistId)
        .select('orden_id') // Fetch associated order_id
        .maybeSingle();

    if (error) {
        console.error('❌ Error al confirmar revisión/salida:', error);
        return false;
    }

    if (!checklistData) {
        console.error('❌ Error: No se encontró checklist con ID:', checklistId);
        return false;
    }

    // 2. Auto-Update Order Status
    if (checklistData && checklistData.orden_id) {
        let nuevoEstado = null;

        if (datosSalida) {
            nuevoEstado = 'entregada'; // Salida confirmed -> Delivered
        }

        // Only update if a new state is defined (e.g. Entregada)
        // For Ingreso confirmation, we WAIT for manual "Empezar Reparación"
        if (nuevoEstado) {
            console.log(`🔄 Actualizando estado de orden ${checklistData.orden_id} a: ${nuevoEstado}`);

            const { error: orderError } = await supabase
                .from('ordenes')
                .update({ estado: nuevoEstado, updated_at: new Date().toISOString() })
                .eq('id', checklistData.orden_id);

            if (orderError) {
                console.error('⚠️ Error al actualizar estado de orden automática:', orderError);
            }
        }
    }

    console.log('✅ Revisión/Salida confirmada');
    return true;
}

// ============ CHECKLISTS ============

export async function guardarChecklist(checklist: {
    orden_id: string;
    detalles: any; // Changed from items to match DB
    fotos: any;
    comentarios_generales?: string;
    fotos_extra?: string[] | { url: string; nota: string }[];
}): Promise<any> {
    const { data, error } = await supabase
        .from('listas_chequeo') // Changed table name
        .upsert([{
            orden_id: checklist.orden_id,
            // Merge extra fields into detalles JSON to avoid schema changes
            detalles: {
                ...checklist.detalles,
                comentarios_generales: checklist.comentarios_generales,
                fotos_extra: checklist.fotos_extra
            },
            fotos: checklist.fotos
        }], { onConflict: 'orden_id' })
        .select()
        .single();

    if (error) {
        console.error('❌ Error al guardar checklist:', error);
        throw error;
    }

    return data;
}

export async function obtenerChecklist(orderId: string): Promise<any> {
    const { data, error } = await supabase
        .from('listas_chequeo')
        .select('*')
        .eq('orden_id', orderId)
        .maybeSingle();

    if (error) {
        console.error('❌ Error al obtener checklist:', error);
        return null;
    }

    // Map back to expected structure if needed, or consume as is
    if (data) {
        return {
            ...data,
            items: data.detalles, // Compatible alias
            revisado_por_mecanico_at: data.revisado_por_mecanico_at
        };
    }

    return data;
}

// Helper specific to checklist photos
export async function subirImagenChecklist(file: File, ordenId: string, tipo: string): Promise<string | null> {
    try {
        const fileExt = file.name.split('.').pop();
        const timestamp = Date.now();
        // Path format: 
        // - Mandatory (checklist): {orden_id}/checklist/{tipo}_timestamp.jpg
        // - Extra (fotos): {orden_id}/fotos/{tipo}_timestamp.jpg
        const isExtra = tipo.startsWith('extra');
        const folder = isExtra ? 'fotos' : 'checklist';
        const filePath = `${ordenId}/${folder}/${tipo}_${timestamp}.${fileExt}`;

        const { error: uploadError } = await supabase.storage
            .from('ordenes-fotos') // Specific bucket
            .upload(filePath, file);

        if (uploadError) {
            console.error('Error al subir imagen checklist:', uploadError);
            return null;
        }

        const { data } = supabase.storage
            .from('ordenes-fotos')
            .getPublicUrl(filePath);

        return data.publicUrl;
    } catch (error) {
        console.error('Error en subida de imagen checklist:', error);
        return null;
    }
}

// =========== CREAR USUARIO SISTEMA (ADMIN) ===========
export async function crearUsuarioSistema(datos: { email: string, password: string, nombre: string, rol: 'mecanico' | 'taller_admin' | 'superadmin' }) {
    // 1. Crear usuario en Auth de Supabase
    console.log("Creando Auth User para:", datos.email);
    const { data: authData, error: authError } = await supabase.auth.signUp({
        email: datos.email,
        password: datos.password,
    });

    if (authError) {
        console.error("Error en Auth:", authError);
        throw authError;
    }

    const newUserId = authData.user?.id;
    if (!newUserId) throw new Error("No se obtuvo el ID del usuario creado.");

    console.log("Creando Perfil para UUID:", newUserId);
    // 2. Insertar el Perfil en la tabla 'perfiles' (vinculando el UUID)
    const { error: profileError } = await supabase
        .from('perfiles')
        .insert([{
            id: newUserId,
            email: datos.email,
            nombre_completo: datos.nombre,
            rol: datos.rol,
            activo: true
        }]);

    if (profileError) {
        console.error("Error al crear perfil:", profileError);
        throw profileError;
    }

    return authData.user;
}
