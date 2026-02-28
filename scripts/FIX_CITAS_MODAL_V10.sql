-- ===========================================================
-- MICRO-FASE 10: Fix Citas Modal - Ejecutar en Supabase SQL Editor
-- ===========================================================
-- Este script elimina el constraint FK que bloqueaba inserts de citas
-- con patentes de vehículos que aún no están en la BD, y agrega
-- las columnas que usa el modal de Nueva Cita.

-- 1. Quitar el FK constraint que causaba el error 406
--    (Una cita puede ser para un vehículo nuevo que aún no está en vehiculos)
ALTER TABLE "public"."citas" DROP CONSTRAINT IF EXISTS "citas_patente_vehiculo_fkey";

-- 2. Agregar columnas que usa el AppointmentModal
ALTER TABLE "public"."citas" ADD COLUMN IF NOT EXISTS "cliente_nombre"      text;
ALTER TABLE "public"."citas" ADD COLUMN IF NOT EXISTS "cliente_telefono"    text;
ALTER TABLE "public"."citas" ADD COLUMN IF NOT EXISTS "servicio_solicitado" text;
ALTER TABLE "public"."citas" ADD COLUMN IF NOT EXISTS "titulo"              text;
ALTER TABLE "public"."citas" ADD COLUMN IF NOT EXISTS "fecha_inicio"        timestamp with time zone;
ALTER TABLE "public"."citas" ADD COLUMN IF NOT EXISTS "fecha_fin"           timestamp with time zone;
ALTER TABLE "public"."citas" ADD COLUMN IF NOT EXISTS "fecha"               text;
ALTER TABLE "public"."citas" ADD COLUMN IF NOT EXISTS "creado_por"          text;
ALTER TABLE "public"."citas" ADD COLUMN IF NOT EXISTS "cliente_id"          uuid;

-- 3. Verificar que funcionó
SELECT column_name, data_type 
FROM information_schema.columns 
WHERE table_name = 'citas' 
  AND table_schema = 'public'
ORDER BY ordinal_position;
