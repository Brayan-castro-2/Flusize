-- FIX CITAS STRUCTURE V6
-- Basado en tu esquema actual y el código:
-- 1. Citas NO TIENE 'cliente_id', pero el código lo usa e intenta guardar ahí.
-- 2. Citas necesita relación directa con Clientes para 'obtenerCitasHoy'.

-- Agregar columna cliente_id
ALTER TABLE "public"."citas" 
ADD COLUMN IF NOT EXISTS "cliente_id" uuid;

-- Crear relación citas -> clientes
ALTER TABLE "public"."citas" 
DROP CONSTRAINT IF EXISTS "citas_cliente_id_fkey";

ALTER TABLE "public"."citas"
ADD CONSTRAINT "citas_cliente_id_fkey"
FOREIGN KEY ("cliente_id") REFERENCES "public"."clientes"("id");

-- Crear índice para búsquedas rápidas
CREATE INDEX IF NOT EXISTS "idx_citas_cliente" ON "public"."citas" ("cliente_id");

-- COMENTARIOS DE AYUDA
-- Al correr esto, 'obtenerCitasHoy' dejará de fallar al buscar clientes.
