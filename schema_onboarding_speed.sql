-- Optimización de fuse_account_by_phone para evitar Full Table Scans
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

    -- Escenario 2: Nos dieron el teléfono.
    -- Búsqueda exacta primero, que usa el índice BTREE (Rápido).
    -- El LIKE '%...' hace un salto secuencial catastrófico de lectura.
    UPDATE public.clientes 
    SET perfil_global_id = auth_user_id 
    WHERE telefono = user_phone;
    
    RETURN TRUE;
END;
$$ LANGUAGE plpgsql SECURITY DEFINER;
