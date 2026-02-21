-- PROPOSITO: Sincronización MAESTRA de Base de Datos con Esquema V3 (Imagen Objetivo)
-- Autor: Architect Agent
-- Fecha: 2026-02-14

-- ==========================================
-- 1. Tabla: VEHICULOS
-- ==========================================
ALTER TABLE "public"."vehiculos" ADD COLUMN IF NOT EXISTS "ano" int4;
ALTER TABLE "public"."vehiculos" ADD COLUMN IF NOT EXISTS "motor" text;

-- ==========================================
-- 2. Tabla: ORDENES
-- ==========================================
ALTER TABLE "public"."ordenes" ADD COLUMN IF NOT EXISTS "descripcion_ingreso" text;
ALTER TABLE "public"."ordenes" ADD COLUMN IF NOT EXISTS "creado_por" uuid REFERENCES auth.users(id);
ALTER TABLE "public"."ordenes" ADD COLUMN IF NOT EXISTS "asignado_a" uuid REFERENCES auth.users(id);
ALTER TABLE "public"."ordenes" ADD COLUMN IF NOT EXISTS "detalle_trabajos" text;
ALTER TABLE "public"."ordenes" ADD COLUMN IF NOT EXISTS "fotos_urls" text[] DEFAULT '{}';
ALTER TABLE "public"."ordenes" ADD COLUMN IF NOT EXISTS "metodo_pago" text DEFAULT 'efectivo';

COMMENT ON COLUMN "public"."ordenes"."descripcion_ingreso" IS 'Descripción (V3)';
COMMENT ON COLUMN "public"."ordenes"."detalle_trabajos" IS 'Detalle técnico (V3 match)';

-- ==========================================
-- 3. Tabla: LISTAS_CHEQUEO (Exit Checklist)
-- ==========================================
ALTER TABLE "public"."listas_chequeo" ADD COLUMN IF NOT EXISTS "detalles_salida" jsonb DEFAULT '{}'::jsonb;
ALTER TABLE "public"."listas_chequeo" ADD COLUMN IF NOT EXISTS "fotos_salida" jsonb DEFAULT '{}'::jsonb;
ALTER TABLE "public"."listas_chequeo" ADD COLUMN IF NOT EXISTS "confirmado_salida_en" timestamptz;
ALTER TABLE "public"."listas_chequeo" ADD COLUMN IF NOT EXISTS "confirmado_salida_por" uuid REFERENCES auth.users(id);

-- En la imagen V3 parece haber timestamps adicionales
ALTER TABLE "public"."listas_chequeo" ADD COLUMN IF NOT EXISTS "revisado_por_mecanico" timestamptz;

COMMENT ON COLUMN "public"."listas_chequeo"."detalles_salida" IS 'Estado de items de salida (V3)';
