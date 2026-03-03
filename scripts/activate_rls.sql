-- ACTIVE MULTI-TENANCY RLS
-- Habilita RLS en las tablas núcleo
ALTER TABLE public.perfiles ENABLE ROW LEVEL SECURITY;
ALTER TABLE public.ordenes ENABLE ROW LEVEL SECURITY;
ALTER TABLE public.vehiculos ENABLE ROW LEVEL SECURITY;
ALTER TABLE public.clientes ENABLE ROW LEVEL SECURITY;
ALTER TABLE public.citas ENABLE ROW LEVEL SECURITY;

-- 1. Políticas para PERFILES (Evitando recursión infinita)
DROP POLICY IF EXISTS "Perfiles: Los usuarios ven su propio perfil y el de su taller" ON public.perfiles;
CREATE POLICY "Perfiles: Los usuarios ven su propio perfil y el de su taller" 
ON public.perfiles FOR ALL 
USING (
  id = auth.uid() OR 
  taller_id = (SELECT taller_id FROM public.perfiles WHERE id = auth.uid())
);

-- 2. Políticas para ÓRDENES
DROP POLICY IF EXISTS "Ordenes: Aislamiento por taller_id" ON public.ordenes;
CREATE POLICY "Ordenes: Aislamiento por taller_id" 
ON public.ordenes FOR ALL 
USING (
  taller_id = (SELECT taller_id FROM public.perfiles WHERE id = auth.uid())
);

-- 3. Políticas para VEHÍCULOS
DROP POLICY IF EXISTS "Vehiculos: Aislamiento por taller_id" ON public.vehiculos;
CREATE POLICY "Vehiculos: Aislamiento por taller_id" 
ON public.vehiculos FOR ALL 
USING (
  taller_id = (SELECT taller_id FROM public.perfiles WHERE id = auth.uid())
);

-- 4. Políticas para CLIENTES
DROP POLICY IF EXISTS "Clientes: Aislamiento por taller_id" ON public.clientes;
CREATE POLICY "Clientes: Aislamiento por taller_id" 
ON public.clientes FOR ALL 
USING (
  taller_id = (SELECT taller_id FROM public.perfiles WHERE id = auth.uid())
);

-- 5. Políticas para CITAS
DROP POLICY IF EXISTS "Citas: Aislamiento por taller_id" ON public.citas;
CREATE POLICY "Citas: Aislamiento por taller_id" 
ON public.citas FOR ALL 
USING (
  taller_id = (SELECT taller_id FROM public.perfiles WHERE id = auth.uid())
);

-- Habilitar acceso de lectura a tabla talleres para todos los autenticados (necesario para logos/nombres)
ALTER TABLE public.talleres ENABLE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "Talleres: Lectura permitida para miembros" ON public.talleres;
CREATE POLICY "Talleres: Lectura permitida para miembros" 
ON public.talleres FOR SELECT 
USING (
  id = (SELECT taller_id FROM public.perfiles WHERE id = auth.uid())
);
