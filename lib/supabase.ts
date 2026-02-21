import { createClient } from '@supabase/supabase-js'

const supabaseUrl = process.env.NEXT_PUBLIC_SUPABASE_URL || 'https://dccymmnjzhxneexscboo.supabase.co'
const supabaseAnonKey = process.env.NEXT_PUBLIC_SUPABASE_ANON_KEY || 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImRjY3ltbW5qemh4bmVleHNjYm9vIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NjgxODA0MjIsImV4cCI6MjA4Mzc1NjQyMn0.IKpjys-3Rqqv2omj0LtFKowzQi5Z_M99JkhOgR29sx8'

export const supabase = createClient(supabaseUrl, supabaseAnonKey)

// ==========================================
// TIPOS V3 - HUB & SPOKE (Global + Local)
// ==========================================

// Global Source of Truth (Nube Flusize)
export interface PerfilGlobal {
    id: string; // Link a auth.users
    email: string;
    nombre_completo?: string | null;
    telefono?: string | null;
    saldo_puntos: number;
    es_super_admin: boolean;
    // created_at? Schema didn't specify but likely exists
}

export interface VehiculoGlobal {
    id: string;
    patente: string;
    marca?: string | null;
    modelo?: string | null;
    anio?: number | null; // Integer
    vin?: string | null;
    motor?: string | null;
    tipo_combustible?: string | null; // 'bencina', etc.
    datos_api?: any; // jsonb
    // created_at?
}

export interface TallerFavorito {
    usuario_id: string; // ref perfiles_globales
    taller_id: string; // ref talleres
}

// Local SaaS Tables
export interface TallerDB {
    id: string; // UUID
    nombre: string;
    rut?: string | null;
    direccion?: string | null;
    telefono?: string | null;
    email?: string | null;
    logo_url?: string | null;
    activo: boolean;
    // New Fields (Spanish)
    slug?: string | null;
    latitud?: number | null;
    longitud?: number | null;
    descripcion?: string | null;
    horario?: any; // jsonb
    plan_suscripcion?: string | null;
    etiquetas_servicios?: string[] | null;
    created_at?: string;
    updated_at?: string;
}

export interface PerfilDB {
    // Legacy / Admin profiles (Mecánicos, Dueños)
    id: string; // UUID
    email: string;
    nombre_completo: string;
    rol: 'mecanico' | 'admin';
    activo: boolean;
    taller_id?: string; // UUID del taller asignado
    created_at: string;
    updated_at: string;
}

export interface ClienteDB {
    id: string; // UUID
    nombre_completo: string;
    tipo: 'persona' | 'empresa';
    rut_dni?: string | null;
    telefono?: string | null;
    email?: string | null;
    direccion?: string | null;
    notas?: string | null;
    taller_id: string; // FK -> Taller
    // New Field (Pending if renamed? User didn't specify client link rename, but implied context)
    // User said: "Tabla ordenes: Ahora tiene una columna vehiculo_global_id"
    // Nothing about clientes global link rename. I'll keep global_profile_id or assume perfil_global_id?
    // Schema provided: "table public.perfiles_globales".
    // I will assume for consistency: perfil_global_id? Or wait?
    // The previous prompt said "clientes... global_profile_id".
    // THIS prompt didn't mention clientes table updates, only Ordenes and Talleres.
    // I will keep `global_profile_id` but likely it should be `perfil_global_id` if we follow pattern.
    // However, user only explicitly renamed Ordenes column.
    // I will stick to `global_profile_id` for ClienteDB to minimize guessing, UNLESS I see strong evidence.
    // Actually, `perfiles_globales` is the table. FK usually `perfil_global_id`.
    // I'll update it to `perfil_global_id` to be safe and consistent with Spanish.
    perfil_global_id?: string | null;
    created_at?: string;
}

export interface ClienteWithStats extends ClienteDB {
    total_ordenes: number;
    total_gastado: number;
    ultima_visita?: string;
    vehiculos?: (VehiculoDB & { ordenes?: OrdenDB[] })[];
}

