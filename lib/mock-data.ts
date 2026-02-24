// Datos mock para modo offline/demo
import { VehiculoDB, OrdenDB, PerfilDB } from './supabase';

// Flag para detectar si estamos en modo offline
export let isOfflineMode = false;

export function setOfflineMode(offline: boolean) {
    isOfflineMode = offline;
    if (offline) {
        console.log('🔌 Modo OFFLINE activado - Usando datos mock');
    }
}

// Perfiles/Usuarios mock
export const mockPerfiles: PerfilDB[] = [
    {
        id: 'admin-juan',
        nombre_completo: 'Juan',
        rol: 'superadmin',
        activo: true,
        email: 'juan@taller.cl',
        created_at: new Date().toISOString(),
        updated_at: new Date().toISOString(),
    },
    {
        id: 'admin-rodrigo',
        nombre_completo: 'Rodrigo',
        rol: 'taller_admin',
        activo: true,
        email: 'rodrigo@taller.cl',
        created_at: new Date().toISOString(),
        updated_at: new Date().toISOString(),
    },
    {
        id: 'mecanico-francisco',
        nombre_completo: 'Francisco',
        rol: 'mecanico',
        activo: true,
        email: 'francisco@taller.cl',
        created_at: new Date().toISOString(),
        updated_at: new Date().toISOString(),
    },
    {
        id: 'mecanico-javier',
        nombre_completo: 'Javier',
        rol: 'mecanico',
        activo: true,
        email: 'javier@taller.cl',
        created_at: new Date().toISOString(),
        updated_at: new Date().toISOString(),
    },
];

export const mockVehiculos: VehiculoDB[] = [
    { patente: 'ABCD12', marca: 'Toyota', modelo: 'Corolla', anio: '2020', color: 'Blanco', cliente_id: 'mock-client', taller_id: 'mock-taller' },
    { patente: 'WXYZ99', marca: 'Chevrolet', modelo: 'Spark', anio: '2019', color: 'Rojo', cliente_id: 'mock-client', taller_id: 'mock-taller' },
    { patente: 'JKLM45', marca: 'Hyundai', modelo: 'Accent', anio: '2021', color: 'Gris', cliente_id: 'mock-client', taller_id: 'mock-taller' },
    { patente: 'PQRS78', marca: 'Kia', modelo: 'Rio', anio: '2022', color: 'Negro', cliente_id: 'mock-client', taller_id: 'mock-taller' },
    { patente: 'DEFG34', marca: 'Nissan', modelo: 'Versa', anio: '2018', color: 'Azul', cliente_id: 'mock-client', taller_id: 'mock-taller' },
    { patente: 'HIJK56', marca: 'Mazda', modelo: '3', anio: '2023', color: 'Blanco', cliente_id: 'mock-client', taller_id: 'mock-taller' },
    { patente: 'LMNO89', marca: 'Ford', modelo: 'Fiesta', anio: '2017', color: 'Plata', cliente_id: 'mock-client', taller_id: 'mock-taller' },
    { patente: 'QRST12', marca: 'Honda', modelo: 'Civic', anio: '2021', color: 'Gris', cliente_id: 'mock-client', taller_id: 'mock-taller' },
];

