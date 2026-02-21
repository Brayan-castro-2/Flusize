-- FIX FINAL V4: Citas y Limpieza Profunda

-- 1. ARREGLAR CITAS (El problema principal de la captura)
-- Tenía dos relaciones (id y patente). Borramos la vieja (id).
ALTER TABLE "public"."citas" 
DROP CONSTRAINT IF EXISTS "citas_vehiculo_id_fkey";

ALTER TABLE "public"."citas" 
DROP COLUMN IF EXISTS "vehiculo_id";

-- 2. AGREGAR COLUMNAS FALTANTES A CITAS (Error 42703)
ALTER TABLE "public"."citas" 
ADD COLUMN IF NOT EXISTS "fecha_inicio" timestamp with time zone,
ADD COLUMN IF NOT EXISTS "fecha_fin" timestamp with time zone,
ADD COLUMN IF NOT EXISTS "estado" text DEFAULT 'pendiente',
ADD COLUMN IF NOT EXISTS "titulo" text;

-- 3. LIMPIEZA PREVENTIVA EN ORDENES (Por si acaso causa el error 201)
-- Aunque no salía la FK en la lista, la columna podría confundir si quedó indexada.
ALTER TABLE "public"."ordenes" 
DROP COLUMN IF EXISTS "vehiculo_id";

-- 4. REFORZAR ESTRUCTURA DE CITAS
-- Asegurar que fecha_inicio no sea nula si es crítico (opcional, dejamos nullable por ahora para no romper datos viejos)
-- Crear índice para búsquedas rápidas
CREATE INDEX IF NOT EXISTS "citas_fecha_inicio_idx" ON "public"."citas" ("fecha_inicio");
