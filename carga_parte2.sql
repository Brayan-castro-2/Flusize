DO $$
DECLARE
    v_taller_id UUID := 'e55ce6be-7b8c-4a1a-b333-666333666333';
    v_cliente_id UUID;
    v_vehiculo_id UUID;
BEGIN
    RAISE NOTICE 'Iniciando carga de bloque...';
    -- Fila 430: OT 1580
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'SEBASTIAN HERNANDEZ' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'SEBASTIAN HERNANDEZ', '17318184-1', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'LVCT75' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'LVCT75', 'VOLKSWAGEN', 'JETTA', 2020, 'S/C', 11696) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '1580', 'LVCT75', 'SUPRIMIR SILENCIADOR ALTO FLUJO BORLA POR INOX 3''''', 'SUPRIMIR SILENCIADOR ALTO FLUJO BORLA POR INOX 3''''', 120000, 'completada', '2021-10-18');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 431: OT 1581
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'PATRICIO RIVEROS' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'PATRICIO RIVEROS', '20099474-4', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'GFJX79' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'GFJX79', 'BMW', '116I', 2014, 'S/C', 115157) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '1581', 'GFJX79', 'DOWNPIPE INOX-REPROGRACION ECU STAGE 2', 'DOWNPIPE INOX-REPROGRACION ECU STAGE 2', 740000, 'completada', '2021-10-19');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 432: OT 1582
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'GIOBANNI COLAPRETE' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'GIOBANNI COLAPRETE', '17832932-4', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'RGBW19' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'RGBW19', 'SUBARU', 'STI', 2022, 'S/C', 1044) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '1582', 'RGBW19', 'LINEA INOX 3'''' COMPLETA+SILENCIADOR ALTO FLUJO MAGNAFLOW CENTRAL+COLAS', 'LINEA INOX 3'''' COMPLETA+SILENCIADOR ALTO FLUJO MAGNAFLOW CENTRAL+COLAS', 819900, 'completada', '2021-10-19');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 433: OT 1583
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'JORGE ZUÑIGA' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'JORGE ZUÑIGA', '17680724-8', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'CRTH84' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'CRTH84', 'DODGE', 'DAKOTA', 2010, 'S/C', 141176) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '1583', 'CRTH84', 'REEMPLAZO SILENCIADOR CENTRAL POR ALTO FLUJO BORLA EXHAUST', 'REEMPLAZO SILENCIADOR CENTRAL POR ALTO FLUJO BORLA EXHAUST', 299900, 'completada', '2001-10-19');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 434: OT 1584
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'CRISTIAN OXA' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'CRISTIAN OXA', '16840180-9', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'PZGV72' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'PZGV72', 'MERCEDES', 'C63', 2009, 'S/C', 210) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '1584', 'PZGV72', 'LINEA INOX 2,5 CON X-PIPE CENTRAL+REGULACION SOPORTE+PULIDO SILENCIADOR', 'LINEA INOX 2,5 CON X-PIPE CENTRAL+REGULACION SOPORTE+PULIDO SILENCIADOR', 1834800, 'completada', '2021-10-21');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 435: OT 1585
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'TAAD MECANICA AUTOMOTRIS' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'TAAD MECANICA AUTOMOTRIS', '16055132-1', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'HKRJ41' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'HKRJ41', 'BMW', '120I', 2016, 'S/C', 59399) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '1585', 'HKRJ41', 'DOWNPIPE FABRICACION E INSTALACION INOX', 'DOWNPIPE FABRICACION E INSTALACION INOX', 379900, 'completada', '2021-10-21');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 436: OT 1586
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'FELIPE GONZALEZ' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'FELIPE GONZALEZ', '77333491-9', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'LKXH60' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'LKXH60', 'BMW', '240I', 2019, 'S/C', 13606) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '1586', 'LKXH60', 'INSTALACION DE COLAS DUAL ''LAS TRAE CLIENTE''', 'INSTALACION DE COLAS DUAL ''LAS TRAE CLIENTE''', 60000, 'completada', '2021-10-21');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 437: OT 1587
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'LUCAS  GRAMMELSTORF' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'LUCAS  GRAMMELSTORF', '19763302-7', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'CZLY11' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'CZLY11', 'ALFA ROMERO', '159TI', 2011, 'S/C', 102932) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '1587', 'CZLY11', 'AXLE BACK CON ALTO FLUJO  TIPO BALA CON COLAS 3,5'' STAGE 1 REPRO', 'AXLE BACK CON ALTO FLUJO  TIPO BALA CON COLAS 3,5'' STAGE 1 REPRO', 739800, 'completada', '2021-10-22');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 438: OT 1588
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'MARTIN RIVAS' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'MARTIN RIVAS', '20380569-1', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'DHPX80' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'DHPX80', 'BMW', '550I', 2010, 'S/C', 70760) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '1588', 'DHPX80', 'CONEXIÓN INSTALADO PARA CONEXIÓN DOWNPIPE LINEA ''DP INSTALADO POR CLIENTE''', 'CONEXIÓN INSTALADO PARA CONEXIÓN DOWNPIPE LINEA ''DP INSTALADO POR CLIENTE''', 160000, 'completada', '2021-10-22');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 439: OT 1589
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'GONZALO CONTRERAS' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'GONZALO CONTRERAS', '26099789-0', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'DYYL29' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'DYYL29', 'AUDI', 'A4', 2009, 'S/C', 119257) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '1589', 'DYYL29', 'INSTALACION DE BORLA EXHAUST+COLA DUAL 3,5', 'INSTALACION DE BORLA EXHAUST+COLA DUAL 3,5', 360000, 'completada', '2021-10-25');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 440: OT 1590
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'IVAN CADENA' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'IVAN CADENA', '19343877-6', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'WSPW44' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'WSPW44', 'DODGE', 'RAM 1500', 2018, 'S/C', 0) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '1590', 'WSPW44', 'REMOVER SILENCIADOR CENTRAL - FABRICACION Y', 'REMOVER SILENCIADOR CENTRAL - FABRICACION Y', 130000, 'completada', '2021-10-25');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 441: OT 1591
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'DAVID CARRASCO' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'DAVID CARRASCO', '11610644-9', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'CCZV25' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'CCZV25', 'CHEVROLET', 'CORSA', 2009, 'S/C', 110000) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '1591', 'CCZV25', 'LINEA COMPLETA+SILENCIADOR BORLA TERMINA EN TUBO,DESMONTAJE,REPA,FUGA', 'LINEA COMPLETA+SILENCIADOR BORLA TERMINA EN TUBO,DESMONTAJE,REPA,FUGA', 619900, 'completada', '2021-10-26');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 442: OT 1592
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'BASTIAN ORTEGA' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'BASTIAN ORTEGA', '18750367-1', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'HCGG94' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'HCGG94', 'AUDI', 'A3', 2015, 'S/C', 70274) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '1592', 'HCGG94', 'FABRICACION AXLE BACK TRASERO RESCATA COLA DE ESCAPE-FABRICACION EJE TRAS', 'FABRICACION AXLE BACK TRASERO RESCATA COLA DE ESCAPE-FABRICACION EJE TRAS', 299900, 'completada', '2021-10-27');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 443: OT 1593
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'JORGE PARRA' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'JORGE PARRA', '20129019-8', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'FJDZ10' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'FJDZ10', 'MINI', 'COOPER S', 2013, 'S/C', 93000) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '1593', 'FJDZ10', 'FABRICACION Y-REMOVER SILENCIADOR TRASERO-MANTIENE COLAS', 'FABRICACION Y-REMOVER SILENCIADOR TRASERO-MANTIENE COLAS', 140000, 'completada', '2021-10-27');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 444: OT 1594
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'CLIENTE GENERICO' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'CLIENTE GENERICO', '21394822-9', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'JCGD79' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'JCGD79', 'MINI', 'COOPER S', 2017, 'S/C', 63) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '1594', 'JCGD79', 'INSTALACION DOWNPIPE', 'INSTALACION DOWNPIPE', 60000, 'completada', '2021-10-27');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 445: OT 1595
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'SEBASTIAN PANIAGUA' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'SEBASTIAN PANIAGUA', '', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'GCDR98' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'GCDR98', 'MB', 'A45', 2014, 'S/C', 0) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '1595', 'GCDR98', 'CAMBIO SILENCIADOR VIBRANT 1 ENTRADA 2 SALIDAS', 'CAMBIO SILENCIADOR VIBRANT 1 ENTRADA 2 SALIDAS', 0, 'completada', '2021-10-28');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 446: OT 1596
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'ITALO ESPINOZA' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'ITALO ESPINOZA', '16302699-6', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'HWWS62' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'HWWS62', 'SUZUKI', 'JIMMY', 2016, 'S/C', 54) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '1596', 'HWWS62', 'AXLE BACK TRASERO CON BALA 2'' - COLA CROMO 3'' - INSIDE SPACE', 'AXLE BACK TRASERO CON BALA 2'' - COLA CROMO 3'' - INSIDE SPACE', 235300, 'completada', '2021-10-29');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 447: OT 1597
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'ITALO HUERTA' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'ITALO HUERTA', '17553866-8', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'CWHC59' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'CWHC59', 'VOLVO', 'C30', 0, 'S/C', 95326) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '1597', 'CWHC59', 'GARANTIA ''SONA EJE TRASERO'' INSTALACION BALA VIBRANT ''''BASA BOMBEO CABINA''''', 'GARANTIA ''SONA EJE TRASERO'' INSTALACION BALA VIBRANT ''''BASA BOMBEO CABINA''''', 150000, 'completada', '2021-10-29');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 448: OT 1598
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'ERICK BUSTOS' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'ERICK BUSTOS', '19568922-9', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'HSCW13' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'HSCW13', 'FORD', 'F150', 2016, 'S/C', 95665) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '1598', 'HSCW13', 'LINEA COMPLETA INOX ENTRADA 3'' SALIDA2,5+COLA CORSA BLACK-SILENCIADOR', 'LINEA COMPLETA INOX ENTRADA 3'' SALIDA2,5+COLA CORSA BLACK-SILENCIADOR', 899900, 'completada', '2021-11-02');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 449: OT 1599
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'CRISTIAN GUERRA' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'CRISTIAN GUERRA', '15444552-8', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'FDWZ45' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'FDWZ45', 'BMW', '320', 2013, 'S/C', 0) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '1599', 'FDWZ45', 'FABRICACION TRAMO SALIDA SILENCIADOR ORIGINAL CON CROMO DOBLE', 'FABRICACION TRAMO SALIDA SILENCIADOR ORIGINAL CON CROMO DOBLE', 195000, 'completada', '2021-11-03');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 450: OT 1600
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'JAIME VALDES' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'JAIME VALDES', '12623469-4', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'PROO05' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'PROO05', 'BMW', 'X3 M', 2022, 'S/C', 4263) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '1600', 'PROO05', 'LINEA COMPLETA, SIN TOCAR CATALITICOS REMOVER RESONADOR, COLAS DOBLES', 'LINEA COMPLETA, SIN TOCAR CATALITICOS REMOVER RESONADOR, COLAS DOBLES', 950000, 'completada', '2021-11-03');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 451: OT 1601
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'ADRIAN BLANCO' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'ADRIAN BLANCO', '', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'PA2136' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'PA2136', 'VOLKSWAGEN', 'ESCARABAJO', 0, 'S/C', 0) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '1601', 'PA2136', 'TRABAJO ZONA TRASERA CON FABRICACION DE ''Y'' MAS COLA A CADA LADO', 'TRABAJO ZONA TRASERA CON FABRICACION DE ''Y'' MAS COLA A CADA LADO', 280000, 'completada', '2021-11-03');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 452: OT 1602
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'CRISTIAN ROSALES' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'CRISTIAN ROSALES', '13258962-3', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'JCCT72' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'JCCT72', 'FORD', 'F150 CARIAT', 2017, 'S/C', 0) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '1602', 'JCCT72', 'GARANTIA REFUERZO LINEA  ''''AGREGA SOPORTE''''', 'GARANTIA REFUERZO LINEA  ''''AGREGA SOPORTE''''', 35000, 'completada', '2021-11-04');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 453: OT 1603
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'JORGE LEAL' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'JORGE LEAL', '10625621-7', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'RBZC76' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'RBZC76', 'VOLKSWAGEN', 'TIGUAN', 2022, 'S/C', 7000) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '1603', 'RBZC76', 'AXLE BACK VIBRANT SALIDA DOBLE COLA CROMO 3,5'' -DESMONTAJE EMBELLESEDOR', 'AXLE BACK VIBRANT SALIDA DOBLE COLA CROMO 3,5'' -DESMONTAJE EMBELLESEDOR', 630000, 'completada', '2021-11-04');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 454: OT 1604
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'LUCAS' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'LUCAS', '16972404-0', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'WSVJ45' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'WSVJ45', 'BMW', 'M140', 2019, 'S/C', 22) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '1604', 'WSVJ45', 'REMOVER RESONADOR CENTRAL', 'REMOVER RESONADOR CENTRAL', 60000, 'completada', '2021-11-04');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 455: OT 1605
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'JORGE LOPEZ' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'JORGE LOPEZ', '16888177-0', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'WHHW72' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'WHHW72', 'FORD', 'F150 LARIAT', 2018, 'S/C', 70) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '1605', 'WHHW72', 'INSTALACION BORLA EXHAUST 3''', 'INSTALACION BORLA EXHAUST 3''', 299900, 'completada', '2021-11-04');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 456: OT 1606
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'HUGO' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'HUGO', '14140051-7', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'HGVG36' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'HGVG36', 'VOLKSWAGEN', 'GTI', 2015, 'S/C', 0) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '1606', 'HGVG36', 'FABRICACION DOWNPIPE 3''', 'FABRICACION DOWNPIPE 3''', 350000, 'completada', '2021-11-05');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 457: OT 1607
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'SEBASTIAN SALINAS' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'SEBASTIAN SALINAS', '', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'RHHW57' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'RHHW57', 'HONDA', 'CIVIC', 2022, 'S/C', 700) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '1607', 'RHHW57', 'AXLE BACK FREE, SIN COLA VISIBLE TERMINACION', 'AXLE BACK FREE, SIN COLA VISIBLE TERMINACION', 199900, 'completada', '2021-11-05');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 458: OT 1608
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'ADRIAN BLANCO' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'ADRIAN BLANCO', '18063646-3', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'PA2136' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'PA2136', 'VOLKSWAGEN', 'ESCARABAJO', 0, 'S/C', 0) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '1608', 'PA2136', 'INSTALACION BALA  2''''', 'INSTALACION BALA  2''''', 150000, 'completada', '2021-11-05');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 459: OT 1609
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'GUNNAR DOBSON' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'GUNNAR DOBSON', '13258962-3', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'WXCZ73' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'WXCZ73', 'AUDI', 'A5', 2019, 'S/C', 30000) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '1609', 'WXCZ73', 'FABRICACION MEDIA LINEA FREE + COLAS NUEVAS CROMO', 'FABRICACION MEDIA LINEA FREE + COLAS NUEVAS CROMO', 590000, 'completada', '2021-11-08');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 460: OT 1610
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'FERNANDO OLID' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'FERNANDO OLID', '19038274-5', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'GHWR66' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'GHWR66', 'BMW', '435I', 2014, 'S/C', 50) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '1610', 'GHWR66', 'INSTALACION SILENCIADOR TRASERO-MONTAJE AXLE BACK TRASERO-CAMBIO DE COLA', 'INSTALACION SILENCIADOR TRASERO-MONTAJE AXLE BACK TRASERO-CAMBIO DE COLA', 100000, 'completada', '2021-11-08');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 461: OT 1611
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'RONY SILVA' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'RONY SILVA', '15173186-4', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'HVTG53' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'HVTG53', 'FORD', 'F150 XLT', 2016, 'S/C', 66) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '1611', 'HVTG53', 'LINEA COMPLETA+SILENCIADOR ALTO FLUJO BORLA+COLA BLACK CORSA', 'LINEA COMPLETA+SILENCIADOR ALTO FLUJO BORLA+COLA BLACK CORSA', 669900, 'completada', '2021-11-09');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 462: OT 1612
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'ALEJANDRO MUÑOZ' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'ALEJANDRO MUÑOZ', '15585726-9', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'JCPR15' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'JCPR15', 'BMW', 'M4', 2017, 'S/C', 170150) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '1612', 'JCPR15', 'MONTAJE,FABRICACION DE DOWNPIPE-LINEA DE ESCAPE COMPLETA FREE 3''', 'MONTAJE,FABRICACION DE DOWNPIPE-LINEA DE ESCAPE COMPLETA FREE 3''', 1670000, 'completada', '2021-11-09');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 463: OT 1613
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'RINALDO BASSEN' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'RINALDO BASSEN', '17903008-K', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'HFYL21' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'HFYL21', 'JEEP', 'CHENOKEE', 2015, 'S/C', 60) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '1613', 'HFYL21', 'TRABAJO ESCAPE, SUPRIMIR SILENCIADOR CENTRAL-REMOVER CUT OUT ''''X2''''', 'TRABAJO ESCAPE, SUPRIMIR SILENCIADOR CENTRAL-REMOVER CUT OUT ''''X2''''', 0, 'completada', '2021-11-10');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 464: OT 1614
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'ARIEL ROMERO' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'ARIEL ROMERO', '7438835-3', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'PGYZ81' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'PGYZ81', 'BMW', '128 TI', 2021, 'S/C', 0) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '1614', 'PGYZ81', 'AXLE BACK FREE CON COLAS M ''''CLIENTE TRAE COLAS''''', 'AXLE BACK FREE CON COLAS M ''''CLIENTE TRAE COLAS''''', 229900, 'completada', '2021-11-10');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 465: OT 1615
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'IGNACIO DELGADO' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'IGNACIO DELGADO', '16372157-0', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'CA5203' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'CA5203', 'BMW', '315', 1984, 'S/C', 325764) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '1615', 'CA5203', 'LINEA COMPLETA INOX 2''+SILENCIADOR ALTO FLUJO BORLA EXHAUST CON TERMINAC', 'LINEA COMPLETA INOX 2''+SILENCIADOR ALTO FLUJO BORLA EXHAUST CON TERMINAC', 519900, 'completada', '2021-11-11');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 466: OT 1616
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'MIGUEL PEREZ' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'MIGUEL PEREZ', '25616175-3', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'LDCD11' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'LDCD11', 'RENAULT', 'CLIO', 2019, 'S/C', 10810) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '1616', 'LDCD11', 'INSTALACION MUFFLER ''''LO TRAE CLIENTE''''', 'INSTALACION MUFFLER ''''LO TRAE CLIENTE''''', 80000, 'completada', '2021-11-11');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 467: OT 1617
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'CRISTOBAL CARVALLO' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'CRISTOBAL CARVALLO', '13238554-8', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'FPRJ64' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'FPRJ64', 'BMW', 'Z4', 2013, 'S/C', 48020) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '1617', 'FPRJ64', 'MUFLER DEAR DELEATO MANTIENE COLAS', 'MUFLER DEAR DELEATO MANTIENE COLAS', 240000, 'completada', '2021-11-12');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 468: OT 1618
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'GONZALO HUERTA' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'GONZALO HUERTA', '20575053-3', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'HPYR53' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'HPYR53', 'BMW', 'M5', 1999, 'S/C', 0) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '1618', 'HPYR53', 'FABRICACION MEDIA LINEA 2,5'''' BORLA EXHAUST 2,5''''', 'FABRICACION MEDIA LINEA 2,5'''' BORLA EXHAUST 2,5''''', 850000, 'completada', '2021-11-15');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 469: OT 1619
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'MATIAS PELAYO' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'MATIAS PELAYO', '9840173-K', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'DKCZ78' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'DKCZ78', 'BMW', '535I', 2012, 'S/C', 108) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '1619', 'DKCZ78', 'LINEA COMPLETA ALTO FLUJO VIBRANT EXHAUST + COLA 4'''' CROMO', 'LINEA COMPLETA ALTO FLUJO VIBRANT EXHAUST + COLA 4'''' CROMO', 1019000, 'completada', '2021-11-15');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 470: OT 1620
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'DIEGO VELAZQUES' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'DIEGO VELAZQUES', '19008842-2', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'LSKP31' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'LSKP31', 'DODGE', 'RAM REBEL', 2020, 'S/C', 30) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '1620', 'LSKP31', 'REMOVER SILENCIADOR TRASERO-CAMBIO SILENCIADOR ORIGINAL POR FLOWMASTER', 'REMOVER SILENCIADOR TRASERO-CAMBIO SILENCIADOR ORIGINAL POR FLOWMASTER', 429900, 'completada', '2021-11-16');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 471: OT 1621
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'KLAUS FLORES' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'KLAUS FLORES', '16338491-2', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'KCHK76' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'KCHK76', 'CHEVROLET', 'SILVERADO', 2018, 'S/C', 87089) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '1621', 'KCHK76', 'REEMPLAZO SILENCIADOR ORIGINAL Y BORLA EXHAUST', 'REEMPLAZO SILENCIADOR ORIGINAL Y BORLA EXHAUST', 319900, 'completada', '2021-11-17');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 472: OT 1622
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'CARLOS VARGAS' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'CARLOS VARGAS', '9193481-7', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'LCYC56' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'LCYC56', 'HYUNDAY', 'VELOSTER', 2019, 'S/C', 62108) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '1622', 'LCYC56', 'COLAS 4''''BLACK C/INSTALACION, SE MODIFICA DESDE EL INICIO DEL SILENCIADOR', 'COLAS 4''''BLACK C/INSTALACION, SE MODIFICA DESDE EL INICIO DEL SILENCIADOR', 180000, 'completada', '2021-11-19');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 473: OT 1623
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'ALVARO MUÑOZ' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'ALVARO MUÑOZ', '17413942-3', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'LJWK18' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'LJWK18', 'SUZUKI', 'SWIFT', 2019, 'S/C', 22000) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '1623', 'LJWK18', 'REPARACION DE FUGA DE ESCAPE + CINTA TERMICA', 'REPARACION DE FUGA DE ESCAPE + CINTA TERMICA', 110000, 'completada', '2021-11-19');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 474: OT 1624
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'JUAN MARTINEZ' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'JUAN MARTINEZ', '16356239-1', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'SIN-PAT' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'SIN-PAT', 'CHEVROLET', 'SILVERADO', 0, 'S/C', 18216) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '1624', 'SIN-PAT', 'REEMPLAZO SILENCIADOR ORIGINAL POR ALTO FLUJO - MODULO', 'REEMPLAZO SILENCIADOR ORIGINAL POR ALTO FLUJO - MODULO', 969900, 'completada', '2021-11-19');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 475: OT 1625
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'ALEXIS GUAJARDO' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'ALEXIS GUAJARDO', '', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'JPJL91' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'JPJL91', 'MERCEDES', 'GLE 43', 2017, 'S/C', 42423) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '1625', 'JPJL91', 'LINEA INOX 3''+DUAL BORLAEXHAUST+REPRO DE ECU STAGE+INTALACION D CATALITICO', 'LINEA INOX 3''+DUAL BORLAEXHAUST+REPRO DE ECU STAGE+INTALACION D CATALITICO', 2749900, 'completada', '2021-11-22');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 476: OT 1626
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'JASON LOYOLA' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'JASON LOYOLA', '18276783-2', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'JJVF63' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'JJVF63', 'BMW', '120I', 2017, 'S/C', 0) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '1626', 'JJVF63', 'INSTALACION ALTO FLUJO RESONADOR CENTRAL-REPARAR FUGA DE ESCAPE POR JUGA', 'INSTALACION ALTO FLUJO RESONADOR CENTRAL-REPARAR FUGA DE ESCAPE POR JUGA', 335000, 'completada', '2021-11-22');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 477: OT 1627
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'JOSE IGNACIO SOTO' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'JOSE IGNACIO SOTO', '', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'HHRF80' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'HHRF80', 'BMW', '120I', 2015, 'S/C', 68047) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '1627', 'HHRF80', 'AXLE BACK FREE CON COLAS QUE TRAE CLIENTE-INSTALACION DIFUSOR', 'AXLE BACK FREE CON COLAS QUE TRAE CLIENTE-INSTALACION DIFUSOR', 319800, 'completada', '2021-11-22');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 478: OT 1628
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'CRISTIAN GAMBOA' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'CRISTIAN GAMBOA', '17601578-0', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'LDDD27' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'LDDD27', 'SUBARU', 'WRX', 2019, 'S/C', 28380) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '1628', 'LDDD27', 'LINEA COMPLETA INOX 3''''+MAGNAFLOW 1 ENTRADA 2 SALIDAS+4 COLAS 3'' INOX', 'LINEA COMPLETA INOX 3''''+MAGNAFLOW 1 ENTRADA 2 SALIDAS+4 COLAS 3'' INOX', 979900, 'completada', '2021-11-23');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 479: OT 1629
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'JUAN PABLO' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'JUAN PABLO', '16848860-2', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'KZSW17' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'KZSW17', 'HYUNDAY', 'VELOSTER', 2019, 'S/C', 50018) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '1629', 'KZSW17', 'INSTALACION SPRINTBOOSTER+SHAMPOO SEVENBOSS SHINE', 'INSTALACION SPRINTBOOSTER+SHAMPOO SEVENBOSS SHINE', 268100, 'completada', '2021-11-23');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 480: OT 1630
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'SERGIO SOTO' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'SERGIO SOTO', '17601846-1', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'KLTC40' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'KLTC40', 'BMW', '420I', 2018, 'S/C', 34146) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '1630', 'KLTC40', 'INSTALACION SPRINTBOOSTER V3', 'INSTALACION SPRINTBOOSTER V3', 259900, 'completada', '2021-11-23');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 481: OT 1631
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'ALEX SEPULVEDA' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'ALEX SEPULVEDA', '14475509-K', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'LGHH87' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'LGHH87', 'SUZUKI', 'SWIFT', 2019, 'S/C', 17000) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '1631', 'LGHH87', 'FABRICACION FRONTPIPE HACIA ATRÁS-CLIENTE TRAE COLAS Y BORLA', 'FABRICACION FRONTPIPE HACIA ATRÁS-CLIENTE TRAE COLAS Y BORLA', 399900, 'completada', '2021-11-24');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 482: OT 1632
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'JAIME ORTIZ' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'JAIME ORTIZ', '17199553-1', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'HCJR89' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'HCJR89', 'AUDI', 'RSQ3', 2015, 'S/C', 67575) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '1632', 'HCJR89', 'LINEA FREE 3''''COMPLETA+COLA DE ESCAPE DOBLE CROMO ''BLACK''', 'LINEA FREE 3''''COMPLETA+COLA DE ESCAPE DOBLE CROMO ''BLACK''', 550000, 'completada', '2021-11-24');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 483: OT 1633
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'JOSE ROJAS' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'JOSE ROJAS', '19547812-0', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'PHPP16' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'PHPP16', 'DODGE', 'RAM 1500', 2020, 'S/C', 0) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '1633', 'PHPP16', 'LINEA COMPLETA DOBLE 3''+COLA CORSA NEGRO BRILLANTE+SILENCIADOR ALTO FLUJ', 'LINEA COMPLETA DOBLE 3''+COLA CORSA NEGRO BRILLANTE+SILENCIADOR ALTO FLUJ', 1064900, 'completada', '2021-11-25');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 484: OT 1634
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'VICENTE BUSTOS' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'VICENTE BUSTOS', '11881971-3', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'PZGL76' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'PZGL76', 'SUZUKI', 'SWIFT', 2021, 'S/C', 8181) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '1634', 'PZGL76', 'RESONADOR DELETE', 'RESONADOR DELETE', 85000, 'completada', '2021-11-26');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 485: OT 1635
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'VICENTE CIFUENTES' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'VICENTE CIFUENTES', '19134037-K', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'KRJB43' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'KRJB43', 'BMW', '140I', 2018, 'S/C', 45) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '1635', 'KRJB43', 'INSTALACION COLA DE ESCAPE ''TRAE CLIENTE''', 'INSTALACION COLA DE ESCAPE ''TRAE CLIENTE''', 120000, 'completada', '2021-11-26');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 486: OT 1636
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'ANGELO ACEVEDO' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'ANGELO ACEVEDO', '21030919-5', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'JLFG58' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'JLFG58', 'CHEVROLET', 'CAMARO', 2017, 'S/C', 9795) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '1636', 'JLFG58', 'AXLE BACK MAGNAFLOW ALTO FLUJO 4''''BODY + 2 COLAS INOX 4''''', 'AXLE BACK MAGNAFLOW ALTO FLUJO 4''''BODY + 2 COLAS INOX 4''''', 649900, 'completada', '2021-11-29');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 487: OT 1637
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'BENJAMIN JOSE CERDA RIOS' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'BENJAMIN JOSE CERDA RIOS', '17515339-K', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'KJJV98' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'KJJV98', 'VOLKSWAGEN', 'GOLF GTI', 2018, 'S/C', 49644) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '1637', 'KJJV98', 'FABRICACION DOWNPIPE 3'''' AXLE BACK FREE COLA BLACK', 'FABRICACION DOWNPIPE 3'''' AXLE BACK FREE COLA BLACK', 649900, 'completada', '2021-11-29');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 488: OT 1638
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'INGENIERIA CIVIL SSTEC IPABLOL' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'INGENIERIA CIVIL SSTEC IPABLOL', '18933443-5', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'PJCB89' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'PJCB89', 'JEEP', 'SRT', 2021, 'S/C', 18) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '1638', 'PJCB89', 'FABRICACION XPIPE INOX + REMOVER SILENCIADOR CENTRAL', 'FABRICACION XPIPE INOX + REMOVER SILENCIADOR CENTRAL', 299900, 'completada', '2021-11-29');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 489: OT 1639
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'DANIEL CORDOVA' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'DANIEL CORDOVA', '77139066-8', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'HJRV26' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'HJRV26', 'BMW', '120I', 2015, 'S/C', 34685) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '1639', 'HJRV26', 'STAGE 1+ ESCAPE MEDIA LINEA INOX 2,5+VIBRANT EXHAUS+2 COLAS 3,5', 'STAGE 1+ ESCAPE MEDIA LINEA INOX 2,5+VIBRANT EXHAUS+2 COLAS 3,5', 1029900, 'completada', '2021-11-30');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 490: OT 1640
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'MATIAS ALDUNCE' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'MATIAS ALDUNCE', '18467262-6', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'BHJB86' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'BHJB86', 'FORD', 'MUSTANG', 2009, 'S/C', 0) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '1640', 'BHJB86', 'FABRICACION XPIPE', 'FABRICACION XPIPE', 350000, 'completada', '2021-11-30');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 491: OT 1641
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'ALVARO JARA ORREGO' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'ALVARO JARA ORREGO', '14119594-8', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'FHXT50' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'FHXT50', 'VOLKSWAGEN', 'BORA', 2013, 'S/C', 82417) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '1641', 'FHXT50', 'INSTALACION BORLA+COLAS CROMO DOBLE SALIDA', 'INSTALACION BORLA+COLAS CROMO DOBLE SALIDA', 269900, 'completada', '2021-12-01');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 492: OT 1642
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'MATIAS AGUIRRE' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'MATIAS AGUIRRE', '19292264-K', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'PSYT71' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'PSYT71', 'BMW', '420I', 2021, 'S/C', 0) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '1642', 'PSYT71', 'CAMBIO LINEA ALTO FLUJO', 'CAMBIO LINEA ALTO FLUJO', 100000, 'completada', '2021-12-01');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 493: OT 1643
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'LEONCIO CHAGON' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'LEONCIO CHAGON', '16659380-8', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'JYCW25' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'JYCW25', 'NISSAN', 'JUKE', 0, 'S/C', 0) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '1643', 'JYCW25', 'STAGE 2 + POPS AND BANG', 'STAGE 2 + POPS AND BANG', 350000, 'completada', '2021-12-02');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 494: OT 1644
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'CLIENTE GENERICO' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'CLIENTE GENERICO', '18077362-2', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'SIN-PAT' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'SIN-PAT', 'S/M', 'S/M', 0, 'S/C', 0) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '1644', 'SIN-PAT', 'Carga masiva', 'Carga masiva', 0, 'completada', '2026-01-01');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 495: OT 1645
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'DIEGO GONZALEZ' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'DIEGO GONZALEZ', '', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'HHPD44' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'HHPD44', 'BMW', '420I', 2015, 'S/C', 0) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '1645', 'HHPD44', 'MEDIA LINEA FREE 2,5'''' + COLA ''''M'''' DOBLE', 'MEDIA LINEA FREE 2,5'''' + COLA ''''M'''' DOBLE', 370000, 'completada', '2021-12-02');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 496: OT 1646
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'ESTEBAN NAVARRETE' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'ESTEBAN NAVARRETE', '15666750-1', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'KXXP32' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'KXXP32', 'HONDA', 'CIVIC', 2019, 'S/C', 22) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '1646', 'KXXP32', 'FABRICACION AXLE BACK-SILENCIADOR-MAGNAFLOW+3COLAS BLACK-MAGNA+4 COLA', 'FABRICACION AXLE BACK-SILENCIADOR-MAGNAFLOW+3COLAS BLACK-MAGNA+4 COLA', 599900, 'completada', '2021-12-02');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 497: OT 1647
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'PABLO SANTOS' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'PABLO SANTOS', '17411167-7', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'JKKW21' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'JKKW21', 'SKODA', 'OCTAVIA VRS', 2017, 'S/C', 49422) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '1647', 'JKKW21', 'LINEA INOX 2,5''+DUAL VIBRANT EXHAUST+RE INSTALACION DE CUT OUT+MANTIENE COLAS', 'LINEA INOX 2,5''+DUAL VIBRANT EXHAUST+RE INSTALACION DE CUT OUT+MANTIENE COLAS', 760000, 'completada', '2021-12-02');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 498: OT 1648
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'ESTEBAN CLAVOS' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'ESTEBAN CLAVOS', '24096926-2', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'FGLD23' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'FGLD23', 'AUDI', 'S4', 2013, 'S/C', 80358) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '1648', 'FGLD23', 'INSTALACION SPRINTBOOSTER V3', 'INSTALACION SPRINTBOOSTER V3', 249900, 'completada', '2021-12-02');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 499: OT 1649
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'ALAN JIMENEZ' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'ALAN JIMENEZ', '13908587-6', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'RBDG47' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'RBDG47', 'MAZDA', '3', 2021, 'S/C', 8092) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '1649', 'RBDG47', 'INSTALACION FLANCHE EN SILENCIADOR OEM PARA HACER INTERCAMBIABLE AXLE', 'INSTALACION FLANCHE EN SILENCIADOR OEM PARA HACER INTERCAMBIABLE AXLE', 45000, 'completada', '2021-12-03');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 500: OT 1650
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'JOSE QUINTEROS' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'JOSE QUINTEROS', '16490135-1', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'HPHF81' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'HPHF81', 'VOLKSWAGEN', 'GOLF GTI', 2016, 'S/C', 38548) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '1650', 'HPHF81', 'MUFFLER CENTER DELETE', 'MUFFLER CENTER DELETE', 65000, 'completada', '2021-12-03');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    RAISE NOTICE 'Procesados 500 registros...';
    -- Fila 501: OT 1651
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'ESTEBAN CLAVO' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'ESTEBAN CLAVO', '16358453-0', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'FGLD23' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'FGLD23', 'AUDI', 'S4', 2013, 'S/C', 80399) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '1651', 'FGLD23', 'PRUEBA DE SILENCIADOR VIBRANT EXHAUST PARA RECUPERAR POPS AND BANG-REEMPLAZO SILENCIADOR+DUAL COLA CROMO', 'PRUEBA DE SILENCIADOR VIBRANT EXHAUST PARA RECUPERAR POPS AND BANG-REEMPLAZO SILENCIADOR+DUAL COLA CROMO', 760000, 'completada', '2021-12-03');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 502: OT 1652
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'JAVIER RODRIGUEZ' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'JAVIER RODRIGUEZ', '13908587-6', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'PTRH94' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'PTRH94', 'MAZDA', '3', 2021, 'S/C', 9420) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '1652', 'PTRH94', 'AXLE BACK DUAL VIBRANT + COLAS4'''' BLACK', 'AXLE BACK DUAL VIBRANT + COLAS4'''' BLACK', 650000, 'completada', '2021-12-06');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 503: OT 1653
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'GUILLERMO HINZPETER' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'GUILLERMO HINZPETER', '18407821-K', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'KKWC11' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'KKWC11', 'MINI', 'COOPER', 2018, 'S/C', 81209) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '1653', 'KKWC11', 'INSTALACION ALTO FLUJO BORLA ''LO TRAE CLIENTE'' C/ COLA 3,5''''SMG', 'INSTALACION ALTO FLUJO BORLA ''LO TRAE CLIENTE'' C/ COLA 3,5''''SMG', 169900, 'completada', '2021-12-06');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 504: OT 1654
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'FRANCO VILLANOS' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'FRANCO VILLANOS', '19636513-3', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'LGTH49' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'LGTH49', 'FORD', 'MUSTANG', 2019, 'S/C', 0) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '1654', 'LGTH49', 'INSTALACION COLA DE ESCAPE, MANTIENE VALVULA SILENCIADOR NEGRO BRILLANTE', 'INSTALACION COLA DE ESCAPE, MANTIENE VALVULA SILENCIADOR NEGRO BRILLANTE', 400000, 'completada', '2021-12-06');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 505: OT 1655
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'JUAN PABLO VELASQUEZ' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'JUAN PABLO VELASQUEZ', '21092662-3', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'CLPK84' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'CLPK84', 'BMW', 'X1', 2016, 'S/C', 134521) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '1655', 'CLPK84', 'AXLE BACK COLAS DUAL 3,5'' VIBRANT EXHAUST', 'AXLE BACK COLAS DUAL 3,5'' VIBRANT EXHAUST', 389900, 'completada', '2021-12-07');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 506: OT 1656
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'ARIEL URBINA' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'ARIEL URBINA', '7037300-9', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'HZDW14' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'HZDW14', 'HYUNDAY', 'EON', 2017, 'S/C', 78213) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '1656', 'HZDW14', 'REEMPLAZO DE SILENCIADOR POR ALTO FLUJO TIPO BORLA INOX 2''''', 'REEMPLAZO DE SILENCIADOR POR ALTO FLUJO TIPO BORLA INOX 2''''', 150000, 'completada', '2021-12-07');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 507: OT 1657
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'HECTOR NOVOA' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'HECTOR NOVOA', '14198005-K', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'GCDP21' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'GCDP21', 'FORD', 'F150', 2014, 'S/C', 124562) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '1657', 'GCDP21', 'LINEA INOX COMPLETA 3''''+SILENCIADOR ALTO FLUJO CON DOBLE SALIDA HACIA ATRÁS', 'LINEA INOX COMPLETA 3''''+SILENCIADOR ALTO FLUJO CON DOBLE SALIDA HACIA ATRÁS', 849900, 'completada', '2021-12-07');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 508: OT 1658
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'NAIM BELKERBACH' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'NAIM BELKERBACH', '17283294-6', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'JSBV13' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'JSBV13', 'MERCEDES', 'C300', 2017, 'S/C', 42168) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '1658', 'JSBV13', 'SUPRIMIR SILENCIADOR TRASERO Y INOX 2,5'''' TIG', 'SUPRIMIR SILENCIADOR TRASERO Y INOX 2,5'''' TIG', 219900, 'completada', '2021-12-07');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 509: OT 1659
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'IGNACIO ERAZO' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'IGNACIO ERAZO', '17612604-3', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'RJYK48' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'RJYK48', 'SUZUKI', 'SWIFT', 2022, 'S/C', 620) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '1659', 'RJYK48', 'INSTALACION MAGNAFLOW CENTRAL', 'INSTALACION MAGNAFLOW CENTRAL', 279900, 'completada', '2021-12-09');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 510: OT 1660
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'ALEXIS REYES' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'ALEXIS REYES', '20052092-0', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'FKDR34' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'FKDR34', 'MERCEDES', 'ML350', 2013, 'S/C', 99002) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '1660', 'FKDR34', 'MONTAJE LINEA ORIGINAL MERCEDES ML35O -EX VEHICULO CLIENTE OT1640', 'MONTAJE LINEA ORIGINAL MERCEDES ML35O -EX VEHICULO CLIENTE OT1640', 100000, 'completada', '2021-12-09');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 511: OT 1661
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'POUL PAULOS' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'POUL PAULOS', '18873303-4', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'JBJS26' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'JBJS26', 'SUBARU', 'WRX', 2017, 'S/C', 85500) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '1661', 'JBJS26', 'LINEA COMPLETA INOX MAGNAFLOW CENTRAL+COLAS DUAL 3,5'''' CROMO', 'LINEA COMPLETA INOX MAGNAFLOW CENTRAL+COLAS DUAL 3,5'''' CROMO', 849900, 'completada', '2021-12-10');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 512: OT 1662
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'IBSAN ALFARO' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'IBSAN ALFARO', '18032885-8', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'KSSL79' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'KSSL79', 'FORD', 'FOCUS RS', 2018, 'S/C', 27) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '1662', 'KSSL79', 'FABRICACION ANTIPRON-INSTALACION SILENCIADOR TIPO BALA-ABRAZADERA SILENCIADOR ORIGINAL-MAGNAFLOW', 'FABRICACION ANTIPRON-INSTALACION SILENCIADOR TIPO BALA-ABRAZADERA SILENCIADOR ORIGINAL-MAGNAFLOW', 419900, 'completada', '2021-12-10');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 513: OT 1663
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'JAIME AGUSTIN' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'JAIME AGUSTIN', '19524409-K', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'PFYD12' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'PFYD12', 'BMW', '2181', 2020, 'S/C', 0) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '1663', 'PFYD12', 'LINEA COMPLETA FREE', 'LINEA COMPLETA FREE', 400000, 'completada', '2021-12-12');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 514: OT 1664
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'CARLOS AGUIRRE' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'CARLOS AGUIRRE', '', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'LZLL22' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'LZLL22', 'CHEVROLET', 'SILVERADO', 2020, 'S/C', 44090) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '1664', 'LZLL22', 'INSTALACION SILENCIADOR ALTO FLUJO BORLA EXHAUST', 'INSTALACION SILENCIADOR ALTO FLUJO BORLA EXHAUST', 299900, 'completada', '2021-12-14');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 515: OT 1665
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'FELIPE VIVANCO DUARTE' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'FELIPE VIVANCO DUARTE', '17566487-4', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'PHSL46' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'PHSL46', 'SUBARU', 'WRX', 2021, 'S/C', 28) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '1665', 'PHSL46', 'REMOVER SILENCIADOR CENTRAL- FABRICACION BRAZOS FREE', 'REMOVER SILENCIADOR CENTRAL- FABRICACION BRAZOS FREE', 0, 'completada', '2021-12-15');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 516: OT 1666
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'JESUS TOMMY' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'JESUS TOMMY', '18170070-K', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'LWLL91' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'LWLL91', 'VOLKSWAGEN', 'GOLF', 2020, 'S/C', 0) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '1666', 'LWLL91', 'AXLE BACK FREE+COLAS DUAL 3,5''''', 'AXLE BACK FREE+COLAS DUAL 3,5''''', 299900, 'completada', '2021-12-15');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 517: OT 1667
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'CARLOS MESTRE' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'CARLOS MESTRE', '21806696-8', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'XF7438' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'XF7438', 'MAZDA', '323', 2004, 'S/C', 139102) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '1667', 'XF7438', 'INSTALACION CATALITICO, CONSERVA FLANCHE-COLA DE ESCAPE SMG', 'INSTALACION CATALITICO, CONSERVA FLANCHE-COLA DE ESCAPE SMG', 390000, 'completada', '2021-12-16');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 518: OT 1668
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'LUIS MOLINA' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'LUIS MOLINA', '26024451-5', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'RKSJ50' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'RKSJ50', 'CHEVROLET', 'SILVERADO', 2022, 'S/C', 0) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '1668', 'RKSJ50', 'LINEA COMPLETA + MAGNAFLOW, MANTIENE COLA DE ESCAPE', 'LINEA COMPLETA + MAGNAFLOW, MANTIENE COLA DE ESCAPE', 749900, 'completada', '2021-12-16');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 519: OT 1669
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'FRANCISCO JAPUE' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'FRANCISCO JAPUE', '15152211-4', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'LH5314' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'LH5314', 'MERCEDES BENZ', '300E', 0, 'S/C', 0) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '1669', 'LH5314', 'AXLE BACK FREE + COLAS DUAL 2''''', 'AXLE BACK FREE + COLAS DUAL 2''''', 165000, 'completada', '2021-12-17');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 520: OT 1670
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'FRANCISCO ANGULO' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'FRANCISCO ANGULO', '17043581-8', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'JHDR88' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'JHDR88', 'KIA', 'CERATOS', 2017, 'S/C', 58646) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '1670', 'JHDR88', 'FABRICACION LINEA COMPLETA 2'' ''''CLIENTE TRAE SILENCIADOR'''' CON CORTE LEVE AL DIFUSOR', 'FABRICACION LINEA COMPLETA 2'' ''''CLIENTE TRAE SILENCIADOR'''' CON CORTE LEVE AL DIFUSOR', 354900, 'completada', '2021-12-20');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 521: OT 1671
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'LUIS MOLINA' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'LUIS MOLINA', '19119760-7', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'RKSJ50' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'RKSJ50', 'CHEVROLET', 'SILVERADO', 2022, 'S/C', 0) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '1671', 'RKSJ50', 'INSTALACION ALTO FLUJO VIBRANT', 'INSTALACION ALTO FLUJO VIBRANT', 240000, 'completada', '2021-12-20');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 522: OT 1672
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'CRISTIAN FREITOS' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'CRISTIAN FREITOS', '15152211-4', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'PHVH47' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'PHVH47', 'SUBARU', 'WRX', 2021, 'S/C', 7557) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '1672', 'PHVH47', 'AXLE BACK FREE LIBRE + COLAS DUAL BLACK 3,5''''', 'AXLE BACK FREE LIBRE + COLAS DUAL BLACK 3,5''''', 489900, 'completada', '2021-12-20');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 523: OT 1673
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'GIOVANI COLAPRETE' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'GIOVANI COLAPRETE', '19445235-7', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'RKCD61' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'RKCD61', 'FORD', 'BRONCO', 2022, 'S/C', 557) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '1673', 'RKCD61', 'AXLE BACK FREE SIN COLAS', 'AXLE BACK FREE SIN COLAS', 219900, 'completada', '2021-12-21');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 524: OT 1674
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'CLAUDIO ESCONDOR' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'CLAUDIO ESCONDOR', '17680924-8', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'CDFV60' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'CDFV60', 'MAZDA', 'GR', 2009, 'S/C', 129513) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '1674', 'CDFV60', 'INSTALACION SPRINTBOOSTER', 'INSTALACION SPRINTBOOSTER', 259900, 'completada', '2021-12-21');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 525: OT 1675
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'FELIPE ALVAREZ' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'FELIPE ALVAREZ', '18906871-9', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'HRHK54' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'HRHK54', 'FIAT', '500', 2016, 'S/C', 87988) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '1675', 'HRHK54', 'REMPLAZO SILENCIADOR ORIGINAL CAMBIO Y SOLDADURA FLANCHE', 'REMPLAZO SILENCIADOR ORIGINAL CAMBIO Y SOLDADURA FLANCHE', 80000, 'completada', '2021-12-22');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 526: OT 1676
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'CLIENTE GENERICO' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'CLIENTE GENERICO', '18299560-6', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'SIN-PAT' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'SIN-PAT', 'S/M', 'S/M', 0, 'S/C', 0) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '1676', 'SIN-PAT', 'Carga masiva', 'Carga masiva', 0, 'completada', '2026-01-01');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 527: OT 1677
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'ALEJANDRO PEÑALOZO' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'ALEJANDRO PEÑALOZO', '', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'DKLF66' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'DKLF66', 'HYUNDAY', 'SONATA', 2012, 'S/C', 117714) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '1677', 'DKLF66', 'AXLE BACK BORLA EXHAUST CON TERMINACION OEN', 'AXLE BACK BORLA EXHAUST CON TERMINACION OEN', 299900, 'completada', '2021-12-22');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 528: OT 1678
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'LUCAS LEON' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'LUCAS LEON', '13665894-8', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'PJGB98' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'PJGB98', 'AUDI', 'A3 35TFSI', 2020, 'S/C', 8668) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '1678', 'PJGB98', 'FABRICACION DOWNPIPE', 'FABRICACION DOWNPIPE', 379900, 'completada', '2021-12-23');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 529: OT 1679
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'IVAN MARTINEZ' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'IVAN MARTINEZ', '20943635-3', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'HYPP20' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'HYPP20', 'BMW', 'I8', 2016, 'S/C', 16100) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '1679', 'HYPP20', 'LINEA DE ESCAPE VIBRANT EXHAUST CON DUAL COLA TUBO INOX 2,3''''-REPRO DE ECU STAGE 1-LINEA + ESCAPE SCPROYECT AAA', 'LINEA DE ESCAPE VIBRANT EXHAUST CON DUAL COLA TUBO INOX 2,3''''-REPRO DE ECU STAGE 1-LINEA + ESCAPE SCPROYECT AAA', 2261000, 'completada', '2021-12-23');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 530: OT 1680
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'JESUS CABELLO' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'JESUS CABELLO', '', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'JYKP98' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'JYKP98', 'AUDI', 'TT', 2018, 'S/C', 15537) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '1680', 'JYKP98', 'REMOVER SILENCIADOR CENTRAL', 'REMOVER SILENCIADOR CENTRAL', 80000, 'completada', '2021-12-27');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 531: OT 1681
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'SEBASTIAN GALLARDO' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'SEBASTIAN GALLARDO', '16070501-9', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'CPBY94' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'CPBY94', 'CHEVROLET', 'CAMARO 55', 2010, 'S/C', 68786) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '1681', 'CPBY94', 'CHEQUE Y REPARACION DE MULTIPLE Y LINEA', 'CHEQUE Y REPARACION DE MULTIPLE Y LINEA', 0, 'completada', '2021-12-27');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 532: OT 1682
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'IGNACIO GONZALEZ' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'IGNACIO GONZALEZ', '19097201-1', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'GPJK22' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'GPJK22', 'BMW', '650I', 2014, 'S/C', 58607) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '1682', 'GPJK22', 'DOWNPIPE INOX 3''-REPRO DE ECU STAGE 2-ESCAPE INOX VIBRANT EXHAUST', 'DOWNPIPE INOX 3''-REPRO DE ECU STAGE 2-ESCAPE INOX VIBRANT EXHAUST', 2312610, 'completada', '2021-12-27');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 533: OT 1683
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'JONATAN CARRASCO' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'JONATAN CARRASCO', '17596142-9', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'CFWR60' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'CFWR60', 'KIA', 'CERATOS', 2010, 'S/C', 174) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '1683', 'CFWR60', 'CAMBIO 3 GOMAS SOPORTE - SOLDAR SOPORTE', 'CAMBIO 3 GOMAS SOPORTE - SOLDAR SOPORTE', 45000, 'completada', '2021-12-27');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 534: OT 1684
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'SEBASTIAN GUTIERREZ' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'SEBASTIAN GUTIERREZ', '18385710-K', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'DZHZ58' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'DZHZ58', 'DODGE', 'RAM 1500', 2012, 'S/C', 143974) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '1684', 'DZHZ58', 'INSTALACION SILENCIADOR ALTO FLUJO BORLA', 'INSTALACION SILENCIADOR ALTO FLUJO BORLA', 299900, 'completada', '2021-12-28');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 535: OT 1685
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'LEONARDO CAMPOS' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'LEONARDO CAMPOS', '16374464-3', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'LTWK93' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'LTWK93', 'VOLKSWAGEN', 'GOLF R', 2020, 'S/C', 17752) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '1685', 'LTWK93', 'INSTALACION SILENCIADOR VIBRANT', 'INSTALACION SILENCIADOR VIBRANT', 160000, 'completada', '2021-12-28');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 536: OT 1686
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'GUILLERMO SOTO LLANOS' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'GUILLERMO SOTO LLANOS', '18883075-7', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'GWFP80' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'GWFP80', 'SUBARU', 'WRX', 2015, 'S/C', 76790) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '1686', 'GWFP80', 'LINEA COMPLETA, MAGNAFLOW CENTRAL + COLA DUAL 3,5''''', 'LINEA COMPLETA, MAGNAFLOW CENTRAL + COLA DUAL 3,5''''', 850000, 'completada', '2021-12-29');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 537: OT 1687
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'RODRIGO DE LA FUENTE' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'RODRIGO DE LA FUENTE', '', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'POR SACAR' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'POR SACAR', 'CHEVROLET', 'SILVERADO', 2022, 'S/C', 0) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '1687', 'POR SACAR', 'INSTALACION BORLA EXHAUST', 'INSTALACION BORLA EXHAUST', 299900, 'completada', '2021-12-30');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 538: OT 1688
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'CLIENTE GENERICO' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'CLIENTE GENERICO', '13298148-5', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'FBKG22' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'FBKG22', 'HONDA', 'CIVIC', 0, 'S/C', 0) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '1688', 'FBKG22', 'SOPORTE TRAMO CENTRAL', 'SOPORTE TRAMO CENTRAL', 35000, 'completada', '2021-12-30');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 539: OT 1689
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'FELIPE URRITA' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'FELIPE URRITA', '', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'PKFT74' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'PKFT74', 'CHEVROLET', 'SILVERADO', 2021, 'S/C', 38904) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '1689', 'PKFT74', 'INSTALACION CUT OUT 3''''', 'INSTALACION CUT OUT 3''''', 269900, 'completada', '2022-01-03');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 540: OT 1690
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'PABLO RAMIREZ' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'PABLO RAMIREZ', '19890811-8', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'SIN-PAT' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'SIN-PAT', 'JEEP', 'WRANGLER', 2000, 'S/C', 189790) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '1690', 'SIN-PAT', 'MULTIPLE INOX-LINEA INOX 2,5''''+ SILENCIADOR ALTO FLUJO BORLA', 'MULTIPLE INOX-LINEA INOX 2,5''''+ SILENCIADOR ALTO FLUJO BORLA', 1059800, 'completada', '2022-01-03');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 541: OT 1691
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'JEYSON VERGARA' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'JEYSON VERGARA', '', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'DXWX36' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'DXWX36', 'DODGE', 'JOURNEY', 2013, 'S/C', 0) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '1691', 'DXWX36', 'CUT OUT 2,5'''' INSTALADO', 'CUT OUT 2,5'''' INSTALADO', 350000, 'completada', '2022-01-03');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 542: OT 1692
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'IVAN CADENAS' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'IVAN CADENAS', '17925421-2', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'PDKJ27' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'PDKJ27', 'JEEP', 'GLADIATOR', 2022, 'S/C', 10000) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '1692', 'PDKJ27', 'SUPRIME 2 SILENCIADORES CENTRALES', 'SUPRIME 2 SILENCIADORES CENTRALES', 175000, 'completada', '2022-01-03');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 543: OT 1693
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'ANGEL VILLANUEVA' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'ANGEL VILLANUEVA', '17670644-9', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'JWZW43' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'JWZW43', 'FORD', 'MUSTANG', 2018, 'S/C', 36057) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '1693', 'JWZW43', 'INSTALACION BORLA ATAK CAT BACK', 'INSTALACION BORLA ATAK CAT BACK', 1899990, 'completada', '2022-01-04');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 544: OT 1694
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'FELIPE VENTURA' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'FELIPE VENTURA', '17731426-9', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'PTTW80' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'PTTW80', 'CHEVROLET', 'SILVERADO', 2021, 'S/C', 14500) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '1694', 'PTTW80', 'INSTALACION CUT OUT', 'INSTALACION CUT OUT', 269900, 'completada', '2022-01-04');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 545: OT 1695
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'ANTHONY HERRY' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'ANTHONY HERRY', '18640996-5', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'RKZD47' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'RKZD47', 'CHEVROLET', 'SILVERADO', 2022, 'S/C', 0) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '1695', 'RKZD47', 'NSTALACION CUT OUT', 'NSTALACION CUT OUT', 269900, 'completada', '2022-01-04');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 546: OT 1696
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'BRANDON DIAZ' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'BRANDON DIAZ', '12259949-3', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'FHZR99' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'FHZR99', 'AUDI', 'A4', 2013, 'S/C', 117606) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '1696', 'FHZR99', 'FABRICACION E INSTALACION INDUCCION AIRE', 'FABRICACION E INSTALACION INDUCCION AIRE', 179900, 'completada', '2022-01-04');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 547: OT 1697
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'ANGELO MATAMOROS' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'ANGELO MATAMOROS', '19570759-6', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'LYCV70' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'LYCV70', 'HAVAL', 'H6', 2020, 'S/C', 18798) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '1697', 'LYCV70', 'INSTALACION CUT OUT 2,5''''', 'INSTALACION CUT OUT 2,5''''', 259900, 'completada', '2022-01-04');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 548: OT 1698
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'IVAN CADENAS' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'IVAN CADENAS', '20431158-7', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'PDKJ27' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'PDKJ27', 'JEEP', 'GLADIATOR', 2022, 'S/C', 10) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '1698', 'PDKJ27', 'REINTALAR SILENCIADORES ORIGINALES X2 - CUT OUT 2,5''''', 'REINTALAR SILENCIADORES ORIGINALES X2 - CUT OUT 2,5''''', 299900, 'completada', '2022-01-04');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 549: OT 1699
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'PATRICIO FAJARDO' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'PATRICIO FAJARDO', '17670644-9', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'CVLL78' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'CVLL78', 'FORD', 'ECOSPORT', 2011, 'S/C', 60) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '1699', 'CVLL78', 'FABRICACION TRAMO LINEA, REEMPLAZA PARTE DAÑADA', 'FABRICACION TRAMO LINEA, REEMPLAZA PARTE DAÑADA', 70000, 'completada', '2022-01-04');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 550: OT 1700
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'LUIS SILVA ROJAS' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'LUIS SILVA ROJAS', '6381229-3', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'KJDH26' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'KJDH26', 'AUDI', 'A5', 2018, 'S/C', 0) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '1700', 'KJDH26', 'AXLE BACK GINERICO X CONFIRMAR', 'AXLE BACK GINERICO X CONFIRMAR', 200000, 'completada', '2022-01-05');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 551: OT 1701
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'CARLOS SALINA' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'CARLOS SALINA', '17189246-5', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'FRTZ47' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'FRTZ47', 'SUBARU', 'IMPREZA', 2017, 'S/C', 145) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '1701', 'FRTZ47', 'AXLE BACK  TRASERO MAGNAFLOW + COLA DE ESCAPE', 'AXLE BACK  TRASERO MAGNAFLOW + COLA DE ESCAPE', 219000, 'completada', '2022-01-05');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 552: OT 1702
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'PABLO ORTIZ' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'PABLO ORTIZ', '18096763-K', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'RKJJ38' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'RKJJ38', 'MAZDA', 'MX5', 2022, 'S/C', 46) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '1702', 'RKJJ38', 'AXLE BACK MAGNAFLOW + COLA DUAL CROMO - REPROGRAMACION STAGE 1+14HP+20NM', 'AXLE BACK MAGNAFLOW + COLA DUAL CROMO - REPROGRAMACION STAGE 1+14HP+20NM', 660000, 'completada', '2022-01-05');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 553: OT 1703
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'JUAN PABLO GAJARDO' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'JUAN PABLO GAJARDO', '12011812-9', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'PZSS64' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'PZSS64', 'FORD', 'F150', 2022, 'S/C', 7986) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '1703', 'PZSS64', 'INSTALACION CUT OUT 3'' + MODIFICACION', 'INSTALACION CUT OUT 3'' + MODIFICACION', 269900, 'completada', '2022-01-06');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 554: OT 1704
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'CARLOS HERNANDEZ' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'CARLOS HERNANDEZ', '16480531-K', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'LTYC96' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'LTYC96', 'VOLKSWAGEN', 'GTI MK 7.5', 2020, 'S/C', 20002) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '1704', 'LTYC96', 'INSTALACION DOWNPIPE ''''LO TRAE CLIENTE''''', 'INSTALACION DOWNPIPE ''''LO TRAE CLIENTE''''', 74900, 'completada', '2022-01-06');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 555: OT 1705
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'JOSE MILLAN GUTIERREZ' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'JOSE MILLAN GUTIERREZ', '19111677-1', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'KJTR36' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'KJTR36', 'FORD', 'MUSTANG', 0, 'S/C', 20458) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '1705', 'KJTR36', 'LINEA COMPLETA DOBLE 2,5''''+XPIPE CENTRAL 2,5+SILENCIADOR BORLA EXHAUST 2,5''''+COLAS CROMO 3'''' SMG', 'LINEA COMPLETA DOBLE 2,5''''+XPIPE CENTRAL 2,5+SILENCIADOR BORLA EXHAUST 2,5''''+COLAS CROMO 3'''' SMG', 1100000, 'completada', '2022-01-07');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 556: OT 1706
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'VICTOR GAETE' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'VICTOR GAETE', '13473619-4', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'LPKT33' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'LPKT33', 'CHEVROLET', 'SILVERADO', 2021, 'S/C', 36173) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '1706', 'LPKT33', 'INSTALACION SILENCIADOR ALTO FLUJO FLOWMASTER', 'INSTALACION SILENCIADOR ALTO FLUJO FLOWMASTER', 299900, 'completada', '2022-01-10');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 557: OT 1707
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'DIEGO MENOSES' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'DIEGO MENOSES', '12368704-1', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'DDGB74' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'DDGB74', 'BMW', '116', 2011, 'S/C', 98) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '1707', 'DDGB74', 'INSTALACION MAGNAFLOW TRASERO  AXLE BACK + COLA 3''''', 'INSTALACION MAGNAFLOW TRASERO  AXLE BACK + COLA 3''''', 350000, 'completada', '2022-01-10');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 558: OT 1708
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'FRANCO HANOS' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'FRANCO HANOS', '18906618-K', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'HLDH66' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'HLDH66', 'BMW', 'X6 M', 2016, 'S/C', 36563) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '1708', 'HLDH66', 'DOWNPIPE, FABRICACION E INSTALACION', 'DOWNPIPE, FABRICACION E INSTALACION', 769900, 'completada', '2022-01-11');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 559: OT 1709
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'MATIAS MONTENEGRO' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'MATIAS MONTENEGRO', '21092662-3', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'JSLB87' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'JSLB87', 'MAZDA', 'CX3', 2017, 'S/C', 0) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '1709', 'JSLB87', 'AXLE BACK VIBRANT 2,5'' + COLA 3,5'''' CROMO- REPROGRAMACION STAGE1', 'AXLE BACK VIBRANT 2,5'' + COLA 3,5'''' CROMO- REPROGRAMACION STAGE1', 849900, 'completada', '2022-01-12');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 560: OT 1710
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'DANIEL CORDOBA' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'DANIEL CORDOBA', '18668721-3', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'HJRV26' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'HJRV26', 'BMW', '120I', 2015, 'S/C', 37221) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '1710', 'HJRV26', 'CLIENTE CARGA NUEVAMENTE SOFTWARE STAGE 1', 'CLIENTE CARGA NUEVAMENTE SOFTWARE STAGE 1', 0, 'completada', '2022-01-12');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 561: OT 1711
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'FELIPE GAJARDO' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'FELIPE GAJARDO', '18467262-6', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'FPBS29' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'FPBS29', 'MERCEDES', 'A200CDI', 2013, 'S/C', 145415) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '1711', 'FPBS29', 'REPRO DE ECU STAGE 1', 'REPRO DE ECU STAGE 1', 349900, 'completada', '2022-01-12');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 562: OT 1712
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'GUILLERMO ORTIZ' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'GUILLERMO ORTIZ', '17913568-K', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'SIN-PAT' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'SIN-PAT', 'HONDA', '500Y', 2019, 'S/C', 36177) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '1712', 'SIN-PAT', 'CAMBIO DE ESCAPE CON SU PROYECT EXHAUST', 'CAMBIO DE ESCAPE CON SU PROYECT EXHAUST', 269900, 'completada', '2022-01-12');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 563: OT 1713
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'RICARDO ORELLANA' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'RICARDO ORELLANA', '17835916-9', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'JCTK36' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'JCTK36', 'AUDI', 'A3', 2017, 'S/C', 60) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '1713', 'JCTK36', 'LINEA COMPLETA+MAGNAFLOW 2,5 + COLA DUAL + CORTE PARACHOQUE', 'LINEA COMPLETA+MAGNAFLOW 2,5 + COLA DUAL + CORTE PARACHOQUE', 779900, 'completada', '2022-01-13');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 564: OT 1714
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'MATIAS ADRIAZDA' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'MATIAS ADRIAZDA', '17543547-6', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'FXDY60' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'FXDY60', 'DODGE', 'RAM 1500', 2013, 'S/C', 174999) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '1714', 'FXDY60', 'INSTALACION ALTO FLUJO MAGNAFLOW EXHAUST CENTRAL', 'INSTALACION ALTO FLUJO MAGNAFLOW EXHAUST CENTRAL', 330000, 'completada', '2022-01-14');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 565: OT 1715
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'SEBASTIAN OYARCE' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'SEBASTIAN OYARCE', '19501451-5', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'KLJL85' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'KLJL85', 'VOLKSWAGEN', 'GTI MK7', 2018, 'S/C', 28450) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '1715', 'KLJL85', 'INSTALACION MODULO CUT OUT 2,5''''', 'INSTALACION MODULO CUT OUT 2,5''''', 259900, 'completada', '2022-01-14');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 566: OT 1716
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'OSCAR ELLIOT' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'OSCAR ELLIOT', '20445154-0', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'DDKZ18' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'DDKZ18', 'TOYOTA', '4 RUNNER', 2011, 'S/C', 130) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '1716', 'DDKZ18', 'INSTALACION MAGNAFLOW', 'INSTALACION MAGNAFLOW', 299900, 'completada', '2022-01-17');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 567: OT 1717
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'JOSE TOMAS FERNANDEZ' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'JOSE TOMAS FERNANDEZ', '10545876-2', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'SIN-PAT' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'SIN-PAT', 'JEEP', 'WRANGLER', 2020, 'S/C', 15) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '1717', 'SIN-PAT', 'FABRICACION LINEA , DESDE FLANCHE HACIA ATRÁS', 'FABRICACION LINEA , DESDE FLANCHE HACIA ATRÁS', 0, 'completada', '2022-01-17');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 568: OT 1718
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'FRANCISCO SOLER' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'FRANCISCO SOLER', '17700603-3', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'LFVH18' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'LFVH18', 'BMW', '140I', 2019, 'S/C', 24000) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '1718', 'LFVH18', 'MAGNAFLOW TRASER, 1 ENTRADA Y 2 SALIDAS, CONSERVA COLAS DE ESCAPE', 'MAGNAFLOW TRASER, 1 ENTRADA Y 2 SALIDAS, CONSERVA COLAS DE ESCAPE', 459900, 'completada', '2022-01-17');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 569: OT 1719
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'HENDRICH GUERRA' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'HENDRICH GUERRA', '19135763-9', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'RPVP46' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'RPVP46', 'TOYOTA', 'YARIS GR', 2022, 'S/C', 210) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '1719', 'RPVP46', 'LINEA COMPLETA 3'''' MAGNAFLOW + COLAS 4'''' CROMO', 'LINEA COMPLETA 3'''' MAGNAFLOW + COLAS 4'''' CROMO', 679900, 'completada', '2022-01-18');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 570: OT 1720
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'GUILLE' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'GUILLE', '26203157-8', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'PL3525' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'PL3525', 'FORD', 'RANGER', 0, 'S/C', 0) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '1720', 'PL3525', 'CAMBIO COLAS ESCAPE CROMO 5'''' X2', 'CAMBIO COLAS ESCAPE CROMO 5'''' X2', 0, 'completada', '2022-01-18');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 571: OT 1721
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'EDUARDO REGINATO' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'EDUARDO REGINATO', '', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'HPXG60' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'HPXG60', 'VOLKSWAGEN', 'GOLF GTI', 2010, 'S/C', 104) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '1721', 'HPXG60', 'INSTALACION VIBRANT EXHAUST 3'''' -  INSTALACION VIBRANT 3'''' ZONA CENTRAL', 'INSTALACION VIBRANT EXHAUST 3'''' -  INSTALACION VIBRANT 3'''' ZONA CENTRAL', 739900, 'completada', '2022-01-19');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 572: OT 1722
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'HENDRICH GUERRA' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'HENDRICH GUERRA', '18015533-3', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'RPVP46' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'RPVP46', 'TOYOTA', 'YARIS GR', 2022, 'S/C', 0) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '1722', 'RPVP46', 'INSTALACION LINEA ORIGINAL - CORTE Y REINSTALACION COLA 4'''' CROMO  ''ADAPTA A LINEA ORIGINAL''', 'INSTALACION LINEA ORIGINAL - CORTE Y REINSTALACION COLA 4'''' CROMO  ''ADAPTA A LINEA ORIGINAL''', 50000, 'completada', '2022-01-19');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 573: OT 1723
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'MATIAS VON WUSSOW' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'MATIAS VON WUSSOW', '26203157-8', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'JGRG69' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'JGRG69', 'CHEVROLET', 'SILVERADO', 2017, 'S/C', 0) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '1723', 'JGRG69', 'INSTALACION CUT OUT 3''''', 'INSTALACION CUT OUT 3''''', 269900, 'completada', '2022-01-21');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 574: OT 1724
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'ALVARO RIVAS' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'ALVARO RIVAS', '', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'HLRD69' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'HLRD69', 'BMW', '420I', 2016, 'S/C', 56963) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '1724', 'HLRD69', 'FABRICACION TRAMO LINEA ''TOPE'' - CAMBIO TIRANTES ESCAPE', 'FABRICACION TRAMO LINEA ''TOPE'' - CAMBIO TIRANTES ESCAPE', 199900, 'completada', '2022-01-21');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 575: OT 1725
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'CLIENTE GENERICO' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'CLIENTE GENERICO', '13902136-3', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'GXPT98' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'GXPT98', 'AUDI', 'A3', 0, 'S/C', 0) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '1725', 'GXPT98', 'REPARACION Y  ''GARANTIA'' -INSTALACION VIBRANT', 'REPARACION Y  ''GARANTIA'' -INSTALACION VIBRANT', 269900, 'completada', '2022-01-21');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 576: OT 1726
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'MATIAS SEPULVEDA' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'MATIAS SEPULVEDA', '', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'KPLR35' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'KPLR35', 'AUDI', 'A3', 2018, 'S/C', 46563) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '1726', 'KPLR35', 'SUPRIMIR SILENCIADOR ORIGINAL CENTRAL - SUPRIMIR SILENCIADOR TRASERO + COLAS', 'SUPRIMIR SILENCIADOR ORIGINAL CENTRAL - SUPRIMIR SILENCIADOR TRASERO + COLAS', 270000, 'completada', '2022-01-21');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 577: OT 1727
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'SEBASTIAN ABATE' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'SEBASTIAN ABATE', '20055493-0', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'RBBF49' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'RBBF49', 'CHEVROLET', 'SILVERADO', 2021, 'S/C', 2605) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '1727', 'RBBF49', 'INSTALACION BORLA', 'INSTALACION BORLA', 299900, 'completada', '2022-01-24');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 578: OT 1728
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'MATIAS' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'MATIAS', '15333913-9', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'LBBX74' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'LBBX74', 'VOLKSWAGEN', 'GTI MK7', 2019, 'S/C', 32156) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '1728', 'LBBX74', 'FABRICACION DOWNPIPE - FABRICACION LINEA INOX 3'' CON VIBRANT EXHAUST', 'FABRICACION DOWNPIPE - FABRICACION LINEA INOX 3'' CON VIBRANT EXHAUST', 1039800, 'completada', '2022-01-24');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 579: OT 1729
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'JUAN PABLO VELASQUEZ' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'JUAN PABLO VELASQUEZ', '19209898-K', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'TP4380' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'TP4380', 'NISSAN', 'PATROL', 2000, 'S/C', 218018) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '1729', 'TP4380', 'LINEA 3'' INOX ALTO FLUJO BORLA EXHAUST - RESONADOR INOX 3''''', 'LINEA 3'' INOX ALTO FLUJO BORLA EXHAUST - RESONADOR INOX 3''''', 659700, 'completada', '2022-01-24');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 580: OT 1730
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'MATIAS SEPULVEDA' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'MATIAS SEPULVEDA', '7037300-9', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'KPLR35' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'KPLR35', 'AUDI', 'A3', 2018, 'S/C', 0) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '1730', 'KPLR35', 'INSTALACION SILENCIADOR CENTRAL', 'INSTALACION SILENCIADOR CENTRAL', 79900, 'completada', '2022-01-25');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 581: OT 1731
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'YAIR MESZAROS' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'YAIR MESZAROS', '20055493-0', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'JZGG83' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'JZGG83', 'FORD', 'FOCUS', 2018, 'S/C', 20156) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '1731', 'JZGG83', 'FABRICACION E INSTALACION DOWNPIPE', 'FABRICACION E INSTALACION DOWNPIPE', 399900, 'completada', '2022-01-26');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 582: OT 1732
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'GUNNAR DOBSON' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'GUNNAR DOBSON', '20938909-6', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'LRYW19' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'LRYW19', 'MERCEDES BENZ', 'A250', 2020, 'S/C', 22000) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '1732', 'LRYW19', 'LINEA COMPLETA CON MAGNAFLOW CENTRAL ''''SIN COLA''''', 'LINEA COMPLETA CON MAGNAFLOW CENTRAL ''''SIN COLA''''', 629900, 'completada', '2022-01-26');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 583: OT 1733
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'ANDRES CASTILLO' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'ANDRES CASTILLO', '19038274-5', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'JJZW19' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'JJZW19', 'CHEVROLET', 'SILVERADO', 2017, 'S/C', 108035) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '1733', 'JJZW19', 'INSTALACION CUT OUT 3''''- FABRICACION TRAMO INOX', 'INSTALACION CUT OUT 3''''- FABRICACION TRAMO INOX', 339900, 'completada', '2022-01-27');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 584: OT 1734
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'EDGARDO NOVOA' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'EDGARDO NOVOA', '21511104-0', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'RJRV34' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'RJRV34', 'CHEVROLET', 'SILVERADO', 2022, 'S/C', 5500) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '1734', 'RJRV34', 'INSTALACION CUT OUT', 'INSTALACION CUT OUT', 279900, 'completada', '2022-01-27');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 585: OT 1735
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'MATIAS CANDIA' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'MATIAS CANDIA', '12385113-7', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'LVVX74' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'LVVX74', 'VOLKSWAGEN', 'OPF GTI', 2019, 'S/C', 0) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '1735', 'LVVX74', 'INSTALACION SILENCIADOR ORIGINAL CENTRAL', 'INSTALACION SILENCIADOR ORIGINAL CENTRAL', 79900, 'completada', '2022-01-27');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 586: OT 1736
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'JOSE FUENTES' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'JOSE FUENTES', '19209898-K', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'RCPK17' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'RCPK17', 'MINI', 'COOPER S', 2021, 'S/C', 15181) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '1736', 'RCPK17', 'AXLE BACK MAGNAFLOW 1 ENTRADA 2 SALIDAS', 'AXLE BACK MAGNAFLOW 1 ENTRADA 2 SALIDAS', 380000, 'completada', '2022-01-31');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 587: OT 1737
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'FRANCISCO GUTIERREZ' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'FRANCISCO GUTIERREZ', '8127548-3', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'SIN-PAT' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'SIN-PAT', 'SUBARU', 'STI', 2022, 'S/C', 202) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '1737', 'SIN-PAT', 'LINEA COMPLETA INOX 3'''' + ALTO FLUJO MAGNAFLOW 3'''' C/ TIPS 3,5'''' DUAL', 'LINEA COMPLETA INOX 3'''' + ALTO FLUJO MAGNAFLOW 3'''' C/ TIPS 3,5'''' DUAL', 829900, 'completada', '2022-01-31');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 588: OT 1738
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'SERGIO LOPEZ' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'SERGIO LOPEZ', '18755456-K', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'LTRP43' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'LTRP43', 'MAZDA', '3', 2020, 'S/C', 49) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '1738', 'LTRP43', 'AXLE BACK FREE + COLAS NEGRAS', 'AXLE BACK FREE + COLAS NEGRAS', 319900, 'completada', '2022-01-31');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 589: OT 1739
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'LUIS BARRIGA' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'LUIS BARRIGA', '16747404-7', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'CKXK55' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'CKXK55', 'MAZDA', '3', 2010, 'S/C', 228121) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '1739', 'CKXK55', 'CAMBIO DE SILENCIADOR CENTRAL POR ALTO FLUJO DESMONTABLE CON 6 AVILLOS Y CLAMP', 'CAMBIO DE SILENCIADOR CENTRAL POR ALTO FLUJO DESMONTABLE CON 6 AVILLOS Y CLAMP', 239900, 'completada', '2022-02-01');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 590: OT 1740
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'ALEJANDRO MUÑOZ' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'ALEJANDRO MUÑOZ', '13336676-8', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'FSKC96' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'FSKC96', 'AUDI', 'A6', 2013, 'S/C', 136540) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '1740', 'FSKC96', 'FABRICACION DE DOWNPIPE', 'FABRICACION DE DOWNPIPE', 399900, 'completada', '2022-02-01');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 591: OT 1741
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'CLIENTE GENERICO' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'CLIENTE GENERICO', '', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'SIN-PAT' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'SIN-PAT', 'S/M', 'S/M', 0, 'S/C', 0) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '1741', 'SIN-PAT', 'Carga masiva', 'Carga masiva', 0, 'completada', '2026-01-01');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 592: OT 1742
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'THIAGO KUNST' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'THIAGO KUNST', '', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'FJJP33' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'FJJP33', 'AUDI', 'A3', 2013, 'S/C', 0) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '1742', 'FJJP33', 'INSTALACION SILENCIADOR VIBRANT ULTRA QUIET 2,5'''' (LO TRAE CLIENTE) PLACO DOWNPIPE', 'INSTALACION SILENCIADOR VIBRANT ULTRA QUIET 2,5'''' (LO TRAE CLIENTE) PLACO DOWNPIPE', 70000, 'completada', '2022-02-02');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 593: OT 1743
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'RODRIGO BARROS' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'RODRIGO BARROS', '27137329-5', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'LCZR98' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'LCZR98', 'BMW', '120I', 2019, 'S/C', 20052) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '1743', 'LCZR98', 'MEDIA LINEA VIBRANT CON DOBLE SALIDA CON INSTALACION DIFUSOR', 'MEDIA LINEA VIBRANT CON DOBLE SALIDA CON INSTALACION DIFUSOR', 520000, 'completada', '2022-02-03');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 594: OT 1744
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'JOSE SOLDIVOR' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'JOSE SOLDIVOR', '10345083-7', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'JKVG46' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'JKVG46', 'MERCEDES', 'C43', 2017, 'S/C', 38684) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '1744', 'JKVG46', 'SUPRIMIR SILENCIADOR  CON ''Y'' EN 2,5'''' CON UNION EN 3''''', 'SUPRIMIR SILENCIADOR  CON ''Y'' EN 2,5'''' CON UNION EN 3''''', 150000, 'completada', '2022-02-03');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 595: OT 1745
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'JOSE VALDES' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'JOSE VALDES', '17699199-2', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'SIN-PAT' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'SIN-PAT', 'BMW', '24 E89', 2011, 'S/C', 0) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '1745', 'SIN-PAT', 'INSTALACION DE MUFFLER TRASERO C/ MODIFICACION DE PARACHOQUE - ADICIONAL ANILLOS PARA FIJAR MALLA PARACHOQUE', 'INSTALACION DE MUFFLER TRASERO C/ MODIFICACION DE PARACHOQUE - ADICIONAL ANILLOS PARA FIJAR MALLA PARACHOQUE', 300000, 'completada', '2022-02-03');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 596: OT 1746
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'ROBERTO OBREQUE' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'ROBERTO OBREQUE', '12631523-6', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'SIN-PAT' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'SIN-PAT', 'REGAL RAPTOR', 'DAYTONA 350', 2021, 'S/C', 0) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '1746', 'SIN-PAT', 'ELIMINAR MUFFLER Y REPLICAR EN INOX CON EMPAQUES DEJA DIRECTO', 'ELIMINAR MUFFLER Y REPLICAR EN INOX CON EMPAQUES DEJA DIRECTO', 200000, 'completada', '2022-02-04');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 597: OT 1747
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'SERGIO FLORES' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'SERGIO FLORES', '11796416-7', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'LTRP43' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'LTRP43', 'MAZDA', '3', 2020, 'S/C', 0) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '1747', 'LTRP43', 'FABRICACION DE ANTIDROME, PIEZA INOX 2''''', 'FABRICACION DE ANTIDROME, PIEZA INOX 2''''', 0, 'completada', '2022-02-04');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 598: OT 1748
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'MATIAS MONTENEGRO' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'MATIAS MONTENEGRO', '16747404-7', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'JSLB87' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'JSLB87', 'MAZDA', 'CX3', 2017, 'S/C', 55) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '1748', 'JSLB87', 'NLINEA CON CLAMP 2,5'''' INOX - SE CAMBIO CLAMP', 'NLINEA CON CLAMP 2,5'''' INOX - SE CAMBIO CLAMP', 279900, 'completada', '2022-02-04');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 599: OT 1749
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'MATIAS CASTILLO' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'MATIAS CASTILLO', '18668721-3', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'PGRX54' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'PGRX54', 'VOLKSWAGEN', 'GOLF TSI', 2020, 'S/C', 0) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '1749', 'PGRX54', 'RESONADOR CENTRAL DELETE', 'RESONADOR CENTRAL DELETE', 70000, 'completada', '2022-02-04');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 600: OT 1750
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'YIAN FRANCO PATUELLI' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'YIAN FRANCO PATUELLI', '20257708-3', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'LTBS85' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'LTBS85', 'SUBARU', 'WRX', 2020, 'S/C', 24182) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '1750', 'LTBS85', 'LINEA COMPLETA INOX 3'''' + SILENCIADOR ALTO FLUJO MAGNAFLOW + 2 COLAS DUAL 3,5''''', 'LINEA COMPLETA INOX 3'''' + SILENCIADOR ALTO FLUJO MAGNAFLOW + 2 COLAS DUAL 3,5''''', 829900, 'completada', '2022-02-07');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    RAISE NOTICE 'Procesados 600 registros...';
    -- Fila 601: OT 1751
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'PATRICIO HIDALGO' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'PATRICIO HIDALGO', '80463100-3', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'RGSH90' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'RGSH90', 'SUZUKI', 'SWIFT', 2022, 'S/C', 13738) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '1751', 'RGSH90', 'DOWNPIPE INOX 2,5''''', 'DOWNPIPE INOX 2,5''''', 319900, 'completada', '2022-02-07');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 602: OT 1752
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'CARLOS LOYOLA' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'CARLOS LOYOLA', '13340580-1', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'JHCR74' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'JHCR74', 'CHEVROLET', 'SILVERADO', 2017, 'S/C', 65002) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '1752', 'JHCR74', 'INSTALACION CUT OUT 3'''' - INSTALACION FILTRO ALTO FLUJO BMC - SPRINTBOOSTER V3', 'INSTALACION CUT OUT 3'''' - INSTALACION FILTRO ALTO FLUJO BMC - SPRINTBOOSTER V3', 639700, 'completada', '2022-02-07');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 603: OT 1753
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'DIEGO' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'DIEGO', '21077147-6', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'LJHJ32' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'LJHJ32', 'SUBARU', 'WRX', 2019, 'S/C', 18731) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '1753', 'LJHJ32', 'LINEA INOX 3'''' + ALTO FLUJO MAGNAFLOW 3'''' CON COLAS INOX DUAL 3,5''''', 'LINEA INOX 3'''' + ALTO FLUJO MAGNAFLOW 3'''' CON COLAS INOX DUAL 3,5''''', 829900, 'completada', '2022-02-08');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 604: OT 1754
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'JAIME' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'JAIME', '', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'PFYD12' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'PFYD12', 'BMW', '218I', 0, 'S/C', 0) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '1754', 'PFYD12', 'REINSTALACION LINEA ORIGINAL', 'REINSTALACION LINEA ORIGINAL', 69900, 'completada', '2022-02-08');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 605: OT 1755
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'NICOLAS NUÑEZ' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'NICOLAS NUÑEZ', '17458697-7', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'DE1020' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'DE1020', 'BMW', '318', 1988, 'S/C', 0) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '1755', 'DE1020', 'LINEA COMPLETA INOX 2'''' Y CONEXCION 2,5'' CON RESONADOR Y ALTO FLUJO VIBRANT EXHAUST C/COLAS DUAL 3''''', 'LINEA COMPLETA INOX 2'''' Y CONEXCION 2,5'' CON RESONADOR Y ALTO FLUJO VIBRANT EXHAUST C/COLAS DUAL 3''''', 799900, 'completada', '2022-02-09');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 606: OT 1756
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'MATIAS VALBONTIN' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'MATIAS VALBONTIN', '18722980-4', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'DLWG61' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'DLWG61', 'AUDI', 'A4', 2012, 'S/C', 127926) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '1756', 'DLWG61', 'DOWNPIPE INOX 3'''' - LINEA INOX + ALTO FLUJO VIBRANT - REPRO DE ECU STAGE 2 + COLA INOX 3,5''''', 'DOWNPIPE INOX 3'''' - LINEA INOX + ALTO FLUJO VIBRANT - REPRO DE ECU STAGE 2 + COLA INOX 3,5''''', 1267710, 'completada', '2022-02-10');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 607: OT 1757
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'FRANCISCO FUENTES HERRERAS' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'FRANCISCO FUENTES HERRERAS', '18881792-0', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'TL8985' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'TL8985', 'MITSUBISHI', 'LANCER', 0, 'S/C', 0) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '1757', 'TL8985', 'LINEA COMPLETA INOX 2'''' + SILENCIADOR ALTO FLUJO BORLA EXHAUST (SE  MONTAN COLAS DOBLES 1 PRECIO DE COLA SINGLE)', 'LINEA COMPLETA INOX 2'''' + SILENCIADOR ALTO FLUJO BORLA EXHAUST (SE  MONTAN COLAS DOBLES 1 PRECIO DE COLA SINGLE)', 519900, 'completada', '2022-02-11');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 608: OT 1758
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'JUAN JOSE FIGUEROA' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'JUAN JOSE FIGUEROA', '19519233-2', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'LLGF90' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'LLGF90', 'MITSUBISHI', 'L200', 2020, 'S/C', 93665) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '1758', 'LLGF90', 'DOWNPIPE INOX - LINEA INOX - REPRO ST2 DPF OFF EGR OFF', 'DOWNPIPE INOX - LINEA INOX - REPRO ST2 DPF OFF EGR OFF', 1263800, 'completada', '2022-02-16');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 609: OT 1759
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'MARTIN ANTUÑEZ' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'MARTIN ANTUÑEZ', '17082807-0', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'SIN-PAT' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'SIN-PAT', 'CHEVROLET', 'SILVERADO', 2022, 'S/C', 0) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '1759', 'SIN-PAT', 'INSTALACION ALTO FLUJO BORLA', 'INSTALACION ALTO FLUJO BORLA', 299900, 'completada', '2022-02-16');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 610: OT 1760
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'MIGUEL CARRASCO GONZALEZ' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'MIGUEL CARRASCO GONZALEZ', '16777469-5', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'KHJR32' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'KHJR32', 'FIAT', 'FULLBACK', 2018, 'S/C', 156921) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '1760', 'KHJR32', 'VACIADO DPF + DECAT - REPRO STZ C/DPF Y EGR', 'VACIADO DPF + DECAT - REPRO STZ C/DPF Y EGR', 639800, 'completada', '2022-02-17');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 611: OT 1761
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'MATIAS FERNANDEZ' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'MATIAS FERNANDEZ', '19071960-K', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'GLYB87' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'GLYB87', 'BMW', '335I', 2014, 'S/C', 104155) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '1761', 'GLYB87', 'SUPRIMIR RESONADOR CENTRAL - AXLE BACK FREE M PERFORMANCE', 'SUPRIMIR RESONADOR CENTRAL - AXLE BACK FREE M PERFORMANCE', 415000, 'completada', '2022-02-18');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 612: OT 1762
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'CRISTIAN LEIVA' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'CRISTIAN LEIVA', '18973241-4', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'DXBF78' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'DXBF78', 'MITSUBISHI', 'LANCER', 2012, 'S/C', 147242) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '1762', 'DXBF78', 'AXLE BACK FREE C/DOBLE SALIDA Y MODIFICACION DE PARACHOQUE + 2 COLAS 4'''' CROMO CADA UNA', 'AXLE BACK FREE C/DOBLE SALIDA Y MODIFICACION DE PARACHOQUE + 2 COLAS 4'''' CROMO CADA UNA', 369900, 'completada', '2022-02-18');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 613: OT 1763
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'LEONIDAS VELA' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'LEONIDAS VELA', '24976955-K', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'RDSV70' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'RDSV70', 'KIA', 'RIOS', 2022, 'S/C', 5538) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '1763', 'RDSV70', 'AXLE BACK CON 2 BALAS, MANTIENE COLAS', 'AXLE BACK CON 2 BALAS, MANTIENE COLAS', 410000, 'completada', '2022-02-21');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 614: OT 1764
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'STEWART' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'STEWART', '20939627-0', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'HTYV93' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'HTYV93', 'CHEVROLET', 'CAMARO SS', 2017, 'S/C', 17499) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '1764', 'HTYV93', 'MONTAJE MULTIPLE - LINEA CON XPIPE + AXLE BACK (TRAE CLIENTE) - SPRINTBOOSTER', 'MONTAJE MULTIPLE - LINEA CON XPIPE + AXLE BACK (TRAE CLIENTE) - SPRINTBOOSTER', 1109800, 'completada', '2022-02-21');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 615: OT 1765
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'ITALO HUERTA' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'ITALO HUERTA', '19568922-9', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'FPLG41' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'FPLG41', 'MERCEDES', 'C250', 2013, 'S/C', 57220) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '1765', 'FPLG41', 'DOWNPIPE - LINEA COMPLETA - REPRO STAGE 2', 'DOWNPIPE - LINEA COMPLETA - REPRO STAGE 2', 1373900, 'completada', '2022-02-21');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 616: OT 1766
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'EDUADO AGUIRRE' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'EDUADO AGUIRRE', '18975756-5', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'LBSD31' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'LBSD31', 'BMW', '120I', 2019, 'S/C', 24) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '1766', 'LBSD31', 'MEDIA LINEA C/ALTO FLUJO VIBRANT EXHAUST + 2 COLAS NEGRAS - INSTALACION DE DIFUSOR', 'MEDIA LINEA C/ALTO FLUJO VIBRANT EXHAUST + 2 COLAS NEGRAS - INSTALACION DE DIFUSOR', 509900, 'completada', '2022-02-23');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 617: OT 1767
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'ANGELO IBERTI' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'ANGELO IBERTI', '17517883-K', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'GFLW82' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'GFLW82', 'OPEL', 'OPF', 2014, 'S/C', 99852) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '1767', 'GFLW82', 'LINEA COMPLETA INOX 2,5'''' + SILENCIADOR ALTO FLUJO MAGNAFLOW + COLA CROMO 4''''', 'LINEA COMPLETA INOX 2,5'''' + SILENCIADOR ALTO FLUJO MAGNAFLOW + COLA CROMO 4''''', 599900, 'completada', '2022-02-24');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 618: OT 1768
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'CARLOS' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'CARLOS', '26024451-5', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'XF7438' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'XF7438', 'MAZDA', '323', 2004, 'S/C', 141387) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '1768', 'XF7438', 'REPARACION MILTIPLE ESCAPE', 'REPARACION MILTIPLE ESCAPE', 0, 'completada', '2022-02-28');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 619: OT 1769
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'CRISTIAN ANACONA' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'CRISTIAN ANACONA', '13710526-6', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'DHFY88' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'DHFY88', 'PEUGEOT', '308 CC', 2011, 'S/C', 0) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '1769', 'DHFY88', 'AXLE BACK FREE SIN COLA VISIBLE +ROYAL+ALL-IN+OLYMPOS', 'AXLE BACK FREE SIN COLA VISIBLE +ROYAL+ALL-IN+OLYMPOS', 180770, 'completada', '2022-03-01');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 620: OT 1770
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'ITALO HUERTA' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'ITALO HUERTA', '19568922-9', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'FPLG41' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'FPLG41', 'MERCEDES', 'C250', 2013, 'S/C', 0) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '1770', 'FPLG41', 'CHEQUEO LINEA - ANTIDRONE - INSTALACION RESONADOR ALTO FLUJO CENTRAL - INSTALAR SPRINTBOOSTER', 'CHEQUEO LINEA - ANTIDRONE - INSTALACION RESONADOR ALTO FLUJO CENTRAL - INSTALAR SPRINTBOOSTER', 219800, 'completada', '2022-03-03');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 621: OT 1771
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'GONZALO RIFFO' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'GONZALO RIFFO', '13683978-0', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'CXCB66' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'CXCB66', 'FORD', 'MUSTANG', 2010, 'S/C', 44624) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '1771', 'CXCB66', 'LINEA COMPLETA INOX 2,5'''' C/XPIPE CENTRAL, LINEA DOBLE CON CINTA TERMICA EN ZONA COMBUSTIBLE -SILENCIADORES ALTO FLUJO MAGNAFLOW EXHAUST COLA 4'' BLACK', 'LINEA COMPLETA INOX 2,5'''' C/XPIPE CENTRAL, LINEA DOBLE CON CINTA TERMICA EN ZONA COMBUSTIBLE -SILENCIADORES ALTO FLUJO MAGNAFLOW EXHAUST COLA 4'' BLACK', 1040000, 'completada', '2022-03-03');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 622: OT 1772
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'JAVIER UBILLA' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'JAVIER UBILLA', '16015333-4', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'LFRD31' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'LFRD31', 'AUDI', 'A3', 2019, 'S/C', 51724) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '1772', 'LFRD31', 'VUELVE A STOCK INSTALACION DOWNPIPE', 'VUELVE A STOCK INSTALACION DOWNPIPE', 0, 'completada', '2022-03-04');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 623: OT 1773
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'MATEO GALLARDO' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'MATEO GALLARDO', '21225090-2', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'JHCL82' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'JHCL82', 'FORD', 'F150', 2017, 'S/C', 83) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '1773', 'JHCL82', 'INSTALACION SILENCIADOR MAGNAFLOW', 'INSTALACION SILENCIADOR MAGNAFLOW', 299900, 'completada', '2022-03-04');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 624: OT 1774
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'JOSE HIDALGO' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'JOSE HIDALGO', '19931436-K', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'GD5981' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'GD5981', 'TOYOTA', 'COROLLA', 1990, 'S/C', 318119) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '1774', 'GD5981', 'LINEA COMPLETA INOX + ALTO FLUJO VIBRANT EXHAUST A EVALUACION Y CONFIRMACION CON FRANCISCO', 'LINEA COMPLETA INOX + ALTO FLUJO VIBRANT EXHAUST A EVALUACION Y CONFIRMACION CON FRANCISCO', 529900, 'completada', '2022-03-07');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 625: OT 1775
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'SEBASTIAN DIAZ' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'SEBASTIAN DIAZ', '19598924-9', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'JHWP53' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'JHWP53', 'VOLKSWAGEN', 'SCIROCCO', 2017, 'S/C', 71800) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '1775', 'JHWP53', 'DOWNPIPE - LINEA + RESONADOR CENTRAL + ALTO FLUJO + COLA DUAL, COLA DUAL 3,5''''', 'DOWNPIPE - LINEA + RESONADOR CENTRAL + ALTO FLUJO + COLA DUAL, COLA DUAL 3,5''''', 1169800, 'completada', '2022-03-07');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 626: OT 1776
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'ALVARO ROBLEDO' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'ALVARO ROBLEDO', '18224631-K', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'LF5153' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'LF5153', 'HONDA', 'INTEGRA', 1994, 'S/C', 250) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '1776', 'LF5153', 'BORLA + INSTALACION - AXLE BACK INOX 2'''' C/COLAS DUAL INOX 3''''', 'BORLA + INSTALACION - AXLE BACK INOX 2'''' C/COLAS DUAL INOX 3''''', 199800, 'completada', '2022-03-08');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 627: OT 1777
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'ANTONIO ESCALANTE' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'ANTONIO ESCALANTE', '8042199-0', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'HXKC63' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'HXKC63', 'VOLVO', 'XC 60', 2016, 'S/C', 40042) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '1777', 'HXKC63', 'DESINSTALACION CUT OUT - SUPRIMIR AUTODRONE', 'DESINSTALACION CUT OUT - SUPRIMIR AUTODRONE', 90000, 'completada', '2022-03-10');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 628: OT 1778
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'JUAN EGUIA' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'JUAN EGUIA', '9703311-0', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'RTJR35' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'RTJR35', 'CHEVROLET', 'SILVERADO', 2022, 'S/C', 113) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '1778', 'RTJR35', 'INSTALACION CUT OUT 3'''' TRAE CLIENTE', 'INSTALACION CUT OUT 3'''' TRAE CLIENTE', 100000, 'completada', '2022-03-11');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 629: OT 1779
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'ESTEBAN VILLEGAS' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'ESTEBAN VILLEGAS', '20592332-2', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'LWFF16' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'LWFF16', 'AUDI', 'A3', 2020, 'S/C', 57999) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '1779', 'LWFF16', 'LINEA COMPLETA + ALTO FLUJO MAGNAFLOW + COLAS DOBLES CROMO 3,5''''', 'LINEA COMPLETA + ALTO FLUJO MAGNAFLOW + COLAS DOBLES CROMO 3,5''''', 639900, 'completada', '2022-03-14');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 630: OT 1780
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'JOSE IGNACIO VEGA' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'JOSE IGNACIO VEGA', '18754488-2', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'HGWS17' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'HGWS17', 'AUDI', 'A3', 2015, 'S/C', 68444) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '1780', 'HGWS17', 'DOWNPIPE - LINEA INOX + SILENCIADOR ALTO FLUJO VIBRANT + COLAS DOBLES - REPRO', 'DOWNPIPE - LINEA INOX + SILENCIADOR ALTO FLUJO VIBRANT + COLAS DOBLES - REPRO', 1294800, 'completada', '2022-03-16');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 631: OT 1781
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'RODOLFO' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'RODOLFO', '16745382-1', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'SIN-PAT' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'SIN-PAT', 'APRILLA', 'SHIVER', 2015, 'S/C', 0) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '1781', 'SIN-PAT', 'INSTALACION CATALITICO', 'INSTALACION CATALITICO', 200000, 'completada', '2022-03-16');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 632: OT 1782
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'MIGUEL MORENO' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'MIGUEL MORENO', '25623244-8', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'WX2422' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'WX2422', 'MINI', 'COOPER', 2006, 'S/C', 0) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '1782', 'WX2422', 'VUELVE A STOCK ''CLIENTE TRAE SOLENCIADORES', 'VUELVE A STOCK ''CLIENTE TRAE SOLENCIADORES', 69900, 'completada', '2022-03-17');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 633: OT 1783
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'LUIS MIGUEL VIÑAS' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'LUIS MIGUEL VIÑAS', '', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'KXJH41' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'KXJH41', 'FORD', 'MUSTANG', 0, 'S/C', 0) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '1783', 'KXJH41', 'INSTALACION VALVULA CUT OUT - INSTALACION ALTO FLUJO 3'''' CENTRAL', 'INSTALACION VALVULA CUT OUT - INSTALACION ALTO FLUJO 3'''' CENTRAL', 0, 'completada', '2022-03-17');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 634: OT 1784
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'EDUARDO' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'EDUARDO', '8989383-6', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'CXKR63' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'CXKR63', 'MINI', 'COOPER', 2011, 'S/C', 121211) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '1784', 'CXKR63', 'CAMBIO DE COLA BLACK 4''''', 'CAMBIO DE COLA BLACK 4''''', 240000, 'completada', '2022-03-18');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 635: OT 1785
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'ALEXANDRE FARIAS' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'ALEXANDRE FARIAS', '16606667-0', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'KKDK62' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'KKDK62', 'CHEVROLET', 'SILVERADO', 2018, 'S/C', 75550) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '1785', 'KKDK62', 'TRAMO LINEA DESDE FLANCHE HASTA SILENCIADOR ALTO FLUJO', 'TRAMO LINEA DESDE FLANCHE HASTA SILENCIADOR ALTO FLUJO', 200000, 'completada', '2022-03-18');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 636: OT 1786
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'HENRY MA' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'HENRY MA', '21407234-3', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'KWCT69' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'KWCT69', 'BMW', 'M5', 2019, 'S/C', 18468) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '1786', 'KWCT69', 'DOWNPIPE X2 INOX - SE MANTIENE ULTIMA PARTE DE DOWNPIPE PARA CONEXIÓN LINEA', 'DOWNPIPE X2 INOX - SE MANTIENE ULTIMA PARTE DE DOWNPIPE PARA CONEXIÓN LINEA', 849900, 'completada', '2022-03-21');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 637: OT 1787
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'JONATHAN' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'JONATHAN', '19072172-8', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'DJBV48' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'DJBV48', 'RANGE ROVER', 'ROVER', 2012, 'S/C', 96) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '1787', 'DJBV48', 'INSTALACION LINEA ORIGINAL ''TRAE CLIENTE'' - MOFILACION CONEXIÓN CENTRAL', 'INSTALACION LINEA ORIGINAL ''TRAE CLIENTE'' - MOFILACION CONEXIÓN CENTRAL', 150000, 'completada', '2022-03-21');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 638: OT 1788
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'CRISTIAN ANACONA' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'CRISTIAN ANACONA', '13710526-8', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'DHFY88' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'DHFY88', 'PEUGEOT', '308CC', 2011, 'S/C', 71597) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '1788', 'DHFY88', 'INSTALACION SPRINTBOOSTER', 'INSTALACION SPRINTBOOSTER', 259900, 'completada', '2022-03-21');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 639: OT 1789
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'HANS DEMIERRE' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'HANS DEMIERRE', '17676736-7', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'FGCL10' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'FGCL10', 'BMW', '335I', 0, 'S/C', 0) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '1789', 'FGCL10', 'INSTALACION COLAS BLACK 4''''', 'INSTALACION COLAS BLACK 4''''', 120000, 'completada', '2022-03-22');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 640: OT 1790
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'FELIPE CORTES' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'FELIPE CORTES', '16503285-3', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'JBTS31' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'JBTS31', 'MERCEDES', 'CLA', 2017, 'S/C', 50) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '1790', 'JBTS31', 'LINEA COMPLETA INOX+ SILENCIADOR VIBRANT EXHAUST 3'''' + COLA DUAL 3,5'''' (PINTAR NEGRA)', 'LINEA COMPLETA INOX+ SILENCIADOR VIBRANT EXHAUST 3'''' + COLA DUAL 3,5'''' (PINTAR NEGRA)', 764900, 'completada', '2022-03-23');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 641: OT 1791
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'FELIPE RAMIREZ' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'FELIPE RAMIREZ', '18445113-7', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'JKYD77' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'JKYD77', 'AUDI', 'TT', 2017, 'S/C', 25782) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '1791', 'JKYD77', 'LINEA COMPLETA INOX + SILENCIADOR ALTO FLUJO VIBRANT PERFORMANCE + 2 COLAS 4'''' NEGRAS -CUT OUT INSTALADO - FILTRO BMC', 'LINEA COMPLETA INOX + SILENCIADOR ALTO FLUJO VIBRANT PERFORMANCE + 2 COLAS 4'''' NEGRAS -CUT OUT INSTALADO - FILTRO BMC', 909800, 'completada', '2022-03-23');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 642: OT 1792
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'IÑAKI AZCONA' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'IÑAKI AZCONA', '19438741-5', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'GGPV92' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'GGPV92', 'MERCEDES BENZ', 'SLK 350', 2014, 'S/C', 77) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '1792', 'GGPV92', 'AXLE BACK VIBRANT EXHAUST MANTIENE COLA DE ESCAPE', 'AXLE BACK VIBRANT EXHAUST MANTIENE COLA DE ESCAPE', 520000, 'completada', '2022-03-24');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 643: OT 1793
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'CRISTIAN ANACONA' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'CRISTIAN ANACONA', '13710526-8', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'DHFY88' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'DHFY88', 'PEUGEOT', '308CC', 2011, 'S/C', 0) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '1793', 'DHFY88', 'REPRO STAGE 1 - INSTALACION BORLA EXHAUST 2''''', 'REPRO STAGE 1 - INSTALACION BORLA EXHAUST 2''''', 629800, 'completada', '2022-03-25');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 644: OT 1794
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'ALAN JIMENEZ' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'ALAN JIMENEZ', '16490135-1', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'RBDJ47' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'RBDJ47', 'MAZDA', 'NAZDA 3', 2021, 'S/C', 15) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '1794', 'RBDJ47', 'CAMBIO DE COLAS A 4'''' ''ORIGINALES'' CROMO', 'CAMBIO DE COLAS A 4'''' ''ORIGINALES'' CROMO', 200000, 'completada', '2022-03-25');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 645: OT 1795
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'CLIENTE GENERICO' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'CLIENTE GENERICO', '', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'SIN-PAT' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'SIN-PAT', 'S/M', 'S/M', 0, 'S/C', 0) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '1795', 'SIN-PAT', 'Carga masiva', 'Carga masiva', 0, 'completada', '2026-01-01');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 646: OT 1796
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'FRANCISCO VIAL' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'FRANCISCO VIAL', '5606665-9', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'DN1319' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'DN1319', 'TOYOTA', 'LAUD CRUISER', 1994, 'S/C', 0) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '1796', 'DN1319', 'REPARACION TOPE EN LINEA CON CAJA CAMBIO', 'REPARACION TOPE EN LINEA CON CAJA CAMBIO', 90000, 'completada', '2022-03-28');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 647: OT 1797
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'ALEJANDRO ZAUSCHKEVICH' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'ALEJANDRO ZAUSCHKEVICH', '18396995-1', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'JVXC67' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'JVXC67', 'BMW', '120I', 2017, 'S/C', 59050) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '1797', 'JVXC67', 'FABRICACION MEDIA LINEA VIBRANT + SALIDA DOBLE CON COLAS CROMO 4'''' - INSTALACION DIFUSOR TRASERO ''TRAE CLIENTE''', 'FABRICACION MEDIA LINEA VIBRANT + SALIDA DOBLE CON COLAS CROMO 4'''' - INSTALACION DIFUSOR TRASERO ''TRAE CLIENTE''', 569800, 'completada', '2022-03-30');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 648: OT 1798
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'JOSE IGNACIO LEGUINA' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'JOSE IGNACIO LEGUINA', '18019098-1', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'LHCV42' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'LHCV42', 'TOYOTA', 'RAV 4', 2019, 'S/C', 0) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '1798', 'LHCV42', 'INSTALACION COLA BLACK 4''''', 'INSTALACION COLA BLACK 4''''', 200000, 'completada', '2022-03-30');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 649: OT 1799
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'CRISTIAN CARVAJAL' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'CRISTIAN CARVAJAL', '17827962-9', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'LSLG37' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'LSLG37', 'BMW', '240I', 2020, 'S/C', 33954) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '1799', 'LSLG37', 'DOWNPIPE - MEDIA LINEA + MAGNAFLOW', 'DOWNPIPE - MEDIA LINEA + MAGNAFLOW', 959800, 'completada', '2022-04-04');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 650: OT 1800
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'BASTIAN LEON' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'BASTIAN LEON', '17405879-2', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'PGSG47' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'PGSG47', 'BMW', '240I', 2020, 'S/C', 0) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '1800', 'PGSG47', 'LINEA COMPLETA 3'''' + VIBRANT EXHAUST 3'''' + COLAS DUAL 4'''' BLACK - INSTALACION LIP FRONTAL Y MALETA', 'LINEA COMPLETA 3'''' + VIBRANT EXHAUST 3'''' + COLAS DUAL 4'''' BLACK - INSTALACION LIP FRONTAL Y MALETA', 654900, 'completada', '2022-04-05');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 651: OT 1801
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'FELIPE LLEDEO' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'FELIPE LLEDEO', '18720048-2', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'FGBB15' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'FGBB15', 'PORSCHE', 'CAYENNE', 2013, 'S/C', 0) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '1801', 'FGBB15', 'DOWNPIPE INSTALADA - LINEA INOX - SILENCIADOR TRASERO', 'DOWNPIPE INSTALADA - LINEA INOX - SILENCIADOR TRASERO', 2049800, 'completada', '2022-04-05');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 652: OT 1802
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'JOSUE LUENGO' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'JOSUE LUENGO', '18444598-0', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'RHWG66' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'RHWG66', 'SEAT', 'LEON', 2022, 'S/C', 16757) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '1802', 'RHWG66', 'AXLE BACK FREE C/MODIFICACION DE PARACHOQUE + 2 COLAS DUAL 3,5'''' INOX, SOPORTES NUEVOS', 'AXLE BACK FREE C/MODIFICACION DE PARACHOQUE + 2 COLAS DUAL 3,5'''' INOX, SOPORTES NUEVOS', 419900, 'completada', '2022-04-07');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 653: OT 1803
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'ARIEL HUGAS' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'ARIEL HUGAS', '20331886-3', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'HDXT89' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'HDXT89', 'MERCEDES', 'A200', 2015, 'S/C', 98421) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '1803', 'HDXT89', 'AXLE BACK FREE + COLAS INOX 4'''' CROMO', 'AXLE BACK FREE + COLAS INOX 4'''' CROMO', 319900, 'completada', '2022-04-07');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 654: OT 1804
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'MARCO MALDONADO' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'MARCO MALDONADO', '10197475-8', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'DHJZ59' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'DHJZ59', 'SAMSUNG', 'SM5', 2011, 'S/C', 67685) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '1804', 'DHJZ59', 'FABRICACION DE MEDIA LINEA PARTE DELANTERA EN INOX CON INSTALACION DE Z CATALITICO ''TRAE CLIENTE'' + FLEXIBLE 2''''+INSTA C/ INOX + CLAMP INOX', 'FABRICACION DE MEDIA LINEA PARTE DELANTERA EN INOX CON INSTALACION DE Z CATALITICO ''TRAE CLIENTE'' + FLEXIBLE 2''''+INSTA C/ INOX + CLAMP INOX', 224800, 'completada', '2022-04-11');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 655: OT 1805
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'JONATHAN TAMAYO' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'JONATHAN TAMAYO', '19483605-8', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'FZZF32' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'FZZF32', 'BMW', '135I', 2014, 'S/C', 67) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '1805', 'FZZF32', 'INSTALACION VIBRANT EXHAUST - ''Y'' CON COLAS M (MANTIENE)', 'INSTALACION VIBRANT EXHAUST - ''Y'' CON COLAS M (MANTIENE)', 400000, 'completada', '2022-04-11');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 656: OT 1806
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'IGNACIO BASS' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'IGNACIO BASS', '', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'HHJJ54' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'HHJJ54', 'SUBARU', 'STI', 0, 'S/C', 0) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '1806', 'HHJJ54', 'PINPING INOX INTERCODER - INTERCODER + SILICONAS Y ABRAZADERAS - FABRICACION SOPORTE PARA FIJACION INTERCOOLER', 'PINPING INOX INTERCODER - INTERCODER + SILICONAS Y ABRAZADERAS - FABRICACION SOPORTE PARA FIJACION INTERCOOLER', 0, 'completada', '2026-01-01');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 657: OT 1807
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'BRYAN ALEXANDRE' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'BRYAN ALEXANDRE', '17490634-3', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'PZSL94' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'PZSL94', 'SEAT', 'ATECA CUPRA', 2021, 'S/C', 23763) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '1807', 'PZSL94', 'LINEA COMPLETA 3'''' FREE EXHAUST CON COLAS NUEVAS 3,5'''' DUAL CROMO', 'LINEA COMPLETA 3'''' FREE EXHAUST CON COLAS NUEVAS 3,5'''' DUAL CROMO', 559900, 'completada', '2022-04-11');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 658: OT 1808
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'ALAN RIQUETME' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'ALAN RIQUETME', '17518509-7', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'ZF1868' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'ZF1868', 'HONDA', 'INTEGRA', 1994, 'S/C', 131364) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '1808', 'ZF1868', 'INSTALACION SILENCIADOR ALTO FLUJO MAGNAFLOW CON REDUCCION Y TERMINACION TUBO 2,5'''' CON SOPORTENUEVO', 'INSTALACION SILENCIADOR ALTO FLUJO MAGNAFLOW CON REDUCCION Y TERMINACION TUBO 2,5'''' CON SOPORTENUEVO', 299900, 'completada', '2022-04-11');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 659: OT 1809
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'CLIENTE GENERICO' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'CLIENTE GENERICO', '', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'JKVG46' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'JKVG46', 'MERCEDES', 'E43', 0, 'S/C', 41409) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '1809', 'JKVG46', 'FABRICACION Y 2'''' CON INSTALACION', 'FABRICACION Y 2'''' CON INSTALACION', 140000, 'completada', '2022-04-12');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 660: OT 1810
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'HECTOR OROZCO' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'HECTOR OROZCO', '10654321-7', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'CDSV39' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'CDSV39', 'FORD', 'F150 XLT', 0, 'S/C', 0) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '1810', 'CDSV39', 'FABRICACION LINEA COMPLETA CON MAGNAFLOW + COLAS BLACK 4'''' DOBLE - INSTALACION RUEDA PARA PASO DE LINEA', 'FABRICACION LINEA COMPLETA CON MAGNAFLOW + COLAS BLACK 4'''' DOBLE - INSTALACION RUEDA PARA PASO DE LINEA', 850000, 'completada', '2022-04-12');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 661: OT 1811
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'RANDAL CONTRERAS' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'RANDAL CONTRERAS', '18584184-7', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'HSVB72' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'HSVB72', 'AUDI', 'TT', 2016, 'S/C', 62) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '1811', 'HSVB72', 'REMOVER SILENCIADORES CENTRALES 2''''', 'REMOVER SILENCIADORES CENTRALES 2''''', 130000, 'completada', '2022-04-12');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 662: OT 1812
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'FELIPE CASTILLO' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'FELIPE CASTILLO', '18337662-4', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'RCRT41' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'RCRT41', 'FORD', 'EDGE ST', 2022, 'S/C', 4468) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '1812', 'RCRT41', 'INSTALACION AXLE BACK ''TRAE CLIENTE'' + COLAS DE ESCAPE', 'INSTALACION AXLE BACK ''TRAE CLIENTE'' + COLAS DE ESCAPE', 315000, 'completada', '2022-04-13');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 663: OT 1813
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'EFRAIN FREDES' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'EFRAIN FREDES', '10624253-4', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'HDGS99' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'HDGS99', 'FORD', 'F150', 0, 'S/C', 97085) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '1813', 'HDGS99', 'INSTALACION ALTO FLUJO BORLA', 'INSTALACION ALTO FLUJO BORLA', 299900, 'completada', '2022-04-18');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 664: OT 1814
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'ERICK SANDOVAL' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'ERICK SANDOVAL', '16218180-7', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'FCRX17' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'FCRX17', 'AUDI', 'A5', 2012, 'S/C', 125175) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '1814', 'FCRX17', 'REPRO DE ECU STAGE 1 VERSION 2MHP GANANCIAS +49HP+50NM', 'REPRO DE ECU STAGE 1 VERSION 2MHP GANANCIAS +49HP+50NM', 389900, 'completada', '2022-04-18');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 665: OT 1815
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'FELIPE CASTILLO' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'FELIPE CASTILLO', '18337662-4', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'RCRT41' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'RCRT41', 'FORD', 'EDGE', 2022, 'S/C', 0) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '1815', 'RCRT41', 'REMOVER SILENCIADOR CENTRAL', 'REMOVER SILENCIADOR CENTRAL', 100000, 'completada', '2022-04-19');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 666: OT 1816
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'MANUEL AGUILAR' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'MANUEL AGUILAR', '15426074-9', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'RCDB10' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'RCDB10', 'NISSAN', 'SENTRA', 2022, 'S/C', 25) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '1816', 'RCDB10', 'AXLE BACK CON BALA 2'''' + COLA DUAL 2'''' CROMO', 'AXLE BACK CON BALA 2'''' + COLA DUAL 2'''' CROMO', 270000, 'completada', '2022-04-19');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 667: OT 1817
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'RAUL POBLETE' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'RAUL POBLETE', '16366179-1', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'LXYD59' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'LXYD59', 'VOLKSWAGEN', 'GOLF R', 2020, 'S/C', 0) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '1817', 'LXYD59', 'REMOVER SILENCIADOR CENTRAL', 'REMOVER SILENCIADOR CENTRAL', 74900, 'completada', '2022-04-20');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 668: OT 1818
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'MAY RIVERA' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'MAY RIVERA', '17110785-7', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'RVWG94' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'RVWG94', 'FORD', 'F150', 2022, 'S/C', 3) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '1818', 'RVWG94', 'LINEA COMPLETA INOX 3'''' C/ SILENCIADOR ALTO FLUJO BORLA EXHAUST C/COLAS 4.5'''' BLACK INCLUYE SOPORTES NUEVOS', 'LINEA COMPLETA INOX 3'''' C/ SILENCIADOR ALTO FLUJO BORLA EXHAUST C/COLAS 4.5'''' BLACK INCLUYE SOPORTES NUEVOS', 849900, 'completada', '2022-04-20');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 669: OT 1819
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'FELIPE RUIZ' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'FELIPE RUIZ', '21503142-k', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'KVRP11' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'KVRP11', 'VOLKSWAGEN', 'AMAROK', 2019, 'S/C', 58422) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '1819', 'KVRP11', 'LINEA INOX 2,5'''' FREE C/ DOBLE COLA TUBO INOX 3'''' C/CORTE DIAGONAL', 'LINEA INOX 2,5'''' FREE C/ DOBLE COLA TUBO INOX 3'''' C/CORTE DIAGONAL', 499900, 'completada', '2022-04-21');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 670: OT 1820
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'NICOLAS SOLABARRIETA' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'NICOLAS SOLABARRIETA', '19539583-7', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'KZRR73' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'KZRR73', 'BMW', '118I', 2019, 'S/C', 0) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '1820', 'KZRR73', 'CAMBIO POSICION MAGNAFLOW + AXLE BACK FREE C/COLAS M CROMO', 'CAMBIO POSICION MAGNAFLOW + AXLE BACK FREE C/COLAS M CROMO', 379900, 'completada', '2022-04-21');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 671: OT 1821
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'FELIPE TAPIA' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'FELIPE TAPIA', '19144081-1', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'LLGV96' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'LLGV96', 'MERCEDES', 'A250', 2020, 'S/C', 38) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '1821', 'LLGV96', 'FABRICACION DE CODO Y UNION A DIFUNSOR SIN REMOVER SILENCIADOR', 'FABRICACION DE CODO Y UNION A DIFUNSOR SIN REMOVER SILENCIADOR', 169900, 'completada', '2022-04-25');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 672: OT 1822
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'SEBASTIAN CABRERA' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'SEBASTIAN CABRERA', '16799154-8', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'GVCX88' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'GVCX88', 'BMW', '116', 2014, 'S/C', 64300) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '1822', 'GVCX88', 'INSTALACION SILENCIADOR ALTO FLUJO 2,5''''', 'INSTALACION SILENCIADOR ALTO FLUJO 2,5''''', 299900, 'completada', '2022-04-25');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 673: OT 1823
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'RICARDO CALDERON' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'RICARDO CALDERON', '16021210-1', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'SIN-PAT' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'SIN-PAT', 'FORD', 'MUSTANG', 0, 'S/C', 0) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '1823', 'SIN-PAT', 'FABRICACION LINEA DOBLE ''MEDIA LINEA 3'''' ZONA TRASERA 2,5''''-XPIPE CENTRAL 3'''' SILENCIADOR MAGNAFLOW 3''''+COLA ESCAPE 4'''' CROMO', 'FABRICACION LINEA DOBLE ''MEDIA LINEA 3'''' ZONA TRASERA 2,5''''-XPIPE CENTRAL 3'''' SILENCIADOR MAGNAFLOW 3''''+COLA ESCAPE 4'''' CROMO', 1049900, 'completada', '2022-04-26');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 674: OT 1824
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'CRISTIAN CABRERA' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'CRISTIAN CABRERA', '21306922-5', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'GWDK85' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'GWDK85', 'BMW', '435I', 2015, 'S/C', 26) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '1824', 'GWDK85', 'AXLE BACK FREE + COLAS ''TRAE CLIENTE''', 'AXLE BACK FREE + COLAS ''TRAE CLIENTE''', 219900, 'completada', '2022-04-27');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 675: OT 1825
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'CLIENTE GENERICO' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'CLIENTE GENERICO', '', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'JLDW40' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'JLDW40', 'AUDI', 'S1', 2018, 'S/C', 0) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '1825', 'JLDW40', 'AXLE BACK FREE, MANTIENE COLAS', 'AXLE BACK FREE, MANTIENE COLAS', 490000, 'completada', '2022-04-27');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 676: OT 1826
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'JOSE IGNACIO MORALES' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'JOSE IGNACIO MORALES', '18914475-K', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'LSWB82' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'LSWB82', 'MAZDA', '3', 2020, 'S/C', 45) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '1826', 'LSWB82', 'AXLE BACK FREE +2 COLAS 4'''' ''NEGRO'' - FILTRO PANEL BMC - REPRO ECU STAGE 1', 'AXLE BACK FREE +2 COLAS 4'''' ''NEGRO'' - FILTRO PANEL BMC - REPRO ECU STAGE 1', 674700, 'completada', '2022-04-27');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 677: OT 1827
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'GONZALO SALORO' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'GONZALO SALORO', '', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'ZL2118' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'ZL2118', 'MINI', 'COOPER JCW', 2007, 'S/C', 144268) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '1827', 'ZL2118', 'Carga masiva', 'Carga masiva', 0, 'completada', '2022-04-27');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 678: OT 1828
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'LUIS ZUÑIGA' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'LUIS ZUÑIGA', '18623965-2', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'KHRL66' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'KHRL66', 'MERCEDES', 'A250', 2018, 'S/C', 34029) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '1828', 'KHRL66', 'INSTALACION AXLE BACK VIBRANT PERFORMANCE', 'INSTALACION AXLE BACK VIBRANT PERFORMANCE', 249900, 'completada', '2022-04-28');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 679: OT 1829
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'RAUL ZUÑIGA GONZALEZ' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'RAUL ZUÑIGA GONZALEZ', '7621081-0', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'GHPY34' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'GHPY34', 'SUBARU', 'TRIBECA', 2014, 'S/C', 151772) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '1829', 'GHPY34', 'CAMBIO CATALITICOS PRIMARIOS C/ INSTALACION DE SENSOR OXIGENA', 'CAMBIO CATALITICOS PRIMARIOS C/ INSTALACION DE SENSOR OXIGENA', 699000, 'completada', '2022-04-29');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 680: OT 1830
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'EDGAR CIDBONT' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'EDGAR CIDBONT', '16652988-3', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'BTYX47' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'BTYX47', 'FORD', 'F150', 2009, 'S/C', 252911) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '1830', 'BTYX47', 'FABRICACION MEDIA LINEA INOX CON COLA DUAL', 'FABRICACION MEDIA LINEA INOX CON COLA DUAL', 219900, 'completada', '2022-04-29');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 681: OT 1831
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'MARCOS CARTER' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'MARCOS CARTER', '16212813-2', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'PTHV23' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'PTHV23', 'FORD', 'F150', 2022, 'S/C', 13499) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '1831', 'PTHV23', 'INSTALACION SILENCIADOR BORLA', 'INSTALACION SILENCIADOR BORLA', 299900, 'completada', '2022-05-02');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 682: OT 1832
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'BASTIAN ORTEGA' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'BASTIAN ORTEGA', '20129019-8', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'HCGG94' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'HCGG94', 'AUDI', 'A3 1.8T', 2015, 'S/C', 0) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '1832', 'HCGG94', 'REINSTALACION LINEA ORIGINAL ''CLIENTE TRAE LINEA''', 'REINSTALACION LINEA ORIGINAL ''CLIENTE TRAE LINEA''', 70000, 'completada', '2022-05-02');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 683: OT 1833
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'RICARDO VARGAS' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'RICARDO VARGAS', '19482120-4', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'JCTR18' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'JCTR18', 'MAZDA', '6', 2017, 'S/C', 113) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '1833', 'JCTR18', 'AXLE BACK FREE + COLA BLACK 4''''', 'AXLE BACK FREE + COLA BLACK 4''''', 319900, 'completada', '2022-05-03');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 684: OT 1834
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'SEBASTIAN ORELLANA' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'SEBASTIAN ORELLANA', '14363948-7', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'HFXZ73' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'HFXZ73', 'MERCEDES', 'A250', 2015, 'S/C', 73261) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '1834', 'HFXZ73', 'LINEA INOX 3'''' CON SOPORTES NUEVOS - SILENCIADOR ALTO FLUJO VIBRANT PERFORMANCE - 2 COLAS INOX 4'''' BLACK EDITION', 'LINEA INOX 3'''' CON SOPORTES NUEVOS - SILENCIADOR ALTO FLUJO VIBRANT PERFORMANCE - 2 COLAS INOX 4'''' BLACK EDITION', 660000, 'completada', '2022-05-03');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 685: OT 1835
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'GABRIEL CONTRERAS' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'GABRIEL CONTRERAS', '19221447-8', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'HRPP11' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'HRPP11', 'KIA', 'CARNIVAL', 2015, 'S/C', 148779) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '1835', 'HRPP11', 'REPROGRAMACION DE ECU STAGE 1', 'REPROGRAMACION DE ECU STAGE 1', 320000, 'completada', '2022-05-03');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 686: OT 1836
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'MARCOS ISRAEL' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'MARCOS ISRAEL', '21256699-3', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'RPTK79' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'RPTK79', 'CHEVROLET', 'COLORADO', 2022, 'S/C', 6843) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '1836', 'RPTK79', 'DOWNPIPE - LINEA FREE (COLA CROMO) - REPROGRAMACION DE ECU STAGE 2 + DPF OFF + EGR OFF (COLA VISIBLE)', 'DOWNPIPE - LINEA FREE (COLA CROMO) - REPROGRAMACION DE ECU STAGE 2 + DPF OFF + EGR OFF (COLA VISIBLE)', 1399700, 'completada', '2022-05-04');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 687: OT 1837
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'MICHAEL' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'MICHAEL', '16562417-8', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'KTKL66' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'KTKL66', 'FORD', 'F150', 2018, 'S/C', 46000) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '1837', 'KTKL66', 'INSTALACION SILENCIADOR ORIGINAL - FABRICACION ''Y'' PARA ACOPLE SALIDA DOBLE - REPARACION SALIDA COLA (CORTE TUBO VISIBLE)', 'INSTALACION SILENCIADOR ORIGINAL - FABRICACION ''Y'' PARA ACOPLE SALIDA DOBLE - REPARACION SALIDA COLA (CORTE TUBO VISIBLE)', 269900, 'completada', '2022-05-04');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 688: OT 1838
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'CARLOS PEREZ' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'CARLOS PEREZ', '26699973-9', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'KFHJ69' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'KFHJ69', 'HYUNDAY', 'I10', 2018, 'S/C', 0) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '1838', 'KFHJ69', 'CAMBIO EMPAQUETADURA (ABRAZADERA) INSTALACION MODULO CUT OUT', 'CAMBIO EMPAQUETADURA (ABRAZADERA) INSTALACION MODULO CUT OUT', 44900, 'completada', '2022-05-05');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 689: OT 1839
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'JOAQUIN JIMENEZ' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'JOAQUIN JIMENEZ', '18717681-6', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'RSRH75' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'RSRH75', 'CHEVROLET', 'SILVERADO', 2022, 'S/C', 5000) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '1839', 'RSRH75', 'INSTALACION BORLA EXHAUST', 'INSTALACION BORLA EXHAUST', 299900, 'completada', '2022-05-05');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 690: OT 1840
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'ALBERT TIDY' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'ALBERT TIDY', '10564652-6', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'BKCB20' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'BKCB20', 'PORSCHE', 'BOXTER', 2008, 'S/C', 34000) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '1840', 'BKCB20', 'FABRICACION ''''X'''' PARA COLAS DE ESCAPE 4'''' CROMO', 'FABRICACION ''''X'''' PARA COLAS DE ESCAPE 4'''' CROMO', 119900, 'completada', '2022-05-06');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 691: OT 1841
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'JUAN POBLETE' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'JUAN POBLETE', '19442201-6', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'PSTL13' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'PSTL13', 'MAZDA', '3', 2021, 'S/C', 0) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '1841', 'PSTL13', 'REMOVER SILENCIADOR CENTRAL', 'REMOVER SILENCIADOR CENTRAL', 75000, 'completada', '2022-05-06');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 692: OT 1842
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'CRISTIAN LARENAS' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'CRISTIAN LARENAS', '16517112-8', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'LXRR57' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'LXRR57', 'SUZUKI', 'SWIFT', 2020, 'S/C', 29886) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '1842', 'LXRR57', 'MONTAJE LINEA STOCK + CATALITICO - REPROGRAMACION STOCK', 'MONTAJE LINEA STOCK + CATALITICO - REPROGRAMACION STOCK', 149900, 'completada', '2022-05-09');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 693: OT 1843
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'VICENTE FERRINO' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'VICENTE FERRINO', '9920853-8', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'CTYJ85' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'CTYJ85', 'PORSCHE', 'BOXSTER S', 2011, 'S/C', 82347) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '1843', 'CTYJ85', 'LINEA INOX 2,5'''' C/ VIBRANT PERFORMANCE + COLAS Y 4''''', 'LINEA INOX 2,5'''' C/ VIBRANT PERFORMANCE + COLAS Y 4''''', 874000, 'completada', '2022-05-09');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 694: OT 1844
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'DIEGO IBARRA' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'DIEGO IBARRA', '16913736-6', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'FDPP44' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'FDPP44', 'SKODA', 'OCTAVIA VRS', 2013, 'S/C', 189992) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '1844', 'FDPP44', 'PIPING INTERCODER INOX C/ SILICONAS Y ABRAZADORES NUEVOS C/FLANCHE DE MAP', 'PIPING INTERCODER INOX C/ SILICONAS Y ABRAZADORES NUEVOS C/FLANCHE DE MAP', 450000, 'completada', '2022-05-09');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 695: OT 1845
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'JOSE PABLO MEZA' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'JOSE PABLO MEZA', '20809601-K', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'HDYX20' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'HDYX20', 'BMW', '118I', 2015, 'S/C', 69053) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '1845', 'HDYX20', 'FABRICACION E INSTALACION DOWNPIPE INOX', 'FABRICACION E INSTALACION DOWNPIPE INOX', 389900, 'completada', '2022-05-10');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 696: OT 1846
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'FRANCISCO CORREA' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'FRANCISCO CORREA', '9105274-1', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'PBZG34' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'PBZG34', 'VOLKSWAGEN', 'AMAROK', 2019, 'S/C', 38673) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '1846', 'PBZG34', 'DOWNPIPE - STAGE 2 DPF+EGR', 'DOWNPIPE - STAGE 2 DPF+EGR', 859900, 'completada', '2022-05-10');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 697: OT 1847
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'CARLOS PARRA' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'CARLOS PARRA', '24599661-7', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'RFGJ35' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'RFGJ35', 'PEUGEOT', '308', 2021, 'S/C', 13200) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '1847', 'RFGJ35', 'AXLE BACK (QUE NO SUENE MUCHO) EJE TRASERO HACIA ATRÁS SIN COLA VISIBLE', 'AXLE BACK (QUE NO SUENE MUCHO) EJE TRASERO HACIA ATRÁS SIN COLA VISIBLE', 299900, 'completada', '2022-05-12');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 698: OT 1848
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'DIEGO JEREZ' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'DIEGO JEREZ', '16856377-9', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'GSFZ95' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'GSFZ95', 'TOYOTA', 'RAV 4', 2014, 'S/C', 85) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '1848', 'GSFZ95', 'REPROGRAMACION STAGE 1 - INSTALACION SPRINT BOOSTER - INSTALACION INDUCCION', 'REPROGRAMACION STAGE 1 - INSTALACION SPRINT BOOSTER - INSTALACION INDUCCION', 250000, 'completada', '2022-05-12');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 699: OT 1849
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'NICOLAS' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'NICOLAS', '21184917-7', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'TX5389' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'TX5389', 'SUBARU', 'IMPREZA', 2000, 'S/C', 134) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '1849', 'TX5389', 'INSTALACION DE SILENCIADOR ALTO FLUJO (REMOVER SILENCIADOR BMW) SALIDA DE 4''''', 'INSTALACION DE SILENCIADOR ALTO FLUJO (REMOVER SILENCIADOR BMW) SALIDA DE 4''''', 299900, 'completada', '2022-05-12');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 700: OT 1850
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'BASTIAN LEON' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'BASTIAN LEON', '17405879-2', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'PGSG47' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'PGSG47', 'BMW', '240I', 2020, 'S/C', 13) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '1850', 'PGSG47', 'GARANTIA COLA POR SONIDO + ADICIONA ANTI DRONE', 'GARANTIA COLA POR SONIDO + ADICIONA ANTI DRONE', 119900, 'completada', '2022-05-12');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    RAISE NOTICE 'Procesados 700 registros...';
    -- Fila 701: OT 1851
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'EDUART ABREU' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'EDUART ABREU', '26850582-2', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'HKCC91' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'HKCC91', 'FIAT', 'DOBLO', 2016, 'S/C', 56993) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '1851', 'HKCC91', 'VACIADO DPF - REPROGRAMACION DPF OFF, EGR OFF', 'VACIADO DPF - REPROGRAMACION DPF OFF, EGR OFF', 399900, 'completada', '2026-01-01');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 702: OT 1852
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'JULIO PONS' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'JULIO PONS', '16358025-K', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'DHXF97' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'DHXF97', 'CHEVROLET', 'COLORADO', 2012, 'S/C', 178) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '1852', 'DHXF97', 'INSTALACION BORLA PROXS 2,5'''' INOX', 'INSTALACION BORLA PROXS 2,5'''' INOX', 299900, 'completada', '2022-05-13');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 703: OT 1853
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'ANDRES MELENDES' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'ANDRES MELENDES', '76953973-5', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'SIN-PAT' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'SIN-PAT', 'JAC', 'T6', 0, 'S/C', 0) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '1853', 'SIN-PAT', 'VACIADO DE DPF (CLIENTE LO TRAE POR MANO)', 'VACIADO DE DPF (CLIENTE LO TRAE POR MANO)', 60000, 'completada', '2022-05-16');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 704: OT 1854
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'FELIPE RUIZ' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'FELIPE RUIZ', '21503142-K', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'KVRP11' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'KVRP11', 'VOLKSWAGEN', 'AMAROK', 2019, 'S/C', 59200) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '1854', 'KVRP11', 'FABRICACION DOWNPIPE', 'FABRICACION DOWNPIPE', 299900, 'completada', '2022-05-16');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 705: OT 1855
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'PATRICIO CASTRO' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'PATRICIO CASTRO', '13753014-7', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'DPGW29' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'DPGW29', 'BMW', 'M3 COUPE', 2012, 'S/C', 103714) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '1855', 'DPGW29', 'LINEA COMPLETA INOX, AXLE BACK VIBRANT PERFORMANCE CON COLAS INOX DUAL 3,5''''', 'LINEA COMPLETA INOX, AXLE BACK VIBRANT PERFORMANCE CON COLAS INOX DUAL 3,5''''', 799900, 'completada', '2022-05-16');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 706: OT 1856
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'ENZO ANTONUCCI' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'ENZO ANTONUCCI', '10976572-4', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'JJLC62' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'JJLC62', 'FORD', 'MUSTANG', 2017, 'S/C', 36) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '1856', 'JJLC62', 'AXLE BACK MAGNAFLOW + COLA 4'''' BLACK', 'AXLE BACK MAGNAFLOW + COLA 4'''' BLACK', 639800, 'completada', '2022-05-17');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 707: OT 1857
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'ITALO ESPINOZA' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'ITALO ESPINOZA', '17553865-8', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'HWKS62' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'HWKS62', 'SUZUKI', 'JIMNY', 2016, 'S/C', 0) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '1857', 'HWKS62', 'FABRICACION FLANCHE PARA INTERCAMBIAR SILENCIADOR', 'FABRICACION FLANCHE PARA INTERCAMBIAR SILENCIADOR', 64900, 'completada', '2022-05-17');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 708: OT 1858
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'JOSE MIGUEL VEGA' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'JOSE MIGUEL VEGA', '17282986-4', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'PDYF51' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'PDYF51', 'BMW', '118I', 2020, 'S/C', 20) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '1858', 'PDYF51', 'LINEA COMPLETA INOX 2,5'' + SILENCIADOR ALTO FLUJO VIBRANT + COLA DE ESCAPE', 'LINEA COMPLETA INOX 2,5'' + SILENCIADOR ALTO FLUJO VIBRANT + COLA DE ESCAPE', 659900, 'completada', '2022-05-17');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 709: OT 1859
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'SALVADOR DE LA FUENTE' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'SALVADOR DE LA FUENTE', '16519666-K', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'HGTJ59' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'HGTJ59', 'AUDI', 'A3', 2015, 'S/C', 144470) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '1859', 'HGTJ59', 'LINEA COMPLETA INOX 2,5'''' + VIBRANT + COLA 4''''', 'LINEA COMPLETA INOX 2,5'''' + VIBRANT + COLA 4''''', 599900, 'completada', '2022-05-18');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 710: OT 1860
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'ROBER SOTO' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'ROBER SOTO', '', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'LPRF50' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'LPRF50', 'BMW', 'X5', 2020, 'S/C', 36450) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '1860', 'LPRF50', 'AXLE BACK VIBRANT PERFORMANCE - REPRO DE ECU STAGE 1', 'AXLE BACK VIBRANT PERFORMANCE - REPRO DE ECU STAGE 1', 1139810, 'completada', '2022-05-18');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 711: OT 1861
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'DANIEL MORALES' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'DANIEL MORALES', '15008390-7', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'YJ7663' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'YJ7663', 'BMW', 'M6 645I', 2005, 'S/C', 108140) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '1861', 'YJ7663', 'AXLE BACK + COLA M PERFORMANCE', 'AXLE BACK + COLA M PERFORMANCE', 389900, 'completada', '2022-05-19');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 712: OT 1862
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'FRANCISCO FERNANDEZ' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'FRANCISCO FERNANDEZ', '16383904-0', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'PGBZ61' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'PGBZ61', 'PEUGEOT', '2008', 2020, 'S/C', 23799) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '1862', 'PGBZ61', 'FABRICACION PIPING INTERCOOLER CON SILICONA Y ABRAZADERA', 'FABRICACION PIPING INTERCOOLER CON SILICONA Y ABRAZADERA', 139900, 'completada', '2022-05-19');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 713: OT 1863
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'CLIENTE GENERICO' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'CLIENTE GENERICO', '', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'RGSH90' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'RGSH90', 'SUZUKI', 'SWIFT SPORT', 0, 'S/C', 0) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '1863', 'RGSH90', 'Carga masiva', 'Carga masiva', 0, 'completada', '2022-05-20');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 714: OT 1864
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'PABLO MIGUEL BENITEZ' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'PABLO MIGUEL BENITEZ', '19383544-9', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'FHKY59' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'FHKY59', 'BMW', '325I', 2013, 'S/C', 69000) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '1864', 'FHKY59', 'STAGE 1 - SPRINT BOOSTER - AXLE BACK FREE C/COLA DOBLE NEGRAS', 'STAGE 1 - SPRINT BOOSTER - AXLE BACK FREE C/COLA DOBLE NEGRAS', 795000, 'completada', '2022-05-23');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 715: OT 1865
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'SEBASTIAN GAETE' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'SEBASTIAN GAETE', '', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'JLLJ35' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'JLLJ35', 'MINI', 'COOPERS', 2017, 'S/C', 0) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '1865', 'JLLJ35', 'AXLE BACK VIBRANT  + COLA DUAL BLACK 4'''' - FABRICACION ''Y'' - INSTALACION CLAMP DOWNPIPE', 'AXLE BACK VIBRANT  + COLA DUAL BLACK 4'''' - FABRICACION ''Y'' - INSTALACION CLAMP DOWNPIPE', 429900, 'completada', '2022-05-23');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 716: OT 1866
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'DIEGO ORDENES' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'DIEGO ORDENES', '16977905-8', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'GCWF19' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'GCWF19', 'MERCEDES', 'A45', 2015, 'S/C', 0) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '1866', 'GCWF19', 'AXLE BACK VIBRANT , CRUZADO, MANTIENE COLAS', 'AXLE BACK VIBRANT , CRUZADO, MANTIENE COLAS', 449900, 'completada', '2022-05-24');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 717: OT 1867
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'BORIS KLEIN' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'BORIS KLEIN', '18000348-7', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'PHLG39' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'PHLG39', 'DODGE', 'RAM 1500', 2020, 'S/C', 0) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '1867', 'PHLG39', 'INSTALACION SILENCIADOR ALTO FLUJO BORLA', 'INSTALACION SILENCIADOR ALTO FLUJO BORLA', 299900, 'completada', '2022-05-24');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 718: OT 1868
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'CARLOS AGUIRRE' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'CARLOS AGUIRRE', '17566487-4', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'LZLL22' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'LZLL22', 'CHEVROLET', 'SILVERADO', 0, 'S/C', 0) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '1868', 'LZLL22', 'INSTALACION SILENCIADOR ORIGINAL', 'INSTALACION SILENCIADOR ORIGINAL', 90000, 'completada', '2022-05-25');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 719: OT 1869
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'CLAUDIO RATTO' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'CLAUDIO RATTO', '10709382-6', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'HWKR54' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'HWKR54', 'MAZDA', 'MIATA', 2016, 'S/C', 0) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '1869', 'HWKR54', 'INSTALACION SILENCIADOR TRASERO - RESCATE DE FLANCHE PARA SILENCIADOR', 'INSTALACION SILENCIADOR TRASERO - RESCATE DE FLANCHE PARA SILENCIADOR', 95000, 'completada', '2022-05-25');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 720: OT 1870
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'CRISTIAN GUERRA' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'CRISTIAN GUERRA', '', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'RYGF23' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'RYGF23', 'BMW', '128CI', 2022, 'S/C', 0) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '1870', 'RYGF23', 'AXLE BACK VIBRANT EXHAUST 2,5'' + COLA ''M'' CROMO - MANTIENE VALVULA', 'AXLE BACK VIBRANT EXHAUST 2,5'' + COLA ''M'' CROMO - MANTIENE VALVULA', 650000, 'completada', '2022-05-25');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 721: OT 1871
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'GINO' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'GINO', '', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'CFBL55' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'CFBL55', 'BMW', '550I', 0, 'S/C', 0) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '1871', 'CFBL55', 'REPARACION MANTENCION', 'REPARACION MANTENCION', 25000, 'completada', '2022-05-26');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 722: OT 1872
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'TIAN ORELLANA' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'TIAN ORELLANA', '14363948-7', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'HFXZ73' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'HFXZ73', 'MERCEDES', 'A250', 2015, 'S/C', 0) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '1872', 'HFXZ73', 'ADAPTACION AXLE BACK CON DUFUSOR NUEVO - SE AGREGA TRAMO DE INOX 2,5''''', 'ADAPTACION AXLE BACK CON DUFUSOR NUEVO - SE AGREGA TRAMO DE INOX 2,5''''', 120000, 'completada', '2022-05-26');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 723: OT 1873
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'GONZALO QUIROZ' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'GONZALO QUIROZ', '16702479-3', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'LBTK53' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'LBTK53', 'FORD', 'A150 LARIAT', 2019, 'S/C', 55260) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '1873', 'LBTK53', 'LINEA COMPLETA INOX 3'''' - 2,5'' + BORLA EXHAUST + COLA ESCAPE NEGRA', 'LINEA COMPLETA INOX 3'''' - 2,5'' + BORLA EXHAUST + COLA ESCAPE NEGRA', 849900, 'completada', '2022-05-31');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 724: OT 1874
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'FELIPE CACERES' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'FELIPE CACERES', '18487913-1', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'GTZT75' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'GTZT75', 'CHEVROLET', 'CRUZE', 2014, 'S/C', 150) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '1874', 'GTZT75', 'FABRICACION LINEA COMPLETA INOX 2'''' + COLA ESCAPE SMG + BORLA EXHAUST', 'FABRICACION LINEA COMPLETA INOX 2'''' + COLA ESCAPE SMG + BORLA EXHAUST', 630000, 'completada', '2022-05-31');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 725: OT 1875
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'HECTOR GONZALEZ' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'HECTOR GONZALEZ', '10394801-1', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'KGLW96' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'KGLW96', 'BMW', 'X1', 1018, 'S/C', 60) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '1875', 'KGLW96', 'FABRICACION DOWNPIPE', 'FABRICACION DOWNPIPE', 399900, 'completada', '2022-06-01');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 726: OT 1876
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'SEBASTIAN ESPINOZA' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'SEBASTIAN ESPINOZA', '20418242-6', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'PSPW75' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'PSPW75', 'MERCEDES', 'C43', 2020, 'S/C', 18) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '1876', 'PSPW75', 'DOWNPIPE - REPROGRAMACION STAGE 2', 'DOWNPIPE - REPROGRAMACION STAGE 2', 1342325, 'completada', '2022-06-01');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 727: OT 1877
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'AGUSTIN GOMEZ' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'AGUSTIN GOMEZ', '12666219-K', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'GYWF18' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'GYWF18', 'BMW', '220I', 2015, 'S/C', 11500) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '1877', 'GYWF18', 'AXLE BACK VIBRANT, SIN COLA DE ESCAPE', 'AXLE BACK VIBRANT, SIN COLA DE ESCAPE', 299900, 'completada', '2022-06-02');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 728: OT 1878
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'BENJAMIN GONZALEZ' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'BENJAMIN GONZALEZ', '21427153-2', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'DPRC81' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'DPRC81', 'VOLKSWAGEN', 'GOLF', 2012, 'S/C', 147882) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '1878', 'DPRC81', 'REPROGRAMACION STAGE 1 - LINEA CON DOBLE SALIDA', 'REPROGRAMACION STAGE 1 - LINEA CON DOBLE SALIDA', 225000, 'completada', '2022-06-03');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 729: OT 1879
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'CRISTIAN GUERRA' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'CRISTIAN GUERRA', '13067521-2', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'SZ6558' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'SZ6558', 'BMW', '330I', 1990, 'S/C', 0) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '1879', 'SZ6558', 'LINEA COMPLETA INOX 3'''' BORLA EXHAUST + RESONADOR CENTRAL + COLA DOBLE', 'LINEA COMPLETA INOX 3'''' BORLA EXHAUST + RESONADOR CENTRAL + COLA DOBLE', 740000, 'completada', '2022-06-03');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 730: OT 1880
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'DANIEL CORDOBA' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'DANIEL CORDOBA', '18467262-6', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'SIN-PAT' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'SIN-PAT', 'MAZDA', '3', 2021, 'S/C', 14) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '1880', 'SIN-PAT', 'AXLE BACK VIBRANT EXHAUST + COLA BLACK 4''''', 'AXLE BACK VIBRANT EXHAUST + COLA BLACK 4''''', 649900, 'completada', '2022-06-07');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 731: OT 1881
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'VIVIANA LOYOLA' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'VIVIANA LOYOLA', '21149580-4', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'PPSC93' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'PPSC93', 'VOLKSWAGEN', 'GTI MK7', 2021, 'S/C', 19) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '1881', 'PPSC93', 'LINEA COMPLETA INOX 3'''' + SILENCIADOR ALTO FLUJO VIBRANT PERFORMANCE + 2 COLAS 3'''' EN 4'''' OUT', 'LINEA COMPLETA INOX 3'''' + SILENCIADOR ALTO FLUJO VIBRANT PERFORMANCE + 2 COLAS 3'''' EN 4'''' OUT', 679900, 'completada', '2022-06-07');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 732: OT 1882
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'IGNACION QUEZADA' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'IGNACION QUEZADA', '16775800-2', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'HKWP63' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'HKWP63', 'MERCEDES', 'A45', 2015, 'S/C', 107418) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '1882', 'HKWP63', 'DOWNPIPE 3'''' - STAGE 2', 'DOWNPIPE 3'''' - STAGE 2', 917325, 'completada', '2022-06-08');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 733: OT 1883
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'FRANCISCO JIMENEZ' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'FRANCISCO JIMENEZ', '17086869-2', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'JFFJ19' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'JFFJ19', 'VOLKSWAGEN', 'AMAROK', 2017, 'S/C', 64223) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '1883', 'JFFJ19', 'FABRICACION E INSTALACION DOWNPIPE', 'FABRICACION E INSTALACION DOWNPIPE', 319900, 'completada', '2022-06-09');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 734: OT 1884
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'FABIAN FIGUEROA' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'FABIAN FIGUEROA', '17623795-3', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'RHKS73' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'RHKS73', 'SUZUKI', 'SWIF SPORT', 2022, 'S/C', 0) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '1884', 'RHKS73', 'AXLE BACK FREE + COLA 4''''', 'AXLE BACK FREE + COLA 4''''', 349700, 'completada', '2022-06-10');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 735: OT 1885
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'SEBASTIAN FARIAS' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'SEBASTIAN FARIAS', '18191862-4', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'JCWL94' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'JCWL94', 'PEUGEOT', '308 HDI', 2017, 'S/C', 88643) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '1885', 'JCWL94', 'STAGE 1 GANANCIAS +32HP +48NM', 'STAGE 1 GANANCIAS +32HP +48NM', 0, 'completada', '2022-06-10');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 736: OT 1886
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'LUCAS MARTIN' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'LUCAS MARTIN', '19077907-6', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'LVZC90' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'LVZC90', 'VOLKSWAGEN', 'GOLF GTI MK', 2020, 'S/C', 0) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '1886', 'LVZC90', 'AXLE BACK INOX 2,5'''' CON COLAS 4'''' - ANILLO INOX CLANP ADICIONAL', 'AXLE BACK INOX 2,5'''' CON COLAS 4'''' - ANILLO INOX CLANP ADICIONAL', 344900, 'completada', '2022-06-13');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 737: OT 1887
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'LUCAS MACHICAO' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'LUCAS MACHICAO', '19247193-1', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'HGTB67' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'HGTB67', 'TOYOTA', 'TACOMA', 2016, 'S/C', 106800) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '1887', 'HGTB67', 'LINEA INOX 2,5'''' CON ALTO FLUJO MAGNAFLOW - COLA BLACK 4''''', 'LINEA INOX 2,5'''' CON ALTO FLUJO MAGNAFLOW - COLA BLACK 4''''', 689800, 'completada', '2022-06-13');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 738: OT 1888
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'JAVIER QUIROBA' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'JAVIER QUIROBA', '19188331-4', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'WJ2406' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'WJ2406', 'ALFA ROMERO', '159', 2006, 'S/C', 0) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '1888', 'WJ2406', 'REPARACION BAJADA MULTIPLE - NO INVOLUCRA AÑADIR INOX', 'REPARACION BAJADA MULTIPLE - NO INVOLUCRA AÑADIR INOX', 120000, 'completada', '2022-06-16');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 739: OT 1889
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'HECTOR GONZALEZ' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'HECTOR GONZALEZ', '16974046-1', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'KBJZ51' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'KBJZ51', 'VOLVO', 'V40', 2018, 'S/C', 92308) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '1889', 'KBJZ51', 'LINEA COMPLETA INOX + VIBRANT EXHAUST + COLA 4'''' CROMO 2,5', 'LINEA COMPLETA INOX + VIBRANT EXHAUST + COLA 4'''' CROMO 2,5', 649900, 'completada', '2022-06-17');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 740: OT 1890
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'IGNACIO SALGADO' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'IGNACIO SALGADO', '', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'LSJC78' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'LSJC78', 'TOYOTA', 'YARIS', 2019, 'S/C', 32) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '1890', 'LSJC78', 'REPARACION FUGA DE ESCAPE - ANALISIS DE SONIDO EN ALTO', 'REPARACION FUGA DE ESCAPE - ANALISIS DE SONIDO EN ALTO', 0, 'completada', '2022-06-20');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 741: OT 1891
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'GABRIEL BELLO' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'GABRIEL BELLO', '19829430-6', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'FYWP94' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'FYWP94', 'BMW', 'MGI', 2014, 'S/C', 37997) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '1891', 'FYWP94', 'INSTALACION Y FABRICACION DOWNPIPE', 'INSTALACION Y FABRICACION DOWNPIPE', 389900, 'completada', '2022-06-22');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 742: OT 1892
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'GABRIEL SABEDRA' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'GABRIEL SABEDRA', '19174334-2', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'HDSG68' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'HDSG68', 'VOLKSWAGEN', 'GOLF', 2015, 'S/C', 125603) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '1892', 'HDSG68', 'AXLE BACK FREE + COLA CROMO', 'AXLE BACK FREE + COLA CROMO', 209900, 'completada', '2022-06-22');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 743: OT 1893
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'JORGE BUSTO' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'JORGE BUSTO', '18569621-9', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'JHWS14' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'JHWS14', 'FORD', 'FOCUS', 2017, 'S/C', 66) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '1893', 'JHWS14', 'INSTALACION SPRINTBOOTER V3', 'INSTALACION SPRINTBOOTER V3', 254900, 'completada', '2022-06-22');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 744: OT 1894
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'CLAUDIO HORMAZABAL' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'CLAUDIO HORMAZABAL', '18469881-1', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'RPKD14' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'RPKD14', 'CHEVROLET', 'TRAVERSE', 2022, 'S/C', 0) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '1894', 'RPKD14', 'AXLE BACK FREE INOX 2,5'''' CON COLAS CAMIONETA CORSA 4'''' BLACK', 'AXLE BACK FREE INOX 2,5'''' CON COLAS CAMIONETA CORSA 4'''' BLACK', 410000, 'completada', '2022-06-22');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 745: OT 1895
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'CRISTIAN MALDONADO' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'CRISTIAN MALDONADO', '17416188-7', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'KPGH52' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'KPGH52', 'AUDI', 'A3', 2018, 'S/C', 24471) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '1895', 'KPGH52', 'FABRICACION LINEA COMPLETA INOX 2,5'''' + VIBRANT EXHAUST + COLA DUAL CROMO', 'FABRICACION LINEA COMPLETA INOX 2,5'''' + VIBRANT EXHAUST + COLA DUAL CROMO', 760000, 'completada', '2022-06-22');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 746: OT 1896
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'MANUEL ORTIZ' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'MANUEL ORTIZ', '15677792-7', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'CJBS25' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'CJBS25', 'PEUGEOT', '207 RC', 2010, 'S/C', 134000) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '1896', 'CJBS25', 'REPRO STAGE 2', 'REPRO STAGE 2', 389900, 'completada', '2022-06-24');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 747: OT 1897
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'KEVIN MADRID' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'KEVIN MADRID', '19706174-K', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'HJFL80' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'HJFL80', 'MERCEDES', 'CLA 180', 2016, 'S/C', 102) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '1897', 'HJFL80', 'LINEA COMPLETA INOX + VIBRANT EXHAUST (MANTIENE COLAS)', 'LINEA COMPLETA INOX + VIBRANT EXHAUST (MANTIENE COLAS)', 559900, 'completada', '2022-06-28');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 748: OT 1898
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'MAXIMILIANO RIVERA' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'MAXIMILIANO RIVERA', '17110785-7', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'RVWG94' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'RVWG94', 'FORD', 'F150', 0, 'S/C', 0) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '1898', 'RVWG94', 'INSTALACION SILENCIADOR NORMAL', 'INSTALACION SILENCIADOR NORMAL', 119900, 'completada', '2022-06-28');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 749: OT 1899
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'GERMAN PARDO' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'GERMAN PARDO', '16624824-8', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'RSSS64' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'RSSS64', 'VOLKSWAGEN', 'GOL', 2022, 'S/C', 326) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '1899', 'RSSS64', 'INSTALACION MUFFLER HKS (LO TRAE CLIENTE)', 'INSTALACION MUFFLER HKS (LO TRAE CLIENTE)', 100000, 'completada', '2022-06-29');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 750: OT 1900
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'JOSE LUIS BARRA' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'JOSE LUIS BARRA', '17623958-1', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'GYPW87' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'GYPW87', 'MERCEDES', 'E200', 2015, 'S/C', 50621) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '1900', 'GYPW87', 'LINEA COMPLETA INOX + 2 ALTO FLUJO VIBRANT PERFORMANCE', 'LINEA COMPLETA INOX + 2 ALTO FLUJO VIBRANT PERFORMANCE', 769900, 'completada', '2022-06-29');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 751: OT 1901
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'PATRICIO AGUIRRE' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'PATRICIO AGUIRRE', '17064071-3', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'FPFH60' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'FPFH60', 'AUDI', 'A5', 2013, 'S/C', 107578) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '1901', 'FPFH60', 'LINEA INOX 2,5'' DESDE FLANCHE CENTRAL + SILENCIADOR ALTO FLUJO VIBRANT BOTLEE + 2 COLAS BLACK 4''''', 'LINEA INOX 2,5'' DESDE FLANCHE CENTRAL + SILENCIADOR ALTO FLUJO VIBRANT BOTLEE + 2 COLAS BLACK 4''''', 659900, 'completada', '2022-06-30');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 752: OT 1902
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'SEBASTIAN NARVAEZ' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'SEBASTIAN NARVAEZ', '16118302-4', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'RYJH94' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'RYJH94', 'MERCEDES', 'A250 W177', 2022, 'S/C', 40) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '1902', 'RYJH94', 'MODIFICACION BRAZOS PARA COINCIDIR SALIDA CON DIFUSOR', 'MODIFICACION BRAZOS PARA COINCIDIR SALIDA CON DIFUSOR', 299900, 'completada', '2022-06-30');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 753: OT 1903
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'DIGDA JU' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'DIGDA JU', '24402399-1', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'HLCS57' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'HLCS57', 'BMW', '435I', 2016, 'S/C', 77674) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '1903', 'HLCS57', 'SUPIMIR SILENCIADOR CENTRAL - INSTALACION DIFUSOR - MODIFICAR BRAZOS E INTA COLAS DOBLE - ''CLIENTE TRAE DIFUSOR Y COLAS''', 'SUPIMIR SILENCIADOR CENTRAL - INSTALACION DIFUSOR - MODIFICAR BRAZOS E INTA COLAS DOBLE - ''CLIENTE TRAE DIFUSOR Y COLAS''', 264800, 'completada', '2022-06-30');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 754: OT 1904
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'SEBASTIAN LEIVA' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'SEBASTIAN LEIVA', '17767063-4', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'FJPW41' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'FJPW41', 'OPEL', 'ASTRA J', 2013, 'S/C', 63315) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '1904', 'FJPW41', 'LINEA INOX DESDE FLANCHE CENTRAL C/ ALTO FLUJO BORLA EXHAUST COMPOSICION - SE MANTIENEN COLAS', 'LINEA INOX DESDE FLANCHE CENTRAL C/ ALTO FLUJO BORLA EXHAUST COMPOSICION - SE MANTIENEN COLAS', 609900, 'completada', '2022-06-30');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 755: OT 1905
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'RAUL CAVIERES' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'RAUL CAVIERES', '13190878-4', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'LJDJ53' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'LJDJ53', 'DODGE', 'RAM', 2019, 'S/C', 17) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '1905', 'LJDJ53', 'REEMPLAZO DE SILENCIADOR CENTRAL POR ALTO FLUJO FLOWMASTER - FILTRO DE PANEL ALTO FLUJO BMC - KIT DE LIMPIEZA BMC', 'REEMPLAZO DE SILENCIADOR CENTRAL POR ALTO FLUJO FLOWMASTER - FILTRO DE PANEL ALTO FLUJO BMC - KIT DE LIMPIEZA BMC', 437700, 'completada', '2022-07-01');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 756: OT 1906
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'MOSHE HIDALGO' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'MOSHE HIDALGO', '', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'JSSR37' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'JSSR37', 'FORD', 'A150 RAPTOR', 0, 'S/C', 155444) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '1906', 'JSSR37', 'INSTALACION CATALITICO BANCO 1 C/MODIFICACION', 'INSTALACION CATALITICO BANCO 1 C/MODIFICACION', 549900, 'completada', '2022-07-01');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 757: OT 1907
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'RODRIGO BARROS' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'RODRIGO BARROS', '10345083-7', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'LCZR98' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'LCZR98', 'BMW', '120I', 2019, 'S/C', 21641) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '1907', 'LCZR98', 'INSTALACION COLA M (LAS TRAE CLIENTE) CON REDUCCION DE INOX - SE INSTALA TUERCA EN CONEXIÓN DP-LINEA', 'INSTALACION COLA M (LAS TRAE CLIENTE) CON REDUCCION DE INOX - SE INSTALA TUERCA EN CONEXIÓN DP-LINEA', 129900, 'completada', '2022-07-01');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 758: OT 1908
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'FELIPE ITURRIETA' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'FELIPE ITURRIETA', '16716270-3', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'GKRK61' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'GKRK61', 'AUDI', 'R8', 2014, 'S/C', 40) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '1908', 'GKRK61', 'INSTALACION BORLA XR1 - REPROGRAMACION STAGE 1 - SPRINT BOOSTER', 'INSTALACION BORLA XR1 - REPROGRAMACION STAGE 1 - SPRINT BOOSTER', 2539900, 'completada', '2022-07-04');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 759: OT 1909
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'FABRIZZIO NAVEAS' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'FABRIZZIO NAVEAS', '18277074-4', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'LTTS44' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'LTTS44', 'CHEVROLET', 'COLORADO', 2020, 'S/C', 50142) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '1909', 'LTTS44', 'DOWNPIPE INOX (CATLESS+DPF OFF) LINEA INOX DOBLE CON COLAS INOX- REPROGRAMACION DE ECU STAGE 2 DPF+EGR OFF', 'DOWNPIPE INOX (CATLESS+DPF OFF) LINEA INOX DOBLE CON COLAS INOX- REPROGRAMACION DE ECU STAGE 2 DPF+EGR OFF', 1500000, 'completada', '2022-07-05');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 760: OT 1910
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'FRANCISCO VARGAS' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'FRANCISCO VARGAS', '18026428-0', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'LGSR95' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'LGSR95', 'MINI', 'COOPER', 2019, 'S/C', 46117) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '1910', 'LGSR95', 'TRAMO LINEA DE ESCAPE + SILENCIADOR ALTO FLUJO BALA GENERICA + CUTOUT', 'TRAMO LINEA DE ESCAPE + SILENCIADOR ALTO FLUJO BALA GENERICA + CUTOUT', 670000, 'completada', '2022-07-05');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 761: OT 1911
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'SEBASTIAN BASORA' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'SEBASTIAN BASORA', '18641936-7', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'HSKJ77' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'HSKJ77', 'SUZUKI', 'VITARA', 2016, 'S/C', 0) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '1911', 'HSKJ77', 'REUBICACION SISTEMA CUT OUT 2,5'' (REQUIERE REDUCCION) SILENCIADOR (TIPO BALA) INSTALADO CON CAIDA HACIA ABAJO -INSTALACION SPRINTBOOSTER', 'REUBICACION SISTEMA CUT OUT 2,5'' (REQUIERE REDUCCION) SILENCIADOR (TIPO BALA) INSTALADO CON CAIDA HACIA ABAJO -INSTALACION SPRINTBOOSTER', 494900, 'completada', '2022-07-06');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 762: OT 1912
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'CLIENTE GENERICO' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'CLIENTE GENERICO', '', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'FFDY49' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'FFDY49', 'BMW', '535P', 0, 'S/C', 122) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '1912', 'FFDY49', 'Carga masiva', 'Carga masiva', 0, 'completada', '2022-07-07');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 763: OT 1913
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'RIGO' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'RIGO', '', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'BLDY27' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'BLDY27', 'CHEVROLET', 'COLORADO', 2008, 'S/C', 0) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '1913', 'BLDY27', 'INSTALACION SILENCIADOR ALTO FLUJO BORLA', 'INSTALACION SILENCIADOR ALTO FLUJO BORLA', 270000, 'completada', '2022-07-07');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 764: OT 1914
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'DIEGO RODRIGUEZ' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'DIEGO RODRIGUEZ', '18934323-K', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'LHWY74' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'LHWY74', 'TOYOTA', 'HILUX', 2019, 'S/C', 63272) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '1914', 'LHWY74', 'INSTALACION DOWNPIPE', 'INSTALACION DOWNPIPE', 300000, 'completada', '2022-07-08');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 765: OT 1915
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'EDGAN' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'EDGAN', '16652988-3', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'BTYX47' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'BTYX47', 'FORD', 'F150', 2009, 'S/C', 255698) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '1915', 'BTYX47', 'INSTALACION INDUCCION DE ARE F150 KIT LIMPIEZA + FILTRO BNC', 'INSTALACION INDUCCION DE ARE F150 KIT LIMPIEZA + FILTRO BNC', 100000, 'completada', '2022-07-08');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 766: OT 1916
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'NICOLAS HERNANDEZ' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'NICOLAS HERNANDEZ', '18114849-7', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'JXTD62' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'JXTD62', 'BMW', '120I', 2018, 'S/C', 52) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '1916', 'JXTD62', 'MODIFICACION E INSTALACION DE COLA DE ESCAPE (TRAE CLIENTE)', 'MODIFICACION E INSTALACION DE COLA DE ESCAPE (TRAE CLIENTE)', 149900, 'completada', '2022-07-11');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 767: OT 1917
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'LUIS EDUARDO GAETE TELLO' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'LUIS EDUARDO GAETE TELLO', '15835126-9', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'JBCZ78' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'JBCZ78', 'AUDI', 'A3', 2016, 'S/C', 74) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '1917', 'JBCZ78', 'REPARACION DOWNPIPE + CAMBIO DEV.CLAMP INOX 2,5''''', 'REPARACION DOWNPIPE + CAMBIO DEV.CLAMP INOX 2,5''''', 104900, 'completada', '2022-07-11');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 768: OT 1918
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'CRISTIAN DELGADO' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'CRISTIAN DELGADO', '17030696-1', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'RKSJ64' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'RKSJ64', 'CHEVROLET', 'SILVERADO', 2022, 'S/C', 0) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '1918', 'RKSJ64', 'INSTALACION SILENCIADOR ALTO FLUJO FLOWMASTER 3''''', 'INSTALACION SILENCIADOR ALTO FLUJO FLOWMASTER 3''''', 299900, 'completada', '2022-07-12');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 769: OT 1919
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'SEBASTIAN' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'SEBASTIAN', '16368060-2', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'JLHX19' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'JLHX19', 'CHEVROLET', 'SILVERADO', 1017, 'S/C', 0) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '1919', 'JLHX19', 'FABRICACION SALIDA DOBLE + COLA CROMO4'''' - INSTALACION SILENCIADOR BORLA S-TYPE', 'FABRICACION SALIDA DOBLE + COLA CROMO4'''' - INSTALACION SILENCIADOR BORLA S-TYPE', 499900, 'completada', '2026-01-01');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 770: OT 1920
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'CLIENTE GENERICO' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'CLIENTE GENERICO', '', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'GXXF16' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'GXXF16', 'AUDI', 'A7', 2014, 'S/C', 155217) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '1920', 'GXXF16', 'LINEA COMPLETA DOBLE INOX + COLA 4'''' - DOWNPIPE', 'LINEA COMPLETA DOBLE INOX + COLA 4'''' - DOWNPIPE', 2119800, 'completada', '2026-01-01');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 771: OT 1921
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'FELIPE CORTES' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'FELIPE CORTES', '16503285-3', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'JBTS31' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'JBTS31', 'MERCEDES', 'CLA 45', 2017, 'S/C', 55) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '1921', 'JBTS31', 'INSTALACION ALTO FLUJO VIBRANT - GARANTIA NIVELACION DE COLA LADO COPILOTO / SE HACE BRAZO NUEVO', 'INSTALACION ALTO FLUJO VIBRANT - GARANTIA NIVELACION DE COLA LADO COPILOTO / SE HACE BRAZO NUEVO', 280000, 'completada', '2022-07-13');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 772: OT 1922
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'ADRIAN ZAMORANO PARDO' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'ADRIAN ZAMORANO PARDO', '16034180-7', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'FTGR13' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'FTGR13', 'NISSAN', '370 Z', 2013, 'S/C', 73846) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '1922', 'FTGR13', 'LINEA DE ESCAPE INOX 2,5'''' + 2 VIBRANT PERFORMANCE BOTTLE 2,5'' + COLAS NUEVAS', 'LINEA DE ESCAPE INOX 2,5'''' + 2 VIBRANT PERFORMANCE BOTTLE 2,5'' + COLAS NUEVAS', 849900, 'completada', '2022-07-14');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 773: OT 1923
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'CLIENTE GENERICO' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'CLIENTE GENERICO', '', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'SIN-PAT' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'SIN-PAT', 'S/M', 'S/M', 0, 'S/C', 0) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '1923', 'SIN-PAT', 'Carga masiva', 'Carga masiva', 0, 'completada', '2026-01-01');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 774: OT 1924
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'CARLOS ROJAS' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'CARLOS ROJAS', '21688266-0', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'HTCV85' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'HTCV85', 'BMW', '120I', 2016, 'S/C', 53) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '1924', 'HTCV85', 'AXLE BACK FREE + COLA CROMO 3,5''''', 'AXLE BACK FREE + COLA CROMO 3,5''''', 319900, 'completada', '2022-07-19');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 775: OT 1925
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'JUAN PABLO PEDRAZA' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'JUAN PABLO PEDRAZA', '18529222-3', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'DTXD35' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'DTXD35', 'HONDA', 'CIVIC', 2013, 'S/C', 114914) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '1925', 'DTXD35', 'LINEA COMPLETA INOX 2,5'''' SILENCIADOR + RESONADOR VIBRANT EXHAUST + COLA BLACK 4''''', 'LINEA COMPLETA INOX 2,5'''' SILENCIADOR + RESONADOR VIBRANT EXHAUST + COLA BLACK 4''''', 749900, 'completada', '2022-07-21');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 776: OT 1926
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'FELIPE PADILLA' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'FELIPE PADILLA', '13930673-2', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'SIN-PAT' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'SIN-PAT', 'DODGE', 'RAM 1500', 2022, 'S/C', 1) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '1926', 'SIN-PAT', 'LINEA COMPLETA INOX 3'''' + SILENCIADOR ALTO FLUJO + COLA 4'''' BLACK', 'LINEA COMPLETA INOX 3'''' + SILENCIADOR ALTO FLUJO + COLA 4'''' BLACK', 879900, 'completada', '2022-07-21');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 777: OT 1927
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'LUIS GAETE' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'LUIS GAETE', '15835126-9', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'JBCZ78' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'JBCZ78', 'AUDI', 'A3', 2016, 'S/C', 75874) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '1927', 'JBCZ78', 'INSTALACION DOWNPIPE ''''ORIGINAL''''', 'INSTALACION DOWNPIPE ''''ORIGINAL''''', 60000, 'completada', '2022-07-22');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 778: OT 1928
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'DIEGO VILOA' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'DIEGO VILOA', '19219849-8', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'CK3142' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'CK3142', 'CHEVROLET', 'C10', 1980, 'S/C', 0) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '1928', 'CK3142', 'CAMBIO INSTALACION Y MONTAJE CLAMP ZONA MULTIPLE Y ZONA MEDIA - CAMBIO SOPORTE E INSTALACION SOPORTE NUEVO (ACERO)', 'CAMBIO INSTALACION Y MONTAJE CLAMP ZONA MULTIPLE Y ZONA MEDIA - CAMBIO SOPORTE E INSTALACION SOPORTE NUEVO (ACERO)', 245000, 'completada', '2022-07-25');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 779: OT 1929
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'FELIPE PADILLA' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'FELIPE PADILLA', '13930673-2', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'RVDY25' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'RVDY25', 'CHEVROLET', 'SILVERADO', 2022, 'S/C', 9) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '1929', 'RVDY25', 'FABRICACION LINEA COMPLETA INOX + SILENCIADOR BORLA EXHAUST', 'FABRICACION LINEA COMPLETA INOX + SILENCIADOR BORLA EXHAUST', 699900, 'completada', '2022-07-25');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 780: OT 1930
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'CARLOS VALENZUELA' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'CARLOS VALENZUELA', '17337927-7', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'PZ8242' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'PZ8242', 'BMW', '325I', 1988, 'S/C', 0) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '1930', 'PZ8242', 'FABRICACION LINEA COMPLETA INOX + BORLA EXHAUST', 'FABRICACION LINEA COMPLETA INOX + BORLA EXHAUST', 819900, 'completada', '2022-07-25');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 781: OT 1931
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'SEBASTIANNARVAEZ' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'SEBASTIANNARVAEZ', '16118302-4', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'RYJH94' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'RYJH94', 'MERCEDES', 'A250', 2022, 'S/C', 650) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '1931', 'RYJH94', 'FABRICACION E INSTALACION DE SISTEMA INDICCION + FABRICACION ''Y'' - INSTALACION VIBRANT', 'FABRICACION E INSTALACION DE SISTEMA INDICCION + FABRICACION ''Y'' - INSTALACION VIBRANT', 564800, 'completada', '2022-07-26');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 782: OT 1932
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'CRISTIAN ARAVEMA' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'CRISTIAN ARAVEMA', '13271305-7', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'ND2544' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'ND2544', 'VOLKSWAGEN', 'COMBI', 1995, 'S/C', 0) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '1932', 'ND2544', 'FABRICACION LINEA COMPLETA (RESCATA FLANCHE) + SILENCIADOR ORIGINAL + CATALITICO REVISION COLA ESCAPE', 'FABRICACION LINEA COMPLETA (RESCATA FLANCHE) + SILENCIADOR ORIGINAL + CATALITICO REVISION COLA ESCAPE', 379900, 'completada', '2022-07-26');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 783: OT 1933
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'CAMILO MEZA' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'CAMILO MEZA', '15679241-1', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'KDXW84' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'KDXW84', 'BMW', '120I', 2018, 'S/C', 60) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '1933', 'KDXW84', 'INSTALACION VIBRANT EXHAUST', 'INSTALACION VIBRANT EXHAUST', 249900, 'completada', '2022-07-26');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 784: OT 1934
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'NICOLAS GONZALEZ' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'NICOLAS GONZALEZ', '16150891-8', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'JLDW40' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'JLDW40', 'AUDI', 'S1', 2018, 'S/C', 93700) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '1934', 'JLDW40', 'FABRICAR INDUCCION INOX C/SILICONA Y SOPORTE', 'FABRICAR INDUCCION INOX C/SILICONA Y SOPORTE', 100000, 'completada', '2022-07-27');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 785: OT 1935
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'NICOLAS WOOD' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'NICOLAS WOOD', '21042523-3', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'RPWJ35' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'RPWJ35', 'FORD', 'BRONCO', 2022, 'S/C', 6200) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '1935', 'RPWJ35', 'INSTALACION MAGNAFLOW - FABRICACION AXLE BACK NUEVA FREE', 'INSTALACION MAGNAFLOW - FABRICACION AXLE BACK NUEVA FREE', 400000, 'completada', '2022-07-28');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 786: OT 1936
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'EDGARD CID' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'EDGARD CID', '16652988-3', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'LFJV11' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'LFJV11', 'SUBARU', 'STI', 2011, 'S/C', 0) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '1936', 'LFJV11', 'FABRICACION LINEA COMPLETA INOX + RESONADOR VIBRANT EXHAUST + COLA ESCAPE DOBLE 3,5'''' CROMO', 'FABRICACION LINEA COMPLETA INOX + RESONADOR VIBRANT EXHAUST + COLA ESCAPE DOBLE 3,5'''' CROMO', 799900, 'completada', '2022-07-28');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 787: OT 1937
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'ITALO CUADRA' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'ITALO CUADRA', '19405877-2', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'KFJB91' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'KFJB91', 'BMW', 'X3', 2018, 'S/C', 65475) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '1937', 'KFJB91', 'AXLE BACK FREE C/COLA (4) M PERFORMANCE CROMO', 'AXLE BACK FREE C/COLA (4) M PERFORMANCE CROMO', 619900, 'completada', '2022-07-28');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 788: OT 1938
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'VICTOR FIERRO' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'VICTOR FIERRO', '18829473-1', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'KPVB48' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'KPVB48', 'SUBARU', 'XV', 2018, 'S/C', 52) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '1938', 'KPVB48', 'INSTALACION VIBRANT PERFORMANCE ALTO FLUJO', 'INSTALACION VIBRANT PERFORMANCE ALTO FLUJO', 0, 'completada', '2022-07-29');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 789: OT 1939
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'FREDDY RIVERO' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'FREDDY RIVERO', '19545000-5', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'RCWT86' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'RCWT86', 'VOLKSWAGEN', 'NIVUS', 2021, 'S/C', 36) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '1939', 'RCWT86', 'SUPRIMIR SILENCIADOR CENTRAL - FABRICACION E INSTALACION SILENCIADOR TIPO BALA ZONA TRASERA + COLA DE ESCAPE - REPRO STAGE 1', 'SUPRIMIR SILENCIADOR CENTRAL - FABRICACION E INSTALACION SILENCIADOR TIPO BALA ZONA TRASERA + COLA DE ESCAPE - REPRO STAGE 1', 729800, 'completada', '2022-07-29');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 790: OT 1940
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'JUAN GOMEZ' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'JUAN GOMEZ', '18077531-5', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'BWGC71' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'BWGC71', 'AUDI', 'A4', 2009, 'S/C', 99055) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '1940', 'BWGC71', 'INSTALACION DOWNPIPE - REPROGRAMACION STAGE 2 - ELIMINA SILENCIADOR CENTRAL', 'INSTALACION DOWNPIPE - REPROGRAMACION STAGE 2 - ELIMINA SILENCIADOR CENTRAL', 550205, 'completada', '2022-08-01');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 791: OT 1941
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'JOSE URIBE' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'JOSE URIBE', '27074480-K', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'RPWJ14' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'RPWJ14', 'TOYOTA', 'HILUX', 2022, 'S/C', 6500) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '1941', 'RPWJ14', 'FABRICACION SNORKEL A MEDIDA (DE ACUERDO A LO COTIZADO) PINTADO NEGRO', 'FABRICACION SNORKEL A MEDIDA (DE ACUERDO A LO COTIZADO) PINTADO NEGRO', 350000, 'completada', '2022-08-01');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 792: OT 1942
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'MATIAS RIVERA' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'MATIAS RIVERA', '19811064-7', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'CWGY11' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'CWGY11', 'JAGUAR', 'XF R', 2011, 'S/C', 120) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '1942', 'CWGY11', 'FABRICACION LINEA COMPLETA 2,5'''' MAGNAFLOW CENTRAL (2 ENTRADA / 2 SALIDAS) ZONA TRASERA BORLA + COLA DUAL - SIN CATALITICO', 'FABRICACION LINEA COMPLETA 2,5'''' MAGNAFLOW CENTRAL (2 ENTRADA / 2 SALIDAS) ZONA TRASERA BORLA + COLA DUAL - SIN CATALITICO', 1399900, 'completada', '2022-08-01');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 793: OT 1943
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'ADUARDO AGUIRRE' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'ADUARDO AGUIRRE', '18975756-5', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'LBLS31' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'LBLS31', 'BMW', '120I', 0, 'S/C', 34265) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '1943', 'LBLS31', 'VUELVE A STOCK ZONA TRASERA - INSTALACION DE DIFUSOR ORIGINAL', 'VUELVE A STOCK ZONA TRASERA - INSTALACION DE DIFUSOR ORIGINAL', 145000, 'completada', '2022-08-02');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 794: OT 1944
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'INVERSIONES RPH' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'INVERSIONES RPH', '77206636-8', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'JRKT37' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'JRKT37', 'FORD', 'MUSTANG', 2016, 'S/C', 53703) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '1944', 'JRKT37', 'TRABAJO DE ESCAPE LINEA COMPLETA', 'TRABAJO DE ESCAPE LINEA COMPLETA', 0, 'completada', '2026-01-01');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 795: OT 1945
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'JUAN GOMEZ' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'JUAN GOMEZ', '18077531-5', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'BWGC71' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'BWGC71', 'AUDI', 'A4', 2009, 'S/C', 99) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '1945', 'BWGC71', 'REVISION REPROGRAMACION', 'REVISION REPROGRAMACION', 0, 'completada', '2026-01-01');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 796: OT 1946
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'LAUTORO RODRIGUEZ' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'LAUTORO RODRIGUEZ', '23606468-9', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'BS6973' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'BS6973', 'AUSTIU', 'MINI 1285', 1980, 'S/C', 0) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '1946', 'BS6973', 'LINEA INOX 2'''' CON ALTO FLUJO BORLA Y DOBLE COLA CORTE 45''''', 'LINEA INOX 2'''' CON ALTO FLUJO BORLA Y DOBLE COLA CORTE 45''''', 480000, 'completada', '2022-08-04');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 797: OT 1947
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'JUAN PABLO CARVAJAL' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'JUAN PABLO CARVAJAL', '19306814-6', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'PHJL98' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'PHJL98', 'AUDI', 'A3', 2021, 'S/C', 37875) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '1947', 'PHJL98', 'DOWNPIPE INOX 3'''' - REPROGRAMACION DE ECU STAGE 2', 'DOWNPIPE INOX 3'''' - REPROGRAMACION DE ECU STAGE 2', 789900, 'completada', '2022-08-04');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 798: OT 1948
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'JORGE SIMS' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'JORGE SIMS', '13688041-1', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'HXF84' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'HXF84', 'KAWASAKI', 'VERSYS', 2019, 'S/C', 0) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '1948', 'HXF84', 'INSTALACION ESCAPE CON MODIFICACION DE LINEA INOX', 'INSTALACION ESCAPE CON MODIFICACION DE LINEA INOX', 110000, 'completada', '2022-08-04');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 799: OT 1949
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'ALEXIS SILVA' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'ALEXIS SILVA', '15545326-5', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'LCPJ38' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'LCPJ38', 'MAZDA', 'BT 50', 2019, 'S/C', 126102) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '1949', 'LCPJ38', 'DPF OFF - EGR OFF', 'DPF OFF - EGR OFF', 320000, 'completada', '2022-08-05');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 800: OT 1950
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'JULIO MARTINEZ' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'JULIO MARTINEZ', '', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'FLKC93' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'FLKC93', 'FORD', 'F150', 2013, 'S/C', 109) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '1950', 'FLKC93', 'REPARACION DEL ESCAPE CAMBIO DE GOMA INSTALACION DE SILENCIADOR ORIGINAL', 'REPARACION DEL ESCAPE CAMBIO DE GOMA INSTALACION DE SILENCIADOR ORIGINAL', 80000, 'completada', '2022-08-08');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    RAISE NOTICE 'Procesados 800 registros...';
    -- Fila 801: OT 1951
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'RPH MOTOR SPORT' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'RPH MOTOR SPORT', '77208636-8', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'SIN-PAT' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'SIN-PAT', 'FORD', 'MUSTANG', 0, 'S/C', 0) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '1951', 'SIN-PAT', 'LINEA COMPLETA DE ESCAPE C/ XPIPE + 2 ALTO FLUJO BORLA EXHAUST', 'LINEA COMPLETA DE ESCAPE C/ XPIPE + 2 ALTO FLUJO BORLA EXHAUST', 1099900, 'completada', '2022-08-08');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 802: OT 1952
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'FELIPE CACERES' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'FELIPE CACERES', '13904609-9', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'DPFY97' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'DPFY97', 'AUDI', 'A4', 2012, 'S/C', 144) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '1952', 'DPFY97', 'INSTALACION DE VIBRANT PERFORMANCE CENTRAL + COLAS TUBO DOBLE C/CORTE 45''', 'INSTALACION DE VIBRANT PERFORMANCE CENTRAL + COLAS TUBO DOBLE C/CORTE 45''', 400000, 'completada', '2022-08-08');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 803: OT 1953
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'RODRIGO CHARPENTIOR' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'RODRIGO CHARPENTIOR', '18392895-3', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'KGLK53' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'KGLK53', 'TOYOTA', 'HILUX', 2018, 'S/C', 852) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '1953', 'KGLK53', 'FABRICACION LINEA COMPLETA FREE (PRESENTAR SILENCIADOR) - FABRICACION E INSTALACION DOWNPIPE - REPRO DE ECU STAGE 2 DPF EGR OFF', 'FABRICACION LINEA COMPLETA FREE (PRESENTAR SILENCIADOR) - FABRICACION E INSTALACION DOWNPIPE - REPRO DE ECU STAGE 2 DPF EGR OFF', 769900, 'completada', '2022-08-09');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 804: OT 1954
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'RODRIGO SABAT' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'RODRIGO SABAT', '13436016-K', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'SIN-PAT' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'SIN-PAT', 'FORD', 'BRONCO', 2021, 'S/C', 500) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '1954', 'SIN-PAT', 'INSTALACION VIBRANT CENTRAL - AXLE BACK FREE + COLAS BLACK 4''''', 'INSTALACION VIBRANT CENTRAL - AXLE BACK FREE + COLAS BLACK 4''''', 599900, 'completada', '2026-01-01');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 805: OT 1955
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'CLIENTE GENERICO' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'CLIENTE GENERICO', '', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'LPKP29' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'LPKP29', 'FORD', 'RAPTOR', 0, 'S/C', 0) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '1955', 'LPKP29', 'REVICION VIBRACION - INSTALACION SILENCIADOR ALTO FLUJO', 'REVICION VIBRACION - INSTALACION SILENCIADOR ALTO FLUJO', 339900, 'completada', '2026-01-01');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 806: OT 1956
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'FRANCISCO UTRERA' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'FRANCISCO UTRERA', '19322799-6', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'GSDD62' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'GSDD62', 'DODGE', 'DURANGO', 2014, 'S/C', 107) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '1956', 'GSDD62', 'AXLE BACK MAGNAFLOW + COLA ESCAPE - SUPRIMIR SILENCIADOR CENTRAL', 'AXLE BACK MAGNAFLOW + COLA ESCAPE - SUPRIMIR SILENCIADOR CENTRAL', 679900, 'completada', '2022-08-11');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 807: OT 1957
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'JOSE LEYTO' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'JOSE LEYTO', '19418594-4', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'KJBF78' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'KJBF78', 'CITROEN', 'DS 3', 2018, 'S/C', 24696) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '1957', 'KJBF78', 'LINEA COMPLETA INOX + VIBRANT PERFORMANCE + COLA 4'''' CROMO - REPROGRAMACION STAGE 1', 'LINEA COMPLETA INOX + VIBRANT PERFORMANCE + COLA 4'''' CROMO - REPROGRAMACION STAGE 1', 949810, 'completada', '2022-08-11');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 808: OT 1958
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'DIEGO GONZALEZ' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'DIEGO GONZALEZ', '', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'RT3599' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'RT3599', 'CHEVROLET', 'TAHOE', 0, 'S/C', 0) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '1958', 'RT3599', 'DETALLEPOR DEFINIR', 'DETALLEPOR DEFINIR', 0, 'completada', '2022-08-12');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 809: OT 1959
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'YULIN' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'YULIN', '14666963-8', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'GPKJ29' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'GPKJ29', 'MERCEDES', 'S 500', 2014, 'S/C', 101) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '1959', 'GPKJ29', 'FABRICACION E INSTALACION DOWNPIPE - LINEA COMPLETA INOX 3'''' + DOBLE ALTO FLUJO BORLA COMPETICION 3''''', 'FABRICACION E INSTALACION DOWNPIPE - LINEA COMPLETA INOX 3'''' + DOBLE ALTO FLUJO BORLA COMPETICION 3''''', 2549800, 'completada', '2022-08-16');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 810: OT 1960
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'RODRIGO' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'RODRIGO', '17600485-4', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'KSLP46' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'KSLP46', 'CHEVROLET', 'CAMARO 55', 2018, 'S/C', 0) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '1960', 'KSLP46', 'FABRICACION ZONA CENTRAL + XPIPE 3''''', 'FABRICACION ZONA CENTRAL + XPIPE 3''''', 965500, 'completada', '2026-01-01');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 811: OT 1961
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'MARIA IGNACIA VILOA' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'MARIA IGNACIA VILOA', '18923244-3', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'HVCX54' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'HVCX54', 'SUZUKI', 'SWIFT', 2016, 'S/C', 46753) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '1961', 'HVCX54', 'CHEQUEO PRE REVICION TECNICA', 'CHEQUEO PRE REVICION TECNICA', 75000, 'completada', '2022-08-18');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 812: OT 1962
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'RODRIGO' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'RODRIGO', '17600485-4', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'KSLP46' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'KSLP46', 'CHEVROLET', 'CAMARO 55', 2018, 'S/C', 0) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '1962', 'KSLP46', 'INSTALACION RESONADORES CENTRALES VIBRANT EXHAUST 3''''', 'INSTALACION RESONADORES CENTRALES VIBRANT EXHAUST 3''''', 399900, 'completada', '2022-08-18');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 813: OT 1963
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'CLIENTE GENERICO' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'CLIENTE GENERICO', '', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'SDFF92' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'SDFF92', 'FORD', 'BRONCO', 0, 'S/C', 0) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '1963', 'SDFF92', 'INSTALACION SILENCIADOR ORIGINAL CON DESMONTAJE LINEA PARA SU REMATE', 'INSTALACION SILENCIADOR ORIGINAL CON DESMONTAJE LINEA PARA SU REMATE', 80000, 'completada', '2022-08-19');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 814: OT 1964
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'JUAN ARENAS' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'JUAN ARENAS', '9128005-1', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'LSZK89' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'LSZK89', 'GREAT WALL', 'WINGLE', 2019, 'S/C', 0) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '1964', 'LSZK89', 'REPARACION DE FUGA POR QUIEBRE DE SOLDADURA', 'REPARACION DE FUGA POR QUIEBRE DE SOLDADURA', 40000, 'completada', '2022-08-22');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 815: OT 1965
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'FELIX BARRIOS' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'FELIX BARRIOS', '18894518-K', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'LBRY34' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'LBRY34', 'CHEVROLET', 'COLORADO', 2019, 'S/C', 107648) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '1965', 'LBRY34', 'DOWNPIPE (BLACK) LINEA COMPLETA INOX 2,5'''' + COLA Y  REPROGRAMACION ECU STAGE 2', 'DOWNPIPE (BLACK) LINEA COMPLETA INOX 2,5'''' + COLA Y  REPROGRAMACION ECU STAGE 2', 1349900, 'completada', '2022-08-22');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 816: OT 1966
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'MAXIMILIANO RIVERA' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'MAXIMILIANO RIVERA', '17110785-7', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'SIN-PAT' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'SIN-PAT', 'FORD', 'F150', 2022, 'S/C', 0) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '1966', 'SIN-PAT', 'INSTALACION SILENCIADOR BORLA EXHAUST', 'INSTALACION SILENCIADOR BORLA EXHAUST', 150000, 'completada', '2022-08-22');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 817: OT 1967
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'OSCAR ACEVEDO' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'OSCAR ACEVEDO', '13786580-7', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'KBDP92' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'KBDP92', 'MERCEDES', 'CLA 45', 2018, 'S/C', 41) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '1967', 'KBDP92', 'FABRICACION ZONA TRASERA ''Y'' INOX', 'FABRICACION ZONA TRASERA ''Y'' INOX', 249900, 'completada', '2022-08-23');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 818: OT 1968
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'ANDRES MARTINEZ' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'ANDRES MARTINEZ', '', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'DJHG12' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'DJHG12', 'ALFA ROMERO', '147', 2000, 'S/C', 195) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '1968', 'DJHG12', 'PULIDO COLAS SUPERSPRINT - INSTALACION LINEA COMPLETA + CAMBIO GOMAS (2)', 'PULIDO COLAS SUPERSPRINT - INSTALACION LINEA COMPLETA + CAMBIO GOMAS (2)', 200000, 'completada', '2022-08-23');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 819: OT 1969
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'ISRAEL SANTIBAÑES' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'ISRAEL SANTIBAÑES', '18030128-3', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'RJRL34' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'RJRL34', 'MAZDA', '3', 2022, 'S/C', 52) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '1969', 'RJRL34', 'AXLE BACK VIBRANT EXHAUST 2,5''''', 'AXLE BACK VIBRANT EXHAUST 2,5''''', 690000, 'completada', '2022-08-23');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 820: OT 1970
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'JEAN PIERE GARRIDO' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'JEAN PIERE GARRIDO', '19186789-0', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'FZCV25' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'FZCV25', 'OPEL', 'ASTRA OPC', 2013, 'S/C', 66998) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '1970', 'FZCV25', 'FABRICACION AXLE BACK FREE', 'FABRICACION AXLE BACK FREE', 329900, 'completada', '2022-08-25');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 821: OT 1971
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'NICOLAS DUARTE' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'NICOLAS DUARTE', '17760081-4', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'JGSH96' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'JGSH96', 'MERCEDES', 'SLK 350', 2012, 'S/C', 91882) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '1971', 'JGSH96', 'AXLE BACK VIBRANT EXHAUST 2,5''''', 'AXLE BACK VIBRANT EXHAUST 2,5''''', 649900, 'completada', '2022-08-25');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 822: OT 1972
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'NICOLAS HUANG' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'NICOLAS HUANG', '19792679-1', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'HFGB79' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'HFGB79', 'BMW', 'M3', 2015, 'S/C', 49500) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '1972', 'HFGB79', 'FABRICACION ''Y'' MAS INSTALACION (CLIENTE TRAE COLAS) 3''''', 'FABRICACION ''Y'' MAS INSTALACION (CLIENTE TRAE COLAS) 3''''', 200000, 'completada', '2022-08-26');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 823: OT 1973
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'THIAGO' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'THIAGO', '27137329-5', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'FJJP33' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'FJJP33', 'AUDI', 'A3', 2012, 'S/C', 68) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '1973', 'FJJP33', 'INSTALACION SILENCIADOR MAGNAFLOW (TRAE CLIENTE)', 'INSTALACION SILENCIADOR MAGNAFLOW (TRAE CLIENTE)', 80000, 'completada', '2022-08-26');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 824: OT 1974
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'MARCO VILLAREAL' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'MARCO VILLAREAL', '18276074-9', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'GXPG99' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'GXPG99', 'PORSCHE', 'CAYMAN', 2015, 'S/C', 48800) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '1974', 'GXPG99', 'LINEA COMPLETA INOX 2,5'''' + BORLA COMPETITION + COLA NEGRA', 'LINEA COMPLETA INOX 2,5'''' + BORLA COMPETITION + COLA NEGRA', 1319900, 'completada', '2022-08-26');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 825: OT 1975
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'JESUS CARVALLO' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'JESUS CARVALLO', '16828739-9', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'VF6264' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'VF6264', 'CADILLAC', 'ESCALADE', 2002, 'S/C', 149) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '1975', 'VF6264', 'REMUEVE SILENCIADOR - FABRICACION ''Y'' + INSTALACION COLA CORSA - INSTALACION BORLA', 'REMUEVE SILENCIADOR - FABRICACION ''Y'' + INSTALACION COLA CORSA - INSTALACION BORLA', 499900, 'completada', '2022-08-29');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 826: OT 1976
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'DIEGO FLORES' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'DIEGO FLORES', '17064501-4', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'JXDT55' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'JXDT55', 'MERCEDES', 'GLE 350', 2018, 'S/C', 95895) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '1976', 'JXDT55', 'REPRO DE ESCUSTAGE 1 - SCANNER GRATIS Y SE BORRAN CODIGOS Y SE ENVIAN A CLIENTES', 'REPRO DE ESCUSTAGE 1 - SCANNER GRATIS Y SE BORRAN CODIGOS Y SE ENVIAN A CLIENTES', 489900, 'completada', '2022-08-29');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 827: OT 1977
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'ERNESTO GORDION' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'ERNESTO GORDION', '18769082-K', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'GLZY69' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'GLZY69', 'FORD', 'MUSTANG', 2014, 'S/C', 53) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '1977', 'GLZY69', 'INSTALACION  Y FABRICACION AXLE BACK BORLA PROXS 2,5'''' + COLA 4'''' BLACK', 'INSTALACION  Y FABRICACION AXLE BACK BORLA PROXS 2,5'''' + COLA 4'''' BLACK', 699900, 'completada', '2022-08-30');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 828: OT 1978
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'CRISTIAN DEL BASTO' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'CRISTIAN DEL BASTO', '16741672-1', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'GTPJ63' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'GTPJ63', 'MERCEDES', 'A45', 2015, 'S/C', 36) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '1978', 'GTPJ63', 'INSTALACION CAT BACK - FABRICACION DOWNPIPE - STAGE 2 - INSTALACION BLOW OFF - INSTALACION INTAKE', 'INSTALACION CAT BACK - FABRICACION DOWNPIPE - STAGE 2 - INSTALACION BLOW OFF - INSTALACION INTAKE', 1284800, 'completada', '2022-09-01');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 829: OT 1979
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'CRISTOBAL PEREZ' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'CRISTOBAL PEREZ', '17942093-7', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'KWCZ37' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'KWCZ37', 'BMW', '120I', 2018, 'S/C', 52) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '1979', 'KWCZ37', 'INSTALACION DIFUSOR SALIDA DOBLE - INSTALACION LINEA (MEDIA) DOLE SALIDA', 'INSTALACION DIFUSOR SALIDA DOBLE - INSTALACION LINEA (MEDIA) DOLE SALIDA', 164900, 'completada', '2022-09-01');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 830: OT 1980
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'ALEJANDRO JERES' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'ALEJANDRO JERES', '17521866-1', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'WT9644' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'WT9644', 'SUBARU', 'LEGACY', 2007, 'S/C', 115) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '1980', 'WT9644', 'ROTAR FLANGE ZONA CENTRAL', 'ROTAR FLANGE ZONA CENTRAL', 40000, 'completada', '2026-01-01');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 831: OT 1981
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'FERNANDO VIERA' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'FERNANDO VIERA', '21227743-6', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'PW7909' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'PW7909', 'TOYOTA', 'YARIS', 2007, 'S/C', 0) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '1981', 'PW7909', 'FABRICACION E INSTALACION TRAMO SILENCIADOR CON BALA + COLA ESCAPE', 'FABRICACION E INSTALACION TRAMO SILENCIADOR CON BALA + COLA ESCAPE', 260000, 'completada', '2022-09-02');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 832: OT 1982
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'JUAN PABLO RAMONEDA' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'JUAN PABLO RAMONEDA', '15642110-3', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'KCRJ28' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'KCRJ28', 'BMW', '120I', 2018, 'S/C', 46877) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '1982', 'KCRJ28', 'FABRICACION AXLE BACK VIBRANT 2,5'''' + COLA ''M'' CROMO', 'FABRICACION AXLE BACK VIBRANT 2,5'''' + COLA ''M'' CROMO', 484900, 'completada', '2022-09-05');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 833: OT 1983
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'FELIPE SEPULVEDA' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'FELIPE SEPULVEDA', '15333195-2', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'LLTV32' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'LLTV32', 'VOLKSWAGEN', 'TIGUAN', 2019, 'S/C', 0) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '1983', 'LLTV32', 'INSTALACION SILENCIADOR PARA BOTAR EL SONIDO', 'INSTALACION SILENCIADOR PARA BOTAR EL SONIDO', 0, 'completada', '2022-09-05');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 834: OT 1984
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'GABRIEL MONTENEGRO' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'GABRIEL MONTENEGRO', '17084760-1', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'PDTL25' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'PDTL25', 'SKODA', 'FABIA', 2021, 'S/C', 21335) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '1984', 'PDTL25', 'FABRICACION E INSTALACION DOWNPIPE', 'FABRICACION E INSTALACION DOWNPIPE', 389900, 'completada', '2022-09-05');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 835: OT 1985
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'JHONATAN' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'JHONATAN', '19072172-8', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'DJBV48' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'DJBV48', 'RANGE ROVER', 'SPORT', 0, 'S/C', 0) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '1985', 'DJBV48', 'INSTALACION LINEA SUPER SPRINT', 'INSTALACION LINEA SUPER SPRINT', 120000, 'completada', '2022-09-05');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 836: OT 1986
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'CARLOS VASQUEZ' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'CARLOS VASQUEZ', '18777994-4', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'NUEVA' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'NUEVA', 'FORD', 'RANGER RAPTOR', 2022, 'S/C', 0) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '1986', 'NUEVA', 'FABRICACION MEDIA LINEA CON SALIDA DOBLE + COLA 4'''' BLACK - INSTALACION SPRINT BOOTER', 'FABRICACION MEDIA LINEA CON SALIDA DOBLE + COLA 4'''' BLACK - INSTALACION SPRINT BOOTER', 814900, 'completada', '2022-09-06');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 837: OT 1987
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'FERNANDO TURRICO' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'FERNANDO TURRICO', '17267243-4', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'CFWJ68' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'CFWJ68', 'AUDI', 'A4', 0, 'S/C', 0) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '1987', 'CFWJ68', 'INSTALACION  CATALITICO ALTO FLUJO MAGNAFLOW', 'INSTALACION  CATALITICO ALTO FLUJO MAGNAFLOW', 299900, 'completada', '2022-09-07');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 838: OT 1988
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'ANTONIO URIBE' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'ANTONIO URIBE', '17701352-8', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'JCDR95' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'JCDR95', 'CHEVROLET', 'SILVERADO', 2017, 'S/C', 101) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '1988', 'JCDR95', 'INSTALACION CLAMP 3''''', 'INSTALACION CLAMP 3''''', 70000, 'completada', '2022-09-07');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 839: OT 1989
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'PABLO SOTO' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'PABLO SOTO', '14362993-7', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'KBWG90' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'KBWG90', 'VOLKSWAGEN', 'SOVEIRO', 2018, 'S/C', 0) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '1989', 'KBWG90', 'MUFFLER REAR DELETE + COLA 3,5'' RENUS TRAMO EN INOX TIG', 'MUFFLER REAR DELETE + COLA 3,5'' RENUS TRAMO EN INOX TIG', 169900, 'completada', '2022-09-07');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 840: OT 1990
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'VICENTE VILLALOBOS' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'VICENTE VILLALOBOS', '18395627-2', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'PGLR64' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'PGLR64', 'BMW', 'M 240', 2020, 'S/C', 17000) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '1990', 'PGLR64', 'INSTALACCION COLA ESCAPE BLACK (TRAE CLIENTE)', 'INSTALACCION COLA ESCAPE BLACK (TRAE CLIENTE)', 60000, 'completada', '2022-09-09');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 841: OT 1991
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'OMAR CHAVEZ' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'OMAR CHAVEZ', '20969370-4', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'GBHS92' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'GBHS92', 'BMW', '116', 2014, 'S/C', 130) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '1991', 'GBHS92', 'AXLE BACK DUAL COLA CROMO 3,5''''', 'AXLE BACK DUAL COLA CROMO 3,5''''', 319900, 'completada', '2022-09-12');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 842: OT 1992
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'DAGUBERTO CACERES' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'DAGUBERTO CACERES', '16984301-5', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'JDZB19' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'JDZB19', 'SUBARU', 'STI', 2017, 'S/C', 77000) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '1992', 'JDZB19', 'LINEA COMPLETA INOX + SILENCIADOR MAGNAFLOW 1 ENTRADA 2 SALIDAS + COLA ESCAPE DUAL CROMO - CATALITICO MAGNAFLOW', 'LINEA COMPLETA INOX + SILENCIADOR MAGNAFLOW 1 ENTRADA 2 SALIDAS + COLA ESCAPE DUAL CROMO - CATALITICO MAGNAFLOW', 1473900, 'completada', '2022-09-12');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 843: OT 1993
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'NICOLAS HERNANDEZ' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'NICOLAS HERNANDEZ', '18114849-7', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'JXJD62' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'JXJD62', 'BMW', '120I', 2018, 'S/C', 55) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '1993', 'JXJD62', 'AXLE BACK CON VIBRANT UQ 2,5'''' ALTO FLUJO CON ''Y'' PARA MANTENER LAS 2 COLAS', 'AXLE BACK CON VIBRANT UQ 2,5'''' ALTO FLUJO CON ''Y'' PARA MANTENER LAS 2 COLAS', 380000, 'completada', '2022-09-12');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 844: OT 1994
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'DIEGO TAPIA' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'DIEGO TAPIA', '18048478-7', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'HCJC92' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'HCJC92', 'FORD', 'MUSTANG GT', 2005, 'S/C', 109600) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '1994', 'HCJC92', 'FABRICACION XPIPE CENTRAL + ZONA TRASERA MANTIENE SILENCIADORES - INSTALACION MULTIPLE - REPROGRAMACION', 'FABRICACION XPIPE CENTRAL + ZONA TRASERA MANTIENE SILENCIADORES - INSTALACION MULTIPLE - REPROGRAMACION', 1080000, 'completada', '2022-09-12');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 845: OT 1995
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'ALEXIS GANDARA' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'ALEXIS GANDARA', '18091970-8', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'SIN PATENTE' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'SIN PATENTE', 'FORD', 'MACLA 1', 2023, 'S/C', 600) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '1995', 'SIN PATENTE', 'FABRICACION E INSTALACION DE XPIPE CENTRAL', 'FABRICACION E INSTALACION DE XPIPE CENTRAL', 319900, 'completada', '2022-09-14');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 846: OT 1996
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'CLIENTE GENERICO' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'CLIENTE GENERICO', '', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'RT3599' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'RT3599', 'CHEVROLET', 'TAHOE', 0, 'S/C', 0) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '1996', 'RT3599', 'INSTALACION SILENCIADOR PEQUEÑO (TRAE CLIENTE)', 'INSTALACION SILENCIADOR PEQUEÑO (TRAE CLIENTE)', 110000, 'completada', '2022-09-14');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 847: OT 1997
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'CLIENTE GENERICO' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'CLIENTE GENERICO', '', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'RDDB84' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'RDDB84', 'VOLKSWAGEN', 'SAVEIRO CROSS', 2021, 'S/C', 0) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '1997', 'RDDB84', 'FABRICACION SALIDA COSTADO IZQUIERDA MANTIENE SILENCIADOR', 'FABRICACION SALIDA COSTADO IZQUIERDA MANTIENE SILENCIADOR', 165000, 'completada', '2022-09-15');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 848: OT 1998
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'LEONARDO PAILLANAO SOTO' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'LEONARDO PAILLANAO SOTO', '14125772-2', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'HLKZ64' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'HLKZ64', 'DODGE', 'CHALLENGER SRT', 2016, 'S/C', 43) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '1998', 'HLKZ64', 'INSTALACION MULTIPLE ESCAPE - FABRICACION LINEA COMPLETA DOBLE + COLA 4'''' DOBL - FABRICACION CANISTER (SOPORTE) - INSTALACION RESONADO CENTRAL', 'INSTALACION MULTIPLE ESCAPE - FABRICACION LINEA COMPLETA DOBLE + COLA 4'''' DOBL - FABRICACION CANISTER (SOPORTE) - INSTALACION RESONADO CENTRAL', 0, 'completada', '2022-09-20');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 849: OT 1999
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'LEON OSSES' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'LEON OSSES', '19438526-9', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'FBPV92' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'FBPV92', 'VOLKSWAGEN', 'MK6', 2012, 'S/C', 140) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '1999', 'FBPV92', 'FABRICACION LINEA COMPLETA + RESONADOR CENTRAL CON ''Y'' FINAL', 'FABRICACION LINEA COMPLETA + RESONADOR CENTRAL CON ''Y'' FINAL', 769900, 'completada', '2022-09-20');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 850: OT 2000
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'GABRIEL OLMOS RAMIREZ' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'GABRIEL OLMOS RAMIREZ', '17977981-1', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'HJZJ44' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'HJZJ44', 'AUDI', 'A3', 2015, 'S/C', 160) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '2000', 'HJZJ44', 'FABRICACION DOWNPIPE - INSTALACION RESONADOR CENTRAL - INSTALACION SILENCIADOR ORIGINAL', 'FABRICACION DOWNPIPE - INSTALACION RESONADOR CENTRAL - INSTALACION SILENCIADOR ORIGINAL', 699700, 'completada', '2022-09-20');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 851: OT 2001
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'LARRE MONASTERIO' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'LARRE MONASTERIO', '16953017-3', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'SIN PATENTE' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'SIN PATENTE', 'CHEVROLET', 'SILVERADO', 2023, 'S/C', 0) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '2001', 'SIN PATENTE', 'INSTALACION SILENCIADOR MAGNAFLOW 3''''', 'INSTALACION SILENCIADOR MAGNAFLOW 3''''', 299900, 'completada', '2022-09-23');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 852: OT 2002
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'EDWIN AGUIREZ' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'EDWIN AGUIREZ', '15360095-3', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'PLWW80' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'PLWW80', 'SUZUKI', 'SWIFT SPORT', 2021, 'S/C', 0) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '2002', 'PLWW80', 'FABRICACION TRAMO FLANCHE + VIBRANT EXHAUST, RESCATA SU COLA ESCAPE', 'FABRICACION TRAMO FLANCHE + VIBRANT EXHAUST, RESCATA SU COLA ESCAPE', 299900, 'completada', '2022-09-26');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 853: OT 2003
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'GABRIEL MONTENEGRO' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'GABRIEL MONTENEGRO', '17084700-1', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'PDTZ25' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'PDTZ25', 'SKODA', 'FABIA', 2021, 'S/C', 0) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '2003', 'PDTZ25', 'INSTALACION CATALITICO - FABRICACION MEDIA LUNA + RESONADOR + ALTO FLUJO, SIN COLA ESCAPE', 'INSTALACION CATALITICO - FABRICACION MEDIA LUNA + RESONADOR + ALTO FLUJO, SIN COLA ESCAPE', 774900, 'completada', '2022-09-26');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 854: OT 2004
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'CARLOS HERNANDEZ' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'CARLOS HERNANDEZ', '19111677-1', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'LTYC96' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'LTYC96', 'VOLKSWAGEN', 'GTI', 0, 'S/C', 0) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '2004', 'LTYC96', 'INSTALACION SILENCIADOR ORIGINAL', 'INSTALACION SILENCIADOR ORIGINAL', 79900, 'completada', '2026-01-01');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 855: OT 2005
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'ANDY ROJAS' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'ANDY ROJAS', '19184248-0', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'HVXF95' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'HVXF95', 'MAZDA', '6', 2016, 'S/C', 42) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '2005', 'HVXF95', 'REPRO STAGE 2 - INSTALACION SPRINBOOSTER - FABRICACION AXLE BACK VIBRANT + COLA BLACK 4''''', 'REPRO STAGE 2 - INSTALACION SPRINBOOSTER - FABRICACION AXLE BACK VIBRANT + COLA BLACK 4''''', 1164700, 'completada', '2022-09-27');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 856: OT 2006
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'MATIAS BUSTAMANTE' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'MATIAS BUSTAMANTE', '20214759-3', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'CDYS69' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'CDYS69', 'MINI', 'COOPER', 2009, 'S/C', 109201) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '2006', 'CDYS69', 'FABRICACION AXLE BACK VIBRANT + COLA 4'''' BLACK (MANTIENE COLAS)', 'FABRICACION AXLE BACK VIBRANT + COLA 4'''' BLACK (MANTIENE COLAS)', 319900, 'completada', '2022-09-27');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 857: OT 2007
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'ANDRES SANTIBAÑEZ' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'ANDRES SANTIBAÑEZ', '19153065-9', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'KPWK54' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'KPWK54', 'NISSAN', '350Z', 0, 'S/C', 0) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '2007', 'KPWK54', 'INSTALACION SILENCIADOR AÑTO FLUJO FLOWMASTER (TRAE CLIENTE)', 'INSTALACION SILENCIADOR AÑTO FLUJO FLOWMASTER (TRAE CLIENTE)', 180000, 'completada', '2022-09-27');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 858: OT 2008
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'HUGO VILLAREAL' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'HUGO VILLAREAL', '15125333-4', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'JTYW57' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'JTYW57', 'AUDI', 'A5', 2017, 'S/C', 38) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '2008', 'JTYW57', 'FABRICACION LINEA COMPLETA INOX + SILENCIADORES VIBRANT EXHAUST + COLA 4'''' CROMO', 'FABRICACION LINEA COMPLETA INOX + SILENCIADORES VIBRANT EXHAUST + COLA 4'''' CROMO', 909900, 'completada', '2022-09-27');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;

    RAISE NOTICE 'Bloque finalizado con éxito.';
END $$;