export interface VehiculoDB {
    // Legacy Local Table (Write Global instead, Sync here)
    patente: string; // PK
    marca: string;
    modelo: string;
    anio: string; // In Local it was string? Schema says integer in Global. Local probably string legacy.
    motor?: string | null;
    color?: string | null;
    vin?: string | null;
    vehiculo_global_id?: string | null; // Hub Link
    cliente_id: string; // FK -> Cliente
    taller_id: string; // FK -> Taller

    // Relación anidada (al hacer select *, clientes(*))
    clientes?: ClienteDB | null;
}

export interface OrdenDB {
    id: string; // UUID (Updated from number)
    numero_orden?: string | null; // NEW: Human readable ID

    taller_id: string; // FK -> Taller
    cliente_id?: string | null; // FK -> Cliente (Added)

    patente_vehiculo: string; // FK -> Vehiculo (Legacy but required)
    vehiculo_local_id?: string | null;
    vehiculo_global_id?: string | null;

    descripcion_ingreso: string;
    estado: 'pendiente' | 'en_proceso' | 'completada' | 'cancelada' | 'entregada' | 'debe'; // Updated status values

    creado_por: string; // UUID
    asignado_a?: string | null; // UUID

    fecha_ingreso: string;
    fecha_estimada_salida?: string | null;
    fecha_entrega?: string | null; // Alias/Legacy? SQL has fecha_salida
    fecha_salida?: string | null;
    fecha_cierre?: string | null;

    precio_total: number;
    metodo_pago?: string | null;
    metodos_pago?: { metodo: string; monto: number }[] | null;

    descripcion_problema?: string | null;
    diagnostico?: string | null;
    trabajos_realizados?: string | null;
    detalle_trabajos?: string | null;

    kilometraje?: number | null;
    nivel_combustible?: string | null;
    observaciones_mecanico?: string | null;
    fotos_urls?: string[] | null;

    // Access Token fields
    access_token?: string | null;
    token_created_at?: string | null;
    last_public_view?: string | null;

    // Timestamps
    creado_en?: string;
    actualizado_en?: string;

    // UI Support / Joined Fields
    cliente_nombre?: string | null;
    cliente_telefono?: string | null;
    cliente_email?: string | null;
    cliente_rut?: string | null;

    // Relaciones anidadas
    vehiculos?: VehiculoDB | null;
    clientes?: ClienteDB | null; // Direct link
    perfiles_creado?: PerfilDB | null;
    perfiles_asignado?: PerfilDB | null;

    // New Standardized Relations (Matches updated fetchOrders)
    cliente?: { id: string; nombre_completo: string; telefono?: string | null; email?: string | null; rut_dni?: string | null } | null;
    vehiculo?: { id: string; patente: string; marca: string; modelo: string; ano?: string; vin?: string; motor?: string } | null;
    asignado?: { id: string; nombre_completo: string; rol?: string } | null;
    creado?: { id: string; nombre_completo: string; rol?: string } | null;
    creado_por_perfil?: { id: string; nombre_completo: string; } | null; // Explicit alias for 400 fix
}

export interface CitaDB {
    id: string; // UUID
    taller_id: string; // FK -> Taller
    fecha_hora: string; // ISO DB
    motivo?: string | null;
    estado: 'pendiente' | 'confirmada' | 'completada' | 'cancelada';
    patente_vehiculo?: string | null;
    notas?: string | null;

    // UI / Derived
    titulo?: string; // Often derived from motivo or cliente
    fecha_inicio?: string; // Alias for fecha_hora
    fecha_fin?: string;

    // Legacy support / UI fields
    cliente_nombre?: string | null;
    cliente_telefono?: string | null;
    servicio_solicitado?: string | null;

    // Relaciones
    clientes?: ClienteDB | null;
    vehiculos?: VehiculoDB | null;
}

export interface ListaChequeoDB {
    id: string; // UUID
    orden_id: string; // FK -> Ordenes
    detalles: any; // jsonb
    fotos: any; // jsonb
    revisado_por_mecanico_at?: string | null;
    creado_en?: string;
}

export interface ServicioDB {
    id: number;
    descripcion: string;
    precio_base: number;
    categoria?: string | null;
    activo: boolean;
}
