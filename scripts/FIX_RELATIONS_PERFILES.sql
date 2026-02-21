-- FIX: Restaurar Relaciones con Perfiles (Error PGRST200 actual)
-- La aplicación falla porque no sabe cómo unir Ordenes con Perfiles (Mecánicos/Admin).

-- 1. Relación 'creado_por' -> Perfiles
ALTER TABLE "public"."ordenes" 
DROP CONSTRAINT IF EXISTS "ordenes_creado_por_fkey";

ALTER TABLE "public"."ordenes"
ADD CONSTRAINT "ordenes_creado_por_fkey"
FOREIGN KEY ("creado_por") REFERENCES "public"."perfiles"("id");

-- 2. Relación 'asignado_a' -> Perfiles
ALTER TABLE "public"."ordenes" 
DROP CONSTRAINT IF EXISTS "ordenes_asignado_a_fkey";

ALTER TABLE "public"."ordenes"
ADD CONSTRAINT "ordenes_asignado_a_fkey"
FOREIGN KEY ("asignado_a") REFERENCES "public"."perfiles"("id");

-- 3. Asegurar tipos UUID (Por si acaso)
-- ALTER TABLE "public"."ordenes" ALTER COLUMN "creado_por" TYPE uuid USING "creado_por"::uuid;
-- ALTER TABLE "public"."ordenes" ALTER COLUMN "asignado_a" TYPE uuid USING "asignado_a"::uuid;

COMMENT ON CONSTRAINT "ordenes_creado_por_fkey" ON "public"."ordenes" IS 'Relación creador de la orden';
COMMENT ON CONSTRAINT "ordenes_asignado_a_fkey" ON "public"."ordenes" IS 'Relación mecánico asignado';
