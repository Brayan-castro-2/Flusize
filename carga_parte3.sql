DO $$
DECLARE
    v_taller_id UUID := 'e55ce6be-7b8c-4a1a-b333-666333666333';
    v_cliente_id UUID;
    v_vehiculo_id UUID;
BEGIN
    RAISE NOTICE 'Iniciando carga de bloque...';
    -- Fila 859: OT 2009
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'CLIENTE GENERICO' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'CLIENTE GENERICO', '', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'JYYX50' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'JYYX50', 'FORD', 'RAPTOR', 0, 'S/C', 0) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '2009', 'JYYX50', 'REMOVER PRESILENCIADOR, (MAL ESTADO)', 'REMOVER PRESILENCIADOR, (MAL ESTADO)', 149900, 'completada', '2022-09-28');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 860: OT 2010
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'HUGO HAZARD' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'HUGO HAZARD', '15434473-3', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'LDBV57' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'LDBV57', 'DODGE', 'RAM 1500', 2019, 'S/C', 106000) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '2010', 'LDBV57', 'FABRICACION DOWNPIPE - INSTALACION ALTO FLUJO (MUFLER DELETE) SPRINTBOOSTER - REPRO STAGE 2 (DPF, EGR, ADBLUE, OFF)', 'FABRICACION DOWNPIPE - INSTALACION ALTO FLUJO (MUFLER DELETE) SPRINTBOOSTER - REPRO STAGE 2 (DPF, EGR, ADBLUE, OFF)', 1779900, 'completada', '2022-09-28');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 861: OT 2011
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'JUAN CARLOS CANALES' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'JUAN CARLOS CANALES', '20640925-8', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'JTZT25' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'JTZT25', 'BMW', '530I', 2017, 'S/C', 46) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '2011', 'JTZT25', 'ZONA TRASERA LIBRE + COLA NEGRA 4''''', 'ZONA TRASERA LIBRE + COLA NEGRA 4''''', 339900, 'completada', '2022-09-29');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 862: OT 2012
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'CRISTIAN BRAVO' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'CRISTIAN BRAVO', '16589394-8', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'CKYD26' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'CKYD26', 'MINI', 'COOPER', 2010, 'S/C', 0) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '2012', 'CKYD26', 'FABRICACION AXLE BACK + BALA 2,5'''' - REMOVER SILENCIADOR CENTRAL', 'FABRICACION AXLE BACK + BALA 2,5'''' - REMOVER SILENCIADOR CENTRAL', 0, 'completada', '2022-09-30');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 863: OT 2013
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'PEDRO' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'PEDRO', '19594297-8', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'SIN-PAT' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'SIN-PAT', 'NISSAN', '350Z', 0, 'S/C', 93) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '2013', 'SIN-PAT', 'FABRICACION AXLE BACK + VIBRANT 2,5'''' + COLA 4'''' NEGRA', 'FABRICACION AXLE BACK + VIBRANT 2,5'''' + COLA 4'''' NEGRA', 539900, 'completada', '2022-09-30');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 864: OT 2014
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'CRISTIAN BRAVO' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'CRISTIAN BRAVO', '16589394-8', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'CKYD26' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'CKYD26', 'MINI', 'COOPER', 2010, 'S/C', 0) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '2014', 'CKYD26', 'AXLE BACK + BALA 2,5'''' + COLA ESCAPE CROMO', 'AXLE BACK + BALA 2,5'''' + COLA ESCAPE CROMO', 324900, 'completada', '2022-09-30');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 865: OT 2015
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'MAXIMILIANO ACUÑA' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'MAXIMILIANO ACUÑA', '15640470-5', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'SIN-PAT' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'SIN-PAT', 'DODGE', 'RAM 1500', 2022, 'S/C', 0) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '2015', 'SIN-PAT', 'REMOVER SILENCIADOR TRASERO', 'REMOVER SILENCIADOR TRASERO', 120000, 'completada', '2022-10-03');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 866: OT 2016
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'ERIC POOLEY' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'ERIC POOLEY', '19322943-3', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'SIN-PAT' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'SIN-PAT', 'CHEVROLET', 'COLORADO', 2010, 'S/C', 151000) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '2016', 'SIN-PAT', 'INSTALACION SILENCIADOR BORLA', 'INSTALACION SILENCIADOR BORLA', 299900, 'completada', '2022-10-04');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 867: OT 2017
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'RENATO JIMENEZ' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'RENATO JIMENEZ', '20972449-8', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'RDXR48' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'RDXR48', 'SUBARU', 'SWIFT SPORT', 2022, 'S/C', 15) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '2017', 'RDXR48', 'FABRICACION DOWNPIPE - REPRO STAGE 2', 'FABRICACION DOWNPIPE - REPRO STAGE 2', 779900, 'completada', '2022-10-05');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 868: OT 2018
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'ALEX ALFONSO' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'ALEX ALFONSO', '27137311-2', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'LZDW63' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'LZDW63', 'CHEVROLET', 'SILVERADO', 2020, 'S/C', 25) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '2018', 'LZDW63', 'REMOVER SILENCIADOR CENTRAL', 'REMOVER SILENCIADOR CENTRAL', 120000, 'completada', '2022-10-06');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 869: OT 2019
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'DANIEL SILVA LOPEZ' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'DANIEL SILVA LOPEZ', '19823650-0', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'LKTK15' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'LKTK15', 'VOLKSWAGEN', 'GOLF GTI', 2019, 'S/C', 58) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '2019', 'LKTK15', 'LINEA COMPLETA 3'''' + SILENCIADOR ALTO FLUJO + COLA 4'''' - DOWNPIPE FABRICACION E INSTALACION - REPRO STAGE 2 + POPS AND BANG', 'LINEA COMPLETA 3'''' + SILENCIADOR ALTO FLUJO + COLA 4'''' - DOWNPIPE FABRICACION E INSTALACION - REPRO STAGE 2 + POPS AND BANG', 1669700, 'completada', '2022-10-06');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 870: OT 2020
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'JUAN PABLO ALVEAR' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'JUAN PABLO ALVEAR', '18379914-2', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'GGLZ54' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'GGLZ54', 'BMW', '116I', 2014, 'S/C', 64118) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '2020', 'GGLZ54', 'DOWNPIPE - LINEA COMPLETA INOX + SILENCIADOR ALTO FLUJO VIBRANT + DUAL COLA  3,5'''' C/CORTE DIFUSOR  - REPRO ECU STAGE 2', 'DOWNPIPE - LINEA COMPLETA INOX + SILENCIADOR ALTO FLUJO VIBRANT + DUAL COLA  3,5'''' C/CORTE DIFUSOR  - REPRO ECU STAGE 2', 1549700, 'completada', '2022-10-06');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 871: OT 2021
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'EDGAR SIDBONET' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'EDGAR SIDBONET', '16652988-3', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'LFJV11' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'LFJV11', 'SUBARU', 'STI', 2011, 'S/C', 60) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '2021', 'LFJV11', 'INSTALACION ALTO FLUJO VIBRANT - INSTALACION CATALITICO ALTO FLUJO MAGNAFLOW', 'INSTALACION ALTO FLUJO VIBRANT - INSTALACION CATALITICO ALTO FLUJO MAGNAFLOW', 460000, 'completada', '2022-10-11');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 872: OT 2022
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'FRANCISCO' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'FRANCISCO', '', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'PZHY36' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'PZHY36', 'FORD', 'SHELBY HENNESSEY', 2021, 'S/C', 0) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '2022', 'PZHY36', 'FABRICACION TRAMO CATALITICO (FLANCHE A FLEXIBLE) + BOSSSHINE 4 NUEVOS', 'FABRICACION TRAMO CATALITICO (FLANCHE A FLEXIBLE) + BOSSSHINE 4 NUEVOS', 320000, 'completada', '2022-10-11');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 873: OT 2023
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'CLIENTE GENERICO' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'CLIENTE GENERICO', '', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'KFHJ49' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'KFHJ49', 'HYUNDAY', 'J10', 0, 'S/C', 0) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '2023', 'KFHJ49', 'REPARACION Y CAMBIO DE CLAM (SECTOR MULTIPLE Y LINEAL', 'REPARACION Y CAMBIO DE CLAM (SECTOR MULTIPLE Y LINEAL', 80000, 'completada', '2022-10-11');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 874: OT 2024
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'DIEGO ANGLES' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'DIEGO ANGLES', '20598433-K', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'KBGW17' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'KBGW17', 'OPEL', 'ASTRA OPC', 2017, 'S/C', 28600) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '2024', 'KBGW17', 'LINEA COMPLETA INOX + VIBRANT EXHAUST', 'LINEA COMPLETA INOX + VIBRANT EXHAUST', 649900, 'completada', '2022-10-12');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 875: OT 2025
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'CRISTHOFER BASOALTO' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'CRISTHOFER BASOALTO', '20589092-0', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'PBDZ66' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'PBDZ66', 'SUZUKI', 'SWIFT', 2022, 'S/C', 0) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '2025', 'PBDZ66', 'INSTALACION VITRA QUIET - REPARACION SOLDADURA', 'INSTALACION VITRA QUIET - REPARACION SOLDADURA', 340000, 'completada', '2022-10-13');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 876: OT 2026
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'HUGO PEREZ' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'HUGO PEREZ', '16369483-2', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'KVTX44' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'KVTX44', 'VOLKSWAGEN', 'GOLF R', 2019, 'S/C', 72) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '2026', 'KVTX44', 'REMOVER RESONADOR CENTRAL', 'REMOVER RESONADOR CENTRAL', 110000, 'completada', '2022-10-13');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 877: OT 2027
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'HUGO VILLAREAL' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'HUGO VILLAREAL', '15125333-4', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'JTYW57' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'JTYW57', 'AUDI', 'A5', 2017, 'S/C', 0) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '2027', 'JTYW57', 'INSTALACION SILENCIADOR ORIGINAL - FABRICACION Y MONTAJE ANTIDRONE', 'INSTALACION SILENCIADOR ORIGINAL - FABRICACION Y MONTAJE ANTIDRONE', 169900, 'completada', '2022-10-13');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 878: OT 2028
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'LEONCIO' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'LEONCIO', '18077362-2', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'GSDV77' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'GSDV77', 'BMW', '135I', 2014, 'S/C', 0) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '2028', 'GSDV77', 'BORLA XR1 + AXLE BACK FREE (MANTIENE COLAS)', 'BORLA XR1 + AXLE BACK FREE (MANTIENE COLAS)', 539900, 'completada', '2026-01-01');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 879: OT 2029
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'CRISTIAN MARINCOVICH' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'CRISTIAN MARINCOVICH', '8537804-K', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'GWKZ85' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'GWKZ85', 'FORD', 'FOCUS', 2015, 'S/C', 0) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '2029', 'GWKZ85', 'FABRICACION ZONA TRASERA + VIBRANT EXHAUST', 'FABRICACION ZONA TRASERA + VIBRANT EXHAUST', 600000, 'completada', '2022-10-14');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 880: OT 2030
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'LEONCIO CHACON' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'LEONCIO CHACON', '', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'SIN-PAT' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'SIN-PAT', 'BMW', '135I', 0, 'S/C', 0) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '2030', 'SIN-PAT', 'INSTALACION SILENCIADOR ALTO FLUJO COMPETICION 3'''' BORLA XR1 + CAMBIO COMPLETO DE AXLE BACK INOX MANTIENE COLAS', 'INSTALACION SILENCIADOR ALTO FLUJO COMPETICION 3'''' BORLA XR1 + CAMBIO COMPLETO DE AXLE BACK INOX MANTIENE COLAS', 539900, 'completada', '2022-10-14');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 881: OT 2031
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'FRANCISCO SOLAR' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'FRANCISCO SOLAR', '19135763-9', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'LFVH18' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'LFVH18', 'BMW', 'M140I', 2019, 'S/C', 36) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '2031', 'LFVH18', 'FABRICACION ZONA CENTRAL', 'FABRICACION ZONA CENTRAL', 319900, 'completada', '2022-10-19');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 882: OT 2032
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'RODRIGO CORNEJO' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'RODRIGO CORNEJO', '14366980-7', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'SIN-PAT' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'SIN-PAT', 'DODGE', 'RAM 1500', 2019, 'S/C', 180) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '2032', 'SIN-PAT', 'FABRICACION E INSTALACION TRAMO INOX CON SILENCIADOR BORLA 3'''' XR1 COMPETICION', 'FABRICACION E INSTALACION TRAMO INOX CON SILENCIADOR BORLA 3'''' XR1 COMPETICION', 389900, 'completada', '2022-10-19');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 883: OT 2033
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'CLIENTE GENERICO' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'CLIENTE GENERICO', '', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'SIN-PAT' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'SIN-PAT', 'S/M', 'S/M', 0, 'S/C', 0) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '2033', 'SIN-PAT', 'Carga masiva', 'Carga masiva', 0, 'completada', '2026-01-01');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 884: OT 2034
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'CRISTOBAL GONZALEZ' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'CRISTOBAL GONZALEZ', '18638679-5', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'KBCT89' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'KBCT89', 'FORD', 'FOCUS RS', 2018, 'S/C', 29) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '2034', 'KBCT89', 'INSTALACION CLAMP LINEA ORIGINAL - INSTALACION Y MODIFICACION LINEA AFTER MARLET - SENSOR O ELIMINAR CHECK INSTALADO', 'INSTALACION CLAMP LINEA ORIGINAL - INSTALACION Y MODIFICACION LINEA AFTER MARLET - SENSOR O ELIMINAR CHECK INSTALADO', 260000, 'completada', '2022-10-20');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 885: OT 2035
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'MATIAS URRIETA' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'MATIAS URRIETA', '17265388-K', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'SIN-PAT' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'SIN-PAT', 'FORD', 'F150', 2012, 'S/C', 0) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '2035', 'SIN-PAT', 'FABRICACION SALIDA DOBLE + COLA DE ESCAPE CROMO, MANTIENE SILENCIADOR', 'FABRICACION SALIDA DOBLE + COLA DE ESCAPE CROMO, MANTIENE SILENCIADOR', 560000, 'completada', '2022-10-21');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 886: OT 2036
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'CLIENTE GENERICO' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'CLIENTE GENERICO', '', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'SIN-PAT' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'SIN-PAT', 'S/M', 'S/M', 0, 'S/C', 0) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '2036', 'SIN-PAT', 'Carga masiva', 'Carga masiva', 0, 'completada', '2026-01-01');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 887: OT 2037
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'SEBASTIAN RAIREZ' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'SEBASTIAN RAIREZ', '21312184-1', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'CWLS49' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'CWLS49', 'AUDI', 'RS5', 2011, 'S/C', 0) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '2037', 'CWLS49', 'INSTALACION SILENCIADOR VIBRANT EXHAUST, REMUEVE DE BMW X6', 'INSTALACION SILENCIADOR VIBRANT EXHAUST, REMUEVE DE BMW X6', 280000, 'completada', '2022-10-24');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 888: OT 2038
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'SEBASTIAN RAMIREZ' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'SEBASTIAN RAMIREZ', '17150049-4', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'SIN-PAT' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'SIN-PAT', 'DUCATI', 'MULTI STRADA', 0, 'S/C', 0) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '2038', 'SIN-PAT', 'INSTALACION DB KILLOR', 'INSTALACION DB KILLOR', 45000, 'completada', '2022-10-24');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 889: OT 2039
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'EDUARDO PEREZ' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'EDUARDO PEREZ', '16210891-3', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'FFHC71' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'FFHC71', 'VOLKSWAGEN', 'PASSAT', 2013, 'S/C', 0) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '2039', 'FFHC71', 'INSTALACION SISTEMA CUT OUT', 'INSTALACION SISTEMA CUT OUT', 349900, 'completada', '2022-10-25');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 890: OT 2040
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'SEBASTIAN' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'SEBASTIAN', '', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'LVKJ49' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'LVKJ49', 'SUZUKI', 'SWIFT SPORT', 0, 'S/C', 0) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '2040', 'LVKJ49', 'INSTALACION SISTEMA CUT OUT', 'INSTALACION SISTEMA CUT OUT', 349900, 'completada', '2026-01-01');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 891: OT 2041
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'BRUNO' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'BRUNO', '', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'SIN-PAT' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'SIN-PAT', 'AUDI', 'RS5', 2015, 'S/C', 0) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '2041', 'SIN-PAT', 'STRAIGHT CENTRAL, TRAMO DIRECTO ZONA INTERNA CORTE Y REVISION SILENCIADOR TRASERO IZP', 'STRAIGHT CENTRAL, TRAMO DIRECTO ZONA INTERNA CORTE Y REVISION SILENCIADOR TRASERO IZP', 239900, 'completada', '2022-10-25');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 892: OT 2042
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'MICHAEL' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'MICHAEL', '16562471-8', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'KTKL66' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'KTKL66', 'FORD', 'F150', 2018, 'S/C', 60) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '2042', 'KTKL66', 'INSTALACION CUT OUT 3'''' - REINSTALACION DE SILENCIADOR ORIGINAL', 'INSTALACION CUT OUT 3'''' - REINSTALACION DE SILENCIADOR ORIGINAL', 349900, 'completada', '2022-10-27');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 893: OT 2043
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'DIEGO ROJAS' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'DIEGO ROJAS', '19010331-5', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'HKZH28' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'HKZH28', 'MERCEDES', 'A45', 2017, 'S/C', 0) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '2043', 'HKZH28', 'INSTALACION VIBRANT ZONA CENTRAL - FABRICACION AXLE BACK FREE', 'INSTALACION VIBRANT ZONA CENTRAL - FABRICACION AXLE BACK FREE', 390000, 'completada', '2022-10-27');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 894: OT 2044
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'MATIAS TRUJILLO' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'MATIAS TRUJILLO', '16382096-K', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'HVRH47' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'HVRH47', 'VOLKSWAGEN', 'GOLF R32', 0, 'S/C', 0) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '2044', 'HVRH47', 'REMOVER SILENCIADOR CENTRAL - NUEVA POSTURA COLAS DE ESCAPE', 'REMOVER SILENCIADOR CENTRAL - NUEVA POSTURA COLAS DE ESCAPE', 115000, 'completada', '2022-10-27');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 895: OT 2046
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'GABRIEL OLMOS' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'GABRIEL OLMOS', '17977981-1', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'HJZJ44' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'HJZJ44', 'AUDI', 'A3', 2015, 'S/C', 0) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '2046', 'HJZJ44', 'INSTALACION SISTEMA CUT OUT', 'INSTALACION SISTEMA CUT OUT', 349900, 'completada', '2022-10-28');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 896: OT 2047
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'MATIAS OVALLE' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'MATIAS OVALLE', '17872384-7', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'PJYY37' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'PJYY37', 'CHEVROLET', 'SILVERADO', 2021, 'S/C', 14) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '2047', 'PJYY37', 'FABRICACION LINEA COMPLETA DOBLE SALIDA + COLA CORSA CROMO + SILENCIADOR BORLA PROXS', 'FABRICACION LINEA COMPLETA DOBLE SALIDA + COLA CORSA CROMO + SILENCIADOR BORLA PROXS', 859900, 'completada', '2022-10-28');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 897: OT 2048
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'SEBASTIAN PEREZ' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'SEBASTIAN PEREZ', '18571061-0', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'FZYJ55' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'FZYJ55', 'MERCEDES', 'CLA 200', 2014, 'S/C', 0) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '2048', 'FZYJ55', 'CARGA MAPA STOCK - ISNTALACION DOWNPIPE ORIGINAL (CATALITICO)', 'CARGA MAPA STOCK - ISNTALACION DOWNPIPE ORIGINAL (CATALITICO)', 139900, 'completada', '2022-10-28');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 898: OT 2049
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'JAVIER TORO' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'JAVIER TORO', '20336776-7', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'LSLG87' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'LSLG87', 'BMW', '420I', 2019, 'S/C', 24) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '2049', 'LSLG87', 'FABRICACION E INSTALACION DOWNPIPE + LINEA + SILENCIADOR ALTO FLUJO VIBRANT + COLA NUEVAS', 'FABRICACION E INSTALACION DOWNPIPE + LINEA + SILENCIADOR ALTO FLUJO VIBRANT + COLA NUEVAS', 1059800, 'completada', '2022-11-02');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 899: OT 2050
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'LUIS ULLOA' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'LUIS ULLOA', '', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'JZFD30' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'JZFD30', 'CHEVROLET', 'SILVERADO', 0, 'S/C', 83326) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '2050', 'JZFD30', 'NUEVO TRAMO (ZONA IZQUIERDA)SILVERADO', 'NUEVO TRAMO (ZONA IZQUIERDA)SILVERADO', 149900, 'completada', '2022-11-03');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 900: OT 2051
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'CARLOS PINEDA' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'CARLOS PINEDA', '14302109-2', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'SIN-PAT' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'SIN-PAT', 'CHEVROLET', 'C10', 1977, 'S/C', 0) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '2051', 'SIN-PAT', 'FABRICACION LINEA COMPLETA INOX 2,5''''+ SILENCIADOR ALTO FLUJO BORLA PROXS CON SOPORTES NUEVOS - ZONA CENTRAL CON XPIPE PORTA SENSOR', 'FABRICACION LINEA COMPLETA INOX 2,5''''+ SILENCIADOR ALTO FLUJO BORLA PROXS CON SOPORTES NUEVOS - ZONA CENTRAL CON XPIPE PORTA SENSOR', 1170000, 'completada', '2022-11-03');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    RAISE NOTICE 'Procesados 900 registros...';
    -- Fila 901: OT 2052
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'FRANCISCO BASTIAN' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'FRANCISCO BASTIAN', '16193558-1', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'GXDS55' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'GXDS55', 'MAZDA', 'BT50', 2019, 'S/C', 130) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '2052', 'GXDS55', 'FABRICACION E INSTALACION DOWNPIPE', 'FABRICACION E INSTALACION DOWNPIPE', 320000, 'completada', '2022-11-07');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 902: OT 2053
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'JIMMY PONCE' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'JIMMY PONCE', '21412491-2', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'RYPF69' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'RYPF69', 'GEELY', 'COOLRAY', 2023, 'S/C', 9) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '2053', 'RYPF69', 'FABRICACION ZONA TRASERA CON VIBRANT EXHAUST + COLA DUAL 3,5''''', 'FABRICACION ZONA TRASERA CON VIBRANT EXHAUST + COLA DUAL 3,5''''', 699900, 'completada', '2022-11-07');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 903: OT 2054
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'SEBASTIAN TORRESON' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'SEBASTIAN TORRESON', '18975033-1', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'RZWY54' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'RZWY54', 'DODGE', 'CHALLENGER', 2023, 'S/C', 7489) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '2054', 'RZWY54', 'FABRICACION LINEA COMPLETA DOBLE CON SILENCIADOR ALTO FLUJO BORLA PROXS + COLA DUAL CUADRADA', 'FABRICACION LINEA COMPLETA DOBLE CON SILENCIADOR ALTO FLUJO BORLA PROXS + COLA DUAL CUADRADA', 1200000, 'completada', '2022-11-07');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 904: OT 2055
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'JAVIER TORO' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'JAVIER TORO', '20336776-7', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'LSLG87' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'LSLG87', 'BMW', '420', 2019, 'S/C', 24) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '2055', 'LSLG87', 'REPROGRAMACION STAGE 2 +91HP + 168NM', 'REPROGRAMACION STAGE 2 +91HP + 168NM', 1034800, 'completada', '2022-11-08');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 905: OT 2056
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'MATIAS BARRIOS MORALES' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'MATIAS BARRIOS MORALES', '19143161-4', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'HZCP85' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'HZCP85', 'HONDA', 'HRV', 2016, 'S/C', 60) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '2056', 'HZCP85', 'FABRICACION ZONA TRASERA + COLA 3,5'''' BLACK', 'FABRICACION ZONA TRASERA + COLA 3,5'''' BLACK', 279900, 'completada', '2022-11-08');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 906: OT 2057
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'IVAN PIZARRO     NULO' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'IVAN PIZARRO     NULO', '8397330-7', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'RVTJ33' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'RVTJ33', 'AUDI', 'Q3', 2023, 'S/C', 9809) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '2057', 'RVTJ33', 'INSTALACION CUT OUT (TRAE CLIENTE)', 'INSTALACION CUT OUT (TRAE CLIENTE)', 99900, 'completada', '2022-11-11');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 907: OT 2058
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'SEBASTIAN IGNACIO' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'SEBASTIAN IGNACIO', '19428134-K', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'PTVB30' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'PTVB30', 'HYUNDAY', 'VELOSTER', 2021, 'S/C', 0) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '2058', 'PTVB30', 'FABRICACION DOWNPIPE COMPLETA + FLEXIBLE 3''''', 'FABRICACION DOWNPIPE COMPLETA + FLEXIBLE 3''''', 425000, 'completada', '2022-11-11');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 908: OT 2059
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'MICHAEL' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'MICHAEL', '', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'KTKL66' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'KTKL66', 'FORD', 'F150', 0, 'S/C', 0) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '2059', 'KTKL66', 'REMOVER SILENCIADOR CENTRAL (ORIGINAL)', 'REMOVER SILENCIADOR CENTRAL (ORIGINAL)', 110000, 'completada', '2022-11-14');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 909: OT 2060
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'SEBASTIAN TORRESON' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'SEBASTIAN TORRESON', '18975033-1', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'RZWY54' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'RZWY54', 'DODGE', 'CHALLENGER', 0, 'S/C', 7489) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '2060', 'RZWY54', 'LINEA COMPLETA DOBLE + BORLA PROXS 2,5'''' - REPROGRAMACION STAGE 1', 'LINEA COMPLETA DOBLE + BORLA PROXS 2,5'''' - REPROGRAMACION STAGE 1', 2538000, 'completada', '2026-01-01');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 910: OT 2061
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'MAXIMILIANO' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'MAXIMILIANO', '17110785-7', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'SHYH40' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'SHYH40', 'AUDI', 'TTS', 2023, 'S/C', 0) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '2061', 'SHYH40', 'REMOVER SILENCIADOR CENTRAL (PEQUEÑO)', 'REMOVER SILENCIADOR CENTRAL (PEQUEÑO)', 70000, 'completada', '2022-11-14');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 911: OT 2062
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'FELIPE PRADO' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'FELIPE PRADO', '15592776-3', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'GHVF57' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'GHVF57', 'AUDI', 'RS4', 2014, 'S/C', 0) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '2062', 'GHVF57', 'FABRICACION DOBLE TRAMO LINEA INOX PARA SUPRIMIR SILENCIADOR', 'FABRICACION DOBLE TRAMO LINEA INOX PARA SUPRIMIR SILENCIADOR', 299900, 'completada', '2022-11-15');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 912: OT 2063
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'ALEJANDRO MUÑOS' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'ALEJANDRO MUÑOS', '19563171-9', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'GTVB84' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'GTVB84', 'AUDI', 'A4', 2014, 'S/C', 78) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '2063', 'GTVB84', 'INSTALACION SISTEMA CUT OUT', 'INSTALACION SISTEMA CUT OUT', 349900, 'completada', '2022-11-15');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 913: OT 2064
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'IVAN PIZARRO' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'IVAN PIZARRO', '8397330-7', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'RVTJ33' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'RVTJ33', 'AUDI', 'Q3', 2023, 'S/C', 10111) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '2064', 'RVTJ33', 'INSTALACION CUT OUT (TRAE CLIENTE)', 'INSTALACION CUT OUT (TRAE CLIENTE)', 99900, 'completada', '2026-01-01');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 914: OT 2065
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'NICOLAS MAURICIO' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'NICOLAS MAURICIO', '', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'SIN-PAT' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'SIN-PAT', 'BMW', '120I', 0, 'S/C', 0) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '2065', 'SIN-PAT', 'INSTALACION DIFUSOR SALIDA DOBLE - FABRICACION AXLE BACK (CLIENTE TRAE COLAS)', 'INSTALACION DIFUSOR SALIDA DOBLE - FABRICACION AXLE BACK (CLIENTE TRAE COLAS)', 364900, 'completada', '2026-01-01');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 915: OT 2066
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'GUILLERMO VALENZUELA' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'GUILLERMO VALENZUELA', '15316653-6', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'LBSP25' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'LBSP25', 'FORD', 'FOCUS', 2018, 'S/C', 0) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '2066', 'LBSP25', 'INSTALACION LINEA FOCUS (TRAE CLIENTE)', 'INSTALACION LINEA FOCUS (TRAE CLIENTE)', 99900, 'completada', '2022-11-16');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 916: OT 2067
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'RUBEN MARABOLI' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'RUBEN MARABOLI', '13981995-0', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'SIN-PAT' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'SIN-PAT', 'S/M', 'S/M', 2021, 'S/C', 0) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '2067', 'SIN-PAT', 'MODIFICACION SALIDA ESCAPE, REMUEVE SILENCIADOR ORIGINAL - SALIDA DOBLE RECTA', 'MODIFICACION SALIDA ESCAPE, REMUEVE SILENCIADOR ORIGINAL - SALIDA DOBLE RECTA', 0, 'completada', '2022-11-17');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 917: OT 2068
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'ARIEL ORELLANA' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'ARIEL ORELLANA', '15113762-8', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'JCPR56' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'JCPR56', 'MINI', 'COOPERS', 2017, 'S/C', 0) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '2068', 'JCPR56', 'REPARACION FISURA ZONA SILENCIADOOR', 'REPARACION FISURA ZONA SILENCIADOOR', 45000, 'completada', '2022-11-17');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 918: OT 2069
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'FELIPE FERNANDEZ' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'FELIPE FERNANDEZ', '15642585-0', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'YT6829' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'YT6829', 'JEEP', 'GRANGLER', 2005, 'S/C', 111) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '2069', 'YT6829', 'LINEA COMPLETA + SILENCIADOR ALTO FLUJO BORLA EXHAUST 2,5'''' SIN COLA ESCAPE', 'LINEA COMPLETA + SILENCIADOR ALTO FLUJO BORLA EXHAUST 2,5'''' SIN COLA ESCAPE', 589900, 'completada', '2022-11-21');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 919: OT 2070
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'FELIPE ROLDAN' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'FELIPE ROLDAN', '19841213-9', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'VD1827' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'VD1827', 'BMW', '540I', 2002, 'S/C', 151840) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '2070', 'VD1827', 'INSTALACION DIFUSOR TRASERO + SALIDA 4 COLAS', 'INSTALACION DIFUSOR TRASERO + SALIDA 4 COLAS', 539900, 'completada', '2022-11-22');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 920: OT 2071
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'CLIENTE GENERICO' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'CLIENTE GENERICO', '', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'LTLD28' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'LTLD28', 'FORD', 'F150', 2020, 'S/C', 0) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '2071', 'LTLD28', 'INSTALACION SISTEMA CUT OUT', 'INSTALACION SISTEMA CUT OUT', 349900, 'completada', '2026-01-01');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 921: OT 2072
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'GASPAR YUDICH' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'GASPAR YUDICH', '19079899-K', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'HWSZ53' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'HWSZ53', 'VOLKSWAGEN', 'GTI', 2016, 'S/C', 48) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '2072', 'HWSZ53', 'FABRICACION LINEA COMPLETA INOX + SILENCIADOR MAGNAFLOW + COLA 4''''', 'FABRICACION LINEA COMPLETA INOX + SILENCIADOR MAGNAFLOW + COLA 4''''', 659900, 'completada', '2022-11-24');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 922: OT 2073
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'FRANCISCO MIGLIORELLI' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'FRANCISCO MIGLIORELLI', '19079899-K', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'FX1667' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'FX1667', 'BMW', 'C21', 0, 'S/C', 0) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '2073', 'FX1667', 'INSTALACION SENSOR OXIGENO - FABRICACION LINEA COMPLETAINOX 2,5''''', 'INSTALACION SENSOR OXIGENO - FABRICACION LINEA COMPLETAINOX 2,5''''', 0, 'completada', '2022-11-24');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 923: OT 2074
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'OSCAR HAM' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'OSCAR HAM', '17673740-9', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'SJFB26' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'SJFB26', 'SILVERADO', 'XR1', 2023, 'S/C', 1) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '2074', 'SJFB26', 'INSTALACION BORLA XRM', 'INSTALACION BORLA XRM', 399900, 'completada', '2022-11-28');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 924: OT 2075
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'PAOLO ORELLANA' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'PAOLO ORELLANA', '8350273-8', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'JCGD79' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'JCGD79', 'MINI', 'F56', 2017, 'S/C', 70388) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '2075', 'JCGD79', 'LINEA + RESONADOR CENTRAL VIBRANT PERFORMANCE + ALTO FLUJO TRASERO VIBRANT + DOBLE COLA 4''''', 'LINEA + RESONADOR CENTRAL VIBRANT PERFORMANCE + ALTO FLUJO TRASERO VIBRANT + DOBLE COLA 4''''', 799900, 'completada', '2022-11-28');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 925: OT 2076
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'ROBERTO AMAYA' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'ROBERTO AMAYA', '16247312-3', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'CKRD43' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'CKRD43', 'AUDI', 'A4', 2010, 'S/C', 104) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '2076', 'CKRD43', 'FABRICACION AXLE BACK FREE + COLA DUAL 3,5''''', 'FABRICACION AXLE BACK FREE + COLA DUAL 3,5''''', 370000, 'completada', '2022-11-29');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 926: OT 2077
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'LEONARDO BRIVES' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'LEONARDO BRIVES', '15619027-6', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'RGXG20' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'RGXG20', 'CHEVROLET', 'SILVERADO', 2022, 'S/C', 16) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '2077', 'RGXG20', 'FABRICACION LINEA COMPLETA + BORLA PROXS + COLA ESCAPE DOBLE', 'FABRICACION LINEA COMPLETA + BORLA PROXS + COLA ESCAPE DOBLE', 1090000, 'completada', '2022-11-29');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 927: OT 2078
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'DANIEL RODIGUEZ' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'DANIEL RODIGUEZ', '13234861-8', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'SIN-PAT' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'SIN-PAT', 'DODGE', 'CHELLENGER', 2012, 'S/C', 0) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '2078', 'SIN-PAT', 'AXLE BACK BORLA 2,5'''' + COLA DUAL 3,5'''' CROMO', 'AXLE BACK BORLA 2,5'''' + COLA DUAL 3,5'''' CROMO', 700000, 'completada', '2022-11-29');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 928: OT 2079
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'DAVID SUAZO' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'DAVID SUAZO', '13710951-4', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'SIN-PAT' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'SIN-PAT', 'SUZUKI', 'GSXR', 2017, 'S/C', 0) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '2079', 'SIN-PAT', 'INSTALACION SISTEMA ESCAPE (TRAE CLIENTE)', 'INSTALACION SISTEMA ESCAPE (TRAE CLIENTE)', 300000, 'completada', '2022-12-01');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 929: OT 2080
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'MATIAS' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'MATIAS', '17952727-8', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'CWGY11' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'CWGY11', 'JAGUAR', 'XFR', 2011, 'S/C', 120) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '2080', 'CWGY11', 'REPROGRAMACION CUT OUT', 'REPROGRAMACION CUT OUT', 300000, 'completada', '2022-12-01');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 930: OT 2081
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'IVAN SANJUAN' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'IVAN SANJUAN', '19811604-7', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'YS2979' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'YS2979', 'AUDI', 'A3', 2005, 'S/C', 200) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '2081', 'YS2979', 'REPROGRAMACION STAGE 1', 'REPROGRAMACION STAGE 1', 245000, 'completada', '2022-12-02');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 931: OT 2082
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'PAULO EVERGREEN' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'PAULO EVERGREEN', '19955890-0', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'PDZD34' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'PDZD34', 'FORD', 'F150', 2020, 'S/C', 0) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '2082', 'PDZD34', 'INSTALACION CAMBIO DE SILENCIADOR XR1 BORLA + COLA 4,5'''' BLACK', 'INSTALACION CAMBIO DE SILENCIADOR XR1 BORLA + COLA 4,5'''' BLACK', 509900, 'completada', '2022-12-05');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 932: OT 2083
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'JOSE CHAUCONO' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'JOSE CHAUCONO', '17838852-5', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'TX9557' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'TX9557', 'BMW', '740I', 2000, 'S/C', 0) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '2083', 'TX9557', 'AXLE BACK + SILENCIADOR TIPO BORLA + COLA DOBLE', 'AXLE BACK + SILENCIADOR TIPO BORLA + COLA DOBLE', 759800, 'completada', '2022-12-06');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 933: OT 2084
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'JUAN PABLO CARVAJAL' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'JUAN PABLO CARVAJAL', '18046757-2', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'PHJL98' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'PHJL98', 'AUDI', 'A3', 2016, 'S/C', 0) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '2084', 'PHJL98', 'INSTALACION SILENCIADOR VIBRANT TIPO BORLA', 'INSTALACION SILENCIADOR VIBRANT TIPO BORLA', 220000, 'completada', '2022-12-06');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 934: OT 2085
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'BRYAN VASQUEZ' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'BRYAN VASQUEZ', '19306814-6', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'SIN-PAT' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'SIN-PAT', 'MINI', 'COOPER S', 2016, 'S/C', 52) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '2085', 'SIN-PAT', 'FABRICACION TRAMO TRASERO', 'FABRICACION TRAMO TRASERO', 319900, 'completada', '2022-12-07');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 935: OT 2086
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'RISTIAN DIAZ' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'RISTIAN DIAZ', '19586054-8', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'LN1927' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'LN1927', 'FORD', 'F150', 0, 'S/C', 0) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '2086', 'LN1927', 'FABRICACION LINEA COMPLETA + SILENCIADOR BORLA + DOBLE SALIDA', 'FABRICACION LINEA COMPLETA + SILENCIADOR BORLA + DOBLE SALIDA', 1100000, 'completada', '2022-12-07');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 936: OT 2087
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'CAMILO MILLA' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'CAMILO MILLA', '16622472-1', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'RTPP34' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'RTPP34', 'CHEVROLET', 'BLAZER RS', 2023, 'S/C', 12) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '2087', 'RTPP34', 'FABRICACION AXLE BACK FREE MANTIENE COLA DE ESCAPE', 'FABRICACION AXLE BACK FREE MANTIENE COLA DE ESCAPE', 299900, 'completada', '2022-12-13');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 937: OT 2088
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'CRISTIAN DIAZ' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'CRISTIAN DIAZ', '19568866-4', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'LCKK78' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'LCKK78', 'CHEVROLET', 'TRAVERSE', 2019, 'S/C', 50) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '2088', 'LCKK78', 'MODIFICACION ZONA TRASERA, MANTIENE SILENCIADOR ORIGINAL, CAMBIO DE COLAS ESCAPE + NIVELACION + CAMBIO FLEXIBLE', 'MODIFICACION ZONA TRASERA, MANTIENE SILENCIADOR ORIGINAL, CAMBIO DE COLAS ESCAPE + NIVELACION + CAMBIO FLEXIBLE', 740000, 'completada', '2022-12-13');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 938: OT 2089
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'VICTOR' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'VICTOR', '16622472-1', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'LDSC50' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'LDSC50', 'RAVEE', 'ROVER', 2019, 'S/C', 45) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '2089', 'LDSC50', 'INSTALACION LINEA ESCAPE (TRAE CLIENTE)', 'INSTALACION LINEA ESCAPE (TRAE CLIENTE)', 239900, 'completada', '2022-12-15');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 939: OT 2090
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'FABRICIO ALVAREZ' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'FABRICIO ALVAREZ', '17406517-9', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'SKGG74' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'SKGG74', 'SUBARU', 'WRX', 2023, 'S/C', 0) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '2090', 'SKGG74', 'FABRICACION AXLE BACK FREE + FABRICACION DE FLANCHE + SOPORTE', 'FABRICACION AXLE BACK FREE + FABRICACION DE FLANCHE + SOPORTE', 549900, 'completada', '2022-12-16');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 940: OT 2091
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'CLIENTE GENERICO' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'CLIENTE GENERICO', '15105511-7', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'KXKS75' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'KXKS75', 'BMW', 'M2', 0, 'S/C', 0) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '2091', 'KXKS75', 'REPARACION CON APERTURA DE SILENCIADOR TRASERO PARA SOLDAR', 'REPARACION CON APERTURA DE SILENCIADOR TRASERO PARA SOLDAR', 200000, 'completada', '2022-12-19');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 941: OT 2092
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'CLIENTE GENERICO' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'CLIENTE GENERICO', '', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'PDTL25' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'PDTL25', 'SKODA', 'FABIA', 0, 'S/C', 0) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '2092', 'PDTL25', 'INSTALACION DE COLA', 'INSTALACION DE COLA', 59900, 'completada', '2022-12-19');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 942: OT 2093
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'EFRAIN FREDES' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'EFRAIN FREDES', '', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'HDGS99' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'HDGS99', 'FORD', 'F150', 0, 'S/C', 110100) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '2093', 'HDGS99', 'FABRICACION DOBLE SALIDA + COLA CORSA BLACK', 'FABRICACION DOBLE SALIDA + COLA CORSA BLACK', 730000, 'completada', '2022-12-19');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 943: OT 2094
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'CLIENTE GENERICO' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'CLIENTE GENERICO', '10624253-4', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'GWDT24' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'GWDT24', 'CHEVROLET', 'CAMARO', 0, 'S/C', 48) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '2094', 'GWDT24', 'CAMBIO FLEXIBLE ESCAPE 3'''' INSTALACION 4 ABRAZADERA CLAMP 3''''', 'CAMBIO FLEXIBLE ESCAPE 3'''' INSTALACION 4 ABRAZADERA CLAMP 3''''', 340000, 'completada', '2022-12-19');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 944: OT 2095
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'RUBEN' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'RUBEN', '', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'PHWW70' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'PHWW70', 'FORD', 'EXPREDITION', 2020, 'S/C', 43780) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '2095', 'PHWW70', 'INSTALACION SILENCIADOR ALTO FLUJO VIBRANT TRAMO ZONA TRASERA, SIN COLA', 'INSTALACION SILENCIADOR ALTO FLUJO VIBRANT TRAMO ZONA TRASERA, SIN COLA', 420000, 'completada', '2022-12-20');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 945: OT 2096
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'SEBASTIAN' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'SEBASTIAN', '', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'PSPS71' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'PSPS71', 'DODGE', 'RAM 1500', 2020, 'S/C', 20485) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '2096', 'PSPS71', 'INSTALACION VIBRANT BALA ZONA CENTRAL', 'INSTALACION VIBRANT BALA ZONA CENTRAL', 290000, 'completada', '2022-12-20');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 946: OT 2097
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'BENJAMIN CONTRERAS' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'BENJAMIN CONTRERAS', '', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'KBXK49' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'KBXK49', 'RENAULT', 'CLIO', 2018, 'S/C', 60) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '2097', 'KBXK49', 'FABRICACION AXLE BACK VIBRANT (BALA) + COLA ESCAPE - REPRO ECU STAGE 1', 'FABRICACION AXLE BACK VIBRANT (BALA) + COLA ESCAPE - REPRO ECU STAGE 1', 709800, 'completada', '2022-12-22');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 947: OT 2098
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'RICARDO GONZALEZ' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'RICARDO GONZALEZ', '19322614-0', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'FHKY74' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'FHKY74', 'DODGE', 'DURANGO', 2011, 'S/C', 160) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '2098', 'FHKY74', 'INSTALACION CUT OUT - REPRO STAGE 1 - SPRINTBOOSTER', 'INSTALACION CUT OUT - REPRO STAGE 1 - SPRINTBOOSTER', 1209700, 'completada', '2022-12-27');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 948: OT 2099
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'PABLO VELAZQUEZ' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'PABLO VELAZQUEZ', '17502051-9', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'TP4380' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'TP4380', 'NISSAN', 'PATROL', 2000, 'S/C', 222479) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '2099', 'TP4380', 'FABRICACION PIEZA INOX BAJADA MULTIPLE 2-1 VERIFICAR FUGA', 'FABRICACION PIEZA INOX BAJADA MULTIPLE 2-1 VERIFICAR FUGA', 449900, 'completada', '2022-12-27');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 949: OT 2100
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'CRISTOBAL ROMERO' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'CRISTOBAL ROMERO', '7037300-9', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'SJYW70' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'SJYW70', 'SUBARU', 'WRX', 2023, 'S/C', 1) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '2100', 'SJYW70', 'LINEA COMPLETA INOX + SILENCIADOR ALTO FLUJO WICKEDFLOW CON COLAS 3,5''''', 'LINEA COMPLETA INOX + SILENCIADOR ALTO FLUJO WICKEDFLOW CON COLAS 3,5''''', 849900, 'completada', '2022-12-28');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 950: OT 2101
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'JUAN PABLO PEDRAZA' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'JUAN PABLO PEDRAZA', '19514231-9', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'DTXD35' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'DTXD35', 'HONDA', 'CIVIC SI', 2013, 'S/C', 120) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '2101', 'DTXD35', 'INSTALACION CATALITICO ALTO FLUJO MAGNAFLOW', 'INSTALACION CATALITICO ALTO FLUJO MAGNAFLOW', 280000, 'completada', '2022-12-28');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 951: OT 2102
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'CLIENTE GENERICO' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'CLIENTE GENERICO', '18529222-3', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'SIN-PAT' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'SIN-PAT', 'S/M', 'S/M', 0, 'S/C', 0) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '2102', 'SIN-PAT', 'Carga masiva', 'Carga masiva', 0, 'completada', '2026-01-01');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 952: OT 2103
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'MIGUEL VILLEGAS' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'MIGUEL VILLEGAS', '', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'CHPP93' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'CHPP93', 'HONDA', 'ACCORD', 2010, 'S/C', 0) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '2103', 'CHPP93', 'INSTALACION 2 COLAS INOX 3,5'''' RECTA', 'INSTALACION 2 COLAS INOX 3,5'''' RECTA', 150000, 'completada', '2022-12-28');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 953: OT 2104
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'ESTEBAN LAGOS' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'ESTEBAN LAGOS', '17188946-4', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'LVKG78' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'LVKG78', 'MAZDA', '3', 2020, 'S/C', 31798) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '2104', 'LVKG78', 'AXLE BACK FREE CON DOBLE COLA SINGLE 3,5'''' BLACK GLOSSY', 'AXLE BACK FREE CON DOBLE COLA SINGLE 3,5'''' BLACK GLOSSY', 329900, 'completada', '2022-12-28');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 954: OT 2105
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'JULIO MARIN' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'JULIO MARIN', '16043618-2', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'GSXJ87' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'GSXJ87', 'MERCEDES', 'SLK 350', 2005, 'S/C', 0) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '2105', 'GSXJ87', 'MODULO RECEPTOR CUT OUT 2X1 - INSTALACION MODULO + REPARACION MODULO CUT OUT', 'MODULO RECEPTOR CUT OUT 2X1 - INSTALACION MODULO + REPARACION MODULO CUT OUT', 99990, 'completada', '2023-01-04');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 955: OT 2106
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'FELIPE SEPULVEDA' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'FELIPE SEPULVEDA', '17678565-4', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'SDFH81' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'SDFH81', 'SUBARU', 'WRX', 2023, 'S/C', 5200) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '2106', 'SDFH81', 'LINEA INOX 3'''' + SILENCIADOR ALTO FLUJO VIBRANT PERFORMANCE + COLA DUAL 3,5''''', 'LINEA INOX 3'''' + SILENCIADOR ALTO FLUJO VIBRANT PERFORMANCE + COLA DUAL 3,5''''', 849900, 'completada', '2023-01-04');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 956: OT 2107
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'MATIAS BELLO' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'MATIAS BELLO', '17764390-4', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'RDKX40' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'RDKX40', 'BMW', '112', 2021, 'S/C', 0) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '2107', 'RDKX40', 'MIDPIPE CENTRAL ELIMINA CAT SECUNDARIOS Y SILENCIADOR CENTRAL + REFUERZO COMPLETO DE SILENCIADOR ORIGINAL TRASERO', 'MIDPIPE CENTRAL ELIMINA CAT SECUNDARIOS Y SILENCIADOR CENTRAL + REFUERZO COMPLETO DE SILENCIADOR ORIGINAL TRASERO', 530000, 'completada', '2023-01-06');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 957: OT 2108
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'THIAGO KUNST' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'THIAGO KUNST', '21137366-0', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'FJJP33' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'FJJP33', 'AUDI', 'A3', 2013, 'S/C', 69200) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '2108', 'FJJP33', 'ELIMINA CATALITICO ALTO FLUJO DOWNPIPE Y SE FABRICA TRAMO FALTANTE DE DOWNPIPE CON FLEXIBLE', 'ELIMINA CATALITICO ALTO FLUJO DOWNPIPE Y SE FABRICA TRAMO FALTANTE DE DOWNPIPE CON FLEXIBLE', 230000, 'completada', '2023-01-09');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 958: OT 2109
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'CRISTIAN BRAVO' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'CRISTIAN BRAVO', '27137329-5', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'FDHS44' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'FDHS44', 'FORD', 'MUSTANG', 2014, 'S/C', 68000) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '2109', 'FDHS44', 'AXLE BACK BORLA PERFORMANCE + 2 COLAS 4''''', 'AXLE BACK BORLA PERFORMANCE + 2 COLAS 4''''', 699900, 'completada', '2023-01-10');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 959: OT 2110
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'ALFREDO BOLONEY' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'ALFREDO BOLONEY', '16589394-8', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'YF7946' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'YF7946', 'MERCEDES', 'CLK 500', 2005, 'S/C', 131812) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '2110', 'YF7946', 'REMOVER SILENCIADOR CENTRAL DEJANDO FLANCHE PARA HACERLO INTERCAMBIABLE', 'REMOVER SILENCIADOR CENTRAL DEJANDO FLANCHE PARA HACERLO INTERCAMBIABLE', 0, 'completada', '2023-01-10');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 960: OT 2111
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'CLIENTE GENERICO' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'CLIENTE GENERICO', '', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'SIN-PAT' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'SIN-PAT', 'S/M', 'S/M', 0, 'S/C', 0) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '2111', 'SIN-PAT', 'Carga masiva', 'Carga masiva', 0, 'completada', '2026-01-01');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 961: OT 2112
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'HECTOR OCAÑA' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'HECTOR OCAÑA', '', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'SIN PATENTE' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'SIN PATENTE', 'CHEVROLET', 'SILVERADO', 2023, 'S/C', 3000) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '2112', 'SIN PATENTE', 'CAMBIO DE SILENCIADOR CENTRAL Y ALTO FLUJO BORLA PERFORMANCE', 'CAMBIO DE SILENCIADOR CENTRAL Y ALTO FLUJO BORLA PERFORMANCE', 319900, 'completada', '2023-01-10');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 962: OT 2113
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'RODRIGO JORQUERA' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'RODRIGO JORQUERA', '16466280-2', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'KSLP46' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'KSLP46', 'CHEVROLET', 'CAMARO', 2018, 'S/C', 18961) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '2113', 'KSLP46', 'CAMBIO 8 BUJIAS - LIMPIEZA FILTRO CONICO JLT - CHEQUEO LINEA - SPRINTBOOSTER', 'CAMBIO 8 BUJIAS - LIMPIEZA FILTRO CONICO JLT - CHEQUEO LINEA - SPRINTBOOSTER', 319800, 'completada', '2023-01-11');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 963: OT 2114
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'LUIS TAPIA' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'LUIS TAPIA', '17600489-4', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'PYWZ98' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'PYWZ98', 'MAZDA', 'CX30', 2021, 'S/C', 21) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '2114', 'PYWZ98', 'AXLE BACK VIBRANT PERFORMANCE INTERCAMBIABLE, MANTIENE COLAS', 'AXLE BACK VIBRANT PERFORMANCE INTERCAMBIABLE, MANTIENE COLAS', 590000, 'completada', '2023-01-11');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 964: OT 2115
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'PEDRO LIBENQUERO' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'PEDRO LIBENQUERO', '17600207-7', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'SKDK88' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'SKDK88', 'CHEVROLET', 'COLORADO', 2023, 'S/C', 5363) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '2115', 'SKDK88', 'DOWNPIPE - LINEA ACERO INOX- REPRO DE ECU STAGE 2 DPF-EGR OFF -FILTRO BMC', 'DOWNPIPE - LINEA ACERO INOX- REPRO DE ECU STAGE 2 DPF-EGR OFF -FILTRO BMC', 1499900, 'completada', '2023-01-12');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 965: OT 2116
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'CLIENTE GENERICO' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'CLIENTE GENERICO', '16193120-9', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'SIN-PAT' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'SIN-PAT', 'S/M', 'S/M', 0, 'S/C', 0) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '2116', 'SIN-PAT', 'Carga masiva', 'Carga masiva', 0, 'completada', '2026-01-01');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 966: OT 2117
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'SAMUEL OYANEDEL' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'SAMUEL OYANEDEL', '', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'SGXV28' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'SGXV28', 'SUBARU', 'WRX', 2023, 'S/C', 2) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '2117', 'SGXV28', 'LINEA COMPLETA ACERO INOX 3'''' + SILENCIADOR ALTO FLUJO VIBRANT PERFORMANCE C/COLAS NUEEVAS DUAL 3,5''''', 'LINEA COMPLETA ACERO INOX 3'''' + SILENCIADOR ALTO FLUJO VIBRANT PERFORMANCE C/COLAS NUEEVAS DUAL 3,5''''', 849900, 'completada', '2023-01-13');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 967: OT 2118
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'JAIME CALLEALTA' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'JAIME CALLEALTA', '24443584-K', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'LSZW83' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'LSZW83', 'BMW', '120I', 2020, 'S/C', 30) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '2118', 'LSZW83', 'LINEA INOX 3'''' + SILENCIADOR ALTO FLUJO VIBRANT PERFORMANCE CON COLA DUAL 3,5''''', 'LINEA INOX 3'''' + SILENCIADOR ALTO FLUJO VIBRANT PERFORMANCE CON COLA DUAL 3,5''''', 1055000, 'completada', '2023-01-13');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 968: OT 2119
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'IGNACIO LUCERO' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'IGNACIO LUCERO', '18278685-3', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'BSFZ91' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'BSFZ91', 'MERCEDES', 'E63', 2009, 'S/C', 63903) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '2119', 'BSFZ91', 'XPIPE CENTRAL 3'''' ACERO INOX', 'XPIPE CENTRAL 3'''' ACERO INOX', 299900, 'completada', '2023-01-16');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 969: OT 2120
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'FELIPE GUAJARDO' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'FELIPE GUAJARDO', '18298692-5', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'RGJB13' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'RGJB13', 'DODGE', 'RAM', 2022, 'S/C', 26551) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '2120', 'RGJB13', 'CAMBIO DE SILENCIADOR ORIGINAL POR UNO DE ALTO FLUJO BORLA PERFORMANCE', 'CAMBIO DE SILENCIADOR ORIGINAL POR UNO DE ALTO FLUJO BORLA PERFORMANCE', 319900, 'completada', '2023-01-17');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 970: OT 2122
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'LUIS ROLDAN' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'LUIS ROLDAN', '15643990-8', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'CHDS50' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'CHDS50', 'DODGE', 'DURANGO', 2010, 'S/C', 137000) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '2122', 'CHDS50', 'REEMPLAZO DE SILENCIADOR ORIGINAL CENTRAL POR UNO DE ALTO FLUJO BORLA PERFORMANCE', 'REEMPLAZO DE SILENCIADOR ORIGINAL CENTRAL POR UNO DE ALTO FLUJO BORLA PERFORMANCE', 319900, 'completada', '2023-01-17');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 971: OT 2123
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'CLIENTE GENERICO' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'CLIENTE GENERICO', '19204509-6', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'SIN-PAT' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'SIN-PAT', 'S/M', 'S/M', 0, 'S/C', 0) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '2123', 'SIN-PAT', 'Carga masiva', 'Carga masiva', 0, 'completada', '2026-01-01');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 972: OT 2124
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'ALEJANDRO' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'ALEJANDRO', '', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'GJLY86' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'GJLY86', 'CHEVROLET', 'SILVERADO', 2014, 'S/C', 185) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '2124', 'GJLY86', 'CAMBIO  FLANCHE POR CLAMP', 'CAMBIO  FLANCHE POR CLAMP', 149900, 'completada', '2023-01-17');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 973: OT 2125
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'PABLO MARTIN HARTWIG' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'PABLO MARTIN HARTWIG', '21372819-9', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'LZLR19' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'LZLR19', 'FORD', 'RANGER', 2020, 'S/C', 56000) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '2125', 'LZLR19', 'REPARACION DOWNPIPE - CAMBIO GOMAS - FABRICACION 2 SOPORTES', 'REPARACION DOWNPIPE - CAMBIO GOMAS - FABRICACION 2 SOPORTES', 194000, 'completada', '2023-01-23');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 974: OT 2126
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'JULIO ARELLANO' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'JULIO ARELLANO', '19438601-K', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'UV8657' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'UV8657', 'PEUGEOT', '106', 2002, 'S/C', 0) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '2126', 'UV8657', 'LINEA INOX 2,5'''' CON INSTALACION DE HILO + ALTO FLUJO MAGNAFLOW + ALTO FLUJO BORLA + DUAL COLA 3''''', 'LINEA INOX 2,5'''' CON INSTALACION DE HILO + ALTO FLUJO MAGNAFLOW + ALTO FLUJO BORLA + DUAL COLA 3''''', 815000, 'completada', '2023-01-23');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 975: OT 2127
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'LUIS MEDINA' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'LUIS MEDINA', '15676223-7', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'VN5878' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'VN5878', 'RENAULT', 'CLIO', 2003, 'S/C', 254) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '2127', 'VN5878', 'REEMPLAZO DE RESONADOR CENTRAL CON SILENCIADOR 2'''' CON REPARACION EN SOPORTE PARA DAR MEJOR ALTURA', 'REEMPLAZO DE RESONADOR CENTRAL CON SILENCIADOR 2'''' CON REPARACION EN SOPORTE PARA DAR MEJOR ALTURA', 200000, 'completada', '2023-01-24');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 976: OT 2128
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'RAIMUNDO ROMERO' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'RAIMUNDO ROMERO', '16938821-0', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'SKXG34' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'SKXG34', 'DODGE', 'RAM 1500', 2023, 'S/C', 5507) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '2128', 'SKXG34', 'REEMPLAZO SILENCIADOR ORIGINAL Y ALTO FLUJO VIBRANT PERFORMANCE + NIVELACION COLAS', 'REEMPLAZO SILENCIADOR ORIGINAL Y ALTO FLUJO VIBRANT PERFORMANCE + NIVELACION COLAS', 319900, 'completada', '2023-01-24');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 977: OT 2129
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'DOMINGO VEGA' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'DOMINGO VEGA', '19637361-6', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'JDFC23' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'JDFC23', 'INFINITI', 'Q50', 2017, 'S/C', 124401) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '2129', 'JDFC23', 'AXLE BACK COMPLETO VIBRANT PERFORMANCE + 2 COLAS 4'''' CROMO', 'AXLE BACK COMPLETO VIBRANT PERFORMANCE + 2 COLAS 4'''' CROMO', 759900, 'completada', '2023-01-25');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 978: OT 2130
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'ALEJANDRO MUÑOZ' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'ALEJANDRO MUÑOZ', '17477154-5', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'HTKY93' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'HTKY93', 'AUDI', 'RS6', 2016, 'S/C', 50601) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '2130', 'HTKY93', 'DOWNPIPE X2 - STZ MOTOR - STZ CAJA - 2.500 UBD MOTOR Y CAJA', 'DOWNPIPE X2 - STZ MOTOR - STZ CAJA - 2.500 UBD MOTOR Y CAJA', 3570000, 'completada', '2023-01-25');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 979: OT 2131
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'MARCELO ARCE' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'MARCELO ARCE', '17903008-K', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'JDSJ49' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'JDSJ49', 'DODGE', 'RAM 1500', 2017, 'S/C', 123281) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '2131', 'JDSJ49', 'VACIADO DPF', 'VACIADO DPF', 220000, 'completada', '2023-01-25');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 980: OT 2132
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'HECTOR CARDENA' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'HECTOR CARDENA', '13920752-1', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'RPHX64' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'RPHX64', 'BMW', '220I', 2023, 'S/C', 19236) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '2132', 'RPHX64', 'LINEA INOX 3'''' + ALTO FLUJO VIBRANT + 2 COLAS', 'LINEA INOX 3'''' + ALTO FLUJO VIBRANT + 2 COLAS', 790000, 'completada', '2023-01-25');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 981: OT 2133
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'MARCOS MENESES' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'MARCOS MENESES', '14572905-K', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'KPGD47' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'KPGD47', 'CHEVROLET', 'CAMARO', 2018, 'S/C', 0) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '2133', 'KPGD47', 'INSTALACION DIFUSOR (LO TRAE CLIENTE) + LATERALES', 'INSTALACION DIFUSOR (LO TRAE CLIENTE) + LATERALES', 100000, 'completada', '2023-01-26');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 982: OT 2134
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'CLIENTE GENERICO' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'CLIENTE GENERICO', '16745614-6', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'SIN-PAT' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'SIN-PAT', 'S/M', 'S/M', 0, 'S/C', 0) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '2134', 'SIN-PAT', 'Carga masiva', 'Carga masiva', 0, 'completada', '2026-01-01');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 983: OT 2135
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'PAULO MALDONADO' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'PAULO MALDONADO', '', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'SIN-PAT' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'SIN-PAT', 'FORD', 'F150', 2022, 'S/C', 0) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '2135', 'SIN-PAT', 'VACIADO Y DEJAR DIRECTO EN INOX', 'VACIADO Y DEJAR DIRECTO EN INOX', 199900, 'completada', '2023-01-27');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 984: OT 2136
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'PATRICIO PUEBLA' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'PATRICIO PUEBLA', '19841361-5', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'KZTC87' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'KZTC87', 'BMW', '118I', 2019, 'S/C', 38371) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '2136', 'KZTC87', 'AXLE BACK FREE + 2 COLA INOX 3,5''''', 'AXLE BACK FREE + 2 COLA INOX 3,5''''', 350000, 'completada', '2023-01-27');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 985: OT 2137
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'JAVIER ANERES' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'JAVIER ANERES', '16743654-4', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'GPTC62' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'GPTC62', 'MINI', 'COOPER F56', 2015, 'S/C', 121244) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '2137', 'GPTC62', 'FABRICACION E INSTALACION DOWNPIPE', 'FABRICACION E INSTALACION DOWNPIPE', 399900, 'completada', '2023-01-31');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 986: OT 2138
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'BRUNO DIAZ' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'BRUNO DIAZ', '15709883-7', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'FPPG38' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'FPPG38', 'VOLVO', 'C30', 2013, 'S/C', 119978) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '2138', 'FPPG38', 'MEDIA LINEA INOX + SILENCIADOR ALTO FLUJO BORLA + 2 COLAS BLACK 3''''', 'MEDIA LINEA INOX + SILENCIADOR ALTO FLUJO BORLA + 2 COLAS BLACK 3''''', 549900, 'completada', '2023-02-02');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 987: OT 2139
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'NICOLAS CAMPO' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'NICOLAS CAMPO', '17955330-9', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'HYHJ89' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'HYHJ89', 'MITSUBISHI', 'L200', 2016, 'S/C', 198198) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '2139', 'HYHJ89', 'DOWNPIPE INOX - ELIMINAR SILENCIADOR CENTRAL - REPRO ECU STAGE 2', 'DOWNPIPE INOX - ELIMINAR SILENCIADOR CENTRAL - REPRO ECU STAGE 2', 989800, 'completada', '2023-02-07');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 988: OT 2140
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'HAROLD ROMERO' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'HAROLD ROMERO', '17408146-8', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'CDHT44' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'CDHT44', 'MINI', 'COOPER R56', 2009, 'S/C', 118) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '2140', 'CDHT44', 'SUPRIMIR SILENCIADOR CENTRAL + ELIMINA SILENCIADOR INTERCOOLER', 'SUPRIMIR SILENCIADOR CENTRAL + ELIMINA SILENCIADOR INTERCOOLER', 100000, 'completada', '2023-02-07');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 989: OT 2141
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'MARTIN FLAMARIQUE' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'MARTIN FLAMARIQUE', '26681935-8', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'LDGW31' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'LDGW31', 'CHEVROLET', 'SILVERADO', 2019, 'S/C', 61792) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '2141', 'LDGW31', 'CAMBIO DE SILENCIADOR ORIGINAL POR ALTO FLUJO', 'CAMBIO DE SILENCIADOR ORIGINAL POR ALTO FLUJO', 0, 'completada', '2023-02-08');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 990: OT 2142
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'PABLO MERINO' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'PABLO MERINO', '14551196-8', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'BBSJ93' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'BBSJ93', 'TOYOTA', 'CAMRY', 2008, 'S/C', 188) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '2142', 'BBSJ93', 'CAMBIO DE SILENCIADOR TRASERO X 2 ALTO FLUJO GENERICO, MANTIENE COLAS', 'CAMBIO DE SILENCIADOR TRASERO X 2 ALTO FLUJO GENERICO, MANTIENE COLAS', 340000, 'completada', '2023-02-08');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 991: OT 2143
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'CAMILO MORALES' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'CAMILO MORALES', '8560875-4', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'SDLG39' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'SDLG39', 'DODGE', 'CHALLENGER', 2016, 'S/C', 0) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '2143', 'SDLG39', 'SUPRIMIR SILENCIADOR CENTRALES + 2 ALTO FLUJO VIBRANT PERFORMANCE 3''''', 'SUPRIMIR SILENCIADOR CENTRALES + 2 ALTO FLUJO VIBRANT PERFORMANCE 3''''', 719900, 'completada', '2023-02-13');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 992: OT 2144
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'JORGE SILVA' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'JORGE SILVA', '17089123-6', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'YC8699' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'YC8699', 'SUBARU', 'LEGACY', 2005, 'S/C', 0) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '2144', 'YC8699', 'INSTALACION  NUEVA LINEA INOX (LO TRAE CLIENTE) + SOLDADO EN FLANCHE + INSTALACION B CLAMP', 'INSTALACION  NUEVA LINEA INOX (LO TRAE CLIENTE) + SOLDADO EN FLANCHE + INSTALACION B CLAMP', 145000, 'completada', '2023-02-13');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 993: OT 2145
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'MARTIN BURGUEÑO' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'MARTIN BURGUEÑO', '13704916-3', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'KRZR81' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'KRZR81', 'VOLKSWAGEN', 'GOLF R', 2018, 'S/C', 61000) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '2145', 'KRZR81', 'AXLE BACK VIBRANT PERFORMANCE 4 COLAS 4'''' - REPRO STAGE 2 - REPRO CAJA - DOWNPIPE', 'AXLE BACK VIBRANT PERFORMANCE 4 COLAS 4'''' - REPRO STAGE 2 - REPRO CAJA - DOWNPIPE', 1869800, 'completada', '2023-02-16');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 994: OT 2146
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'RICARDO DE LA MAZA' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'RICARDO DE LA MAZA', '19076855-4', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'KZFG83' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'KZFG83', 'MINI', 'COOPER F56', 2018, 'S/C', 0) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '2146', 'KZFG83', 'AXLE BACK C/SILENCIADOR Y COLA 4'''' INTERCAMBIABLE', 'AXLE BACK C/SILENCIADOR Y COLA 4'''' INTERCAMBIABLE', 399900, 'completada', '2023-02-17');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 995: OT 2147
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'MIGUEL VALERIO' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'MIGUEL VALERIO', '19247425-6', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'JTZD24' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'JTZD24', 'BMW', '240I', 2017, 'S/C', 78268) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '2147', 'JTZD24', 'DOWNPIPE INOX 3'''' - LINEA INOX + SILENCIADOR ALTO FLUJO + CUT OUT + 4 COLAS - REPRO STAGE 2', 'DOWNPIPE INOX 3'''' - LINEA INOX + SILENCIADOR ALTO FLUJO + CUT OUT + 4 COLAS - REPRO STAGE 2', 2189800, 'completada', '2023-02-20');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 996: OT 2148
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'MATIAS VERGARA' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'MATIAS VERGARA', '20063704-6', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'PSTR40' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'PSTR40', 'CHEVROLET', 'SILVERADO', 2021, 'S/C', 0) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '2148', 'PSTR40', 'CAMBIO SILENCIADOR ORIGINAL POR ALTO FLUJO VIBRANT PERFORMANCE', 'CAMBIO SILENCIADOR ORIGINAL POR ALTO FLUJO VIBRANT PERFORMANCE', 300000, 'completada', '2023-02-20');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 997: OT 2149
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'CAMILA SALAS' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'CAMILA SALAS', '19421890-7', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'PDRZ47' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'PDRZ47', 'VOLKSWAGEN', 'R GOLF', 2021, 'S/C', 11450) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '2149', 'PDRZ47', 'LINEA COMPLETA INOX 3'''' C/SILENCIADOR ALTO FLUJO VIBRANT PERFORMANCE + 4 COLAS NEGRAS', 'LINEA COMPLETA INOX 3'''' C/SILENCIADOR ALTO FLUJO VIBRANT PERFORMANCE + 4 COLAS NEGRAS', 889900, 'completada', '2023-02-21');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 998: OT 2150
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'TOMAS RAMOS' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'TOMAS RAMOS', '20086435-2', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'RJCB41' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'RJCB41', 'FORD', 'F150', 2022, 'S/C', 20) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '2150', 'RJCB41', 'PROMOCION, REEMPLAZO DE SILENCIADOR ORIGINAL POR ALTO FLUJO VIBRANT PERFORMANCE INOX', 'PROMOCION, REEMPLAZO DE SILENCIADOR ORIGINAL POR ALTO FLUJO VIBRANT PERFORMANCE INOX', 299900, 'completada', '2023-02-23');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 999: OT 2151
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'SEBASTIAN ALFARO' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'SEBASTIAN ALFARO', '19958953-9', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'JPVY63' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'JPVY63', 'TOYOTA', 'HILUX', 2017, 'S/C', 128) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '2151', 'JPVY63', 'DOWNPIPE INOX - LINEA COMPLETA INOX + SILENCIADOR ALTO FLUJO - REPRO ECU STAGE 2', 'DOWNPIPE INOX - LINEA COMPLETA INOX + SILENCIADOR ALTO FLUJO - REPRO ECU STAGE 2', 1350000, 'completada', '2023-02-24');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 1000: OT 2152
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'BENJAMIN MENDEZ' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'BENJAMIN MENDEZ', '18970279-5', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'KBKC43' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'KBKC43', 'FORD', 'RANGER', 2018, 'S/C', 117000) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '2152', 'KBKC43', 'REPRO DE ECU STAGE 2 CON DPF Y EGR OFF - FILTRO PANEL ALTO FLUJO BNC', 'REPRO DE ECU STAGE 2 CON DPF Y EGR OFF - FILTRO PANEL ALTO FLUJO BNC', 694000, 'completada', '2023-02-24');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    RAISE NOTICE 'Procesados 1000 registros...';
    -- Fila 1001: OT 2153
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'RODRIGO ESCALONA' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'RODRIGO ESCALONA', '21071652-1', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'PLRX81' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'PLRX81', 'CHEVROLET', 'SILVERADO', 2021, 'S/C', 19180) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '2153', 'PLRX81', 'PROMOCION, REEMPLAZO DE SILENCIADOR ORIGINAL POR ALTO FLUJO BORLA  PERFORMANCE', 'PROMOCION, REEMPLAZO DE SILENCIADOR ORIGINAL POR ALTO FLUJO BORLA  PERFORMANCE', 299900, 'completada', '2023-02-24');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 1002: OT 2154
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'JAIME' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'JAIME', '10363939-5', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'SIN-PAT' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'SIN-PAT', 'CHEVROLET', 'SILVERADO', 0, 'S/C', 0) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '2154', 'SIN-PAT', 'PROMOCION, REEMPLAZO SILENCIADOR CENTRAL ORIGINAL POR ALTO FLUJO', 'PROMOCION, REEMPLAZO SILENCIADOR CENTRAL ORIGINAL POR ALTO FLUJO', 299900, 'completada', '2023-02-27');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 1003: OT 2155
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'GUSTAVO PUENTES' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'GUSTAVO PUENTES', '', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'SIN-PAT' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'SIN-PAT', 'HONDA', 'HRV', 0, 'S/C', 0) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '2155', 'SIN-PAT', 'REEMPLAZO DE SILENCIADOR ORIGINAL (CLIENTE TRAE LA LINEA)', 'REEMPLAZO DE SILENCIADOR ORIGINAL (CLIENTE TRAE LA LINEA)', 120000, 'completada', '2023-02-27');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 1004: OT 2156
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'NIMAI MOYA' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'NIMAI MOYA', '17375217-2', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'SPYR56' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'SPYR56', 'CHEVROLET', 'TAHOE', 2023, 'S/C', 0) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '2156', 'SPYR56', 'REEMPLAZO DE SILENCIADOR ORIGINAL POR ALTO FLUJO', 'REEMPLAZO DE SILENCIADOR ORIGINAL POR ALTO FLUJO', 299900, 'completada', '2023-02-27');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 1005: OT 2157
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'JAIME GALLEGUILLOS' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'JAIME GALLEGUILLOS', '18126027-0', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'RSVC54' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'RSVC54', 'CHEVROLET', 'SILVERADO', 2021, 'S/C', 50926) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '2157', 'RSVC54', 'REEMPLAZO DE SILENCIADOR ALTO FLUJO', 'REEMPLAZO DE SILENCIADOR ALTO FLUJO', 299900, 'completada', '2023-02-28');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 1006: OT 2158
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'CRISTIAN GUERRA' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'CRISTIAN GUERRA', '19141527-2', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'SRFJ84' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'SRFJ84', 'BMW', '135I', 2023, 'S/C', 250) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '2158', 'SRFJ84', 'LINEA COMPLETA INOX CON SILENCIADOR ALTO FLUJO Y  COLAS NUEVAS', 'LINEA COMPLETA INOX CON SILENCIADOR ALTO FLUJO Y  COLAS NUEVAS', 879900, 'completada', '2023-02-28');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 1007: OT 2159
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'ESTEBAN NAVARRETE' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'ESTEBAN NAVARRETE', '', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'RGSC85' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'RGSC85', 'MERCEDES', 'A200 W177', 2022, 'S/C', 24528) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '2159', 'RGSC85', 'MEDIA LINEA INOX 2,5'''' + SILENCIADOR ALTO FLUJO MAGNAFLOW Y SALIDA DOBLE AL MEDIO DE COLAS DIFUSOR', 'MEDIA LINEA INOX 2,5'''' + SILENCIADOR ALTO FLUJO MAGNAFLOW Y SALIDA DOBLE AL MEDIO DE COLAS DIFUSOR', 650000, 'completada', '2023-02-28');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 1008: OT 2160
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'ROBERTO SANDOVAL' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'ROBERTO SANDOVAL', '17411167-7', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'SKHR82' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'SKHR82', 'CHEVROLET', 'SILVERADO', 2023, 'S/C', 3620) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '2160', 'SKHR82', 'INSTALACION CUT OUT 3'''' C/REMOTO - INSTALACION DE COLA INOX BLACK 4'''' DOBLE SALIDA - BORLA PERFORMANCE INSTALADO + ABONO PROYECTO COLAS', 'INSTALACION CUT OUT 3'''' C/REMOTO - INSTALACION DE COLA INOX BLACK 4'''' DOBLE SALIDA - BORLA PERFORMANCE INSTALADO + ABONO PROYECTO COLAS', 1160000, 'completada', '2023-03-06');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 1009: OT 2161
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'GIANLUCA TASSARA' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'GIANLUCA TASSARA', '76820501-9', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'RRZB82' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'RRZB82', 'CHEVROLET', 'SILVERADO', 2022, 'S/C', 23504) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '2161', 'RRZB82', 'LINEA COMPLETA INOX 3'''' + SILENCIADOR ALTO FLUJO MAGNAFLOW + 4 COLAS INOX BLACK', 'LINEA COMPLETA INOX 3'''' + SILENCIADOR ALTO FLUJO MAGNAFLOW + 4 COLAS INOX BLACK', 1200000, 'completada', '2023-03-09');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 1010: OT 2162
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'JUAN CONTRERAS' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'JUAN CONTRERAS', '20478811-1', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'LJRB92' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'LJRB92', 'SUZUKI', 'SWIFT SPORT', 2020, 'S/C', 16565) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '2162', 'LJRB92', 'LINEA COMPLETA ACERO INOX + SILENCIADOR ALTO FLUJO BORLA +COLAS 4'''' NEGRAS BRILLANTES', 'LINEA COMPLETA ACERO INOX + SILENCIADOR ALTO FLUJO BORLA +COLAS 4'''' NEGRAS BRILLANTES', 709900, 'completada', '2023-03-09');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 1011: OT 2163
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'RODRIGO CABALLERO' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'RODRIGO CABALLERO', '20574349-9', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'LSTJ98' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'LSTJ98', 'MERCEDES', 'A35', 2022, 'S/C', 57665) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '2163', 'LSTJ98', 'LINEA COMPLETA INOX 3'''' + SILENCIADOR ALTO FLUJO 3'''' INOX', 'LINEA COMPLETA INOX 3'''' + SILENCIADOR ALTO FLUJO 3'''' INOX', 819900, 'completada', '2023-03-10');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 1012: OT 2164
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'HERNAN ALVAREZ' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'HERNAN ALVAREZ', '76240825-2', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'SFKJ22' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'SFKJ22', 'DODGE', 'RAM 1500', 2023, 'S/C', 4751) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '2164', 'SFKJ22', 'LINEA COMPLETA + SILENCIADOR ALTO FLUJO MAGNAFLOW, CONSERVANDO COLAS ORIGINALES BLACK', 'LINEA COMPLETA + SILENCIADOR ALTO FLUJO MAGNAFLOW, CONSERVANDO COLAS ORIGINALES BLACK', 900000, 'completada', '2023-03-13');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 1013: OT 2165
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'JOAQUIN MEZA' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'JOAQUIN MEZA', '14717904-9', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'LKHZ49' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'LKHZ49', 'DODGE', 'RAM 1500', 2019, 'S/C', 66628) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '2165', 'LKHZ49', 'INSTALACION SILENCIADOR ALTO FLUJO MAGNAFLOW', 'INSTALACION SILENCIADOR ALTO FLUJO MAGNAFLOW', 299900, 'completada', '2023-03-13');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 1014: OT 2166
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'ANDRES ABARCA' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'ANDRES ABARCA', '18488730-4', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'DZVS13' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'DZVS13', 'TOYOTA', 'LAND CRUISER', 2013, 'S/C', 0) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '2166', 'DZVS13', 'REEMPLAZO DE ZONA CENTRAL POR INOX + SILENCIADOR UNIVERSAL', 'REEMPLAZO DE ZONA CENTRAL POR INOX + SILENCIADOR UNIVERSAL', 319900, 'completada', '2023-03-15');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 1015: OT 2167
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'MARCELO FANTUZZI' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'MARCELO FANTUZZI', '10669623-3', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'JCHJ12' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'JCHJ12', 'FORD', 'F150', 2016, 'S/C', 152053) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '2167', 'JCHJ12', 'LINEA COMPLETA INOX 3'''' + SILENCIADOR ALTO FLUJO MAGNAFLOW EXHAUST + 2 COLA INOX CROMO', 'LINEA COMPLETA INOX 3'''' + SILENCIADOR ALTO FLUJO MAGNAFLOW EXHAUST + 2 COLA INOX CROMO', 1190000, 'completada', '2023-03-15');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 1016: OT 2168
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'COMERCIAL RETROTEK SPA' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'COMERCIAL RETROTEK SPA', '9579488-2', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'HWRR66' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'HWRR66', 'FORD', 'RANGER', 2016, 'S/C', 282591) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '2168', 'HWRR66', 'VACIADO DPF - REPRO DPF OFF EGR OFF', 'VACIADO DPF - REPRO DPF OFF EGR OFF', 490000, 'completada', '2023-03-16');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 1017: OT 2169
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'DAVID SUAZO' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'DAVID SUAZO', '77088294-3', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'SIN-PAT' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'SIN-PAT', 'BMW', 'S100', 2014, 'S/C', 0) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '2169', 'SIN-PAT', 'HEADERS (ANALIZAR) + INSTALACION DE ESCAPE AKMAPONIC', 'HEADERS (ANALIZAR) + INSTALACION DE ESCAPE AKMAPONIC', 650000, 'completada', '2023-03-20');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 1018: OT 2170
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'WILLHO CHONG' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'WILLHO CHONG', '17952727-8', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'SGVY22' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'SGVY22', 'CHANGAN', 'UNIT', 2023, 'S/C', 10775) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '2170', 'SGVY22', 'AXLE BACK FREE INOX 2,5'''' - INSTALACION DE FILTRO C/MODIFICACION', 'AXLE BACK FREE INOX 2,5'''' - INSTALACION DE FILTRO C/MODIFICACION', 400000, 'completada', '2023-03-22');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 1019: OT 2171
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'ARTURO SALAZAR' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'ARTURO SALAZAR', '26195114-2', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'RWVH27' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'RWVH27', 'FORD', 'F150', 2022, 'S/C', 13) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '2171', 'RWVH27', 'INSTALACION SILENCIADOR ALTO FLUJO BORLA EXHAUST', 'INSTALACION SILENCIADOR ALTO FLUJO BORLA EXHAUST', 319900, 'completada', '2023-03-22');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 1020: OT 2172
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'CLAUDIO CULACIATI' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'CLAUDIO CULACIATI', '13490666-9', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'JTLX69' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'JTLX69', 'FORD', 'F150', 2017, 'S/C', 133149) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '2172', 'JTLX69', 'LINEA COMPLETA INOX 3'''' CON ALTO FLUJO MAGNAFLOW Y DOBLE SALIDA DE ESCAPE CROMO', 'LINEA COMPLETA INOX 3'''' CON ALTO FLUJO MAGNAFLOW Y DOBLE SALIDA DE ESCAPE CROMO', 1100000, 'completada', '2023-03-23');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 1021: OT 2173
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'NICOLAS HERNANDEZ' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'NICOLAS HERNANDEZ', '13953386-0', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'JXJD62' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'JXJD62', 'BMW', '120I', 2018, 'S/C', 72191) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '2173', 'JXJD62', 'INSTALACION DOWNPIPE (LO TRAE CLIENTE) INSTALACION FILTRO - COTIZAR INSTALACIO BUJIAS FRIAS', 'INSTALACION DOWNPIPE (LO TRAE CLIENTE) INSTALACION FILTRO - COTIZAR INSTALACIO BUJIAS FRIAS', 85000, 'completada', '2023-03-27');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 1022: OT 2174
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'SEBASTIAN GALLARDO' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'SEBASTIAN GALLARDO', '18114849-7', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'RTRL46' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'RTRL46', 'AUDI', 'A3', 2022, 'S/C', 17334) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '2174', 'RTRL46', 'REEMPLAZO DE SILENCIADOR CENTRAL POR ALTO FLUJO MAGNAFLOW + SUPRIMIR TRASERO HACIENDO AXLE BACK FREE + 2 COLAS', 'REEMPLAZO DE SILENCIADOR CENTRAL POR ALTO FLUJO MAGNAFLOW + SUPRIMIR TRASERO HACIENDO AXLE BACK FREE + 2 COLAS', 460000, 'completada', '2023-03-30');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 1023: OT 2175
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'CLIENTE GENERICO' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'CLIENTE GENERICO', '21491846-3', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'LFXL47' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'LFXL47', 'FORD', 'RANGER', 2019, 'S/C', 43000) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '2175', 'LFXL47', 'FABRICACION E INSTALACION DOWNPIPE INOX', 'FABRICACION E INSTALACION DOWNPIPE INOX', 319900, 'completada', '2023-03-30');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 1024: OT 2176
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'CRISTIAN DIDIER' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'CRISTIAN DIDIER', '', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'LLHW22' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'LLHW22', 'MAZDA', 'BT50', 2019, 'S/C', 117656) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '2176', 'LLHW22', 'FABRICACION E INSTALACION DOWNPIPE INOX', 'FABRICACION E INSTALACION DOWNPIPE INOX', 319900, 'completada', '2023-03-31');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 1025: OT 2177
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'SEBASTIAN NARVAEZ' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'SEBASTIAN NARVAEZ', '76452799-2', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'SKXK27' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'SKXK27', 'MERCEDES', 'A35', 2023, 'S/C', 2833) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '2177', 'SKXK27', 'ELIMINAR SILENCIADOR CENTRAL', 'ELIMINAR SILENCIADOR CENTRAL', 150000, 'completada', '2023-04-04');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 1026: OT 2178
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'MARIO' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'MARIO', '99914055-6', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'HSXK49' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'HSXK49', 'FORD', 'MUSTANG', 2016, 'S/C', 53150) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '2178', 'HSXK49', 'MODIFICACION AXLE BACK INTEGRADO 4'''' COLAS BLACK UTILIZANDO CUT OUT', 'MODIFICACION AXLE BACK INTEGRADO 4'''' COLAS BLACK UTILIZANDO CUT OUT', 580000, 'completada', '2023-04-04');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 1027: OT 2179
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'JUAN TERRISSE' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'JUAN TERRISSE', '18608171-4', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'HPXD59' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'HPXD59', 'OPEL', 'CORSA OPC', 2015, 'S/C', 96) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '2179', 'HPXD59', 'INSTALACION SILENCIADOR ALTO FLUJO BORLA PERFORMANCE MANTENIENDO SALIDA TRIANGULAR (SE ADICIONA SOPORTE NUEVO)', 'INSTALACION SILENCIADOR ALTO FLUJO BORLA PERFORMANCE MANTENIENDO SALIDA TRIANGULAR (SE ADICIONA SOPORTE NUEVO)', 329900, 'completada', '2023-04-05');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 1028: OT 2180
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'AGUSTIN MUÑOZ' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'AGUSTIN MUÑOZ', '77447158-9', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'BPKB85' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'BPKB85', 'SUBARU', 'IMPREZA', 2010, 'S/C', 179022) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '2180', 'BPKB85', 'AXLE BACK NUEVO INOX CON FLANCHE INTERCAMBIABLE VIBRANT PERFORMANCE ALTO FLUJO + COLA NUEVA, CAMBIO COLA DUAL 3''''', 'AXLE BACK NUEVO INOX CON FLANCHE INTERCAMBIABLE VIBRANT PERFORMANCE ALTO FLUJO + COLA NUEVA, CAMBIO COLA DUAL 3''''', 394900, 'completada', '2023-04-06');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 1029: OT 2181
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'CLIENTE GENERICO' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'CLIENTE GENERICO', '', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'SIN-PAT' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'SIN-PAT', 'S/M', 'S/M', 0, 'S/C', 0) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '2181', 'SIN-PAT', 'Carga masiva', 'Carga masiva', 0, 'completada', '2026-01-01');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 1030: OT 2182
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'CLIENTE GENERICO' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'CLIENTE GENERICO', '', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'SIN-PAT' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'SIN-PAT', 'S/M', 'S/M', 0, 'S/C', 0) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '2182', 'SIN-PAT', 'Carga masiva', 'Carga masiva', 0, 'completada', '2026-01-01');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 1031: OT 2183
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'CLIENTE GENERICO' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'CLIENTE GENERICO', '', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'SIN-PAT' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'SIN-PAT', 'S/M', 'S/M', 0, 'S/C', 0) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '2183', 'SIN-PAT', 'Carga masiva', 'Carga masiva', 0, 'completada', '2026-01-01');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 1032: OT 2184
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'EDUARDO FERNANDEZ' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'EDUARDO FERNANDEZ', '', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'LLTX92' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'LLTX92', 'VOLVO', 'S60 POLESTAR', 2019, 'S/C', 43) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '2184', 'LLTX92', 'CAMBIO FLEXIBLE 3'''' POR ROTURA Y LEVANTE LINEA - FABRICACION E INSTALACION SOPORTE', 'CAMBIO FLEXIBLE 3'''' POR ROTURA Y LEVANTE LINEA - FABRICACION E INSTALACION SOPORTE', 140000, 'completada', '2023-04-13');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 1033: OT 2185
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'JULIO VIAL' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'JULIO VIAL', '18072387-0', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'SRRK44' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'SRRK44', 'MERCEDES', 'GLE 635', 2023, 'S/C', 2296) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '2185', 'SRRK44', 'MODIFICACION SILENCIADOR ORIGINAL', 'MODIFICACION SILENCIADOR ORIGINAL', 0, 'completada', '2023-04-13');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 1034: OT 2186
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'ALEJANDRO ALFONSO' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'ALEJANDRO ALFONSO', '17319486-2', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'SIN-PAT' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'SIN-PAT', 'CHEVROLET', 'SILVERADO', 2020, 'S/C', 33) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '2186', 'SIN-PAT', 'FABRICACION DE PIEZA LINEA DECA, ELIMINAR CATALITICO + EXTENSOR SENSOR OXIGENO - INSTALACION SILENCIADOR ALTO FLUJO BORLA PERFORMANCE', 'FABRICACION DE PIEZA LINEA DECA, ELIMINAR CATALITICO + EXTENSOR SENSOR OXIGENO - INSTALACION SILENCIADOR ALTO FLUJO BORLA PERFORMANCE', 699800, 'completada', '2023-04-13');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 1035: OT 2187
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'CRISTIAN DELASOTA' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'CRISTIAN DELASOTA', '27137311-2', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'STZC33' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'STZC33', 'FORD', 'F150', 2023, 'S/C', 800) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '2187', 'STZC33', 'INSTALACION SILENCIADOR ALTO FLUJO + CUT OUT 3'''' - FABRICACION DOBLE SALIDA DE ESCAPE C/COLA CROMO', 'INSTALACION SILENCIADOR ALTO FLUJO + CUT OUT 3'''' - FABRICACION DOBLE SALIDA DE ESCAPE C/COLA CROMO', 1300000, 'completada', '2023-04-20');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 1036: OT 2188
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'OSVALDO BAEZA' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'OSVALDO BAEZA', '15355291-6', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'SDYL99' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'SDYL99', 'CUPRA', 'FORNENTOR', 2023, 'S/C', 5) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '2188', 'SDYL99', 'FABRICACION LINEA NUEVA INOX 2,5'''' C/ALTO FLUJO MAGNAFLOW + 4 COLAS CON CORTE DIFUSOR', 'FABRICACION LINEA NUEVA INOX 2,5'''' C/ALTO FLUJO MAGNAFLOW + 4 COLAS CON CORTE DIFUSOR', 630000, 'completada', '2023-04-20');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 1037: OT 2189
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'SEBASTIAN ALVARADO' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'SEBASTIAN ALVARADO', '15385119-0', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'GJSC53' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'GJSC53', 'AUDI', 'S7', 2014, 'S/C', 44) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '2189', 'GJSC53', 'AXLE BACK VIBRANT PERFORMANCE, MANTENIENDO COLAS Y VALVULAS ORIGINALES', 'AXLE BACK VIBRANT PERFORMANCE, MANTENIENDO COLAS Y VALVULAS ORIGINALES', 699900, 'completada', '2023-04-21');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 1038: OT 2190
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'CLIENTE GENERICO' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'CLIENTE GENERICO', '15316388-K', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'SIN-PAT' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'SIN-PAT', 'S/M', 'S/M', 0, 'S/C', 0) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '2190', 'SIN-PAT', 'Carga masiva', 'Carga masiva', 0, 'completada', '2026-01-01');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 1039: OT 2191
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'CLIENTE GENERICO' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'CLIENTE GENERICO', '', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'SIN-PAT' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'SIN-PAT', 'S/M', 'S/M', 0, 'S/C', 0) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '2191', 'SIN-PAT', 'Carga masiva', 'Carga masiva', 0, 'completada', '2026-01-01');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 1040: OT 2192
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'CRISTOBAL SEKULOVIC' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'CRISTOBAL SEKULOVIC', '', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'GHRF94' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'GHRF94', 'FORD', 'MUSTANG', 2014, 'S/C', 65100) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '2192', 'GHRF94', 'X-PIPE CENTRAL + AXLE BACK MAGNAFLOW EXHAUST MANTIENE COLAS (SE PULEN)', 'X-PIPE CENTRAL + AXLE BACK MAGNAFLOW EXHAUST MANTIENE COLAS (SE PULEN)', 939900, 'completada', '2023-04-24');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 1041: OT 2193
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'DANIEL CARCAMO' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'DANIEL CARCAMO', '16605933-K', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'LYGW55' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'LYGW55', 'BMW', '118I', 2020, 'S/C', 29) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '2193', 'LYGW55', 'INSTALACION DIFUSOR - CUT OUT 2,5'''' C/NUEVA SALIDA - COLAS M PERFORMANCE 3,5''''', 'INSTALACION DIFUSOR - CUT OUT 2,5'''' C/NUEVA SALIDA - COLAS M PERFORMANCE 3,5''''', 644800, 'completada', '2023-04-24');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 1042: OT 2194
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'JACQUES SARRIA' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'JACQUES SARRIA', '17764736-5', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'PDFD34' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'PDFD34', 'VOLKSWAGEN', 'POLO', 2020, 'S/C', 27302) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '2194', 'PDFD34', 'SUPRIMIR SILENCIADOR ALTO FLUJO + COLAS DOBLES C/MODIFICACION DE PARACHOQUE - INDUCCION FILTRO KYN- SPRINTBOOSTER', 'SUPRIMIR SILENCIADOR ALTO FLUJO + COLAS DOBLES C/MODIFICACION DE PARACHOQUE - INDUCCION FILTRO KYN- SPRINTBOOSTER', 649800, 'completada', '2023-04-24');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 1043: OT 2195
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'RAUL TORO' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'RAUL TORO', '19638791-9', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'DJCF70' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'DJCF70', 'BMW', '535I', 2012, 'S/C', 120) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '2195', 'DJCF70', 'INSTALACION CUT OUT 2,5'''' ENTRE LINEA', 'INSTALACION CUT OUT 2,5'''' ENTRE LINEA', 379900, 'completada', '2023-04-27');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 1044: OT 2196
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'MARCELO LOPEZ' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'MARCELO LOPEZ', '17919166-0', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'SBGX96' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'SBGX96', 'CUPRA', 'FORMENTOR', 2023, 'S/C', 13092) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '2196', 'SBGX96', 'CATBACK COMPLETO INTERCAMBIABLE CON MAGNAFLOW Y 4 COLAS BLACK', 'CATBACK COMPLETO INTERCAMBIABLE CON MAGNAFLOW Y 4 COLAS BLACK', 799900, 'completada', '2023-04-27');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 1045: OT 2197
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'PATRICIO FREDES' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'PATRICIO FREDES', '17994116-3', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'LKPX83' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'LKPX83', 'FORD', 'TRANSIT', 2019, 'S/C', 210) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '2197', 'LKPX83', 'FABRICACION PIEZA INTERCOOLER', 'FABRICACION PIEZA INTERCOOLER', 100000, 'completada', '2023-04-27');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 1046: OT 2198
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'EDUARDO ALFARO' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'EDUARDO ALFARO', '19559327-2', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'SLGC51' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'SLGC51', 'SUZUKI', 'SWIFT SPORT', 2023, 'S/C', 6389) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '2198', 'SLGC51', 'AXLE BACK FREE + COLAS 4 BLACK + ACONDICIONADOR BLACK MOOU', 'AXLE BACK FREE + COLAS 4 BLACK + ACONDICIONADOR BLACK MOOU', 329800, 'completada', '2023-05-03');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 1047: OT 2199
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'RODRIGO GONZALEZ' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'RODRIGO GONZALEZ', '19310999-3', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'RGSJ17' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'RGSJ17', 'SUBARU', 'WRX', 2022, 'S/C', 11132) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '2199', 'RGSJ17', 'AXLE BACK FREE C/ COLAS BLACK 4''''', 'AXLE BACK FREE C/ COLAS BLACK 4''''', 519900, 'completada', '2023-05-04');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 1048: OT 2200
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'MATIAS CACERES' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'MATIAS CACERES', '17242530-5', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'PJHW89' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'PJHW89', 'FIAT', 'DUCATO', 2021, 'S/C', 31) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '2200', 'PJHW89', 'CHEQUEO Y REPARACION EMBRAQUE', 'CHEQUEO Y REPARACION EMBRAQUE', 0, 'completada', '2023-05-05');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 1049: OT 2201
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'MATIAS TORRES' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'MATIAS TORRES', '99515740-3', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'PSSY85' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'PSSY85', 'VOLKSWAGEN', 'POLO GTS', 2021, 'S/C', 31437) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '2201', 'PSSY85', 'LINEA COMPLETA INOX + SILENCIADOR ALTO FLUJO MAGNAFLOW - COLAS INOX BLACK 3,5''''', 'LINEA COMPLETA INOX + SILENCIADOR ALTO FLUJO MAGNAFLOW - COLAS INOX BLACK 3,5''''', 650000, 'completada', '2023-05-09');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 1050: OT 2202
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'KAUFMANN' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'KAUFMANN', '18543374-9', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'FZHL62' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'FZHL62', 'MERCEDES', 'CL600', 2013, 'S/C', 0) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '2202', 'FZHL62', 'AXLE BACK FREE MANTIENE COLAS', 'AXLE BACK FREE MANTIENE COLAS', 400000, 'completada', '2023-05-10');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 1051: OT 2203
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'CRISTIAN BRAVO' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'CRISTIAN BRAVO', '', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'KWSB94' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'KWSB94', 'HONDA', 'CIVIC SI', 2019, 'S/C', 31055) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '2203', 'KWSB94', 'LINEA COMPLETA INOX 2,5'''' + SILENCIADOR ALTO FLUJO BORLA PERFORMANCE + 2 COLA INOX BLACK', 'LINEA COMPLETA INOX 2,5'''' + SILENCIADOR ALTO FLUJO BORLA PERFORMANCE + 2 COLA INOX BLACK', 759900, 'completada', '2023-05-11');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 1052: OT 2204
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'GABRIEL MALDONADO' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'GABRIEL MALDONADO', '17231169-5', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'HPWR21' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'HPWR21', 'BMW', '235I', 2016, 'S/C', 0) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '2204', 'HPWR21', 'MEDIA LINEA ACERO INOX 3'''' + SILENCIADOR ALTO FLUJO 3'''' VIBRANT PERFORMANCE + COLAS (LAS MANTIENE)', 'MEDIA LINEA ACERO INOX 3'''' + SILENCIADOR ALTO FLUJO 3'''' VIBRANT PERFORMANCE + COLAS (LAS MANTIENE)', 470000, 'completada', '2023-05-11');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 1053: OT 2205
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'DYLAN ESTAY' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'DYLAN ESTAY', '18360724-3', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'HWTV50' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'HWTV50', 'LEXUS', 'RX 350', 2016, 'S/C', 111) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '2205', 'HWTV50', 'INSTALACION CUT OUT 2,5'''' EN ZONA CENTRAL', 'INSTALACION CUT OUT 2,5'''' EN ZONA CENTRAL', 379900, 'completada', '2023-05-12');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 1054: OT 2206
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'TOMAS PINEDA' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'TOMAS PINEDA', '20186999-4', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'PDLC17' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'PDLC17', 'CHEVROLET', 'TRAIL BOSS', 2021, 'S/C', 31458) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '2206', 'PDLC17', 'INSTALACION BORLA', 'INSTALACION BORLA', 119900, 'completada', '2023-05-12');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 1055: OT 2207
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'SIMON RIQUELME' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'SIMON RIQUELME', '20425291-2', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'SVYR69' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'SVYR69', 'CHEVROLET', 'BLAZER RS', 2023, 'S/C', 186) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '2207', 'SVYR69', 'AXLE BACK COMPLETO MAGNAFLOW X2 CON COLAS 3,5'''' X4 BLACK GLOSSY', 'AXLE BACK COMPLETO MAGNAFLOW X2 CON COLAS 3,5'''' X4 BLACK GLOSSY', 920000, 'completada', '2023-05-12');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 1056: OT 2208
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'NICOLAS FARET' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'NICOLAS FARET', '18213585-2', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'SJWB64' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'SJWB64', 'BMW', 'X4M', 2023, 'S/C', 4829) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '2208', 'SJWB64', 'LINEA COMPLETA INOX DUAL 2,5'''' ELIMINADO  CATALITICO SECUNDARIOS Y RESONADOR CENTRAL', 'LINEA COMPLETA INOX DUAL 2,5'''' ELIMINADO  CATALITICO SECUNDARIOS Y RESONADOR CENTRAL', 725000, 'completada', '2023-05-15');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 1057: OT 2209
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'MATIAS SOLAR' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'MATIAS SOLAR', '18640710-5', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'PSSY85' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'PSSY85', 'VOLKSWAGEN', 'POLO GTS', 2021, 'S/C', 32020) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '2209', 'PSSY85', 'INSTALACION CUT OUT + RE POSICIONAR MAGNAFLOW + INSTALACION COLAS A NUEVO SILENCIADOR TRASERO', 'INSTALACION CUT OUT + RE POSICIONAR MAGNAFLOW + INSTALACION COLAS A NUEVO SILENCIADOR TRASERO', 460000, 'completada', '2023-05-15');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 1058: OT 2210
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'MARCO PORTALE' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'MARCO PORTALE', '18543375-9', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'LZKL81' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'LZKL81', 'PEUGEOT', 'RIFTER', 2020, 'S/C', 101000) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '2210', 'LZKL81', 'REPROGRAMACION DE ECU DPF/EGR OFF', 'REPROGRAMACION DE ECU DPF/EGR OFF', 280000, 'completada', '2023-05-16');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 1059: OT 2211
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'KAUFMANN S.A' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'KAUFMANN S.A', '25336028-3', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'JCYX32' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'JCYX32', 'MERCEDES', 'G500', 2017, 'S/C', 151656) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '2211', 'JCYX32', 'FABICACION DE PIEZAS C/INSTALACION DE CATALITICO MAGNAFLOW', 'FABICACION DE PIEZAS C/INSTALACION DE CATALITICO MAGNAFLOW', 1100000, 'completada', '2023-05-16');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 1060: OT 2212
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'NICOLAS DELGADO' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'NICOLAS DELGADO', '92475000-6', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'LZKL90' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'LZKL90', 'PEUGEOT', '208', 2020, 'S/C', 84080) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '2212', 'LZKL90', 'FILTRO PANEL BMC - ESCAPE AXLE BACK FREE+ COLAS DOBLE - SPRINTBOOSTER', 'FILTRO PANEL BMC - ESCAPE AXLE BACK FREE+ COLAS DOBLE - SPRINTBOOSTER', 594900, 'completada', '2023-05-16');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 1061: OT 2213
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'MARCEL FAVEREAU' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'MARCEL FAVEREAU', '17371777-6', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'HYHJ63' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'HYHJ63', 'VOLKSWAGEN', 'GOLF TSI', 2016, 'S/C', 67) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '2213', 'HYHJ63', 'LINEA COMPLETA INOX 2,5'''' + SILENCIADOR ALTO FLUJO + COLAS DOBLES INOX 3'''' CROMO', 'LINEA COMPLETA INOX 2,5'''' + SILENCIADOR ALTO FLUJO + COLAS DOBLES INOX 3'''' CROMO', 679900, 'completada', '2023-05-18');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 1062: OT 2214
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'DANIEL VISECHE' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'DANIEL VISECHE', '18519898-7', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'BTVJ92' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'BTVJ92', 'SUBARU', 'IMPRESA', 2009, 'S/C', 0) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '2214', 'BTVJ92', 'LINEA COMPLETA + SILENCIADOR ALTO FLUJO SILENPRO EXHAUST + MODIFICACION DE PARACHOQUE Y 4 COLAS INOX 3''''', 'LINEA COMPLETA + SILENCIADOR ALTO FLUJO SILENPRO EXHAUST + MODIFICACION DE PARACHOQUE Y 4 COLAS INOX 3''''', 670000, 'completada', '2023-05-18');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 1063: OT 2215
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'FRANCISCO VIVANCO' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'FRANCISCO VIVANCO', '27097150-4', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'GPTX84' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'GPTX84', 'CHEVROLET', 'SILVERADO', 2014, 'S/C', 152) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '2215', 'GPTX84', 'INSTALACION SILENCIADOR ALTO FLUJO MAGNAFLOW', 'INSTALACION SILENCIADOR ALTO FLUJO MAGNAFLOW', 279900, 'completada', '2023-05-18');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 1064: OT 2216
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'SIMON ESPINOZA' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'SIMON ESPINOZA', '17289368-6', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'GXLD94' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'GXLD94', 'BMW', '220I', 2015, 'S/C', 63) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '2216', 'GXLD94', 'MODIFICACION AXLE BACK, CON BRAZOS NUEVOS + CUT OUT POR UNA SALIDA + COLA M PERFORMANCE NEGRAS', 'MODIFICACION AXLE BACK, CON BRAZOS NUEVOS + CUT OUT POR UNA SALIDA + COLA M PERFORMANCE NEGRAS', 630000, 'completada', '2023-05-19');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 1065: OT 2217
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'CLIENTE GENERICO' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'CLIENTE GENERICO', '17600021-K', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'SIN-PAT' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'SIN-PAT', 'S/M', 'S/M', 0, 'S/C', 0) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '2217', 'SIN-PAT', 'Carga masiva', 'Carga masiva', 0, 'completada', '2026-01-01');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 1066: OT 2218
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'CLIENTE GENERICO' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'CLIENTE GENERICO', '', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'SIN-PAT' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'SIN-PAT', 'S/M', 'S/M', 0, 'S/C', 0) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '2218', 'SIN-PAT', 'Carga masiva', 'Carga masiva', 0, 'completada', '2026-01-01');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 1067: OT 2219
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'BRYAN GONZALEZ' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'BRYAN GONZALEZ', '', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'JTZJ30' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'JTZJ30', 'AUDI', 'A5', 2017, 'S/C', 0) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '2219', 'JTZJ30', 'LINEA COMPLETA INOX 3'''' + SILENCIADOR ALTO FLUJO MAGNAFLOW C/ RE INSTALACION BORLA DOBLE SALIDA ESCAPE AXLE BACK FREE', 'LINEA COMPLETA INOX 3'''' + SILENCIADOR ALTO FLUJO MAGNAFLOW C/ RE INSTALACION BORLA DOBLE SALIDA ESCAPE AXLE BACK FREE', 749900, 'completada', '2023-05-23');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 1068: OT 2220
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'PABLO CHIAPARA' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'PABLO CHIAPARA', '20130851-8', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'GVGX62' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'GVGX62', 'BMW', '220I', 2014, 'S/C', 28300) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '2220', 'GVGX62', 'AXLE BACK MAGNAFLOW C/ COLAS DOBLE BLACK M PERFORMANCE', 'AXLE BACK MAGNAFLOW C/ COLAS DOBLE BLACK M PERFORMANCE', 425000, 'completada', '2023-05-24');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 1069: OT 2221
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'EMILIO JAMET' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'EMILIO JAMET', '24513273-5', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'HHFX90' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'HHFX90', 'MERCEDES', 'CLA 180', 2015, 'S/C', 79558) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '2221', 'HHFX90', 'CARGA DE SOFWARE ORIGINAL MERCEDES', 'CARGA DE SOFWARE ORIGINAL MERCEDES', 49900, 'completada', '2023-05-24');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 1070: OT 2222
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'RAFAEL PEÑA' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'RAFAEL PEÑA', '17760924-2', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'GTZP86' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'GTZP86', 'FORD', 'F150', 0, 'S/C', 0) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '2222', 'GTZP86', 'INSTALACION MAGNAFLOW CENTRAL - FABRICACION ULTIMO TRAMO LINEA INOX C/COLA CORSA 4''''', 'INSTALACION MAGNAFLOW CENTRAL - FABRICACION ULTIMO TRAMO LINEA INOX C/COLA CORSA 4''''', 519900, 'completada', '2023-05-25');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 1071: OT 2223
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'SEBASTIAN ABATE' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'SEBASTIAN ABATE', '14002494-5', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'SGVR47' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'SGVR47', 'CHEVROLET', 'SILVERADO', 2023, 'S/C', 1700) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '2223', 'SGVR47', 'INSTALACION BORLA ALTO FLUJO (LO TRAE CLIENTE) SUPRIMIR AMBOS SILENCIADORES TRASEROS PEQUEÑOS', 'INSTALACION BORLA ALTO FLUJO (LO TRAE CLIENTE) SUPRIMIR AMBOS SILENCIADORES TRASEROS PEQUEÑOS', 240000, 'completada', '2023-05-26');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 1072: OT 2224
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'JEAN ARAYA' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'JEAN ARAYA', '15333913-9', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'DPBS13' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'DPBS13', 'KIA CERATO', 'CERATOS', 2012, 'S/C', 168000) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '2224', 'DPBS13', 'MEDIA LINEA INOX 2,5'''' C/ FLEXIBLE Y SENSOR OXIGENO + MAGNAFLOW GLASSPACK - REPRO DE ECU STAGE 2', 'MEDIA LINEA INOX 2,5'''' C/ FLEXIBLE Y SENSOR OXIGENO + MAGNAFLOW GLASSPACK - REPRO DE ECU STAGE 2', 800000, 'completada', '2023-05-29');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 1073: OT 2225
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'CLIENTE GENERICO' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'CLIENTE GENERICO', '17580187-1', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'SIN-PAT' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'SIN-PAT', 'S/M', 'S/M', 0, 'S/C', 0) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '2225', 'SIN-PAT', 'Carga masiva', 'Carga masiva', 0, 'completada', '2026-01-01');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 1074: OT 2226
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'CLIENTE GENERICO' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'CLIENTE GENERICO', '', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'SIN-PAT' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'SIN-PAT', 'S/M', 'S/M', 0, 'S/C', 0) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '2226', 'SIN-PAT', 'Carga masiva', 'Carga masiva', 0, 'completada', '2026-01-01');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 1075: OT 2227
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'VIVIANA LOYOLA' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'VIVIANA LOYOLA', '', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'SLLH78' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'SLLH78', 'DODGE', 'RAM REBEL', 2023, 'S/C', 10717) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '2227', 'SLLH78', 'INSTALACION VALVULA CUT OUT', 'INSTALACION VALVULA CUT OUT', 349900, 'completada', '2023-05-30');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 1076: OT 2228
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'NICOLAS GALLARDO' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'NICOLAS GALLARDO', '21149580-4', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'DXZC25' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'DXZC25', 'OPEL', 'CORSA OPC', 2012, 'S/C', 104) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '2228', 'DXZC25', 'AXLE BACK MAGNAFLOW + COLA INOX 4''''', 'AXLE BACK MAGNAFLOW + COLA INOX 4''''', 370000, 'completada', '2023-05-31');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 1077: OT 2229
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'FELIPE IBAÑEZ' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'FELIPE IBAÑEZ', '19406557-4', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'SVWL16' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'SVWL16', 'CUPRA', 'FORNENTOR 190', 2023, 'S/C', 500) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '2229', 'SVWL16', 'LINEA COMPLETA INOX + 4 COLAS BLACK Y MODIFICACION DE DIFUSOR', 'LINEA COMPLETA INOX + 4 COLAS BLACK Y MODIFICACION DE DIFUSOR', 660000, 'completada', '2023-06-01');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 1078: OT 2230
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'RONNY MUÑOZ' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'RONNY MUÑOZ', '16711793-7', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'KVRS19' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'KVRS19', 'TOYOTA', 'HILUX', 2018, 'S/C', 77) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '2230', 'KVRS19', 'REPRO DE ECU STAGE 1', 'REPRO DE ECU STAGE 1', 320000, 'completada', '2023-06-01');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 1079: OT 2231
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'FRANCO GIACONOZZI' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'FRANCO GIACONOZZI', '12986123-1', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'JPWG21' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'JPWG21', 'TOYOTA', 'HILUX', 2017, 'S/C', 127208) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '2231', 'JPWG21', 'REPRO DE ECU STAGE 2 C/ DPF Y EGROFF', 'REPRO DE ECU STAGE 2 C/ DPF Y EGROFF', 500000, 'completada', '2023-06-01');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 1080: OT 2232
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'JOAQUIN RUIZ' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'JOAQUIN RUIZ', '18966318-8', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'SL7872' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'SL7872', 'TOYOTA', 'STARLET', 1998, 'S/C', 0) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '2232', 'SL7872', 'INSTALACION MULTIPLE + LINEA INOX 2'''' + BORLA PERFORMANCE + 1 COLA INOX 3''''', 'INSTALACION MULTIPLE + LINEA INOX 2'''' + BORLA PERFORMANCE + 1 COLA INOX 3''''', 650000, 'completada', '2023-06-02');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 1081: OT 2233
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'VICTOR PEDRERO' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'VICTOR PEDRERO', '18023295-8', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'BHPW79' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'BHPW79', 'BMW', '330I', 2008, 'S/C', 165) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '2233', 'BHPW79', 'AXLE BACK FREE C/ DOBLE COLA INOX 3''''', 'AXLE BACK FREE C/ DOBLE COLA INOX 3''''', 210000, 'completada', '2023-06-06');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 1082: OT 2234
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'CARLOS LETELIER' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'CARLOS LETELIER', '18926107-1', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'HBLT70' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'HBLT70', 'MERCEDES', 'G350', 2015, 'S/C', 120) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '2234', 'HBLT70', 'REAPRIETE 3 PERNOS TURBO - REPARACION FUGA DE ESCAPE EN LINEA', 'REAPRIETE 3 PERNOS TURBO - REPARACION FUGA DE ESCAPE EN LINEA', 50000, 'completada', '2023-06-08');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 1083: OT 2235
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'ARNOLD SOTO' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'ARNOLD SOTO', '8669986-9', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'GVFK67' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'GVFK67', 'KIA', 'SPORTAGE', 2014, 'S/C', 113976) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '2235', 'GVFK67', 'SUPRIMIR Y VACIAR CATALITICO - STAGE 2 DECAT - SPRINTBOOSTER', 'SUPRIMIR Y VACIAR CATALITICO - STAGE 2 DECAT - SPRINTBOOSTER', 930000, 'completada', '2023-06-09');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 1084: OT 2236
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'RAFAEL PEÑA' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'RAFAEL PEÑA', '20244089-4', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'GTZP86' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'GTZP86', 'FORD', 'F150', 2015, 'S/C', 0) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '2236', 'GTZP86', 'REEMPLAZO 1 MAGNAFLOW GLASSPACK INTERMEDIO', 'REEMPLAZO 1 MAGNAFLOW GLASSPACK INTERMEDIO', 300000, 'completada', '2023-06-09');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 1085: OT 2237
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'ALVARO MARIN' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'ALVARO MARIN', '14002494-5', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'TW5002' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'TW5002', 'NISSAN', '350 Z', 2007, 'S/C', 0) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '2237', 'TW5002', 'SUPRIMIR CATALITICO Y FABRICAR PIEZA  CON HILO SENSOR - REPARACION DE AXLE BACK CON MODIFICACION Y PULIDO DE COLAS - REPRO DE ECU C/POPS AND BAUG', 'SUPRIMIR CATALITICO Y FABRICAR PIEZA  CON HILO SENSOR - REPARACION DE AXLE BACK CON MODIFICACION Y PULIDO DE COLAS - REPRO DE ECU C/POPS AND BAUG', 990000, 'completada', '2023-06-13');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 1086: OT 2238
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'DANIEL JOFRE' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'DANIEL JOFRE', '17879498-9', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'JCLT29' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'JCLT29', 'BMW', '220I', 2017, 'S/C', 95596) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '2238', 'JCLT29', 'MEDIA LINEA INOX + COLA DOBLE M PERFORMANCE', 'MEDIA LINEA INOX + COLA DOBLE M PERFORMANCE', 450000, 'completada', '2023-06-19');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 1087: OT 2239
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'VICTOR JULIET' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'VICTOR JULIET', '17875699-0', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'DBWY21' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'DBWY21', 'LAND ROVER', 'R. ROVER SPORT', 2011, 'S/C', 181) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '2239', 'DBWY21', 'MUFFLER CENTER DELETE POR INOX 2,5''''', 'MUFFLER CENTER DELETE POR INOX 2,5''''', 250000, 'completada', '2023-06-20');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 1088: OT 2240
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'RONALD' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'RONALD', '17344871-6', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'RHKT59' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'RHKT59', 'SUZUKI', 'SWIFT SPORT', 2022, 'S/C', 23647) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '2240', 'RHKT59', 'AXLE BACK FREE INOX, MANTIENE COLAS', 'AXLE BACK FREE INOX, MANTIENE COLAS', 219900, 'completada', '2023-06-20');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 1089: OT 2241
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'MANUEL ALVAREZ' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'MANUEL ALVAREZ', '18927084-4', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'TJ2104' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'TJ2104', 'MAZDA', '323', 1999, 'S/C', 209800) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '2241', 'TJ2104', 'LINEA COMPLETA INOX 2'''' C/CLAMP + SILENCIADOR ALTO FLUJO BORLA PERFORMANCE', 'LINEA COMPLETA INOX 2'''' C/CLAMP + SILENCIADOR ALTO FLUJO BORLA PERFORMANCE', 499900, 'completada', '2023-06-22');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 1090: OT 2242
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'PATRICIO AGUIRRE' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'PATRICIO AGUIRRE', '', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'FPFH60' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'FPFH60', 'AUDI', 'A5', 2013, 'S/C', 1226079) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '2242', 'FPFH60', 'MEDIA LINEA PRIMERA PARTE CON FLEXIBLE', 'MEDIA LINEA PRIMERA PARTE CON FLEXIBLE', 269900, 'completada', '2023-06-23');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 1091: OT 2243
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'RICARDO RIVERA' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'RICARDO RIVERA', '17064071-3', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'DGPC96' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'DGPC96', 'FORD', 'F150', 2011, 'S/C', 124) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '2243', 'DGPC96', 'INSTALACION CUT OUT ELECTRONICO STEEL MONKEY C/2 CONTROLES CONFIGURADOS', 'INSTALACION CUT OUT ELECTRONICO STEEL MONKEY C/2 CONTROLES CONFIGURADOS', 349900, 'completada', '2023-06-30');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 1092: OT 2244
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'NICOLAS MANCILLA SOLAR' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'NICOLAS MANCILLA SOLAR', '16970046-8', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'KZFW71' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'KZFW71', 'FORD', 'RANGER', 2019, 'S/C', 62) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '2244', 'KZFW71', 'DOWNPIPE + LINEA COMPLETA INOX 2,5'''' + SILENCIADOR ALTO FLUJO + STAGE 2', 'DOWNPIPE + LINEA COMPLETA INOX 2,5'''' + SILENCIADOR ALTO FLUJO + STAGE 2', 1640000, 'completada', '2023-06-30');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 1093: OT 2245
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'FRANCISCO LAGOS' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'FRANCISCO LAGOS', '17619337-9', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'BKYR35' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'BKYR35', 'MITSUBISHI', 'LANCER', 2008, 'S/C', 279) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '2245', 'BKYR35', 'AXLE BACK FREE + 2 COLAS INOX BLACK GLOSSY', 'AXLE BACK FREE + 2 COLAS INOX BLACK GLOSSY', 299900, 'completada', '2023-07-04');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 1094: OT 2246
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'FELIPE CACERES' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'FELIPE CACERES', '17001301-8', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'GTZT75' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'GTZT75', 'CHEVROLET', 'CRUZE', 2014, 'S/C', 171) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '2246', 'GTZT75', 'REINSTALACION LINEA ORIGINAL - CAMBIO TRAMO LINEA POR ACERO INOX 2'''' CORTE 45''''', 'REINSTALACION LINEA ORIGINAL - CAMBIO TRAMO LINEA POR ACERO INOX 2'''' CORTE 45''''', 55000, 'completada', '2023-07-04');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 1095: OT 2247
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'NICOLAS FARET' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'NICOLAS FARET', '18487913-1', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'SJWB64' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'SJWB64', 'BMW', 'X4 M', 2023, 'S/C', 5985) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '2247', 'SJWB64', 'INSTALACION 2 ALTO FLUJO CENTRAL', 'INSTALACION 2 ALTO FLUJO CENTRAL', 400000, 'completada', '2023-07-04');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 1096: OT 2248
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'CLIENTE GENERICO' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'CLIENTE GENERICO', '18640710-5', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'SIN-PAT' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'SIN-PAT', 'S/M', 'S/M', 0, 'S/C', 0) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '2248', 'SIN-PAT', 'XPIPE CENTRAL SUPRIME SILENCIADOR ALTO FLUJO CENTRAL - REPARACION DE CUBRE MOTOR, SOLDADO PLASTICO', 'XPIPE CENTRAL SUPRIME SILENCIADOR ALTO FLUJO CENTRAL - REPARACION DE CUBRE MOTOR, SOLDADO PLASTICO', 0, 'completada', '2026-01-01');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 1097: OT 2249
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'CRISTIAN MORALES' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'CRISTIAN MORALES', '', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'GXDH21' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'GXDH21', 'FORD', 'FOCUS', 2015, 'S/C', 0) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '2249', 'GXDH21', 'AXLE BACK MAGNAFLOW PROYECTO A EVALUAR, O AXLE BACK -  COLA 5'''' CROMO', 'AXLE BACK MAGNAFLOW PROYECTO A EVALUAR, O AXLE BACK -  COLA 5'''' CROMO', 200000, 'completada', '2023-07-05');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 1098: OT 2250
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'FRANCISCO GONZALEZ' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'FRANCISCO GONZALEZ', '18245364-1', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'FWZB87' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'FWZB87', 'VOLVO', 'V40', 2013, 'S/C', 88243) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '2250', 'FWZB87', 'AXLE BACK FREE 2,5'''' C/COLAS BLACK GLOSSY Y DOBLE ANILLO INTERCAMBIABLE CON ORIGINAL - REPRO STAGE 1', 'AXLE BACK FREE 2,5'''' C/COLAS BLACK GLOSSY Y DOBLE ANILLO INTERCAMBIABLE CON ORIGINAL - REPRO STAGE 1', 719700, 'completada', '2023-07-06');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 1099: OT 2251
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'SEBASTIAN OYE' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'SEBASTIAN OYE', '18194151-0', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'SBZD90' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'SBZD90', 'FORD', 'MACH 1', 2023, 'S/C', 3451) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '2251', 'SBZD90', 'Carga masiva', 'Carga masiva', 449800, 'completada', '2023-07-17');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 1100: OT 2252
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'FRANCISCO MOLINA' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'FRANCISCO MOLINA', '13922739-5', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'GPGT36' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'GPGT36', 'DODGE', 'SRT', 2014, 'S/C', 0) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '2252', 'GPGT36', 'INSTALACION 2 MAGNAFLOW', 'INSTALACION 2 MAGNAFLOW', 560000, 'completada', '2023-07-20');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    RAISE NOTICE 'Procesados 1100 registros...';
    -- Fila 1101: OT 2253
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'FELIPE CACERES' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'FELIPE CACERES', '8951008-2', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'GTZT75' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'GTZT75', 'CHEVROLET', 'CRUZE', 2014, 'S/C', 172677) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '2253', 'GTZT75', 'CAMBIO MASAS C/ RODAMIENTO DELANTERO -EMPAQUETADURA TAPA VALVULA - KIT ORING ENFRIADOR ACEITE - HORAS DE TRABAJO - ACEITE+FILTRO+MANO DE OBRA', 'CAMBIO MASAS C/ RODAMIENTO DELANTERO -EMPAQUETADURA TAPA VALVULA - KIT ORING ENFRIADOR ACEITE - HORAS DE TRABAJO - ACEITE+FILTRO+MANO DE OBRA', 295715, 'completada', '2023-07-20');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 1102: OT 2254
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'DANIEL DE SANTIS' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'DANIEL DE SANTIS', '18487913-1', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'RPDX39' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'RPDX39', 'BMW', 'X3', 2022, 'S/C', 0) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '2254', 'RPDX39', 'AXLE BACK FREE C/ COLAS BLACK GLOSSY M PERFORMANCE', 'AXLE BACK FREE C/ COLAS BLACK GLOSSY M PERFORMANCE', 449900, 'completada', '2023-07-21');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 1103: OT 2255
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'MAY FABREGA' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'MAY FABREGA', '21608442-K', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'SXJK89' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'SXJK89', 'SUBARU', 'WRX', 2023, 'S/C', 12317) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '2255', 'SXJK89', 'AXLE BACK FREE C/FLANCHE Y COLAS DUAL 3'''' INOX CROMO', 'AXLE BACK FREE C/FLANCHE Y COLAS DUAL 3'''' INOX CROMO', 499900, 'completada', '2023-07-21');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 1104: OT 2256
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'SERGIO HUERTA' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'SERGIO HUERTA', '22802289-6', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'HA1838' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'HA1838', 'MINI', 'COOPER', 0, 'S/C', 0) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '2256', 'HA1838', 'LINEA COMPLETA INOX 2'''' C/FLEXIBLE + SILENCIADOR ALTO FLUJO MAGNAFLOW C/COLAS', 'LINEA COMPLETA INOX 2'''' C/FLEXIBLE + SILENCIADOR ALTO FLUJO MAGNAFLOW C/COLAS', 499900, 'completada', '2023-07-25');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 1105: OT 2257
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'FELIPE CACERES' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'FELIPE CACERES', '11650452-9', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'GTZT75' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'GTZT75', 'CHEVROLET', 'CRUZE', 2014, 'S/C', 172992) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '2257', 'GTZT75', 'REPARACION TAPON CARTER - BUJIAS X4 - FILTRO ACEITE - ACEITE GM', 'REPARACION TAPON CARTER - BUJIAS X4 - FILTRO ACEITE - ACEITE GM', 291906, 'completada', '2023-07-28');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 1106: OT 2258
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'RODRIGO GUERRERA' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'RODRIGO GUERRERA', '', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'KYKH35' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'KYKH35', 'VOLKSWAGEN', 'GTI MK 7.5', 2019, 'S/C', 85899) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '2258', 'KYKH35', 'REPRO DE ECU STAGE 1', 'REPRO DE ECU STAGE 1', 349900, 'completada', '2023-07-29');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 1107: OT 2259
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'RICARDO JORQUERA' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'RICARDO JORQUERA', '13473232-2', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'LZHC75' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'LZHC75', 'FORD', 'F150', 2020, 'S/C', 33195) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '2259', 'LZHC75', 'INSTALACION CATALITICO ALTO FLUJO MAGNAFLOW', 'INSTALACION CATALITICO ALTO FLUJO MAGNAFLOW', 940300, 'completada', '2023-08-07');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 1108: OT 2260
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'ALEJANDRO MUÑOZ' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'ALEJANDRO MUÑOZ', '19523618-6', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'HTKY93' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'HTKY93', 'AUDI', 'RS6', 2016, 'S/C', 60476) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '2260', 'HTKY93', 'CARGA SOFTWARE STAGE 2 PAGADO, ANTERIORMENTE SEE HABIA DEJADO STOCK TRAS DIAGNOSTICO DE PERDIDA COMPRESION, MEZCLA 2LITROS METNANOL TANQUE LLENO', 'CARGA SOFTWARE STAGE 2 PAGADO, ANTERIORMENTE SEE HABIA DEJADO STOCK TRAS DIAGNOSTICO DE PERDIDA COMPRESION, MEZCLA 2LITROS METNANOL TANQUE LLENO', 0, 'completada', '2023-08-07');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 1109: OT 2261
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'TOMAS LAGOS CASTRO' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'TOMAS LAGOS CASTRO', '17903008-K', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'JVRL35' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'JVRL35', 'BMW', '118I', 2017, 'S/C', 58321) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '2261', 'JVRL35', 'AXLE BACK FREE INOX C/COLAS M - REPRO ECU STAGE 1', 'AXLE BACK FREE INOX C/COLAS M - REPRO ECU STAGE 1', 640000, 'completada', '2023-08-17');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 1110: OT 2262
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'JOAQUIN VALENZUELA' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'JOAQUIN VALENZUELA', '21770487-1', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'SIN-PAT' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'SIN-PAT', 'S/M', 'ESCARABAJO', 1997, 'S/C', 0) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '2262', 'SIN-PAT', 'CAMBIO CATALITICO', 'CAMBIO CATALITICO', 0, 'completada', '2026-01-01');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 1111: OT 2263
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'ALEX CUBILLOS' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'ALEX CUBILLOS', '', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'HPHF19' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'HPHF19', 'VOLKSWAGEN', 'GOLF GTI', 2016, 'S/C', 127255) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '2263', 'HPHF19', 'DOWNPIPE NUEVA INOX 3'''' CON CLANP 3'''' + KIT FLAMA CON MODIFICACION LINEA EN COLAS', 'DOWNPIPE NUEVA INOX 3'''' CON CLANP 3'''' + KIT FLAMA CON MODIFICACION LINEA EN COLAS', 1300000, 'completada', '2023-08-24');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 1112: OT 2264
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'CLAUDIO' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'CLAUDIO', '15609109-7', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'KTXB34' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'KTXB34', 'HONDA', 'CIVIC', 2019, 'S/C', 49474) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '2264', 'KTXB34', 'MANTENIMIENTO, CAMBIO ACEITE+FILTRO ACEITE+FILTRO AIRE+FILTRO POLEN. C/MANO OBRA - PASTILLA DELANTERA C/INSTALACION COLA ESCAPE.SUPRIME SILENCIADOR', 'MANTENIMIENTO, CAMBIO ACEITE+FILTRO ACEITE+FILTRO AIRE+FILTRO POLEN. C/MANO OBRA - PASTILLA DELANTERA C/INSTALACION COLA ESCAPE.SUPRIME SILENCIADOR', 569700, 'completada', '2023-08-24');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 1113: OT 2265
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'PAUL VALENZUELA' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'PAUL VALENZUELA', '18609123-K', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'PJDL10' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'PJDL10', 'SUBARU', 'IMPRESA STI', 2021, 'S/C', 33061) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '2265', 'PJDL10', 'Carga masiva', 'Carga masiva', 0, 'completada', '2023-08-25');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 1114: OT 2266
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'NICOLAS OÑATE' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'NICOLAS OÑATE', '19600231-6', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'LWLX61' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'LWLX61', 'MAZDA', '3', 2020, 'S/C', 0) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '2266', 'LWLX61', 'AXLE BACK NUEVO INOX CON FLANCHE NUEVO + 2 ALTO FLUJO SILENPRO + COLAS INOX 3,5''''', 'AXLE BACK NUEVO INOX CON FLANCHE NUEVO + 2 ALTO FLUJO SILENPRO + COLAS INOX 3,5''''', 500000, 'completada', '2023-08-28');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 1115: OT 2267
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'JORGE GUAITA' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'JORGE GUAITA', '18652083-1', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'GJGD35' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'GJGD35', 'TOYOTA', 'LAND CRUISER', 2015, 'S/C', 167767) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '2267', 'GJGD35', 'INSTALACION MODULO CUT OUT C/2 CONTROL REMOTO', 'INSTALACION MODULO CUT OUT C/2 CONTROL REMOTO', 349900, 'completada', '2023-09-12');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 1116: OT 2268
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'BENJAMIN DIAZ' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'BENJAMIN DIAZ', '13461520-6', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'JXHW92' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'JXHW92', 'VOLKSWAGEN', 'SCIROCCO', 2018, 'S/C', 40365) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '2268', 'JXHW92', 'DOWNPIPE + POPS AND BANG', 'DOWNPIPE + POPS AND BANG', 559900, 'completada', '2023-09-13');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 1117: OT 2269
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'XINGZE JI' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'XINGZE JI', '20963635-2', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'HLCS57' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'HLCS57', 'BMW', '435I', 2016, 'S/C', 0) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '2269', 'HLCS57', 'MEDIA LINEA INOX + SILENCIADOR ALTO FLUJO MAGNAFLOW C/ COLAS NUEVAS BLACK GLOSSY M PERFORMANCE', 'MEDIA LINEA INOX + SILENCIADOR ALTO FLUJO MAGNAFLOW C/ COLAS NUEVAS BLACK GLOSSY M PERFORMANCE', 680000, 'completada', '2023-09-21');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 1118: OT 2270
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'PABLO IRARRAZABAL' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'PABLO IRARRAZABAL', '24402399-1', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'SPPY69' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'SPPY69', 'CHEVROLET', 'SILVERADO', 2023, 'S/C', 5800) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '2270', 'SPPY69', 'REEMPLAZO DE SILENCIADOR ORIGINAL POR ALTO FLUJO BORLA COMPETICION C/ANTI DRONE', 'REEMPLAZO DE SILENCIADOR ORIGINAL POR ALTO FLUJO BORLA COMPETICION C/ANTI DRONE', 519900, 'completada', '2023-09-22');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 1119: OT 2271
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'MARCELO PEREZ' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'MARCELO PEREZ', '19639333-1', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'SCKT14' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'SCKT14', 'VOLKSWAGEN', 'GOL', 2022, 'S/C', 0) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '2271', 'SCKT14', 'REEMPLAZO SILENCIADOR ORIGINAL POR ALTO FLUJO + COLA Y ANTIDRONE - INSTALACION KYN', 'REEMPLAZO SILENCIADOR ORIGINAL POR ALTO FLUJO + COLA Y ANTIDRONE - INSTALACION KYN', 290000, 'completada', '2023-10-03');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 1120: OT 2272
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'BENJAMIN' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'BENJAMIN', '16561595-K', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'SWTV48' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'SWTV48', 'SUZUKI', 'SWIFT', 2023, 'S/C', 0) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '2272', 'SWTV48', 'ESCAPE', 'ESCAPE', 239900, 'completada', '2023-10-03');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 1121: OT 2273
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'CLIENTE GENERICO' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'CLIENTE GENERICO', '21650216-7', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'KWLD22' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'KWLD22', 'GOLF', 'S/M', 0, 'S/C', 0) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '2273', 'KWLD22', 'INSTALACION CUT OUT', 'INSTALACION CUT OUT', 350000, 'completada', '2023-10-04');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 1122: OT 2274
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'FRANCISCO' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'FRANCISCO', '', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'SIN-PAT' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'SIN-PAT', 'BMW', 'N240I', 2020, 'S/C', 0) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '2274', 'SIN-PAT', 'DOWNPIPE + LINEA + ALTO FLUJO VIBRANT SIN COLAS + STAGE 2', 'DOWNPIPE + LINEA + ALTO FLUJO VIBRANT SIN COLAS + STAGE 2', 1600000, 'completada', '2023-10-04');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 1123: OT 2275
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'ROBERTO' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'ROBERTO', '19135763-9', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'LKKX68' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'LKKX68', 'VELOSTER', 'S/M', 2019, 'S/C', 51137) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '2275', 'LKKX68', 'Carga masiva', 'Carga masiva', 350000, 'completada', '2023-10-13');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 1124: OT 2276
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'ISAAD ILICH' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'ISAAD ILICH', '15366374-2', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'KCRT74' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'KCRT74', 'FORD', 'FOCUS RS', 2018, 'S/C', 41198) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '2276', 'KCRT74', 'DOWNPIPE DECAT VACIADO + REPRO ECU STAGE 2 DECAT', 'DOWNPIPE DECAT VACIADO + REPRO ECU STAGE 2 DECAT', 330000, 'completada', '2023-10-16');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 1125: OT 2277
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'IGNACIO' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'IGNACIO', '21104941-3', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'SIN-PAT' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'SIN-PAT', 'BMW', 'Z3', 0, 'S/C', 0) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '2277', 'SIN-PAT', 'Carga masiva', 'Carga masiva', 640000, 'completada', '2026-01-01');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 1126: OT 2278
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'IGNACIO MUÑOS' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'IGNACIO MUÑOS', '16212975-9', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'ZV2673' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'ZV2673', 'NISSAN', '350 Z', 2006, 'S/C', 0) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '2278', 'ZV2673', 'AXLE BACK + 2 COLAS 4''''', 'AXLE BACK + 2 COLAS 4''''', 320000, 'completada', '2026-01-01');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 1127: OT 2279
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'DIEGO SOLAR' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'DIEGO SOLAR', '18957897-0', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'SZRC83' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'SZRC83', 'FORD', 'RANGER', 2023, 'S/C', 1744) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '2279', 'SZRC83', 'LINEA COMPLETA INOX + 2 COLA INOX 4'''' CAMIONETA - SPRINTBOOSTER', 'LINEA COMPLETA INOX + 2 COLA INOX 4'''' CAMIONETA - SPRINTBOOSTER', 1130000, 'completada', '2023-10-24');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 1128: OT 2280
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'CLIENTE GENERICO' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'CLIENTE GENERICO', '17172001-K', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'TBXD76' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'TBXD76', 'CHEVROLET', 'SILVERADO', 0, 'S/C', 0) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '2280', 'TBXD76', 'LINEA COMPLETA ACERO INOX 3'''' CON DOBLE SALIDA EN 2,5'''' Y COLAS NEGRAS', 'LINEA COMPLETA ACERO INOX 3'''' CON DOBLE SALIDA EN 2,5'''' Y COLAS NEGRAS', 1049900, 'completada', '2023-10-24');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 1129: OT 2281
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'BELEN LOYOLA' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'BELEN LOYOLA', '', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'PPSC93' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'PPSC93', 'VOLKSWAGEN', 'GTI', 2021, 'S/C', 0) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '2281', 'PPSC93', 'DOWNPIPE', 'DOWNPIPE', 380000, 'completada', '2023-10-25');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 1130: OT 2282
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'BRUNO MORAGA' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'BRUNO MORAGA', '21149580-4', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'FZ6655' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'FZ6655', 'MERCEDES', 'A200', 2014, 'S/C', 0) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '2282', 'FZ6655', 'STAGE 1 +26HP+70NM', 'STAGE 1 +26HP+70NM', 349900, 'completada', '2023-10-26');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 1131: OT 2283
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'BRUNO MORATELLI' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'BRUNO MORATELLI', '16809035-8', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'LPRF50' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'LPRF50', 'BMW', 'X5M', 2020, 'S/C', 0) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '2283', 'LPRF50', 'INSTALACION 2 ANTI DRONE EN 2,5''''', 'INSTALACION 2 ANTI DRONE EN 2,5''''', 220000, 'completada', '2023-11-07');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 1132: OT 2284
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'IGNACIO GONZALEZ HERNANDEZ' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'IGNACIO GONZALEZ HERNANDEZ', '18446497-7', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'GXFT87' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'GXFT87', 'MERCEDES', 'A200', 2015, 'S/C', 90222) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '2284', 'GXFT87', 'SE EXTRAE CATALITICO ORIGINAL Y SE REEMPLAZA, MODIFICANDO DOWNPIPE + ILILO SENSOR 02 SE HACE SCANNER Y DEJA PARAMETROS EN CERO SIN OBS', 'SE EXTRAE CATALITICO ORIGINAL Y SE REEMPLAZA, MODIFICANDO DOWNPIPE + ILILO SENSOR 02 SE HACE SCANNER Y DEJA PARAMETROS EN CERO SIN OBS', 285000, 'completada', '2023-11-20');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 1133: OT 2285
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'MARCELO CAJAS' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'MARCELO CAJAS', '18419936-8', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'JVXJ37' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'JVXJ37', 'MAZDA', 'MIATA MXS ND', 2017, 'S/C', 64018) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '2285', 'JVXJ37', 'AXLE BACK MAGNAFLOW INOX 2 CUT OUT 2,5'''' + 2 COLAS INOX 3''''', 'AXLE BACK MAGNAFLOW INOX 2 CUT OUT 2,5'''' + 2 COLAS INOX 3''''', 580000, 'completada', '2023-11-24');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 1134: OT 2286
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'CLIENTE GENERICO' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'CLIENTE GENERICO', '', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'SIN-PAT' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'SIN-PAT', 'S/M', 'S/M', 0, 'S/C', 0) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '2286', 'SIN-PAT', 'Carga masiva', 'Carga masiva', 0, 'completada', '2026-01-01');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 1135: OT 2287
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'GUILLERMO CERDA' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'GUILLERMO CERDA', '', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'RTKX58' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'RTKX58', 'RENAULT', 'MEGANE RS 4', 2022, 'S/C', 11295) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '2287', 'RTKX58', 'DOWNPIPE - LINEA COMPLETA INOX 3'''' + SILENCIADOR ALTO FLUJO - REPRO ECU STAGE 2', 'DOWNPIPE - LINEA COMPLETA INOX 3'''' + SILENCIADOR ALTO FLUJO - REPRO ECU STAGE 2', 0, 'completada', '2023-11-29');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 1136: OT 2288
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'CLIENTE GENERICO' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'CLIENTE GENERICO', '', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'SIN-PAT' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'SIN-PAT', 'S/M', 'S/M', 0, 'S/C', 0) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '2288', 'SIN-PAT', 'Carga masiva', 'Carga masiva', 0, 'completada', '2026-01-01');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 1137: OT 2289
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'VICTOR VIAL' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'VICTOR VIAL', '', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'SWXD11' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'SWXD11', 'FORD', 'MACH 1', 2023, 'S/C', 7211) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '2289', 'SWXD11', 'FABRICACION E INSTALACION DE XPIPE CENTRAL', 'FABRICACION E INSTALACION DE XPIPE CENTRAL', 250000, 'completada', '2023-12-05');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 1138: OT 2290
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'CRISTOPHER BRAVO' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'CRISTOPHER BRAVO', '10985601-0', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'LTKR55' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'LTKR55', 'CUPRA', 'ATECA', 2021, 'S/C', 38096) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '2290', 'LTKR55', 'DOWNPIPE INOX C/ HILO OPF DONANTE ORIGINAL+ REPRO DE ECU STAGE 2 CON OPF DECAT', 'DOWNPIPE INOX C/ HILO OPF DONANTE ORIGINAL+ REPRO DE ECU STAGE 2 CON OPF DECAT', 1150000, 'completada', '2023-12-12');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 1139: OT 2291
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'DIEGO NOVOA' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'DIEGO NOVOA', '17877849-4', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'KRJB43' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'KRJB43', 'BMW', '140I', 2018, 'S/C', 83950) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '2291', 'KRJB43', 'DOWNPIPE INOX FABRICACION E INSTALACION', 'DOWNPIPE INOX FABRICACION E INSTALACION', 390000, 'completada', '2023-12-14');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 1140: OT 2292
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'DANIEL FUENZALIDA' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'DANIEL FUENZALIDA', '', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'GWDX73' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'GWDX73', 'PORSCHE', 'MACAN', 2015, 'S/C', 167843) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '2292', 'GWDX73', 'REPRO DE ECU STAGE 1', 'REPRO DE ECU STAGE 1', 450000, 'completada', '2023-12-14');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 1141: OT 2293
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'RIGOBERTO HERNANDEZ' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'RIGOBERTO HERNANDEZ', '9589188-8', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'CSWP18' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'CSWP18', 'MERCEDES', 'C63 W 204', 2011, 'S/C', 95337) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '2293', 'CSWP18', 'LINEA NUEVA INOX 2,5'''' + SILENCIADOR ALTO FLUJO MAGNAFLOW C/XPIPE + MOD COLAS C/PULIDO + CINTA TERMICA INSTALADA', 'LINEA NUEVA INOX 2,5'''' + SILENCIADOR ALTO FLUJO MAGNAFLOW C/XPIPE + MOD COLAS C/PULIDO + CINTA TERMICA INSTALADA', 1100000, 'completada', '2023-12-18');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 1142: OT 2294
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'MAXIMILIANO TOBAR' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'MAXIMILIANO TOBAR', '18076151-9', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'FZXF91' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'FZXF91', 'PEUGEOT', '208', 2014, 'S/C', 51870) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '2294', 'FZXF91', 'ADAPTACION C/ INSTALACION DE CATALITICO MAGNAFLOW + AXLE BACK FREE C/ COLA INOX 3''''', 'ADAPTACION C/ INSTALACION DE CATALITICO MAGNAFLOW + AXLE BACK FREE C/ COLA INOX 3''''', 620000, 'completada', '2023-12-19');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 1143: OT 2295
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'CLAUDIO CUADRA' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'CLAUDIO CUADRA', '19276014-3', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'DLVS48' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'DLVS48', 'BMW', '325I E92', 2012, 'S/C', 172473) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '2295', 'DLVS48', 'AXLE BACK VIBRANT PERFORMANCE C/COLAS DUAL 3,5''''', 'AXLE BACK VIBRANT PERFORMANCE C/COLAS DUAL 3,5''''', 379900, 'completada', '2023-12-19');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 1144: OT 2296
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'ENRIQUE OSSES' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'ENRIQUE OSSES', '17244115-7', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'PXSH18' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'PXSH18', 'RAM', '1500', 2021, 'S/C', 97195) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '2296', 'PXSH18', 'LINEA COMPLETA INOX + SILENCIADOR ALTO FLUJO 2,5'''' C/ 4 COLAS CROMO', 'LINEA COMPLETA INOX + SILENCIADOR ALTO FLUJO 2,5'''' C/ 4 COLAS CROMO', 1527000, 'completada', '2023-12-21');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 1145: OT 2297
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'GONZALO ZAPATA' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'GONZALO ZAPATA', '76533797-6', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'FJDR84' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'FJDR84', 'SUZUKI', 'GRAND VITARA', 2013, 'S/C', 148998) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '2297', 'FJDR84', 'AXLE BACK WICKEDFLOW + COLA INOX 4''''', 'AXLE BACK WICKEDFLOW + COLA INOX 4''''', 319900, 'completada', '2024-01-15');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 1146: OT 2298
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'MARCELO FRENTE' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'MARCELO FRENTE', '16364168-2', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'LZHX60' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'LZHX60', 'CHEVROLET', 'SILVERADO', 2020, 'S/C', 7) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '2298', 'LZHX60', 'INSTALACION WICKEDFLOW KAMIKASE BLACK', 'INSTALACION WICKEDFLOW KAMIKASE BLACK', 319900, 'completada', '2024-01-19');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 1147: OT 2299
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'MATIAS' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'MATIAS', '12465960-4', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'FZZL56' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'FZZL56', 'MERCEDES', 'A45 W176', 2013, 'S/C', 92) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '2299', 'FZZL56', 'AXLE BACK FREE CON REVISION Y LIMPIEZA CHAPALETA (VALVULA) LIMPIEZA ADNISION Y MAF(FILTRO INCLUIDO)SOLDADURA ALUMINIO-SOPORTE MOTOR-SOLDADO TAPA TURBO', 'AXLE BACK FREE CON REVISION Y LIMPIEZA CHAPALETA (VALVULA) LIMPIEZA ADNISION Y MAF(FILTRO INCLUIDO)SOLDADURA ALUMINIO-SOPORTE MOTOR-SOLDADO TAPA TURBO', 575000, 'completada', '2024-01-22');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 1148: OT 2300
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'JORGE ZUÑIGA' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'JORGE ZUÑIGA', '21985665-2', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'GHPY34' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'GHPY34', 'SUBARU', 'TRIBECA', 2914, 'S/C', 175861) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '2300', 'GHPY34', 'REEMPLAZO 2CATALITICOS C/MODIFICACION SENSOR                         10%OFF', 'REEMPLAZO 2CATALITICOS C/MODIFICACION SENSOR                         10%OFF', 400000, 'completada', '2024-01-23');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 1149: OT 2301
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'JORGE' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'JORGE', '13780945-1', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'SHPZ40' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'SHPZ40', 'FORD', 'MUSTANG', 2023, 'S/C', 12700) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '2301', 'SHPZ40', 'XPIPE INOX', 'XPIPE INOX', 249900, 'completada', '2024-01-25');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 1150: OT 2302
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'CLIENTE GENERICO' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'CLIENTE GENERICO', '', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'SIN-PAT' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'SIN-PAT', 'S/M', 'S/M', 0, 'S/C', 0) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '2302', 'SIN-PAT', 'Carga masiva', 'Carga masiva', 0, 'completada', '2026-01-01');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 1151: OT 2303
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'PAOLO BASHAS' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'PAOLO BASHAS', '19992465-6', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'JRWV89' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'JRWV89', 'MERCEDES', 'GLE 43', 2017, 'S/C', 54624) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '2303', 'JRWV89', 'AXLE BACK + SILENCIADORES MAGNAFLOW 10416', 'AXLE BACK + SILENCIADORES MAGNAFLOW 10416', 750000, 'completada', '2024-01-25');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 1152: OT 2304
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'RICARDO' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'RICARDO', '', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'DD6911' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'DD6911', 'BMW', 'E30', 1988, 'S/C', 0) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '2304', 'DD6911', 'INSTALACION MULTIPLE DE ESCAPE, FABRICACION LINEA DE ESCAPE 2,5'''' + SILENCIADOR BORLA ALTO FLUJO + COLAS DOBLES', 'INSTALACION MULTIPLE DE ESCAPE, FABRICACION LINEA DE ESCAPE 2,5'''' + SILENCIADOR BORLA ALTO FLUJO + COLAS DOBLES', 0, 'completada', '2024-01-26');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 1153: OT 2305
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'RUBEN RIOS' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'RUBEN RIOS', '23012673-9', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'GWDH55' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'GWDH55', 'R 5', 'CAMARO', 2014, 'S/C', 50000) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '2305', 'GWDH55', 'AXLE BACK 2,5'''' C/ SILEMPRO ALTO FLUJO, MANTIENE COLAS', 'AXLE BACK 2,5'''' C/ SILEMPRO ALTO FLUJO, MANTIENE COLAS', 449900, 'completada', '2024-03-21');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 1154: OT 2355
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'CARLOS DIAZ' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'CARLOS DIAZ', '8544195-7', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'FYXF77' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'FYXF77', 'MERCEDES', 'SLK 200', 2015, 'S/C', 74) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '2355', 'FYXF77', 'INSTALACION MODULO CUT OUT SMG C/ 2 CONTROL REMOTO', 'INSTALACION MODULO CUT OUT SMG C/ 2 CONTROL REMOTO', 349900, 'completada', '2024-06-13');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 1155: OT 2356
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'RAQUEL MARTINEZ' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'RAQUEL MARTINEZ', '18830930-5', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'THTJ16' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'THTJ16', 'CUPRA', '190', 2024, 'S/C', 3000) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '2356', 'THTJ16', 'INSTALACION CUT OUT 2''''', 'INSTALACION CUT OUT 2''''', 349900, 'completada', '2024-06-24');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 1156: OT 2357
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'PEDRO SANCHEZ' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'PEDRO SANCHEZ', '16516942-5', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'TLWS85' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'TLWS85', 'SUBARU', 'WKX', 2024, 'S/C', 221) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '2357', 'TLWS85', 'MID PIPE + SILENCIADOR MAGNAFLOW 4 COLAS', 'MID PIPE + SILENCIADOR MAGNAFLOW 4 COLAS', 799900, 'completada', '2024-06-25');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 1157: OT 2358
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'JOSE MANUEL URENDA' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'JOSE MANUEL URENDA', '', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'SYZS70' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'SYZS70', 'BMW', 'Z4', 2023, 'S/C', 0) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '2358', 'SYZS70', 'INSTALACION COLAS DE ESCAPE - INSTALACION FALDONES CARBONO', 'INSTALACION COLAS DE ESCAPE - INSTALACION FALDONES CARBONO', 310000, 'completada', '2024-07-01');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 1158: OT 2359
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'ANGELA MOCCO' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'ANGELA MOCCO', '18927879-9', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'LKXS57' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'LKXS57', 'BMW', '420I', 2019, 'S/C', 0) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '2359', 'LKXS57', 'INSTALACION CUT OUT 2,5''''', 'INSTALACION CUT OUT 2,5''''', 349900, 'completada', '2024-07-02');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 1159: OT 2360
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'MARCELO ROBLE' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'MARCELO ROBLE', '19113540-7', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'ZV2645' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'ZV2645', 'JEEP', 'CHEROKEE', 2006, 'S/C', 0) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '2360', 'ZV2645', 'INSTALACION CUT OUT 2,5''''', 'INSTALACION CUT OUT 2,5''''', 349900, 'completada', '2024-07-03');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 1160: OT 2361
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'SERGIO RODRIGUEZ' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'SERGIO RODRIGUEZ', '15380178-9', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'DYKR35' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'DYKR35', 'BMW', '135I', 2012, 'S/C', 0) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '2361', 'DYKR35', 'INSTALACION SILENCIADOR MAGNAFLOW (PROPIO CLIENTE)', 'INSTALACION SILENCIADOR MAGNAFLOW (PROPIO CLIENTE)', 80000, 'completada', '2024-07-03');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 1161: OT 2362
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'MATIAS ESPINOZA' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'MATIAS ESPINOZA', '19647047-6', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'STDY49' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'STDY49', 'GEELY', 'CODKAY', 2023, 'S/C', 0) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '2362', 'STDY49', 'INSTALACION CUT OUT 2''''', 'INSTALACION CUT OUT 2''''', 349900, 'completada', '2024-07-04');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 1162: OT 2363
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'VALENTIN BENET' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'VALENTIN BENET', '', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'EN7348' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'EN7348', 'BMW', 'E30', 0, 'S/C', 0) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '2363', 'EN7348', 'AXLE BACK + SILENCIADOR WICKEDFLOW SC 212 + COLAS DOBLES', 'AXLE BACK + SILENCIADOR WICKEDFLOW SC 212 + COLAS DOBLES', 0, 'completada', '2024-07-04');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 1163: OT 2364
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'GUSTAVO SILVA' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'GUSTAVO SILVA', '', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'CBZB40' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'CBZB40', 'CHEVROLET', 'SILVERADO', 2019, 'S/C', 0) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '2364', 'CBZB40', 'INSTALACION WICKEDFLOW KM300', 'INSTALACION WICKEDFLOW KM300', 339900, 'completada', '2024-07-05');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 1164: OT 2365
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'ALEJANDRO PEÑA' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'ALEJANDRO PEÑA', '15465536-0', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'SKZJ40' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'SKZJ40', 'CHEVROLET', 'ZRZ', 0, 'S/C', 0) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '2365', 'SKZJ40', 'INSTALACION CUTOUT 3''''', 'INSTALACION CUTOUT 3''''', 349900, 'completada', '2024-07-05');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 1165: OT 2366
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'ALBERTO PIWONKA' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'ALBERTO PIWONKA', '', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'SZSC40' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'SZSC40', 'SUBARU', 'WRX', 2023, 'S/C', 0) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '2366', 'SZSC40', 'CAT BACK + MAGNAFLOW 10416 + DOBLE COLAS', 'CAT BACK + MAGNAFLOW 10416 + DOBLE COLAS', 799900, 'completada', '2024-07-08');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 1166: OT 2367
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'JOSE INCIARTE' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'JOSE INCIARTE', '', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'DJTT26' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'DJTT26', 'TOYOTA', 'FJ CRUSIER', 2012, 'S/C', 0) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '2367', 'DJTT26', 'REEMPLAZO ANULACION CUT OUT 25 TUBO 2,5''''', 'REEMPLAZO ANULACION CUT OUT 25 TUBO 2,5''''', 70000, 'completada', '2024-07-09');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 1167: OT 2368
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'ELISEO CORNEJO' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'ELISEO CORNEJO', '18042509-1', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'RXYW25' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'RXYW25', 'FORD', 'F150', 2022, 'S/C', 0) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '2368', 'RXYW25', 'INSTALACION CUT OUT 3''''', 'INSTALACION CUT OUT 3''''', 349900, 'completada', '2024-07-11');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 1168: OT 2369
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'ALEJANDRO PEÑA' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'ALEJANDRO PEÑA', '13233441-3', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'SXXW34' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'SXXW34', 'CHEVROLET', 'BLAZER', 2023, 'S/C', 0) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '2369', 'SXXW34', 'REPARACION COLAS (DOBLADAS) GARANTIA FUGAS DE ESCAPE', 'REPARACION COLAS (DOBLADAS) GARANTIA FUGAS DE ESCAPE', 45000, 'completada', '2024-07-15');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 1169: OT 2370
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'PEDRO SAN MARTIN' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'PEDRO SAN MARTIN', '12797937-5', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'KLTJ30' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'KLTJ30', 'FORD', 'RANGER', 2018, 'S/C', 0) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '2370', 'KLTJ30', 'REPARACION FUGAS ESCAPE - SET+3', 'REPARACION FUGAS ESCAPE - SET+3', 225000, 'completada', '2024-07-17');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 1170: OT 2371
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'VICTOR VIAL' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'VICTOR VIAL', '10985601-0', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'SWXD11' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'SWXD11', 'FORD', 'MACH 1', 0, 'S/C', 0) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '2371', 'SWXD11', 'REEMPLAZO CATALITICO ORIGINAL TUBO DIRECTO', 'REEMPLAZO CATALITICO ORIGINAL TUBO DIRECTO', 200000, 'completada', '2024-07-26');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 1171: OT 2372
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'CRISTIAN MUNIZAGO' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'CRISTIAN MUNIZAGO', '15485718-4', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'PGKJ75' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'PGKJ75', 'CHEVROLET', 'SILVERADO', 2020, 'S/C', 0) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '2372', 'PGKJ75', 'INSTALACION CUT OUT 3''''', 'INSTALACION CUT OUT 3''''', 349900, 'completada', '2024-08-07');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 1172: OT 2373
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'THOMAS AFFELD' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'THOMAS AFFELD', '17724222-5', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'KPTV11' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'KPTV11', 'FORD', 'RANGER', 0, 'S/C', 0) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '2373', 'KPTV11', 'INSTALACION COLA ESCAPE 2,5'''' 4'''' NEGRA', 'INSTALACION COLA ESCAPE 2,5'''' 4'''' NEGRA', 150000, 'completada', '2024-08-07');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 1173: OT 2374
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'EDWIN ENRIQUE' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'EDWIN ENRIQUE', '9968233-7', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'SIN-PAT' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'SIN-PAT', 'S/M', 'S/M', 0, 'S/C', 0) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '2374', 'SIN-PAT', 'Carga masiva', 'Carga masiva', 0, 'completada', '2026-01-01');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 1174: OT 2375
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'HECTOR ARERALO' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'HECTOR ARERALO', '13094517-1', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'RBSH45' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'RBSH45', 'FORD', 'F150', 0, 'S/C', 0) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '2375', 'RBSH45', 'INSTALACION CUT OUT 3''''', 'INSTALACION CUT OUT 3''''', 379900, 'completada', '2024-08-12');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 1175: OT 2376
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'LUCCA' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'LUCCA', '16888177-0', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'TJPF12' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'TJPF12', 'FORD', 'F150', 0, 'S/C', 0) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '2376', 'TJPF12', 'INSTALACION COLA DE ESCAPE BORLA - INSTALACION SILENCIADOR BORLA 401339', 'INSTALACION COLA DE ESCAPE BORLA - INSTALACION SILENCIADOR BORLA 401339', 385000, 'completada', '2024-08-13');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 1176: OT 2377
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'ANDRES RODRIGUEZ' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'ANDRES RODRIGUEZ', '', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'SZRZ27' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'SZRZ27', 'CUPRA', 'ATECA CUPRA', 2024, 'S/C', 8467) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '2377', 'SZRZ27', 'INSTALACION SILENCIADOR ALTO FLUJO 3'''' INOX - SERVICIO DOMICILIO', 'INSTALACION SILENCIADOR ALTO FLUJO 3'''' INOX - SERVICIO DOMICILIO', 290000, 'completada', '2024-08-13');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 1177: OT 2378
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'CLIENTE GENERICO' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'CLIENTE GENERICO', '', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'LTKR55' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'LTKR55', 'CUPRA', 'ATECA', 0, 'S/C', 0) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '2378', 'LTKR55', 'INSTALACION SILENCIADORALTO FLUJO 3'''' INOX 12'''' LARGO', 'INSTALACION SILENCIADORALTO FLUJO 3'''' INOX 12'''' LARGO', 260000, 'completada', '2024-08-16');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 1178: OT 2380
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'SEBASTIAN ALVAREZ' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'SEBASTIAN ALVAREZ', '19233679-1', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'GDJB64' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'GDJB64', 'VOLVO', '140', 2014, 'S/C', 0) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '2380', 'GDJB64', 'INSTALACION SILENCIADOR SILEMPRO 1 ENTRADA 2 SALIDA', 'INSTALACION SILENCIADOR SILEMPRO 1 ENTRADA 2 SALIDA', 599900, 'completada', '2024-08-21');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 1179: OT 2381
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'JUAN PABLO FERNANDEZ' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'JUAN PABLO FERNANDEZ', '', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'KGXZ79' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'KGXZ79', 'VOLKSWAGEN', 'GOLF GTI', 2018, 'S/C', 0) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '2381', 'KGXZ79', 'REEMPLAZO BORLA 3'''' POR TUBO 2,5''''', 'REEMPLAZO BORLA 3'''' POR TUBO 2,5''''', 65000, 'completada', '2024-08-23');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 1180: OT 2382
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'IGNACIO CASALE' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'IGNACIO CASALE', '16368326-1', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'LTKZ52' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'LTKZ52', 'FORD', 'F150', 2020, 'S/C', 0) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '2382', 'LTKZ52', 'REEMPLAZO SILENCIADOR TRASERO POR BORLA 3''''', 'REEMPLAZO SILENCIADOR TRASERO POR BORLA 3''''', 0, 'completada', '2024-08-27');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 1181: OT 2383
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'ANDY ROJAS' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'ANDY ROJAS', '19184248-8', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'HVXF95' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'HVXF95', 'MAZDA', '6', 2016, 'S/C', 0) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '2383', 'HVXF95', 'REEMPLAZO AXLE BACK SMG POR SILENCIADOR TRAS. ORIGINAL', 'REEMPLAZO AXLE BACK SMG POR SILENCIADOR TRAS. ORIGINAL', 79900, 'completada', '2024-08-27');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 1182: OT 2384
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'DANIEL SILVA' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'DANIEL SILVA', '19823650-0', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'KRWV87' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'KRWV87', 'BMW', '240I', 2019, 'S/C', 0) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '2384', 'KRWV87', 'AXLE BACK FREE + TRAMO INTERMEDIO - COLAS DOBLE', 'AXLE BACK FREE + TRAMO INTERMEDIO - COLAS DOBLE', 399900, 'completada', '2024-08-28');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 1183: OT 2385
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'VICTOR FICA' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'VICTOR FICA', '16818454-9', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'PXWT46' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'PXWT46', 'FORD', 'F150', 2021, 'S/C', 0) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '2385', 'PXWT46', 'INSTALACION CUT OUT 2,5''''', 'INSTALACION CUT OUT 2,5''''', 379900, 'completada', '2024-08-30');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 1184: OT 2386
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'JORGE SOSSDORF' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'JORGE SOSSDORF', '15936092-K', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'GXCJ80' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'GXCJ80', 'MERCEDES', 'A200', 2015, 'S/C', 0) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '2386', 'GXCJ80', 'INSTALACION CUT OUT 2,5''''', 'INSTALACION CUT OUT 2,5''''', 349900, 'completada', '2024-09-03');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 1185: OT 2388
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'BRAYN LOPEZ' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'BRAYN LOPEZ', '19877987-4', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'PLKX47' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'PLKX47', 'CHEVROLET', 'CAMARO', 2021, 'S/C', 0) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '2388', 'PLKX47', 'INSTALACION CUT OUT 2,5''''', 'INSTALACION CUT OUT 2,5''''', 719900, 'completada', '2024-09-09');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 1186: OT 2389
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'EDMUNDO URRUTIA' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'EDMUNDO URRUTIA', '17038277-3', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'GXXF16' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'GXXF16', 'AUDI', 'A7', 2014, 'S/C', 0) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '2389', 'GXXF16', 'REPARACION FLANGE DOWNPIPE - CAMBIO FLEXIBLE -BAJAR ZUMBIDO ESCAPE - VACIADO CATALITICO  - MANO DE OBRA', 'REPARACION FLANGE DOWNPIPE - CAMBIO FLEXIBLE -BAJAR ZUMBIDO ESCAPE - VACIADO CATALITICO  - MANO DE OBRA', 0, 'completada', '2024-09-10');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 1187: OT 2390
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'FRANCISCO OLID' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'FRANCISCO OLID', '18957220-4', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'SIN-PAT' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'SIN-PAT', 'AUDI', 'TTS', 0, 'S/C', 0) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '2390', 'SIN-PAT', 'ELIMINACION SILENCIADOR TRASERO', 'ELIMINACION SILENCIADOR TRASERO', 65000, 'completada', '2024-09-25');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 1188: OT 2391
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'HECTOR ALVAREZ' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'HECTOR ALVAREZ', '15668890-8', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'LDGG73' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'LDGG73', 'MERCEDES', 'G500', 0, 'S/C', 57261) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '2391', 'LDGG73', 'INSTALACION COLA AMG', 'INSTALACION COLA AMG', 649900, 'completada', '2024-09-26');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 1189: OT 2392
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'PEDRO GALLEGO' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'PEDRO GALLEGO', '18075832-1', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'SIN-PAT' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'SIN-PAT', 'RAM', '700', 0, 'S/C', 0) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '2392', 'SIN-PAT', 'INSTALACION EMPAQUE 2''''', 'INSTALACION EMPAQUE 2''''', 0, 'completada', '2024-09-27');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 1190: OT 2393
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'FRANCISCO AHUMADA' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'FRANCISCO AHUMADA', '15786062-3', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'GPCJ18' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'GPCJ18', 'FORD', 'F150', 2014, 'S/C', 0) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '2393', 'GPCJ18', 'INSTALACION WICKEDFLOW 3'''' SC 300', 'INSTALACION WICKEDFLOW 3'''' SC 300', 299900, 'completada', '2024-10-02');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 1191: OT 2394
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'FELIPE GUTIERREZ' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'FELIPE GUTIERREZ', '16658311-K', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'TBGZ18' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'TBGZ18', 'MAZDA', '3', 2024, 'S/C', 0) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '2394', 'TBGZ18', 'INSTALACION CUT OUT 2''''', 'INSTALACION CUT OUT 2''''', 379900, 'completada', '2024-10-02');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 1192: OT 2395
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'BASTIAN RAVAÑAL' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'BASTIAN RAVAÑAL', '19481591-3', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'KZXT61' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'KZXT61', 'SUBARU', 'IMPREZA', 2019, 'S/C', 0) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '2395', 'KZXT61', 'INSTALACION CUT OUT 2,5''''', 'INSTALACION CUT OUT 2,5''''', 379900, 'completada', '2024-10-07');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 1193: OT 2396
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'MATIAS DIAZ' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'MATIAS DIAZ', '18061533-9', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'JSRV23' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'JSRV23', 'MAZDA', 'BT 50', 2017, 'S/C', 0) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '2396', 'JSRV23', 'FABRICACION INDUCCION 2,5''''', 'FABRICACION INDUCCION 2,5''''', 139900, 'completada', '2024-10-07');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 1194: OT 2397
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'FERNANDO VERA' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'FERNANDO VERA', '20282144-8', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'SRDS88' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'SRDS88', 'SUBARU', 'IMPREZA', 2022, 'S/C', 0) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '2397', 'SRDS88', 'AXLE BACK+SILENCIADOR SILEMPRO 2'''' + COLA NEGRA SALIDA 4''''', 'AXLE BACK+SILENCIADOR SILEMPRO 2'''' + COLA NEGRA SALIDA 4''''', 279900, 'completada', '2024-10-10');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 1195: OT 2398
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'CRISTIAN GONZALEZ' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'CRISTIAN GONZALEZ', '16337266-5', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'SYVZ49' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'SYVZ49', 'CHEVROLET', 'CAMARO', 2023, 'S/C', 0) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '2398', 'SYVZ49', 'FABRICACION AXLE BACK FREE', 'FABRICACION AXLE BACK FREE', 320000, 'completada', '2024-10-10');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 1196: OT 2399
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'EMILIO FERNANDEZ' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'EMILIO FERNANDEZ', '17089047-7', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'SIN-PAT' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'SIN-PAT', 'FORD', 'BRONCO', 2024, 'S/C', 0) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '2399', 'SIN-PAT', 'INSTALACION DOWNPIPE SPD + AXLE BACK WICKEDFLOW', 'INSTALACION DOWNPIPE SPD + AXLE BACK WICKEDFLOW', 440000, 'completada', '2024-10-16');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 1197: OT 2400
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'JOSE MIGUEL MATTA' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'JOSE MIGUEL MATTA', '21461767-6', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'SIN-PAT' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'SIN-PAT', 'RAM', '1500', 2022, 'S/C', 0) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '2400', 'SIN-PAT', 'INSTALACION CUT OUT', 'INSTALACION CUT OUT', 399900, 'completada', '2024-10-17');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 1198: OT 2401
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'RUBEN RIOS' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'RUBEN RIOS', '23012673-9', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'GWDH55' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'GWDH55', 'R 5', 'CAMARO', 2014, 'S/C', 50000) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '2401', 'GWDH55', 'AXLE BACK 2,5'''' C/ SILEMPRO ALTO FLUJO, MANTIENE COLAS', 'AXLE BACK 2,5'''' C/ SILEMPRO ALTO FLUJO, MANTIENE COLAS', 449900, 'completada', '2024-03-21');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 1199: OT 2402
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'RICHARD' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'RICHARD', '13901997-0', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'GGWY18' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'GGWY18', 'AUDI', 'RS5', 1014, 'S/C', 47000) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '2402', 'GGWY18', 'REEMPLAZO SILENCIADOR CENTRAL POR XPIPE', 'REEMPLAZO SILENCIADOR CENTRAL POR XPIPE', 249900, 'completada', '2024-05-14');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 1200: OT 2403
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'CLIENTE GENERICO' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'CLIENTE GENERICO', '', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'SIN-PAT' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'SIN-PAT', 'S/M', 'S/M', 0, 'S/C', 0) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '2403', 'SIN-PAT', 'Carga masiva', 'Carga masiva', 0, 'completada', '2026-01-01');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    RAISE NOTICE 'Procesados 1200 registros...';
    -- Fila 1201: OT 2404
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'CLIENTE GENERICO' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'CLIENTE GENERICO', '', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'SIN-PAT' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'SIN-PAT', 'S/M', 'S/M', 0, 'S/C', 0) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '2404', 'SIN-PAT', 'Carga masiva', 'Carga masiva', 0, 'completada', '2026-01-01');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 1202: OT 2405
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'PATRICIO ROMAN' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'PATRICIO ROMAN', '13222889-2', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'PBBT14' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'PBBT14', 'CHEVROLET', 'SILVERADO', 2021, 'S/C', 62) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '2405', 'PBBT14', 'INSTALACION MODULO CUT OUT 3'''' SMG GARANTIA 1 AÑO', 'INSTALACION MODULO CUT OUT 3'''' SMG GARANTIA 1 AÑO', 0, 'completada', '2024-10-18');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 1203: OT 2406
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'MATIAS GONZALEZ' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'MATIAS GONZALEZ', '20397278-9', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'ZU7555' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'ZU7555', 'TOYOTA', 'COROLLA', 2006, 'S/C', 0) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '2406', 'ZU7555', 'LINEA COMPLETA + SILENCIADOR SILEMPRO 2'''' + COLA 2,5''''', 'LINEA COMPLETA + SILENCIADOR SILEMPRO 2'''' + COLA 2,5''''', 479900, 'completada', '2024-10-23');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 1204: OT 2407
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'KENNER' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'KENNER', '', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'KBYV85' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'KBYV85', 'AUDI', 'A6', 2018, 'S/C', 64952) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '2407', 'KBYV85', 'DOWNPIPE INOX 20%', 'DOWNPIPE INOX 20%', 379900, 'completada', '2024-10-23');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 1205: OT 2408
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'KENNER' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'KENNER', '', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'PDFH35' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'PDFH35', 'MERCEDES', 'A300', 0, 'S/C', 41732) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '2408', 'PDFH35', 'DOWNPIPE INOX 20%', 'DOWNPIPE INOX 20%', 399900, 'completada', '2024-10-23');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 1206: OT 2409
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'KENNER' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'KENNER', '', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'GHFJ56' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'GHFJ56', 'MINI', 'COOPER', 2014, 'S/C', 103697) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '2409', 'GHFJ56', 'DOWNPIPE DPF/DECAT VALOR ESPECIAL 20%', 'DOWNPIPE DPF/DECAT VALOR ESPECIAL 20%', 379900, 'completada', '2024-10-23');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 1207: OT 2410
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'KENNER' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'KENNER', '', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'SIN-PAT' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'SIN-PAT', 'TOYOTA', 'TACONA', 0, 'S/C', 0) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '2410', 'SIN-PAT', 'INSTALACION BORLA PROXS 2,5 + 40.000 REPASO SOLDADURA', 'INSTALACION BORLA PROXS 2,5 + 40.000 REPASO SOLDADURA', 439900, 'completada', '2024-10-23');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 1208: OT 2411
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'KENNER' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'KENNER', '', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'SIN-PAT' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'SIN-PAT', 'FORD', 'MACH 1', 0, 'S/C', 0) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '2411', 'SIN-PAT', 'XPIPE 20% - FILTRO AIRE 5/DSTO', 'XPIPE 20% - FILTRO AIRE 5/DSTO', 439900, 'completada', '2024-10-23');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 1209: OT 2412
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'CRISTIAN ALVAREZ' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'CRISTIAN ALVAREZ', '16930324-K', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'RXZV54' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'RXZV54', 'FORD', 'F150', 2022, 'S/C', 0) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '2412', 'RXZV54', 'INSTALACION CUT OUT 3''''', 'INSTALACION CUT OUT 3''''', 399900, 'completada', '2024-10-24');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 1210: OT 2413
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'FRED GODOY' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'FRED GODOY', '20852528-K', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'HSFJ77' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'HSFJ77', 'BMW', '235I', 2016, 'S/C', 0) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '2413', 'HSFJ77', 'CAMBIO ABRAZADERA CLAMP 3''''', 'CAMBIO ABRAZADERA CLAMP 3''''', 40000, 'completada', '2024-10-25');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 1211: OT 2414
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'PABLO ALFARO' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'PABLO ALFARO', '17952916-5', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'LCYT61' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'LCYT61', 'AUDI', 'RS Q3', 2019, 'S/C', 0) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '2414', 'LCYT61', 'ELIMINACION CATALITICO CENTRALES', 'ELIMINACION CATALITICO CENTRALES', 100000, 'completada', '2024-10-25');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 1212: OT 2415
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'MARIO FUENZALIZA' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'MARIO FUENZALIZA', '11868247-5', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'TKTC42' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'TKTC42', 'MAZDA', 'CX60', 2024, 'S/C', 0) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '2415', 'TKTC42', 'INSTALACION CUT OUT 2,5''''', 'INSTALACION CUT OUT 2,5''''', 399900, 'completada', '2024-10-28');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 1213: OT 2416
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'MICHAEL' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'MICHAEL', '16562471-8', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'PDKL34' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'PDKL34', 'JEEP', 'GLADIADOR', 2021, 'S/C', 0) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '2416', 'PDKL34', 'FABRICACION DE LINEA ESCAPE COMPLETO + SILENCIADOR CUT OUT 2,5'''' SMG+INSTALACION BORLA 3''''+ REEMPLAZO SILENCIADOR CENTRAL', 'FABRICACION DE LINEA ESCAPE COMPLETO + SILENCIADOR CUT OUT 2,5'''' SMG+INSTALACION BORLA 3''''+ REEMPLAZO SILENCIADOR CENTRAL', 1619800, 'completada', '2024-10-30');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 1214: OT 2417
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'MANUEL GUIÑEZ' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'MANUEL GUIÑEZ', '13082137-5', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'JCCG57' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'JCCG57', 'FORD', 'F150', 0, 'S/C', 0) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '2417', 'JCCG57', 'INSTALACION CUT OUT 3''''', 'INSTALACION CUT OUT 3''''', 379900, 'completada', '2024-11-11');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 1215: OT 2418
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'KENNER' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'KENNER', '', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'GPLP70' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'GPLP70', 'ROLL ROYCE', 'SILVER CLOUD', 1961, 'S/C', 0) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '2418', 'GPLP70', 'LINEA DE ESCAPE - SILENCIADOR BORLA PROXS 2,5'''' - SILENCIADOR MAGNAFLOW 2,5''''', 'LINEA DE ESCAPE - SILENCIADOR BORLA PROXS 2,5'''' - SILENCIADOR MAGNAFLOW 2,5''''', 0, 'completada', '2024-11-07');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 1216: OT 2419
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'NICOLAS TORRES' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'NICOLAS TORRES', '20073787-3', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'SIN-PAT' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'SIN-PAT', 'MAZDA', '3', 0, 'S/C', 0) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '2419', 'SIN-PAT', 'INSTALACION CUT OUT (TRAIDO POR EL CLIENTE)', 'INSTALACION CUT OUT (TRAIDO POR EL CLIENTE)', 0, 'completada', '2024-11-08');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 1217: OT 2420
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'DANIEL SILVA' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'DANIEL SILVA', '19823650-0', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'SYDB22' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'SYDB22', 'TOYOTA', '4 RUNNER', 2023, 'S/C', 0) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '2420', 'SYDB22', 'INSTALACION SPRINTBOOSTER', 'INSTALACION SPRINTBOOSTER', 279900, 'completada', '2024-11-19');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 1218: OT 2421
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'DANIEL FUENZALINA' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'DANIEL FUENZALINA', '', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'GWDX73' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'GWDX73', 'PORSCHE', 'MACAN R4', 2016, 'S/C', 172801) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '2421', 'GWDX73', 'CAMBIO Y PROGRAMACION +CHEQUEO FUGA ACEITE - CALIBRACION ELECTRONICA ,CHEQUEO DESARME CAMBIO RING', 'CAMBIO Y PROGRAMACION +CHEQUEO FUGA ACEITE - CALIBRACION ELECTRONICA ,CHEQUEO DESARME CAMBIO RING', 890000, 'completada', '2024-11-21');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 1219: OT 2422
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'NICOLAS' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'NICOLAS', 'LGTK66', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'SIN-PAT' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'SIN-PAT', 'FORD', 'RAPTOR', 2019, 'S/C', 107250) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '2422', 'SIN-PAT', 'REV.FUGA MULTIPLE', 'REV.FUGA MULTIPLE', 290000, 'completada', '2024-11-21');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 1220: OT 2423
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'KENNER' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'KENNER', '', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'RSHJ64' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'RSHJ64', 'S/M', 'S/M', 0, 'S/C', 0) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '2423', 'RSHJ64', 'VACIADO DPF Y CATALIZADOR', 'VACIADO DPF Y CATALIZADOR', 170000, 'completada', '2024-11-26');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 1221: OT 2424
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'OSCAR POBLETE' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'OSCAR POBLETE', '9668146-1', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'SIN-PAT' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'SIN-PAT', 'OPEL', 'INSIGNA', 0, 'S/C', 0) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '2424', 'SIN-PAT', 'MODIFICACION DOWNPIPE - INSTALACION FLEXIBLE 3''''', 'MODIFICACION DOWNPIPE - INSTALACION FLEXIBLE 3''''', 65000, 'completada', '2024-11-26');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 1222: OT 2425
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'CLAUDIO OLIVARES' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'CLAUDIO OLIVARES', '12244999-8', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'PYPY82' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'PYPY82', 'CHEVROLET', 'SILVERADO', 2021, 'S/C', 25507) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '2425', 'PYPY82', 'INSTALACION MODULO CUT OUT 3''''', 'INSTALACION MODULO CUT OUT 3''''', 399900, 'completada', '2024-11-27');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 1223: OT 2426
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'BRUNO' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'BRUNO', '18020662-0', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'SIN-PAT' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'SIN-PAT', 'FORD', 'F150', 2022, 'S/C', 0) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '2426', 'SIN-PAT', 'BACK TO STOCK + SILENCIADOR ORIGINAL -INSTALACION CUT OUT 3''''', 'BACK TO STOCK + SILENCIADOR ORIGINAL -INSTALACION CUT OUT 3''''', 530000, 'completada', '2024-11-28');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 1224: OT 2427
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'KENNER' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'KENNER', '', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'PDZW27' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'PDZW27', 'MERCEDES', 'A 250', 0, 'S/C', 0) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '2427', 'PDZW27', 'INSTALACION DIFUSOR A3 FABRICACION TRAMO FINAL Y ADAPTACION ESCAPE A35', 'INSTALACION DIFUSOR A3 FABRICACION TRAMO FINAL Y ADAPTACION ESCAPE A35', 0, 'completada', '2024-11-27');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 1225: OT 2428
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'KENNER' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'KENNER', '', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'HTYJ44' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'HTYJ44', 'BMW', '220I', 0, 'S/C', 0) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '2428', 'HTYJ44', 'FABRICACION LINEA DE ESCAPE 2,5'''' +SILENCIADOR WICKEDFLOW', 'FABRICACION LINEA DE ESCAPE 2,5'''' +SILENCIADOR WICKEDFLOW', 0, 'completada', '2024-11-28');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 1226: OT 2429
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'AGUSTIN MARTINEZ' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'AGUSTIN MARTINEZ', '24329673-0', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'PS2117' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'PS2117', 'CHEVROLET', 'SILVERADO', 0, 'S/C', 0) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '2429', 'PS2117', 'INSTALACION CUT OUT 3''''', 'INSTALACION CUT OUT 3''''', 419900, 'completada', '2024-11-29');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 1227: OT 2430
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'KENNER' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'KENNER', '', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'SIN-PAT' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'SIN-PAT', 'MERCEDES', 'CLA 455', 0, 'S/C', 0) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '2430', 'SIN-PAT', 'FABRICACION LINEA ESCAPE CAT BACK + WICKEDFLOW 3''''', 'FABRICACION LINEA ESCAPE CAT BACK + WICKEDFLOW 3''''', 0, 'completada', '2024-12-03');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 1228: OT 2431
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'KENNER' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'KENNER', '', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'SWHJ28' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'SWHJ28', 'CUPRA', 'ATECA', 0, 'S/C', 0) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '2431', 'SWHJ28', 'FABRICACION + INSTALACION DOWNPIPE SMG', 'FABRICACION + INSTALACION DOWNPIPE SMG', 0, 'completada', '2024-12-05');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 1229: OT 2432
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'BASTIAN MARTINEZ' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'BASTIAN MARTINEZ', '19019995-9', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'SVKF76' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'SVKF76', 'SKODA', 'FABIA', 2023, 'S/C', 0) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '2432', 'SVKF76', 'FABRICACION AXLE BACK -SILENCIADOR SILEMPRO 2'''' COLA 3,5''''', 'FABRICACION AXLE BACK -SILENCIADOR SILEMPRO 2'''' COLA 3,5''''', 339900, 'completada', '2024-12-09');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 1230: OT 2433
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'JUAN ARRIAGADA' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'JUAN ARRIAGADA', '15708341-4', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'HFBL94' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'HFBL94', 'FORD', 'F150', 2014, 'S/C', 0) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '2433', 'HFBL94', 'INSTALACION SILENCIADOR SMG + COLA ESCAPE 4,5''''', 'INSTALACION SILENCIADOR SMG + COLA ESCAPE 4,5''''', 749900, 'completada', '2024-12-12');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 1231: OT 2434
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'FRANCO' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'FRANCO', '21407137-1', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'SIN-PAT' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'SIN-PAT', 'CHEVROLET', 'SILVERADO', 2025, 'S/C', 0) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '2434', 'SIN-PAT', 'INSTALACION CUT OUT 3''''', 'INSTALACION CUT OUT 3''''', 419990, 'completada', '2024-12-16');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 1232: OT 2435
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'KENNER' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'KENNER', '', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'RLDH44' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'RLDH44', 'MERCEDES', 'E 200', 0, 'S/C', 0) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '2435', 'RLDH44', 'ELIMINACION SILENCIADOR CENTRAL - INSTALACION CUT OUT 3''''', 'ELIMINACION SILENCIADOR CENTRAL - INSTALACION CUT OUT 3''''', 0, 'completada', '2024-12-16');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 1233: OT 2436
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'PABLO VEGA' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'PABLO VEGA', '', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'SVCC98' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'SVCC98', 'CHEVROLET', 'SILVERADO', 0, 'S/C', 0) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '2436', 'SVCC98', 'INSTALACION CUT OUT 3''''', 'INSTALACION CUT OUT 3''''', 399900, 'completada', '2024-12-17');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 1234: OT 2437
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'CARLOS DIAZ' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'CARLOS DIAZ', '8544195-7', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'SIN-PAT' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'SIN-PAT', 'BMW', 'RT 200', 0, 'S/C', 0) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '2437', 'SIN-PAT', 'MODIFICACION TRAMO ESCAPE - INSTALACION ESCAPE (CLIENTE)', 'MODIFICACION TRAMO ESCAPE - INSTALACION ESCAPE (CLIENTE)', 99990, 'completada', '2024-12-17');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 1235: OT 2438
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'KENNER' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'KENNER', '', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'XF1478' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'XF1478', 'MITSUBISHI', 'GALANT', 2004, 'S/C', 0) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '2438', 'XF1478', 'INSTALACION CATALITICO EURO 3''''', 'INSTALACION CATALITICO EURO 3''''', 0, 'completada', '2024-12-18');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 1236: OT 2439
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'KENNER' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'KENNER', '', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'CHBS90' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'CHBS90', 'MERCEDES', 'G500', 0, 'S/C', 0) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '2439', 'CHBS90', 'FABRICACION LINEA ESCAPE + SILENCIADOR WICKEDFLOW 3''''', 'FABRICACION LINEA ESCAPE + SILENCIADOR WICKEDFLOW 3''''', 0, 'completada', '2024-12-20');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 1237: OT 2440
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'GONZALO CARES' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'GONZALO CARES', '16360303-9', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'SIN-PAT' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'SIN-PAT', 'CHEVROLET', 'BLAZER', 2020, 'S/C', 0) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '2440', 'SIN-PAT', 'REPROGRAMACION ECU STAGE 1 +15HP+20NM - ELIMINACION LIMT.VELOCIDAD - INSTALACION SPRINTBOOSTER', 'REPROGRAMACION ECU STAGE 1 +15HP+20NM - ELIMINACION LIMT.VELOCIDAD - INSTALACION SPRINTBOOSTER', 949800, 'completada', '2024-11-20');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 1238: OT 2441
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'KENNER' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'KENNER', '', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'SXXJ31' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'SXXJ31', 'BMW', '220I', 2025, 'S/C', 0) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '2441', 'SXXJ31', 'INSTALACION DOWNPIPE ORIGINAL', 'INSTALACION DOWNPIPE ORIGINAL', 0, 'completada', '2024-12-26');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 1239: OT 2442
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'MICHAEL RADEMACHEN' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'MICHAEL RADEMACHEN', '16562471-8', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'PDCL34' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'PDCL34', 'JEEP', 'GLADIADOR', 0, 'S/C', 0) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '2442', 'PDCL34', 'FABRICACION BAJADA ESCAPE CATT OFF - REEMPLAZO VALVETRONIC SMG POR VIBRANT ULTRA QUIET', 'FABRICACION BAJADA ESCAPE CATT OFF - REEMPLAZO VALVETRONIC SMG POR VIBRANT ULTRA QUIET', 0, 'completada', '2024-12-27');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 1240: OT 2443
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'CESAR CASTILLO' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'CESAR CASTILLO', '17962069-3', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'SYDB78' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'SYDB78', 'MAZDA', 'MX-5', 2023, 'S/C', 0) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '2443', 'SYDB78', 'FABRICACION AXLE BACK - MAGNAFLOW 10416 - COLAS DOBLES 3,5''''', 'FABRICACION AXLE BACK - MAGNAFLOW 10416 - COLAS DOBLES 3,5''''', 499900, 'completada', '2024-12-27');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 1241: OT 2444
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'IGNACIO CASALE' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'IGNACIO CASALE', '16368126-1', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'LTKZ52' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'LTKZ52', 'FORD', 'F1500', 0, 'S/C', 0) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '2444', 'LTKZ52', 'ELIMINACION SILENCIADOR CENTRAL REEMPLAZO POR TUBO 2,5''''', 'ELIMINACION SILENCIADOR CENTRAL REEMPLAZO POR TUBO 2,5''''', 79900, 'completada', '2025-01-03');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 1242: OT 2445
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'CRISTIAN NANN' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'CRISTIAN NANN', '17188533-7', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'DKZW90' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'DKZW90', 'MINI', 'COOPER', 2012, 'S/C', 0) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '2445', 'DKZW90', 'FABRICACION LINEA ESCAPE + WICKEDFLOW SILENCIADOR - COLAS DOBLES 4,5'''' + REPROGRAMACION STAGE 1 +39HP+85NM', 'FABRICACION LINEA ESCAPE + WICKEDFLOW SILENCIADOR - COLAS DOBLES 4,5'''' + REPROGRAMACION STAGE 1 +39HP+85NM', 1029800, 'completada', '2025-01-06');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 1243: OT 2446
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'DANIEL FUENZALIDA' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'DANIEL FUENZALIDA', '9589188-8', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'SIN-PAT' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'SIN-PAT', 'PORSCHE', 'MACAN', 2015, 'S/C', 0) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '2446', 'SIN-PAT', 'CHEQUEO CODIGOS DE FALLAS - P0201/ P0089/ P10B1 - REPARACION TURBO', 'CHEQUEO CODIGOS DE FALLAS - P0201/ P0089/ P10B1 - REPARACION TURBO', 0, 'completada', '2025-01-10');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 1244: OT 2447
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'ENDE VALENCIA' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'ENDE VALENCIA', '20878513-3', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'SSWR61' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'SSWR61', 'MAZDA', 'NEW 3', 2023, 'S/C', 0) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '2447', 'SSWR61', 'MULTIPLE DE ESCAPE - FABRICACION LINEA DE ESCAPE - RESONADOR+SILENCIADOR SMG +COLAS + REPROGRAMACION ECU STAGE 2', 'MULTIPLE DE ESCAPE - FABRICACION LINEA DE ESCAPE - RESONADOR+SILENCIADOR SMG +COLAS + REPROGRAMACION ECU STAGE 2', 2269700, 'completada', '2025-01-14');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 1245: OT 2448
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'LUIGI WOSCHIEN' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'LUIGI WOSCHIEN', '13468721-5', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'WY2327' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'WY2327', 'MAN', '18430 BBS', 2007, 'S/C', 0) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '2448', 'WY2327', 'REPARACION FUGAS ESCAPE', 'REPARACION FUGAS ESCAPE', 200000, 'completada', '2025-01-14');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 1246: OT 2449
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'MICHAEL RADEMACHER' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'MICHAEL RADEMACHER', '16562471-8', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'PDKL34' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'PDKL34', 'JEEP', 'GLADIADOR', 0, 'S/C', 0) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '2449', 'PDKL34', 'INSTALACION SILENCIADOR ORIGINAL - REEMPLAZO SIL.VIBRANT POR BORLA PRO XS - INSTALACION VIBRANT SECCION FINAL+COLASALIDA 4'''' -REEMPLAZO VIBRANT', 'INSTALACION SILENCIADOR ORIGINAL - REEMPLAZO SIL.VIBRANT POR BORLA PRO XS - INSTALACION VIBRANT SECCION FINAL+COLASALIDA 4'''' -REEMPLAZO VIBRANT', 1269800, 'completada', '2025-01-15');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 1247: OT 2450
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'JUAN MORALES' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'JUAN MORALES', '8954237-5', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'SIN-PAT' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'SIN-PAT', 'CHEVROLET', 'ZRZ', 2023, 'S/C', 0) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '2450', 'SIN-PAT', 'INSTALACION VALVULA CUT OUT 3'''' SMG', 'INSTALACION VALVULA CUT OUT 3'''' SMG', 419900, 'completada', '2025-01-21');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 1248: OT 2451
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'GIANFRANCO BASELLI' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'GIANFRANCO BASELLI', '18765678-8', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'SWGB75' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'SWGB75', 'FORD', 'MACH ONE', 2024, 'S/C', 5698) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '2451', 'SWGB75', 'X-PIPE FORD MACH ONE', 'X-PIPE FORD MACH ONE', 249900, 'completada', '2024-03-08');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 1249: OT 2452
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'DANIEL CORNEJO' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'DANIEL CORNEJO', '13923210-0', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'DZXY96' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'DZXY96', 'JEEP', 'G. CHEROKEE', 2012, 'S/C', 137491) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '2452', 'DZXY96', 'REEMPLAZO E INSTALACION DE CATALITICO MAGNAFLOW', 'REEMPLAZO E INSTALACION DE CATALITICO MAGNAFLOW', 1000000, 'completada', '2024-03-18');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 1250: OT 2453
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'EDMUNDO URRUTA' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'EDMUNDO URRUTA', '17038277-3', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'GXXF16' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'GXXF16', 'AUDI', 'A7', 2014, 'S/C', 171000) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '2453', 'GXXF16', 'REPARACION FUGA ESCAPE 1 + ANTIDRONE. COTIZAR BOBINAS (NO SE ENCONTRO)', 'REPARACION FUGA ESCAPE 1 + ANTIDRONE. COTIZAR BOBINAS (NO SE ENCONTRO)', 320000, 'completada', '2024-03-20');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 1251: OT 2454
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'MAX SOLUCIONES AUTOM' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'MAX SOLUCIONES AUTOM', '76142564-1', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'FHLL16' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'FHLL16', 'AUDI', 'A7', 2013, 'S/C', 89568) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '2454', 'FHLL16', 'REVISION LINEA, CHEQUEO, SOLUCION SE ENVIARA DETALLES A MAX', 'REVISION LINEA, CHEQUEO, SOLUCION SE ENVIARA DETALLES A MAX', 0, 'completada', '2024-03-22');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 1252: OT 2455
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'JOANQUIN SALAZAR' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'JOANQUIN SALAZAR', '19665845-9', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'LXPW14' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'LXPW14', 'VOLKSWAGEN', 'GOLF', 2020, 'S/C', 28418) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '2455', 'LXPW14', 'LINEA COMPLETA INOX 3'''' + SILENCIADOR ALTO FLUJO SILEMPRO + 4 COLAS', 'LINEA COMPLETA INOX 3'''' + SILENCIADOR ALTO FLUJO SILEMPRO + 4 COLAS', 770000, 'completada', '2024-03-22');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 1253: OT 2456
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'IGNACIO CONTRERAS' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'IGNACIO CONTRERAS', '22012879-2', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'RDGH52' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'RDGH52', 'BMW', '218I', 2021, 'S/C', 33) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '2456', 'RDGH52', 'INSTALACION MODULO CUT OUT 2,5'''' SMG C/ 2 CONTROL REMOTO', 'INSTALACION MODULO CUT OUT 2,5'''' SMG C/ 2 CONTROL REMOTO', 349900, 'completada', '2024-03-26');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 1254: OT 2457
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'GABRIEL DIAZ' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'GABRIEL DIAZ', '19115001-5', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'HRWD73' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'HRWD73', 'KIA', 'CERATO', 2016, 'S/C', 74) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '2457', 'HRWD73', 'AXLE BACK C/ ALTO FLUJO SILEMPRO + COLA 4'''' BLACK', 'AXLE BACK C/ ALTO FLUJO SILEMPRO + COLA 4'''' BLACK', 299900, 'completada', '2024-03-27');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 1255: OT 2458
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'ALEJANDRO BRAVO' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'ALEJANDRO BRAVO', '15790902-9', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'HVYZ22' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'HVYZ22', 'FORD', 'F150', 2017, 'S/C', 246354) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '2458', 'HVYZ22', 'REEMPLAZO CATALITICO MAGNAFLOW', 'REEMPLAZO CATALITICO MAGNAFLOW', 0, 'completada', '2024-03-28');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 1256: OT 2459
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'BERNARDO ESPINOZA' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'BERNARDO ESPINOZA', '17976381-8', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'PC9704' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'PC9704', 'CHEVROLET', 'CHEYENNE', 1996, 'S/C', 0) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '2459', 'PC9704', 'LINEA COMPLETA C/BAJADA MULTIPLES + 4 SONDA S/OXIGENO + SILENCIADOR ALTO FLUJO WICKEDFLOW KANIKASE CON DOBLE SALIDA', 'LINEA COMPLETA C/BAJADA MULTIPLES + 4 SONDA S/OXIGENO + SILENCIADOR ALTO FLUJO WICKEDFLOW KANIKASE CON DOBLE SALIDA', 1100000, 'completada', '2024-04-01');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 1257: OT 2460
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'ARTEMIO CASTILLO' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'ARTEMIO CASTILLO', '6524776-3', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'KGZW16' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'KGZW16', 'PEUGEOT', '3008', 2018, 'S/C', 147) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '2460', 'KGZW16', 'VACIADO DPF Y DECAT 150 - REPRO DPF EGR Y ADBLUE OFF 320 - ACEITE + LIMPIA MOTOR LIQUI MOLY 100 + FILTRO', 'VACIADO DPF Y DECAT 150 - REPRO DPF EGR Y ADBLUE OFF 320 - ACEITE + LIMPIA MOTOR LIQUI MOLY 100 + FILTRO', 570000, 'completada', '2024-04-09');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 1258: OT 2461
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'VICENTE' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'VICENTE', '23748601-3', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'KHSC47' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'KHSC47', 'FORD', 'FOCUS RS', 2018, 'S/C', 47) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '2461', 'KHSC47', 'DOWNPIPE INOX A MEDIDA - STAGE 2 GANANCIAS +30HP +80NM', 'DOWNPIPE INOX A MEDIDA - STAGE 2 GANANCIAS +30HP +80NM', 839200, 'completada', '2024-04-10');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 1259: OT 2462
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'JEAN CAMPOS' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'JEAN CAMPOS', '24418859-1', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'RDSD77' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'RDSD77', 'CHERY', 'TIGGO', 2021, 'S/C', 44000) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '2462', 'RDSD77', 'REEMPLAZO SW SILENCIADOR ORIGINAL POR ALTO FLUJO', 'REEMPLAZO SW SILENCIADOR ORIGINAL POR ALTO FLUJO', 219900, 'completada', '2024-04-10');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 1260: OT 2463
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'SEBASTIAN PIZARRO PEÑA' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'SEBASTIAN PIZARRO PEÑA', '16848359-7', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'SPTC12' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'SPTC12', 'HONDA', 'CIVIC 1.5', 2023, 'S/C', 32238) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '2463', 'SPTC12', 'REPRO STAGE 1 +25HP +50NM - COLAS NUEVAS CORTE DIAGONAL - SILENCIADOR ALTO FLUJO', 'REPRO STAGE 1 +25HP +50NM - COLAS NUEVAS CORTE DIAGONAL - SILENCIADOR ALTO FLUJO', 689900, 'completada', '2024-04-11');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 1261: OT 2464
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'DIEGO CHI' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'DIEGO CHI', '21077147-6', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'SFBG95' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'SFBG95', 'BMW', '240I', 2022, 'S/C', 22200) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '2464', 'SFBG95', 'INSTALACION COLAS DUAL 4'''' BLACK REEMPLAZO DE FABRICA', 'INSTALACION COLAS DUAL 4'''' BLACK REEMPLAZO DE FABRICA', 499900, 'completada', '2024-04-12');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 1262: OT 2465
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'GABRIEL GONZALEZ' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'GABRIEL GONZALEZ', '13346678-9', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'SYJG58' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'SYJG58', 'CHEVROLET', 'ZRZ', 2023, 'S/C', 20863) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '2465', 'SYJG58', 'INSTALACION CUT OUT C/ 2 CONTROL REMOTO', 'INSTALACION CUT OUT C/ 2 CONTROL REMOTO', 349900, 'completada', '2024-04-12');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 1263: OT 2466
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'DAVID SUAZO' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'DAVID SUAZO', '17952727-8', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'JXRV18' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'JXRV18', 'FORD', 'MUSTANG', 2018, 'S/C', 0) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '2466', 'JXRV18', 'INSTALACION DE X-PIPE CENTRAL + AXLE BACK FREE (MANTIENE COLAS)', 'INSTALACION DE X-PIPE CENTRAL + AXLE BACK FREE (MANTIENE COLAS)', 429900, 'completada', '2024-04-16');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 1264: OT 2467
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'JOSE MIGUEL ORTIZ' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'JOSE MIGUEL ORTIZ', '76360562-0', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'LWTR59' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'LWTR59', 'HONDA', 'RIDGELINE', 2020, 'S/C', 0) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '2467', 'LWTR59', 'CUT OUT 2''''', 'CUT OUT 2''''', 332900, 'completada', '2024-04-19');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 1265: OT 2468
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'ALVARO MANRIQUEZ' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'ALVARO MANRIQUEZ', '77025145-1', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'KJSW68' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'KJSW68', 'FORD', '150', 2018, 'S/C', 0) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '2468', 'KJSW68', 'CUT OUT 2,5'''' C/ INSTALACION DE COLA. SOCIEDAD DE T.', 'CUT OUT 2,5'''' C/ INSTALACION DE COLA. SOCIEDAD DE T.', 449900, 'completada', '2024-04-19');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 1266: OT 2469
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'GONZALO CONTRERAS' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'GONZALO CONTRERAS', '19343877-6', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'KDZT33' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'KDZT33', 'OPEL', 'CORSA', 2017, 'S/C', 65312) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '2469', 'KDZT33', 'SUPRIMIR SILENCIADOR CENTRAL POR INOX + AXLE BACK MAGNAFLOW C/COLAS BLACK', 'SUPRIMIR SILENCIADOR CENTRAL POR INOX + AXLE BACK MAGNAFLOW C/COLAS BLACK', 450000, 'completada', '2024-04-26');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 1267: OT 2470
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'CRISTIAN QUILAMAN' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'CRISTIAN QUILAMAN', '15987626-8', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'JCKR26' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'JCKR26', 'TOYOTA', '4 RUNNER', 2017, 'S/C', 110000) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '2470', 'JCKR26', 'INSTALACION MODULO CUT OUT 2'''' C/ 2 CONTROL REMOTO + COLA BLACK 4''''', 'INSTALACION MODULO CUT OUT 2'''' C/ 2 CONTROL REMOTO + COLA BLACK 4''''', 430000, 'completada', '2024-04-30');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 1268: OT 2471
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'SIMON SCHNITEH' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'SIMON SCHNITEH', '20257978-7', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'BDZT80' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'BDZT80', 'JEEP', 'CHEROKKE', 2008, 'S/C', 212000) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '2471', 'BDZT80', 'INSTALACION SILENCIADOR ORIGINAL + CUT OUT 2,5'''' SILEMPRO + COLA CROMO 4''''', 'INSTALACION SILENCIADOR ORIGINAL + CUT OUT 2,5'''' SILEMPRO + COLA CROMO 4''''', 550000, 'completada', '2024-04-30');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 1269: OT 2472
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'CLIENTE GENERICO' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'CLIENTE GENERICO', '', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'SIN-PAT' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'SIN-PAT', 'S/M', 'S/M', 0, 'S/C', 0) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '2472', 'SIN-PAT', 'Carga masiva', 'Carga masiva', 0, 'completada', '2026-01-01');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 1270: OT 2473
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'ANDRES GONZALEZ' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'ANDRES GONZALEZ', '25857120-7', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'SHZX50' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'SHZX50', 'HYUNDAI', 'VELOSTER N', 2023, 'S/C', 14000) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '2473', 'SHZX50', 'INSTALACION MODULO CUT OUT 2''''', 'INSTALACION MODULO CUT OUT 2''''', 349900, 'completada', '2024-05-02');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 1271: OT 2474
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'PATRICIO VERA' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'PATRICIO VERA', '19112609-2', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'LPBS83' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'LPBS83', 'SUBARU', 'WRX', 2019, 'S/C', 77000) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '2474', 'LPBS83', 'LINEA COMPLETA INOX + SILENCIADOR ALTO FLUJO MAGNAFLOW + CLAMP + COLAS DUAL X2 (3,5'''') + REPARACION + PINTADO LLANTAS A DOMICILIO 350', 'LINEA COMPLETA INOX + SILENCIADOR ALTO FLUJO MAGNAFLOW + CLAMP + COLAS DUAL X2 (3,5'''') + REPARACION + PINTADO LLANTAS A DOMICILIO 350', 770000, 'completada', '2024-05-02');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 1272: OT 2475
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'JUAN CARDENAS' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'JUAN CARDENAS', '17499571-0', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'JRSD19' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'JRSD19', 'AUDI', 'A3', 2017, 'S/C', 103) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '2475', 'JRSD19', 'LINEA + RESONADOR VIBRANT + ALTO FLUJO ULTRA QUIET + COLAS (TRAE CLIENTE) - REPRO CAJA 320.000', 'LINEA + RESONADOR VIBRANT + ALTO FLUJO ULTRA QUIET + COLAS (TRAE CLIENTE) - REPRO CAJA 320.000', 1039900, 'completada', '2024-05-13');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 1273: OT 2476
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'CESAR VALLEGOS' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'CESAR VALLEGOS', '15545813-5', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'GBHT40' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'GBHT40', 'FORD', 'MUSTANG', 2014, 'S/C', 36757) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '2476', 'GBHT40', 'INSTALACION AXLE BACK MAGNAFLOW', 'INSTALACION AXLE BACK MAGNAFLOW', 0, 'completada', '2024-05-13');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 1274: OT 2477
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'ANDRES MORALES' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'ANDRES MORALES', '10347091-9', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'DPGF40' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'DPGF40', 'CADILLAC', 'CTS', 2012, 'S/C', 70000) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '2477', 'DPGF40', '2 ANTIDRONE', '2 ANTIDRONE', 160000, 'completada', '2024-05-14');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 1275: OT 2478
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'ANDRES MORALES' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'ANDRES MORALES', '10347091-9', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'KXJT43' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'KXJT43', 'FORD', 'MUSTANG', 2019, 'S/C', 40033) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '2478', 'KXJT43', 'X-PIPE MUSTANG GT 10% OFF', 'X-PIPE MUSTANG GT 10% OFF', 225000, 'completada', '2024-05-16');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 1276: OT 2479
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'NAYIR FAJURI' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'NAYIR FAJURI', '21212010-0', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'SIN-PAT' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'SIN-PAT', 'SUBARU', 'WRX', 2023, 'S/C', 20280) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '2479', 'SIN-PAT', 'FABRICACION INSTALACION DOWNPIPE SMG', 'FABRICACION INSTALACION DOWNPIPE SMG', 449900, 'completada', '2024-08-21');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 1277: OT 2480
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'JAIME RIFFO' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'JAIME RIFFO', '17740874-3', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'PDGX96' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'PDGX96', 'RENAULT', 'MEGANE', 2021, 'S/C', 40) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '2480', 'PDGX96', 'INSTALACION ALTO FLUJO CENTRAL VIBRANT PERFORMANCE + AXLE BACK FREE', 'INSTALACION ALTO FLUJO CENTRAL VIBRANT PERFORMANCE + AXLE BACK FREE', 500000, 'completada', '2024-05-20');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 1278: OT 2481
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'RODRIGO ELGUETA' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'RODRIGO ELGUETA', '13469382-7', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'FBTJ25' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'FBTJ25', 'DODGE', 'CHALLENGER', 2013, 'S/C', 102) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '2481', 'FBTJ25', 'AXLE BACK FREE INOX. MANTIENE COLAS DE ESCAPE', 'AXLE BACK FREE INOX. MANTIENE COLAS DE ESCAPE', 200000, 'completada', '2024-05-22');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 1279: OT 2482
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'MICHEL SINABOL' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'MICHEL SINABOL', '18463346-9', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'HVGS80' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'HVGS80', 'SKODA', 'OCTAVIA VRS', 2016, 'S/C', 90800) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '2482', 'HVGS80', 'CAMBIO SOPORTE DOWNPIPE (LO TRAE CLIENTE) CAMBIO ABRAZADERA - ANTIDRONE - SOLDADO DE FUGA', 'CAMBIO SOPORTE DOWNPIPE (LO TRAE CLIENTE) CAMBIO ABRAZADERA - ANTIDRONE - SOLDADO DE FUGA', 135000, 'completada', '2024-05-29');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 1280: OT 2483
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'PEDRO SAN MARTIN' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'PEDRO SAN MARTIN', '12797937-5', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'KLTJ30' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'KLTJ30', 'FORD', 'RANGER', 2018, 'S/C', 92) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '2483', 'KLTJ30', 'CHEQUEO FUGA DE ESCAPE, OLOR EN CABINA - DIAGNOSTICO 40.000 SOLUCION A CONVENIR', 'CHEQUEO FUGA DE ESCAPE, OLOR EN CABINA - DIAGNOSTICO 40.000 SOLUCION A CONVENIR', 40000, 'completada', '2024-05-30');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 1281: OT 2484
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'NICOLAS RIQUELME' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'NICOLAS RIQUELME', '18308797-5', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'RYBV33' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'RYBV33', 'SUZUKI', 'SWIFT 1.4', 2023, 'S/C', 12900) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '2484', 'RYBV33', 'AXLE BACK FREE C/ FLANCHE + COLAS NUEVAS CROMO', 'AXLE BACK FREE C/ FLANCHE + COLAS NUEVAS CROMO', 320000, 'completada', '2024-05-30');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 1282: OT 2485
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'CRISTOBAL CABALLERO' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'CRISTOBAL CABALLERO', '19619493-2', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'FRLL52' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'FRLL52', 'FORD', 'F150', 2013, 'S/C', 127) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '2485', 'FRLL52', 'INSTALACION MAGNAFLOW ALTO FLUJO GLASSPACK - INSTALACION COLA ESCAPE', 'INSTALACION MAGNAFLOW ALTO FLUJO GLASSPACK - INSTALACION COLA ESCAPE', 359900, 'completada', '2024-05-31');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 1283: OT 2486
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'NICOLAS DIAZ' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'NICOLAS DIAZ', '11348043-2', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'CRSK54' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'CRSK54', 'TOYOTA', 'TUNDRA', 2011, 'S/C', 0) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '2486', 'CRSK54', 'MODIFICACION LINEA C/ 4 SILENCIADORES ALTO FLUJO SILEMPRO CON COLAS BLACK MATTE 5''''', 'MODIFICACION LINEA C/ 4 SILENCIADORES ALTO FLUJO SILEMPRO CON COLAS BLACK MATTE 5''''', 0, 'completada', '2024-06-03');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 1284: OT 2487
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'LARRY MONASTERIO' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'LARRY MONASTERIO', '16953017-3', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'PLBZ10' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'PLBZ10', 'VOLKSWAGEN', 'GOLF R', 2021, 'S/C', 0) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '2487', 'PLBZ10', 'DOWNPIPE + LINEA COMPLETA + SILENCIADOR SILEMPRO + 4 COLAS NEGRAS +  STAGE 2', 'DOWNPIPE + LINEA COMPLETA + SILENCIADOR SILEMPRO + 4 COLAS NEGRAS +  STAGE 2', 1780000, 'completada', '2024-09-04');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 1285: OT 2488
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'FABIAN SEPULVEDA' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'FABIAN SEPULVEDA', '18444150-0', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'KGYT59' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'KGYT59', 'KIA', 'SPORTAGE', 2018, 'S/C', 109000) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '2488', 'KGYT59', 'ELIMINACION CATALITICO - STAGE 2 REPRO DE ECU', 'ELIMINACION CATALITICO - STAGE 2 REPRO DE ECU', 360000, 'completada', '2024-06-06');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 1286: OT 2489
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'PEDRO BECERRA' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'PEDRO BECERRA', '11829958-2', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'SLGH20' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'SLGH20', 'CHEVROLET', 'ZRZ', 2023, 'S/C', 30) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '2489', 'SLGH20', 'INSTALACION MODULO CUT OUT 3''''', 'INSTALACION MODULO CUT OUT 3''''', 349900, 'completada', '2024-06-06');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 1287: OT 2490
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'IGOR HORMOZABAL' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'IGOR HORMOZABAL', '16755495-4', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'RKBP63' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'RKBP63', 'CHEVROLET', 'TRAIL BOSS', 2022, 'S/C', 60200) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '2490', 'RKBP63', 'INSTALACION MODULO CUT OUT SMG 2,5'''' C/ 2 CONTROL', 'INSTALACION MODULO CUT OUT SMG 2,5'''' C/ 2 CONTROL', 349900, 'completada', '2024-06-06');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;

    RAISE NOTICE 'Bloque finalizado con éxito.';
END $$;