-- Add technical notes columns to the flota table
ALTER TABLE flota 
ADD COLUMN IF NOT EXISTS notas_ingreso TEXT,
ADD COLUMN IF NOT EXISTS notas_reparacion TEXT,
ADD COLUMN IF NOT EXISTS notas_finalizado TEXT;

-- Update updated_at trigger if it exists (assuming it does based on previous metadata)
-- If not, it's just extra safety.
