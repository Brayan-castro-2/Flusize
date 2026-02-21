-- FIX DATABASE FULL V5 (Acumulativo)
-- Ejecuta este script y asegúrate de ver el mensaje "Success" o "No rows returned" en verde.

-- ==========================================
-- 1. TABLA CITAS (Arreglar Citas)
-- ==========================================

-- Agregar columnas faltantes (Si ya existen no hace nada)
ALTER TABLE "public"."citas" ADD COLUMN IF NOT EXISTS "fecha_inicio" timestamp with time zone;
ALTER TABLE "public"."citas" ADD COLUMN IF NOT EXISTS "fecha_fin" timestamp with time zone;
ALTER TABLE "public"."citas" ADD COLUMN IF NOT EXISTS "estado" text DEFAULT 'pendiente';
ALTER TABLE "public"."citas" ADD COLUMN IF NOT EXISTS "titulo" text;
ALTER TABLE "public"."citas" ADD COLUMN IF NOT EXISTS "patente_vehiculo" text;

-- Borrar relaciones viejas/rotas de Citas
ALTER TABLE "public"."citas" DROP CONSTRAINT IF EXISTS "citas_vehiculo_id_fkey";
ALTER TABLE "public"."citas" DROP COLUMN IF EXISTS "vehiculo_id";

-- Crear relación correcta Citas -> Vehiculos (Por Patente)
-- Primero borramos por si existe con otro nombre
ALTER TABLE "public"."citas" DROP CONSTRAINT IF EXISTS "citas_patente_vehiculo_fkey";

ALTER TABLE "public"."citas"
ADD CONSTRAINT "citas_patente_vehiculo_fkey"
FOREIGN KEY ("patente_vehiculo") REFERENCES "public"."vehiculos"("patente");


-- ==========================================
-- 2. TABLA ORDENES (Arreglar Ordenes)
-- ==========================================

-- Limpieza preventiva de columna confusa
ALTER TABLE "public"."ordenes" DROP COLUMN IF EXISTS "vehiculo_id";

-- Asegurar columna patente_vehiculo y su relación
ALTER TABLE "public"."ordenes" ADD COLUMN IF NOT EXISTS "patente_vehiculo" text;

ALTER TABLE "public"."ordenes" DROP CONSTRAINT IF EXISTS "ordenes_patente_vehiculo_fkey";
ALTER TABLE "public"."ordenes"
ADD CONSTRAINT "ordenes_patente_vehiculo_fkey"
FOREIGN KEY ("patente_vehiculo") REFERENCES "public"."vehiculos"("patente");

-- Asegurar relación con Clientes (Posible causa de error "Object")
ALTER TABLE "public"."ordenes" ADD COLUMN IF NOT EXISTS "cliente_id" uuid;

ALTER TABLE "public"."ordenes" DROP CONSTRAINT IF EXISTS "ordenes_cliente_id_fkey";
ALTER TABLE "public"."ordenes"
ADD CONSTRAINT "ordenes_cliente_id_fkey"
FOREIGN KEY ("cliente_id") REFERENCES "public"."clientes"("id");

-----------------------------------------------------------
-- Habilitar RLS en Citas por si acaso
ALTER TABLE "public"."citas" ENABLE ROW LEVEL SECURITY;

CREATE POLICY "Permitir todo citas auth" ON "public"."citas"
FOR ALL USING (auth.role() = 'authenticated') WITH CHECK (auth.role() = 'authenticated');