// Órdenes de trabajo mock
export let mockOrdenes: OrdenDB[] = [
    {
        id: '1',
        taller_id: 'mock-taller',
        patente_vehiculo: 'ABCD12',
        descripcion_ingreso: 'Cambio de aceite y filtros. El cliente menciona ruido en frenos.',
        estado: 'en_proceso',
        creado_por: 'mecanico-1-id',
        asignado_a: 'mecanico-2-id',
        precio_total: 0,
        fecha_ingreso: new Date(Date.now() - 2 * 60 * 60 * 1000).toISOString(),
        fotos_urls: [],
        cliente_nombre: 'Carlos González',
        cliente_telefono: '+56912345678',
    },
    {
        id: '2',
        taller_id: 'mock-taller',
        patente_vehiculo: 'WXYZ99',
        descripcion_ingreso: 'Revisión general por kilometraje. 50.000 km.',
        estado: 'pendiente',
        creado_por: 'mecanico-1-id',
        asignado_a: null,
        precio_total: 0,
        fecha_ingreso: new Date(Date.now() - 1 * 60 * 60 * 1000).toISOString(),
        fotos_urls: [],
        cliente_nombre: 'María López',
        cliente_telefono: '+56987654321',
    },
    {
        id: '3',
        taller_id: 'mock-taller',
        patente_vehiculo: 'JKLM45',
        descripcion_ingreso: 'Reparación de sistema eléctrico. Luces intermitentes no funcionan.',
        estado: 'completada',
        creado_por: 'admin-mock-id',
        asignado_a: 'mecanico-2-id',
        fecha_ingreso: new Date(Date.now() - 24 * 60 * 60 * 1000).toISOString(),
        fecha_cierre: new Date(Date.now() - 12 * 60 * 60 * 1000).toISOString(),
        fotos_urls: [],
        cliente_nombre: 'Pedro Ramírez',
        cliente_telefono: '+56956781234',
        detalle_trabajos: 'Reparación de fusibles y cableado de luces intermitentes',
        precio_total: 45000,
    },
    {
        id: '4',
        taller_id: 'mock-taller',
        patente_vehiculo: 'PQRS78',
        descripcion_ingreso: 'Cambio de pastillas de freno delanteras y revisión de discos.',
        estado: 'completada',
        creado_por: 'mecanico-1-id',
        asignado_a: 'mecanico-1-id',
        precio_total: 85000,
        fecha_ingreso: new Date(Date.now() - 3 * 60 * 60 * 1000).toISOString(),
        fecha_cierre: new Date(Date.now() - 30 * 60 * 1000).toISOString(),
        fotos_urls: [],
        cliente_nombre: 'Ana Torres',
        cliente_telefono: '+56923456789',
        detalle_trabajos: 'Cambio de pastillas de freno delanteras, revisión de discos (en buen estado)',
    },
];

// Simulador de delay para API
const delay = (ms: number) => new Promise(resolve => setTimeout(resolve, ms));

// API Mock: Buscar vehículo por patente
export async function mockBuscarVehiculoPorPatente(patente: string): Promise<VehiculoDB | null> {
    await delay(300);
    const normalized = patente.toUpperCase().replace(/[^A-Z0-9]/g, '');
    return mockVehiculos.find(v => v.patente === normalized) || null;
}

// API Mock: Crear vehículo
export async function mockCrearVehiculo(vehiculo: Omit<VehiculoDB, 'fecha_creacion'>): Promise<VehiculoDB | null> {
    await delay(200);
    const newVehiculo: VehiculoDB = {
        ...vehiculo,
    };
    mockVehiculos.push(newVehiculo);
    return newVehiculo;
}

// API Mock: Obtener vehículos
export async function mockObtenerVehiculos(): Promise<VehiculoDB[]> {
    await delay(200);
    return [...mockVehiculos];
}

// API Mock: Obtener órdenes
export async function mockObtenerOrdenes(): Promise<OrdenDB[]> {
    await delay(300);
    return [...mockOrdenes];
}

// API Mock: Obtener órdenes de hoy
export async function mockObtenerOrdenesHoy(): Promise<OrdenDB[]> {
    await delay(300);
    const today = new Date().toDateString();
    return mockOrdenes.filter(o => new Date(o.fecha_ingreso).toDateString() === today);
}

// API Mock: Obtener orden por ID
export async function mockObtenerOrdenPorId(id: string): Promise<OrdenDB | null> {
    await delay(200);
    return mockOrdenes.find(o => o.id === id) || null;
}

