-- =========================================================================
-- ACCOUNT CLAIMING & ONBOARDING B2C (V3 FIX)
-- ⚠️ IMPORTANTE: Ejecuta este script manualmente en el SQL Editor de Supabase
-- =========================================================================

-- 1. SOLUCIÓN AL ERROR FOREIGN KEY (Insertar usuarios en la tabla correcta)
-- -------------------------------------------------------------------------
-- Forzamos la creación del perfil global para todos los usuarios actuales
-- (Esto arreglará la cuenta con la que estabas probando ahora mismo)
INSERT INTO public.perfiles_globales (id, email, nombre_completo, saldo_puntos, es_super_admin)
SELECT id, email, COALESCE(raw_user_meta_data->>'full_name', 'Conductor VIP'), 0, false
FROM auth.users
WHERE id NOT IN (SELECT id FROM public.perfiles_globales)
ON CONFLICT (id) DO NOTHING;


-- 2. NUEVO TRIGGER PARA LA CREACIÓN DEL PERFIL GLOBAL
-- -------------------------------------------------------------------------
-- Asegura que los próximos usuarios que se registren reciban su Perfil Global y no caigan en error
CREATE OR REPLACE FUNCTION public.handle_new_user()
RETURNS TRIGGER AS $$
BEGIN
    INSERT INTO public.perfiles_globales (id, email, nombre_completo, saldo_puntos, es_super_admin)
    VALUES (
        NEW.id, 
        NEW.email, 
        COALESCE(NEW.raw_user_meta_data->>'full_name', 'Nuevo Conductor'), 
        0, 
        false
    )
    ON CONFLICT (id) DO NOTHING;
    RETURN NEW;
END;
$$ LANGUAGE plpgsql SECURITY DEFINER;

DROP TRIGGER IF EXISTS on_auth_user_created ON auth.users;

CREATE TRIGGER on_auth_user_created
    AFTER INSERT ON auth.users
    FOR EACH ROW EXECUTE FUNCTION public.handle_new_user();


-- 3. FUNCION RPC CORREGIDA PARA V3 (Fusión Manual por Teléfono)
-- -------------------------------------------------------------------------
-- Esto apunta el perfil global_id a la tabla de Clientes en lugar de Perfiles, respetando el nuevo esquema.
CREATE OR REPLACE FUNCTION public.fuse_account_by_phone(user_phone TEXT, claim_id_param UUID DEFAULT NULL)
RETURNS boolean AS $$
DECLARE
    auth_user_id UUID;
    v_cliente_id UUID;
BEGIN
    auth_user_id := auth.uid();
    IF auth_user_id IS NULL THEN
        RAISE EXCEPTION 'Usuario no autenticado';
    END IF;

    -- Escenario 1: Frontend nos pasó el ID de rastreo
    IF claim_id_param IS NOT NULL THEN
        -- Encontramos al cliente que es dueño de esa orden o vehículo
        SELECT cliente_id INTO v_cliente_id FROM public.ordenes WHERE id = claim_id_param LIMIT 1;
        
        IF v_cliente_id IS NULL THEN
            SELECT cliente_id INTO v_cliente_id FROM public.vehiculos WHERE id = claim_id_param LIMIT 1;
        END IF;

        IF v_cliente_id IS NOT NULL THEN
            UPDATE public.clientes 
            SET perfil_global_id = auth_user_id 
            WHERE id = v_cliente_id;
            RETURN TRUE;
        END IF;
    END IF;

    -- Escenario 2: Sólo nos dieron el teléfono
    -- Normalizamos el teléfono para evitar problemas de formato al buscar
    UPDATE public.clientes 
    SET perfil_global_id = auth_user_id 
    WHERE telefono = user_phone OR telefono LIKE '%' || user_phone || '%';
    
    RETURN TRUE;
END;
$$ LANGUAGE plpgsql SECURITY DEFINER;
