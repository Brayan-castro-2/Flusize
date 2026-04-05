-- =============================================
-- MIGRACIÓN: Add updated_at + trigger to flota
-- Ejecutar en: Supabase Dashboard > SQL Editor
-- =============================================

-- 1. Añadir updated_at a flota (si no existe)
ALTER TABLE flota ADD COLUMN IF NOT EXISTS updated_at TIMESTAMPTZ DEFAULT NOW();

-- 2. Añadir created_at a flota_inversiones (para mostrar hora exacta en timeline)
ALTER TABLE flota_inversiones ADD COLUMN IF NOT EXISTS created_at TIMESTAMPTZ DEFAULT NOW();

-- 3. Función genérica para auto-actualizar updated_at
CREATE OR REPLACE FUNCTION set_updated_at()
RETURNS TRIGGER AS $$
BEGIN
  NEW.updated_at = NOW();
  RETURN NEW;
END;
$$ LANGUAGE plpgsql;

-- 4. Trigger en flota (se dispara en cada UPDATE)
DROP TRIGGER IF EXISTS flota_updated_at ON flota;
CREATE TRIGGER flota_updated_at
  BEFORE UPDATE ON flota
  FOR EACH ROW EXECUTE FUNCTION set_updated_at();

-- 5. Verificar
SELECT column_name, data_type FROM information_schema.columns
WHERE table_name = 'flota' AND column_name IN ('updated_at', 'fotos', 'fotos_ingreso')
ORDER BY ordinal_position;
