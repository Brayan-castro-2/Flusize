-- ==========================================
-- FASE 1: BITÁCORA DE EVIDENCIA (TRANSPARENCIA)
-- ==========================================

-- 1. Tabla para evidencias fotográficas
CREATE TABLE IF NOT EXISTS "public"."evidencia_orden" (
    "id" UUID DEFAULT gen_random_uuid() PRIMARY KEY,
    "orden_id" INTEGER NOT NULL REFERENCES "public"."ordenes"("id") ON DELETE CASCADE,
    "url_foto" TEXT NOT NULL,
    "etiqueta" VARCHAR(50) CHECK (etiqueta IN ('pieza_vieja', 'repuesto_nuevo', 'boleta', 'instalado', 'otro', 'video')),
    "descripcion" TEXT,
    "subido_por" UUID REFERENCES "public"."perfiles"("id"),
    "creado_en" TIMESTAMP WITH TIME ZONE DEFAULT NOW()
);

-- 2. Índices para performance
CREATE INDEX IF NOT EXISTS "idx_evidencia_orden_orden_id" ON "public"."evidencia_orden"("orden_id");

-- 3. Habilitar RLS
ALTER TABLE "public"."evidencia_orden" ENABLE ROW LEVEL SECURITY;

-- 4. Políticas RLS
-- Permitir lectura pública (para que el cliente vea la evidencia sin login)
CREATE POLICY "Lectura pública de evidencia" ON "public"."evidencia_orden"
FOR SELECT USING (true);

-- Permitir inserción solo a usuarios autenticados del taller (o admin)
-- (Simplificado: cualquier usuario autenticado puede subir por ahora, idealmente filtrar por taller_id de la orden)
CREATE POLICY "Escribir evidencia autenticado" ON "public"."evidencia_orden"
FOR INSERT WITH CHECK (auth.role() = 'authenticated');

CREATE POLICY "Modificar evidencia propia" ON "public"."evidencia_orden"
FOR UPDATE USING (auth.uid() = subido_por);

CREATE POLICY "Borrar evidencia propia" ON "public"."evidencia_orden"
FOR DELETE USING (auth.uid() = subido_por);

-- 5. Comentarios
COMMENT ON TABLE "public"."evidencia_orden" IS 'Fotos y videos de evidencia para el cliente (Transparencia)';
COMMENT ON COLUMN "public"."evidencia_orden"."etiqueta" IS 'Categoría de la evidencia (pieza_vieja, repuesto_nuevo, etc.)';
