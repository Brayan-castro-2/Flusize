-- ============================================
-- MIGRACIÓN MULTI-TENANT
-- Fecha: 2026-02-11
-- Descripción: Agregar soporte multi-taller al sistema
-- ============================================

-- ============================================
-- PASO 1: CREAR TABLA TALLERES
-- ============================================

CREATE TABLE IF NOT EXISTS talleres (
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

-- Índice para búsquedas por nombre
CREATE INDEX idx_talleres_nombre ON talleres(nombre);
CREATE INDEX idx_talleres_activo ON talleres(activo);

-- Trigger para actualizar updated_at
CREATE TRIGGER update_talleres_updated_at
    BEFORE UPDATE ON talleres
    FOR EACH ROW
    EXECUTE FUNCTION update_updated_at_column();

-- ============================================
-- PASO 2: AGREGAR COLUMNA taller_id A TABLAS EXISTENTES
-- ============================================

-- Agregar columna taller_id (permitir NULL temporalmente para migración)
ALTER TABLE perfiles ADD COLUMN IF NOT EXISTS taller_id UUID REFERENCES talleres(id) ON DELETE CASCADE;
ALTER TABLE clientes ADD COLUMN IF NOT EXISTS taller_id UUID REFERENCES talleres(id) ON DELETE CASCADE;
ALTER TABLE vehiculos ADD COLUMN IF NOT EXISTS taller_id UUID REFERENCES talleres(id) ON DELETE CASCADE;
ALTER TABLE ordenes ADD COLUMN IF NOT EXISTS taller_id UUID REFERENCES talleres(id) ON DELETE CASCADE;
ALTER TABLE citas ADD COLUMN IF NOT EXISTS taller_id UUID REFERENCES talleres(id) ON DELETE CASCADE;

-- ============================================
-- PASO 3: CREAR TALLER POR DEFECTO Y MIGRAR DATOS
-- ============================================

-- Insertar taller por defecto (Electromecánica JR)
INSERT INTO talleres (id, nombre, rut, direccion, telefono, email, activo)
VALUES (
    '00000000-0000-0000-0000-000000000001',
    'Electromecánica JR',
    '12345678-9',
    'Dirección del taller',
    '+56912345678',
    'contacto@electromecanicajr.cl',
    true
)
ON CONFLICT (id) DO NOTHING;

-- Asignar todos los datos existentes al taller por defecto
UPDATE perfiles SET taller_id = '00000000-0000-0000-0000-000000000001' WHERE taller_id IS NULL;
UPDATE clientes SET taller_id = '00000000-0000-0000-0000-000000000001' WHERE taller_id IS NULL;
UPDATE vehiculos SET taller_id = '00000000-0000-0000-0000-000000000001' WHERE taller_id IS NULL;
UPDATE ordenes SET taller_id = '00000000-0000-0000-0000-000000000001' WHERE taller_id IS NULL;
UPDATE citas SET taller_id = '00000000-0000-0000-0000-000000000001' WHERE taller_id IS NULL;

-- ============================================
-- PASO 4: HACER taller_id OBLIGATORIO
-- ============================================

-- Ahora que todos los registros tienen taller_id, hacerlo NOT NULL
ALTER TABLE perfiles ALTER COLUMN taller_id SET NOT NULL;
ALTER TABLE clientes ALTER COLUMN taller_id SET NOT NULL;
ALTER TABLE vehiculos ALTER COLUMN taller_id SET NOT NULL;
ALTER TABLE ordenes ALTER COLUMN taller_id SET NOT NULL;
ALTER TABLE citas ALTER COLUMN taller_id SET NOT NULL;

-- ============================================
-- PASO 5: CREAR ÍNDICES PARA RENDIMIENTO
-- ============================================

CREATE INDEX idx_perfiles_taller ON perfiles(taller_id);
CREATE INDEX idx_clientes_taller ON clientes(taller_id);
CREATE INDEX idx_vehiculos_taller ON vehiculos(taller_id);
CREATE INDEX idx_ordenes_taller ON ordenes(taller_id);
CREATE INDEX idx_citas_taller ON citas(taller_id);

-- ============================================
-- PASO 6: ACTUALIZAR POLÍTICAS RLS (Row Level Security)
-- ============================================

-- Habilitar RLS en talleres
ALTER TABLE talleres ENABLE ROW LEVEL SECURITY;

-- Política: Los usuarios pueden ver su propio taller
CREATE POLICY "Usuarios pueden ver su taller"
    ON talleres FOR SELECT
    USING (
        id = (SELECT taller_id FROM perfiles WHERE id = auth.uid())
    );

-- Política: Solo admins pueden crear talleres (ajustar según necesidad)
CREATE POLICY "Solo admins pueden crear talleres"
    ON talleres FOR INSERT
    WITH CHECK (
        EXISTS (
            SELECT 1 FROM perfiles 
            WHERE id = auth.uid() 
            AND rol = 'admin'
        )
    );

-- ============================================
-- ACTUALIZAR POLÍTICAS RLS PARA PERFILES
-- ============================================

-- Eliminar políticas antiguas
DROP POLICY IF EXISTS "Usuarios autenticados pueden ver perfiles" ON perfiles;
DROP POLICY IF EXISTS "Solo admins pueden insertar perfiles" ON perfiles;
DROP POLICY IF EXISTS "Solo admins pueden actualizar perfiles" ON perfiles;

-- Nueva política: Ver solo perfiles del mismo taller
CREATE POLICY "Usuarios pueden ver perfiles de su taller"
    ON perfiles FOR SELECT
    USING (
        taller_id = (SELECT taller_id FROM perfiles WHERE id = auth.uid())
    );

-- Política: Insertar perfiles (solo del mismo taller)
CREATE POLICY "Usuarios pueden crear perfiles en su taller"
    ON perfiles FOR INSERT
    WITH CHECK (
        taller_id = (SELECT taller_id FROM perfiles WHERE id = auth.uid())
    );

-- Política: Actualizar perfiles (solo del mismo taller)
CREATE POLICY "Usuarios pueden actualizar perfiles de su taller"
    ON perfiles FOR UPDATE
    USING (
        taller_id = (SELECT taller_id FROM perfiles WHERE id = auth.uid())
    );

-- ============================================
-- ACTUALIZAR POLÍTICAS RLS PARA CLIENTES
-- ============================================

DROP POLICY IF EXISTS "Usuarios autenticados pueden ver clientes" ON clientes;
DROP POLICY IF EXISTS "Usuarios autenticados pueden crear clientes" ON clientes;
DROP POLICY IF EXISTS "Usuarios autenticados pueden actualizar clientes" ON clientes;

CREATE POLICY "Usuarios pueden ver clientes de su taller"
    ON clientes FOR SELECT
    USING (
        taller_id = (SELECT taller_id FROM perfiles WHERE id = auth.uid())
    );

CREATE POLICY "Usuarios pueden crear clientes en su taller"
    ON clientes FOR INSERT
    WITH CHECK (
        taller_id = (SELECT taller_id FROM perfiles WHERE id = auth.uid())
    );

CREATE POLICY "Usuarios pueden actualizar clientes de su taller"
    ON clientes FOR UPDATE
    USING (
        taller_id = (SELECT taller_id FROM perfiles WHERE id = auth.uid())
    );

-- ============================================
-- ACTUALIZAR POLÍTICAS RLS PARA VEHICULOS
-- ============================================

DROP POLICY IF EXISTS "Usuarios autenticados pueden ver vehiculos" ON vehiculos;
DROP POLICY IF EXISTS "Usuarios autenticados pueden crear vehiculos" ON vehiculos;
DROP POLICY IF EXISTS "Usuarios autenticados pueden actualizar vehiculos" ON vehiculos;

CREATE POLICY "Usuarios pueden ver vehiculos de su taller"
    ON vehiculos FOR SELECT
    USING (
        taller_id = (SELECT taller_id FROM perfiles WHERE id = auth.uid())
    );

CREATE POLICY "Usuarios pueden crear vehiculos en su taller"
    ON vehiculos FOR INSERT
    WITH CHECK (
        taller_id = (SELECT taller_id FROM perfiles WHERE id = auth.uid())
    );

CREATE POLICY "Usuarios pueden actualizar vehiculos de su taller"
    ON vehiculos FOR UPDATE
    USING (
        taller_id = (SELECT taller_id FROM perfiles WHERE id = auth.uid())
    );

-- ============================================
-- ACTUALIZAR POLÍTICAS RLS PARA ORDENES
-- ============================================

DROP POLICY IF EXISTS "Usuarios autenticados pueden ver ordenes" ON ordenes;
DROP POLICY IF EXISTS "Usuarios autenticados pueden crear ordenes" ON ordenes;
DROP POLICY IF EXISTS "Usuarios autenticados pueden actualizar ordenes" ON ordenes;

CREATE POLICY "Usuarios pueden ver ordenes de su taller"
    ON ordenes FOR SELECT
    USING (
        taller_id = (SELECT taller_id FROM perfiles WHERE id = auth.uid())
    );

CREATE POLICY "Usuarios pueden crear ordenes en su taller"
    ON ordenes FOR INSERT
    WITH CHECK (
        taller_id = (SELECT taller_id FROM perfiles WHERE id = auth.uid())
    );

CREATE POLICY "Usuarios pueden actualizar ordenes de su taller"
    ON ordenes FOR UPDATE
    USING (
        taller_id = (SELECT taller_id FROM perfiles WHERE id = auth.uid())
    );

-- ============================================
-- ACTUALIZAR POLÍTICAS RLS PARA CITAS
-- ============================================

-- Habilitar RLS si no está habilitado
ALTER TABLE citas ENABLE ROW LEVEL SECURITY;

-- Eliminar políticas antiguas si existen
DROP POLICY IF EXISTS "Usuarios autenticados pueden ver citas" ON citas;
DROP POLICY IF EXISTS "Usuarios autenticados pueden crear citas" ON citas;
DROP POLICY IF EXISTS "Usuarios autenticados pueden actualizar citas" ON citas;

CREATE POLICY "Usuarios pueden ver citas de su taller"
    ON citas FOR SELECT
    USING (
        taller_id = (SELECT taller_id FROM perfiles WHERE id = auth.uid())
    );

CREATE POLICY "Usuarios pueden crear citas en su taller"
    ON citas FOR INSERT
    WITH CHECK (
        taller_id = (SELECT taller_id FROM perfiles WHERE id = auth.uid())
    );

CREATE POLICY "Usuarios pueden actualizar citas de su taller"
    ON citas FOR UPDATE
    USING (
        taller_id = (SELECT taller_id FROM perfiles WHERE id = auth.uid())
    );

-- ============================================
-- COMENTARIOS
-- ============================================

COMMENT ON TABLE talleres IS 'Talleres mecánicos (multi-tenant)';
COMMENT ON COLUMN perfiles.taller_id IS 'Taller al que pertenece el usuario';
COMMENT ON COLUMN clientes.taller_id IS 'Taller al que pertenece el cliente';
COMMENT ON COLUMN vehiculos.taller_id IS 'Taller que gestiona el vehículo';
COMMENT ON COLUMN ordenes.taller_id IS 'Taller que creó la orden';
COMMENT ON COLUMN citas.taller_id IS 'Taller que gestiona la cita';

-- ============================================
-- FIN DE MIGRACIÓN
-- ============================================
