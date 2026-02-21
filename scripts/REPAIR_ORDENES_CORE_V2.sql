-- REPARACION DE COLUMNAS CORE V2 (Corregido)
-- El error anterior ocurrió porque 'patente' en vehiculos no era UNICA.

-- 1. Primero, aseguramos que la patente sea ÚNICA en la tabla vehículos
-- Si falla aquí es porque tienes vehiculos con la misma patente duplicada.
ALTER TABLE "public"."vehiculos" 
ADD CONSTRAINT "vehiculos_patente_key" UNIQUE ("patente");

-- 2. Ahora sí podemos crear la columna en ordenes referenciando a patente
ALTER TABLE "public"."ordenes" 
ADD COLUMN IF NOT EXISTS "patente_vehiculo" text REFERENCES "public"."vehiculos"("patente");

-- 3. Taller ID (FK a talleres.id)
ALTER TABLE "public"."ordenes" 
ADD COLUMN IF NOT EXISTS "taller_id" uuid REFERENCES "public"."talleres"("id");

-- Índices
CREATE INDEX IF NOT EXISTS "idx_ordenes_patente" ON "public"."ordenes" ("patente_vehiculo");
CREATE INDEX IF NOT EXISTS "idx_ordenes_taller" ON "public"."ordenes" ("taller_id");
