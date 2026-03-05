DO $$
DECLARE
    v_taller_id UUID := 'e55ce6be-7b8c-4a1a-b333-666333666333';
    v_cliente_id UUID;
    v_vehiculo_id UUID;
BEGIN
    RAISE NOTICE 'Iniciando carga de bloque...';
    -- Fila 1288: OT 2491
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'FRANCO ESCOBAR' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'FRANCO ESCOBAR', '20344646-2', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'GYDC23' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'GYDC23', 'VOLVO', 'S/M', 2015, 'S/C', 110) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '2491', 'GYDC23', 'STAGE 1 +24HP +60NM - CYBER ANTES 490.000', 'STAGE 1 +24HP +60NM - CYBER ANTES 490.000', 343000, 'completada', '2024-06-06');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 1289: OT 2492
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'JUAN CARDENAS' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'JUAN CARDENAS', '17499571-0', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'JRSD19' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'JRSD19', 'AUDI', 'A32', 2017, 'S/C', 0) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '2492', 'JRSD19', 'INSTALACION SILENCIADOR ALTO FLUJO C/VALVULAS SM-003', 'INSTALACION SILENCIADOR ALTO FLUJO C/VALVULAS SM-003', 600000, 'completada', '2024-06-07');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 1290: OT 2493
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'RAUL GONZALEZ' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'RAUL GONZALEZ', '18999834-1', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'TDDG80' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'TDDG80', 'MAZDA', '3', 2024, 'S/C', 2050) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '2493', 'TDDG80', 'INSTALACION MODULO CUT OUT SMG 2''''', 'INSTALACION MODULO CUT OUT SMG 2''''', 349900, 'completada', '2024-06-07');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 1291: OT 2494
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'INNOVA COM' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'INNOVA COM', '76804934-3', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'FYKL29' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'FYKL29', 'BMW', '335I', 2013, 'S/C', 105000) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '2494', 'FYKL29', 'LINEA INOX 3'''' CON FLEXIBLE DOBLE SALIDA C/DONACION DE VALVULA + SILENCIADOR ALTO FLUJO VIBRANT ULTRA QUIET + COLAS DOBLES', 'LINEA INOX 3'''' CON FLEXIBLE DOBLE SALIDA C/DONACION DE VALVULA + SILENCIADOR ALTO FLUJO VIBRANT ULTRA QUIET + COLAS DOBLES', 900000, 'completada', '2024-06-10');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 1292: OT 2495
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'GUSTAVO PINOCHET' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'GUSTAVO PINOCHET', '', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'SYDF76' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'SYDF76', 'FORD', 'MUSTANG', 2020, 'S/C', 0) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '2495', 'SYDF76', 'X-PIPE CYBER', 'X-PIPE CYBER', 220000, 'completada', '2024-06-10');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 1293: OT 2496
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'PEDRO CABEZAS' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'PEDRO CABEZAS', '76705018-6', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'LPLC40' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'LPLC40', 'FORD', 'F150', 2020, 'S/C', 90) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '2496', 'LPLC40', 'INSTALACION 2 MODULO CUT OUT SMG 63MM - TRANSPORTES PCP SPA', 'INSTALACION 2 MODULO CUT OUT SMG 63MM - TRANSPORTES PCP SPA', 680000, 'completada', '2024-06-10');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 1294: OT 2497
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'NAYIB FAJURI' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'NAYIB FAJURI', '', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'TBFK26' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'TBFK26', 'SUBARU', 'WRX', 2023, 'S/C', 15993) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '2497', 'TBFK26', 'INSTALACION MODULO CUT OUT 2,5'''' SMG C/2 CONTROL REMOTO - CAMBIO 4 COLAS ESCAPE', 'INSTALACION MODULO CUT OUT 2,5'''' SMG C/2 CONTROL REMOTO - CAMBIO 4 COLAS ESCAPE', 750000, 'completada', '2024-06-11');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 1295: OT 2498
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'MATIAS FLORES' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'MATIAS FLORES', '19237827-3', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'KPTZ55' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'KPTZ55', 'SUBARU', 'IMPREZA HB', 2018, 'S/C', 0) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '2498', 'KPTZ55', 'AXLE BACK FREE C/ COLAS DUAL 3'''' INOX CROMO DISEÑO LO TRAE CLIENTE', 'AXLE BACK FREE C/ COLAS DUAL 3'''' INOX CROMO DISEÑO LO TRAE CLIENTE', 570000, 'completada', '2024-06-11');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 1296: OT 2499
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'MAURICIO VAGAS' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'MAURICIO VAGAS', '', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'KBPJ51' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'KBPJ51', 'HYUNDAI', 'H350', 2020, 'S/C', 298369) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '2499', 'KBPJ51', 'CHEQUEO DPF Y REPROGRAMACION', 'CHEQUEO DPF Y REPROGRAMACION', 523600, 'completada', '2024-06-12');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 1297: OT 2500
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'ESTEBAN PAEZ' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'ESTEBAN PAEZ', '17674600-9', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'DJSS59' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'DJSS59', 'PORSCHE', 'CAIMAN', 2012, 'S/C', 68081) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '2500', 'DJSS59', 'CAMBIO COLAS BLACK SEMI SELLO 4''''', 'CAMBIO COLAS BLACK SEMI SELLO 4''''', 299900, 'completada', '2024-06-12');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 1298: OT 2501
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'CHRISTOPHER VALDERRAMA' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'CHRISTOPHER VALDERRAMA', '18697678-9', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'JLCF93' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'JLCF93', 'SUZUKI', 'VITARA', 2017, 'S/C', 53212) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '2501', 'JLCF93', 'REPROGRAMACION DE ECU STAGE 1 +12HP APROX CYBER', 'REPROGRAMACION DE ECU STAGE 1 +12HP APROX CYBER', 200000, 'completada', '2024-06-12');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 1299: OT 2502
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'IGNACIO FIGUEROA' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'IGNACIO FIGUEROA', '20847928-8', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'RX5331' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'RX5331', 'ALFA ROMERO', '156', 2001, 'S/C', 260) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '2502', 'RX5331', 'AXLE BACK NUEVO INOX 2,5'''' + MAGNAFLOW ALTO FLUJO 2,5'''' CORTO + DUAL COLAS 3'''' C/REDONDO', 'AXLE BACK NUEVO INOX 2,5'''' + MAGNAFLOW ALTO FLUJO 2,5'''' CORTO + DUAL COLAS 3'''' C/REDONDO', 475000, 'completada', '2024-06-14');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 1300: OT 2503
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'FELIPE CULACIATI' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'FELIPE CULACIATI', '13253439-K', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'SJDS63' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'SJDS63', 'DODGE', 'RAM 1500', 2022, 'S/C', 22) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '2503', 'SJDS63', 'INSTALACION SPRINTBOOSTER V3 INSTALA PARA CAMBIO EN DIESEL TUNING', 'INSTALACION SPRINTBOOSTER V3 INSTALA PARA CAMBIO EN DIESEL TUNING', 279900, 'completada', '2024-06-14');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    RAISE NOTICE 'Procesados 1300 registros...';
    -- Fila 1301: OT 2504
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'AUTOMOTORES' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'AUTOMOTORES', '84900900-1', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'RBZF64' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'RBZF64', 'FORD', 'F150', 2021, 'S/C', 65) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '2504', 'RBZF64', 'REPROGRAMACION DE ECU DECAT DELETE CATALYTC', 'REPROGRAMACION DE ECU DECAT DELETE CATALYTC', 320000, 'completada', '2024-06-14');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 1302: OT 2505
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'MATIAS GONZALEZ' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'MATIAS GONZALEZ', '19447974-3', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'TFSV95' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'TFSV95', 'BMW', '220I', 2024, 'S/C', 10150) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '2505', 'TFSV95', 'INSTALACION DOWNPIPE C/CATALITICO ALTO FLUJO - CLIENTE TRAE DOWNPIPE', 'INSTALACION DOWNPIPE C/CATALITICO ALTO FLUJO - CLIENTE TRAE DOWNPIPE', 60000, 'completada', '2024-06-14');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 1303: OT 2506
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'RAUL MUÑOZ' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'RAUL MUÑOZ', '17837446-K', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'SVLJ79' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'SVLJ79', 'FORD', 'F150', 2023, 'S/C', 32046) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '2506', 'SVLJ79', 'INSTALACION MODULO CUT OUT 3'''' C/2 CONTROL', 'INSTALACION MODULO CUT OUT 3'''' C/2 CONTROL', 349900, 'completada', '2024-06-17');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 1304: OT 2507
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'MAURICIO VARGAS' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'MAURICIO VARGAS', '76451851-5', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'PGTZ67' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'PGTZ67', 'PEUGEOT', 'BOXER', 2020, 'S/C', 204225) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '2507', 'PGTZ67', 'SOCIEDAD DE TRAS. Y SERV - CHEQUEO DPF Y REPROGRAMACION', 'SOCIEDAD DE TRAS. Y SERV - CHEQUEO DPF Y REPROGRAMACION', 0, 'completada', '2024-06-17');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 1305: OT 2508
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'JAIME IBARRA' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'JAIME IBARRA', '18117338-6', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'FZYH18' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'FZYH18', 'TOYOTA', '4 RUNNER', 2014, 'S/C', 138132) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '2508', 'FZYH18', 'INSTALACION SILENCIADOR SM-001T 3''''CC/2 CONTROL REMOTO', 'INSTALACION SILENCIADOR SM-001T 3''''CC/2 CONTROL REMOTO', 500000, 'completada', '2024-06-18');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 1306: OT 2509
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'MICHAEL RADEMACHER' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'MICHAEL RADEMACHER', '16562471-8', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'PDKL64' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'PDKL64', 'JEEP', 'GLADIATOR', 2021, 'S/C', 27) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '2509', 'PDKL64', 'INSTALACION MODULO CUT OUT 3'''' C/2 CONTROL REMOTO SMG', 'INSTALACION MODULO CUT OUT 3'''' C/2 CONTROL REMOTO SMG', 349900, 'completada', '2024-06-18');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 1307: OT 2510
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'ADRIAN MORAGA' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'ADRIAN MORAGA', '15324431-6', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'SGTG24' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'SGTG24', 'FORD', 'RANGER', 2023, 'S/C', 42203) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '2510', 'SGTG24', 'FABRICACION DOWNPIPE INOX (DECAT-DPFOFF) - REEMPLAZO SILENCIADOR POR INOX - REPROGRAMACION DPF OFF-EGROFF', 'FABRICACION DOWNPIPE INOX (DECAT-DPFOFF) - REEMPLAZO SILENCIADOR POR INOX - REPROGRAMACION DPF OFF-EGROFF', 899900, 'completada', '2024-06-24');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 1308: OT 2511
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'PATRICIO GONZALEZ' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'PATRICIO GONZALEZ', '77240537-5', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'KKKH89' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'KKKH89', 'AUDI', 'A3', 2018, 'S/C', 79) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '2511', 'KKKH89', 'INSTALACION MODULO CUT OUT  - SUTH ROBOTICS SPA', 'INSTALACION MODULO CUT OUT  - SUTH ROBOTICS SPA', 349900, 'completada', '2024-06-26');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 1309: OT 2512
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'FRANCISCO PEÑA' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'FRANCISCO PEÑA', '16571457-1', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'PDSW14' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'PDSW14', 'DODGE', 'RAM 1500', 2021, 'S/C', 73) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '2512', 'PDSW14', 'INSTALACION MODULO SMG 001 C/VALVULA 2 CONTROL REMOTO', 'INSTALACION MODULO SMG 001 C/VALVULA 2 CONTROL REMOTO', 600000, 'completada', '2024-06-27');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 1310: OT 2513
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'MIGUEL DIAZ' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'MIGUEL DIAZ', '23671746-1', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'KXKJ33' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'KXKJ33', 'AUDI', 'TT', 2019, 'S/C', 80) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '2513', 'KXKJ33', 'INSTALACION CUT OUT 63'''' SMG C/2 CONTROL REMOTO', 'INSTALACION CUT OUT 63'''' SMG C/2 CONTROL REMOTO', 349900, 'completada', '2024-06-27');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 1311: OT 2514
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'MICHAEL RADEMACHER' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'MICHAEL RADEMACHER', '15562471-8', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'PDKL64' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'PDKL64', 'JEEP', 'GLADIATOR', 2021, 'S/C', 28) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '2514', 'PDKL64', 'RE APLICA MULTIPLES COPILOTO - RE INSTALACION SILENCIADOR ORIGINAL - INSTALACION ALTO FLUJO EN CUT OUT', 'RE APLICA MULTIPLES COPILOTO - RE INSTALACION SILENCIADOR ORIGINAL - INSTALACION ALTO FLUJO EN CUT OUT', 200000, 'completada', '2024-07-02');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 1312: OT 2515
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'SEBASTIAN HERNANDEZ' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'SEBASTIAN HERNANDEZ', '20099474-4', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'LVCT75' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'LVCT75', 'VOLKSWAGEN', 'JETTA', 2020, 'S/C', 33195) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '2515', 'LVCT75', 'VOLVER SHOCK AUTO, CAMBIO AXLE BACK FREE DE DOBLE SALIDA - VOLVER MAPA SHOCK', 'VOLVER SHOCK AUTO, CAMBIO AXLE BACK FREE DE DOBLE SALIDA - VOLVER MAPA SHOCK', 125000, 'completada', '2024-07-03');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 1313: OT 2516
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'SERGIO OLEA' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'SERGIO OLEA', '19645907-3', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'FHLG24' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'FHLG24', 'AUDI', 'A4', 2013, 'S/C', 76) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '2516', 'FHLG24', 'INSTALACION MODULO CUT OUT 63MM C/2 CONTROL REMOTO SMG', 'INSTALACION MODULO CUT OUT 63MM C/2 CONTROL REMOTO SMG', 349900, 'completada', '2024-07-03');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 1314: OT 2517
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'FELIPE ACUÑA' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'FELIPE ACUÑA', '14135125-7', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'SLLZ44' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'SLLZ44', 'CHEVROLET', 'SILVERADO', 2023, 'S/C', 0) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '2517', 'SLLZ44', 'INSTALACIO MODULO CUTOUT 3'''' SMG', 'INSTALACIO MODULO CUTOUT 3'''' SMG', 349900, 'completada', '2024-07-03');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 1315: OT 2518
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'DIESEL TUNING' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'DIESEL TUNING', '76319264-4', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'SIN-PAT' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'SIN-PAT', 'DODGE', 'RAM', 2024, 'S/C', 0) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '2518', 'SIN-PAT', 'BORLA + ANTIDRONE', 'BORLA + ANTIDRONE', 380000, 'completada', '2024-07-03');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 1316: OT 2519
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'JUAN JOSE GROSS' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'JUAN JOSE GROSS', '14280926-5', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'HLCX84' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'HLCX84', 'CHEVROLET', 'SILVERADO', 2015, 'S/C', 165) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '2519', 'HLCX84', 'LINEA COMPLETA INOX 3'''' C/ WICKEDFLOW KAMIKASE + 2 COLAS CROMO', 'LINEA COMPLETA INOX 3'''' C/ WICKEDFLOW KAMIKASE + 2 COLAS CROMO', 1149900, 'completada', '2024-07-04');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 1317: OT 2520
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'HERNAN BONONATO' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'HERNAN BONONATO', '16488544-5', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'PYLC70' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'PYLC70', 'VOLKSWAGEN', 'AMAROK', 2021, 'S/C', 135343) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '2520', 'PYLC70', 'DOWNPIPE INOX - REPRO DPF OFF', 'DOWNPIPE INOX - REPRO DPF OFF', 629900, 'completada', '2024-07-05');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 1318: OT 2521
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'MANUEL SIERRA' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'MANUEL SIERRA', '11571539-9', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'TJXJ19' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'TJXJ19', 'FORD', 'MUSTANG', 2023, 'S/C', 2520) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '2521', 'TJXJ19', 'XPIPE INOX SMG', 'XPIPE INOX SMG', 249900, 'completada', '2024-07-08');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 1319: OT 2522
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'FRANCISCO MORENO' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'FRANCISCO MORENO', '19635049-7', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'KKRS92' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'KKRS92', 'KIA', 'SPORTAGE', 2018, 'S/C', 0) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '2522', 'KKRS92', 'AXLE BACK NUEVO C/MODIFICACION DIFUSOR C/DOBLE SALIDA DE ESCAPE + 2 COLAS CROMO 4''''', 'AXLE BACK NUEVO C/MODIFICACION DIFUSOR C/DOBLE SALIDA DE ESCAPE + 2 COLAS CROMO 4''''', 425000, 'completada', '2024-07-08');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 1320: OT 2523
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'CLAUDIO LATORRE' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'CLAUDIO LATORRE', '20074582-5', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'SIN-PAT' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'SIN-PAT', 'BMW', '240I', 2024, 'S/C', 0) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '2523', 'SIN-PAT', 'FABRICACION LINEA INOX 3'''' CLIENTE TRAE TUBO Y CODOS', 'FABRICACION LINEA INOX 3'''' CLIENTE TRAE TUBO Y CODOS', 349900, 'completada', '2024-07-09');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 1321: OT 2524
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'ERICK BUSTOS' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'ERICK BUSTOS', '15444552-8', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'PXXD19' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'PXXD19', 'FORD', 'F150', 2021, 'S/C', 43045) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '2524', 'PXXD19', 'LINEA COMPLETA INOX 3'''' + SILENCIADOR ALTO FLUJO C/DOS SALIDAS + 2 COLAS 4'''' CAMIONETA', 'LINEA COMPLETA INOX 3'''' + SILENCIADOR ALTO FLUJO C/DOS SALIDAS + 2 COLAS 4'''' CAMIONETA', 1199900, 'completada', '2024-07-10');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 1322: OT 2525
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'CARLOS HERNANDEZ' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'CARLOS HERNANDEZ', '19111677-1', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'LTYC96' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'LTYC96', 'VOLKSWAGEN', 'GT MK', 2020, 'S/C', 45) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '2525', 'LTYC96', 'INSTALACION DOWNPIPE ORIGINAL - DES INSTALACION CUT OUT FISICO Y ELECTRICO', 'INSTALACION DOWNPIPE ORIGINAL - DES INSTALACION CUT OUT FISICO Y ELECTRICO', 135000, 'completada', '2024-07-10');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 1323: OT 2526
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'IGNACIO ZAMORA' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'IGNACIO ZAMORA', '17475170-7', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'SDRW23' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'SDRW23', 'CHEVROLET', 'ZRZ', 2023, 'S/C', 46) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '2526', 'SDRW23', 'INSTALACION MODULO CUT OUT 676MM C/CONTROL REMOTO SMG', 'INSTALACION MODULO CUT OUT 676MM C/CONTROL REMOTO SMG', 349900, 'completada', '2024-07-11');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 1324: OT 2527
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'BENJAMIN RIVEROS' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'BENJAMIN RIVEROS', '20299280-3', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'LKZH20' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'LKZH20', 'MERCEDES', 'A200', 2019, 'S/C', 55471) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '2527', 'LKZH20', 'INSTALACION DIFUSOR TRASERO A45 S C/COLAS - AXLE BACK FREE INOX 2.5''''', 'INSTALACION DIFUSOR TRASERO A45 S C/COLAS - AXLE BACK FREE INOX 2.5''''', 800000, 'completada', '2024-07-12');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 1325: OT 2528
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'DOMINGO REYES' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'DOMINGO REYES', '18047367-K', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'JLYP47' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'JLYP47', 'SUBARU', 'WRX', 2017, 'S/C', 0) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '2528', 'JLYP47', 'LINEA INOX + MAGNAFLOW ALTO FLUJO + COLAS NUEVAS 4'''' C/UNA BLACK', 'LINEA INOX + MAGNAFLOW ALTO FLUJO + COLAS NUEVAS 4'''' C/UNA BLACK', 919900, 'completada', '2024-07-15');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 1326: OT 2529
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'DIEGO HERNANDEZ' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'DIEGO HERNANDEZ', '18525753-3', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'FKSL21' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'FKSL21', 'JEEP', 'CHEROKEE', 2013, 'S/C', 218503) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '2529', 'FKSL21', 'XPIPE CENTRAL C/SILENCIADOR AL TO FLUJO MAGNAFLOW + AXLE BACK FREE C/COLAS NUEVAS INOX 4''''', 'XPIPE CENTRAL C/SILENCIADOR AL TO FLUJO MAGNAFLOW + AXLE BACK FREE C/COLAS NUEVAS INOX 4''''', 749800, 'completada', '2024-07-15');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 1327: OT 2530
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'CARLOS NAVARRO' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'CARLOS NAVARRO', '15337966-1', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'HWVC97' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'HWVC97', 'OPEL', 'ASTRA  ENJOY', 2016, 'S/C', 49062) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '2530', 'HWVC97', 'DOWNPIPE INOX 2,5''''', 'DOWNPIPE INOX 2,5''''', 279900, 'completada', '2024-07-17');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 1328: OT 2531
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'MARCOS ZUÑIGA' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'MARCOS ZUÑIGA', '18496462-7', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'LPHV96' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'LPHV96', 'TOYOTA', 'COROLLA SPORT', 2019, 'S/C', 47367) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '2531', 'LPHV96', 'AXLE BACK SILEMPRO 2,5'''' C/DOBLE COLA 3'''' C/CORTE PARACHOQUE - INDUCCION FLANCHE SENSOR + FILTRO K8N - FLANCHE INTERCAMBIABLE', 'AXLE BACK SILEMPRO 2,5'''' C/DOBLE COLA 3'''' C/CORTE PARACHOQUE - INDUCCION FLANCHE SENSOR + FILTRO K8N - FLANCHE INTERCAMBIABLE', 769900, 'completada', '2024-07-17');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 1329: OT 2532
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'JORGE VILLALOBOS' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'JORGE VILLALOBOS', '18668450-8', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'SIN-PAT' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'SIN-PAT', 'MERCEDES', 'C220', 2013, 'S/C', 243384) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '2532', 'SIN-PAT', 'DIFUSOR  + CAMBIO FLEXIBLE - COLAS AMG - SPOILER', 'DIFUSOR  + CAMBIO FLEXIBLE - COLAS AMG - SPOILER', 450000, 'completada', '2024-07-18');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 1330: OT 2533
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'FRANCISCO MENDEZ' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'FRANCISCO MENDEZ', '8954035-6', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'SVFR58' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'SVFR58', 'CHEVROLET', 'ZRZ', 2023, 'S/C', 20) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '2533', 'SVFR58', 'INSTALACION VALVULA CUT OUT 3'''' SMG C/ 2 CONTROLES REMOTO', 'INSTALACION VALVULA CUT OUT 3'''' SMG C/ 2 CONTROLES REMOTO', 349900, 'completada', '2024-07-23');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 1331: OT 2534
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'SEBASTIAN PIZARRO' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'SEBASTIAN PIZARRO', '16848359-7', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'HFJL75' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'HFJL75', 'MITSUBISHI', 'LANCER', 2015, 'S/C', 76500) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '2534', 'HFJL75', 'LINEA COMPLETA INOX 2'''' + SILENCIADOR ALTO FLUJO SILEMPRO', 'LINEA COMPLETA INOX 2'''' + SILENCIADOR ALTO FLUJO SILEMPRO', 579900, 'completada', '2024-07-23');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 1332: OT 2535
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'SEBASTIAN PAINE' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'SEBASTIAN PAINE', '20595805-3', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'RFLP87' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'RFLP87', 'BMW', '220I', 2022, 'S/C', 32) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '2535', 'RFLP87', 'INSTALACION MODULO CUT OUT SMG C/ 2 CONTROL REMOTO', 'INSTALACION MODULO CUT OUT SMG C/ 2 CONTROL REMOTO', 349900, 'completada', '2024-07-24');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 1333: OT 2536
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'VICTOR VIAL' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'VICTOR VIAL', '10985601-0', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'SWXD11' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'SWXD11', 'FORD', 'MACH 1', 2023, 'S/C', 15471) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '2536', 'SWXD11', 'INSTALACION BORLA ATAK + MODIFICACION - F150 SPRINTBOOSTER RTJC75', 'INSTALACION BORLA ATAK + MODIFICACION - F150 SPRINTBOOSTER RTJC75', 540000, 'completada', '2024-07-24');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 1334: OT 2537
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'NAYIK FAJURE' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'NAYIK FAJURE', '21212220-7', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'TBFK26' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'TBFK26', 'SUBARU', 'WRX', 2024, 'S/C', 18654) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '2537', 'TBFK26', 'LINEA COMPLETA INOX C/ 2 SILENCIADOR ALTO FLUJO SMG VANE CON COLAS', 'LINEA COMPLETA INOX C/ 2 SILENCIADOR ALTO FLUJO SMG VANE CON COLAS', 1350000, 'completada', '2024-07-25');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 1335: OT 2538
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'DANILO CASTILLO' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'DANILO CASTILLO', '8469549-1', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'FY2067' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'FY2067', 'BMW', 'E30 325I', 1986, 'S/C', 0) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '2538', 'FY2067', 'LINEA COMPLETA INOX C/ ALTO FLUJO WICKEDFLOW + COLAS 2 CON CORTE 45'' - CUT OUT F150 3'''' C/ CONTROL REMOTO', 'LINEA COMPLETA INOX C/ ALTO FLUJO WICKEDFLOW + COLAS 2 CON CORTE 45'' - CUT OUT F150 3'''' C/ CONTROL REMOTO', 1100000, 'completada', '2024-07-25');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 1336: OT 2539
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'HENRIQUE LOPEZ' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'HENRIQUE LOPEZ', '9520099-0', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'RPYX83' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'RPYX83', 'DODGE', 'CHALLENGER', 2021, 'S/C', 64) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '2539', 'RPYX83', '2 MODULOS CUT OUT 2,5'''' INSTALADO C/ CONTROL REMOTO', '2 MODULOS CUT OUT 2,5'''' INSTALADO C/ CONTROL REMOTO', 725000, 'completada', '2024-08-02');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 1337: OT 2540
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'MARTIN CARES' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'MARTIN CARES', '21150961-9', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'KGYH56' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'KGYH56', 'BMW', '120I', 2018, 'S/C', 82922) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '2540', 'KGYH56', 'DOWNPIPE 389.900 - DIFUSOR NEGRO 380.000 - LINEA INOX C/SILENCIADOR SMG VALVULAS 1.199.900', 'DOWNPIPE 389.900 - DIFUSOR NEGRO 380.000 - LINEA INOX C/SILENCIADOR SMG VALVULAS 1.199.900', 1969800, 'completada', '2024-07-29');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 1338: OT 2541
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'JUAN MADRID' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'JUAN MADRID', '10709910-7', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'LDXV18' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'LDXV18', 'CHEVROLET', 'SILVERADO', 2019, 'S/C', 135547) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '2541', 'LDXV18', 'INSTALACION VALVULA CUT OUT 3''''', 'INSTALACION VALVULA CUT OUT 3''''', 349900, 'completada', '2024-08-01');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 1339: OT 2542
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'FELIPE ROJAS' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'FELIPE ROJAS', '17164171-8', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'PSSW52' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'PSSW52', 'CHEVROLET', 'TRARL BOSS', 2021, 'S/C', 0) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '2542', 'PSSW52', 'INSTALACION CUT OUT 3'''' SMG C/CONTROL REMOTO', 'INSTALACION CUT OUT 3'''' SMG C/CONTROL REMOTO', 379900, 'completada', '2024-08-01');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 1340: OT 2543
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'DIEGO TERRAZAS' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'DIEGO TERRAZAS', '19035857-7', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'PDCX23' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'PDCX23', 'AUDI', 'A3', 2020, 'S/C', 54762) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '2543', 'PDCX23', 'INSTALACION MODULO CUT OUT SMG 2'''' INOX C/ 2 CONTROL REMOTO', 'INSTALACION MODULO CUT OUT SMG 2'''' INOX C/ 2 CONTROL REMOTO', 379900, 'completada', '2024-08-05');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 1341: OT 2544
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'JAVIER QUINTANILA' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'JAVIER QUINTANILA', '19282075-8', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'KFLC85' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'KFLC85', 'SUBARU', 'WRX', 2018, 'S/C', 70) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '2544', 'KFLC85', 'INSTALACION MODULO CUT OUT 2,5'''' SMG C/2 CONTROL REMOTO', 'INSTALACION MODULO CUT OUT 2,5'''' SMG C/2 CONTROL REMOTO', 399900, 'completada', '2024-08-06');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 1342: OT 2545
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'AUTOMOTORES URRUTA' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'AUTOMOTORES URRUTA', '84900900-1', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'RFPP14' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'RFPP14', 'FORD', 'TERRITORY', 2022, 'S/C', 0) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '2545', 'RFPP14', 'CHEQUEO ECU PARA REPROGRAMACION ECU DELETE CATALITIC', 'CHEQUEO ECU PARA REPROGRAMACION ECU DELETE CATALITIC', 200000, 'completada', '2024-08-06');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 1343: OT 2546
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'MAURICIO LILLO' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'MAURICIO LILLO', '14360129-3', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'SWKZ80' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'SWKZ80', 'CHEVROLET', 'ZRZ', 2023, 'S/C', 25100) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '2546', 'SWKZ80', 'INSTALACION MODULO CUT OUT 3'''' C/ 2 CONTROL REMOTO', 'INSTALACION MODULO CUT OUT 3'''' C/ 2 CONTROL REMOTO', 379900, 'completada', '2024-08-07');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 1344: OT 2547
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'JOAQUIN PACHECO' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'JOAQUIN PACHECO', '19721474-0', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'KJSL19' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'KJSL19', 'VOLKSWAGEN', 'GOLF TSI', 2018, 'S/C', 61) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '2547', 'KJSL19', 'CUT OUT SMG + SILENCIADOR ALTO FLUJO SILEMPRO', 'CUT OUT SMG + SILENCIADOR ALTO FLUJO SILEMPRO', 560000, 'completada', '2024-08-09');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 1345: OT 2548
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'RAUL NOSTI' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'RAUL NOSTI', '14126996-8', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'FCVX62' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'FCVX62', 'DODGE', 'NEW RAM 2500', 2013, 'S/C', 0) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '2548', 'FCVX62', 'LINEA COMPLETA C/ DOWNPIPE 4'''' C/ DOS SALIDAS DE ESCAPE', 'LINEA COMPLETA C/ DOWNPIPE 4'''' C/ DOS SALIDAS DE ESCAPE', 1500000, 'completada', '2024-08-14');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 1346: OT 2549
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'FERNANDO UGALOE' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'FERNANDO UGALOE', '14170265-3', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'SIN-PAT' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'SIN-PAT', 'S/M', 'S/M', 2015, 'S/C', 0) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '2549', 'SIN-PAT', 'INSTALACION MODULO CUT OUT 2'''' C/ 2 CONTROL REMOTO', 'INSTALACION MODULO CUT OUT 2'''' C/ 2 CONTROL REMOTO', 379900, 'completada', '2024-08-14');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 1347: OT 2550
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'MICHAEL TORRES' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'MICHAEL TORRES', '18154205-5', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'LGDC51' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'LGDC51', 'FORD', 'F150', 2020, 'S/C', 0) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '2550', 'LGDC51', 'INSTALACION CUT OUT C/ 2 CONTROL REMOTO', 'INSTALACION CUT OUT C/ 2 CONTROL REMOTO', 379900, 'completada', '2024-08-19');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 1348: OT 2601
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'JOHN PLANCENCIO' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'JOHN PLANCENCIO', '17566258-8', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'DWWW80' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'DWWW80', 'AUDI', 'R8 V8', 2012, 'S/C', 34000) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '2601', 'DWWW80', 'LINEA INOX 3'''' CON MAGNAFLOW - REPRO STAGE 1 +25HP +30NM - VALVULA', 'LINEA INOX 3'''' CON MAGNAFLOW - REPRO STAGE 1 +25HP +30NM - VALVULA', 3589900, 'completada', '2024-08-20');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 1349: OT 2602
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'GUSTAVO GARRIDO' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'GUSTAVO GARRIDO', '11646518-3', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'SIN-PAT' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'SIN-PAT', 'SUZUKI', 'VITARA', 2019, 'S/C', 26699) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '2602', 'SIN-PAT', 'AXLE BACK SILEMPRO ALTO FLUJO 2'''' C/ FLANCHE Y COLAS', 'AXLE BACK SILEMPRO ALTO FLUJO 2'''' C/ FLANCHE Y COLAS', 299900, 'completada', '2024-08-21');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 1350: OT 2603
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'CLIENTE GENERICO' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'CLIENTE GENERICO', '', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'SIN-PAT' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'SIN-PAT', 'S/M', 'S/M', 0, 'S/C', 0) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '2603', 'SIN-PAT', 'Carga masiva', 'Carga masiva', 0, 'completada', '2026-01-01');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 1351: OT 2604
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'MARCO FARIAS' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'MARCO FARIAS', '13546958-0', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'HSXD19' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'HSXD19', 'FORD', 'RANGER', 2016, 'S/C', 161890) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '2604', 'HSXD19', 'SE INSTALA PIEZA EN INOX ADMISION - SE LIMPIA MAP - SCANER P0234', 'SE INSTALA PIEZA EN INOX ADMISION - SE LIMPIA MAP - SCANER P0234', 0, 'completada', '2024-08-21');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 1352: OT 2605
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'AUTOMOTORES URRUTA' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'AUTOMOTORES URRUTA', '', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'LRTL56' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'LRTL56', 'MAXUS', 'T60', 2020, 'S/C', 95226) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '2605', 'LRTL56', 'VACIADO DPF (FISICO) - REPRO DPF - EGR OFF (ELECTRICA) - SCANER', 'VACIADO DPF (FISICO) - REPRO DPF - EGR OFF (ELECTRICA) - SCANER', 350000, 'completada', '2024-08-22');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 1353: OT 2606
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'ROBERTO CAMUS' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'ROBERTO CAMUS', '76279221-4', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'DYGX49' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'DYGX49', 'FORD', 'F150', 2012, 'S/C', 0) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '2606', 'DYGX49', 'CUT OUT 2 CONTROL REMOTO SMG - COLA ESCAPE - FILTRO BMC', 'CUT OUT 2 CONTROL REMOTO SMG - COLA ESCAPE - FILTRO BMC', 574560, 'completada', '2024-08-23');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 1354: OT 2607
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'FELIPE CASTILLO' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'FELIPE CASTILLO', '15736860-5', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'GLLK53' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'GLLK53', 'MITSUBISHI', 'LANCER', 2001, 'S/C', 0) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '2607', 'GLLK53', 'SUPRIMIR SILENCIADOR CENTRAL INOX 3''''', 'SUPRIMIR SILENCIADOR CENTRAL INOX 3''''', 65000, 'completada', '2024-08-23');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 1355: OT 2608
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'EMILIO IZETA' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'EMILIO IZETA', '16298096-3', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'PGRJ73' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'PGRJ73', 'MG', 'RXS', 2020, 'S/C', 38) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '2608', 'PGRJ73', 'SCANNER P0016 CORRELACION POSICION ORIGINAL POSICION ARBOL DE LEVA(SENSOR A BAUCO 1) P0366 SENSOR ARBOL DE LEVO', 'SCANNER P0016 CORRELACION POSICION ORIGINAL POSICION ARBOL DE LEVA(SENSOR A BAUCO 1) P0366 SENSOR ARBOL DE LEVO', 20000, 'completada', '2024-08-26');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 1356: OT 2609
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'MATIAS URRUTIA' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'MATIAS URRUTIA', '', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'JZFP31' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'JZFP31', 'RENAULT', 'SYMBOL', 2018, 'S/C', 76547) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '2609', 'JZFP31', 'REPROGRAMACION ECU DTC P0420', 'REPROGRAMACION ECU DTC P0420', 180000, 'completada', '2024-08-26');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 1357: OT 2610
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'LUIS FELIPE' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'LUIS FELIPE', '21531977-6', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'SGRD25' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'SGRD25', 'FORD', 'F150', 2023, 'S/C', 40) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '2610', 'SGRD25', 'INSTALACION MODULO CUT OUT SMG C/ 2 CONTROL REMOTO', 'INSTALACION MODULO CUT OUT SMG C/ 2 CONTROL REMOTO', 379900, 'completada', '2024-08-27');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 1358: OT 2611
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'FRANCISCO OLAVE' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'FRANCISCO OLAVE', '13929614-1', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'LRWV63' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'LRWV63', 'HYUNDAI', 'VELOSTER', 2020, 'S/C', 80) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '2611', 'LRWV63', 'INSTALACION MODULO SMG SILENCIADOR 1 ENTRADA 2 SALIDAS', 'INSTALACION MODULO SMG SILENCIADOR 1 ENTRADA 2 SALIDAS', 799900, 'completada', '2024-08-28');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 1359: OT 2612
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'MANUEL FAUSTINO' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'MANUEL FAUSTINO', '22576222-8', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'SBFV17' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'SBFV17', 'GEELY', 'COD RAY', 2022, 'S/C', 50) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '2612', 'SBFV17', 'INSTALACION CUT OUT SMG 2'''' C/ 2 CONTROL REMOTO', 'INSTALACION CUT OUT SMG 2'''' C/ 2 CONTROL REMOTO', 349900, 'completada', '2024-08-29');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 1360: OT 2613
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'AUTOMOTORES URRUTA' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'AUTOMOTORES URRUTA', '', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'JCSF78' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'JCSF78', 'AUDI', 'A3', 2016, 'S/C', 47) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '2613', 'JCSF78', 'REPROGRAMACION DE ECU DECAT P0420', 'REPROGRAMACION DE ECU DECAT P0420', 200000, 'completada', '2024-08-29');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 1361: OT 2614
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'GABRIEL GUENDELMAN' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'GABRIEL GUENDELMAN', '18635717-2', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'LXTC58' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'LXTC58', 'VOLKSWAGEN', 'GTI', 2020, 'S/C', 47) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '2614', 'LXTC58', 'REPARACION VALVULA CUT OUT SILEMPRO', 'REPARACION VALVULA CUT OUT SILEMPRO', 45000, 'completada', '2024-08-30');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 1362: OT 2615
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'ENRIQUE LOPEZ' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'ENRIQUE LOPEZ', '9520099-0', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'RPYX83' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'RPYX83', 'DODGE', 'CHALENGER', 2019, 'S/C', 62) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '2615', 'RPYX83', 'INSTALACION 2 MODULO CUT OUT 2'''' SMG', 'INSTALACION 2 MODULO CUT OUT 2'''' SMG', 719900, 'completada', '2024-09-02');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 1363: OT 2616
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'PIERO UBILLA' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'PIERO UBILLA', '17837211-4', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'LLCL53' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'LLCL53', 'FORD', 'MUSTANG', 2019, 'S/C', 0) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '2616', 'LLCL53', 'INSTALACION COLAS DIFUSOR GT500', 'INSTALACION COLAS DIFUSOR GT500', 80000, 'completada', '2024-09-03');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 1364: OT 2617
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'CLIENTE GENERICO' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'CLIENTE GENERICO', '', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'SIN-PAT' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'SIN-PAT', 'S/M', 'S/M', 0, 'S/C', 0) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '2617', 'SIN-PAT', 'Carga masiva', 'Carga masiva', 0, 'completada', '2026-01-01');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 1365: OT 2618
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'RODRIGO CAMPOS' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'RODRIGO CAMPOS', '15907100-6', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'RCBX11' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'RCBX11', 'MERCEDES', 'A455', 2021, 'S/C', 33) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '2618', 'RCBX11', 'INSTALACION SILENCIADOR SMG CON VALVULAS C/ 2 CONTROL REMOTO', 'INSTALACION SILENCIADOR SMG CON VALVULAS C/ 2 CONTROL REMOTO', 799900, 'completada', '2024-09-05');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 1366: OT 2619
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'FERNANDO CHAPARRO' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'FERNANDO CHAPARRO', '15943479-6', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'SBYB13' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'SBYB13', 'FORD', 'MACH 1', 2022, 'S/C', 24) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '2619', 'SBYB13', 'INSTALACION XPIPE', 'INSTALACION XPIPE', 249900, 'completada', '2024-09-05');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 1367: OT 2620
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'BERNARDO IBAÑEZ' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'BERNARDO IBAÑEZ', '12021906-5', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'JRVR53' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'JRVR53', 'FORD', 'F150', 2017, 'S/C', 70) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '2620', 'JRVR53', 'INSTALACION MODULO CUT OUT C/CONTROL REMOTO - FABRICACION DOBLE SALIDA DE ESCAPE CON COLAS NUEVAS', 'INSTALACION MODULO CUT OUT C/CONTROL REMOTO - FABRICACION DOBLE SALIDA DE ESCAPE CON COLAS NUEVAS', 1029800, 'completada', '2024-09-09');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 1368: OT 2621
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'DIESEL TUNING' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'DIESEL TUNING', '76319264-4', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'HHRC98' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'HHRC98', 'BMW', '125I', 2015, 'S/C', 87276) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '2621', 'HHRC98', 'DOWNPIPE MOTOR N20 - 20% OFF', 'DOWNPIPE MOTOR N20 - 20% OFF', 0, 'completada', '2024-09-09');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 1369: OT 2622
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'ELADIO ANGEL' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'ELADIO ANGEL', '26683416-0', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'TLCP44' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'TLCP44', 'SUZUKI', 'JIMNY', 2024, 'S/C', 1600) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '2622', 'TLCP44', 'INDUCCION INOX C/SILICONAS Y ABRAZADERAS PARA SNORK1', 'INDUCCION INOX C/SILICONAS Y ABRAZADERAS PARA SNORK1', 170000, 'completada', '2024-09-11');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 1370: OT 2623
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'NICOLAS WILLIAMSON' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'NICOLAS WILLIAMSON', '76377946-7', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'JCHX91' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'JCHX91', 'FORD', 'F150', 2017, 'S/C', 162429) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '2623', 'JCHX91', 'INSTALACION MODULO CUT OUT SILEMPRO', 'INSTALACION MODULO CUT OUT SILEMPRO', 399900, 'completada', '2024-09-11');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 1371: OT 2624
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'FELIPE CID' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'FELIPE CID', '17745255-6', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'BHWK73' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'BHWK73', 'FORD', 'NEW ESCAPE', 2008, 'S/C', 210119) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '2624', 'BHWK73', 'FABRICACION PIEZA INOX 2,5'''' TRAMO FLEXIBLE', 'FABRICACION PIEZA INOX 2,5'''' TRAMO FLEXIBLE', 140000, 'completada', '2024-09-11');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 1372: OT 2625
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'AUTOMOTORES URRUTA' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'AUTOMOTORES URRUTA', '', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'LFSG64' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'LFSG64', 'BMW', '118I', 2019, 'S/C', 88622) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '2625', 'LFSG64', 'INSTALACION SOFWARE ORIGINAL - INSTALACION SILENCIADOR TRASERO', 'INSTALACION SOFWARE ORIGINAL - INSTALACION SILENCIADOR TRASERO', 469800, 'completada', '2024-09-12');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 1373: OT 2626
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'IGNACIO ERAZO' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'IGNACIO ERAZO', '20052092-0', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'RJYK48' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'RJYK48', 'SUZUKI', 'SWIFT', 2022, 'S/C', 24) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '2626', 'RJYK48', 'INSTALACION SILENCIADOR ORIGINAL', 'INSTALACION SILENCIADOR ORIGINAL', 80000, 'completada', '2024-09-12');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 1374: OT 2627
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'AQUILES CASTRO' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'AQUILES CASTRO', '', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'SKZT99' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'SKZT99', 'MAZDA', 'MX5', 2024, 'S/C', 20015) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '2627', 'SKZT99', 'INSTALACION BORLA C/COLAS DUAL 3'''' AXLE BACK', 'INSTALACION BORLA C/COLAS DUAL 3'''' AXLE BACK', 499900, 'completada', '2024-09-13');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 1375: OT 2628
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'CLIENTE GENERICO' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'CLIENTE GENERICO', '', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'SIN-PAT' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'SIN-PAT', 'S/M', 'S/M', 0, 'S/C', 0) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '2628', 'SIN-PAT', 'Carga masiva', 'Carga masiva', 0, 'completada', '2026-01-01');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 1376: OT 2629
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'VICENTE FERNANDEZ' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'VICENTE FERNANDEZ', '19994538-6', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'PZFH41' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'PZFH41', 'MERCEDES', 'A35', 2021, 'S/C', 24331) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '2629', 'PZFH41', 'LINEA COMPLETA INOX 3'''' C/ SILENCIADOR SMG C VALVULAS + 2 CONTROL REMOTO', 'LINEA COMPLETA INOX 3'''' C/ SILENCIADOR SMG C VALVULAS + 2 CONTROL REMOTO', 1499900, 'completada', '2024-09-24');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 1377: OT 2630
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'CARLOS NAVARRO' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'CARLOS NAVARRO', '15337966-1', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'HWVC97' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'HWVC97', 'OPEL', 'ASTRA ENJOY', 2015, 'S/C', 53130) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '2630', 'HWVC97', 'REPROGRAMACION DE ECU STAGE 2', 'REPROGRAMACION DE ECU STAGE 2', 389900, 'completada', '2024-09-24');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 1378: OT 2631
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'LARRY MONASTERIO' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'LARRY MONASTERIO', '16953017-3', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'PLBZ10' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'PLBZ10', 'VOLKSWAGEN', 'GOLF R', 2021, 'S/C', 40306) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '2631', 'PLBZ10', 'GARANTIA (MODIFICACION DE COLA) REINSTALACION SILENCIADOR ORIGINAL CENTRAL', 'GARANTIA (MODIFICACION DE COLA) REINSTALACION SILENCIADOR ORIGINAL CENTRAL', 80000, 'completada', '2024-09-24');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 1379: OT 2632
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'JASON MOVAT' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'JASON MOVAT', '14129806-2', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'RCZR13' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'RCZR13', 'FORD', 'F150', 0, 'S/C', 21809) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '2632', 'RCZR13', 'INSTALACION WICKDFLOW SC 212 2,5''''', 'INSTALACION WICKDFLOW SC 212 2,5''''', 300000, 'completada', '2024-09-25');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 1380: OT 2633
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'CLIENTE GENERICO' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'CLIENTE GENERICO', '', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'SIN-PAT' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'SIN-PAT', 'S/M', 'S/M', 0, 'S/C', 0) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '2633', 'SIN-PAT', 'Carga masiva', 'Carga masiva', 0, 'completada', '2026-01-01');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 1381: OT 2634
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'FERNANDO MARAGLIANO' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'FERNANDO MARAGLIANO', '18167432-6', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'LBXJ75' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'LBXJ75', 'FORD', 'MUSTANG', 2019, 'S/C', 51111) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '2634', 'LBXJ75', 'INSTALACION XPIPE INOX', 'INSTALACION XPIPE INOX', 249900, 'completada', '2024-09-25');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 1382: OT 2635
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'ESTEBAN VEGA' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'ESTEBAN VEGA', '16914839-2', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'LCFT94' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'LCFT94', 'VOLKSWAGEN', 'TIGUAN', 2019, 'S/C', 84468) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '2635', 'LCFT94', 'INSTALACION MODULO CUT OUT 2,5''''', 'INSTALACION MODULO CUT OUT 2,5''''', 379900, 'completada', '2024-10-01');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 1383: OT 2636
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'FRANCO MEZA' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'FRANCO MEZA', '17032809-4', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'TJWV44' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'TJWV44', 'RAM', '1500 REBEL', 2024, 'S/C', 8) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '2636', 'TJWV44', 'CUT OUT 3'''' C/ 2 CONTROL REMOTO SMG', 'CUT OUT 3'''' C/ 2 CONTROL REMOTO SMG', 379900, 'completada', '2024-10-01');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 1384: OT 2637
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'ELIO TAMAYO' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'ELIO TAMAYO', '20056325-5', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'KWCR86' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'KWCR86', 'INFINITI', 'Q50', 2018, 'S/C', 41) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '2637', 'KWCR86', 'REPARACION ESCAPE / PERNO RODADO', 'REPARACION ESCAPE / PERNO RODADO', 40000, 'completada', '2024-10-01');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 1385: OT 2638
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'CLIENTE GENERICO' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'CLIENTE GENERICO', '', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'SIN-PAT' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'SIN-PAT', 'S/M', 'S/M', 0, 'S/C', 0) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '2638', 'SIN-PAT', 'Carga masiva', 'Carga masiva', 0, 'completada', '2026-01-01');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 1386: OT 2639
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'JORDAN CARRASCO' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'JORDAN CARRASCO', '18030045-7', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'RBBC25' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'RBBC25', 'BMW', '128TI', 2021, 'S/C', 132123) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '2639', 'RBBC25', 'LINEA COMPLETA INOX CON ALTO FLUJO SILEMPRO 3'''' + 2 COLAS NEGRAS 4'''' - MANTIENE VALVULAS', 'LINEA COMPLETA INOX CON ALTO FLUJO SILEMPRO 3'''' + 2 COLAS NEGRAS 4'''' - MANTIENE VALVULAS', 799900, 'completada', '2024-10-02');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 1387: OT 2640
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'CRISTIAN RAOOHR' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'CRISTIAN RAOOHR', '6928242-3', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'LHCJ12' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'LHCJ12', 'CHEVROLET', 'TRAIL BOSS', 2019, 'S/C', 87432) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '2640', 'LHCJ12', 'CUT OUT 3'''' C/ 2 CONTROL REMOTO INSTALADO', 'CUT OUT 3'''' C/ 2 CONTROL REMOTO INSTALADO', 379900, 'completada', '2024-10-03');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 1388: OT 2641
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'HERNAN ASTUDILLO' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'HERNAN ASTUDILLO', '15932509-8', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'SGPC58' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'SGPC58', 'CHERY', 'TIGGO', 2023, 'S/C', 35123) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '2641', 'SGPC58', 'FABRICACION DE PIEZA LINEA CENTRAL EN REEMPLAZO DE SILENCIADOR + CUT OUT 2,5'''' SMG C/2CONTROL REMOTO', 'FABRICACION DE PIEZA LINEA CENTRAL EN REEMPLAZO DE SILENCIADOR + CUT OUT 2,5'''' SMG C/2CONTROL REMOTO', 460000, 'completada', '2024-10-03');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 1389: OT 2642
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'JUAN SILVA' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'JUAN SILVA', '16322801-7', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'LJFV74' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'LJFV74', 'BMW', '140I', 2019, 'S/C', 43622) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '2642', 'LJFV74', 'INSTALACION MIDPIPE SCORPION', 'INSTALACION MIDPIPE SCORPION', 70000, 'completada', '2024-10-04');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 1390: OT 2643
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'DIESEL TUNING' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'DIESEL TUNING', '', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'PJTR27' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'PJTR27', 'PORSCHE', 'CAYMAN', 2020, 'S/C', 30028) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '2643', 'PJTR27', 'DOWNPIPE - LINEA + ALTO FLUJO WICKDFLOW + CUT OUT C/ 2 COLAS 4'''' C/15% OFF', 'DOWNPIPE - LINEA + ALTO FLUJO WICKDFLOW + CUT OUT C/ 2 COLAS 4'''' C/15% OFF', 2031415, 'completada', '2024-10-07');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 1391: OT 2644
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'XINGZE' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'XINGZE', '24402399-1', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'HLCS57' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'HLCS57', 'BMW', '435I', 2016, 'S/C', 121123) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '2644', 'HLCS57', 'INSTALACION DOWNPIPE (LO TRAE CLIENTE)', 'INSTALACION DOWNPIPE (LO TRAE CLIENTE)', 70000, 'completada', '2024-10-07');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 1392: OT 2645
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'CLAUDIO GONZALEZ' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'CLAUDIO GONZALEZ', '10783937-2', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'HPFX55' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'HPFX55', 'FORD', 'F250', 2016, 'S/C', 96146) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '2645', 'HPFX55', 'BULLYDOD - SERVICIO GRUA - MEDIA LINEA INOX 4'''' + SILENCIADOR ALTO FLUJO', 'BULLYDOD - SERVICIO GRUA - MEDIA LINEA INOX 4'''' + SILENCIADOR ALTO FLUJO', 2129900, 'completada', '2024-10-07');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 1393: OT 2646
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'JAIME IBARRA' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'JAIME IBARRA', '18117338-6', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'FZYH18' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'FZYH18', 'TOYOTA', '4 RUNNER', 2014, 'S/C', 143647) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '2646', 'FZYH18', 'REVISION POR GARANTIA MODULO SILENCIADOR SMG (BAJA RPM)', 'REVISION POR GARANTIA MODULO SILENCIADOR SMG (BAJA RPM)', 0, 'completada', '2024-10-08');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 1394: OT 2647
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'ANDRES ACUÑA' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'ANDRES ACUÑA', '17519028-7', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'GXPF84' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'GXPF84', 'SUZUKI', 'SWIFT', 2023, 'S/C', 19087) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '2647', 'GXPF84', 'LINEA COMPLETA INOX 2'''' MANTIENE SILENCIADOR BORLA PRO XS Y MANTIENE COLAS', 'LINEA COMPLETA INOX 2'''' MANTIENE SILENCIADOR BORLA PRO XS Y MANTIENE COLAS', 410000, 'completada', '2024-10-08');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 1395: OT 2648
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'FELIPE CASTILLO' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'FELIPE CASTILLO', '15736860-5', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'SIN-PAT' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'SIN-PAT', 'S/M', 'S/M', 0, 'S/C', 0) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '2648', 'SIN-PAT', 'REPARACION MULTIPLEY REVISICION (CLIENTE TRAE MULTIPLE)', 'REPARACION MULTIPLEY REVISICION (CLIENTE TRAE MULTIPLE)', 0, 'completada', '2024-10-08');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 1396: OT 2649
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'FRANCISCO' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'FRANCISCO', '11693737-9', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'SIN-PAT' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'SIN-PAT', 'SILVERADO', 'S/M', 2024, 'S/C', 5075) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '2649', 'SIN-PAT', 'INSTALACION DE CUT OUT 3''''', 'INSTALACION DE CUT OUT 3''''', 380000, 'completada', '2024-10-09');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 1397: OT 2650
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'CLIENTE GENERICO' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'CLIENTE GENERICO', '', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'SIN-PAT' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'SIN-PAT', 'S/M', 'S/M', 0, 'S/C', 0) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '2650', 'SIN-PAT', 'Carga masiva', 'Carga masiva', 0, 'completada', '2026-01-01');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 1398: OT 2651
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'FRANCISCO CARVAL' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'FRANCISCO CARVAL', '18030105-4', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'CXBC85' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'CXBC85', 'VOLVO', 'C30', 2011, 'S/C', 197020) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '2651', 'CXBC85', 'INSTALACION AXLE BACK WICKEDFLOW EXHAUST C/ COLAS NUEVAS', 'INSTALACION AXLE BACK WICKEDFLOW EXHAUST C/ COLAS NUEVAS', 500000, 'completada', '2024-10-11');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 1399: OT 2652
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'JOSE PEREZ' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'JOSE PEREZ', '18039340-4', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'PKSR38' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'PKSR38', 'DODGE', 'RAM', 2021, 'S/C', 74000) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '2652', 'PKSR38', 'INSTALACION CUT OUT 3''''', 'INSTALACION CUT OUT 3''''', 380000, 'completada', '2024-10-11');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 1400: OT 2653
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'LAUREUSS ROCHA' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'LAUREUSS ROCHA', '19093800-K', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'FFWY29' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'FFWY29', 'OPEL', 'CORSA OPC', 2013, 'S/C', 136123) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '2653', 'FFWY29', 'AXLE BACK MANTIENE SU MUFFLER', 'AXLE BACK MANTIENE SU MUFFLER', 149900, 'completada', '2024-10-16');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    RAISE NOTICE 'Procesados 1400 registros...';
    -- Fila 1401: OT 2654
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'RODOLFO MAYER' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'RODOLFO MAYER', '', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'DHDR69' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'DHDR69', 'JEEP', 'CHEROKEE', 2012, 'S/C', 74000) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '2654', 'DHDR69', 'XPIPE CENTRAL', 'XPIPE CENTRAL', 350000, 'completada', '2024-10-21');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 1402: OT 2655
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'AGRICOLA GONPIZA' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'AGRICOLA GONPIZA', '77787810-7', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'VA2532' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'VA2532', 'FORD', 'F150', 1995, 'S/C', 0) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '2655', 'VA2532', 'LINEA INOX ESCAPE WICKEDFLOW EXHAUST + COLA CROMO 4'''' C/ HILO SENSOR ORIGINAL', 'LINEA INOX ESCAPE WICKEDFLOW EXHAUST + COLA CROMO 4'''' C/ HILO SENSOR ORIGINAL', 940000, 'completada', '2024-10-22');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 1403: OT 2656
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'RODRIGO SUAZO' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'RODRIGO SUAZO', '14180539-8', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'JZBL73' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'JZBL73', 'FORD', 'RANGER', 2018, 'S/C', 113046) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '2656', 'JZBL73', 'FABRICACION E INSTALACION MANGERA INLET INTERCOLER', 'FABRICACION E INSTALACION MANGERA INLET INTERCOLER', 139900, 'completada', '2024-10-23');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 1404: OT 2657
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'MATIAS' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'MATIAS', '17083331-7', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'HSBR83' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'HSBR83', 'AUDI', 'S1', 2016, 'S/C', 0) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '2657', 'HSBR83', 'REPARACION SOPORTE', 'REPARACION SOPORTE', 45000, 'completada', '2024-10-24');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 1405: OT 2658
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'FERNANDO' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'FERNANDO', '18167341-6', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'GBBH14' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'GBBH14', 'JEEP', 'SRT', 2014, 'S/C', 85000) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '2658', 'GBBH14', 'XPIPE INOX', 'XPIPE INOX', 379900, 'completada', '2024-10-24');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 1406: OT 2659
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'MARCELO' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'MARCELO', '', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'SIN-PAT' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'SIN-PAT', 'PORSCHE', 'CAYENNE', 0, 'S/C', 0) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '2659', 'SIN-PAT', 'CUT OUT 2,5'''' SMG', 'CUT OUT 2,5'''' SMG', 399900, 'completada', '2024-10-24');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 1407: OT 2660
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'PABLO TAMBURINI' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'PABLO TAMBURINI', '17952916-5', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'LCYT61' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'LCYT61', 'AUDI', 'RS Q3', 2019, 'S/C', 63) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '2660', 'LCYT61', 'SUPRIMIR SILENCIADOR CENTRAL', 'SUPRIMIR SILENCIADOR CENTRAL', 60000, 'completada', '2024-10-24');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 1408: OT 2661
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'NICOLAS DIAZ VALDEZ' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'NICOLAS DIAZ VALDEZ', '18636883-5', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'NX1219' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'NX1219', 'MITSUBISHI', 'MONTERO', 1996, 'S/C', 300) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '2661', 'NX1219', 'INSTALACION SILENCIADOR ALTO FLUJO MAGNAFLOW EXHAUST', 'INSTALACION SILENCIADOR ALTO FLUJO MAGNAFLOW EXHAUST', 319900, 'completada', '2024-10-25');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 1409: OT 2662
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'NICOLAS WILLIAMSON' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'NICOLAS WILLIAMSON', '', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'SIN-PAT' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'SIN-PAT', 'FORD', 'F150', 0, 'S/C', 0) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '2662', 'SIN-PAT', 'SACA CUT OUT DE 1 CAMIONETA E REINSTALADA EN UNA F150', 'SACA CUT OUT DE 1 CAMIONETA E REINSTALADA EN UNA F150', 120000, 'completada', '2024-10-28');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 1410: OT 2663
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'VICTOR RIOS' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'VICTOR RIOS', '', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'KVRT95' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'KVRT95', 'CHEVROLET', 'CAMARO', 0, 'S/C', 0) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '2663', 'KVRT95', 'SILENCIADOR MAGNAFLOW 2 MANTIENE COLAS', 'SILENCIADOR MAGNAFLOW 2 MANTIENE COLAS', 635000, 'completada', '2024-10-28');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 1411: OT 2664
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'JUAN CARLOS ZAMORA' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'JUAN CARLOS ZAMORA', '', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'SIN-PAT' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'SIN-PAT', 'DODGE', '1500', 0, 'S/C', 0) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '2664', 'SIN-PAT', 'INSTALACION CUT OUT 3''''', 'INSTALACION CUT OUT 3''''', 399900, 'completada', '2024-10-29');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 1412: OT 2665
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'YAREDT' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'YAREDT', '18842155-5', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'SIN-PAT' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'SIN-PAT', 'MAZDA', 'S/M', 2019, 'S/C', 40000) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '2665', 'SIN-PAT', 'SILENCIADOR CON VALVULA', 'SILENCIADOR CON VALVULA', 749900, 'completada', '2024-10-29');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 1413: OT 2666
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'TOMAS VALENZUELA' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'TOMAS VALENZUELA', '20753576-4', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'FVJZ52' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'FVJZ52', 'BMW', '328I', 0, 'S/C', 118500) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '2666', 'FVJZ52', 'LINEA COMPLETA CON SILENCIADOR SMG Y WICKED BALA', 'LINEA COMPLETA CON SILENCIADOR SMG Y WICKED BALA', 1199900, 'completada', '2024-10-30');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 1414: OT 2667
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'BRIAN' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'BRIAN', '18101004-K', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'TLPY43' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'TLPY43', 'MUSTANG', 'GT', 2024, 'S/C', 0) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '2667', 'TLPY43', 'XPIPE MUSTANG', 'XPIPE MUSTANG', 249900, 'completada', '2024-10-31');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 1415: OT 2668
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'ROMANO' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'ROMANO', '12622102-7', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'JSHR94' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'JSHR94', 'CHEVROLET', 'S/M', 2021, 'S/C', 0) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '2668', 'JSHR94', 'REMOVER CATALITICOS', 'REMOVER CATALITICOS', 240000, 'completada', '2024-11-04');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 1416: OT 2669
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'MATIAS PUFEE' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'MATIAS PUFEE', '4738802-3', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'SIN-PAT' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'SIN-PAT', 'S/M', 'S/M', 0, 'S/C', 0) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '2669', 'SIN-PAT', 'INSTALACION COLAS', 'INSTALACION COLAS', 449900, 'completada', '2024-11-05');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 1417: OT 2670
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'NICOLAS WILLIAMSON' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'NICOLAS WILLIAMSON', '', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'RYYV37' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'RYYV37', 'FORD', 'F150 LARIAT', 2022, 'S/C', 0) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '2670', 'RYYV37', 'CAMBIO DE CUT OUT + INSTALACION DE CUT OUT A FORD', 'CAMBIO DE CUT OUT + INSTALACION DE CUT OUT A FORD', 240000, 'completada', '2024-11-06');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 1418: OT 2671
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'FRANCISCO' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'FRANCISCO', '20328334-2', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'SIN-PAT' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'SIN-PAT', 'BMW', '24', 2003, 'S/C', 0) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '2671', 'SIN-PAT', 'ELIMINAR SILENCIADOR TRASERO', 'ELIMINAR SILENCIADOR TRASERO', 240000, 'completada', '2024-11-08');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 1419: OT 2672
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'JAIME RIFFO' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'JAIME RIFFO', '', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'PDGX96' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'PDGX96', 'RENAULT', 'MEGANE', 2020, 'S/C', 42000) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '2672', 'PDGX96', 'INSTALACION SILENCIADOR WICKED BALA', 'INSTALACION SILENCIADOR WICKED BALA', 250000, 'completada', '2024-11-13');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 1420: OT 2673
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'DIEGO ORDENES' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'DIEGO ORDENES', '', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'GCWF19' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'GCWF19', 'MERCEDES BENZ', 'A 45', 2019, 'S/C', 33642) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '2673', 'GCWF19', 'REPARACION GARANTIA', 'REPARACION GARANTIA', 0, 'completada', '2024-11-13');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 1421: OT 2674
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'CARLOS' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'CARLOS', '17849468-6', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'BLRF43' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'BLRF43', 'AUDI', 'A3', 0, 'S/C', 0) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '2674', 'BLRF43', 'INSTALACION SILENCIADOR VIBRANT', 'INSTALACION SILENCIADOR VIBRANT', 130000, 'completada', '2026-01-01');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 1422: OT 2675
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'FRANCISCO PEÑA' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'FRANCISCO PEÑA', '16571457-1', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'PDSW14' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'PDSW14', 'DODGE', 'RAM 1500', 2021, 'S/C', 80132) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '2675', 'PDSW14', 'SE ELIMINA FLEXIBLE (ROTO) - SE SUPRIMEN 2 SILENCIADORES MUFFLER PARA DELETE + SPRINTBOOSTER', 'SE ELIMINA FLEXIBLE (ROTO) - SE SUPRIMEN 2 SILENCIADORES MUFFLER PARA DELETE + SPRINTBOOSTER', 489900, 'completada', '2024-11-14');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 1423: OT 2676
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'EDUARDO' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'EDUARDO', '', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'GZWS79' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'GZWS79', 'BMW', '135I', 0, 'S/C', 0) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '2676', 'GZWS79', 'INSTALACION CUT OUT 3''''', 'INSTALACION CUT OUT 3''''', 394900, 'completada', '2024-11-14');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 1424: OT 2677
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'MARIO' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'MARIO', '19382068-9', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'SIN-PAT' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'SIN-PAT', 'SUZUKI', 'SWIFT', 2019, 'S/C', 0) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '2677', 'SIN-PAT', 'GARANTIA DOWNPIPE', 'GARANTIA DOWNPIPE', 0, 'completada', '2024-11-15');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 1425: OT 2678
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'JUAN' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'JUAN', '15708311-4', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'HFBL94' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'HFBL94', 'FORD', 'F150', 2015, 'S/C', 0) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '2678', 'HFBL94', 'REEMPLAZO DE SILENCIADOR ORIGINAL POR UNO ALTO FLUJO', 'REEMPLAZO DE SILENCIADOR ORIGINAL POR UNO ALTO FLUJO', 289900, 'completada', '2024-11-18');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 1426: OT 2679
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'CLIENTE GENERICO' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'CLIENTE GENERICO', '', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'SIN-PAT' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'SIN-PAT', 'S/M', 'S/M', 0, 'S/C', 0) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '2679', 'SIN-PAT', 'Carga masiva', 'Carga masiva', 0, 'completada', '2026-01-01');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 1427: OT 2680
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'PERCI ORBESO' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'PERCI ORBESO', '23993391-2', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'JKSX40' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'JKSX40', 'VOLKSWAGEN', 'GOLF TDI', 2016, 'S/C', 106350) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '2680', 'JKSX40', 'STAGE 1 C/ DPF OFF EGR OFF SD BLUE OFF DECAT', 'STAGE 1 C/ DPF OFF EGR OFF SD BLUE OFF DECAT', 390000, 'completada', '2024-11-19');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 1428: OT 2681
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'PATRICIO AGUIRRE' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'PATRICIO AGUIRRE', '', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'FPFH60' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'FPFH60', 'AUDI', 'A5', 2013, 'S/C', 0) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '2681', 'FPFH60', 'INSTALACION SILENCIADOR ORIGINAL', 'INSTALACION SILENCIADOR ORIGINAL', 100000, 'completada', '2024-11-20');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 1429: OT 2682
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'PATRICIO AGUIRRE' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'PATRICIO AGUIRRE', '', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'FPFH60' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'FPFH60', 'AUDI', 'A5', 2013, 'S/C', 0) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '2682', 'FPFH60', 'CORRECCION DE LINEA CENTRAL + AXLE BACK FREE ( ELIMINA 2 MAGNAFLOW)', 'CORRECCION DE LINEA CENTRAL + AXLE BACK FREE ( ELIMINA 2 MAGNAFLOW)', 220000, 'completada', '2024-11-20');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 1430: OT 2683
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'SLIMEN NASER' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'SLIMEN NASER', '25862712-1', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'THZR40' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'THZR40', 'CUPRA', 'FORMENTOR', 2024, 'S/C', 5260) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '2683', 'THZR40', 'FABRICACION  DOWNPIPE INOX + REPRO DE ECU STAGE 2 OPF OFF', 'FABRICACION  DOWNPIPE INOX + REPRO DE ECU STAGE 2 OPF OFF', 1200000, 'completada', '2024-11-20');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 1431: OT 2684
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'HUGO ARAYA' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'HUGO ARAYA', '15670403-2', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'RCPW41' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'RCPW41', 'VOLKSWAGEN', 'S/M', 2021, 'S/C', 37500) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '2684', 'RCPW41', 'INSTALACION COLA 3'''' Y REMOVER SILENCIADOR DEL MEDIO', 'INSTALACION COLA 3'''' Y REMOVER SILENCIADOR DEL MEDIO', 279900, 'completada', '2024-11-21');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 1432: OT 2685
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'FRANCISCO GUTIERREZ' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'FRANCISCO GUTIERREZ', '16387183-1', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'TGSG59' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'TGSG59', 'SUZUKI', 'SWIFT', 0, 'S/C', 0) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '2685', 'TGSG59', 'LINEA COMPLETA INOX 2,5'''' + SILENCIADOR ALTO FLUJO WICKEDFLOW + 2 COLAS', 'LINEA COMPLETA INOX 2,5'''' + SILENCIADOR ALTO FLUJO WICKEDFLOW + 2 COLAS', 699900, 'completada', '2024-11-21');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 1433: OT 2686
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'JAVIER VALENZUELA' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'JAVIER VALENZUELA', '17730161-2', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'WG2554' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'WG2554', 'SUBARU', 'LEGACY', 2006, 'S/C', 0) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '2686', 'WG2554', 'MODIFICACION Y FABRICACION DE XPIPE CON SILENCIADOR + CATALITICO ALTO FLUJO MAGNAFLOW C/ CAMBIO DE FLEXIBLE + 2 HILO SONDA OXIGENO', 'MODIFICACION Y FABRICACION DE XPIPE CON SILENCIADOR + CATALITICO ALTO FLUJO MAGNAFLOW C/ CAMBIO DE FLEXIBLE + 2 HILO SONDA OXIGENO', 569800, 'completada', '2024-11-25');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 1434: OT 2687
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'LUIS VERGARA' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'LUIS VERGARA', '20199682-1', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'SIN-PAT' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'SIN-PAT', 'PEUGEOT', '208', 2022, 'S/C', 0) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '2687', 'SIN-PAT', 'ELIMINAR SILENCIADOR DEL MEDIO', 'ELIMINAR SILENCIADOR DEL MEDIO', 75000, 'completada', '2024-11-25');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 1435: OT 2688
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'MAURICIO AVILES' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'MAURICIO AVILES', '', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'SIN-PAT' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'SIN-PAT', 'GEELY', 'COOLRAY', 0, 'S/C', 17500) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '2688', 'SIN-PAT', 'INSTALACION BLOW OFF', 'INSTALACION BLOW OFF', 164900, 'completada', '2024-11-28');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 1436: OT 2689
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'JULIAN PAEZ' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'JULIAN PAEZ', '15090799-3', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'FWGH94' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'FWGH94', 'HYUNDAI', 'ELANTRA', 2013, 'S/C', 0) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '2689', 'FWGH94', 'AXLE BACK SILENT PRO - CAMBIO DE FLEXIBLE', 'AXLE BACK SILENT PRO - CAMBIO DE FLEXIBLE', 299900, 'completada', '2024-11-28');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 1437: OT 2690
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'JULIO BRAVO' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'JULIO BRAVO', '18186531-8', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'TBFL34' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'TBFL34', 'CHEVROLET', 'TRAVERSE', 2014, 'S/C', 0) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '2690', 'TBFL34', 'INSTALACION CUT OUT SMG 3''''', 'INSTALACION CUT OUT SMG 3''''', 419900, 'completada', '2024-11-28');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 1438: OT 2691
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'GONZALO ALVAREZ' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'GONZALO ALVAREZ', '15590539-5', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'JXBG14' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'JXBG14', 'BMW', '120I', 0, 'S/C', 0) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '2691', 'JXBG14', 'INSTALACION CUT OUT 2,5''''', 'INSTALACION CUT OUT 2,5''''', 419900, 'completada', '2024-11-29');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 1439: OT 2692
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'RODRIGO CAMPOS' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'RODRIGO CAMPOS', '10717416-8', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'LZFC13' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'LZFC13', 'CHEVROLET', 'SILVERADO', 2020, 'S/C', 96000) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '2692', 'LZFC13', 'INSTALACION DE CUT OUT 3''''', 'INSTALACION DE CUT OUT 3''''', 419900, 'completada', '2024-11-29');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 1440: OT 2693
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'DAVID RODRIGUEZ' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'DAVID RODRIGUEZ', '19429293-8', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'CDKZ78' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'CDKZ78', 'SUBARU', 'STI', 2002, 'S/C', 141344) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '2693', 'CDKZ78', 'MID PIPE C/ FLEXIBLE NUEVO + SILENCIADOR SMG 3'''' C/2 CONTROL REMOTO - UP GRADE COLA 5'''' BLACK', 'MID PIPE C/ FLEXIBLE NUEVO + SILENCIADOR SMG 3'''' C/2 CONTROL REMOTO - UP GRADE COLA 5'''' BLACK', 824800, 'completada', '2024-12-02');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 1441: OT 2694
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'PABLO PANQUINAO' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'PABLO PANQUINAO', '17580502-K', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'JGTD40' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'JGTD40', 'TOYOTA', '4 RUNNER', 2017, 'S/C', 97892) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '2694', 'JGTD40', 'INSTALACION SILENCIADOR ALTO FLUJO SMG 2,5'''' C/2 CONTROL REMOTO', 'INSTALACION SILENCIADOR ALTO FLUJO SMG 2,5'''' C/2 CONTROL REMOTO', 619900, 'completada', '2024-12-02');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 1442: OT 2695
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'IGNACIO CARRASCO' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'IGNACIO CARRASCO', '', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'SIN-PAT' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'SIN-PAT', 'TOYOTA', 'S/M', 2018, 'S/C', 0) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '2695', 'SIN-PAT', 'CAMBIO EMPAQUE', 'CAMBIO EMPAQUE', 20000, 'completada', '2024-12-03');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 1443: OT 2696
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'YAMAL FIERRO' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'YAMAL FIERRO', '17737898-4', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'LTLD28' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'LTLD28', 'FORD', 'F150', 2020, 'S/C', 89) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '2696', 'LTLD28', 'REPARACION CUT OUT SILENPRO', 'REPARACION CUT OUT SILENPRO', 20000, 'completada', '2024-12-03');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 1444: OT 2697
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'SEBASTIAN PIZARRO' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'SEBASTIAN PIZARRO', '16848359-7', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'SPTC12' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'SPTC12', 'HONDA', 'CIVIC', 2023, 'S/C', 43) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '2697', 'SPTC12', 'LINEA COMPLETA 2,5'''' + SILENCIADORES ALTO FLUJO WICKED OVALADOS', 'LINEA COMPLETA 2,5'''' + SILENCIADORES ALTO FLUJO WICKED OVALADOS', 749900, 'completada', '2024-12-04');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 1445: OT 2698
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'FABIAN CARVAJAL' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'FABIAN CARVAJAL', '16500674-7', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'HPVT91' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'HPVT91', 'PORSCHE', 'MACAN', 2016, 'S/C', 98) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '2698', 'HPVT91', 'ABONO PARA REPRO Y DOWNPIPE', 'ABONO PARA REPRO Y DOWNPIPE', 968900, 'completada', '2024-12-04');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 1446: OT 2699
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'RUBEN FERNANDEZ' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'RUBEN FERNANDEZ', '15570912-K', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'GHWR66' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'GHWR66', 'BMW', '420I', 2014, 'S/C', 97777) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '2699', 'GHWR66', 'COLAS M-PERFORMANCE DUAL - INSTALACION SILENCIADOR + COLAS', 'COLAS M-PERFORMANCE DUAL - INSTALACION SILENCIADOR + COLAS', 369900, 'completada', '2024-12-05');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 1447: OT 2700
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'MARIO ARROYO' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'MARIO ARROYO', '16666986-3', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'HSDW52' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'HSDW52', 'BMW', '235I', 2016, 'S/C', 94974) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '2700', 'HSDW52', 'DOWNPIPE INOX INSTALADO - REPROGRAMACION DECAT', 'DOWNPIPE INOX INSTALADO - REPROGRAMACION DECAT', 579900, 'completada', '2024-12-05');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 1448: OT 2701
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'VICTOR MIRANDA' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'VICTOR MIRANDA', '9476670-2', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'KVLJ15' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'KVLJ15', 'CHEVROLET', 'D MAX', 2019, 'S/C', 75534) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '2701', 'KVLJ15', 'REPROGRAMACION STAGE 1 POTENCIA +DPF OFF + EGR OFF + DECAT', 'REPROGRAMACION STAGE 1 POTENCIA +DPF OFF + EGR OFF + DECAT', 400000, 'completada', '2024-12-05');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 1449: OT 2702
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'DIESEL TUNING' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'DIESEL TUNING', '', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'HRGR74' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'HRGR74', 'CHEVROLET', 'SILVERADO', 0, 'S/C', 153285) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '2702', 'HRGR74', 'CAMBIO DE CATALITICO ALTO FLUJO + SILENCIADOR ALTO FLUJO', 'CAMBIO DE CATALITICO ALTO FLUJO + SILENCIADOR ALTO FLUJO', 0, 'completada', '2024-12-05');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 1450: OT 2703
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'VICENTE MUÑOZ' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'VICENTE MUÑOZ', '22005987-1', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'JPPP10' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'JPPP10', 'BMW', '118I', 2017, 'S/C', 94351) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '2703', 'JPPP10', 'INSTALACION CATALITICO ALTO FLUJO MAGNAFLOW  - INSTALACION SILENCIADOR SMG DUAL C/SUPRIMIR SILENCIADOR', 'INSTALACION CATALITICO ALTO FLUJO MAGNAFLOW  - INSTALACION SILENCIADOR SMG DUAL C/SUPRIMIR SILENCIADOR', 1129900, 'completada', '2024-12-06');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 1451: OT 2704
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'MLJ TECNOLOGIA' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'MLJ TECNOLOGIA', '', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'SXYX86' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'SXYX86', 'CHEVROLET', 'SILVERADO', 0, 'S/C', 81002) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '2704', 'SXYX86', 'INSTALACION CUT OUT 3'''' SMG C/2 CONTROL REMOTO', 'INSTALACION CUT OUT 3'''' SMG C/2 CONTROL REMOTO', 419900, 'completada', '2024-12-06');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 1452: OT 2705
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'FELIPE MORGADO' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'FELIPE MORGADO', '16151113-7', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'RXFY17' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'RXFY17', 'FORD', 'F150', 2022, 'S/C', 47000) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '2705', 'RXFY17', 'INSTALACION CUT OUT 3''''', 'INSTALACION CUT OUT 3''''', 419900, 'completada', '2024-12-09');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 1453: OT 2706
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'MONICA MUÑOZ' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'MONICA MUÑOZ', '15906787-4', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'SVKB28' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'SVKB28', 'FORD', 'EDGE ST', 2023, 'S/C', 24821) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '2706', 'SVKB28', 'SUPRIMIR SILENCIADOR DE CENTRAL POR INOX - INSTALACION 2 SILENCIADOR SMG 2,5'''' VALVETRON', 'SUPRIMIR SILENCIADOR DE CENTRAL POR INOX - INSTALACION 2 SILENCIADOR SMG 2,5'''' VALVETRON', 1350000, 'completada', '2024-12-10');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 1454: OT 2707
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'MORALES' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'MORALES', '76948407-8', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'PHTX17' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'PHTX17', 'DODGE', 'DURANGO', 2020, 'S/C', 38265) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '2707', 'PHTX17', 'SUPRIMIR SILENCIADOR CENTRAL POR Y PIPE INOX', 'SUPRIMIR SILENCIADOR CENTRAL POR Y PIPE INOX', 279900, 'completada', '2024-12-10');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 1455: OT 2708
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'MARCELO JARA' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'MARCELO JARA', '13042953-K', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'LDKZ78' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'LDKZ78', 'SUBARU', 'IMPRESA', 2019, 'S/C', 64000) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '2708', 'LDKZ78', 'AXLE BACK WICKEDFLOW EXHAUST C/COLAS Y FLANGE', 'AXLE BACK WICKEDFLOW EXHAUST C/COLAS Y FLANGE', 319900, 'completada', '2024-12-11');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 1456: OT 2709
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'JORGE CABRERA' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'JORGE CABRERA', '14293680-1', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'RGJB31' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'RGJB31', 'CHEVROLET', 'SILVERADO', 2022, 'S/C', 48000) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '2709', 'RGJB31', 'CAMBIO DE MODULO CUT OUT (GARANTIA)', 'CAMBIO DE MODULO CUT OUT (GARANTIA)', 0, 'completada', '2024-12-11');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 1457: OT 2710
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'BENJAMIN PUFFE' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'BENJAMIN PUFFE', '19606832-6', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'HPGC15' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'HPGC15', 'CHEVROLET', 'SILVERADO', 2016, 'S/C', 90000) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '2710', 'HPGC15', 'INSTALACION DE SILENCIADOR ALTO FLUJO WICKEDFLOW KAMIKAZE', 'INSTALACION DE SILENCIADOR ALTO FLUJO WICKEDFLOW KAMIKAZE', 319900, 'completada', '2024-12-11');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 1458: OT 2711
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'JOSE CORTES' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'JOSE CORTES', '14573994-2', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'SIN-PAT' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'SIN-PAT', 'S/M', 'S/M', 0, 'S/C', 0) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '2711', 'SIN-PAT', 'FABRICACION PIEZA INOX POR MUESTRA PLASTICA', 'FABRICACION PIEZA INOX POR MUESTRA PLASTICA', 179900, 'completada', '2024-12-11');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 1459: OT 2712
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'FABIAN CARVAJAL' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'FABIAN CARVAJAL', '16500674-7', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'HPVT91' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'HPVT91', 'PORSCHE', 'MACAN', 2016, 'S/C', 100000) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '2712', 'HPVT91', 'FABRICACION DOWNPIPE DEJA EL AUTO EN EL TALLER', 'FABRICACION DOWNPIPE DEJA EL AUTO EN EL TALLER', 968000, 'completada', '2024-12-11');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 1460: OT 2713
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'JORGE VILLALOBOS' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'JORGE VILLALOBOS', '18668450-8', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'PGCW79' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'PGCW79', 'MERCEDES', 'C220 CDI', 2013, 'S/C', 248391) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '2713', 'PGCW79', 'CHEQUEO DOWNPIPE ORIGINAL PARA VACIADO DELTE - REPRO DE ECU STAGE 2 C/ DPF Y EGR DECAT - START STOP', 'CHEQUEO DOWNPIPE ORIGINAL PARA VACIADO DELTE - REPRO DE ECU STAGE 2 C/ DPF Y EGR DECAT - START STOP', 670000, 'completada', '2024-12-12');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 1461: OT 2714
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'RENE CABRERA' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'RENE CABRERA', '12468761-6', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'TKYC41' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'TKYC41', 'DODGE', 'RAM', 2024, 'S/C', 13289) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '2714', 'TKYC41', 'INSTALACION DE CUT OUT 3'''' C/ 2 CONTROL REMOTO - FILTRO BMC', 'INSTALACION DE CUT OUT 3'''' C/ 2 CONTROL REMOTO - FILTRO BMC', 519900, 'completada', '2024-12-12');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 1462: OT 2715
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'ALAN RIQUELME' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'ALAN RIQUELME', '17518509-7', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'SIN-PAT' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'SIN-PAT', 'S/M', 'S/M', 0, 'S/C', 170000) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '2715', 'SIN-PAT', 'INSTALACION WICKED CON COLA DOBLE', 'INSTALACION WICKED CON COLA DOBLE', 479900, 'completada', '2024-12-13');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 1463: OT 2716
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'VICTOR SOTO' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'VICTOR SOTO', '15806089-2', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'KLDB33' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'KLDB33', 'CHEVROLET', 'SILVERADO', 2018, 'S/C', 120000) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '2716', 'KLDB33', 'INSTALACION SILENCIADOR ALTO FLUJO MAGNAFLOW BLASPAKK', 'INSTALACION SILENCIADOR ALTO FLUJO MAGNAFLOW BLASPAKK', 289900, 'completada', '2024-12-13');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 1464: OT 2717
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'JOSE FERNANDEZ' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'JOSE FERNANDEZ', '17700603-3', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'LZFS32' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'LZFS32', 'JEEP', 'RAM', 2020, 'S/C', 25000) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '2717', 'LZFS32', 'LINEA COMPLETA CON SILENCIADOR VIBRANT 3''''', 'LINEA COMPLETA CON SILENCIADOR VIBRANT 3''''', 600000, 'completada', '2024-12-13');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 1465: OT 2718
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'JOSE LUIS' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'JOSE LUIS', '16126955-7', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'JJJT24' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'JJJT24', 'VOLKSWAGEN', 'GOLF GTI', 2017, 'S/C', 60000) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '2718', 'JJJT24', 'REPARACION DOWNPIPE ''''TRABAJO EN OTRO LUGAR'''' SE DESMONTA Y REPARA + INSTALACION ALTO FLUJO WICKEDFLOW EXHAUST EN ZONA CENTRAL', 'REPARACION DOWNPIPE ''''TRABAJO EN OTRO LUGAR'''' SE DESMONTA Y REPARA + INSTALACION ALTO FLUJO WICKEDFLOW EXHAUST EN ZONA CENTRAL', 280000, 'completada', '2024-12-16');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 1466: OT 2719
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'FELIPE BALLESTERO' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'FELIPE BALLESTERO', '16997647-3', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'RK8461' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'RK8461', 'LAND ROVER', 'RANGE ROVER', 1997, 'S/C', 187000) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '2719', 'RK8461', 'FABRICACION DE BAJADA MULTIPLES EN INOX + CLAMP PARA CATALITICO CON HILO - 2 CATALITICOS MAGNAFLOW HEAN METAL -FABRICACION DE LINEA A MEDIDA C/ALTO FLUJO WICKEDFLOW', 'FABRICACION DE BAJADA MULTIPLES EN INOX + CLAMP PARA CATALITICO CON HILO - 2 CATALITICOS MAGNAFLOW HEAN METAL -FABRICACION DE LINEA A MEDIDA C/ALTO FLUJO WICKEDFLOW', 1519800, 'completada', '2024-12-16');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 1467: OT 2720
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'CRISTIAN UMAÑA' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'CRISTIAN UMAÑA', '13467700-6', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'LXYX82' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'LXYX82', 'MERCEDES', 'A35', 2020, 'S/C', 53281) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '2720', 'LXYX82', 'INSTALACION MODULO CUT OUT 63MM C/ 2 CONTROL REMOTO', 'INSTALACION MODULO CUT OUT 63MM C/ 2 CONTROL REMOTO', 419900, 'completada', '2024-12-16');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 1468: OT 2721
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'CRISTIAN UMAÑA' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'CRISTIAN UMAÑA', '13476700-6', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'SIN-PAT' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'SIN-PAT', 'MERCEDES', 'A35', 2020, 'S/C', 53281) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '2721', 'SIN-PAT', 'SE RETIRA SILENCIADOR POR TRAMO RECTO', 'SE RETIRA SILENCIADOR POR TRAMO RECTO', 70000, 'completada', '2024-12-18');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 1469: OT 2722
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'JAIME MOYA' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'JAIME MOYA', '17703978-0', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'SIN-PAT' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'SIN-PAT', 'SUZUKI', 'SWIFF', 2024, 'S/C', 3500) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '2722', 'SIN-PAT', 'EXTRACCION DE SILENCIADORES E INSTALACION TRAMO RECTO', 'EXTRACCION DE SILENCIADORES E INSTALACION TRAMO RECTO', 85000, 'completada', '2024-12-18');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 1470: OT 2723
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'ELADIO ANGEL' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'ELADIO ANGEL', '26682416-0', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'TLCP44' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'TLCP44', 'SUZUKI', 'JINNY', 2024, 'S/C', 0) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '2723', 'TLCP44', 'SUPRIMIR SILENCIADOR INTERMEDIO + AXLE BACK WICKEDFLOW EXHAUST C/ COLAS NUEVAS WICKED', 'SUPRIMIR SILENCIADOR INTERMEDIO + AXLE BACK WICKEDFLOW EXHAUST C/ COLAS NUEVAS WICKED', 430000, 'completada', '2024-12-18');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 1471: OT 2724
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'FRANCO ESCOBAR' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'FRANCO ESCOBAR', '', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'CRFX15' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'CRFX15', 'VOLVO', '560 DS', 2011, 'S/C', 0) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '2724', 'CRFX15', 'REPRO DE ECU STAGE 2 DPF OFF EGR OFF +50HP 80NM', 'REPRO DE ECU STAGE 2 DPF OFF EGR OFF +50HP 80NM', 519900, 'completada', '2024-12-20');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 1472: OT 2725
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'CRISTIAN SUAREZ' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'CRISTIAN SUAREZ', '16550409-7', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'LJPV42' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'LJPV42', 'MERCEDES', 'A200', 2019, 'S/C', 43) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '2725', 'LJPV42', 'AXLE BACK FREE', 'AXLE BACK FREE', 219900, 'completada', '2024-12-20');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 1473: OT 2726
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'LORENZO BONANI' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'LORENZO BONANI', '20655082-1', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'PPHW10' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'PPHW10', 'BMW', '240I', 2021, 'S/C', 52550) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '2726', 'PPHW10', 'INSTALACION RESORTE VALVULA CUT OUT ORIGINAL', 'INSTALACION RESORTE VALVULA CUT OUT ORIGINAL', 30000, 'completada', '2024-12-20');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 1474: OT 2727
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'JORGE WAI' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'JORGE WAI', '13461520-6', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'GJGD35' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'GJGD35', 'TOYOTA', 'LAND CRUISER', 2015, 'S/C', 0) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '2727', 'GJGD35', 'GARANTIA CUT OUT SE HACE MANTENCION Y SE PROGRAMA 1 CONTROL', 'GARANTIA CUT OUT SE HACE MANTENCION Y SE PROGRAMA 1 CONTROL', 0, 'completada', '2024-12-20');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 1475: OT 2728
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'BENJAMIN CARVAJAL' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'BENJAMIN CARVAJAL', '19309968-8', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'VG5350' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'VG5350', 'VOLKSWAGEN', 'POLO', 2002, 'S/C', 148849) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '2728', 'VG5350', 'INSTALACION SILENCIADOR SILEMPRO CENTRAL', 'INSTALACION SILENCIADOR SILEMPRO CENTRAL', 219900, 'completada', '2024-12-20');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 1476: OT 2729
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'KEVIN DINTER' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'KEVIN DINTER', '18947699-K', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'LLTT35' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'LLTT35', 'VOLKSWAGEN', 'JETTA', 2019, 'S/C', 57665) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '2729', 'LLTT35', 'AXLE BACK C/ COLAS Y CUT OUT', 'AXLE BACK C/ COLAS Y CUT OUT', 650000, 'completada', '2024-12-23');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 1477: OT 2730
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'CARLOS SAAVEDRA' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'CARLOS SAAVEDRA', '20957515-9', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'RFHT39' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'RFHT39', 'SUBARU', 'IMPREZA', 2021, 'S/C', 68000) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '2730', 'RFHT39', 'CUT OUT', 'CUT OUT', 999900, 'completada', '2024-12-24');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 1478: OT 2731
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'JAVIER LOPEZ' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'JAVIER LOPEZ', '20451199-8', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'LCDT13' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'LCDT13', 'BMW', '120I', 2019, 'S/C', 0) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '2731', 'LCDT13', 'DOWNPIPE INOX 3'''' - BUJIAS FRIAS - LINEA COMPLETA 3'''' + SILENCIADOR SMG VALVE  TRONIC - INSTALACION DIFUSOR + ALERON - REPRO STAGE 2', 'DOWNPIPE INOX 3'''' - BUJIAS FRIAS - LINEA COMPLETA 3'''' + SILENCIADOR SMG VALVE  TRONIC - INSTALACION DIFUSOR + ALERON - REPRO STAGE 2', 2100000, 'completada', '2024-12-26');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 1479: OT 2732
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'ALAN MORRON' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'ALAN MORRON', '23586170-4', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'SRYG36' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'SRYG36', 'CUPRA', 'FORMENTOR', 2023, 'S/C', 25) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '2732', 'SRYG36', 'LINEA COMPLETA INOX + SILENCIADOR ALTO FLUJO SMG C/ 2 CONTROL REMOTO + 4 COLAS', 'LINEA COMPLETA INOX + SILENCIADOR ALTO FLUJO SMG C/ 2 CONTROL REMOTO + 4 COLAS', 1499900, 'completada', '2024-12-27');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 1480: OT 2733
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'GONZALO CARES' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'GONZALO CARES', '', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'LWVR13' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'LWVR13', 'CHEVROLET', 'BLAZER', 2020, 'S/C', 0) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '2733', 'LWVR13', 'INSTALACION CUT OUT 2,5'''' C/ 2 CONTROL REMOTO', 'INSTALACION CUT OUT 2,5'''' C/ 2 CONTROL REMOTO', 399900, 'completada', '2024-12-27');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 1481: OT 2734
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'MARTIN VARELA' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'MARTIN VARELA', '18936141-6', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'FVBW90' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'FVBW90', 'MERCEDES', 'C63', 2013, 'S/C', 100000) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '2734', 'FVBW90', 'XPIPE CENTRAL ELIMINA CAT.SECUNDARIO + RESONADOR', 'XPIPE CENTRAL ELIMINA CAT.SECUNDARIO + RESONADOR', 400000, 'completada', '2024-12-30');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 1482: OT 2735
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'MAXIMILIANO TORO' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'MAXIMILIANO TORO', '16638017-0', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'RKXT74' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'RKXT74', 'CHEVROLET', 'SILVERADO', 2022, 'S/C', 42000) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '2735', 'RKXT74', 'INSTALACION SILENCIADOR WICKEDFLOW KAMIKAZE', 'INSTALACION SILENCIADOR WICKEDFLOW KAMIKAZE', 299900, 'completada', '2024-12-30');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 1483: OT 2736
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'CRISTIAN CASTILLO' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'CRISTIAN CASTILLO', '18696761-5', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'HSXK33' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'HSXK33', 'AUDI', 'A3', 2016, 'S/C', 130583) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '2736', 'HSXK33', 'INSTALACION MODULO CUT OUT C/ 2 CONTROL REMOTO', 'INSTALACION MODULO CUT OUT C/ 2 CONTROL REMOTO', 419900, 'completada', '2024-12-30');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 1484: OT 2737
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'FRANCISCO MUÑOZ' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'FRANCISCO MUÑOZ', '18632177-4', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'KVJR79' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'KVJR79', 'DODGE', 'RAM', 2019, 'S/C', 61) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '2737', 'KVJR79', 'INSTALACION SILENCIADOR KAMIKAZE', 'INSTALACION SILENCIADOR KAMIKAZE', 299900, 'completada', '2024-12-30');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 1485: OT 2738
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'ETHAN CHRISTIANSON' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'ETHAN CHRISTIANSON', '22497801-4', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'PTGD17' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'PTGD17', 'BMW', '240I', 2021, 'S/C', 26500) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '2738', 'PTGD17', 'AXLE BACK FREE MANTIENE COLAS', 'AXLE BACK FREE MANTIENE COLAS', 240000, 'completada', '2024-12-31');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 1486: OT 2739
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'LUIS VILLALOBOS' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'LUIS VILLALOBOS', '21555064-8', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'LGLF92' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'LGLF92', 'MITSUBISHI', 'L200', 2019, 'S/C', 0) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '2739', 'LGLF92', 'VACIADO DPF FISICO - REPROGRAMACION ECU DPF OFF EGR OFF', 'VACIADO DPF FISICO - REPROGRAMACION ECU DPF OFF EGR OFF', 450000, 'completada', '2025-01-02');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 1487: OT 2740
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'ETHAN CHRISTIANSON' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'ETHAN CHRISTIANSON', '22497801-4', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'PTGD17' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'PTGD17', 'BMW', '240I', 2021, 'S/C', 26000) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '2740', 'PTGD17', 'LINEA MIDPIPE 3'''' NUEVO INOX 3'''' + SILENCIADOR ALTO FLUJO VIBRANT PERFORMANCE ULTRA QUIET', 'LINEA MIDPIPE 3'''' NUEVO INOX 3'''' + SILENCIADOR ALTO FLUJO VIBRANT PERFORMANCE ULTRA QUIET', 499900, 'completada', '2025-01-02');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 1488: OT 2741
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'RENE SEGURA' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'RENE SEGURA', '10745094-7', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'SIN-PAT' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'SIN-PAT', 'S/M', 'S/M', 0, 'S/C', 0) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '2741', 'SIN-PAT', 'CAMBIO Y EMPAQUE', 'CAMBIO Y EMPAQUE', 50000, 'completada', '2025-01-02');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 1489: OT 2742
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'CARLOS DIAZ' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'CARLOS DIAZ', '12809489-9', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'SIN-PAT' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'SIN-PAT', 'FORD', 'F1500', 2009, 'S/C', 199000) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '2742', 'SIN-PAT', 'INSTALACION CUT OUT C/ 2 CONTROL REMOTO - MIDPIPE AXLE BACK DUAL C/ SOPORTES NUEVOS SIN COLAS CORTE 45'' - SPRINTBOOSTER', 'INSTALACION CUT OUT C/ 2 CONTROL REMOTO - MIDPIPE AXLE BACK DUAL C/ SOPORTES NUEVOS SIN COLAS CORTE 45'' - SPRINTBOOSTER', 1199700, 'completada', '2025-01-03');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 1490: OT 2743
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'ALFREDO' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'ALFREDO', '16107374-1', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'FTRW58' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'FTRW58', 'SUBARU', 'LEGACY', 2013, 'S/C', 13000) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '2743', 'FTRW58', 'CUT OUT + SALIDA DOBLE', 'CUT OUT + SALIDA DOBLE', 749900, 'completada', '2025-01-06');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 1491: OT 2744
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'CLIENTE GENERICO' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'CLIENTE GENERICO', '', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'SIN-PAT' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'SIN-PAT', 'S/M', 'S/M', 0, 'S/C', 0) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '2744', 'SIN-PAT', 'Carga masiva', 'Carga masiva', 0, 'completada', '2026-01-01');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 1492: OT 2745
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'MATIAS BRAUN' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'MATIAS BRAUN', '18104982-0', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'TYBH32' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'TYBH32', 'CHEVROLET', 'ZRZ', 2025, 'S/C', 200) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '2745', 'TYBH32', 'INSTALACION MODULO CUT OUT 3'''' C/ 2 CONTROL REMOTO', 'INSTALACION MODULO CUT OUT 3'''' C/ 2 CONTROL REMOTO', 419900, 'completada', '2025-01-07');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 1493: OT 2746
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'HECTOR RODRIGUEZ' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'HECTOR RODRIGUEZ', '17712643-8', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'HWSY27' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'HWSY27', 'TOYOTA', '4 RUNNER', 2017, 'S/C', 134123) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '2746', 'HWSY27', 'LINEA COMPLETA INOX + SILENCIADOR ALTO FLUJO SMG C/ 2 CONTROL REMOTO Y COLA SIMPLE', 'LINEA COMPLETA INOX + SILENCIADOR ALTO FLUJO SMG C/ 2 CONTROL REMOTO Y COLA SIMPLE', 1069000, 'completada', '2025-01-07');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 1494: OT 2747
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'DANIEL MORALES' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'DANIEL MORALES', '5860045-8', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'LWPL18' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'LWPL18', 'MINI', 'F56', 2019, 'S/C', 48895) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '2747', 'LWPL18', 'SUPRIMIR SILENCIADOR ORIGINAL CENTRAL', 'SUPRIMIR SILENCIADOR ORIGINAL CENTRAL', 70000, 'completada', '2025-01-07');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 1495: OT 2748
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'EDUARDO SALDIVIA' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'EDUARDO SALDIVIA', '10957312-4', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'TSLS75' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'TSLS75', 'HONDA', 'CIVIC', 2025, 'S/C', 150) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '2748', 'TSLS75', 'INSTALACION DIFUSOR + FABRICACION DE PIEZA PARA INSTALACION DE COLAS 4'''' - INSTALACION CUT OUT 2'''' C/ 2 CONTROL REMOTO', 'INSTALACION DIFUSOR + FABRICACION DE PIEZA PARA INSTALACION DE COLAS 4'''' - INSTALACION CUT OUT 2'''' C/ 2 CONTROL REMOTO', 669900, 'completada', '2025-01-08');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 1496: OT 2749
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'EDUARDO SALDIVIA' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'EDUARDO SALDIVIA', '10957312-4', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'SGVJ78' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'SGVJ78', 'MINI', 'S/M', 2017, 'S/C', 0) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '2749', 'SGVJ78', 'INSTALACION CUT OUT 2''''', 'INSTALACION CUT OUT 2''''', 419900, 'completada', '2025-01-08');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 1497: OT 2750
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'IVAN CADENAS' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'IVAN CADENAS', '17670644-9', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'GPLB72' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'GPLB72', 'DODGE', 'RAM 1500', 2015, 'S/C', 0) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '2750', 'GPLB72', 'SUPRIMIR SILENCIADOR ORIGINAL', 'SUPRIMIR SILENCIADOR ORIGINAL', 180000, 'completada', '2025-01-08');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 1498: OT 2751
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'ALEJANDRO MUÑOS' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'ALEJANDRO MUÑOS', '17903008-K', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'HTKY93' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'HTKY93', 'AUDI', 'RS 6', 2016, 'S/C', 77721) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '2751', 'HTKY93', 'SE CARGA MAPA STOCK VERSION DECAT CREADA EL 23/03/2023 SIN COSTO', 'SE CARGA MAPA STOCK VERSION DECAT CREADA EL 23/03/2023 SIN COSTO', 0, 'completada', '2025-01-09');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 1499: OT 2752
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'JOSE MALDONADO' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'JOSE MALDONADO', '21468370-9', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'RXSJ44' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'RXSJ44', 'CHEVROLET', 'SILVERADO', 2022, 'S/C', 31408) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '2752', 'RXSJ44', 'INSTALACION CUT OUT 3'''' INCLUYE 2 CONTROL REMOTO', 'INSTALACION CUT OUT 3'''' INCLUYE 2 CONTROL REMOTO', 419900, 'completada', '2025-01-09');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 1500: OT 2753
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'LAS GARZAS SPA' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'LAS GARZAS SPA', '77669587-4', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'RZSX20' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'RZSX20', 'VOLKSWAGEN', 'AMAROK', 2022, 'S/C', 111082) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '2753', 'RZSX20', 'DOWNPIPE + LINEA COMPLETA + REPRO STAGE 2 +120HP+200NM + SPRINTBOOSTER', 'DOWNPIPE + LINEA COMPLETA + REPRO STAGE 2 +120HP+200NM + SPRINTBOOSTER', 1779800, 'completada', '2025-01-13');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    RAISE NOTICE 'Procesados 1500 registros...';
    -- Fila 1501: OT 2754
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'CARLOS QUINSACARA' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'CARLOS QUINSACARA', '16501947-4', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'JHVT95' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'JHVT95', 'MERCEDES BENZ', 'E 2OO', 2017, 'S/C', 57319) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '2754', 'JHVT95', 'INSTALACION MODULO CUT OUT 2,5''''', 'INSTALACION MODULO CUT OUT 2,5''''', 419900, 'completada', '2025-01-13');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 1502: OT 2755
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'NICOLAS CARDENAS' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'NICOLAS CARDENAS', '16368723-2', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'HJWF84' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'HJWF84', 'VOLKSWAGEN', 'GTI MK', 2016, 'S/C', 75146) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '2755', 'HJWF84', 'LINEA COMPLETA INOX 3'''' + SILENCIADOR SMG 3'''' VALVETRONIC + 2 COLAS NUEVAS NEGRAS', 'LINEA COMPLETA INOX 3'''' + SILENCIADOR SMG 3'''' VALVETRONIC + 2 COLAS NUEVAS NEGRAS', 1049900, 'completada', '2025-01-13');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 1503: OT 2756
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'JOSE MOROY' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'JOSE MOROY', '19605606-8', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'KZDG14' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'KZDG14', 'CHEVROLET', 'COLORADO', 2019, 'S/C', 181) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '2756', 'KZDG14', 'DOWNPIPE + MUFFLER DELETE + COLAV+ REPROGRAMACION DPF EGR OFF DECAT', 'DOWNPIPE + MUFFLER DELETE + COLAV+ REPROGRAMACION DPF EGR OFF DECAT', 859900, 'completada', '2025-01-15');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 1504: OT 2757
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'CLAUDIO DUNNER' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'CLAUDIO DUNNER', '10783881-3', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'GVGJ89' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'GVGJ89', 'SUBARU', 'XV', 2014, 'S/C', 138113) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '2757', 'GVGJ89', 'REEMPLAZO CATALITICO', 'REEMPLAZO CATALITICO', 229900, 'completada', '2025-01-15');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 1505: OT 2758
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'JOAQUIN ELIAS' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'JOAQUIN ELIAS', '19689228-1', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'SIN-PAT' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'SIN-PAT', 'VOLKSWAGEN', 'S/M', 2018, 'S/C', 0) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '2758', 'SIN-PAT', 'REVICION ESCAPE', 'REVICION ESCAPE', 40000, 'completada', '2025-01-16');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 1506: OT 2759
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'BELEN LOYOLA' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'BELEN LOYOLA', '21149580-4', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'SIN-PAT' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'SIN-PAT', 'RANGE ROVER', 'L461', 2024, 'S/C', 0) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '2759', 'SIN-PAT', 'ABONO Y RECEPCION DE DOLARES POR IMPORTACIONBODY KIT -VALOR 4.112 RECIBO 4.200 USD', 'ABONO Y RECEPCION DE DOLARES POR IMPORTACIONBODY KIT -VALOR 4.112 RECIBO 4.200 USD', 0, 'completada', '2025-01-16');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 1507: OT 2760
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'MARCO GEA' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'MARCO GEA', '22074692-5', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'BPGZ77' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'BPGZ77', 'MITSUBISHI', 'LANGER', 2008, 'S/C', 0) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '2760', 'BPGZ77', 'CAMBIO SILENCIADOR WICKED', 'CAMBIO SILENCIADOR WICKED', 229900, 'completada', '2025-01-17');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 1508: OT 2761
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'FABIAN CARRASCO' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'FABIAN CARRASCO', '11682529-5', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'LRWY52' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'LRWY52', 'VOLVO', 'XC40', 2020, 'S/C', 53000) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '2761', 'LRWY52', 'LINEA COMPLETA INOX C/ SILENCIADOR ALTO FLUJO 1 ENTRADA 2 SALIDA SILEMPRO EXHAUST', 'LINEA COMPLETA INOX C/ SILENCIADOR ALTO FLUJO 1 ENTRADA 2 SALIDA SILEMPRO EXHAUST', 649900, 'completada', '2025-01-17');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 1509: OT 2762
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'LUIS' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'LUIS', '19364392-8', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'HKDY41' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'HKDY41', 'JEEP', 'SRT', 2015, 'S/C', 140000) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '2762', 'HKDY41', 'CAMBIO SOPORTE', 'CAMBIO SOPORTE', 0, 'completada', '2025-01-20');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 1510: OT 2763
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'NICOLAS ALFARO' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'NICOLAS ALFARO', '19832765-4', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'PJRT20' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'PJRT20', 'MAZDA', '3', 2021, 'S/C', 41000) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '2763', 'PJRT20', 'FABRICACION LINEA COMPLETA 2'''' MAS SILENCIADOR WICKEDFLOW CON COLAS EN 4''''', 'FABRICACION LINEA COMPLETA 2'''' MAS SILENCIADOR WICKEDFLOW CON COLAS EN 4''''', 604900, 'completada', '2025-01-20');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 1511: OT 2764
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'RODOLFO MAYER' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'RODOLFO MAYER', '15551117-6', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'DHDR69' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'DHDR69', 'JEEP', 'CHEROKEE', 2012, 'S/C', 114) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '2764', 'DHDR69', '2 SILENCIADORES BORLA ATAK - 2 COLAS INOX BLACK - INSTALACION SILENCIADORES + SOPORTES NUEVOS', '2 SILENCIADORES BORLA ATAK - 2 COLAS INOX BLACK - INSTALACION SILENCIADORES + SOPORTES NUEVOS', 1279000, 'completada', '2025-01-20');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 1512: OT 2765
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'GUILLERMO CHAMORRO' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'GUILLERMO CHAMORRO', '17600413-4', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'TWSX20' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'TWSX20', 'FORD', 'EXPLORED', 2025, 'S/C', 1000) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '2765', 'TWSX20', 'AXLE BACK FREE INOX 2,5'''' + 2 COLAS DOBLES 4'''' CADA UNA BLACK', 'AXLE BACK FREE INOX 2,5'''' + 2 COLAS DOBLES 4'''' CADA UNA BLACK', 0, 'completada', '2025-01-21');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 1513: OT 2766
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'JAVIER ORTEGA' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'JAVIER ORTEGA', '15373323-6', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'SIN-PAT' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'SIN-PAT', 'FORD', 'F150', 2019, 'S/C', 81000) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '2766', 'SIN-PAT', 'INSTALACION CUT OUT 3''''', 'INSTALACION CUT OUT 3''''', 419900, 'completada', '2025-01-21');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 1514: OT 2767
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'MAURICIO SAUNA' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'MAURICIO SAUNA', '9252478-8', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'SIN-PAT' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'SIN-PAT', 'CHEVROLET', 'TRAIL BOSS', 0, 'S/C', 0) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '2767', 'SIN-PAT', 'VENTA BORLA ATAK', 'VENTA BORLA ATAK', 499900, 'completada', '2025-01-21');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 1515: OT 2768
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'ANDRES PESCARA' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'ANDRES PESCARA', '19150811-6', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'GJKR57' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'GJKR57', 'SUBARU', 'BRZ 2', 2014, 'S/C', 75111) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '2768', 'GJKR57', 'REEMPLAZO SILENCIADOR CENTRAL ORIGINAL POR ALTO FLUJO VIBRANT PERFORMANCE + AXLE BACK CON CUT OUT SALIENDO POR COLA ORIGINAL MANTIENE SILENCIADOR REPRO ESU STAGE 1', 'REEMPLAZO SILENCIADOR CENTRAL ORIGINAL POR ALTO FLUJO VIBRANT PERFORMANCE + AXLE BACK CON CUT OUT SALIENDO POR COLA ORIGINAL MANTIENE SILENCIADOR REPRO ESU STAGE 1', 1149800, 'completada', '2025-01-22');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 1516: OT 2769
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'MARCELO MANQUEL' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'MARCELO MANQUEL', '19953987-6', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'JHFD53' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'JHFD53', 'MG', '3 CONFORT PLUS', 0, 'S/C', 0) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '2769', 'JHFD53', 'REINSTALACION SILENCIADOR ORIGINAL + FIJAR MOVIMIENTO MUFFLER TRASERO', 'REINSTALACION SILENCIADOR ORIGINAL + FIJAR MOVIMIENTO MUFFLER TRASERO', 69900, 'completada', '2025-01-22');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 1517: OT 2770
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'ATB TRANSPORTES' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'ATB TRANSPORTES', '76107545-4', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'KZLR90' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'KZLR90', 'CHEVROLET', 'SILVERADO', 2019, 'S/C', 34132) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '2770', 'KZLR90', 'INSTALACION MODULO CUT OUT 3'''' C/ CONTROL REMOTO', 'INSTALACION MODULO CUT OUT 3'''' C/ CONTROL REMOTO', 419900, 'completada', '2025-01-22');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 1518: OT 2771
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'CLIENTE GENERICO' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'CLIENTE GENERICO', '', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'SIN-PAT' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'SIN-PAT', 'S/M', 'S/M', 0, 'S/C', 0) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '2771', 'SIN-PAT', 'Carga masiva', 'Carga masiva', 0, 'completada', '2026-01-01');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 1519: OT 2772
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'VICTOR' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'VICTOR', '18246472-4', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'SIN-PAT' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'SIN-PAT', 'S/M', 'S/M', 0, 'S/C', 0) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '2772', 'SIN-PAT', 'AISLANTE TERMICO MULTIPLES CLIENTE LO TRAE', 'AISLANTE TERMICO MULTIPLES CLIENTE LO TRAE', 299900, 'completada', '2025-01-23');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 1520: OT 2773
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'MANUEL CID' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'MANUEL CID', '18221725-5', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'KZSW17' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'KZSW17', 'HYUNDAI', 'VELOSTER 1.6', 2019, 'S/C', 98123) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '2773', 'KZSW17', 'MANTENIMIENTO FILTRO DE AIRE', 'MANTENIMIENTO FILTRO DE AIRE', 29900, 'completada', '2025-01-24');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 1521: OT 2774
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'MAXIMILIANO AGUIRRE' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'MAXIMILIANO AGUIRRE', '21938428-9', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'KZRR73' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'KZRR73', 'BMW', '118I', 2018, 'S/C', 74076) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '2774', 'KZRR73', 'REPARACION FUGA + CARGA MAPA ORIGINAL', 'REPARACION FUGA + CARGA MAPA ORIGINAL', 105000, 'completada', '2025-01-24');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 1522: OT 2775
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'FRANCISCO PONTE' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'FRANCISCO PONTE', '21275429-3', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'HPCY47' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'HPCY47', 'FORD', 'FOCUS', 2016, 'S/C', 82) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '2775', 'HPCY47', 'AXLE BACK FREE + COLAS BLACK', 'AXLE BACK FREE + COLAS BLACK', 319900, 'completada', '2025-01-24');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 1523: OT 2776
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'CRISTOPHER PEREZ' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'CRISTOPHER PEREZ', '19589499-K', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'TU1600' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'TU1600', 'TOYOTA', 'RAV 4', 2000, 'S/C', 203034) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '2776', 'TU1600', 'FABRICACION BAJADA MULTIPLE 2-1 EN 2'''' C/CONEXION EN 2,5'''' + INSTALACION ALTO FLUJO VIBRANT DENTRO DE SILENCIADOR ORIGINAL', 'FABRICACION BAJADA MULTIPLE 2-1 EN 2'''' C/CONEXION EN 2,5'''' + INSTALACION ALTO FLUJO VIBRANT DENTRO DE SILENCIADOR ORIGINAL', 700000, 'completada', '2025-01-27');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 1524: OT 2777
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'CLIENTE GENERICO' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'CLIENTE GENERICO', '', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'SIN-PAT' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'SIN-PAT', 'S/M', 'S/M', 0, 'S/C', 0) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '2777', 'SIN-PAT', 'Carga masiva', 'Carga masiva', 0, 'completada', '2026-01-01');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 1525: OT 2778
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'KEVIN LARA' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'KEVIN LARA', '26344129-K', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'KCRB57' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'KCRB57', 'KIA', 'CERATO', 2018, 'S/C', 72022) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '2778', 'KCRB57', 'AXLE BACK SILEMPRO 2'''' + COLA 3,5'''' BLACK', 'AXLE BACK SILEMPRO 2'''' + COLA 3,5'''' BLACK', 319900, 'completada', '2025-01-27');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 1526: OT 2779
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'EDUARDO AMESTICA' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'EDUARDO AMESTICA', '18592748-2', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'LLCJ89' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'LLCJ89', 'MAZDA', 'CX3', 2020, 'S/C', 121700) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '2779', 'LLCJ89', 'REPROGRAMACION STAGE 1 +14HP+16NM - SPRINTBOOSTER', 'REPROGRAMACION STAGE 1 +14HP+16NM - SPRINTBOOSTER', 559800, 'completada', '2025-01-27');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 1527: OT 2780
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'JUAN IGNACIO' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'JUAN IGNACIO', '20574349-9', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'LJRB92' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'LJRB92', 'SUZUKI', 'SWIFT', 2019, 'S/C', 33000) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '2780', 'LJRB92', 'DOWNPIPE INOX - REPRO DECAT P&B', 'DOWNPIPE INOX - REPRO DECAT P&B', 699800, 'completada', '2025-01-28');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 1528: OT 2781
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'LUCAS LEWIN' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'LUCAS LEWIN', '21678201-1', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'EK5569' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'EK5569', 'BMW', '635', 1985, 'S/C', 76000) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '2781', 'EK5569', 'LINEA COMPLETA NUEVA EN ACERO INOX 2'''' + 2 SILENCIADORES A MEDIDA CON TRATAMIENTO TERMICO Y ANTI CORROSIVO - SOPORTES NUEVOS', 'LINEA COMPLETA NUEVA EN ACERO INOX 2'''' + 2 SILENCIADORES A MEDIDA CON TRATAMIENTO TERMICO Y ANTI CORROSIVO - SOPORTES NUEVOS', 850000, 'completada', '2025-01-28');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 1529: OT 2782
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'CLIENTE GENERICO' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'CLIENTE GENERICO', '', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'PLFB26' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'PLFB26', 'PEUGEOT', 'RIFIER', 2020, 'S/C', 72218) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '2782', 'PLFB26', 'REPROGRAMACION DE ECU DTC OFF P0031 DECAT', 'REPROGRAMACION DE ECU DTC OFF P0031 DECAT', 229900, 'completada', '2025-01-28');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 1530: OT 2783
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'RAFAEL TAGLE' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'RAFAEL TAGLE', '99319340-9', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'LVZW16' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'LVZW16', 'LANG ROVER', 'RANGE ROVER', 2024, 'S/C', 36023) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '2783', 'LVZW16', 'REINSTALACION SILENCIADORES ORIGINALES', 'REINSTALACION SILENCIADORES ORIGINALES', 160000, 'completada', '2025-01-29');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 1531: OT 2784
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'CRISTIAN MENDEZ' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'CRISTIAN MENDEZ', '8936568-6', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'LSKF38' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'LSKF38', 'JEEP', 'WRANGLER', 2020, 'S/C', 30000) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '2784', 'LSKF38', 'INSTALACION CUT OUT 2''''', 'INSTALACION CUT OUT 2''''', 394900, 'completada', '2025-01-30');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 1532: OT 2785
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'CRISTIAN SOTO' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'CRISTIAN SOTO', '21576720-5', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'LBSD30' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'LBSD30', 'TOYOTA', 'PRADO', 2019, 'S/C', 140000) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '2785', 'LBSD30', 'INSTALACION MODULO CUT OUT 2,5'''' C/2 CONTROL REMOTO', 'INSTALACION MODULO CUT OUT 2,5'''' C/2 CONTROL REMOTO', 419900, 'completada', '2025-01-31');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 1533: OT 2786
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'VICENTE' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'VICENTE', '20810105-6', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'SKHR82' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'SKHR82', 'CHEVROLET', 'ZRZ', 2023, 'S/C', 30123) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '2786', 'SKHR82', 'COPIA CONTROL CUT OUT', 'COPIA CONTROL CUT OUT', 35000, 'completada', '2025-01-31');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 1534: OT 2787
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'CRISTIAN CASTILLO' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'CRISTIAN CASTILLO', '18696761-5', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'SIN-PAT' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'SIN-PAT', 'AUDI', 'A3', 0, 'S/C', 0) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '2787', 'SIN-PAT', 'CAMBIO CUT OUT ELIMINAR SILENCIADOR CENTRAL', 'CAMBIO CUT OUT ELIMINAR SILENCIADOR CENTRAL', 120000, 'completada', '2025-01-31');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 1535: OT 2788
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'DANILO ORELLANA' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'DANILO ORELLANA', '19634201-K', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'KFFG56' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'KFFG56', 'MAZDA', 'NEW 3 2.5', 2018, 'S/C', 131068) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '2788', 'KFFG56', 'REPROGRAMACION STAGE 1 +16HP+19NM', 'REPROGRAMACION STAGE 1 +16HP+19NM', 280000, 'completada', '2025-02-04');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 1536: OT 2789
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'DANILO ORELLANA' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'DANILO ORELLANA', '19634201-K', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'RPBR93' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'RPBR93', 'MAZDA', 'NEW CX 9 2.5', 2022, 'S/C', 42441) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '2789', 'RPBR93', 'REPROGRAMACION STAGE 1 GANANCIAS +40HP+50NM', 'REPROGRAMACION STAGE 1 GANANCIAS +40HP+50NM', 280000, 'completada', '2025-02-04');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 1537: OT 2790
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'JOSE HUAQUIMIL' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'JOSE HUAQUIMIL', '15374343-6', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'SIN-PAT' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'SIN-PAT', 'DODGE', 'DAKOTA', 0, 'S/C', 0) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '2790', 'SIN-PAT', 'VENTE EN MESON MAGNAFLOW 18129 GRASSPACK Y REDUCCION', 'VENTE EN MESON MAGNAFLOW 18129 GRASSPACK Y REDUCCION', 129900, 'completada', '2025-02-05');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 1538: OT 2791
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'FABIAN CARRASCO' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'FABIAN CARRASCO', '11682529-5', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'LRWY52' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'LRWY52', 'VOLVO', 'XC40', 2020, 'S/C', 53) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '2791', 'LRWY52', 'INSTALACION RESONADOR INOX SILEMPRO', 'INSTALACION RESONADOR INOX SILEMPRO', 200000, 'completada', '2025-02-05');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 1539: OT 2792
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'ETHAN CHRISTIANSON' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'ETHAN CHRISTIANSON', '22497801-4', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'PTGD17' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'PTGD17', 'BMW', '240I', 2021, 'S/C', 30100) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '2792', 'PTGD17', 'REINSTALACION SILENCIADOR ALTO FLUJO VIBRANT PERFORMANCE - CLIENTE TRAE SILENCIADOR', 'REINSTALACION SILENCIADOR ALTO FLUJO VIBRANT PERFORMANCE - CLIENTE TRAE SILENCIADOR', 50000, 'completada', '2025-02-05');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 1540: OT 2793
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'LUIS CIFUENTES' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'LUIS CIFUENTES', '15651860-3', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'SYGV44' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'SYGV44', 'BMW', '440I', 2023, 'S/C', 10899) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '2793', 'SYGV44', 'AXLE BACK SMG VALVETRONIC DUAL IN/ DUAL OUT C/ 2 CONTROL REMOTO', 'AXLE BACK SMG VALVETRONIC DUAL IN/ DUAL OUT C/ 2 CONTROL REMOTO', 1290000, 'completada', '2025-02-06');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 1541: OT 2794
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'PABLO LEWIN' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'PABLO LEWIN', '', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'DH6865' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'DH6865', 'JAGUAR', 'SOVEREIGN', 1991, 'S/C', 302000) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '2794', 'DH6865', 'LINEA DUAL 2'''' RESTAURANDO CATALITICO + FABRICACION 2 SILENCIADORES ALTO FLUJO A MEDIDA CON RESTAURACION DE COLAS - DIFERENCIA CUBRIR SILENCIADORES', 'LINEA DUAL 2'''' RESTAURANDO CATALITICO + FABRICACION 2 SILENCIADORES ALTO FLUJO A MEDIDA CON RESTAURACION DE COLAS - DIFERENCIA CUBRIR SILENCIADORES', 1249000, 'completada', '2025-02-06');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 1542: OT 2795
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'JAVIER OSSES' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'JAVIER OSSES', '15217574-4', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'LFHZ23' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'LFHZ23', 'CHEVROLET', 'SILVERADO', 2019, 'S/C', 91111) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '2795', 'LFHZ23', 'LINEA COMPLETA INOX 3'''' CON SILENCIADOR ALTO FLUJO', 'LINEA COMPLETA INOX 3'''' CON SILENCIADOR ALTO FLUJO', 689900, 'completada', '2025-02-07');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 1543: OT 2796
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'JUAN ORTEGA' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'JUAN ORTEGA', '16812520-8', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'PFJC73' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'PFJC73', 'MAZDA', '3', 2021, 'S/C', 54122) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '2796', 'PFJC73', 'REPROGRAMACION DE ECU STAGE 1 +14HP +16NM', 'REPROGRAMACION DE ECU STAGE 1 +14HP +16NM', 280000, 'completada', '2025-02-07');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 1544: OT 2797
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'MARCELO SAN MARTIN' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'MARCELO SAN MARTIN', '18730326-5', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'PYZR31' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'PYZR31', 'BMW', 'M4', 2021, 'S/C', 17716) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '2797', 'PYZR31', 'SUPRIMIR 3 SILENCIADORES CENTRALES SE FABRICA 2 TRAMOS DE LINEA CENTRAL', 'SUPRIMIR 3 SILENCIADORES CENTRALES SE FABRICA 2 TRAMOS DE LINEA CENTRAL', 249900, 'completada', '2025-02-10');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 1545: OT 2798
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'CLIENTE GENERICO' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'CLIENTE GENERICO', '', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'SIN-PAT' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'SIN-PAT', 'S/M', 'S/M', 0, 'S/C', 0) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '2798', 'SIN-PAT', 'Carga masiva', 'Carga masiva', 0, 'completada', '2026-01-01');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 1546: OT 2799
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'FRANCISCO DUARTE' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'FRANCISCO DUARTE', '18537007-0', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'KBWP95' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'KBWP95', 'HONDA', 'CIVIC 1.5', 2018, 'S/C', 69781) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '2799', 'KBWP95', 'DOWNPIPE LINEA POR DEFINIR - REPRO ECU STAGE 2', 'DOWNPIPE LINEA POR DEFINIR - REPRO ECU STAGE 2', 1699600, 'completada', '2025-02-10');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 1547: OT 2800
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'JOAQUIN URRUTIA' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'JOAQUIN URRUTIA', '17603270-7', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'TRLW16' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'TRLW16', 'BMW', 'M4', 2025, 'S/C', 2000) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '2800', 'TRLW16', 'CATBACK COMPLETO INOX DUAL 3'''' + SILENCIADOR SMG ALTO FLUJO - VOLVETRONIC ''''REPARACION ESCAPE SILVERADO''''', 'CATBACK COMPLETO INOX DUAL 3'''' + SILENCIADOR SMG ALTO FLUJO - VOLVETRONIC ''''REPARACION ESCAPE SILVERADO''''', 1799900, 'completada', '2025-02-13');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 1548: OT 2851
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'CRISTIAN ANDRADE' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'CRISTIAN ANDRADE', '29502164-4', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'SIN-PAT' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'SIN-PAT', 'TOYOTA', 'HILOY 3.0', 2013, 'S/C', 305000) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '2851', 'SIN-PAT', 'DECAT POR INOX - INSTALACION SILENCIADOR WICKEDFLOW DOBLE PARED + REPROGRAMACION DE ECU STAGE 2 +60HP+140NM', 'DECAT POR INOX - INSTALACION SILENCIADOR WICKEDFLOW DOBLE PARED + REPROGRAMACION DE ECU STAGE 2 +60HP+140NM', 700000, 'completada', '2025-02-11');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 1549: OT 2852
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'DANIEL JOFRE' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'DANIEL JOFRE', '17875699-0', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'JCLT29' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'JCLT29', 'BMW', '220I', 2017, 'S/C', 106886) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '2852', 'JCLT29', 'REPROGRAMACION POSP AND BANG + CAMBIO A BUJIAS MAS FRIAS + CHEQUEO SONIDO EN LINEA (A REVISION)', 'REPROGRAMACION POSP AND BANG + CAMBIO A BUJIAS MAS FRIAS + CHEQUEO SONIDO EN LINEA (A REVISION)', 465000, 'completada', '2025-02-13');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 1550: OT 2853
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'CARLOS OSORIO' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'CARLOS OSORIO', '19500925-2', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'SHRT27' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'SHRT27', 'CUPRA', 'FORMENTOR', 2023, 'S/C', 20457) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '2853', 'SHRT27', 'LINEA COMPLETA INOX CON SILENCIADOR ALTO FLUJO MAGNAFLOW + 4 COLAS', 'LINEA COMPLETA INOX CON SILENCIADOR ALTO FLUJO MAGNAFLOW + 4 COLAS', 819900, 'completada', '2025-02-14');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 1551: OT 2854
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'SERGIO QUEZADA' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'SERGIO QUEZADA', '14127765-0', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'KWPW69' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'KWPW69', 'INFINITI', 'Q50 S', 2019, 'S/C', 72113) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '2854', 'KWPW69', 'AXLE BACK WICKEDFLOW DOBLE PARES CONSERVA COLAS', 'AXLE BACK WICKEDFLOW DOBLE PARES CONSERVA COLAS', 500000, 'completada', '2025-02-18');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 1552: OT 2855
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'JAVIER GOMEZ' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'JAVIER GOMEZ', '19745674-0', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'TVDR94' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'TVDR94', 'CHEVROLET', 'SILVERADO', 2025, 'S/C', 16000) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '2855', 'TVDR94', 'CUT OUT 3''''', 'CUT OUT 3''''', 394900, 'completada', '2025-02-20');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 1553: OT 2856
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'MARIO ARIAS' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'MARIO ARIAS', '16304133-2', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'FPLK45' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'FPLK45', 'MERCEDES', 'C250', 0, 'S/C', 132272) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '2856', 'FPLK45', 'AXLE BACK C/ COLAS Y TRAE CLIENTE', 'AXLE BACK C/ COLAS Y TRAE CLIENTE', 380000, 'completada', '2025-02-24');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 1554: OT 2857
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'CARLOS GODOY' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'CARLOS GODOY', '10231000-4', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'SVSK65' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'SVSK65', 'FORD', 'F150', 2024, 'S/C', 27142) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '2857', 'SVSK65', 'DOBLE SALIDA INOX C/ COLAS NUEVAS CROMO', 'DOBLE SALIDA INOX C/ COLAS NUEVAS CROMO', 560000, 'completada', '2025-02-24');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 1555: OT 2858
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'RONALD VERGARA' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'RONALD VERGARA', '11621347-8', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'FKKB23' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'FKKB23', 'DODGE', 'CHALLENGER', 2014, 'S/C', 70123) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '2858', 'FKKB23', 'LINEA COMPLETA INOX + SILENCIADOR ALTO FLUJO MAGNAFLOW, LINEA C/XPIPE + 4 COLAS CROMO 4''''', 'LINEA COMPLETA INOX + SILENCIADOR ALTO FLUJO MAGNAFLOW, LINEA C/XPIPE + 4 COLAS CROMO 4''''', 1349900, 'completada', '2025-02-25');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 1556: OT 2859
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'GONZALO CARVAJAL' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'GONZALO CARVAJAL', '17088316-0', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'JFGS70' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'JFGS70', 'MERCEDES', 'C43  ANG', 2017, 'S/C', 107000) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '2859', 'JFGS70', 'SUPRIMIR SILENCIADOR CENTRAL Y PIPE', 'SUPRIMIR SILENCIADOR CENTRAL Y PIPE', 149900, 'completada', '2025-02-27');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 1557: OT 2860
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'JUAN BERGUET' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'JUAN BERGUET', '18197284-K', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'JKVZ48' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'JKVZ48', 'MERCEDES', 'C43', 2017, 'S/C', 72000) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '2860', 'JKVZ48', 'DOWNPIPE X2 - AXLE BACK FREE -  REPRO STAGE 2 + ELIMINAR POPS AND BANG', 'DOWNPIPE X2 - AXLE BACK FREE -  REPRO STAGE 2 + ELIMINAR POPS AND BANG', 1639800, 'completada', '2025-02-27');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 1558: OT 2861
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'JUAN CONTRERAS' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'JUAN CONTRERAS', '20574349-9', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'LJRB92' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'LJRB92', 'SUZUKI', 'SWIFT', 2019, 'S/C', 33818) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '2861', 'LJRB92', 'INSTALACION TERMICA SWIFT DOWNPIPE', 'INSTALACION TERMICA SWIFT DOWNPIPE', 149900, 'completada', '2025-03-06');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 1559: OT 2862
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'CLIENTE GENERICO' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'CLIENTE GENERICO', '', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'SIN-PAT' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'SIN-PAT', 'S/M', 'S/M', 0, 'S/C', 0) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '2862', 'SIN-PAT', 'Carga masiva', 'Carga masiva', 0, 'completada', '2026-01-01');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 1560: OT 2863
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'CRISTIAN' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'CRISTIAN', '12483727-K', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'HZZL45' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'HZZL45', 'FORD', 'F150', 2016, 'S/C', 185) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '2863', 'HZZL45', 'INSTALACION CUT OUT (LOTRAE CLIENTE) + FILTRO BMC 814/20', 'INSTALACION CUT OUT (LOTRAE CLIENTE) + FILTRO BMC 814/20', 199800, 'completada', '2025-03-10');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 1561: OT 2864
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'MARCOS VIDAL' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'MARCOS VIDAL', '18675738-6', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'HDTG54' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'HDTG54', 'MG', '5 1.5', 2015, 'S/C', 96) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '2864', 'HDTG54', 'SUPRIMIR SILENCIADOR CENTRAL POR INOX + AXLE BACK SILENPRO Z''''', 'SUPRIMIR SILENCIADOR CENTRAL POR INOX + AXLE BACK SILENPRO Z''''', 299900, 'completada', '2025-03-10');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 1562: OT 2865
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'CLAUDIO RUBILAR' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'CLAUDIO RUBILAR', '18098443-7', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'FRBL44' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'FRBL44', 'RENAULT', 'LATITUDE', 2013, 'S/C', 174000) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '2865', 'FRBL44', 'CUT OUT 2'''' + PINTURA EN AMBAS COLAS', 'CUT OUT 2'''' + PINTURA EN AMBAS COLAS', 465000, 'completada', '2025-03-12');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 1563: OT 2866
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'FELIPE IBAÑEZ' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'FELIPE IBAÑEZ', '20812321-1', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'SVKB28' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'SVKB28', 'FORD', 'EDGE 2.7', 2023, 'S/C', 0) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '2866', 'SVKB28', 'REPARACION LINEA ESCAPE C/ NUEVO SILENCIADOR SMG VALVETRONIC C/COLAS', 'REPARACION LINEA ESCAPE C/ NUEVO SILENCIADOR SMG VALVETRONIC C/COLAS', 699900, 'completada', '2025-03-12');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 1564: OT 2867
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'BERNARDO' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'BERNARDO', '14282513-9', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'SIN-PAT' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'SIN-PAT', 'CHEVROLET', 'S/M', 2022, 'S/C', 0) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '2867', 'SIN-PAT', 'REMOVER CUT OUT', 'REMOVER CUT OUT', 80000, 'completada', '2025-03-12');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 1565: OT 2868
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'MARTIN GARRIDO' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'MARTIN GARRIDO', '17981892-9', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'SIN-PAT' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'SIN-PAT', 'VOLKSWAGEN', 'POLO', 2023, 'S/C', 25000) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '2868', 'SIN-PAT', 'SPRINTBOOSTER', 'SPRINTBOOSTER', 279900, 'completada', '2025-03-14');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 1566: OT 2869
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'CLIENTE GENERICO' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'CLIENTE GENERICO', '', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'SIN-PAT' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'SIN-PAT', 'S/M', 'S/M', 0, 'S/C', 0) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '2869', 'SIN-PAT', 'Carga masiva', 'Carga masiva', 0, 'completada', '2026-01-01');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 1567: OT 2870
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'RICARDO VILLALOBOS' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'RICARDO VILLALOBOS', '15674008-k', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'JVRW85' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'JVRW85', 'BMW', '220I', 2017, 'S/C', 0) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '2870', 'JVRW85', 'MONTAJE DOWNPIPE+ AXLE BACK CON MODIFICACION PARACHOQUE + WICKEDFLOW', 'MONTAJE DOWNPIPE+ AXLE BACK CON MODIFICACION PARACHOQUE + WICKEDFLOW', 260000, 'completada', '2025-03-17');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 1568: OT 2871
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'S.J. INGENIERIA LTDA' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'S.J. INGENIERIA LTDA', '76650055-2', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'JFKT68' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'JFKT68', 'PEUGEOT', 'PARTNER', 2017, 'S/C', 0) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '2871', 'JFKT68', 'FABRICACION SOPORTE', 'FABRICACION SOPORTE', 47600, 'completada', '2025-03-18');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 1569: OT 2872
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'VIVIANA LOYOLA' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'VIVIANA LOYOLA', '21149580-4', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'TVVK56' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'TVVK56', 'RANGE ROVER', 'SPORT', 2025, 'S/C', 7571) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '2872', 'TVVK56', 'INSTALACION BODY KIT IMPORTADO - EVALUACION SEGUNDA SALIDA ESCAPE', 'INSTALACION BODY KIT IMPORTADO - EVALUACION SEGUNDA SALIDA ESCAPE', 0, 'completada', '2025-03-18');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 1570: OT 2873
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'RODRIGO OVEDA' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'RODRIGO OVEDA', '14201717-2', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'PZFZ98' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'PZFZ98', 'CHEVROLET', 'TRAIL BOSS', 2021, 'S/C', 0) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '2873', 'PZFZ98', 'INSTALACION MODULO CUT OUT 3'''' C/ 2 CONTROL REMOTO', 'INSTALACION MODULO CUT OUT 3'''' C/ 2 CONTROL REMOTO', 419900, 'completada', '2025-03-18');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 1571: OT 2874
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'CRISTIAN LAGOS' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'CRISTIAN LAGOS', '12393880-1', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'SYGP55' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'SYGP55', 'JEEP', 'GLADIATOR', 2024, 'S/C', 500) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '2874', 'SYGP55', 'LINEA COMPLETA INOX + SILENCIADOR ALTO FLUJO WICKEDFLOW KANIKAZE CON 2 COLAS NUEVAS BLACK', 'LINEA COMPLETA INOX + SILENCIADOR ALTO FLUJO WICKEDFLOW KANIKAZE CON 2 COLAS NUEVAS BLACK', 920000, 'completada', '2025-03-19');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 1572: OT 2875
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'BENJAMIN' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'BENJAMIN', '21157876-9', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'SYZX27' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'SYZX27', 'RAM', '1500', 2024, 'S/C', 40000) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '2875', 'SYZX27', 'INSTALACION MODULO CUT OUT 3'''' + 2 CONTROL REMOTO', 'INSTALACION MODULO CUT OUT 3'''' + 2 CONTROL REMOTO', 419900, 'completada', '2025-03-20');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 1573: OT 2876
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'SEBASTIAN PIZARRO' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'SEBASTIAN PIZARRO', '16848359-7', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'TVHX69' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'TVHX69', 'MAZDA 6', '6 2.5', 2025, 'S/C', 0) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '2876', 'TVHX69', 'AXLE BACK WICKEDFLOW CRUZADO C/ COLAS ORIGINALES - REPRO ECU STAGE 1 +16HP+19NM', 'AXLE BACK WICKEDFLOW CRUZADO C/ COLAS ORIGINALES - REPRO ECU STAGE 1 +16HP+19NM', 0, 'completada', '2025-03-20');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 1574: OT 2877
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'MARTIN CACERES' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'MARTIN CACERES', '22317902-9', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'KJFJ92' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'KJFJ92', 'FORD', 'MUSTANG', 2018, 'S/C', 0) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '2877', 'KJFJ92', 'AXLE BACK SMG VALVETRONIC X2 C/ 2 CONTROL REMOTO - C/ COLAS DUAL 4'''' CROMO + CAMBIO 2 FLEXIBLES 2,5''''', 'AXLE BACK SMG VALVETRONIC X2 C/ 2 CONTROL REMOTO - C/ COLAS DUAL 4'''' CROMO + CAMBIO 2 FLEXIBLES 2,5''''', 1599900, 'completada', '2025-03-24');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 1575: OT 2878
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'CLIENTE GENERICO' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'CLIENTE GENERICO', '', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'SIN-PAT' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'SIN-PAT', 'S/M', 'S/M', 0, 'S/C', 0) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '2878', 'SIN-PAT', 'Carga masiva', 'Carga masiva', 0, 'completada', '2026-01-01');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 1576: OT 2879
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'CRISTHOFER' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'CRISTHOFER', '18519826-1', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'GTSZ37' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'GTSZ37', 'BMW', '330I', 0, 'S/C', 0) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '2879', 'GTSZ37', 'AXLE BACK BORLA EXHAUST CON DOBLE COLA DUAL 3'''' CROMO LOOK M3', 'AXLE BACK BORLA EXHAUST CON DOBLE COLA DUAL 3'''' CROMO LOOK M3', 700000, 'completada', '2025-03-25');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 1577: OT 2880
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'FRANCISCO OLAVE' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'FRANCISCO OLAVE', '13929614-1', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'LRWV63' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'LRWV63', 'HYUNDAY', 'VELOSTER', 0, 'S/C', 93000) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '2880', 'LRWV63', 'CAMBIO DE CLAM', 'CAMBIO DE CLAM', 80000, 'completada', '2025-03-26');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 1578: OT 2881
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'FRANCISCO VIAL' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'FRANCISCO VIAL', '', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'SIN-PAT' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'SIN-PAT', 'TOYOTA', 'LANCROZ', 0, 'S/C', 0) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '2881', 'SIN-PAT', 'INSTALACION SENSOR DE OXIGENO (2) + SOLDADURA EN FUGAS', 'INSTALACION SENSOR DE OXIGENO (2) + SOLDADURA EN FUGAS', 70000, 'completada', '2025-03-27');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 1579: OT 2882
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'MARIO SALSES' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'MARIO SALSES', '19382068-9', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'SIN-PAT' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'SIN-PAT', 'SUZUKI', 'SWIFT', 2019, 'S/C', 0) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '2882', 'SIN-PAT', 'REPARACION DOWNPIPE', 'REPARACION DOWNPIPE', 120000, 'completada', '2025-03-27');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 1580: OT 2883
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'FELIX' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'FELIX', '18123225-0', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'SIN-PAT' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'SIN-PAT', 'BMW', '420', 2019, 'S/C', 97000) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '2883', 'SIN-PAT', 'STAGE 1 + CAMBIO DE BUJIAS', 'STAGE 1 + CAMBIO DE BUJIAS', 500000, 'completada', '2025-03-28');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 1581: OT 2884
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'ALEJANDRO PLACENCIO' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'ALEJANDRO PLACENCIO', '19912592-3', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'DCRJ18' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'DCRJ18', 'AUDI', 'A3', 2011, 'S/C', 170000) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '2884', 'DCRJ18', 'REPARACION DOWNPIPE Y CAMBIO DE FLEXIBLE', 'REPARACION DOWNPIPE Y CAMBIO DE FLEXIBLE', 180000, 'completada', '2025-03-31');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 1582: OT 2885
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'CLAUDIO ARANCIBIA' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'CLAUDIO ARANCIBIA', '19892706-6', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'SIN-PAT' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'SIN-PAT', 'REGEL', 'RAPTOR', 2023, 'S/C', 0) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '2885', 'SIN-PAT', 'FABRICACION LINEA DE ESCAPE MOTO 2''''', 'FABRICACION LINEA DE ESCAPE MOTO 2''''', 250000, 'completada', '2025-04-01');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 1583: OT 2886
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'CRISTOBAL' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'CRISTOBAL', '20124387-4', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'KZFK51' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'KZFK51', 'MERCEDES', 'A250', 2019, 'S/C', 68000) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '2886', 'KZFK51', 'AXLE BACK FREE', 'AXLE BACK FREE', 219900, 'completada', '2025-04-02');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 1584: OT 2887
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'FRANCISCO JOHNSON' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'FRANCISCO JOHNSON', '13457570-0', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'SRWH29' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'SRWH29', 'SUBARU', 'WRX', 2023, 'S/C', 25000) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '2887', 'SRWH29', 'INSTALACION CUT OUT 3''''', 'INSTALACION CUT OUT 3''''', 420000, 'completada', '2025-04-02');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 1585: OT 2888
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'KEVIN' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'KEVIN', '25993693-4', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'VCBY21' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'VCBY21', 'SUZUKI', 'SWIFT 1.4', 0, 'S/C', 0) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '2888', 'VCBY21', 'PROYECTO STAGE 2 - DOWNPIPE - LINEA COMPLETA INOX 2,5'''' + BORLA + 2 COLAS - REPROREPROGRAMACION DE ECU STAGE 2', 'PROYECTO STAGE 2 - DOWNPIPE - LINEA COMPLETA INOX 2,5'''' + BORLA + 2 COLAS - REPROREPROGRAMACION DE ECU STAGE 2', 0, 'completada', '2025-04-03');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 1586: OT 2889
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'MANUEL SIERRA' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'MANUEL SIERRA', '11571539-9', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'TRDB47' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'TRDB47', 'FORD', 'MUSTANG', 2024, 'S/C', 2000) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '2889', 'TRDB47', 'FABRICACION E INSTALACION DE XPIPE CENTRAL', 'FABRICACION E INSTALACION DE XPIPE CENTRAL', 0, 'completada', '2025-04-03');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 1587: OT 2890
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'DIEGO MENDOZA' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'DIEGO MENDOZA', '16936703-5', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'FPFR31' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'FPFR31', 'AUDI', 'A6', 2013, 'S/C', 152557) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '2890', 'FPFR31', 'REPRO ECU STAGE 1 +90HP + 100NM', 'REPRO ECU STAGE 1 +90HP + 100NM', 429900, 'completada', '2025-04-03');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 1588: OT 2891
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'NICOLAS RODRIGUEZ' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'NICOLAS RODRIGUEZ', '17709256-8', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'RZLV48' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'RZLV48', 'CUPRA', 'FORMENTOR', 2022, 'S/C', 26773) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '2891', 'RZLV48', 'FABRICACION E INSTALACION DOWNPIPE + REPRO DE ECU STAGE 2 CON OPF OFF +80HP +110NM - 395HP + 510NM', 'FABRICACION E INSTALACION DOWNPIPE + REPRO DE ECU STAGE 2 CON OPF OFF +80HP +110NM - 395HP + 510NM', 1099900, 'completada', '2025-04-07');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 1589: OT 2892
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'ALI TAMLAWI' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'ALI TAMLAWI', '22594154-8', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'SIN-PAT' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'SIN-PAT', 'BMW', '320I', 2016, 'S/C', 96000) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '2892', 'SIN-PAT', 'CUT OUT 2''''', 'CUT OUT 2''''', 420000, 'completada', '2025-04-07');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 1590: OT 2893
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'FRANCISCO NAVARRETE' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'FRANCISCO NAVARRETE', '', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'GVXL75' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'GVXL75', 'BMW', 'Z3', 2000, 'S/C', 0) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '2893', 'GVXL75', 'CAMBIO DE CLAMP TITANIO', 'CAMBIO DE CLAMP TITANIO', 379900, 'completada', '2025-04-07');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 1591: OT 2894
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'DARIO PEREZ' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'DARIO PEREZ', '', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'RYXT61' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'RYXT61', 'TOYOTA', '4RUNNER', 2022, 'S/C', 0) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '2894', 'RYXT61', 'SILENCIADOR CON VALVULA SMG 63MM INCLUYE 2 CONTROL REMOTO', 'SILENCIADOR CON VALVULA SMG 63MM INCLUYE 2 CONTROL REMOTO', 619900, 'completada', '2025-04-08');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 1592: OT 2895
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'MARIO HINOTOSA' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'MARIO HINOTOSA', '', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'BCCF70' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'BCCF70', 'AUDI', 'A4', 2008, 'S/C', 197740) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '2895', 'BCCF70', 'CUT OUT INSTALACION VALVULA 2,5''''', 'CUT OUT INSTALACION VALVULA 2,5''''', 419900, 'completada', '2025-04-08');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 1593: OT 2896
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'PEDRO PUBILL' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'PEDRO PUBILL', '', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'SIN-PAT' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'SIN-PAT', 'VOLKSWAGEN', 'GOLF', 2019, 'S/C', 0) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '2896', 'SIN-PAT', 'CUT OUT', 'CUT OUT', 420000, 'completada', '2025-04-08');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 1594: OT 2897
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'MIGUEL MARTINEZ' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'MIGUEL MARTINEZ', '10426448-3', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'HLHL71' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'HLHL71', 'VOLKSWAGEN', 'GOLF', 2016, 'S/C', 128) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '2897', 'HLHL71', 'CUT OUT 2,5'''' CON 2 CONTROL REMOTO', 'CUT OUT 2,5'''' CON 2 CONTROL REMOTO', 419900, 'completada', '2025-04-09');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 1595: OT 2898
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'JEANPER SANCHEZ' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'JEANPER SANCHEZ', '24913413-2', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'KX3105' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'KX3105', 'HONDA', 'CIVIC', 1993, 'S/C', 0) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '2898', 'KX3105', 'ESCAPE COMPLETO LINEA 2,5'''' C/FLEXIBLE + V.BAND EN CONEXION MULTIPLE + COLAS NUEVAS', 'ESCAPE COMPLETO LINEA 2,5'''' C/FLEXIBLE + V.BAND EN CONEXION MULTIPLE + COLAS NUEVAS', 464800, 'completada', '2025-04-09');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 1596: OT 2899
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'DANIEL PEÑA' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'DANIEL PEÑA', '15127279-7', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'RBFH40' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'RBFH40', 'CHEVROLET', 'TRAIL BOSS', 2021, 'S/C', 88181) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '2899', 'RBFH40', 'INSTALACION MODULO CUT OUT 3'''' CON 2 CONTROL REMOTO', 'INSTALACION MODULO CUT OUT 3'''' CON 2 CONTROL REMOTO', 419900, 'completada', '2025-04-09');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 1597: OT 2900
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'JUAN PABLO' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'JUAN PABLO', '15370321-6', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'KPTR98' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'KPTR98', 'FORD', 'F150', 2018, 'S/C', 110000) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '2900', 'KPTR98', 'CUT OUT 2,5''''', 'CUT OUT 2,5''''', 419900, 'completada', '2025-04-09');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 1598: OT 2932
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'JOSE WIDOW' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'JOSE WIDOW', '18619486-1', '953846999', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'KHHJ46' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'KHHJ46', 'SUZUKI', 'SWIFT 1.4T', 2018, 'ROJO', 102000) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '2932', 'KHHJ46', 'CUT-OUT', 'CUT-OUT', 414900, 'completada', '2025-05-02');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 1599: OT 2933
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'JUAN CONTRERAS' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'JUAN CONTRERAS', '20574349-9', '941608439', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'LJRB92' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'LJRB92', 'SUZUKI', 'SWIFT 1.4T', 2019, 'GRAFITO', 35980) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '2933', 'LJRB92', 'SILENCIADOR ALTO FLUJO', 'SILENCIADOR ALTO FLUJO', 280000, 'completada', '2025-05-02');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 1600: OT 2934
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'FRANCISCO GATICA' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'FRANCISCO GATICA', '16886711-5', '956732995', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'KJJV98' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'KJJV98', 'VOLKSWAGEN', 'GOLF GTI MK7,5', 2018, 'GRIS', 138000) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '2934', 'KJJV98', 'GARANTIA - SOPORTE', 'GARANTIA - SOPORTE', 27900, 'completada', '2025-05-02');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    RAISE NOTICE 'Procesados 1600 registros...';
    -- Fila 1601: OT 2935
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'RODRIGO ROJAS' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'RODRIGO ROJAS', '17108073-0', '993253695', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'CLVG84' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'CLVG84', 'DODGE', 'CHALLENGER', 2010, 'BLANCO', 69000) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '2935', 'CLVG84', '2 SILENCIADORES WICKED FLOW', '2 SILENCIADORES WICKED FLOW', 579900, 'completada', '2025-05-02');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 1602: OT 2936
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'JOAQUIN PACHECO' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'JOAQUIN PACHECO', '19721474-0', '945023059', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'KJSL19' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'KJSL19', 'VOLKSWAGEN', 'GOLF TSI', 2018, 'PLATA', 75000) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '2936', 'KJSL19', 'DESINTALA CUT-OUT - INSTALA SILENCIADOR', 'DESINTALA CUT-OUT - INSTALA SILENCIADOR', 149900, 'completada', '2025-05-02');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 1603: OT 2937
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'ALEJANDRO ROJAS' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'ALEJANDRO ROJAS', '13505062-8', '991537931', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'GVFG67' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'GVFG67', 'BMW', '435i', 2015, 'ROJO', 0) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '2937', 'GVFG67', 'SALIDA DOBLE COLAS NEGRAS + AXLEBACK', 'SALIDA DOBLE COLAS NEGRAS + AXLEBACK', 350000, 'completada', '2025-05-02');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 1604: OT 2938
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'LUIS REYES' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'LUIS REYES', '19232066-0', '934145212', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'GYWF18' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'GYWF18', 'BMW', '220i', 2015, 'PLATA', 150000) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '2938', 'GYWF18', 'PARACHOQUE DIFUSOR M2 + AXLEBACK FREE CON 4 COLAS', 'PARACHOQUE DIFUSOR M2 + AXLEBACK FREE CON 4 COLAS', 1249900, 'completada', '2025-05-05');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 1605: OT 2939
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'LEONARDO VALLEJOS' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'LEONARDO VALLEJOS', '18082376-K', '963346253', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'LLYR97' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'LLYR97', 'FORD', 'F-150 R', 2019, 'NEGRO', 85000) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '2939', 'LLYR97', 'CUT-OUT + CENTER DELETE', 'CUT-OUT + CENTER DELETE', 649900, 'completada', '2025-05-05');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 1606: OT 2940
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'DENI CARILLO' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'DENI CARILLO', '9804480-6', '953094859', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'FKWZ11' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'FKWZ11', 'JEEP', 'GRAND CHEROKEE', 2013, 'NEGRO', 20900) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '2940', 'FKWZ11', 'CENTER DELETE + COLA NEGRA 4''''', 'CENTER DELETE + COLA NEGRA 4''''', 364800, 'completada', '2025-05-06');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 1607: OT 2941
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'AGUSTIN GONZALEZ' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'AGUSTIN GONZALEZ', '20664517-2', '957485934', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'DJHG12' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'DJHG12', 'ALFA ROMEO', '147', 2001, 'ROJO', 207000) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '2941', 'DJHG12', 'MODIFICACION LINEA CENTRAL ( SE AGREGA SILENCIADOR TRAIDO POR CLIENTE)', 'MODIFICACION LINEA CENTRAL ( SE AGREGA SILENCIADOR TRAIDO POR CLIENTE)', 120000, 'completada', '2025-05-06');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 1608: OT 2942
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'ABRAHAM ALVARADO' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'ABRAHAM ALVARADO', '20101074-8', '944309376', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'TRCF25' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'TRCF25', 'KIA', 'RIO K3', 2024, 'BLANCO', 3000) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '2942', 'TRCF25', 'ALTO FLUJO + S`RINT BOOSTER', 'ALTO FLUJO + S`RINT BOOSTER', 488900, 'completada', '2025-05-06');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 1609: OT 2943
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'IGNACIO GIDDINGS' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'IGNACIO GIDDINGS', '20163924-7', '961946931', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'PSPW33' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'PSPW33', 'CHEVROLET', 'DMAX', 2020, 'GRAFITO', 74000) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '2943', 'PSPW33', 'PIPING INOXIDABLE', 'PIPING INOXIDABLE', 280000, 'completada', '2025-05-07');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 1610: OT 2944
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'RICARDO LEON' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'RICARDO LEON', '15345271-7', '965524562', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'SRYI31' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'SRYI31', 'CHEVROLET', 'CAMARO', 0, 'AZUL', 9000) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '2944', 'SRYI31', 'CAMBIO DE FLANCHES POR CLAMP INOX 3''''', 'CAMBIO DE FLANCHES POR CLAMP INOX 3''''', 179990, 'completada', '2025-05-07');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 1611: OT 2945
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'MARCELO MARTINEZ' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'MARCELO MARTINEZ', '19064114-4', '943458605', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'PW3083' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'PW3083', 'SUBARU', 'WRX', 2007, 'AZUL', 177111) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '2945', 'PW3083', 'LINEA INOX 2,5'''' + SILENCIADOR AUTOFLUJO MAGNAFLOW+COLA 4''''', 'LINEA INOX 2,5'''' + SILENCIADOR AUTOFLUJO MAGNAFLOW+COLA 4''''', 679900, 'completada', '2025-05-08');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 1612: OT 2946
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'AKIN ERTURK' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'AKIN ERTURK', '23784146-8', '956109507', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'VCWT98' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'VCWT98', 'BMW', '240i', 2025, 'MORADO', 800) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '2946', 'VCWT98', 'LINEA COMPLETA INOX DOBLE 3'''' +SILENCIADOR ALTO FLUJO SMG VALVETRONI + COLAS CARBONO DOBLES', 'LINEA COMPLETA INOX DOBLE 3'''' +SILENCIADOR ALTO FLUJO SMG VALVETRONI + COLAS CARBONO DOBLES', 1649900, 'completada', '2025-05-09');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 1613: OT 2947
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'CHRISTIAN WAGNER' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'CHRISTIAN WAGNER', '21199141-0', '936485351', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'LLFH60' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'LLFH60', 'AUDI', 'A3', 2019, 'GRAFITO', 100000) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '2947', 'LLFH60', 'AXLE BACK FREE + DIFUSOR S3', 'AXLE BACK FREE + DIFUSOR S3', 649900, 'completada', '2025-05-12');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 1614: OT 2948
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'DIEGO REYES' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'DIEGO REYES', '19016302-4', '955274692', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'SDXK75' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'SDXK75', 'CUPRA', 'FORMENTOR', 2024, 'GRIS', 35400) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '2948', 'SDXK75', 'CATBACK +SILENPRO+COLASNEGRAS+ CORTE PARACHOQUE', 'CATBACK +SILENPRO+COLASNEGRAS+ CORTE PARACHOQUE', 899900, 'completada', '2025-05-12');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 1615: OT 2949
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'PAULO FREDES' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'PAULO FREDES', '14623274-4', '998083719', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'FTZY48' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'FTZY48', 'FORD', 'EXPLORER', 2013, 'NEGRO', 175990) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '2949', 'FTZY48', 'POPS AND BANGS +DTC OFF P0430', 'POPS AND BANGS +DTC OFF P0430', 579900, 'completada', '2025-05-12');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 1616: OT 2950
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'PABLO CRUZAT' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'PABLO CRUZAT', '21443580-2', '9713354787', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'KBJF80' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'KBJF80', 'MAZDA', '3', 2018, 'GRAFITO', 90758) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '2950', 'KBJF80', 'STAGE 1 +16HP+19NM', 'STAGE 1 +16HP+19NM', 279900, 'completada', '2025-05-13');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 1617: OT 2951
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'PATRICIO SANCHEZ' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'PATRICIO SANCHEZ', '18306152-5', '974615178', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'JDFS29' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'JDFS29', 'MERCEDES', 'GLE 400', 2017, 'PLATA', 109000) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '2951', 'JDFS29', 'CUT OUT', 'CUT OUT', 419900, 'completada', '2025-05-14');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 1618: OT 2952
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'NICOLAS ESTAY' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'NICOLAS ESTAY', '16015769-0', '959036646', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'RKGT44' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'RKGT44', 'FORD', 'MACH 1', 2022, 'NEGRO', 16500) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '2952', 'RKGT44', 'X-PIPE+ PINTADO COLA +ALEROPN MACH 1+FILTRO ALTO FLUJO', 'X-PIPE+ PINTADO COLA +ALEROPN MACH 1+FILTRO ALTO FLUJO', 908800, 'completada', '2025-05-15');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 1619: OT 2953
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'MARCO ALFARO' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'MARCO ALFARO', '12249139-2', '981566136', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'GFLT42' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'GFLT42', 'JEEP', 'WRANGLER', 2014, 'PLATA', 133000) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '2953', 'GFLT42', 'CUT OUT +BOSS SHINE', 'CUT OUT +BOSS SHINE', 429900, 'completada', '2025-05-15');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 1620: OT 2954
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'IVAN MARIN' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'IVAN MARIN', '18077969-8', '977379401', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'TKCH68' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'TKCH68', 'HAVAL', 'HG GT', 2024, 'AZUL', 8534) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '2954', 'TKCH68', 'STAGE 2 + DOWNPIPE', 'STAGE 2 + DOWNPIPE', 740000, 'completada', '2025-05-16');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 1621: OT 2955
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'CARLOS GODOY' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'CARLOS GODOY', '10231000-4', '923534833', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'TYKW13' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'TYKW13', 'FORD', 'EXPLORER', 2025, 'NEGRO', 0) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '2955', 'TYKW13', 'COLAS DOBLES CROMADAS', 'COLAS DOBLES CROMADAS', 169800, 'completada', '2025-05-16');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 1622: OT 2956
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'BENJAMIN JAQUE' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'BENJAMIN JAQUE', '21650216-7', '959989581', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'SWTV48' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'SWTV48', 'SUZUKI', 'SWIFT', 2023, 'BLANCO', 30000) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '2956', 'SWTV48', 'DOWNPIPE CON PROTECTOR TERMICO + STAGE 2', 'DOWNPIPE CON PROTECTOR TERMICO + STAGE 2', 700000, 'completada', '2025-05-19');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 1623: OT 2957
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'DAVID OLMEDO' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'DAVID OLMEDO', '14044004-3', '964076755', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'LPKH85' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'LPKH85', 'BMW', '420i', 2019, 'BLANCO', 128000) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '2957', 'LPKH85', 'STAGE 1 + BUJIAS -1 GRADO + REEMPLAZO SILENCIADOR CENTRAL +SILECIADOR CON VALVULA+COLA DOBLE CROMADA', 'STAGE 1 + BUJIAS -1 GRADO + REEMPLAZO SILENCIADOR CENTRAL +SILECIADOR CON VALVULA+COLA DOBLE CROMADA', 1159900, 'completada', '2025-05-20');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 1624: OT 2958
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'MAURICIO CHAHUAN' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'MAURICIO CHAHUAN', '10902094-K', '968390659', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'SIN-PAT' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'SIN-PAT', 'VOLKSWAGEN', 'GOLF R', 2014, 'AZUL', 57000) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '2958', 'SIN-PAT', 'FABRICACION MEDIA LINEA + SILENCIADOR CON VALVULA SMG + 4 COLAS', 'FABRICACION MEDIA LINEA + SILENCIADOR CON VALVULA SMG + 4 COLAS', 1100000, 'completada', '2025-05-20');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 1625: OT 2959
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'JORDAN CARRASCO' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'JORDAN CARRASCO', '18030045-7', '966462909', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'TCLZ48' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'TCLZ48', 'BMW', '240i', 2024, 'BLANCO', 9000) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '2959', 'TCLZ48', 'AXLE BACK + SILENCIADOR CON VALVULAS', 'AXLE BACK + SILENCIADOR CON VALVULAS', 990900, 'completada', '2025-05-22');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 1626: OT 2960
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'FELIPE MUÑOZ' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'FELIPE MUÑOZ', '16588974-6', '982702962', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'VBLS65' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'VBLS65', 'FORD', 'BRONCO', 2025, 'AZUL', 1044) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '2960', 'VBLS65', 'AXLE BACK+ SILENCIADOR ALTO FLUJO WICKEDFLOW +  4 COLAS', 'AXLE BACK+ SILENCIADOR ALTO FLUJO WICKEDFLOW +  4 COLAS', 719900, 'completada', '2025-05-22');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 1627: OT 2961
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'ROBERTO ANDRASSI' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'ROBERTO ANDRASSI', '22038499-3', '974627065', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'LLVX64' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'LLVX64', 'MERCEDES', 'C43', 2019, 'GRIS', 31000) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '2961', 'LLVX64', 'STAGE1 +53 HP +95 NM+ MUFFLER CENTER DEKETE+AXLE BACK +SILENCIADOR VALVETRONIC X2', 'STAGE1 +53 HP +95 NM+ MUFFLER CENTER DEKETE+AXLE BACK +SILENCIADOR VALVETRONIC X2', 1950000, 'completada', '2025-05-22');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 1628: OT 2962
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'ANTONI VELASQUEZ' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'ANTONI VELASQUEZ', '26385469-1', '9810667011', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'LJTH88' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'LJTH88', 'CHEVROLET', 'SPARK', 2019, 'NEGRO', 65000) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '2962', 'LJTH88', 'ELIMINACION SILIENCIADOR DE FABRICA+CENTRAL SE INSTALA ALTO FLUJO+COLITA NUEVA', 'ELIMINACION SILIENCIADOR DE FABRICA+CENTRAL SE INSTALA ALTO FLUJO+COLITA NUEVA', 299900, 'completada', '2025-05-23');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 1629: OT 2963
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'ANGELO INOSTROZA' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'ANGELO INOSTROZA', '19289763-K', '987998369', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'TPPB73' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'TPPB73', 'SUZUKI', 'SWIFT', 2024, 'GRIS', 21000) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '2963', 'TPPB73', 'STAGE 1+ 25HP+ 60NM+MUFFLERCENTER DELETE', 'STAGE 1+ 25HP+ 60NM+MUFFLERCENTER DELETE', 449900, 'completada', '2025-05-23');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 1630: OT 2964
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'FRANCO CUADRA' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'FRANCO CUADRA', '17922404-6', '933252002', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'FKBU15' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'FKBU15', 'PORSCHE', 'BOXTER', 2013, 'NEGRO', 80000) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '2964', 'FKBU15', 'STAGE 1 + 20HP + 30NP', 'STAGE 1 + 20HP + 30NP', 489900, 'completada', '2025-05-23');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 1631: OT 2965
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'CLAUDIO MARCHANT' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'CLAUDIO MARCHANT', '10715102-8', '966567405', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'RYYU37' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'RYYU37', 'FORD', 'F150', 2022, 'NEGRO', 54000) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '2965', 'RYYU37', 'MANTENCION CUT OT', 'MANTENCION CUT OT', 35000, 'completada', '2025-05-23');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 1632: OT 2966
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'MATIAS BAHAMONDES' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'MATIAS BAHAMONDES', '19523599-6', '993195715', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'RYUR58' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'RYUR58', 'SUZUKI', 'SWIFT', 2022, 'GRAFITO', 63000) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '2966', 'RYUR58', 'LINEA ACERO INOX + SILENCIADOR +ALTO FLUJO BORLA', 'LINEA ACERO INOX + SILENCIADOR +ALTO FLUJO BORLA', 719900, 'completada', '2025-05-26');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 1633: OT 2967
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'CRISTOBAL ORTEGA' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'CRISTOBAL ORTEGA', '20119848-8', '951893757', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'PXTP92' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'PXTP92', 'SUZUKI', 'SWIFT', 2021, 'BLANCO', 69000) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '2967', 'PXTP92', 'INDUCCION ORIGINAL', 'INDUCCION ORIGINAL', 44900, 'completada', '2025-05-26');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 1634: OT 2968
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'NEIL ABALLAI' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'NEIL ABALLAI', '13463932-6', '982858973', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'DTWW97' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'DTWW97', 'BMW', '325i', 2012, 'GRIS', 159000) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '2968', 'DTWW97', 'AXLE BACK+ SILENCIADOR ALTO FLUJO VALVETRONIC', 'AXLE BACK+ SILENCIADOR ALTO FLUJO VALVETRONIC', 569900, 'completada', '2025-05-26');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 1635: OT 2969
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'NICOLAS VALENZUELA' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'NICOLAS VALENZUELA', '18186180-0', '954006598', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'GJRZ30' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'GJRZ30', 'PORSCHE', 'CAYENNE', 2013, 'GRIS', 195000) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '2969', 'GJRZ30', 'STAGE 1+80HP+120NM+ DOWNPIPE +LINEA COMPLETA+SILENCIADOR ALTO FLUJO+CUT OUT', 'STAGE 1+80HP+120NM+ DOWNPIPE +LINEA COMPLETA+SILENCIADOR ALTO FLUJO+CUT OUT', 1769700, 'completada', '2025-05-27');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 1636: OT 2970
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'FELIX DE LA VEGA' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'FELIX DE LA VEGA', '19889495-8', '930032972', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'HFWG81' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'HFWG81', 'JEEP', 'WRANGLER', 2015, 'BLANCO', 130000) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '2970', 'HFWG81', 'AXLE BACK', 'AXLE BACK', 80000, 'completada', '2025-05-27');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 1637: OT 2971
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'LOIS HERNANDEZ' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'LOIS HERNANDEZ', '17232940-3', '17867847925', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'KZGF63' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'KZGF63', 'ACURA', 'TLX', 2019, 'BLANCO', 69000) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '2971', 'KZGF63', 'LINEA CENTRAL + SOPORTE NUEVO', 'LINEA CENTRAL + SOPORTE NUEVO', 449900, 'completada', '2025-05-27');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 1638: OT 2972
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'BRAYAN SAAVEDRA' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'BRAYAN SAAVEDRA', '18561785-8', '966304876', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'SCLD78' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'SCLD78', 'CHEVROLET', 'SILVERADO', 2022, 'ROJO', 64000) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '2972', 'SCLD78', 'CUT-OUT', 'CUT-OUT', 449900, 'completada', '2025-05-28');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 1639: OT 2973
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'PIERO LOBOS' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'PIERO LOBOS', '22173904-3', '956422768', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'HSVL60' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'HSVL60', 'MERCEDES', 'CLA200', 2016, 'BLANCO', 138096) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '2973', 'HSVL60', 'AXLE BACK FREE + DIFUSOR S3', 'AXLE BACK FREE + DIFUSOR S3', 229900, 'completada', '2025-05-28');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 1640: OT 2974
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'EDWARD OSORIO' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'EDWARD OSORIO', '16307171-1', '974787242', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'KYYP23' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'KYYP23', 'CHEVROLET', 'CAMARO', 2019, 'BLANCO', 63700) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '2974', 'KYYP23', 'STAGE 2 + POPS +REEMPLAZO CATALIZADOR', 'STAGE 2 + POPS +REEMPLAZO CATALIZADOR', 1109800, 'completada', '2025-05-28');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 1641: OT 2975
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'ALBERTO BARRIGA' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'ALBERTO BARRIGA', '18412942-6', '956593452', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'SXVF88' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'SXVF88', 'FORD', 'F150', 2024, 'NEGRO', 76000) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '2975', 'SXVF88', 'SCANNER', 'SCANNER', 50000, 'completada', '2025-05-29');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 1642: OT 2976
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'RICARDO VALDES' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'RICARDO VALDES', '15970347-9', '985806376', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'SZWR86' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'SZWR86', 'MINI', 'COOPER S', 2024, 'BLANCO', 23000) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '2976', 'SZWR86', 'MUFFLER CENTER DELETE', 'MUFFLER CENTER DELETE', 79900, 'completada', '2025-05-30');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 1643: OT 2977
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'WILLIAMS AHUMADA' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'WILLIAMS AHUMADA', '13363768-0', '977066883', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'KBKB12' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'KBKB12', 'FORD', 'F150', 2018, 'BLANCO', 61000) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '2977', 'KBKB12', 'CUT OUT + COLA NEGRA 4''''', 'CUT OUT + COLA NEGRA 4''''', 574800, 'completada', '2025-05-30');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 1644: OT 2978
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'ANGELO INOSTROZA' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'ANGELO INOSTROZA', '19287763-K', '987998369', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'TPPB73' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'TPPB73', 'SUZUKI', 'SWIFT', 2024, 'GRIS', 22000) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '2978', 'TPPB73', 'CATBACK + BORLAC +2COLAS TITANIO', 'CATBACK + BORLAC +2COLAS TITANIO', 699900, 'completada', '2025-05-30');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 1645: OT 2979
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'BENJAMIN ZAPATA' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'BENJAMIN ZAPATA', '21351010-7', '978464085', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'KJLH20' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'KJLH20', 'VOLKSWAGEN', 'SCI 8000', 2017, 'NEGRO', 65000) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '2979', 'KJLH20', 'SILENCIADOR ALTO FLUJO SMG+ 2 CONTROLOES + 1 AÑO DE GARANTIA', 'SILENCIADOR ALTO FLUJO SMG+ 2 CONTROLOES + 1 AÑO DE GARANTIA', 619900, 'completada', '2025-06-02');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 1646: OT 2980
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'BRYAN DIAZ' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'BRYAN DIAZ', '19699308-8', '979436169', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'TBYR71' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'TBYR71', 'MERCEDES', 'A250', 2023, 'PLATA', 9100) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '2980', 'TBYR71', 'DOWNPIPE S16 CON PROTECTOR TERMICO +REPROGRAMACION DE ECO STAGE 2 + 41HP+130NM +INSTALACION CUT OUT', 'DOWNPIPE S16 CON PROTECTOR TERMICO +REPROGRAMACION DE ECO STAGE 2 + 41HP+130NM +INSTALACION CUT OUT', 1299900, 'completada', '2025-06-03');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 1647: OT 2981
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'NICOLAS DIAZ' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'NICOLAS DIAZ', '11348043-2', '90021400', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'CRSK54' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'CRSK54', 'TOYOTA', 'TUNDRA', 2010, 'CAMUFLAJE', 167000) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '2981', 'CRSK54', 'GARANTÍA', 'GARANTÍA', 0, 'completada', '2025-06-03');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 1648: OT 2982
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'FELIPE FERNANDEZ' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'FELIPE FERNANDEZ', '15642585-0', '961581554', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'SYZG23' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'SYZG23', 'CHEVROLET', 'TAHOE', 2023, 'BLANCO', 20000) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '2982', 'SYZG23', 'SILENCIADOR ALTO FLUJO SMG+ 2 CONTROLOES + 1 AÑO DE GARANTIA', 'SILENCIADOR ALTO FLUJO SMG+ 2 CONTROLOES + 1 AÑO DE GARANTIA', 339900, 'completada', '2025-06-03');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 1649: OT 2983
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'MILTON MASSABO' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'MILTON MASSABO', '12248257-K', '992278425', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'KPXW26' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'KPXW26', 'BMW', '220I', 2018, 'BLANCO', 76000) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '2983', 'KPXW26', 'SILENCIADOR ALTO FLUJO + COLAS NUEVAS STAGE 1 + 70HP Y +130NM + BUJIA -1º', 'SILENCIADOR ALTO FLUJO + COLAS NUEVAS STAGE 1 + 70HP Y +130NM + BUJIA -1º', 812730, 'completada', '2025-06-04');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 1650: OT 2984
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'CRISTIAN VASQUEZ' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'CRISTIAN VASQUEZ', '18740760-5', '89494179', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'SPKY13' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'SPKY13', 'SUZUKI', 'SWIFT', 2022, 'ROJO', 41000) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '2984', 'SPKY13', 'PROTECTOR TERMICO DOWNPIPE+ SILENCIADOR SMG VALVETRONIC', 'PROTECTOR TERMICO DOWNPIPE+ SILENCIADOR SMG VALVETRONIC', 769800, 'completada', '2025-06-04');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 1651: OT 2985
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'CRISTIAN VASQUEZ' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'CRISTIAN VASQUEZ', '18740760-5', '97494479', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'SPKY13' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'SPKY13', 'SUZUKI', 'SWIFT', 2022, 'ROJO', 41000) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '2985', 'SPKY13', 'INSTALACION SILENCIADOR CENTRAL', 'INSTALACION SILENCIADOR CENTRAL', 70000, 'completada', '2025-06-05');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 1652: OT 2986
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'FRANCISCO SILVA' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'FRANCISCO SILVA', '76139343-2', '992505496', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'SIN-PAT' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'SIN-PAT', 'BMW', '120I', 2018, 'GRIS', 0) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '2986', 'SIN-PAT', 'AXLEBACK FREE + DIFUROR BLACK GLOSSY', 'AXLEBACK FREE + DIFUROR BLACK GLOSSY', 489900, 'completada', '2025-06-05');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 1653: OT 2987
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'JORGE BARDISA' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'JORGE BARDISA', '16652310-9', '94951752', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'TRFU58' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'TRFU58', 'SUZUKI', 'SWIFT', 2024, 'BLANCO', 3600) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '2987', 'TRFU58', 'DOWNPIPE S16 CON PROTECTOR TERMICO +REPROGRAMACION DE ECO STAGE 2 + 41HP+130NM +INSTALACION CUT OUT', 'DOWNPIPE S16 CON PROTECTOR TERMICO +REPROGRAMACION DE ECO STAGE 2 + 41HP+130NM +INSTALACION CUT OUT', 299900, 'completada', '2025-06-09');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 1654: OT 2988
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'CRISTIAN FAUNDEZ' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'CRISTIAN FAUNDEZ', '12880647-4', '9850182660', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'FRSB19' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'FRSB19', 'BMW', '320I', 2013, 'GRIS', 122000) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '2988', 'FRSB19', 'CAMBIO DE PARACHOQUE + DIFUSOR +CUBRE ESPEJOS + ESCAPE CON SONIDO 4 COLAS', 'CAMBIO DE PARACHOQUE + DIFUSOR +CUBRE ESPEJOS + ESCAPE CON SONIDO 4 COLAS', 1149700, 'completada', '2025-06-09');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 1655: OT 2989
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'PABLO CASSUS' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'PABLO CASSUS', '19512834-0', '953341350', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'KYZY73' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'KYZY73', 'BMW', '140', 0, 'S/C', 78000) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '2989', 'KYZY73', 'REPARACIÓN', 'REPARACIÓN', 39900, 'completada', '2025-06-09');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 1656: OT 2990
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'RODRIGO POBLETE' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'RODRIGO POBLETE', '15597484-2', '982050546', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'TJVL18' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'TJVL18', 'BMW', '340', 2024, 'GRIS', 6600) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '2990', 'TJVL18', 'SILENPRO ALTO FLUJO + COLAS NEGRAS 4'''' +LAMINAS DE SEGURIDAD 8 MIOPAS', 'SILENPRO ALTO FLUJO + COLAS NEGRAS 4'''' +LAMINAS DE SEGURIDAD 8 MIOPAS', 1099800, 'completada', '2025-06-10');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 1657: OT 2991
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'VALENTINA NOVOA' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'VALENTINA NOVOA', '20003668-9', '973383210', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'KKFZ27' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'KKFZ27', 'MERCEDES', 'A45', 2019, 'GRIS', 80000) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '2991', 'KKFZ27', 'PROTECTOR TERMICO', 'PROTECTOR TERMICO', 199900, 'completada', '2025-06-10');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 1658: OT 2992
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'IGNACIO DIAZ' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'IGNACIO DIAZ', '19850072-6', '949791092', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'VDPY13' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'VDPY13', 'CHANGAN', 'UNI-K', 2025, 'AZUL', 60) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '2992', 'VDPY13', 'CUT OUT', 'CUT OUT', 449900, 'completada', '2025-06-11');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 1659: OT 2993
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'MICHAEL RADEMACHER' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'MICHAEL RADEMACHER', '16562471-8', '954030534', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'PDKL34' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'PDKL34', 'JEEP', 'GLADIATR', 2021, 'GRIS', 40000) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '2993', 'PDKL34', 'PROTECTOR TERMICO', 'PROTECTOR TERMICO', 399980, 'completada', '2025-06-11');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 1660: OT 2994
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'RAUL BORGOÑO' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'RAUL BORGOÑO', '15732649-K', '984095108', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'KWLD22' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'KWLD22', 'VOLKSWAGEN', 'GOLF', 2019, 'GRIS', 49000) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '2994', 'KWLD22', 'CUT OUT', 'CUT OUT', 69900, 'completada', '2025-06-11');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 1661: OT 2995
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'JORGE LUENGO' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'JORGE LUENGO', '13780945-1', '978987194', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'SHPZ40' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'SHPZ40', 'FORD', 'MACH 1', 2023, 'ROJO', 25000) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '2995', 'SHPZ40', 'INSTALACION X-PIPE', 'INSTALACION X-PIPE', 89900, 'completada', '2025-06-11');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 1662: OT 2996
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'JONATHAN MACAYA' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'JONATHAN MACAYA', '19783142-1', '926366507', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'GUJL34' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'GUJL34', 'jEEP', 'GRAN CHEROKEE', 2015, 'NEGRO', 140000) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '2996', 'GUJL34', 'REPRO STAGE 2 + DECAT', 'REPRO STAGE 2 + DECAT', 1000000, 'completada', '2025-06-12');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 1663: OT 2997
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'NABYR DHABI' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'NABYR DHABI', '15078037-3', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'SPFR71' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'SPFR71', 'RAM', 'REBEL 57', 2023, 'ROJO', 80000) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '2997', 'SPFR71', 'INTAKE AIR +CUT OUT', 'INTAKE AIR +CUT OUT', 1000000, 'completada', '2025-06-12');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 1664: OT 2998
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'ITALO LORENZ' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'ITALO LORENZ', '19955199-K', '996457539', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'SSPK88' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'SSPK88', 'FORD', 'RANGER', 2023, 'GRAFITO', 95000) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '2998', 'SSPK88', 'REPRO BPF-EGR-ADBLUE OFF +STAGE 2 +46HP+90NM', 'REPRO BPF-EGR-ADBLUE OFF +STAGE 2 +46HP+90NM', 470000, 'completada', '2025-06-12');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 1665: OT 2999
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'CLIENTE GENERICO' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'CLIENTE GENERICO', '', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'SIN-PAT' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'SIN-PAT', 'S/M', 'S/M', 0, 'S/C', 0) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '2999', 'SIN-PAT', 'Carga masiva', 'Carga masiva', 0, 'completada', '2025-06-12');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 1666: OT 3000
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'MANUEL ALVAREZ' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'MANUEL ALVAREZ', '20708176-0', '938662053', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'GWKF40' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'GWKF40', 'HONDA', 'CIVIC', 0, 'AZUL', 147000) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '3000', 'GWKF40', 'MID PIPE +SILENCIADOR ALTO FLUJO', 'MID PIPE +SILENCIADOR ALTO FLUJO', 469900, 'completada', '2025-06-13');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 1667: OT 3001
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'CRISTIAN GUERRA' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'CRISTIAN GUERRA', '13067521-2', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'SRFJ84' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'SRFJ84', 'BMW', '135', 2023, 'GRIS', 10073) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '3001', 'SRFJ84', 'INSTALACION SILENCIADOR ALTO FLUJO CON VALVULAS +AXLE BACK', 'INSTALACION SILENCIADOR ALTO FLUJO CON VALVULAS +AXLE BACK', 900000, 'completada', '2025-06-13');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 1668: OT 3002
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'RODRIGO MARDONES' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'RODRIGO MARDONES', '10319588-8', '978637122', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'RWVT24' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'RWVT24', 'FORD', 'F-150', 2022, 'GRAFITO', 0) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '3002', 'RWVT24', 'WICKED FLOW +COLA NUEVA', 'WICKED FLOW +COLA NUEVA', 449900, 'completada', '2025-06-17');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 1669: OT 3003
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'TARIK HASBUN' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'TARIK HASBUN', '17702952-1', '982518067', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'LHHL26' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'LHHL26', 'PORSCHE', 'MACAN', 2019, 'GRIS', 58000) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '3003', 'LHHL26', 'INSTALACION COLAS DOBLES', 'INSTALACION COLAS DOBLES', 100000, 'completada', '2025-06-18');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 1670: OT 3004
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'BORIS ANGEL' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'BORIS ANGEL', '19459346-5', '956110007', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'STVS24' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'STVS24', 'RENAULT', 'CLIO', 2023, 'AZUL', 41000) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '3004', 'STVS24', 'AXLE BACK+COLA NUEVA', 'AXLE BACK+COLA NUEVA', 279900, 'completada', '2025-06-18');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 1671: OT 3005
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'CLAUDIO ARANCIBIA' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'CLAUDIO ARANCIBIA', '19892706-6', '967952157', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'XKY74' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'XKY74', 'REGAL RAPTOR', '400', 2023, 'NEGRO', 5500) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '3005', 'XKY74', 'ESCAPE', 'ESCAPE', 100000, 'completada', '2025-06-18');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 1672: OT 3006
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'ENRIQUE POZO' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'ENRIQUE POZO', '12261589-8', '99335848', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'VDYB91' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'VDYB91', 'FORD', 'D-150', 2025, 'GRIS', 800) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '3006', 'VDYB91', 'CUT-OUT', 'CUT-OUT', 449900, 'completada', '2025-06-18');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 1673: OT 3007
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'KENER - SERGIO ACEVEDO' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'KENER - SERGIO ACEVEDO', '', '939335106', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'SZWB69' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'SZWB69', 'DODGE', 'RAM 2500', 2022, 'S/C', 39380) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '3007', 'SZWB69', 'LINEA ACERO INOXIDABLE + DOWNPIPE', 'LINEA ACERO INOXIDABLE + DOWNPIPE', 1500000, 'completada', '2025-06-19');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 1674: OT 3008
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'IGNACIO ROJAS' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'IGNACIO ROJAS', '19245458-', '963943672', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'TG4405' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'TG4405', 'JEEP', 'CHEROKEE XJ', 1999, 'PLATA', 205000) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '3008', 'TG4405', 'LINEA EN ACERO INOX', 'LINEA EN ACERO INOX', 449900, 'completada', '2025-06-19');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 1675: OT 3009
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'MANUEL URIBE' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'MANUEL URIBE', '15485036-8', '976964569', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'SBFH32' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'SBFH32', 'GEELY', 'COOLRAY', 2022, 'ROJO', 42000) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '3009', 'SBFH32', 'SILENCIADOR SMG CON VALVETRONIC + 2 COLAS DOBLES', 'SILENCIADOR SMG CON VALVETRONIC + 2 COLAS DOBLES', 960000, 'completada', '2025-06-19');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 1676: OT 3010
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'HECTOR MOHR' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'HECTOR MOHR', '15790988-6', '990896855', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'VDKC27' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'VDKC27', 'FORD', 'MUSTANG', 2025, 'BLANCO', 2000) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '3010', 'VDKC27', 'X-PIPE', 'X-PIPE', 249900, 'completada', '2025-06-19');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 1677: OT 3011
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'PATRICIO MANQUI' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'PATRICIO MANQUI', '19420779-6', '59948443', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'SBTD56' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'SBTD56', 'CUPRA', 'ATECA', 0, 'BLANCO', 80000) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '3011', 'SBTD56', 'REPARACION (CORTE+SOLDADURA)', 'REPARACION (CORTE+SOLDADURA)', 49900, 'completada', '2025-06-23');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 1678: OT 3012
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'GIORGIO LEIVA' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'GIORGIO LEIVA', '7042836-9', '92374070', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'BSWV57' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'BSWV57', 'FORD', 'F-350', 2009, 'BLANCO', 0) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '3012', 'BSWV57', 'FABRICACION INOX PICK-UP', 'FABRICACION INOX PICK-UP', 2500000, 'completada', '2025-06-23');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 1679: OT 3013
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'CRISTIAN FAUNDEZ' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'CRISTIAN FAUNDEZ', '12880647-4', '958182660', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'FRSB19' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'FRSB19', 'BMW', '320I', 2013, 'GRIS', 0) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '3013', 'FRSB19', 'CAPOT M3 E92 COON PINTURA + PINTURA PARACHOQUE+ CUBRE ESPEJOS +RIÑONES', 'CAPOT M3 E92 COON PINTURA + PINTURA PARACHOQUE+ CUBRE ESPEJOS +RIÑONES', 1179700, 'completada', '2025-06-23');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 1680: OT 3014
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'MAX WOLFF' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'MAX WOLFF', '16097255-6', '995382901', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'SHSC59' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'SHSC59', 'SUBARU', 'WRX', 2023, 'PLATA', 0) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '3014', 'SHSC59', 'LINEA COMPLETA+MAGNAFLOW + COLAS 4''''', 'LINEA COMPLETA+MAGNAFLOW + COLAS 4''''', 849900, 'completada', '2025-06-24');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 1681: OT 3015
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'CORVALAN VILLARROEL LTD' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'CORVALAN VILLARROEL LTD', '76622710-9', '944397756', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'JBBG78' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'JBBG78', 'FORD', 'F-150', 2017, 'ROJO', 55000) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '3015', 'JBBG78', 'INSTALACION ALTO FLUJO KAMIZ WICKED FOW', 'INSTALACION ALTO FLUJO KAMIZ WICKED FOW', 329900, 'completada', '2025-06-24');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 1682: OT 3016
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'LUIS GODOY' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'LUIS GODOY', '', '995731785', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'LJYL81' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'LJYL81', 'FORD', 'MUSTANG', 2019, 'BLANCO', 27255) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '3016', 'LJYL81', 'INSTALACION E IMPORTAC LINEA ROUSH', 'INSTALACION E IMPORTAC LINEA ROUSH', 2249000, 'completada', '2025-06-25');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 1683: OT 3017
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'PATRICIO VERA' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'PATRICIO VERA', '19112609-2', '984568049', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'ARUC82' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'ARUC82', 'SUBARU', 'WRX STI', 2022, 'AZUL', 8800) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '3017', 'ARUC82', 'LINEA COMPLETA INOX + DOBLE MAGNAFLLOW + 4 COLAS', 'LINEA COMPLETA INOX + DOBLE MAGNAFLLOW + 4 COLAS', 1019900, 'completada', '2025-06-25');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 1684: OT 3018
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'RAUL FUENTEALBA' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'RAUL FUENTEALBA', '9649196-4', '944937023', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'LZ8009' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'LZ8009', 'JEEP', 'WRANGLER', 2006, 'S/C', 74000) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '3018', 'LZ8009', 'LINEA ACERO INOXIDABLE', 'LINEA ACERO INOXIDABLE', 600000, 'completada', '2025-06-25');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 1685: OT 3019
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'PATRICIO LUCERO' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'PATRICIO LUCERO', '14128409-1', '922312556', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'SBRF90' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'SBRF90', 'RAM', 'REBEL 57', 2022, 'ROJO', 76000) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '3019', 'SBRF90', 'CUT-OUT', 'CUT-OUT', 449900, 'completada', '2025-06-25');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 1686: OT 3020
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'DANIEL MARICURA' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'DANIEL MARICURA', '18185642-4', '987227329', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'DBGT79' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'DBGT79', 'MERCEDES', 'A200', 2021, 'BLANCO', 68508) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '3020', 'DBGT79', 'AXLE BACK FREE + DIFUSOR A45', 'AXLE BACK FREE + DIFUSOR A45', 749800, 'completada', '2025-06-26');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 1687: OT 3021
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'FRANCISCO MOREIRA' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'FRANCISCO MOREIRA', '19635049-7', '988557827', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'SJGL29' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'SJGL29', 'SUBARU', 'WRX', 2023, 'BLANCO', 18800) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '3021', 'SJGL29', 'LINEA + SILENCIADOR', 'LINEA + SILENCIADOR', 849900, 'completada', '2025-06-26');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 1688: OT 3022
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'FELIPE GODOY' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'FELIPE GODOY', '10537758-4', '981376898', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'SFWY98' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'SFWY98', 'CHEVROLET', 'SILVERADO', 2023, 'ROJO', 40000) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '3022', 'SFWY98', 'INSTALACION ALTO FLUJO', 'INSTALACION ALTO FLUJO', 119900, 'completada', '2025-06-26');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 1689: OT 3023
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'MANUEL URIBE' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'MANUEL URIBE', '15485036-8', '976964569', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'SIN-PAT' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'SIN-PAT', 'GEELY', 'COOLRAY', 2022, 'ROJO', 42000) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '3023', 'SIN-PAT', 'ISDUCCION', 'ISDUCCION', 149900, 'completada', '2025-06-26');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 1690: OT 3024
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'MIGUEL ANGEL GONZALEZ' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'MIGUEL ANGEL GONZALEZ', '19624607-K', '935577273', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'WXWG86' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'WXWG86', 'BMW', '420', 2019, 'NEGRO', 95000) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '3024', 'WXWG86', 'AXLE BACK FREE + DIFUSOR A45', 'AXLE BACK FREE + DIFUSOR A45', 229900, 'completada', '2025-06-27');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 1691: OT 3025
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'FABIAN DONAIRE' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'FABIAN DONAIRE', '16374142-2', '968470787', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'GZLH34' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'GZLH34', 'FORD', 'MUSTANG', 215, 'ROJO', 54000) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '3025', 'GZLH34', 'X-PIPE', 'X-PIPE', 249900, 'completada', '2025-06-27');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 1692: OT 3026
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'ANDRES MARTINEZ' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'ANDRES MARTINEZ', '13752142-3', '994185356', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'HHFG10' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'HHFG10', 'CHEVROLET', 'SILVERADO', 2015, 'BLANCO', 230000) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '3026', 'HHFG10', 'CUT OUT+SPRINT BOOSTE 5 +BMC+COLAS NUEVA', 'CUT OUT+SPRINT BOOSTE 5 +BMC+COLAS NUEVA', 980000, 'completada', '2025-06-27');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 1693: OT 3027
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'CRISTOPHER HURTADO' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'CRISTOPHER HURTADO', '17161791-K', '976583752', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'RZVW86' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'RZVW86', 'MG', 'HS', 2022, 'BLANCO', 61000) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '3027', 'RZVW86', 'CUT-OUT', 'CUT-OUT', 419900, 'completada', '2025-06-30');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 1694: OT 3028
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'MAX VERA' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'MAX VERA', '18614090-7', '950971657', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'RTFF76' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'RTFF76', 'DODGE', 'RAM REBEL', 2022, 'S/C', 82000) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '3028', 'RTFF76', 'CUT OUT +  SILENCIADOR KAMIKAZE', 'CUT OUT +  SILENCIADOR KAMIKAZE', 749900, 'completada', '2025-07-01');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 1695: OT 3029
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'CRISTIAN CHAMORRO' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'CRISTIAN CHAMORRO', '16084657-7', '94366977', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'SKBV46' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'SKBV46', 'JEEP', 'GLADIATOR', 2023, 'ROJO', 14000) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '3029', 'SKBV46', 'LINEA COMPLETA INOX 2,5" + SILENCIADOR ALTO FLUJO', 'LINEA COMPLETA INOX 2,5" + SILENCIADOR ALTO FLUJO', 700000, 'completada', '2025-07-01');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 1696: OT 3030
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'ROBERTO VALECH' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'ROBERTO VALECH', '15314144-K', '79671699', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'CGLF29' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'CGLF29', 'TOYOTA', 'TACOMA', 2010, 'PLATA', 120000) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '3030', 'CGLF29', 'CUT-OUT CIKA', 'CUT-OUT CIKA', 760000, 'completada', '2025-07-01');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 1697: OT 3031
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'DIEGO RAMIREZ' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'DIEGO RAMIREZ', '17521117-9', '983272047', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'GRZC65' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'GRZC65', 'SUBARU', 'WRX', 2014, 'AZUL', 86000) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '3031', 'GRZC65', 'LINEA ACERO INOX + SILENCIADOR ALTO FLUJO + COLAS DOBLES 4"', 'LINEA ACERO INOX + SILENCIADOR ALTO FLUJO + COLAS DOBLES 4"', 849900, 'completada', '2025-07-02');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 1698: OT 3032
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'JAIR ROJAS' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'JAIR ROJAS', '21640529-3', '983255543', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'SHYR37' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'SHYR37', 'NISSAN', 'SENTRA', 2023, 'BLANCO', 47183) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '3032', 'SHYR37', 'SILENCIADOR ALTO FLUJO + COLA NEGRA', 'SILENCIADOR ALTO FLUJO + COLA NEGRA', 479900, 'completada', '2025-07-02');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 1699: OT 3033
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'DIESEL TUNING' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'DIESEL TUNING', '', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'AA330ZM' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'AA330ZM', 'FORD', 'RANGER', 0, 'S/C', 0) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '3033', 'AA330ZM', 'CATALIC DELTE+AXLE BACK +COLA DOBLE NEGRA', 'CATALIC DELTE+AXLE BACK +COLA DOBLE NEGRA', 435000, 'completada', '2025-07-02');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 1700: OT 3034
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'ARIEL URLOINA' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'ARIEL URLOINA', '17315098-9', '993420666', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'PJLZ13' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'PJLZ13', 'H', 'VELOSTER', 2020, 'AZUL', 31000) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '3034', 'PJLZ13', 'DOWNPIPE + REPRO+PROTECTOR TERMICO', 'DOWNPIPE + REPRO+PROTECTOR TERMICO', 774720, 'completada', '2025-07-03');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    RAISE NOTICE 'Procesados 1700 registros...';
    -- Fila 1701: OT 3035
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'KAUFMANN' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'KAUFMANN', '77088562-0', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'SIN-PAT' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'SIN-PAT', 'MERCEDES', 'C635', 2025, 'NEGRO', 10000) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '3035', 'SIN-PAT', 'INSTALACION SILENCIADOR', 'INSTALACION SILENCIADOR', 299900, 'completada', '2025-07-03');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 1702: OT 3036
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'MATIAS DONOSO' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'MATIAS DONOSO', '15644740-4', '968473072', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'TGRP46' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'TGRP46', 'MAZDA', '3', 2024, 'BLANCO', 13000) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '3036', 'TGRP46', 'INSTALACION COLAS DE ESCAPE', 'INSTALACION COLAS DE ESCAPE', 79900, 'completada', '2025-07-04');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 1703: OT 3037
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'MATIAS BAHAMONDES' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'MATIAS BAHAMONDES', '19523599-6', '993195715', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'RYVR56' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'RYVR56', 'SUZUKI', 'SWIFT', 2022, 'GRAFITO', 64000) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '3037', 'RYVR56', 'PROTECTOR TERMICO DOWNPIPE', 'PROTECTOR TERMICO DOWNPIPE', 149900, 'completada', '2025-07-04');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 1704: OT 3038
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'EDUARDO ITURRA' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'EDUARDO ITURRA', '14031264-9', '998412193', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'JRHF92' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'JRHF92', 'BMW', '318', 2017, 'BLANCO', 90000) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '3038', 'JRHF92', 'REPARACION PIPING SALIDA TURBO', 'REPARACION PIPING SALIDA TURBO', 179900, 'completada', '2025-07-04');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 1705: OT 3039
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'SEBASTIAN CASTILLO' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'SEBASTIAN CASTILLO', '17233081-9', '928885253', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'SIN-PAT' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'SIN-PAT', 'SUBARU', 'S/M', 0, 'S/C', 0) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '3039', 'SIN-PAT', 'REPARACION MULTIPLE', 'REPARACION MULTIPLE', 90000, 'completada', '2025-07-04');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 1706: OT 3040
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'JUAN RODRIGUEZ' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'JUAN RODRIGUEZ', '26653348-9', '937231907', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'FKFT59' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'FKFT59', 'AUDI', 'TT', 2013, 'PLATA', 103000) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '3040', 'FKFT59', 'DOWNPIPE', 'DOWNPIPE', 379900, 'completada', '2025-07-07');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 1707: OT 3041
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'IVAN MARIN' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'IVAN MARIN', '18077969-8', '977379404', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'TKCH68' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'TKCH68', 'HAVAL', 'HG GT', 2024, 'S/C', 9800) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '3041', 'TKCH68', 'PROTECTOR TERMICO DOWNPIPE', 'PROTECTOR TERMICO DOWNPIPE', 199000, 'completada', '2025-07-07');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 1708: OT 3042
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'GIANFRANCO CAMAGIRONE' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'GIANFRANCO CAMAGIRONE', '16574865-4', '999999406', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'RZSX20' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'RZSX20', 'VW', 'AMAROK', 2022, 'S/C', 137000) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '3042', 'RZSX20', 'FILTRO BMC', 'FILTRO BMC', 120000, 'completada', '2025-07-08');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 1709: OT 3043
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'CHRISTIAN TORREALBA' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'CHRISTIAN TORREALBA', '18955551-9', '982198671', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'SRDY28' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'SRDY28', 'CHEVROLET', 'SILVERADO', 2023, 'BLANCO', 40000) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '3043', 'SRDY28', 'INSTALACION ALTO FLUJO + WICKED FLOW', 'INSTALACION ALTO FLUJO + WICKED FLOW', 339900, 'completada', '2025-07-09');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 1710: OT 3044
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'JUAN EGUIA' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'JUAN EGUIA', '9703311-0', '977660478', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'RTJR35' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'RTJR35', 'CHEVROLET', 'SILVERADO', 2022, 'S/C', 80000) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '3044', 'RTJR35', 'DESINTALACION CUT OUT', 'DESINTALACION CUT OUT', 100000, 'completada', '2025-07-09');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 1711: OT 3045
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'LUIS GODOY' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'LUIS GODOY', '16189447-8', '995731785', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'LJYL81' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'LJYL81', 'FORD', 'MUSTANG', 2019, 'BLANCO', 28800) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '3045', 'LJYL81', 'Carga masiva', 'Carga masiva', 0, 'completada', '2025-07-09');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 1712: OT 3046
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'ENRIQUE ROJAS' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'ENRIQUE ROJAS', '19215369-7', '953812086', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'WJ7375' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'WJ7375', 'MAZDA', 'RX-8', 2007, 'ROJO', 74000) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '3046', 'WJ7375', 'CUT-OUT + SILENCIADOR +2 COLAS LINEA DESCARGA WASTE GAGE', 'CUT-OUT + SILENCIADOR +2 COLAS LINEA DESCARGA WASTE GAGE', 744400, 'completada', '2025-07-10');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 1713: OT 3047
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'JUAN PABLO' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'JUAN PABLO', '16322801-7', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'LJFU74' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'LJFU74', 'BMW', '140', 2019, 'S/C', 0) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '3047', 'LJFU74', 'INSTALACION COLAS DE ESCAPE', 'INSTALACION COLAS DE ESCAPE', 100000, 'completada', '2025-07-11');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 1714: OT 3048
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'FRANCISCO ALARCON' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'FRANCISCO ALARCON', '13773737-K', '987193384', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'FZZZ42' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'FZZZ42', 'DODGE', 'RAM 1500', 2014, 'NEGRO', 300000) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '3048', 'FZZZ42', 'REMOVER SILENCIADORES', 'REMOVER SILENCIADORES', 200000, 'completada', '2025-07-14');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 1715: OT 3049
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'MAVERICK LEYTON' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'MAVERICK LEYTON', '18066369-K', '995387155', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'PTKP71' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'PTKP71', 'RAM', '1500', 2022, 'BLANCO', 66000) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '3049', 'PTKP71', 'CUT-OUT', 'CUT-OUT', 449900, 'completada', '2025-07-14');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 1716: OT 3050
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'MATIAS VILLEGAS' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'MATIAS VILLEGAS', '22411582-K', '931024681', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'GRYB37' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'GRYB37', 'NISSAN', '370Z', 2014, 'BLANCO', 68500) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '3050', 'GRYB37', 'CUT-OUT', 'CUT-OUT', 849900, 'completada', '2025-07-14');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;

    RAISE NOTICE 'Bloque finalizado con éxito.';
END $$;