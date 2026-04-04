-- =============================================
-- MIGRACIÓN: Tabla contratos con flujo completo
-- Ejecutar en: Supabase Dashboard > SQL Editor
-- =============================================

-- Agregar columnas faltantes a tabla contratos
ALTER TABLE contratos ADD COLUMN IF NOT EXISTS tipo TEXT DEFAULT 'venta';
ALTER TABLE contratos ADD COLUMN IF NOT EXISTS estado TEXT DEFAULT 'pendiente_firma';
ALTER TABLE contratos ADD COLUMN IF NOT EXISTS taller_id TEXT;
ALTER TABLE contratos ADD COLUMN IF NOT EXISTS orden_id TEXT;
ALTER TABLE contratos ADD COLUMN IF NOT EXISTS vehiculo_flota_id TEXT;
ALTER TABLE contratos ADD COLUMN IF NOT EXISTS vehiculo_patente TEXT;
ALTER TABLE contratos ADD COLUMN IF NOT EXISTS vehiculo_marca TEXT;
ALTER TABLE contratos ADD COLUMN IF NOT EXISTS vehiculo_modelo TEXT;
ALTER TABLE contratos ADD COLUMN IF NOT EXISTS vehiculo_color TEXT;
ALTER TABLE contratos ADD COLUMN IF NOT EXISTS vehiculo_anio TEXT;
ALTER TABLE contratos ADD COLUMN IF NOT EXISTS vehiculo_motor TEXT;
ALTER TABLE contratos ADD COLUMN IF NOT EXISTS cliente_nombre TEXT;
ALTER TABLE contratos ADD COLUMN IF NOT EXISTS cliente_rut TEXT;
ALTER TABLE contratos ADD COLUMN IF NOT EXISTS cliente_domicilio TEXT;
ALTER TABLE contratos ADD COLUMN IF NOT EXISTS cliente_telefono TEXT;
ALTER TABLE contratos ADD COLUMN IF NOT EXISTS precio_total NUMERIC DEFAULT 0;
ALTER TABLE contratos ADD COLUMN IF NOT EXISTS pie_pagado NUMERIC DEFAULT 0;
ALTER TABLE contratos ADD COLUMN IF NOT EXISTS saldo_pendiente NUMERIC DEFAULT 0;
ALTER TABLE contratos ADD COLUMN IF NOT EXISTS precio_dia NUMERIC DEFAULT 0;
ALTER TABLE contratos ADD COLUMN IF NOT EXISTS fecha_salida DATE;
ALTER TABLE contratos ADD COLUMN IF NOT EXISTS fecha_retorno DATE;
ALTER TABLE contratos ADD COLUMN IF NOT EXISTS dias INTEGER DEFAULT 0;
ALTER TABLE contratos ADD COLUMN IF NOT EXISTS notas TEXT;
ALTER TABLE contratos ADD COLUMN IF NOT EXISTS firma_base64 TEXT;
ALTER TABLE contratos ADD COLUMN IF NOT EXISTS firmado_en TIMESTAMPTZ;
ALTER TABLE contratos ADD COLUMN IF NOT EXISTS ip_cliente TEXT;
ALTER TABLE contratos ADD COLUMN IF NOT EXISTS creado_por TEXT;
ALTER TABLE contratos ADD COLUMN IF NOT EXISTS creado_en TIMESTAMPTZ DEFAULT NOW();
ALTER TABLE contratos ADD COLUMN IF NOT EXISTS actualizado_en TIMESTAMPTZ DEFAULT NOW();

-- Habilitar RLS (si no está habilitada)
ALTER TABLE contratos ENABLE ROW LEVEL SECURITY;

-- Política permisiva para desarrollo (ajustar en producción)
DROP POLICY IF EXISTS "allow_all_contratos" ON contratos;
CREATE POLICY "allow_all_contratos" ON contratos FOR ALL USING (true) WITH CHECK (true);

-- Verificar
SELECT column_name, data_type FROM information_schema.columns 
WHERE table_name = 'contratos' ORDER BY ordinal_position;
