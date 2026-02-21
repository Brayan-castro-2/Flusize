
-- FIX: Permisos RLS para tabla 'ordenes'
-- El error de que no actualiza nada (0 rows) suele ser por RLS bloqueando el UPDATE.

-- 1. Habilitar RLS (por seguridad y consistencia)
ALTER TABLE "public"."ordenes" ENABLE ROW LEVEL SECURITY;

-- 2. Limpiar políticas antiguas para evitar conflictos
DROP POLICY IF EXISTS "Permitir todo a usuarios autenticados ordenes" ON "public"."ordenes";
DROP POLICY IF EXISTS "Enable all for authenticated users" ON "public"."ordenes";
DROP POLICY IF EXISTS "Users can update their own content" ON "public"."ordenes";

-- 3. Crear política permisiva para usuarios autenticados (Mecánicos/Admins)
-- Se permite SELECT, INSERT, UPDATE, DELETE si el usuario está logueado.
CREATE POLICY "Permitir todo a usuarios autenticados ordenes"
ON "public"."ordenes"
FOR ALL
USING (auth.role() = 'authenticated')
WITH CHECK (auth.role() = 'authenticated');

-- 4. Asegurar owner de la tabla (opcional, pero ayuda)
ALTER TABLE "public"."ordenes" OWNER TO postgres;
GRANT ALL ON TABLE "public"."ordenes" TO postgres;
GRANT ALL ON TABLE "public"."ordenes" TO anon;
GRANT ALL ON TABLE "public"."ordenes" TO authenticated;
GRANT ALL ON TABLE "public"."ordenes" TO service_role;
