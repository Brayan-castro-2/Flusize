DO $$
DECLARE
    v_admin_uid UUID := 'b6b52060-b3dd-4c48-8747-7d12c6326bd4';
    v_mecanico_uid UUID := 'b569d364-ef44-430e-8afb-875e9eb717b4';
    v_taller_id UUID;
BEGIN
    -- 1. Asegurar Taller Demo (Local)
    -- Intentamos insertar, si existe (por RUT) recuperamos el ID
    INSERT INTO public.talleres (nombre, rut, direccion, email, activo)
    VALUES ('Taller Demo', '77.777.777-K', 'Calle Falsa 123', 'contacto@taller.demo', true)
    ON CONFLICT (rut) DO UPDATE SET activo = true
    RETURNING id INTO v_taller_id;

    -- Si no retornó ID (porque on conflict do update no siempre retorna si no cambia o si postgres version vieja), lo buscamos
    IF v_taller_id IS NULL THEN
        SELECT id INTO v_taller_id FROM public.talleres WHERE rut = '77.777.777-K';
    END IF;

    -- 2. Insertar Perfiles Globales (Hub)
    INSERT INTO public.perfiles_globales (id, email, nombre_completo, es_super_admin, saldo_puntos)
    VALUES 
    (v_admin_uid, 'admin@taller.demo', 'Admin Global', true, 100),
    (v_mecanico_uid, 'mecanico@taller.demo', 'Mecánico Global', false, 0)
    ON CONFLICT (id) DO UPDATE SET 
        email = EXCLUDED.email,
        nombre_completo = EXCLUDED.nombre_completo,
        es_super_admin = EXCLUDED.es_super_admin;

    -- 3. Insertar Perfiles Locales (Spoke) -> Vinculados al Taller
    INSERT INTO public.perfiles (id, taller_id, email, nombre_completo, rol, activo)
    VALUES
    (v_admin_uid, v_taller_id, 'admin@taller.demo', 'Admin Local', 'admin', true),
    (v_mecanico_uid, v_taller_id, 'mecanico@taller.demo', 'Mecánico Local', 'mecanico', true)
    ON CONFLICT (id) DO UPDATE SET
        taller_id = v_taller_id,
        rol = EXCLUDED.rol,
        activo = true;

    RAISE NOTICE '✅ Usuarios creados y vinculados al Taller ID: %', v_taller_id;
END $$;