// API Mock: Crear orden
export async function mockCrearOrden(orden: {
    patente_vehiculo: string;
    descripcion_ingreso: string;
    creado_por: string;
    estado?: 'pendiente' | 'en_proceso' | 'completada' | 'cancelada' | 'entregada' | 'debe' | 'lista'; // lista kept for compat but mapped
    fotos?: string[];
    cliente_nombre?: string;
    cliente_telefono?: string;
    precio_total?: number;
}): Promise<OrdenDB | null> {
    await delay(300);
    const newOrden: OrdenDB = {
        id: String(Math.max(...mockOrdenes.map(o => Number(o.id) || 0), 0) + 1),
        taller_id: 'mock-taller',
        patente_vehiculo: orden.patente_vehiculo.toUpperCase(),
        descripcion_ingreso: orden.descripcion_ingreso,
        creado_por: orden.creado_por,
        asignado_a: null,
        estado: (orden.estado === 'lista' ? 'completada' : orden.estado) || 'pendiente',
        precio_total: orden.precio_total || 0,
        fotos_urls: orden.fotos || [],
        cliente_nombre: orden.cliente_nombre,
        cliente_telefono: orden.cliente_telefono,
        fecha_ingreso: new Date().toISOString(),
    };
    mockOrdenes.push(newOrden);
    return newOrden;
}

// API Mock: Actualizar orden
export async function mockActualizarOrden(
    id: string,
    updates: Partial<Omit<OrdenDB, 'id' | 'fecha_ingreso'>>
): Promise<OrdenDB | null> {
    await delay(200);
    const index = mockOrdenes.findIndex(o => o.id === id);
    if (index === -1) return null;

    mockOrdenes[index] = {
        ...mockOrdenes[index],
        ...updates,
        // fecha_actualizacion removed as it's not in types
    };
    return mockOrdenes[index];
}

// API Mock: Obtener perfiles
export async function mockObtenerPerfiles(): Promise<PerfilDB[]> {
    await delay(200);
    return [...mockPerfiles];
}

// API Mock: Obtener perfil por ID
export async function mockObtenerPerfilPorId(id: string): Promise<PerfilDB | null> {
    await delay(200);
    return mockPerfiles.find(p => p.id === id) || null;
}

// API Mock: Actualizar perfil
export async function mockActualizarPerfil(
    id: string,
    updates: Partial<Omit<PerfilDB, 'id'>>
): Promise<PerfilDB | null> {
    await delay(200);
    const index = mockPerfiles.findIndex(p => p.id === id);
    if (index === -1) return null;

    mockPerfiles[index] = {
        ...mockPerfiles[index],
        ...updates,
    };
    return mockPerfiles[index];
}

// API Mock: Crear usuario
export async function mockCrearUsuario(
    email: string,
    password: string,
    nombreCompleto: string,
    rol: 'superadmin' | 'taller_admin' | 'mecanico'
): Promise<{ success: boolean; error?: string }> {
    await delay(300);
    const newPerfil: PerfilDB = {
        id: `mock-user-${Date.now()}`,
        nombre_completo: nombreCompleto,
        rol,
        activo: true,
        email: `user-mock-${Date.now()}@example.com`,
        created_at: new Date().toISOString(),
        updated_at: new Date().toISOString(),
    };
    mockPerfiles.push(newPerfil);
    return { success: true };
}

// API Mock: Login
export async function mockLoginConCredenciales(email: string, password: string): Promise<{
    user: { id: string; email: string } | null;
    perfil: PerfilDB | null;
    error: string | null;
}> {
    await delay(300);
    // En modo demo, cualquier credencial funciona y devuelve el admin
    const perfil = mockPerfiles[0]; // Admin
    return {
        user: { id: perfil.id, email: email },
        perfil,
        error: null,
    };
}

// API Mock: Obtener sesión actual
export async function mockObtenerSesionActual(): Promise<{
    user: { id: string; email: string } | null;
    perfil: PerfilDB | null;
}> {
    await delay(100);
    // En modo demo, siempre hay sesión activa (admin)
    const perfil = mockPerfiles[0];
    return {
        user: { id: perfil.id, email: 'admin@demo.com' },
        perfil,
    };
}

// API Mock: Obtener órdenes por usuario
export async function mockObtenerOrdenesPorUsuario(userId: string): Promise<{
    creadas: OrdenDB[];
    asignadas: OrdenDB[];
}> {
    await delay(200);
    return {
        creadas: mockOrdenes.filter(o => o.creado_por === userId),
        asignadas: mockOrdenes.filter(o => o.asignado_a === userId),
    };
}
