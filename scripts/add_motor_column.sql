-- Agregar columna 'motor' a la tabla 'vehiculos' si no existe
ALTER TABLE "public"."vehiculos" 
ADD COLUMN IF NOT EXISTS "motor" text;

-- (Opcional) Comentario para documentación
COMMENT ON COLUMN "public"."vehiculos"."motor" IS 'Detalle del motor del vehículo (cilindrada, tipo, etc)';
