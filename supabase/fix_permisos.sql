-- Fix for Permisos Rol UI Checkboxes

-- 1. Create the permisos_rol table if it doesn't exist
CREATE TABLE IF NOT EXISTS public.permisos_rol (
  id         UUID DEFAULT gen_random_uuid() PRIMARY KEY,
  rol_id     UUID NOT NULL REFERENCES public.roles(id) ON DELETE CASCADE,
  modulo     TEXT NOT NULL,
  accion     TEXT NOT NULL,
  concedido  BOOLEAN DEFAULT false,
  -- This EXACT constraint is required for the upsert logic in page.tsx to work
  CONSTRAINT permisos_rol_rol_id_modulo_accion_key UNIQUE (rol_id, modulo, accion)
);

-- 2. Enable RLS
ALTER TABLE public.permisos_rol ENABLE ROW LEVEL SECURITY;

-- 3. Create RLS Policies for the App (Admin reading/writing)
-- Depending on your strictness, you can allow authenticated users to read/write, 
-- and let the app's FeatureGuard handle the rest, or strictly allow only admins.
CREATE POLICY "Enable read access for all users" 
  ON public.permisos_rol FOR SELECT 
  USING (true);

CREATE POLICY "Enable insert/update/delete for authenticated users" 
  ON public.permisos_rol FOR ALL 
  TO authenticated 
  USING (true);
