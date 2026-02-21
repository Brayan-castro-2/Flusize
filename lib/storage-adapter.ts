// Adaptador que detecta automáticamente si usar localStorage o Supabase
import * as localService from './local-storage-service';
import * as supabaseService from './supabase-service';
import type { OrdenDB, VehiculoDB, PerfilDB, CitaDB } from './local-storage-service';
import type { ServicioDB, ClienteDB, ClienteWithStats } from './supabase';

// Detect storage mode
const getStorageMode = (): 'local' | 'supabase' => {
    const mode = process.env.NEXT_PUBLIC_STORAGE_MODE;
    console.log(`📦 Storage Mode: ${mode || 'local (default)'}`);
    return mode === 'supabase' ? 'supabase' : 'local';
};

const isSupabase = () => getStorageMode() === 'supabase';

// ============ VEHÍCULOS ============

export async function buscarVehiculoPorPatente(patente: string, tallerIdOverride?: string): Promise<VehiculoDB | null> {
    if (isSupabase()) {
        console.log('🔵 Usando Supabase para buscar vehículo');
        return supabaseService.buscarVehiculoPorPatente(patente, tallerIdOverride);
    }
    console.log('🟡 Usando localStorage para buscar vehículo');
    return localService.buscarVehiculoPorPatente(patente);
}

export async function crearVehiculo(vehiculo: Omit<VehiculoDB, 'fecha_creacion'>, tallerIdOverride?: string): Promise<VehiculoDB | null> {
    if (isSupabase()) {
        console.log('🔵 Usando Supabase para crear vehículo');
        return supabaseService.crearVehiculo(vehiculo as any, tallerIdOverride);
    }
    console.log('🟡 Usando localStorage para crear vehículo');
    return localService.crearVehiculo(vehiculo);
}

export async function obtenerVehiculos(): Promise<VehiculoDB[]> {
    if (isSupabase()) {
        return supabaseService.obtenerVehiculos();
    }
    return localService.obtenerVehiculos();
}

// ============ ÓRDENES ============

export async function obtenerOrdenes(limit?: number, offset?: number): Promise<OrdenDB[]> {
    if (isSupabase()) {
        console.log('🔵 Usando Supabase para obtener órdenes');
        return supabaseService.obtenerOrdenes(limit, offset);
    }
    console.log('🟡 Usando localStorage para obtener órdenes');
    return localService.obtenerOrdenes(limit, offset);
}

export async function obtenerOrdenesCount(): Promise<number> {
    if (isSupabase()) {
        return supabaseService.obtenerOrdenesCount();
    }
    return localService.obtenerOrdenesCount();
}

export async function obtenerOrdenesLight(): Promise<OrdenDB[]> {
    if (isSupabase()) {
        return supabaseService.obtenerOrdenesLight();
    }
    return localService.obtenerOrdenesLight();
}

export async function obtenerOrdenesHoy(): Promise<OrdenDB[]> {
    if (isSupabase()) {
        console.log('🔵 Usando Supabase para obtener órdenes de hoy');
        return supabaseService.obtenerOrdenesHoy();
    }
    console.log('🟡 Usando localStorage para obtener órdenes de hoy');
    return localService.obtenerOrdenesHoy();
}

export async function obtenerOrdenPorId(id: string | number): Promise<OrdenDB | null> {
    if (isSupabase()) {
        console.log('🔵 Usando Supabase para obtener orden por ID');
        return supabaseService.obtenerOrdenPorId(String(id));
    }
    console.log('🟡 Usando localStorage para obtener orden por ID');
    return localService.obtenerOrdenPorId(String(id));
}


export async function crearOrden(orden: Omit<OrdenDB, 'id' | 'fecha_ingreso'>, tallerIdOverride?: string): Promise<OrdenDB | null> {
    if (isSupabase()) {
        console.log('🔵 Usando Supabase para crear orden');
        // @ts-ignore - Estructuras ligeramente diferentes entre local y supabase
        return supabaseService.crearOrden(orden, tallerIdOverride);
    }
    console.log('🟡 Usando localStorage para crear orden');
    return localService.crearOrden(orden);
}

