-- FIX: Permisos RLS para listas_chequeo
-- El error 403 indica que no tienes permiso para insertar o actualizar en esta tabla.

-- 1. Habilitar RLS (por si acaso no está)
ALTER TABLE "public"."listas_chequeo" ENABLE ROW LEVEL SECURITY;

-- 2. Crear política para permitir TODO a usuarios autenticados (o anon si es necesario para demo)
-- Borrar políticas viejas si existen
DROP POLICY IF EXISTS "Enable all for authenticated users" ON "public"."listas_chequeo";
DROP POLICY IF EXISTS "Permitir todo a usuarios" ON "public"."listas_chequeo";

-- Crear nueva política permisiva
CREATE POLICY "Permitir todo a usuarios autenticados"
ON "public"."listas_chequeo"
FOR ALL
USING (auth.role() = 'authenticated')
WITH CHECK (auth.role() = 'authenticated');

-- 3. También asegurar permisos en el bucket de storage 'checklist-images' si se usa
-- Esto es opcional, pero si el 403 viene de fotos, esto ayuda.
INSERT INTO storage.buckets (id, name, public) 
VALUES ('checklist-images', 'checklist-images', true)
ON CONFLICT (id) DO NOTHING;

CREATE POLICY "Public Access Checklist Images"
ON storage.objects FOR SELECT
USING ( bucket_id = 'checklist-images' );

CREATE POLICY "Auth Upload Checklist Images"
ON storage.objects FOR INSERT
WITH CHECK ( bucket_id = 'checklist-images' AND auth.role() = 'authenticated' );
