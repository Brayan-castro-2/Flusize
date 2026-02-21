-- FIX: Relaciones Ambiguas y Faltantes (FINAL)

-- 1. SOLUCIONAR AMBIGÜEDAD EN ORDENES (Error PGRST201)
-- Causado por tener dos caminos hacia vehículos: 'patente_vehiculo' (Correcto V3) y probablemente 'vehiculo_id' (Viejo).
-- Intentamos borrar la FK vieja. Si no existe, no pasa nada.
ALTER TABLE "public"."ordenes" 
DROP CONSTRAINT IF EXISTS "ordenes_vehiculo_id_fkey";

-- También intentamos borrar la columna vieja si existe, para limpiar, 
-- pero solo si estás seguro de que no la usas. Por seguridad solo borramos la FK.
-- ALTER TABLE "public"."ordenes" DROP COLUMN IF EXISTS "vehiculo_id";

-- 2. SOLUCIONAR FALTA DE RELACIÓN EN CITAS (Error PGRST200)
-- La tabla citas no sabe cómo conectarse con vehiculos.
-- Agregamos la columna 'patente_vehiculo' si no existe y la FK.

ALTER TABLE "public"."citas" 
ADD COLUMN IF NOT EXISTS "patente_vehiculo" text;

-- Si ya existía pero sin FK, o si la acabamos de crear, le ponemos la FK.
-- Primero borramos FK vieja si existiera para recrearla limpia
ALTER TABLE "public"."citas" DROP CONSTRAINT IF EXISTS "citas_patente_vehiculo_fkey";

ALTER TABLE "public"."citas"
ADD CONSTRAINT "citas_patente_vehiculo_fkey"
FOREIGN KEY ("patente_vehiculo") REFERENCES "public"."vehiculos"("patente");

-- Comentarios
COMMENT ON CONSTRAINT "citas_patente_vehiculo_fkey" ON "public"."citas" IS 'Relación V3 Citas -> Vehiculos por Patente';
