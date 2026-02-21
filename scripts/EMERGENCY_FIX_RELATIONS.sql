-- 🚨 EMERGENCY FIX FOR PGRST200 ERRORS 🚨
-- Este script restaura las relaciones perdidas que causan que el Dashboard aparezca vacío.

-- 1. Asegurar que la patente sea Única en la tabla vehiculos (Requisito para FK)
ALTER TABLE public.vehiculos 
ADD CONSTRAINT vehiculos_patente_key UNIQUE (patente);

-- 2. Restaurar FK Ordenes -> Vehiculos (por Patente)
-- Esta es la que falta en tu definición actual y causa el error en "obtenerOrdenesLight"
DO $$ 
BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_constraint WHERE conname = 'ordenes_patente_vehiculo_fkey') THEN
        ALTER TABLE public.ordenes
        ADD CONSTRAINT ordenes_patente_vehiculo_fkey
        FOREIGN KEY (patente_vehiculo) REFERENCES public.vehiculos (patente)
        ON UPDATE CASCADE;
    END IF;
END $$;

-- 3. Restaurar FK Citas -> Vehiculos (por Patente)
DO $$ 
BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_constraint WHERE conname = 'citas_patente_vehiculo_fkey') THEN
        ALTER TABLE public.citas
        ADD CONSTRAINT citas_patente_vehiculo_fkey
        FOREIGN KEY (patente_vehiculo) REFERENCES public.vehiculos (patente)
        ON UPDATE CASCADE;
    END IF;
END $$;

-- 4. Restaurar FK Citas -> Clientes
DO $$ 
BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_constraint WHERE conname = 'citas_cliente_id_fkey') THEN
        ALTER TABLE public.citas
        ADD CONSTRAINT citas_cliente_id_fkey
        FOREIGN KEY (cliente_id) REFERENCES public.clientes (id)
        ON UPDATE CASCADE;
    END IF;
END $$;

-- 5. Recargar caché de esquema (Esto suele ser automático, pero verifica en Supabase -> API Settings)
NOTIFY pgrst, 'reload config';