export async function actualizarOrden(
    id: string | number,
    updates: Partial<Omit<OrdenDB, 'id' | 'fecha_ingreso'>>
): Promise<OrdenDB | null> {
    if (isSupabase()) {
        console.log('🔵 Usando Supabase para actualizar orden');
        return supabaseService.actualizarOrden(String(id), updates as any);
    }
    console.log('🟡 Usando localStorage para actualizar orden');
    return localService.actualizarOrden(String(id), updates);
}

export async function eliminarOrden(id: string | number): Promise<boolean> {
    if (isSupabase()) {
        console.log('🔵 Usando Supabase para eliminar orden');
        return supabaseService.eliminarOrden(String(id));
    }
    console.log('🟡 Usando localStorage para eliminar orden');
    return localService.eliminarOrden(String(id));
}



// ============ PERFILES/USUARIOS ============

export async function obtenerPerfiles(): Promise<PerfilDB[]> {
    if (isSupabase()) {
        return supabaseService.obtenerPerfiles();
    }
    return localService.obtenerPerfiles();
}

export async function obtenerPerfilPorId(id: string): Promise<PerfilDB | null> {
    if (isSupabase()) {
        return supabaseService.obtenerPerfilPorId(id);
    }
    return localService.obtenerPerfilPorId(id);
}

export async function actualizarPerfil(
    id: string,
    updates: Partial<Omit<PerfilDB, 'id'>>
): Promise<PerfilDB | null> {
    if (isSupabase()) {
        console.log('🔵 Usando Supabase para actualizar perfil');
        return supabaseService.actualizarPerfil(id, updates);
    }
    console.log('🟡 Usando localStorage para actualizar perfil');
    return localService.actualizarPerfil(id, updates);
}

export async function crearUsuario(
    email: string,
    password: string,
    nombreCompleto: string,
    rol: 'admin' | 'mecanico'
): Promise<{ success: boolean; error?: string; user?: PerfilDB }> {
    if (isSupabase()) {
        return supabaseService.crearUsuario(email, password, nombreCompleto, rol);
    }
    return localService.crearUsuario(email, password, nombreCompleto, rol);
}

// ============ AUTENTICACIÓN ============

export async function loginConCredenciales(email: string, password: string): Promise<{
    user: { id: string; email: string } | null;
    perfil: PerfilDB | null;
    error: string | null;
}> {
    if (isSupabase()) {
        return supabaseService.loginConCredenciales(email, password);
    }
    return localService.loginConCredenciales(email, password);
}

export async function logout(): Promise<void> {
    if (isSupabase()) {
        return supabaseService.logout();
    }
    return localService.logout();
}

export async function obtenerSesionActual(): Promise<{
    user: { id: string; email: string } | null;
    perfil: PerfilDB | null;
}> {
    if (isSupabase()) {
        return supabaseService.obtenerSesionActual();
    }
    return localService.obtenerSesionActual();
}

// ============ CITAS/AGENDAMIENTO ============

export async function obtenerCitas(): Promise<CitaDB[]> {
    if (isSupabase()) {
        return supabaseService.obtenerCitas() as unknown as CitaDB[];
    }
    return localService.obtenerCitas();
}

export async function obtenerCitasHoy(): Promise<CitaDB[]> {
    if (isSupabase()) {
        return supabaseService.obtenerCitasHoy() as unknown as CitaDB[];
    }
    return localService.obtenerCitasHoy();
}

export async function obtenerCitasSemana(startDate: Date, endDate: Date): Promise<CitaDB[]> {
    if (isSupabase()) {
        return supabaseService.obtenerCitasSemana(startDate, endDate) as unknown as CitaDB[];
    }
    return localService.obtenerCitasSemana(startDate, endDate);
}

export async function crearCita(cita: Omit<CitaDB, 'id' | 'creado_en' | 'actualizado_en'>): Promise<CitaDB | null> {
    if (isSupabase()) {
        return supabaseService.crearCita(cita) as unknown as CitaDB;
    }
    return localService.crearCita(cita);
}

export async function actualizarCita(id: string | number, updates: Partial<Omit<CitaDB, 'id' | 'creado_en'>>): Promise<CitaDB | null> {
    if (isSupabase()) {
        return supabaseService.actualizarCita(String(id), updates) as unknown as CitaDB;
    }
    return localService.actualizarCita(String(id), updates);
}

export async function eliminarCita(id: string | number): Promise<boolean> {
    if (isSupabase()) {
        return supabaseService.eliminarCita(String(id));
    }
    return localService.eliminarCita(String(id));
}

