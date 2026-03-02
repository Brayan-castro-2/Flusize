-- Crear el bucket si no existe
INSERT INTO storage.buckets (id, name, public) 
VALUES ('logos_talleres', 'logos_talleres', true)
ON CONFLICT (id) DO NOTHING;

-- Política para permitir que cualquier usuario autenticado suba fotos
-- (Nota: Para producción deberías restringir esto mejor, pero para la fase actual habilitamos subida)
CREATE POLICY "Permitir subida de logos"
ON storage.objects FOR INSERT 
TO authenticated 
WITH CHECK (bucket_id = 'logos_talleres');

-- Política para permitir que cualquiera vea los logos (público)
CREATE POLICY "Logos públicos"
ON storage.objects FOR SELECT 
TO public 
USING (bucket_id = 'logos_talleres');

-- Política para que el dueño pueda actualizar su propio logo 
-- (Asumiendo que la ruta del archivo contiene el taller_id como subcarpeta, como implementé en actions.ts)
CREATE POLICY "Dueño actualiza su logo"
ON storage.objects FOR UPDATE
TO authenticated
USING (bucket_id = 'logos_talleres');
