-- REPARACION DE COLUMNAS PRINCIPALES (CORE)
-- Al parecer tu tabla 'ordenes' no tiene ni siquiera las columnas básicas de relación.
-- Este script las crea.

-- 1. Patente del Vehículo (FK a vehiculos.patente)
ALTER TABLE "public"."ordenes" 
ADD COLUMN IF NOT EXISTS "patente_vehiculo" text REFERENCES "public"."vehiculos"("patente");

-- 2. Taller ID (FK a talleres.id)
ALTER TABLE "public"."ordenes" 
ADD COLUMN IF NOT EXISTS "taller_id" uuid REFERENCES "public"."talleres"("id");

-- 3. Asegurar que existan indices para rendimiento (opcional pero recomendado)
CREATE INDEX IF NOT EXISTS "idx_ordenes_patente" ON "public"."ordenes" ("patente_vehiculo");
CREATE INDEX IF NOT EXISTS "idx_ordenes_taller" ON "public"."ordenes" ("taller_id");

-- Comentarios
COMMENT ON COLUMN "public"."ordenes"."patente_vehiculo" IS 'Patente del vehículo (Relación V3)';
COMMENT ON COLUMN "public"."ordenes"."taller_id" IS 'ID del taller (Multi-tenant)';