// ============ INICIALIZACIÓN ============

export function inicializarLocalStorage(): void {
    if (!isSupabase()) {
        localService.initializeLocalStorage();
    }
}

// ============ IMÁGENES ============

export async function subirImagen(file: File, carpeta?: string): Promise<string | null> {
    if (isSupabase()) {
        return supabaseService.subirImagen(file, carpeta);
    }
    return localService.subirImagen(file, carpeta);
}

// ============ CLIENTES (CRM) ============

export async function obtenerClientes(busqueda?: string): Promise<ClienteDB[]> {
    if (isSupabase()) {
        return supabaseService.obtenerClientes(busqueda);
    }
    return []; // No implementado en local
}

export async function crearCliente(cliente: any): Promise<any> {
    if (isSupabase()) {
        return supabaseService.crearCliente(cliente);
    }
    return null; // No implementado en local
}

export async function actualizarCliente(id: string, updates: any): Promise<any> {
    if (isSupabase()) {
        return supabaseService.actualizarCliente(id, updates);
    }
    return null;
}

// Buscar cliente por RUT
export async function buscarClientePorRut(rut: string): Promise<ClienteDB | null> {
    if (isSupabase()) {
        console.log('🔵 Usando Supabase para buscar cliente por RUT');
        return supabaseService.buscarClientePorRut(rut);
    }
    // Fallback or not implemented for local
    return null;
}

// ============ SERVICIOS (V3.1) ============

export async function obtenerServiciosFrecuentes(): Promise<ServicioDB[]> {
    if (isSupabase()) {
        return supabaseService.obtenerServiciosFrecuentes();
    }
    return []; // No implementado en local
}

// Re-exportar tipos
export type { OrdenDB, VehiculoDB, PerfilDB, CitaDB, ServicioDB, ClienteDB, ClienteWithStats };
// ============ CHECKLISTS (Supabase Only for now) ============

export async function guardarChecklist(checklist: {
    order_id: string;
    items: any;
    photos: any;
    comentarios_generales?: string;
    fotos_extra?: string[];
}): Promise<any> {
    if (isSupabase()) {
        // Adapt frontend structure to DB structure
        return supabaseService.guardarChecklist({
            orden_id: checklist.order_id,
            detalles: checklist.items,
            fotos: checklist.photos,
            comentarios_generales: checklist.comentarios_generales,
            fotos_extra: checklist.fotos_extra
        });
    }
    console.log('🟡 [Storage] Guardando checklist en local (Mock)...', checklist);
    // TODO: Implement local storage for checklists if needed
    return { id: 'local-checklist', ...checklist };
}

export async function obtenerChecklist(orderId: string): Promise<any> {
    if (isSupabase()) {
        return supabaseService.obtenerChecklist(orderId);
    }
    console.log('🟡 [Storage] Obteniendo checklist local (Mock) para orden:', orderId);
    return null;
}

export async function subirImagenChecklist(file: File, ordenId: string, tipo: string): Promise<string | null> {
    if (isSupabase()) {
        return supabaseService.subirImagenChecklist(file, ordenId, tipo);
    }
    console.log('🟡 [Storage] Simulando subida de imagen local...');
    return URL.createObjectURL(file);
}

export async function confirmarRevisionIngreso(
    id: string, // Can be OrderId or ChecklistId
    datosSalida?: {
        detalles_salida: any,
        fotos_salida: any,
        confirmado_por: string
    }
): Promise<any> {
    if (isSupabase()) {
        let idChecklist = id;

        // 1. Try to find if 'id' is an Order ID that has a checklist
        // We do this by query because both are UUIDs now.
        const checklist = await supabaseService.obtenerChecklist(id);

        if (checklist && checklist.id) {
            console.log(`✅ [Storage] ID ${id} es Order ID. Usando Checklist ID: ${checklist.id}`);
            idChecklist = checklist.id;
        } else {
            console.log(`⚠️ [Storage] No se encontró checklist para Order ID ${id}. Asumiendo que ES el Checklist ID.`);
            // Fallback: The ID passed might be the checklist ID itself
        }

        return supabaseService.confirmarRevisionIngreso(idChecklist, datosSalida);
    }
    console.log('🟡 [Storage] Confirmando revisión mock:', id, datosSalida);
    return { success: true };
}
