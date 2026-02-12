-- ============================================
-- RESET COMPLETO DE LA BASE DE DATOS
-- ============================================
-- ADVERTENCIA: Esto borrará TODOS los datos
-- Ejecuta esto solo si estás seguro
-- ============================================

-- 1. DESHABILITAR RLS EN TODAS LAS TABLAS
ALTER TABLE IF EXISTS perfiles DISABLE ROW LEVEL SECURITY;
ALTER TABLE IF EXISTS clientes DISABLE ROW LEVEL SECURITY;
ALTER TABLE IF EXISTS vehiculos DISABLE ROW LEVEL SECURITY;
ALTER TABLE IF EXISTS ordenes DISABLE ROW LEVEL SECURITY;
ALTER TABLE IF EXISTS citas DISABLE ROW LEVEL SECURITY;
ALTER TABLE IF EXISTS talleres DISABLE ROW LEVEL SECURITY;

-- 2. ELIMINAR TODAS LAS POLÍTICAS RLS
DO $$ 
DECLARE
    r RECORD;
BEGIN
    FOR r IN (SELECT schemaname, tablename, policyname 
              FROM pg_policies 
              WHERE schemaname = 'public') 
    LOOP
        EXECUTE 'DROP POLICY IF EXISTS "' || r.policyname || '" ON ' || r.schemaname || '.' || r.tablename;
    END LOOP;
END $$;

-- 3. ELIMINAR TODAS LAS TABLAS (en orden inverso por dependencias)
DROP TABLE IF EXISTS citas CASCADE;
DROP TABLE IF EXISTS ordenes CASCADE;
DROP TABLE IF EXISTS vehiculos CASCADE;
DROP TABLE IF EXISTS clientes CASCADE;
DROP TABLE IF EXISTS perfiles CASCADE;
DROP TABLE IF EXISTS talleres CASCADE;

-- 4. CREAR TABLA TALLERES
CREATE TABLE talleres (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    nombre TEXT NOT NULL,
    rut TEXT UNIQUE,
    direccion TEXT,
    telefono TEXT,
    email TEXT,
    logo_url TEXT,
    activo BOOLEAN DEFAULT true,
    created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
    updated_at TIMESTAMP WITH TIME ZONE DEFAULT NOW()
);

-- 5. CREAR TABLA PERFILES (sin RLS por ahora)
CREATE TABLE perfiles (
    id UUID PRIMARY KEY,
    email TEXT NOT NULL UNIQUE,
    nombre_completo TEXT NOT NULL,
    rol TEXT NOT NULL CHECK (rol IN ('admin', 'mecanico')),
    activo BOOLEAN DEFAULT true,
    taller_id UUID REFERENCES talleres(id) ON DELETE CASCADE,
    created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
    updated_at TIMESTAMP WITH TIME ZONE DEFAULT NOW()
);

-- 6. CREAR TABLA CLIENTES
CREATE TABLE clientes (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    nombre_completo TEXT NOT NULL,
    tipo TEXT NOT NULL CHECK (tipo IN ('persona', 'empresa')),
    rut_dni TEXT,
    telefono TEXT,
    email TEXT,
    direccion TEXT,
    notas TEXT,
    taller_id UUID REFERENCES talleres(id) ON DELETE CASCADE,
    created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
    updated_at TIMESTAMP WITH TIME ZONE DEFAULT NOW()
);

-- 7. CREAR TABLA VEHICULOS
CREATE TABLE vehiculos (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    patente TEXT NOT NULL,
    marca TEXT,
    modelo TEXT,
    ano INTEGER,
    color TEXT,
    kilometraje INTEGER,
    cliente_id UUID REFERENCES clientes(id) ON DELETE CASCADE,
    taller_id UUID REFERENCES talleres(id) ON DELETE CASCADE,
    created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
    updated_at TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
    UNIQUE(patente, taller_id)
);

-- 8. CREAR TABLA ORDENES
CREATE TABLE ordenes (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    numero_orden TEXT,
    fecha_ingreso TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
    fecha_estimada_salida TIMESTAMP WITH TIME ZONE,
    fecha_salida TIMESTAMP WITH TIME ZONE,
    estado TEXT NOT NULL CHECK (estado IN ('pendiente', 'en_proceso', 'completada', 'entregada', 'cancelada')),
    descripcion_problema TEXT,
    diagnostico TEXT,
    trabajos_realizados TEXT,
    precio_total DECIMAL(10,2),
    vehiculo_id UUID REFERENCES vehiculos(id) ON DELETE CASCADE,
    taller_id UUID REFERENCES talleres(id) ON DELETE CASCADE,
    created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
    updated_at TIMESTAMP WITH TIME ZONE DEFAULT NOW()
);

-- 9. CREAR TABLA CITAS
CREATE TABLE citas (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    fecha_hora TIMESTAMP WITH TIME ZONE NOT NULL,
    motivo TEXT,
    estado TEXT NOT NULL CHECK (estado IN ('pendiente', 'confirmada', 'completada', 'cancelada')),
    notas TEXT,
    vehiculo_id UUID REFERENCES vehiculos(id) ON DELETE CASCADE,
    taller_id UUID REFERENCES talleres(id) ON DELETE CASCADE,
    created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
    updated_at TIMESTAMP WITH TIME ZONE DEFAULT NOW()
);

-- 10. CREAR ÍNDICES
CREATE INDEX idx_perfiles_taller ON perfiles(taller_id);
CREATE INDEX idx_clientes_taller ON clientes(taller_id);
CREATE INDEX idx_vehiculos_taller ON vehiculos(taller_id);
CREATE INDEX idx_vehiculos_patente ON vehiculos(patente);
CREATE INDEX idx_ordenes_taller ON ordenes(taller_id);
CREATE INDEX idx_citas_taller ON citas(taller_id);

-- 11. INSERTAR TALLER DE PRUEBA
INSERT INTO talleres (id, nombre, rut, direccion, telefono, email, activo)
VALUES (
    '00000000-0000-0000-0000-000000000001',
    'Taller Demo',
    '12345678-9',
    'Calle Falsa 123, Santiago',
    '+56912345678',
    'contacto@tallerdemo.cl',
    true
);

-- 12. MENSAJE DE ÉXITO
SELECT 'Base de datos reseteada exitosamente. Ahora crea los usuarios en Supabase Auth.' as mensaje;
