-- FIX: Cambiar orden_id de INT8 (BigInt) a UUID en listas_chequeo
-- El error 22P02 indica que se está tratando de guardar un UUID en una columna numérica.

-- 1. Primero, necesitamos eliminar la restricción de clave foránea si existe (para poder cambiar el tipo)
ALTER TABLE "public"."listas_chequeo" DROP CONSTRAINT IF EXISTS "listas_chequeo_orden_id_fkey";

-- 2. Cambiar el tipo de columna.
-- Como no podemos convertir automaticamnete de int a uuid, si la tabla tiene datos antiguos con IDs numéricos, esto fallará.
-- Asumiremos que si estás en V3, quieres borrar los datos viejos o que la tabla está vacía/irrelevante.
-- Opción A: Borrar datos viejos incompatibles (Más seguro para desarrollo)
DELETE FROM "public"."listas_chequeo" WHERE "orden_id"::text !~ '^[0-9a-f]{8}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{12}$';

-- 3. Ahora cambiamos la columna a UUID
ALTER TABLE "public"."listas_chequeo" 
ALTER COLUMN "orden_id" TYPE uuid USING "orden_id"::text::uuid;

-- 4. Volver a crear la FK apuntando a la tabla ordenes (que ya debe ser UUID)
ALTER TABLE "public"."listas_chequeo"
ADD CONSTRAINT "listas_chequeo_orden_id_fkey"
FOREIGN KEY ("orden_id") REFERENCES "public"."ordenes"("id");

-- Comentarios
COMMENT ON COLUMN "public"."listas_chequeo"."orden_id" IS 'Referencia a Orden (UUID V3)';
