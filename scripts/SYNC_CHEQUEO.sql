-- PROPOSITO: Sincronizar la tabla 'listas_chequeo' con el esquema V3
-- Autor: Architect Agent
-- Fecha: 2026-02-14

-- 1. Agregar columnas de Salida (Exit Checklist)
ALTER TABLE "public"."listas_chequeo" ADD COLUMN IF NOT EXISTS "detalles_salida" jsonb DEFAULT '{}'::jsonb;
ALTER TABLE "public"."listas_chequeo" ADD COLUMN IF NOT EXISTS "fotos_salida" jsonb DEFAULT '{}'::jsonb;

-- 2. Timestamps y Usuarios
ALTER TABLE "public"."listas_chequeo" ADD COLUMN IF NOT EXISTS "confirmado_salida_en" timestamptz;
ALTER TABLE "public"."listas_chequeo" ADD COLUMN IF NOT EXISTS "confirmado_salida_por" uuid REFERENCES auth.users(id);

-- 3. Revisión de Mecánico (Entrada/Proceso)
-- En la imagen V3 parece haber un timestamp para la revisión del mecánico
ALTER TABLE "public"."listas_chequeo" ADD COLUMN IF NOT EXISTS "revisado_por_mecanico" timestamptz;

-- Comentarios
COMMENT ON COLUMN "public"."listas_chequeo"."detalles_salida" IS 'Estado de items al entrega (salida)';
COMMENT ON COLUMN "public"."listas_chequeo"."revisado_por_mecanico" IS 'Fecha/Hora cuando el mecánico completó el chequeo';
