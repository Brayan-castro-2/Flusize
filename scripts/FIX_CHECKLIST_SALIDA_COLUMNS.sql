-- Add missing columns for Output Checklist
ALTER TABLE listas_chequeo 
ADD COLUMN IF NOT EXISTS detalles_salida JSONB DEFAULT NULL,
ADD COLUMN IF NOT EXISTS fotos_salida JSONB DEFAULT NULL,
ADD COLUMN IF NOT EXISTS confirmado_salida_en TIMESTAMPTZ DEFAULT NULL,
ADD COLUMN IF NOT EXISTS confirmado_salida_por UUID REFERENCES auth.users(id);

-- Optional: Create index for output confirmation
CREATE INDEX IF NOT EXISTS idx_listas_chequeo_salida ON listas_chequeo(confirmado_salida_en);
