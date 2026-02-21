-- Agregar columna 'asignado_a' a la tabla 'ordenes' si no existe
ALTER TABLE "public"."ordenes" 
ADD COLUMN IF NOT EXISTS "asignado_a" uuid REFERENCES auth.users(id);

-- (Opcional) Comentario para documentación
COMMENT ON COLUMN "public"."ordenes"."asignado_a" IS 'Usuario al que se le asigna la orden (mencionado en el código)';
