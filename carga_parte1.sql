DO $$
DECLARE
    v_taller_id UUID := 'e55ce6be-7b8c-4a1a-b333-666333666333';
    v_cliente_id UUID;
    v_vehiculo_id UUID;
BEGIN
    RAISE NOTICE 'Iniciando carga de bloque...';
    -- Fila 1: OT 1045
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'YAMAL CHEAADE' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'YAMAL CHEAADE', '', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'HVXY22' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'HVXY22', 'FORD', 'F150 PLATINIUM', 2018, 'S/C', 0) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '1045', 'HVXY22', 'REMOVER SILENCIADOR CENTRAL', 'REMOVER SILENCIADOR CENTRAL', 109900, 'completada', '2022-10-27');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 2: OT 1101
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'RICARDO VENEGAS' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'RICARDO VENEGAS', '15459632-1', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'LJHL51' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'LJHL51', 'SUBARU', 'IMPREZA WRX', 2019, 'S/C', 19000) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '1101', 'LJHL51', 'INSTALACION HEADERS + FABRICACION DOWNPIPE - INSTALACION DE ESPINALES - INSTALACION 4 LUZ FRENO ABAJO', 'INSTALACION HEADERS + FABRICACION DOWNPIPE - INSTALACION DE ESPINALES - INSTALACION 4 LUZ FRENO ABAJO', 520000, 'completada', '2020-11-23');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 3: OT 1102
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'MARCELO GUERREROS' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'MARCELO GUERREROS', '12240623-7', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'KRGL20' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'KRGL20', 'VOLKSWAGEN', 'GOLF', 2018, 'S/C', 54807) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '1102', 'KRGL20', 'AXLE BACK FREE CON REDUCCION A 2,5'''' + MODIFICACION DE PARACHOQUE PARA LOGRAR 4 SALIDAS DE ESCAPE ''''INCLUYE COLAS''''', 'AXLE BACK FREE CON REDUCCION A 2,5'''' + MODIFICACION DE PARACHOQUE PARA LOGRAR 4 SALIDAS DE ESCAPE ''''INCLUYE COLAS''''', 350000, 'completada', '2020-11-23');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 4: OT 1103
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'DIEGO ROJAS' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'DIEGO ROJAS', '20404489-9', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'GSDT26' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'GSDT26', 'BMW', '335I', 2014, 'S/C', 106809) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '1103', 'GSDT26', 'INSTALACION SILENCIADOR TRASERO M-PERFORMANCE CON MODIFICACION DE LINEA', 'INSTALACION SILENCIADOR TRASERO M-PERFORMANCE CON MODIFICACION DE LINEA', 80000, 'completada', '2020-11-23');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 5: OT 1104
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'ANGEL CONTARDO' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'ANGEL CONTARDO', '17168166-9', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'FPGF99' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'FPGF99', 'RENAULT', 'FLUENCE', 2013, 'S/C', 95385) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '1104', 'FPGF99', 'AXLE BACK BALA 2,5'''' BLACK + COLA 4'''' BLACK', 'AXLE BACK BALA 2,5'''' BLACK + COLA 4'''' BLACK', 190000, 'completada', '2020-11-23');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 6: OT 1105
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'MACARENA' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'MACARENA', '', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'LBSL24' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'LBSL24', 'VOLKSWAGEN', 'GOLF', 2019, 'S/C', 89049) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '1105', 'LBSL24', 'ESCAPE', 'ESCAPE', 180000, 'completada', '2020-11-24');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 7: OT 1106
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'JUAN CARLOS JERIA' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'JUAN CARLOS JERIA', '76169598-3', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'HVLR44' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'HVLR44', 'CHEVROLET', 'SILVERADO', 2020, 'S/C', 25000) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '1106', 'HVLR44', 'INSTALACION DE SPRINTBOOSTER - INSTALACION CUT OUT 3'''' - LINEA CON SALIDA 4'''' - PRINCIPAL FLEXIBLE 3'''' SILENCIADOR ORIGINAL, SALIDA CON REDUCCION DE 3'''' O 4''''', 'INSTALACION DE SPRINTBOOSTER - INSTALACION CUT OUT 3'''' - LINEA CON SALIDA 4'''' - PRINCIPAL FLEXIBLE 3'''' SILENCIADOR ORIGINAL, SALIDA CON REDUCCION DE 3'''' O 4''''', 729900, 'completada', '2020-11-24');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 8: OT 1107
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'JOSE ESCOBAR' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'JOSE ESCOBAR', '14124715-8', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'CWPW17' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'CWPW17', 'SUBARU', 'IMPREZA', 2011, 'S/C', 92887) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '1107', 'CWPW17', 'INSTALACION SPRINTBOOSTER', 'INSTALACION SPRINTBOOSTER', 249900, 'completada', '2020-11-24');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 9: OT 1108
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'CARLOS RIVEROS' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'CARLOS RIVEROS', '17611040-6', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'LD3204' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'LD3204', 'HONDA', 'INTEGRA', 1993, 'S/C', 220) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '1108', 'LD3204', 'INSTALACION MULTIPLE ESCAPE (IMPORTADO) - LINEA COMPLETA 2,5'''' Y TUBO (COLA)', 'INSTALACION MULTIPLE ESCAPE (IMPORTADO) - LINEA COMPLETA 2,5'''' Y TUBO (COLA)', 800000, 'completada', '2020-11-25');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 10: OT 1109
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'CRISTIAN CABRERA' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'CRISTIAN CABRERA', '13073875-3', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'PJLY39' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'PJLY39', 'SKODA', 'KODIAQ', 2020, 'S/C', 1188) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '1109', 'PJLY39', 'REPRO DE ECU STAGE 1 - VALOR EN PROMOCION 30% OFF', 'REPRO DE ECU STAGE 1 - VALOR EN PROMOCION 30% OFF', 273000, 'completada', '2020-11-25');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 11: OT 1110
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'CRISTIAN ALVAREZ' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'CRISTIAN ALVAREZ', '18447462-K', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'JCXX10' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'JCXX10', 'MINI', 'F56', 2016, 'S/C', 51261) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '1110', 'JCXX10', 'AXLE BACK ALTO FLUJO BLACK 2,5'''' + COLA INOX 4''''', 'AXLE BACK ALTO FLUJO BLACK 2,5'''' + COLA INOX 4''''', 219900, 'completada', '2020-11-27');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 12: OT 1111
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'JUAN JOSE MARTINEZ' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'JUAN JOSE MARTINEZ', '17860176-8', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'DXZF63' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'DXZF63', 'NISSAN', '370 Z', 2012, 'S/C', 105979) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '1111', 'DXZF63', 'INSTALACION LINEA INGEN + 6 EMPAQUETADURAS NUEVAS', 'INSTALACION LINEA INGEN + 6 EMPAQUETADURAS NUEVAS', 89000, 'completada', '2020-11-27');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 13: OT 1112
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'FREDDY HERNANDEZ' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'FREDDY HERNANDEZ', '11695411-7', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'JBCC48' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'JBCC48', 'BMW', '340I', 2017, 'S/C', 27800) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '1112', 'JBCC48', 'REMOVER SILENCIADOR AXLE FREE - MANTIENE COLAS', 'REMOVER SILENCIADOR AXLE FREE - MANTIENE COLAS', 219900, 'completada', '2020-11-30');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 14: OT 1113
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'FERNANDO PONCE' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'FERNANDO PONCE', '7661064-9', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'FSGS49' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'FSGS49', 'JEEP', 'WRANGLER', 2013, 'S/C', 125446) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '1113', 'FSGS49', 'DOWNPIPE - MEDIA LINEA', 'DOWNPIPE - MEDIA LINEA', 570000, 'completada', '2020-11-30');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 15: OT 1114
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'CHRISTIAN GODAY' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'CHRISTIAN GODAY', '14261752-8', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'LKJP27' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'LKJP27', 'CHEVROLET', 'SILVERADO', 2019, 'S/C', 7600) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '1114', 'LKJP27', 'INSTALACION SISTEMA CUT OUT 3''''', 'INSTALACION SISTEMA CUT OUT 3''''', 239900, 'completada', '2020-12-01');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 16: OT 1115
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'NICOLAS BERGUECIO' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'NICOLAS BERGUECIO', '16208285-K', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'LYCP39' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'LYCP39', 'SUZUKI', 'JIMNY', 2020, 'S/C', 0) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '1115', 'LYCP39', 'GARANTIA 2 EMPAQUETADURA', 'GARANTIA 2 EMPAQUETADURA', 0, 'completada', '2020-12-01');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 17: OT 1116
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'CARLOS CERPA' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'CARLOS CERPA', '13670139-8', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'GKYB51' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'GKYB51', 'CHEVROLET', 'CAMARO', 2015, 'S/C', 36421) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '1116', 'GKYB51', 'REPARACION LINEA (TOPE CON SOPORTE) CAMBIO DE SOPORTE ESCAPE - REEMPLAZO EMP Y VIDA ESCAPE - INSTALACION DE VALVULA', 'REPARACION LINEA (TOPE CON SOPORTE) CAMBIO DE SOPORTE ESCAPE - REEMPLAZO EMP Y VIDA ESCAPE - INSTALACION DE VALVULA', 200000, 'completada', '2020-12-01');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 18: OT 1117
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'MAURICIO PARRA' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'MAURICIO PARRA', '16977544-3', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'GFRR56' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'GFRR56', 'NISSAN', '350 Z', 2003, 'S/C', 100607) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '1117', 'GFRR56', 'REMOVER T - AXLE BACK 2,5'''' - ENTRAR COLA (MANTIENE LAS ORIGINALES)', 'REMOVER T - AXLE BACK 2,5'''' - ENTRAR COLA (MANTIENE LAS ORIGINALES)', 200000, 'completada', '2020-12-01');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 19: OT 1118
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'MATIAS CORDERO' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'MATIAS CORDERO', '19737369-5', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'KRWK79' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'KRWK79', 'BMW', 'M240I', 2019, 'S/C', 12413) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '1118', 'KRWK79', 'INSTALACION COLA 2 DUAL 3,5''''', 'INSTALACION COLA 2 DUAL 3,5''''', 210000, 'completada', '2020-12-02');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 20: OT 1119
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'GONNAR DOBSON' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'GONNAR DOBSON', '19038274-5', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'KWHG25' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'KWHG25', 'MERCEDES', 'C43 AMG', 2019, 'S/C', 11984) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '1119', 'KWHG25', 'AXLE BACK MAGNAFLOW -  REPRO STAGE 1', 'AXLE BACK MAGNAFLOW -  REPRO STAGE 1', 1180000, 'completada', '2020-12-02');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 21: OT 1120
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'YAIR MESZAROS' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'YAIR MESZAROS', '20938909-6', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'GCDK32' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'GCDK32', 'MERCEDES', 'C63', 2014, 'S/C', 0) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '1120', 'GCDK32', 'SUPRIMIR 2 CATALITICOS POR INOX RECTO - INSTALACION DIFUSOR', 'SUPRIMIR 2 CATALITICOS POR INOX RECTO - INSTALACION DIFUSOR', 140000, 'completada', '2020-12-03');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 22: OT 1121
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'JAVIER ALVARADO' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'JAVIER ALVARADO', '15727463-0', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'HLDJ13' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'HLDJ13', 'BMW', '316I', 2016, 'S/C', 39909) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '1121', 'HLDJ13', 'INSTALACION CUT OUT 2''''', 'INSTALACION CUT OUT 2''''', 219900, 'completada', '2020-12-03');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 23: OT 1122
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'CARLOS ALVARADO' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'CARLOS ALVARADO', '11751940-6', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'HKLX35' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'HKLX35', 'BMW', 'M5', 2015, 'S/C', 0) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '1122', 'HKLX35', 'SUPRIMIR 2 PRE SILENCIADORES CENTRALES POR INOX', 'SUPRIMIR 2 PRE SILENCIADORES CENTRALES POR INOX', 100000, 'completada', '2020-12-03');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 24: OT 1123
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'FELIPE BRAVO' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'FELIPE BRAVO', '15482657-2', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'HVWB97' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'HVWB97', 'FORD', 'MUSTANG', 2016, 'S/C', 23987) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '1123', 'HVWB97', 'INSTALACION COLAS INOX 4'''' POR GARANTIA CAMBIO', 'INSTALACION COLAS INOX 4'''' POR GARANTIA CAMBIO', 90000, 'completada', '2020-12-04');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 25: OT 1124
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'NICOLAS NOGUERA' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'NICOLAS NOGUERA', '19617091-K', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'FHZS39' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'FHZS39', 'BMW', 'M3', 2013, 'S/C', 0) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '1124', 'FHZS39', 'TRABAJAR MUFFLER, ABRIR Y DEJAR FLUJOS DIRECTO', 'TRABAJAR MUFFLER, ABRIR Y DEJAR FLUJOS DIRECTO', 219900, 'completada', '2020-12-04');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 26: OT 1125
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'GIANCARLOS BARBA' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'GIANCARLOS BARBA', '14742779-4', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'PDDK56' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'PDDK56', 'VOLKSWAGEN', 'JETTA', 2021, 'S/C', 6971) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '1125', 'PDDK56', 'AXLE BACK ALTO FLUJO SMG 2'''' CON TERMINACION APUNTE ABAJO', 'AXLE BACK ALTO FLUJO SMG 2'''' CON TERMINACION APUNTE ABAJO', 149900, 'completada', '2020-12-05');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 27: OT 1126
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'DOGLAS DIAZ' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'DOGLAS DIAZ', '16174137-K', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'GSRK57' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'GSRK57', 'BMW', '116I', 2014, 'S/C', 0) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '1126', 'GSRK57', 'SE REINSTALA SILENCIADOR DE FABRICA CON MODIFICACION PARA LINEA + INSTALACION PRESILENCIADOR - REPARAR SOPORTE DELANTERO + DOBLE SALIDA ESCAPE', 'SE REINSTALA SILENCIADOR DE FABRICA CON MODIFICACION PARA LINEA + INSTALACION PRESILENCIADOR - REPARAR SOPORTE DELANTERO + DOBLE SALIDA ESCAPE', 299900, 'completada', '2020-12-07');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 28: OT 1127
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'ANDRES LARENAS' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'ANDRES LARENAS', '13943467-6', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'KZKY10' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'KZKY10', 'MAZDA', 'NEW 3', 2019, 'S/C', 23385) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '1127', 'KZKY10', 'INSTALACION COLAS, LAS TRAE CLIENTE', 'INSTALACION COLAS, LAS TRAE CLIENTE', 60000, 'completada', '2020-12-07');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 29: OT 1128
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'MIGUEL RAMIREZ' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'MIGUEL RAMIREZ', '18973617-7', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'KVKJ19' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'KVKJ19', 'SUZUKI', 'SWIFT', 2019, 'S/C', 53) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '1128', 'KVKJ19', 'REINSTALACION DOWNPIPE - CARGA MAPA STOCK DE FABRICA', 'REINSTALACION DOWNPIPE - CARGA MAPA STOCK DE FABRICA', 100000, 'completada', '2020-12-07');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 30: OT 1129
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'JOSE PAIYALEF' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'JOSE PAIYALEF', '18974202-9', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'YP1486' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'YP1486', 'BMW', '116I', 2005, 'S/C', 183) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '1129', 'YP1486', 'INSTALAR SILENCIADOR ALTO FLUJO ,AGNAFLOW + AXLE BACK FREE 2,5'''' + COLA INOX 4''''', 'INSTALAR SILENCIADOR ALTO FLUJO ,AGNAFLOW + AXLE BACK FREE 2,5'''' + COLA INOX 4''''', 340000, 'completada', '2020-12-07');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 31: OT 1130
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'RODRIGO VALENZUELA' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'RODRIGO VALENZUELA', '18170613-9', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'VU2049' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'VU2049', 'BMW', 'X5', 2003, 'S/C', 223787) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '1130', 'VU2049', 'XPIPE CENTRAL', 'XPIPE CENTRAL', 250000, 'completada', '2020-12-10');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 32: OT 1131
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'MAURICIOGONZALEZ' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'MAURICIOGONZALEZ', '13698202-8', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'DFTS78' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'DFTS78', 'VOLVO', '560 T6', 2011, 'S/C', 140185) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '1131', 'DFTS78', 'DOWNPIPE INOX 3'''' - REPRO DE ECU STAGE 2 - INSTALACION DE COLAS ''''LAS TRAE CLIENTE'''' CON REDUCCION', 'DOWNPIPE INOX 3'''' - REPRO DE ECU STAGE 2 - INSTALACION DE COLAS ''''LAS TRAE CLIENTE'''' CON REDUCCION', 919800, 'completada', '2020-12-10');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 33: OT 1132
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'VICTOR VENEGAS' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'VICTOR VENEGAS', '18083382-K', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'FLTD98' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'FLTD98', 'BMW', '140I', 2013, 'S/C', 96216) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '1132', 'FLTD98', 'AXLE BACK FREE INOX 3'''' CON CAMBIO DE COLAS 4'''' BLACK', 'AXLE BACK FREE INOX 3'''' CON CAMBIO DE COLAS 4'''' BLACK', 300000, 'completada', '2020-12-10');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 34: OT 1133
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'FELIPE RAMIREZ' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'FELIPE RAMIREZ', '16021020-6', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'DCGH49' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'DCGH49', 'LEXUS', 'IS 250', 2011, 'S/C', 63309) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '1133', 'DCGH49', 'INSTALACION CUT OUT CON MODIFICACION DE LINEA', 'INSTALACION CUT OUT CON MODIFICACION DE LINEA', 300000, 'completada', '2020-12-11');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 35: OT 1134
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'OSCAR CHAPARRO' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'OSCAR CHAPARRO', '10276090-5', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'HGVP45' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'HGVP45', 'INFINITI', 'Q 605', 2016, 'S/C', 55042) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '1134', 'HGVP45', 'AXLE BACK CON SILENCIADOR LO TRAE CLIENTE, MANTIENE COLAS', 'AXLE BACK CON SILENCIADOR LO TRAE CLIENTE, MANTIENE COLAS', 299900, 'completada', '2020-12-14');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 36: OT 1135
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'FELIPE RUMINOT' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'FELIPE RUMINOT', '16618186-0', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'JJGX44' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'JJGX44', 'VOLVO', 'V40 T4', 2017, 'S/C', 95) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '1135', 'JJGX44', 'AXLE BACK FREE CON COLAS 4', 'AXLE BACK FREE CON COLAS 4', 299900, 'completada', '2020-12-14');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 37: OT 1136
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'JUAN CARLOS JERIA' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'JUAN CARLOS JERIA', '6973318-2', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'FPSH88' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'FPSH88', 'MINI', 'JCW', 0, 'S/C', 82439) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '1136', 'FPSH88', 'INSTALACION DE CAZOLETA DELANTERAS - REPUESTO IMPORTADO POR STEEL MONKEY', 'INSTALACION DE CAZOLETA DELANTERAS - REPUESTO IMPORTADO POR STEEL MONKEY', 180000, 'completada', '2020-12-15');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 38: OT 1137
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'MARCELO ARENAS' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'MARCELO ARENAS', '11974711-2', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'JGXT20' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'JGXT20', 'CHEVROLET', 'CAMARO', 2017, 'S/C', 18) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '1137', 'JGXT20', 'AXLE BACK FREE + 2 COLAS BLACK 4,5''''', 'AXLE BACK FREE + 2 COLAS BLACK 4,5''''', 299900, 'completada', '2020-12-15');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 39: OT 1138
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'JUAN MANUEL ALVAREZ' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'JUAN MANUEL ALVAREZ', '23760425-3', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'HPWG46' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'HPWG46', 'MINI', 'COOPER', 2016, 'S/C', 45777) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '1138', 'HPWG46', 'INSTALACION EIBACH PROKIT', 'INSTALACION EIBACH PROKIT', 329900, 'completada', '2020-12-16');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 40: OT 1139
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'CRISTIAN CONCHA' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'CRISTIAN CONCHA', '15381993-9', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'HJRP90' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'HJRP90', 'RANGE ROVER', 'SPORT', 2015, 'S/C', 55) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '1139', 'HJRP90', 'INSTALACION DE COLA ''TRAE CLIENTE'' - REPRO STAGE 1', 'INSTALACION DE COLA ''TRAE CLIENTE'' - REPRO STAGE 1', 631000, 'completada', '2020-12-16');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 41: OT 1140
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'JUAN CARLOS JERIA' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'JUAN CARLOS JERIA', '', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'HVLR44' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'HVLR44', 'CHEVROLET', 'SILVERADO', 2020, 'S/C', 0) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '1140', 'HVLR44', 'IMPORTACION E INSTALACION DE CUT OUT', 'IMPORTACION E INSTALACION DE CUT OUT', 500000, 'completada', '2020-12-17');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 42: OT 1141
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'FRANCO LLANOS' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'FRANCO LLANOS', '21092662-3', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'KGSF14' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'KGSF14', 'JEEP', 'CHEROKEE', 2018, 'S/C', 50182) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '1141', 'KGSF14', 'SUPRIMIR SILENCIADOR CENTRAL CON TRAMO INOX 2,5'''' + AXLE BACK VIBRANT C/ CLAS 4 BLACK GLOSSY', 'SUPRIMIR SILENCIADOR CENTRAL CON TRAMO INOX 2,5'''' + AXLE BACK VIBRANT C/ CLAS 4 BLACK GLOSSY', 780000, 'completada', '2020-12-18');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 43: OT 1142
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'SEBASTIAN ALVARADO' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'SEBASTIAN ALVARADO', '18086450-4', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'HJGX64' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'HJGX64', 'VOLKSWAGEN', 'GTI MK7', 2015, 'S/C', 57411) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '1142', 'HJGX64', 'SUPRIMIR SILENCIADOR CENTRAL, FABRICAR SOPORTE + MONTAJE DE CATBACK ( LO TRAE CLIENTE)', 'SUPRIMIR SILENCIADOR CENTRAL, FABRICAR SOPORTE + MONTAJE DE CATBACK ( LO TRAE CLIENTE)', 150000, 'completada', '2020-12-18');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 44: OT 1143
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'LEANDRO MORALES' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'LEANDRO MORALES', '18465248-K', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'HWKW51' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'HWKW51', 'MAZDA', '3 SPORT', 2016, 'S/C', 22913) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '1143', 'HWKW51', 'AXLE BACK FREE + 2 COLAS INOX 4'''' CON FLANCHE INTERCAMBIABLE', 'AXLE BACK FREE + 2 COLAS INOX 4'''' CON FLANCHE INTERCAMBIABLE', 320000, 'completada', '2020-12-21');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 45: OT 1144
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'BRIAN TRUJILLO' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'BRIAN TRUJILLO', '19240288-3', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'GVCP68' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'GVCP68', 'KIA', 'RIO 4', 2014, 'S/C', 42958) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '1144', 'GVCP68', 'FABRICACION TRAMO  NUEVO POST SILENCIADOR - INSTALACION COLA ACKAPORE ''TRAE CLIENTE'' CON MODIFICACION DE PARACHOQUE', 'FABRICACION TRAMO  NUEVO POST SILENCIADOR - INSTALACION COLA ACKAPORE ''TRAE CLIENTE'' CON MODIFICACION DE PARACHOQUE', 85000, 'completada', '2020-12-21');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 46: OT 1145
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'EDUARDO RUBIO' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'EDUARDO RUBIO', '16005035-7', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'KRKL61' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'KRKL61', 'S/M', 'S/M', 0, 'S/C', 0) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '1145', 'KRKL61', 'INSTALACION DE COLA OVALADA - INSTALACION DE SILENCIADOR 2'''' - PINTADO DE COLA BLACK', 'INSTALACION DE COLA OVALADA - INSTALACION DE SILENCIADOR 2'''' - PINTADO DE COLA BLACK', 215000, 'completada', '2020-12-21');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 47: OT 1146
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'LUIS TOBAR' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'LUIS TOBAR', '16943560-K', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'HYLZ70' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'HYLZ70', 'CHEVROLET', 'SILVERADO', 2016, 'S/C', 32) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '1146', 'HYLZ70', 'INSTALACION CUT OUT ELECTRONICO 3''''', 'INSTALACION CUT OUT ELECTRONICO 3''''', 239900, 'completada', '2020-12-22');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 48: OT 1147
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'MARCELO MUSSIETT' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'MARCELO MUSSIETT', '', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'CBYL29' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'CBYL29', 'AUDI', 'A3', 2010, 'S/C', 119143) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '1147', 'CBYL29', 'LINEA COMPLETA INOX + MAGNAFLOW REAR CON BALA CENTRAL + 2 COLA C/45 SMG - REPRO DE ECU STAGE 1', 'LINEA COMPLETA INOX + MAGNAFLOW REAR CON BALA CENTRAL + 2 COLA C/45 SMG - REPRO DE ECU STAGE 1', 930000, 'completada', '2020-12-22');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 49: OT 1148
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'CLIENTE GENERICO' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'CLIENTE GENERICO', '', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'SIN-PAT' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'SIN-PAT', 'S/M', 'S/M', 0, 'S/C', 0) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '1148', 'SIN-PAT', 'Carga masiva', 'Carga masiva', 0, 'completada', '2026-01-01');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 50: OT 1149
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'FERNANDO CELIS' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'FERNANDO CELIS', '13829987-2', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'FSKR27' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'FSKR27', 'SUZUKI', 'GRAND NOMADE', 2013, 'S/C', 78475) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '1149', 'FSKR27', 'AXLE BACK SMG BALA 1 2'''' + COLA INOX 3'''' CORTE 45', 'AXLE BACK SMG BALA 1 2'''' + COLA INOX 3'''' CORTE 45', 199900, 'completada', '2020-12-22');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 51: OT 1150
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'ADRIAN HERNANDEZ' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'ADRIAN HERNANDEZ', '18242456-0', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'DXYY52' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'DXYY52', 'BMW', 'X3', 2012, 'S/C', 84240) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '1150', 'DXYY52', 'DOWNPIPE - REPROGRAMACION STAGE 2', 'DOWNPIPE - REPROGRAMACION STAGE 2', 770000, 'completada', '2020-12-23');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 52: OT 1151
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'CRISTIAN MARIN' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'CRISTIAN MARIN', '16473648-2', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'FDLZ40' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'FDLZ40', 'AUDI', 'A6', 2013, 'S/C', 108) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '1151', 'FDLZ40', 'REMOVER SILENCIADOR CENTRAL', 'REMOVER SILENCIADOR CENTRAL', 60000, 'completada', '2020-12-23');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 53: OT 1152
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'JOAQUIN CASTELLANO' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'JOAQUIN CASTELLANO', '17600139-9', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'CWJP35' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'CWJP35', 'CHEVROLET', 'SILVERADO', 2011, 'S/C', 97146) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '1152', 'CWJP35', 'LINEA COMPLETA CON FLEXIBLE Y SOPORTES NUEVOS CON SILENCIADOR ALTO FLUJO MAGNAFLOW + COLA BLACK 4''''', 'LINEA COMPLETA CON FLEXIBLE Y SOPORTES NUEVOS CON SILENCIADOR ALTO FLUJO MAGNAFLOW + COLA BLACK 4''''', 660000, 'completada', '2020-12-24');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 54: OT 1153
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'ESTEBAN SALAZAR' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'ESTEBAN SALAZAR', '17098694-6', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'BGRF21' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'BGRF21', 'MITSUBISHI', 'LANCER', 2008, 'S/C', 124759) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '1153', 'BGRF21', 'LINEA COMPLETA INOX 2'''' - SILENCIADOR CENTRAL PEUGEOT - MAGNAFLOW TRASERO 2,5'''' - SIN COLA', 'LINEA COMPLETA INOX 2'''' - SILENCIADOR CENTRAL PEUGEOT - MAGNAFLOW TRASERO 2,5'''' - SIN COLA', 499900, 'completada', '2020-12-24');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 55: OT 1154
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'FELIPE GOMEZ' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'FELIPE GOMEZ', '17858277-8', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'HKBP27' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'HKBP27', 'OPEL', 'CORSA OPC', 2015, 'S/C', 89497) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '1154', 'HKBP27', 'SUPRIMIR EL ULTIMO SILENCIADOR ORIGINAL TRASERO POR INOX', 'SUPRIMIR EL ULTIMO SILENCIADOR ORIGINAL TRASERO POR INOX', 75000, 'completada', '2020-12-28');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 56: OT 1155
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'TOMAS REYES' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'TOMAS REYES', '20676433-3', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'JTZK32' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'JTZK32', 'BMW', 'M 240', 2017, 'S/C', 36800) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '1155', 'JTZK32', 'REINSTALACION DE AXLE BACK FREE C/COLAS ''LO TRAE CLIENTE)', 'REINSTALACION DE AXLE BACK FREE C/COLAS ''LO TRAE CLIENTE)', 100000, 'completada', '2020-12-28');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 57: OT 1156
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'FRANCISCO SILVA' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'FRANCISCO SILVA', '14908005-8', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'NB3236' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'NB3236', 'MERCEDES', 'S420', 1995, 'S/C', 255412) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '1156', 'NB3236', 'SUPRIMIR 2 SILENCIADORES ORIGINALES CON SOPORTES NUEVOS + 2 COLAS INOX 3'''' CON CORTE PARACHOQUE', 'SUPRIMIR 2 SILENCIADORES ORIGINALES CON SOPORTES NUEVOS + 2 COLAS INOX 3'''' CON CORTE PARACHOQUE', 380000, 'completada', '2020-12-28');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 58: OT 1157
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'CAMILO HUERNA' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'CAMILO HUERNA', '20939260-7', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'GXLH39' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'GXLH39', 'BMW', 'Z4', 2015, 'S/C', 65) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '1157', 'GXLH39', 'REMOVER ULTIMO SILENCIADOR - CAMBIO DE COLA 3,5''''', 'REMOVER ULTIMO SILENCIADOR - CAMBIO DE COLA 3,5''''', 259000, 'completada', '2020-12-28');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 59: OT 1158
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'CRISTOBAL HUERTA' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'CRISTOBAL HUERTA', '15363992-2', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'DSDL37' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'DSDL37', 'BMW', '136I', 2013, 'S/C', 140747) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '1158', 'DSDL37', 'AXLE BACK INOX 3'''' + COLA NUEVOS 3''''', 'AXLE BACK INOX 3'''' + COLA NUEVOS 3''''', 260000, 'completada', '2020-12-29');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 60: OT 1159
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'IGNACIO ALFARO' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'IGNACIO ALFARO', '20239792-1', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'LRSS80' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'LRSS80', 'VOLKSWAGEN', 'VOYAGE', 2020, 'S/C', 18) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '1159', 'LRSS80', 'REEMPLAZO ULTIMO SILENCIADOR POR ALTO FLUJO AMERICANO 2,5'''' CON INSTALACION SIN COLA', 'REEMPLAZO ULTIMO SILENCIADOR POR ALTO FLUJO AMERICANO 2,5'''' CON INSTALACION SIN COLA', 100000, 'completada', '2020-12-29');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 61: OT 1160
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'IAN ALFARO' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'IAN ALFARO', '15931703-K', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'JJVF63' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'JJVF63', 'BMW', '120I', 2017, 'S/C', 29950) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '1160', 'JJVF63', 'DOWNPIPE INOX 3'''' - LINEA + SILENCIADOR ALTO FLUJO + COLAS NUEVAS VIBRANT - REPRO DE ECU STAGE 2''''', 'DOWNPIPE INOX 3'''' - LINEA + SILENCIADOR ALTO FLUJO + COLAS NUEVAS VIBRANT - REPRO DE ECU STAGE 2''''', 1094880, 'completada', '2020-12-29');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 62: OT 1161
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'LEANDRO MORALES' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'LEANDRO MORALES', '', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'HWKW51' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'HWKW51', 'MAZDA', '3 SPORT', 0, 'S/C', 0) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '1161', 'HWKW51', 'TRABAJO RUIDO DE ESCAPE - ANTI DRONE', 'TRABAJO RUIDO DE ESCAPE - ANTI DRONE', 70000, 'completada', '2020-12-30');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 63: OT 1162
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'HERNAN NILO' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'HERNAN NILO', '13275698-8', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'FTSS65' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'FTSS65', 'FORD', 'F150', 2013, 'S/C', 100000) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '1162', 'FTSS65', 'CUT OUT 3'''' INSTALADO - COLA 4'''' INOX CORTE RECTO - BULLY DOG REPRO DE ECU', 'CUT OUT 3'''' INSTALADO - COLA 4'''' INOX CORTE RECTO - BULLY DOG REPRO DE ECU', 824900, 'completada', '2020-12-30');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 64: OT 1163
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'FERNANDO VERGARA' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'FERNANDO VERGARA', '17679084-9', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'CTYF51' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'CTYF51', 'FORD', 'F150', 2011, 'S/C', 0) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '1163', 'CTYF51', 'INSTALACION SILENCIADOR ALTO FLUJO VIBRANT EXHAUST 3''''', 'INSTALACION SILENCIADOR ALTO FLUJO VIBRANT EXHAUST 3''''', 299900, 'completada', '2020-12-31');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 65: OT 1164
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'RODRIGO CERMENATI' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'RODRIGO CERMENATI', '8215677-1', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'LLPC78' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'LLPC78', 'HYUNDAI', 'GENESIS', 2010, 'S/C', 56246) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '1164', 'LLPC78', 'REPRO DE ECU STAGE 1 - REVISION SPRINTBOOSTER', 'REPRO DE ECU STAGE 1 - REVISION SPRINTBOOSTER', 349900, 'completada', '2021-01-04');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 66: OT 1165
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'DANIEL GOMEZ' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'DANIEL GOMEZ', '16796126-6', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'GKRY76' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'GKRY76', 'MERCEDES', 'A200', 2014, 'S/C', 60038) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '1165', 'GKRY76', 'LINEA ACERO INOX 2,5'''' + SILENCIADOR SMG AMERICANO BALA 2,5'''' + 4 COLAS DE ESCAPE CON MODIFICACION DE PARACHOQUE - SPRINTBOOSTER INSTALADO', 'LINEA ACERO INOX 2,5'''' + SILENCIADOR SMG AMERICANO BALA 2,5'''' + 4 COLAS DE ESCAPE CON MODIFICACION DE PARACHOQUE - SPRINTBOOSTER INSTALADO', 699900, 'completada', '2021-01-04');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 67: OT 1166
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'JUAN CARLOS AGUILAR' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'JUAN CARLOS AGUILAR', '20145059-9', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'KBKH43' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'KBKH43', 'AUDI', 'A3', 2018, 'S/C', 43531) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '1166', 'KBKH43', 'AXLE BACK CON Y - INSTALACION DE COLA ''TRAE CLIENTE''', 'AXLE BACK CON Y - INSTALACION DE COLA ''TRAE CLIENTE''', 299900, 'completada', '2021-01-05');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 68: OT 1167
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'JUAN IGNACIO VALDIVA' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'JUAN IGNACIO VALDIVA', '18391601-7', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'LRRJ52' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'LRRJ52', 'BMW', '120I', 2019, 'S/C', 0) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '1167', 'LRRJ52', 'ELIMINAR PRE-SILENCIADOR', 'ELIMINAR PRE-SILENCIADOR', 65000, 'completada', '2021-01-05');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 69: OT 1168
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'TOMAS HINZ PETER' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'TOMAS HINZ PETER', '18019322-7', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'LCKH40' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'LCKH40', 'JEEP', 'WRANGLER', 2019, 'S/C', 262) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '1168', 'LCKH40', 'AXLE BACK 2,5'''' SILENCIADOR ALTO FLUJO ''BALA 2,5'' - INSTALACION COLA NEGRO MATTE', 'AXLE BACK 2,5'''' SILENCIADOR ALTO FLUJO ''BALA 2,5'' - INSTALACION COLA NEGRO MATTE', 229900, 'completada', '2021-01-05');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 70: OT 1169
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'IGNACIO ROJAS' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'IGNACIO ROJAS', '19579367-0', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'LJDF72' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'LJDF72', 'MERCEDES', 'CLA 45', 2019, 'S/C', 18) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '1169', 'LJDF72', 'REINSTALACION DOWNPIPE CON FLANCHE ORIGINAL, RECAMBIO + REINSTALACION DE CACBACK + PERNOS PARA INSTALACION DE COLAS+ SOPORTE NUEVO FABRICADO', 'REINSTALACION DOWNPIPE CON FLANCHE ORIGINAL, RECAMBIO + REINSTALACION DE CACBACK + PERNOS PARA INSTALACION DE COLAS+ SOPORTE NUEVO FABRICADO', 170000, 'completada', '2021-01-06');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 71: OT 1170
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'GABRIEL CONTRETAS' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'GABRIEL CONTRETAS', '19211437-8', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'LGSR95' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'LGSR95', 'MINI', 'F56', 2019, 'S/C', 18716) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '1170', 'LGSR95', 'INSTALACION MAGNAFLOW 2,5'''' - INSTALACION BALA 2,5'''' - COLA 4''''NEGRA', 'INSTALACION MAGNAFLOW 2,5'''' - INSTALACION BALA 2,5'''' - COLA 4''''NEGRA', 440000, 'completada', '2021-01-07');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 72: OT 1171
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'GONZALO ALVAREZ' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'GONZALO ALVAREZ', '13914499-6', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'HLHY78' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'HLHY78', 'CHEVROLET', 'SILVERADO', 2016, 'S/C', 107584) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '1171', 'HLHY78', 'INSTALACION DE SILENCIADOR ALTO FLUJO CHERRY BOMB + TRAMO  NUEVO LINEA CON DUAL COLA CROMO 4''''', 'INSTALACION DE SILENCIADOR ALTO FLUJO CHERRY BOMB + TRAMO  NUEVO LINEA CON DUAL COLA CROMO 4''''', 500000, 'completada', '2021-01-08');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 73: OT 1172
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'JORGE VARGAS' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'JORGE VARGAS', '12274182-6', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'GXJB21' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'GXJB21', 'DODGE', 'DURANGO', 2015, 'S/C', 120412) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '1172', 'GXJB21', 'SUPRIMIR SILENCIADOR CENTRAL EN REEMPLAZO 2 ALTO FLUJO RESONADOR TIPO BALA - SE PROBA SILENCIADOR TRASERO ORIGINAL EN SU DEFECTO SUBE VALOR C/MAGNAFLOW', 'SUPRIMIR SILENCIADOR CENTRAL EN REEMPLAZO 2 ALTO FLUJO RESONADOR TIPO BALA - SE PROBA SILENCIADOR TRASERO ORIGINAL EN SU DEFECTO SUBE VALOR C/MAGNAFLOW', 0, 'completada', '2021-01-11');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 74: OT 1173
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'SIMON FIGUEROA' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'SIMON FIGUEROA', '20256084-9', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'LCYD85' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'LCYD85', 'VOLVO', 'XC40 TS', 2019, 'S/C', 62823) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '1173', 'LCYD85', 'SUPRIMIR SILENCIADOR CENTRAL + AXLE BACK', 'SUPRIMIR SILENCIADOR CENTRAL + AXLE BACK', 280000, 'completada', '2021-01-11');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 75: OT 1174
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'SEBASTIAN CAPOT' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'SEBASTIAN CAPOT', '16747384-3', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'KGGX11' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'KGGX11', 'BMW', '120I', 2018, 'S/C', 0) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '1174', 'KGGX11', 'RESONADOR DELETE CENTRAL CILINDRICO', 'RESONADOR DELETE CENTRAL CILINDRICO', 65000, 'completada', '2021-01-11');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 76: OT 1175
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'CLIENTE GENERICO' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'CLIENTE GENERICO', '', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'SIN-PAT' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'SIN-PAT', 'S/M', 'S/M', 0, 'S/C', 0) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '1175', 'SIN-PAT', 'Carga masiva', 'Carga masiva', 0, 'completada', '2026-01-01');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 77: OT 1176
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'CLIENTE GENERICO' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'CLIENTE GENERICO', '', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'SIN-PAT' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'SIN-PAT', 'S/M', 'S/M', 0, 'S/C', 0) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '1176', 'SIN-PAT', 'Carga masiva', 'Carga masiva', 0, 'completada', '2026-01-01');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 78: OT 1177
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'LUCAS PONCE' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'LUCAS PONCE', '19189619-K', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'BRFF50' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'BRFF50', 'HONDA', 'ACCORD', 2009, 'S/C', 157264) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '1177', 'BRFF50', 'AXLE BACK FREE C/ SUPRIMIR 3 SILENCIADORES, MANTIENE COLAS SE PULEN', 'AXLE BACK FREE C/ SUPRIMIR 3 SILENCIADORES, MANTIENE COLAS SE PULEN', 239900, 'completada', '2021-01-12');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 79: OT 1178
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'CARLOS RIVEROS' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'CARLOS RIVEROS', '17611040-6', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'LD3204' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'LD3204', 'HONDA', 'INTEGRA', 1993, 'S/C', 130446) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '1178', 'LD3204', 'GARANTIA POR FUGA EN EL ESCAPE', 'GARANTIA POR FUGA EN EL ESCAPE', 0, 'completada', '2021-01-14');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 80: OT 1179
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'SERGIO BUSTAMANTE' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'SERGIO BUSTAMANTE', '17654045-1', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'CWCH82' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'CWCH82', 'AUDI', 'TT', 2011, 'S/C', 95624) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '1179', 'CWCH82', 'LINEA INOX 3'''' + SILENCIADOR ALTO FLUJO VIBRANT + COLA NUEVAS, COLA BLACK', 'LINEA INOX 3'''' + SILENCIADOR ALTO FLUJO VIBRANT + COLA NUEVAS, COLA BLACK', 530000, 'completada', '2021-01-14');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 81: OT 1180
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'PABLO ALVAREZ' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'PABLO ALVAREZ', '18955091-K', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'JXXC69' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'JXXC69', 'BMW', '120I', 2019, 'S/C', 27260) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '1180', 'JXXC69', 'AXLE BACK MAGNAFLOW + 2 COLAS NUEVAS INOX 4'''' C/ABRAZADERA HIGH + INSTALACION DIFUSOR', 'AXLE BACK MAGNAFLOW + 2 COLAS NUEVAS INOX 4'''' C/ABRAZADERA HIGH + INSTALACION DIFUSOR', 565000, 'completada', '2021-01-15');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 82: OT 1181
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'FABIAN MONROY' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'FABIAN MONROY', '23411914-1', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'PDDF41' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'PDDF41', 'BMW', 'X2', 2020, 'S/C', 0) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '1181', 'PDDF41', 'INSTALACION DOWNPIPE ''LO TRAE CLIENTE''', 'INSTALACION DOWNPIPE ''LO TRAE CLIENTE''', 75000, 'completada', '2021-01-18');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 83: OT 1182
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'GONZALO TORRES TAPIA' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'GONZALO TORRES TAPIA', '13460422-0', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'PDHG38' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'PDHG38', 'RENAULT', 'MEGANE', 2020, 'S/C', 1011) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '1182', 'PDHG38', 'INSTALACION DOWNPIPE ''''FABRICADO POR STEEL MONKEY'''' - COTIZAR SALIDA DOBLE 3'''' CON CORTE DIAGONAL', 'INSTALACION DOWNPIPE ''''FABRICADO POR STEEL MONKEY'''' - COTIZAR SALIDA DOBLE 3'''' CON CORTE DIAGONAL', 380000, 'completada', '2021-01-18');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 84: OT 1183
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'DAVID GONZALEZ ALBORNOZ' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'DAVID GONZALEZ ALBORNOZ', '12408052-5', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'GXRD89' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'GXRD89', 'OPEL', 'INSIGNIA OPC', 2014, 'S/C', 68037) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '1183', 'GXRD89', 'INSTALACION SILENCIADOR ALTO FLUJO MAGNAFLOW 3'''' CENTRAL + INSTALALCION CAT. ALTO FLUJO MAGNAFLOW C/MODIFICACION DE LINEA', 'INSTALACION SILENCIADOR ALTO FLUJO MAGNAFLOW 3'''' CENTRAL + INSTALALCION CAT. ALTO FLUJO MAGNAFLOW C/MODIFICACION DE LINEA', 519800, 'completada', '2021-01-18');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 85: OT 1184
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'SEBASTIAN GARRIDO' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'SEBASTIAN GARRIDO', '20535426-3', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'TA4164' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'TA4164', 'CHEVROLET', 'S10', 1999, 'S/C', 159680) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '1184', 'TA4164', 'LINEA COMPLETA ACERO INOX 2'''' + SILENCIADOR ALTO FLUJO MAGNAFLOW CENTRAL - INSTALACION HILO SENSOR DE OXIGENO ''''MANTIENE CATALITICO, SE REINSTALA'''' +INOX 4''''', 'LINEA COMPLETA ACERO INOX 2'''' + SILENCIADOR ALTO FLUJO MAGNAFLOW CENTRAL - INSTALACION HILO SENSOR DE OXIGENO ''''MANTIENE CATALITICO, SE REINSTALA'''' +INOX 4''''', 549900, 'completada', '2021-01-18');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 86: OT 1185
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'PABLO RIOS' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'PABLO RIOS', '19135532-6', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'KWDV95' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'KWDV95', 'FORD', 'RANGER', 2019, 'S/C', 48162) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '1185', 'KWDV95', 'FABRICACION E INSTALACION DOWNPIPE', 'FABRICACION E INSTALACION DOWNPIPE', 380000, 'completada', '2021-01-19');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 87: OT 1186
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'MATIAS GONZALEZ' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'MATIAS GONZALEZ', '18880514-0', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'JWRR33' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'JWRR33', 'DODGE', 'DURANGO', 2018, 'S/C', 65) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '1186', 'JWRR33', 'SUPRIMIR AMBOS SILENCIADORES TRASERO INOX - 2 COLAS CROMO 4''''', 'SUPRIMIR AMBOS SILENCIADORES TRASERO INOX - 2 COLAS CROMO 4''''', 369900, 'completada', '2021-01-19');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 88: OT 1187
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'CESAR REYES' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'CESAR REYES', '77003651-8', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'SIN-PAT' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'SIN-PAT', 'NISSAN', '240Z', 1973, 'S/C', 0) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '1187', 'SIN-PAT', 'LINEA COMPLETA  ''''DOWNPIPE Y LINEA 1 PIEZA'''' + CATALITICO ALTO FLUJO MAGNAFLOW + FABRICACION FLANCHE CONEXIÓN TURBO', 'LINEA COMPLETA  ''''DOWNPIPE Y LINEA 1 PIEZA'''' + CATALITICO ALTO FLUJO MAGNAFLOW + FABRICACION FLANCHE CONEXIÓN TURBO', 940000, 'completada', '2021-01-20');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 89: OT 1188
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'FELIPE JAÑA' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'FELIPE JAÑA', '18831320-5', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'GTZY14' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'GTZY14', 'CHEVROLET', 'CRUZE', 2014, 'S/C', 0) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '1188', 'GTZY14', 'CUT OUT 2'''' CLIENTE PAGA SOLO INSTALACION', 'CUT OUT 2'''' CLIENTE PAGA SOLO INSTALACION', 100000, 'completada', '2021-01-20');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 90: OT 1189
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'NELSO ALFONSO' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'NELSO ALFONSO', '15416449-9', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'HCPF87' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'HCPF87', 'FORD', 'F150', 2015, 'S/C', 132570) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '1189', 'HCPF87', 'INSTALACION MAGNAFLOW ''LO TRAE CLIENTE'' + SUPRIMIR SILENCIADOR DELANTERO', 'INSTALACION MAGNAFLOW ''LO TRAE CLIENTE'' + SUPRIMIR SILENCIADOR DELANTERO', 135000, 'completada', '2021-01-20');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 91: OT 1190
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'ARIEL CASTRO' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'ARIEL CASTRO', '17966934-K', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'LYWP59' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'LYWP59', 'MAZDA', 'NEW 3', 2020, 'S/C', 12641) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '1190', 'LYWP59', 'AXLE BACK FREE + COLAS INOX 4''''', 'AXLE BACK FREE + COLAS INOX 4''''', 319900, 'completada', '2021-01-21');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 92: OT 1191
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'JOSE GOMEZ' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'JOSE GOMEZ', '19133028-5', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'CCYC43' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'CCYC43', 'BMW', '550I', 2010, 'S/C', 66858) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '1191', 'CCYC43', 'LINEA COMPLETA + RESONADOR + VIBRANT ALTO FLUJO 3'''' + REPRO STAGE 1 - COLA DUAL 3,5''''', 'LINEA COMPLETA + RESONADOR + VIBRANT ALTO FLUJO 3'''' + REPRO STAGE 1 - COLA DUAL 3,5''''', 1099900, 'completada', '2021-01-21');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 93: OT 1192
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'CLAUDIO VENEGAS' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'CLAUDIO VENEGAS', '9706503-9', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'JLKY73' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'JLKY73', 'SUBARU', 'XV', 2017, 'S/C', 62301) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '1192', 'JLKY73', 'INSTALACION CUT OUT 2''''', 'INSTALACION CUT OUT 2''''', 0, 'completada', '2021-01-22');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 94: OT 1193
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'MAXIMILIANO ECHEVERRI' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'MAXIMILIANO ECHEVERRI', '21043344-9', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'PJJK78' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'PJJK78', 'VOLKSWAGEN', 'POLO', 2021, 'S/C', 1556) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '1193', 'PJJK78', 'SUPRIMIR ULTIMO SILENCIADOR EN REEMPLAZO INOX', 'SUPRIMIR ULTIMO SILENCIADOR EN REEMPLAZO INOX', 145000, 'completada', '2021-01-22');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 95: OT 1194
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'IGNACIO GAJARDO' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'IGNACIO GAJARDO', '19950908-K', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'JZRJ68' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'JZRJ68', 'VOLKSWAGEN', 'GOLF', 2018, 'S/C', 34369) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '1194', 'JZRJ68', 'INSTALACION CUT OUT 2,5'''' INSTALADO', 'INSTALACION CUT OUT 2,5'''' INSTALADO', 229900, 'completada', '2021-01-25');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 96: OT 1195
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'BENJAMIN BERMUDEZ' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'BENJAMIN BERMUDEZ', '20283607-0', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'DCGJ71' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'DCGJ71', 'MITSUBISHI', 'MONTERO', 2011, 'S/C', 300) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '1195', 'DCGJ71', 'REPRO STAGE 1', 'REPRO STAGE 1', 349900, 'completada', '2021-01-25');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 97: OT 1196
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'GASTON BARRERA' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'GASTON BARRERA', '8341731-5', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'GKRH85' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'GKRH85', 'FORD', 'RAPTOR', 2014, 'S/C', 49429) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '1196', 'GKRH85', 'INSTALAION CUT OUT 3'''' - COLAS NEGRAS 2', 'INSTALAION CUT OUT 3'''' - COLAS NEGRAS 2', 414900, 'completada', '2021-01-26');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 98: OT 1197
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'RAUL POBLETE' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'RAUL POBLETE', '16366379-1', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'KJJV62' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'KJJV62', 'VOLKSWAGEN', 'GTI', 2018, 'S/C', 27259) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '1197', 'KJJV62', 'UPGRADE STAGE 2 / POPS AND BANG', 'UPGRADE STAGE 2 / POPS AND BANG', 180000, 'completada', '2021-01-26');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 99: OT 1198
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'BENJAMIN PORALES' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'BENJAMIN PORALES', '17703848-2', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'FTJX69' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'FTJX69', 'RENAULT', 'MEGANE', 2013, 'S/C', 0) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '1198', 'FTJX69', 'REINSTALACION SILENCIADORES ORIGINALES X2', 'REINSTALACION SILENCIADORES ORIGINALES X2', 149900, 'completada', '2021-01-26');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 100: OT 1199
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'NICOLAS ALVAREZ' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'NICOLAS ALVAREZ', '19242992-7', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'HDXY48' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'HDXY48', 'AUDI', 'A3', 2015, 'S/C', 65011) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '1199', 'HDXY48', 'FABRICACION E INSTALACION DE DOWNPIPE INOX - LINEA INOX 2,5'''' + SILENCIADOR ALTO FLUJO  + COLA NUEVA 4 BLACK + REPRO STAGE 2', 'FABRICACION E INSTALACION DE DOWNPIPE INOX - LINEA INOX 2,5'''' + SILENCIADOR ALTO FLUJO  + COLA NUEVA 4 BLACK + REPRO STAGE 2', 899800, 'completada', '2021-01-27');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    RAISE NOTICE 'Procesados 100 registros...';
    -- Fila 101: OT 1200
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'MAURICIO CARRASCO' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'MAURICIO CARRASCO', '16159008-0', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'PKVX96' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'PKVX96', 'HYUNDAI', 'GENESIS', 2013, 'S/C', 93599) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '1200', 'PKVX96', 'INSTALACION DOBLE  COLA, UNA A CADA LADO', 'INSTALACION DOBLE  COLA, UNA A CADA LADO', 320000, 'completada', '2021-01-27');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 102: OT 1201
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'BORIS SILVA' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'BORIS SILVA', '18883382-9', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'KTZP16' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'KTZP16', 'MAZDA', 'NEW 3', 2018, 'S/C', 31364) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '1201', 'KTZP16', 'INSTALACION SPRINTBOOSTER + REPRO ECU STAGE 1 +14HP+16NM', 'INSTALACION SPRINTBOOSTER + REPRO ECU STAGE 1 +14HP+16NM', 529900, 'completada', '2021-01-27');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 103: OT 1202
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'CARLOS VALDEZ' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'CARLOS VALDEZ', '18286339-4', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'DGJT97' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'DGJT97', 'MAZDA', '3 SPORT', 2011, 'S/C', 117624) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '1202', 'DGJT97', 'INSTALACION ALTO FLUJO CENTRAL 2'''' CAMBIO COLA 4'''' CROMO', 'INSTALACION ALTO FLUJO CENTRAL 2'''' CAMBIO COLA 4'''' CROMO', 185000, 'completada', '2021-01-28');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 104: OT 1203
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'WILFREDO PRADO' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'WILFREDO PRADO', '13656401-1', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'PGYG64' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'PGYG64', 'BMW', 'M4', 2021, 'S/C', 37065) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '1203', 'PGYG64', 'SUPRIMIR RESONADOR CENTRAL', 'SUPRIMIR RESONADOR CENTRAL', 149900, 'completada', '2021-01-28');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 105: OT 1204
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'JUAN CARLOS JERIA' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'JUAN CARLOS JERIA', '6973318-2', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'FPSH88' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'FPSH88', 'MINI', 'COOPER', 2013, 'S/C', 83395) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '1204', 'FPSH88', 'INSTALACION SPRINTBOOSTER', 'INSTALACION SPRINTBOOSTER', 249900, 'completada', '2021-01-28');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 106: OT 1205
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'ALBERTO AGUILERA' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'ALBERTO AGUILERA', '25637162-6', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'KKKK23' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'KKKK23', 'AUDI', 'A3', 2018, 'S/C', 28) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '1205', 'KKKK23', 'INSTALACION DIFUSOR TRASERO ''LO TRAE CLIENTE''', 'INSTALACION DIFUSOR TRASERO ''LO TRAE CLIENTE''', 45000, 'completada', '2021-01-29');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 107: OT 1206
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'JAVIER ENCINA' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'JAVIER ENCINA', '16787827-K', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'GFBV72' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'GFBV72', 'BMW', '116I', 2014, 'S/C', 70) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '1206', 'GFBV72', 'AXLE BACK INOX 2,5'''' + SILENCIADOR ALTO FLUJO TIPO BALA BLACK + COLA 4'''' BLACK', 'AXLE BACK INOX 2,5'''' + SILENCIADOR ALTO FLUJO TIPO BALA BLACK + COLA 4'''' BLACK', 244900, 'completada', '2021-01-29');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 108: OT 1207
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'ALEXANDER ESCALANTE' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'ALEXANDER ESCALANTE', '10673333-3', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'HXKC63' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'HXKC63', 'VOLVO', 'XC60', 2016, 'S/C', 31) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '1207', 'HXKC63', 'FABRICACION E INSTALACION DE AXLE BACK', 'FABRICACION E INSTALACION DE AXLE BACK', 180000, 'completada', '2021-01-29');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 109: OT 1208
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'SEBASTIAN VERGADO' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'SEBASTIAN VERGADO', '9834406-3', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'DTSS97' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'DTSS97', 'MAZDA', 'CX7', 2012, 'S/C', 120) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '1208', 'DTSS97', 'REPARACION SILENCIADOR TRASERO TORCIDO POR GOLPE', 'REPARACION SILENCIADOR TRASERO TORCIDO POR GOLPE', 35000, 'completada', '2021-01-29');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 110: OT 1209
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'FELIPE BARRA' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'FELIPE BARRA', '18337801-5', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'GXFT13' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'GXFT13', 'BMW', '235I', 2015, 'S/C', 98064) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '1209', 'GXFT13', 'INSTALACION SPRINTBOOSTER', 'INSTALACION SPRINTBOOSTER', 249900, 'completada', '2021-01-29');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 111: OT 1210
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'ADAM SANTELICES' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'ADAM SANTELICES', '18046934-6', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'HVGJ34' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'HVGJ34', 'CITROEN', 'DS3', 2016, 'S/C', 49369) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '1210', 'HVGJ34', 'SUPRIMIR SILENCIADOR CENTRAL INOX', 'SUPRIMIR SILENCIADOR CENTRAL INOX', 65000, 'completada', '2021-02-01');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 112: OT 1211
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'FRANCISCO HIDALGO' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'FRANCISCO HIDALGO', '17326559-K', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'LXFW26' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'LXFW26', 'FORD', 'EDGE ST', 2021, 'S/C', 3491) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '1211', 'LXFW26', 'AXLE BACK ALTO FLUJO DUAL BLACK 2,5'''' + 2 COLAS 4,5'''' BLACK', 'AXLE BACK ALTO FLUJO DUAL BLACK 2,5'''' + 2 COLAS 4,5'''' BLACK', 460000, 'completada', '2021-02-01');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 113: OT 1212
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'JOHN RADALJ' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'JOHN RADALJ', '18296576-6', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'CCXV47' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'CCXV47', 'BMW', '335I', 2007, 'S/C', 129) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '1212', 'CCXV47', 'INSTALACION COLA DUAL BMW BLACK CON MODIFICACION DE PARACHOQUE', 'INSTALACION COLA DUAL BMW BLACK CON MODIFICACION DE PARACHOQUE', 279800, 'completada', '2021-02-01');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 114: OT 1213
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'CRISTOPHER ASTUDILLO' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'CRISTOPHER ASTUDILLO', '15435742-4', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'HKPK56' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'HKPK56', 'BMW', '135I F20', 2016, 'S/C', 86651) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '1213', 'HKPK56', 'INSTALACION Y VENTA DE CHANGE PIPE N55', 'INSTALACION Y VENTA DE CHANGE PIPE N55', 259900, 'completada', '2021-02-01');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 115: OT 1214
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'JOSE LUIS ROSALES' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'JOSE LUIS ROSALES', '16425364-3', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'PLBP95' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'PLBP95', 'DODGE', 'RAM 1500', 2021, 'S/C', 745) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '1214', 'PLBP95', 'INSTALACION ALTO FLUJO MAGNAFLOW 3''''', 'INSTALACION ALTO FLUJO MAGNAFLOW 3''''', 299900, 'completada', '2021-02-01');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 116: OT 1215
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'FELIPE' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'FELIPE', '', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'SIN-PAT' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'SIN-PAT', 'FORD', 'MUSTANG', 0, 'S/C', 0) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '1215', 'SIN-PAT', 'INSTALACION CAT BACK BORLA', 'INSTALACION CAT BACK BORLA', 120000, 'completada', '2021-02-02');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 117: OT 1216
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'CRISTIAN ROJAS' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'CRISTIAN ROJAS', '21091233-9', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'PGHF50' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'PGHF50', 'FORD', 'F150', 2021, 'S/C', 1360) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '1216', 'PGHF50', 'INSTALACION DE MAGNAFLOW', 'INSTALACION DE MAGNAFLOW', 299900, 'completada', '2021-02-02');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 118: OT 1217
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'ARIEL MARTINEZ' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'ARIEL MARTINEZ', '18488566-2', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'GGVH22' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'GGVH22', 'BMW', '428I', 2014, 'S/C', 106000) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '1217', 'GGVH22', 'REMOVER SILENCIADOR TRASERO CENTRAL', 'REMOVER SILENCIADOR TRASERO CENTRAL', 80000, 'completada', '2021-02-02');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 119: OT 1218
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'MATIAS OCHOA' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'MATIAS OCHOA', '15621176-1', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'FP7207' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'FP7207', 'CHEVROLET', 'CAMARO', 1973, 'S/C', 0) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '1218', 'FP7207', 'LINEA DUAL INOX CON H PIPE + 2 MAGNAFLOW CENTRAL OVALADO 2,5'''' + 2 COLA DUAL INOX 3,5''''', 'LINEA DUAL INOX CON H PIPE + 2 MAGNAFLOW CENTRAL OVALADO 2,5'''' + 2 COLA DUAL INOX 3,5''''', 1025000, 'completada', '2021-02-03');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 120: OT 1219
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'JOSE GALLARDO' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'JOSE GALLARDO', '18887624-K', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'FHTB79' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'FHTB79', 'MERCEDES', 'C63 W204', 2013, 'S/C', 84082) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '1219', 'FHTB79', 'LINEA DUAL INOX 2,5'''' + 2 RESONADORES + SILENCIADORES ALTO FLUJO VIBRANT EXHAUST', 'LINEA DUAL INOX 2,5'''' + 2 RESONADORES + SILENCIADORES ALTO FLUJO VIBRANT EXHAUST', 1020000, 'completada', '2021-02-04');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 121: OT 1220
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'FABIAN CORNEJO' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'FABIAN CORNEJO', '18717607-7', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'CLPJ94' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'CLPJ94', 'AUDI', 'TT', 2010, 'S/C', 138145) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '1220', 'CLPJ94', 'ESCAPE', 'ESCAPE', 189900, 'completada', '2021-02-04');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 122: OT 1221
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'ALEXANDER ESCALANTE' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'ALEXANDER ESCALANTE', '10673333-3', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'HXKC63' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'HXKC63', 'VOLVO', 'XC60', 2016, 'S/C', 0) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '1221', 'HXKC63', '2 ALTO FLUJO BORLA BLACK CROMO 2,5'''' - ANTI DRONE TUBE', '2 ALTO FLUJO BORLA BLACK CROMO 2,5'''' - ANTI DRONE TUBE', 290000, 'completada', '2021-02-08');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 123: OT 1222
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'SASCHA' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'SASCHA', '16420435-2', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'DVWK88' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'DVWK88', 'TOYOTA', 'CRUSIER', 2012, 'S/C', 90000) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '1222', 'DVWK88', 'INSTALACION CUT OUT 3'''' - REINSTALACION DE BORLA ''ANTES DE CUT OUT'' - INSTALACION SILENCIADOR CONVENCIONAL ''ZONA TRASERA'' CONSERVANDO SALIDA DOBLE LINEA', 'INSTALACION CUT OUT 3'''' - REINSTALACION DE BORLA ''ANTES DE CUT OUT'' - INSTALACION SILENCIADOR CONVENCIONAL ''ZONA TRASERA'' CONSERVANDO SALIDA DOBLE LINEA', 399900, 'completada', '2021-02-08');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 124: OT 1223
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'MATIAS ROMERO' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'MATIAS ROMERO', '17293052-2', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'LCSF82' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'LCSF82', 'SUBARU', 'XV', 2019, 'S/C', 56932) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '1223', 'LCSF82', 'INSTALACION SPRINTBOOSTER', 'INSTALACION SPRINTBOOSTER', 249900, 'completada', '2021-02-08');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 125: OT 1224
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'MATIAS RODRIGUEZ' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'MATIAS RODRIGUEZ', '19417867-0', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'GSDL10' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'GSDL10', 'BMW', '116I', 2014, 'S/C', 100000) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '1224', 'GSDL10', 'DOWNPIPE + AXLE BACK CON COLA 4'''' M ''SILENCIADOR MAGNAFLOW''', 'DOWNPIPE + AXLE BACK CON COLA 4'''' M ''SILENCIADOR MAGNAFLOW''', 650000, 'completada', '2021-02-09');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 126: OT 1225
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'JAN HERZ' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'JAN HERZ', '19653192-0', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'JRLF96' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'JRLF96', 'DODGE', 'RAM 1500', 2017, 'S/C', 30999) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '1225', 'JRLF96', 'FLOWMASTER SUPER 10 1 ENTRADA 2 SALIDAS', 'FLOWMASTER SUPER 10 1 ENTRADA 2 SALIDAS', 300000, 'completada', '2021-02-09');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 127: OT 1226
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'CLIENTE GENERICO' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'CLIENTE GENERICO', '', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'PKGJ70' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'PKGJ70', 'DODGE', 'RAM 1500', 0, 'S/C', 0) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '1226', 'PKGJ70', 'SUPRIMIR SILENCIADOR CENTRAL X INOX 3'''' + DESINTALACION + INSTALACION PISADERAS', 'SUPRIMIR SILENCIADOR CENTRAL X INOX 3'''' + DESINTALACION + INSTALACION PISADERAS', 130000, 'completada', '2021-02-09');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 128: OT 1227
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'ALVARO BARRIOS' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'ALVARO BARRIOS', '11594341-3', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'DGJF18' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'DGJF18', 'DODGE', 'DURANGO', 2011, 'S/C', 104695) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '1227', 'DGJF18', 'INSTALACION X-PIPE ''LO TRAE CLIENTE'' CON MODIFICACION DE LINEA INOX', 'INSTALACION X-PIPE ''LO TRAE CLIENTE'' CON MODIFICACION DE LINEA INOX', 200000, 'completada', '2021-02-10');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 129: OT 1228
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'DANIEL SASAKI' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'DANIEL SASAKI', '15585516-9', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'FYTD53' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'FYTD53', 'SUBARU', 'XV', 2014, 'S/C', 61400) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '1228', 'FYTD53', 'CUT OUT ''INSTALACION'' 2''''', 'CUT OUT ''INSTALACION'' 2''''', 219900, 'completada', '2021-02-10');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 130: OT 1229
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'NICOLAS BERGUECIO' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'NICOLAS BERGUECIO', '16208285-K', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'LYCP39' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'LYCP39', 'SUZUKI', 'JIMNY', 2020, 'S/C', 0) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '1229', 'LYCP39', 'INSTALACION SILENCIADOR PARA BAJAR SONIDO Y VER DRONE', 'INSTALACION SILENCIADOR PARA BAJAR SONIDO Y VER DRONE', 0, 'completada', '2021-02-10');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 131: OT 1230
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'FELIPE NUÑEZ' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'FELIPE NUÑEZ', '17675975-5', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'JKDD32' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'JKDD32', 'FORD', 'RANGER', 2017, 'S/C', 150) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '1230', 'JKDD32', 'FABRICACION E INSTALACION DE DOWNPIPE + LINEA 3'' DUAL 2,5'''' INOX MANTIENE COLAS + SPRINTBOOSTER', 'FABRICACION E INSTALACION DE DOWNPIPE + LINEA 3'' DUAL 2,5'''' INOX MANTIENE COLAS + SPRINTBOOSTER', 1050000, 'completada', '2021-02-11');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 132: OT 1231
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'ERIKE LOPEZ' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'ERIKE LOPEZ', '22897492-7', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'LKLZ35' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'LKLZ35', 'BMW', '118I', 2019, 'S/C', 17259) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '1231', 'LKLZ35', 'INSTALACION SILENCIADOR ALTO FLUJO MAGNAFLOW', 'INSTALACION SILENCIADOR ALTO FLUJO MAGNAFLOW', 309800, 'completada', '2021-02-11');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 133: OT 1232
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'SEBASTIAN QUESADA OSORIO' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'SEBASTIAN QUESADA OSORIO', '16493600-7', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'BVWC40' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'BVWC40', 'NISSAN', 'SENTRA', 2009, 'S/C', 98587) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '1232', 'BVWC40', 'LINEA DE ESCAPE INOX 2'''' + SILENCIADOR ALTO FLUJO BORLA C/COLA 3,5''''', 'LINEA DE ESCAPE INOX 2'''' + SILENCIADOR ALTO FLUJO BORLA C/COLA 3,5''''', 499900, 'completada', '2021-02-12');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 134: OT 1233
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'FABIAN CORNEJO' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'FABIAN CORNEJO', '18717607-7', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'CLPJ94' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'CLPJ94', 'AUDI', 'TT', 0, 'S/C', 139033) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '1233', 'CLPJ94', 'AXLE BACK FREE 4'''' COLAS', 'AXLE BACK FREE 4'''' COLAS', 420000, 'completada', '2021-02-15');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 135: OT 1234
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'VICENTE CIFUENTE' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'VICENTE CIFUENTE', '21030919-5', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'KRJB43' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'KRJB43', 'BMW', 'M140', 2018, 'S/C', 0) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '1234', 'KRJB43', 'REMOVER SILENCIADOR CENTRAL', 'REMOVER SILENCIADOR CENTRAL', 60000, 'completada', '2021-02-15');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 136: OT 1235
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'FELIPE NUÑEZ' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'FELIPE NUÑEZ', '17675975-5', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'JKDD32' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'JKDD32', 'FORD', 'RANGER', 2017, 'S/C', 150996) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '1235', 'JKDD32', 'FABRICACION INTAKE AIR + FILTRO CONICO K&NN+ PIPING CHARGE PIPE + PIPING OUT PIPE', 'FABRICACION INTAKE AIR + FILTRO CONICO K&NN+ PIPING CHARGE PIPE + PIPING OUT PIPE', 490000, 'completada', '2021-02-16');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 137: OT 1236
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'TOMAS NISLEH' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'TOMAS NISLEH', '21556127-5', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'LVCJ38' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'LVCJ38', 'CHEVROLET', 'SILVERADO', 2020, 'S/C', 28209) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '1236', 'LVCJ38', 'INSTALACION CUT OUT 3''', 'INSTALACION CUT OUT 3''', 264900, 'completada', '2021-02-16');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 138: OT 1237
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'MARCELO TORRIJO' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'MARCELO TORRIJO', '19913642-9', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'LBVB16' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'LBVB16', 'RENAULT', 'CLIO RS', 2019, 'S/C', 0) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '1237', 'LBVB16', 'REINSTALAR LINEA FABRICADA EN EL TALLER + INSTALACION CHAPA SMG', 'REINSTALAR LINEA FABRICADA EN EL TALLER + INSTALACION CHAPA SMG', 80000, 'completada', '2021-02-16');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 139: OT 1238
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'FABIAN FIGUEROA' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'FABIAN FIGUEROA', '16540735-0', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'FRBJ19' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'FRBJ19', 'MERCEDES', 'A200', 2013, 'S/C', 67766) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '1238', 'FRBJ19', 'DOWNPIPE + LINEA 2,5'''' + SILENCIADOR ALTO FLUJO MANTIENE COLAS + REPRO ECU STAGE 2'''' + CHEQUE INTAKE AIR', 'DOWNPIPE + LINEA 2,5'''' + SILENCIADOR ALTO FLUJO MANTIENE COLAS + REPRO ECU STAGE 2'''' + CHEQUE INTAKE AIR', 1250000, 'completada', '2021-02-17');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 140: OT 1239
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'ENCO CUMPLIDO' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'ENCO CUMPLIDO', '18961240-0', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'FRJK30' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'FRJK30', 'SKODA', 'FABIA', 2013, 'S/C', 137979) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '1239', 'FRJK30', 'FABRICACION DE DOWNPIPE C/ DPF OFF CATLESS + REPRO DE ECU STAGE 2 C/DPF OFF', 'FABRICACION DE DOWNPIPE C/ DPF OFF CATLESS + REPRO DE ECU STAGE 2 C/DPF OFF', 737820, 'completada', '2021-02-17');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 141: OT 1240
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'SERGIO RODRIGUEZ' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'SERGIO RODRIGUEZ', '15380178-9', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'JKKT74' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'JKKT74', 'VOLKSWAGEN', 'GTI MK7', 2017, 'S/C', 52295) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '1240', 'JKKT74', 'INSTALACION DOWNPIPE CON INSTALACION DE CATALITICO ALTO FLUJO  MAGNAFLOW', 'INSTALACION DOWNPIPE CON INSTALACION DE CATALITICO ALTO FLUJO  MAGNAFLOW', 299900, 'completada', '2021-02-18');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 142: OT 1241
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'GERMAN VIERA' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'GERMAN VIERA', '10241097-1', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'DBFB24' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'DBFB24', 'BMW', '325I', 2012, 'S/C', 0) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '1241', 'DBFB24', 'INSTALACION  2 COLAS SMG 3'''' CORTE 45''''', 'INSTALACION  2 COLAS SMG 3'''' CORTE 45''''', 120000, 'completada', '2021-02-18');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 143: OT 1242
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'EDGARDO CASTILLO' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'EDGARDO CASTILLO', '13683076-7', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'FHYB62' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'FHYB62', 'RENAULT', 'MEGANE', 2013, 'S/C', 90000) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '1242', 'FHYB62', 'INSTALACION DE INTERCOOLER - REVISION PIPING', 'INSTALACION DE INTERCOOLER - REVISION PIPING', 1300000, 'completada', '2021-02-18');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 144: OT 1243
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'PABLO OBRIEN' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'PABLO OBRIEN', '18396473-9', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'GZYW45' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'GZYW45', 'MINI', 'COOPER', 2015, 'S/C', 87103) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '1243', 'GZYW45', 'SUPRIMIR SILENCIADOR CENTRAL POR INOX', 'SUPRIMIR SILENCIADOR CENTRAL POR INOX', 65000, 'completada', '2021-02-22');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 145: OT 1244
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'DANIEL' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'DANIEL', '16796126-6', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'GKRY76' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'GKRY76', 'MERCEDES', 'A200', 0, 'S/C', 60548) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '1244', 'GKRY76', 'DOWNPIPE - REPRO STAGE 2 - POPS AND BANG - ESPOSADOR DIVERTER', 'DOWNPIPE - REPRO STAGE 2 - POPS AND BANG - ESPOSADOR DIVERTER', 964700, 'completada', '2021-02-22');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 146: OT 1245
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'ALVARO CEGOBIA' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'ALVARO CEGOBIA', '14044646-7', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'HYSP62' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'HYSP62', 'FORD', 'MUSTANG', 2016, 'S/C', 40640) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '1245', 'HYSP62', 'CATBACK MAGNAFLOW', 'CATBACK MAGNAFLOW', 799900, 'completada', '2021-02-23');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 147: OT 1246
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'FRANCO LLANOS' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'FRANCO LLANOS', '21092662-3', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'FSLB46' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'FSLB46', 'CHEVROLET', 'CAMARO', 2013, 'S/C', 32032) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '1246', 'FSLB46', 'CAMARO - FABRICACION 2'''' Y'' PARA MONTAJE DE 4 COLAS BLACK + JEEP-CHEROKEE-KGSF14- INSTALACION 2 RESONADORES CENTRAL', 'CAMARO - FABRICACION 2'''' Y'' PARA MONTAJE DE 4 COLAS BLACK + JEEP-CHEROKEE-KGSF14- INSTALACION 2 RESONADORES CENTRAL', 650000, 'completada', '2021-02-24');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 148: OT 1247
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'JUAN FRANCISCO CRUCHADA' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'JUAN FRANCISCO CRUCHADA', '12962987-8', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'PBHD83' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'PBHD83', 'CHEVROLET', 'BLAZER', 2021, 'S/C', 5578) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '1247', 'PBHD83', 'AXLE BACK FREE 4 COLAS + LINEA COMPLETA INOX FREE', 'AXLE BACK FREE 4 COLAS + LINEA COMPLETA INOX FREE', 729900, 'completada', '2021-02-25');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 149: OT 1248
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'CLIENTE GENERICO' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'CLIENTE GENERICO', '', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'SIN-PAT' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'SIN-PAT', 'S/M', 'S/M', 0, 'S/C', 0) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '1248', 'SIN-PAT', 'Carga masiva', 'Carga masiva', 0, 'completada', '2026-01-01');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 150: OT 1249
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'ALVARO ROBLEDO' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'ALVARO ROBLEDO', '18224631-K', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'LF5153' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'LF5153', 'HONDA', 'INTEGRA', 1994, 'S/C', 240) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '1249', 'LF5153', 'AXLE BACK + SILENCIADOR BALA CROMO 2'''' + COLA DUAL 3'''' CROMO', 'AXLE BACK + SILENCIADOR BALA CROMO 2'''' + COLA DUAL 3'''' CROMO', 224900, 'completada', '2021-02-25');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 151: OT 1250
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'RODRIGO HERRERA' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'RODRIGO HERRERA', '13534964-K', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'FPFR41' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'FPFR41', 'MERCEDES', 'A200', 2013, 'S/C', 105496) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '1250', 'FPFR41', 'REMOVER SILENCIADOR CENTRAL - INSTALACION DE COLA  MB AMG ''SALIDA DOBLE'' - REPRO STAGE 1 -', 'REMOVER SILENCIADOR CENTRAL - INSTALACION DE COLA  MB AMG ''SALIDA DOBLE'' - REPRO STAGE 1 -', 625000, 'completada', '2021-02-26');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 152: OT 1251
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'VICTOR HERRERA' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'VICTOR HERRERA', '19448816-5', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'JSRJ33' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'JSRJ33', 'DODGE', 'RAM 1500', 2017, 'S/C', 72013) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '1251', 'JSRJ33', 'LINEA INOX 3'''' + SILENCIADOR ALTO FLUJO FLOWMASTER', 'LINEA INOX 3'''' + SILENCIADOR ALTO FLUJO FLOWMASTER', 650000, 'completada', '2021-02-26');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 153: OT 1252
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'FELIPE CASTRO' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'FELIPE CASTRO', '18059372-1', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'FPJH96' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'FPJH96', 'VOLVO', 'C30', 2013, 'S/C', 92664) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '1252', 'FPJH96', 'AXLE BACK FREE DUAL COLAS 4'''' CROMO + INSTALACION SILENCIADOR VIBRANT EN REEMPLAZO AL ORIGINAL', 'AXLE BACK FREE DUAL COLAS 4'''' CROMO + INSTALACION SILENCIADOR VIBRANT EN REEMPLAZO AL ORIGINAL', 499900, 'completada', '2021-03-01');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 154: OT 1253
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'ALEXANDER ESCALANTE' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'ALEXANDER ESCALANTE', '', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'HXKC63' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'HXKC63', 'VOLVO', 'XC60', 2016, 'S/C', 33806) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '1253', 'HXKC63', 'INSTALACION MAGNAFLOW CENTRAL', 'INSTALACION MAGNAFLOW CENTRAL', 196900, 'completada', '2021-03-01');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 155: OT 1254
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'FRANCISCO PIÑA' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'FRANCISCO PIÑA', '18661577-8', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'PHSX17' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'PHSX17', 'HYUNDAI', 'TUCSON', 2021, 'S/C', 13) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '1254', 'PHSX17', 'AXLE BACK FREE 2,5'''' INOX + 2 COLAS SMG 4''''', 'AXLE BACK FREE 2,5'''' INOX + 2 COLAS SMG 4''''', 299900, 'completada', '2021-03-02');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 156: OT 1255
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'GONZALO TORRES' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'GONZALO TORRES', '13460422-0', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'PDHG38' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'PDHG38', 'RENAULT', 'MEGANE', 2021, 'S/C', 3625) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '1255', 'PDHG38', 'REINSTALACION DOWNPIPE ORIGINAL', 'REINSTALACION DOWNPIPE ORIGINAL', 120000, 'completada', '2021-03-02');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 157: OT 1256
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'JUAN OSES' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'JUAN OSES', '19170872-5', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'HZYC24' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'HZYC24', 'PEUGEOT', '308 ALLURE', 2017, 'S/C', 85535) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '1256', 'HZYC24', 'PIPING TURBO, INTERCOOLER INOX 2'''' A MEDIDA', 'PIPING TURBO, INTERCOOLER INOX 2'''' A MEDIDA', 180000, 'completada', '2021-03-02');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 158: OT 1257
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'ARTURO MOLINA' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'ARTURO MOLINA', '25585066-0', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'PDLX92' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'PDLX92', 'RENAULT', 'CLIO', 2021, 'S/C', 4095) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '1257', 'PDLX92', 'AXLE BACK SILENCIADOR AMERICANO 2'''' + COLA DUAL 3'''' INOX', 'AXLE BACK SILENCIADOR AMERICANO 2'''' + COLA DUAL 3'''' INOX', 224900, 'completada', '2021-03-02');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 159: OT 1258
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'ALEJANDRO GARCIA' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'ALEJANDRO GARCIA', '11226154-0', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'LHGF37' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'LHGF37', 'CHEVROLET', 'SILVERADO', 2019, 'S/C', 8740) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '1258', 'LHGF37', 'INSTALACION FLOWMASTER ''LO TRAE CLIENTE'' + INSTALACION CUT OUT ''CON TAPA MANUAL'' + DESMONTAJE Y MONTAJE Y PIZADERAS', 'INSTALACION FLOWMASTER ''LO TRAE CLIENTE'' + INSTALACION CUT OUT ''CON TAPA MANUAL'' + DESMONTAJE Y MONTAJE Y PIZADERAS', 210000, 'completada', '2021-03-03');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 160: OT 1259
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'EMILIO FERNANDEZ' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'EMILIO FERNANDEZ', '17089047-7', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'YZ8027' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'YZ8027', 'JEEP', 'CHEROKEE', 2006, 'S/C', 0) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '1259', 'YZ8027', 'CAMBIO FLANCHE MULTIPLES - 2 SILENCIADOR ALTO FLUJO VIBRANT + 2 X-PIPE + LINEA CON SOPORTES NUEVOS TERMINACION COLAS 4'''' SOLO TUBO', 'CAMBIO FLANCHE MULTIPLES - 2 SILENCIADOR ALTO FLUJO VIBRANT + 2 X-PIPE + LINEA CON SOPORTES NUEVOS TERMINACION COLAS 4'''' SOLO TUBO', 874900, 'completada', '2021-03-03');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 161: OT 1260
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'RODRIGO YAÑEZ' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'RODRIGO YAÑEZ', '20471900-4', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'DPWT60' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'DPWT60', 'AUDI', 'A3', 2012, 'S/C', 105) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '1260', 'DPWT60', 'SUPRIMIR SILENCIADOR CENTRAL INOX 2,5''''', 'SUPRIMIR SILENCIADOR CENTRAL INOX 2,5''''', 75000, 'completada', '2021-03-03');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 162: OT 1261
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'MANUEL ERRAZURIS' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'MANUEL ERRAZURIS', '20980898-6', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'HJZZ75' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'HJZZ75', 'OPEL', 'CORSA OPC', 2015, 'S/C', 50) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '1261', 'HJZZ75', 'SUPRIMIR SILENCIADOR CENTRAL INOX', 'SUPRIMIR SILENCIADOR CENTRAL INOX', 75000, 'completada', '2021-03-04');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 163: OT 1262
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'ALESSIO RIZZOLI' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'ALESSIO RIZZOLI', '17625793-8', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'LHRW87' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'LHRW87', 'FORD', 'RANGER', 2019, 'S/C', 61000) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '1262', 'LHRW87', 'DOWNPIPE CALLESS - DPF OFF', 'DOWNPIPE CALLESS - DPF OFF', 319900, 'completada', '2021-03-04');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 164: OT 1263
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'FELIPE BRAVO' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'FELIPE BRAVO', '15482657-2', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'HVWB17' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'HVWB17', 'FORD', 'MUSTANG', 2016, 'S/C', 0) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '1263', 'HVWB17', 'APRETA PERNO HEADERS - ABONO ABRAZADERAS', 'APRETA PERNO HEADERS - ABONO ABRAZADERAS', 50000, 'completada', '2021-03-05');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 165: OT 1264
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'FRANCISCO CRUCHAGA' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'FRANCISCO CRUCHAGA', '12962987-8', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'PBHD83' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'PBHD83', 'CHEVROLET', 'BLAZER', 2021, 'S/C', 0) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '1264', 'PBHD83', 'REINSTALACION SILENCIADOR ORIGINAL', 'REINSTALACION SILENCIADOR ORIGINAL', 70000, 'completada', '2021-03-05');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 166: OT 1265
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'NICOLAS GONZALEZ' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'NICOLAS GONZALEZ', '16150891-8', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'JLDW40' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'JLDW40', 'AUDI', 'S1', 2018, 'S/C', 62) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '1265', 'JLDW40', 'DOWNPIPE INOX - REPRO STAGE 2', 'DOWNPIPE INOX - REPRO STAGE 2', 610000, 'completada', '2021-03-08');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 167: OT 1266
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'CARLOS PARADO' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'CARLOS PARADO', '16955698-9', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'PKTS94' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'PKTS94', 'HYUNDAI', 'TUCSON', 2021, 'S/C', 8) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '1266', 'PKTS94', 'INSTALACION SISTEMA CUT OUT 2''''', 'INSTALACION SISTEMA CUT OUT 2''''', 219900, 'completada', '2021-03-08');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 168: OT 1267
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'MAURICIO PARRA' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'MAURICIO PARRA', '16977544-3', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'GFRR56' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'GFRR56', 'NISSAN', '350 Z', 2003, 'S/C', 101932) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '1267', 'GFRR56', 'INSTALACION CATALITICO LADO COPILOTO SE ADICIONAN PERNOS NUEVOS', 'INSTALACION CATALITICO LADO COPILOTO SE ADICIONAN PERNOS NUEVOS', 74900, 'completada', '2021-03-08');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 169: OT 1268
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'CHRISTOPHER NOVOA' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'CHRISTOPHER NOVOA', '19079643-4', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'PLZX73' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'PLZX73', 'BMW', '220I', 0, 'S/C', 2035) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '1268', 'PLZX73', 'REMOVER SILENCIADOR CENTRAL', 'REMOVER SILENCIADOR CENTRAL', 64900, 'completada', '2021-03-08');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 170: OT 1269
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'JOSE QUINTEROS' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'JOSE QUINTEROS', '16358453-0', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'HPHF81' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'HPHF81', 'VOLKSWAGEN', 'GTI MK7', 2016, 'S/C', 33858) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '1269', 'HPHF81', 'INSTALACION DE COLAS ECS ''LAS TRAE CLIENTE''', 'INSTALACION DE COLAS ECS ''LAS TRAE CLIENTE''', 70000, 'completada', '2021-03-08');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 171: OT 1270
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'SERVICIO AUTOMOTRIZ' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'SERVICIO AUTOMOTRIZ', '77265523-1', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'SIN-PAT' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'SIN-PAT', 'S/M', 'S/M', 0, 'S/C', 0) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '1270', 'SIN-PAT', 'BOSS SHINE', 'BOSS SHINE', 64600, 'completada', '2021-03-08');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 172: OT 1271
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'FRANCISCO PIÑA' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'FRANCISCO PIÑA', '18661577-8', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'PHSX17' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'PHSX17', 'HYUNDAI', 'TUCSON', 2021, 'S/C', 13) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '1271', 'PHSX17', 'INSTALACION SILENCIADOR AM 2,5''''', 'INSTALACION SILENCIADOR AM 2,5''''', 100000, 'completada', '2021-03-09');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 173: OT 1272
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'JOAQUIN PINTO' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'JOAQUIN PINTO', '18585300-4', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'GTVJ81' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'GTVJ81', 'AUDI', 'Q3', 0, 'S/C', 83) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '1272', 'GTVJ81', 'AXLE BACK FREE SALIDA 4 COLAS 3,5''''', 'AXLE BACK FREE SALIDA 4 COLAS 3,5''''', 399900, 'completada', '2026-01-01');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 174: OT 1273
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'CARLOS BARRIENTOS' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'CARLOS BARRIENTOS', '19448589-1', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'LYTS50' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'LYTS50', 'MAZDA', '3 GTX', 2020, 'S/C', 7884) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '1273', 'LYTS50', 'AXLE BACK FREE + 2 COLAS 4'''' BLACK', 'AXLE BACK FREE + 2 COLAS 4'''' BLACK', 579900, 'completada', '2021-03-09');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 175: OT 1274
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'ISRAEL LEMARIE' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'ISRAEL LEMARIE', '23831342-1', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'PGSZ54' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'PGSZ54', 'CHEVROLET', 'CAMARO', 2020, 'S/C', 14) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '1274', 'PGSZ54', 'AXLE BACK MAGNAFLOW - COLAS MAGNAFLOW 4''''', 'AXLE BACK MAGNAFLOW - COLAS MAGNAFLOW 4''''', 799900, 'completada', '2021-03-10');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 176: OT 1275
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'MARIO PEÑA' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'MARIO PEÑA', '16942176-5', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'FXGZ21' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'FXGZ21', 'FORD', 'MUSTANG', 2014, 'S/C', 61667) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '1275', 'FXGZ21', 'LINEA COMPLETA INOX 2,5'''' + SILENCIADORES ALTO FLUJO MAGNAFLOW - REPRO DE ECU STAGE 1', 'LINEA COMPLETA INOX 2,5'''' + SILENCIADORES ALTO FLUJO MAGNAFLOW - REPRO DE ECU STAGE 1', 1400000, 'completada', '2021-03-10');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 177: OT 1276
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'SILVIA VALENZUELA' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'SILVIA VALENZUELA', '18625558-5', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'XB1676' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'XB1676', 'ALFA ROMERO', 'ALFA 147', 2002, 'S/C', 128214) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '1276', 'XB1676', 'ELIMINAR SILENCIADOR CENTRAL + NIVELACION DE SILENCIADOR TRASERO', 'ELIMINAR SILENCIADOR CENTRAL + NIVELACION DE SILENCIADOR TRASERO', 60000, 'completada', '2021-03-10');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 178: OT 1277
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'FELIPE OSSANDON' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'FELIPE OSSANDON', '18115715-1', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'FJFK98' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'FJFK98', 'HYUNDAI', 'GENESIS', 2013, 'S/C', 0) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '1277', 'FJFK98', 'CUT OUT 2,5''''', 'CUT OUT 2,5''''', 229900, 'completada', '2021-03-11');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 179: OT 1278
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'JORGE SUMALAVIA' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'JORGE SUMALAVIA', '', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'BFGS95' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'BFGS95', 'PORSCHE', 'CARRERA', 0, 'S/C', 0) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '1278', 'BFGS95', 'GARANTIA', 'GARANTIA', 0, 'completada', '2021-03-11');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 180: OT 1279
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'RUBEN' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'RUBEN', '', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'KTSH81' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'KTSH81', 'VOLKSWAGEN', 'GOLF', 2018, 'S/C', 0) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '1279', 'KTSH81', 'REPARACION TRAMO CENTRAL LINEA 3''''', 'REPARACION TRAMO CENTRAL LINEA 3''''', 60000, 'completada', '2021-03-11');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 181: OT 1280
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'PABLO JIMENEZ' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'PABLO JIMENEZ', '16431788-9', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'JYJK87' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'JYJK87', 'CHEVROLET', 'SILVERADO', 2018, 'S/C', 38244) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '1280', 'JYJK87', 'INSTALACION DE FLOWMASTER 3'''' - REMOVER PIZADERAS - TRAMO ZONA TRASERA', 'INSTALACION DE FLOWMASTER 3'''' - REMOVER PIZADERAS - TRAMO ZONA TRASERA', 479900, 'completada', '2021-03-12');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 182: OT 1281
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'DANILO' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'DANILO', '16471417-1', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'GZLJ27' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'GZLJ27', 'VOLVO', 'V40', 0, 'S/C', 84) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '1281', 'GZLJ27', 'AXLE BACK FREE - COLA NEGRA 3,5''''', 'AXLE BACK FREE - COLA NEGRA 3,5''''', 299900, 'completada', '2026-01-01');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 183: OT 1282
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'CHRISTIAN VILLEGAS' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'CHRISTIAN VILLEGAS', '17718269-9', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'FCRD80' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'FCRD80', 'BMW', '320I', 2013, 'S/C', 60) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '1282', 'FCRD80', 'AXLE BACK FREE - COLA ESCAPE M', 'AXLE BACK FREE - COLA ESCAPE M', 199900, 'completada', '2021-03-12');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 184: OT 1283
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'CLIENTE GENERICO' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'CLIENTE GENERICO', '', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'DWXH27' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'DWXH27', 'AUDI', 'TT', 2012, 'S/C', 0) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '1283', 'DWXH27', 'COLA ESCAPE DOBLE CROMO 3,5'''' - INSTALACION COLAS', 'COLA ESCAPE DOBLE CROMO 3,5'''' - INSTALACION COLAS', 180000, 'completada', '2021-03-12');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 185: OT 1284
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'BORIS' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'BORIS', '16807863-3', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'CYBW57' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'CYBW57', 'KIA', 'CERATOS', 2011, 'S/C', 162769) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '1284', 'CYBW57', 'MULTIPLE INOX A MEDIDA - LINEA + SILENCIADOR ALTO FLUJO BORLA SALIDA DOBLE-REPRO ECU STAGE 2-SPRINTBOOSTER INSTALADO-INDUCCION DE AIRE+FILTRO', 'MULTIPLE INOX A MEDIDA - LINEA + SILENCIADOR ALTO FLUJO BORLA SALIDA DOBLE-REPRO ECU STAGE 2-SPRINTBOOSTER INSTALADO-INDUCCION DE AIRE+FILTRO', 1774700, 'completada', '2021-03-15');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 186: OT 1285
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'JOSE' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'JOSE', '17674333-6', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'LYGK63' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'LYGK63', 'CHEVROLET', 'SILVERADO', 2020, 'S/C', 29931) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '1285', 'LYGK63', 'INSTALACION CUT OUT 3'''' CON SISTEMA R/C', 'INSTALACION CUT OUT 3'''' CON SISTEMA R/C', 239900, 'completada', '2021-03-15');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 187: OT 1286
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'TOMAS GUTIERREZ' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'TOMAS GUTIERREZ', '20991571-5', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'FSZL88' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'FSZL88', 'BMW', '116I', 2013, 'S/C', 93955) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '1286', 'FSZL88', 'AXLE BACK FREE DUAL CON MODIFICACION DE PARACHOQUE CON 2 COLAS 4'''' CROMO M', 'AXLE BACK FREE DUAL CON MODIFICACION DE PARACHOQUE CON 2 COLAS 4'''' CROMO M', 340000, 'completada', '2021-03-15');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 188: OT 1287
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'TOMAS REYES' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'TOMAS REYES', '20676433-3', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'JTZK32' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'JTZK32', 'BMW', '240I', 2017, 'S/C', 39) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '1287', 'JTZK32', 'SUBIR LINEA DE AXLE BACK', 'SUBIR LINEA DE AXLE BACK', 35000, 'completada', '2021-03-15');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 189: OT 1288
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'MAX SALAS' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'MAX SALAS', '76142564-1', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'SIN-PAT' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'SIN-PAT', 'JEEP', 'RENEGADE', 2018, 'S/C', 33107) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '1288', 'SIN-PAT', 'REPARACION DE ESCAPE A CAUSA DE GOLPE ''CHOQUE''', 'REPARACION DE ESCAPE A CAUSA DE GOLPE ''CHOQUE''', 150000, 'completada', '2021-03-15');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 190: OT 1289
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'IBER ALVAREZ' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'IBER ALVAREZ', '15484197-0', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'FLTH93' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'FLTH93', 'BMW', '135I', 2013, 'S/C', 77077) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '1289', 'FLTH93', 'SUPRIMIR SILENCIADOR CENTRAL X INOX', 'SUPRIMIR SILENCIADOR CENTRAL X INOX', 65000, 'completada', '2021-03-16');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 191: OT 1290
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'GUIDO FLORES' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'GUIDO FLORES', '11643799-6', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'HHDX21' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'HHDX21', 'MINI', 'COUNTRYMAN', 2015, 'S/C', 97412) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '1290', 'HHDX21', 'INSTALACION DE DOWNPIPE ''LO TRAE CLIENTE''', 'INSTALACION DE DOWNPIPE ''LO TRAE CLIENTE''', 60000, 'completada', '2021-03-16');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 192: OT 1291
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'MARIO SALCES' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'MARIO SALCES', '19382068-9', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'FBCV54' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'FBCV54', 'HONDA', 'CIVIC', 2012, 'S/C', 126797) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '1291', 'FBCV54', 'REPRO ECUSTAGE 1 GANANCIAS 12HP 15NM', 'REPRO ECUSTAGE 1 GANANCIAS 12HP 15NM', 302900, 'completada', '2021-03-16');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 193: OT 1292
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'CARLOS SAN MARTIN' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'CARLOS SAN MARTIN', '15929073-5', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'GKXV24' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'GKXV24', 'SUBARU', 'IMPREZA', 2014, 'S/C', 92450) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '1292', 'GKXV24', 'SUPRIMIR SILENCIADOR CENTRAL INOX TRAS REALIZAR PRUEBAS DE SONIDO', 'SUPRIMIR SILENCIADOR CENTRAL INOX TRAS REALIZAR PRUEBAS DE SONIDO', 60000, 'completada', '2021-03-16');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 194: OT 1293
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'CRISTIAN ROJAS' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'CRISTIAN ROJAS', '13899365-5', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'JLTB19' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'JLTB19', 'MAZDA', 'CX-5', 2017, 'S/C', 57) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '1293', 'JLTB19', 'REPARACION DE ESCAPE POR GOLPE SE NIVELA Y SOLDA LINEA', 'REPARACION DE ESCAPE POR GOLPE SE NIVELA Y SOLDA LINEA', 35000, 'completada', '2021-03-16');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 195: OT 1294
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'PATRICIO CARRASCO' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'PATRICIO CARRASCO', '15456438-5', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'PDVF99' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'PDVF99', 'HONDA', 'CIVIC', 2021, 'S/C', 0) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '1294', 'PDVF99', 'FILTRO BMC ALTO FLUJO', 'FILTRO BMC ALTO FLUJO', 74900, 'completada', '2021-03-16');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 196: OT 1295
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'FELIPE VALENZUELA' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'FELIPE VALENZUELA', '15776816-6', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'ZJ1252' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'ZJ1252', 'JEEP', 'CHEROKEE', 2006, 'S/C', 0) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '1295', 'ZJ1252', 'LINEA COMPLETA 3'''' DOBLE - SILENCIADOR BORLA 3'''' ''INSTALACION DE 2'' - X-PIPE - Y 3''''', 'LINEA COMPLETA 3'''' DOBLE - SILENCIADOR BORLA 3'''' ''INSTALACION DE 2'' - X-PIPE - Y 3''''', 639900, 'completada', '2021-03-17');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 197: OT 1296
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'CARLOS SEPULVEDA' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'CARLOS SEPULVEDA', '17834865-5', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'KSPC14' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'KSPC14', 'CHEVROLET', 'SILVERADO', 2018, 'S/C', 41606) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '1296', 'KSPC14', 'INSTALACION SILENCIADOR ALTO FLUJO BORLA 3 - MONTAJE Y DESMONTAJE PISADERAS - TRABAJO COLA DE ESCAPE CON LINEA INOX 3''''', 'INSTALACION SILENCIADOR ALTO FLUJO BORLA 3 - MONTAJE Y DESMONTAJE PISADERAS - TRABAJO COLA DE ESCAPE CON LINEA INOX 3''''', 544000, 'completada', '2021-03-17');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 198: OT 1297
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'CRISTIAN RIVAS' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'CRISTIAN RIVAS', '13271287-5', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'YP1025' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'YP1025', 'SUZUKI', 'GRAND NOMADE', 2005, 'S/C', 170000) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '1297', 'YP1025', 'FISURA ESCAPE ''MULTIPLE'' INSPECCION ''POR CONFIRMAR''', 'FISURA ESCAPE ''MULTIPLE'' INSPECCION ''POR CONFIRMAR''', 349900, 'completada', '2021-03-18');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 199: OT 1298
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'MARIO VILLAREAL' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'MARIO VILLAREAL', '18276074-9', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'CDPC90' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'CDPC90', 'DODGE', 'CHALLENGER', 2010, 'S/C', 333719) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '1298', 'CDPC90', 'INSTALACION SILENCIADOR ALTO FLUJO BORLA 2,5'''' + COLA BLACK 4''''', 'INSTALACION SILENCIADOR ALTO FLUJO BORLA 2,5'''' + COLA BLACK 4''''', 720000, 'completada', '2021-03-18');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 200: OT 1299
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'NOEL VILLALOBOS' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'NOEL VILLALOBOS', '25288235-9', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'KWSB65' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'KWSB65', 'RENAULT', 'CLIO', 2019, 'S/C', 26616) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '1299', 'KWSB65', 'SE REEMPLAZA SILENCIADOR TIPO BALA POR NUEVO MODELO', 'SE REEMPLAZA SILENCIADOR TIPO BALA POR NUEVO MODELO', 80000, 'completada', '2021-03-19');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    RAISE NOTICE 'Procesados 200 registros...';
    -- Fila 201: OT 1300
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'FELIPE FLORES' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'FELIPE FLORES', '16094038-7', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'PKFR62' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'PKFR62', 'DODGE', 'RAM', 2020, 'S/C', 10011) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '1300', 'PKFR62', 'SUPRIMIR SILENCIADOR CENTRAL POR INOX 3''''', 'SUPRIMIR SILENCIADOR CENTRAL POR INOX 3''''', 149900, 'completada', '2021-03-20');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 202: OT 1301
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'ALVARO ORTIZ' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'ALVARO ORTIZ', '', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'KHGB79' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'KHGB79', 'BMW', '120I', 2018, 'S/C', 28885) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '1301', 'KHGB79', 'STAGE 1 DOMICILIO', 'STAGE 1 DOMICILIO', 351000, 'completada', '2021-03-23');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 203: OT 1302
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'PATRICIO VIDAL' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'PATRICIO VIDAL', '15312179-6', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'HWDR26' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'HWDR26', 'PEUGEOT', '308', 2016, 'S/C', 106787) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '1302', 'HWDR26', 'STAGE 1 A DOMICILIO', 'STAGE 1 A DOMICILIO', 315000, 'completada', '2021-03-31');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 204: OT 1303
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'DIEGO ZUÑIGA' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'DIEGO ZUÑIGA', '17406389-3', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'FZXS72' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'FZXS72', 'BMW', '114I', 2014, 'S/C', 92819) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '1303', 'FZXS72', 'STAGE 1 A DOMICILIO BAJA POTENCIA TENIA STAGE 2', 'STAGE 1 A DOMICILIO BAJA POTENCIA TENIA STAGE 2', 390000, 'completada', '2021-04-01');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 205: OT 1304
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'GUILLERMO CORTES' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'GUILLERMO CORTES', '19134352-0', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'GZWT51' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'GZWT51', 'BMW', '114I', 2015, 'S/C', 50630) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '1304', 'GZWT51', 'STAGE 1 A DOMICILIO', 'STAGE 1 A DOMICILIO', 349900, 'completada', '2026-01-01');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 206: OT 1305
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'NICOLAS SANTIESTEBAN' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'NICOLAS SANTIESTEBAN', '20985613-0', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'PRLW79' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'PRLW79', 'BMW', 'X5 M50I', 2021, 'S/C', 4975) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '1305', 'PRLW79', 'AXLE BACK MAGMFLOW, INOX CON EVOLUCION PARA DOBLE SONIDO DE ESCAPE', 'AXLE BACK MAGMFLOW, INOX CON EVOLUCION PARA DOBLE SONIDO DE ESCAPE', 600000, 'completada', '2021-04-21');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 207: OT 1306
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'FERNANDO CELIS SAAVEDRA' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'FERNANDO CELIS SAAVEDRA', '16355471-2', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'DDBD32' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'DDBD32', 'FORD', 'F150', 2012, 'S/C', 134500) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '1306', 'DDBD32', 'LINEA CORTA INOX 3 + SOPORTE NUEVO', 'LINEA CORTA INOX 3 + SOPORTE NUEVO', 299900, 'completada', '2021-04-21');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 208: OT 1307
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'FRANCO CANTO' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'FRANCO CANTO', '13829987-2', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'GZHS47' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'GZHS47', 'MAZDA', 'MX5 NC', 2015, 'S/C', 38178) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '1307', 'GZHS47', 'STAGE 1 GANANCIAS +12HP +15NM', 'STAGE 1 GANANCIAS +12HP +15NM', 270000, 'completada', '2021-04-21');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 209: OT 1308
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'PABLO FERRER' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'PABLO FERRER', '17534059-9', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'FSBY89' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'FSBY89', 'MERCEDES', 'C63', 2013, 'S/C', 75) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '1308', 'FSBY89', 'Carga masiva', 'Carga masiva', 220000, 'completada', '2021-04-22');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 210: OT 1309
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'MAX SALAS' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'MAX SALAS', '18534000-7', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'BRYP65' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'BRYP65', 'LAUD ROVER', 'S/M', 2008, 'S/C', 234090) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '1309', 'BRYP65', 'EGR OFF REPROGRAMACION', 'EGR OFF REPROGRAMACION', 280000, 'completada', '2021-04-22');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 211: OT 1310
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'GUILLERMO ORESTE' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'GUILLERMO ORESTE', '76142564-1', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'JCPH10' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'JCPH10', 'AUDI', 'A3', 2017, 'S/C', 7392) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '1310', 'JCPH10', 'DOWNPIPE INOX + REPROGRAMACION DE ECU STAGE 2', 'DOWNPIPE INOX + REPROGRAMACION DE ECU STAGE 2', 799800, 'completada', '2021-04-23');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 212: OT 1311
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'RENATO TAPIA' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'RENATO TAPIA', '19061373-9', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'FBCG11' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'FBCG11', 'OPEL', 'ASTRA J', 2013, 'S/C', 143926) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '1311', 'FBCG11', 'FUGA DE DOWNPIPE + REMOVER PRE-SILENCIADOR', 'FUGA DE DOWNPIPE + REMOVER PRE-SILENCIADOR', 110000, 'completada', '2021-04-23');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 213: OT 1312
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'PATRICIO MERY' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'PATRICIO MERY', '17310446-4', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'GXFP53' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'GXFP53', 'MERCEDES', 'AZ50', 2015, 'S/C', 67101) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '1312', 'GXFP53', 'GOWNPIPE 3 INOX CON FLEXIBLE + LINEA INOX 3 CON RESONADOR 3 + 2 VOBRANT', 'GOWNPIPE 3 INOX CON FLEXIBLE + LINEA INOX 3 CON RESONADOR 3 + 2 VOBRANT', 2014900, 'completada', '2021-04-26');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 214: OT 1313
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'MATIAS VASQUEZ' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'MATIAS VASQUEZ', '17407708-8', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'KWHG18' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'KWHG18', 'MERCEDES BENZ', 'A250', 2019, 'S/C', 22) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '1313', 'KWHG18', 'INSTALACION CUT OUT+ REMOVER PRE-SILENCIADOR', 'INSTALACION CUT OUT+ REMOVER PRE-SILENCIADOR', 249900, 'completada', '2021-04-27');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 215: OT 1314
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'FELIPE GONZALES' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'FELIPE GONZALES', '17699923-3', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'JLGR73' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'JLGR73', 'LEXUS', 'F5 200 J', 2017, 'S/C', 0) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '1314', 'JLGR73', 'INSTALACION CUT OUT 2 + FABRICACION LINES', 'INSTALACION CUT OUT 2 + FABRICACION LINES', 349900, 'completada', '2021-04-27');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 216: OT 1315
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'MATIAS CERDA' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'MATIAS CERDA', '16763308-8', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'YB7321' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'YB7321', 'CHEVROLET', 'SILVERADO', 2006, 'S/C', 150) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '1315', 'YB7321', 'ESCAPE', 'ESCAPE', 559900, 'completada', '2021-04-27');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 217: OT 1316
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'PATRICO VARGAS' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'PATRICO VARGAS', '19558527.1', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'GDPD10' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'GDPD10', 'BMW', '645I', 2005, 'S/C', 111465) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '1316', 'GDPD10', 'MUFFLE DELETE 2,5 + COLAS DUAL 3,5 + MODIFICACION DE PARACHOQUE', 'MUFFLE DELETE 2,5 + COLAS DUAL 3,5 + MODIFICACION DE PARACHOQUE', 420000, 'completada', '2021-04-28');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 218: OT 1317
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'NICOLAS WILLIAMSON' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'NICOLAS WILLIAMSON', '10956353-6', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'CYDX23' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'CYDX23', 'CHEVROLET', 'CORVETTE', 2011, 'S/C', 3000) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '1317', 'CYDX23', 'AXLE BACK FREE4 COLAS', 'AXLE BACK FREE4 COLAS', 650000, 'completada', '2021-04-29');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 219: OT 1318
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'FRANCISCO PALMA' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'FRANCISCO PALMA', '99826809-7', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'LZDY27' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'LZDY27', 'BMW', '140I', 2019, 'S/C', 14116) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '1318', 'LZDY27', 'MEDIA LINEA + SILENCIADOR ALTO FLUJO MAGNAFLOW CRUZADO + COLAS NUEVAS 4', 'MEDIA LINEA + SILENCIADOR ALTO FLUJO MAGNAFLOW CRUZADO + COLAS NUEVAS 4', 500000, 'completada', '2021-04-30');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 220: OT 1319
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'JUAN OSES' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'JUAN OSES', '20676100-8', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'HZYC24' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'HZYC24', 'PEUGEOT', '308', 2017, 'S/C', 93987) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '1319', 'HZYC24', 'FABRICACION  PIPING INTERCOOLOR 2 PIEZAS + DESARMAR PARACHOQUE', 'FABRICACION  PIPING INTERCOOLOR 2 PIEZAS + DESARMAR PARACHOQUE', 179900, 'completada', '2021-05-03');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 221: OT 1320
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'FELIPE DIAS' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'FELIPE DIAS', '19170872-5', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'JSXJ47' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'JSXJ47', 'MERCEDES', 'SLC 300', 2017, 'S/C', 34684) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '1320', 'JSXJ47', 'REPROGRAMACION STAGE 1', 'REPROGRAMACION STAGE 1', 389900, 'completada', '2021-05-03');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 222: OT 1321
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'HUGO JAVA' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'HUGO JAVA', '19359100-0', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'JWVH53' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'JWVH53', 'PEUGEOT', '308', 2017, 'S/C', 50) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '1321', 'JWVH53', 'LINEA COMPLETA2,5 MAGNAFLOW + Y FINAL + REPROGRAMACION STAGE 1', 'LINEA COMPLETA2,5 MAGNAFLOW + Y FINAL + REPROGRAMACION STAGE 1', 909900, 'completada', '2021-05-04');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 223: OT 1322
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'MATIAS ZAWELS' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'MATIAS ZAWELS', '17071349-4', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'WB3862' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'WB3862', 'PEUGEOT', '206RC', 2001, 'S/C', 148725) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '1322', 'WB3862', 'ESCAPE', 'ESCAPE', 0, 'completada', '2021-05-04');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 224: OT 1323
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'FELIPE SEPULVEDA' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'FELIPE SEPULVEDA', '', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'LLTV32' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'LLTV32', 'VOLKSWAGEN', 'TIGUAN 2.0', 2019, 'S/C', 18546) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '1323', 'LLTV32', 'AXLE BACK FREE4 COLAS + Y MAS 2 COLAS SALIDA DOBLE + VP', 'AXLE BACK FREE4 COLAS + Y MAS 2 COLAS SALIDA DOBLE + VP', 673700, 'completada', '2021-05-05');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 225: OT 1324
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'CLIENTE GENERICO' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'CLIENTE GENERICO', '15333195-2', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'SIN-PAT' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'SIN-PAT', 'S/M', 'S/M', 0, 'S/C', 0) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '1324', 'SIN-PAT', 'Carga masiva', 'Carga masiva', 0, 'completada', '2026-01-01');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 226: OT 1325
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'JUAN PABLO SOTO MESA' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'JUAN PABLO SOTO MESA', '', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'PFFR70' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'PFFR70', 'FORD', 'SILVERADO', 2021, 'S/C', 5) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '1325', 'PFFR70', 'MUFFLER DELETE CENTER INOX 3', 'MUFFLER DELETE CENTER INOX 3', 120000, 'completada', '2021-05-07');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 227: OT 1326
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'ADAM' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'ADAM', '14362993-7', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'SIN-PAT' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'SIN-PAT', 'OPEL', 'CORSA OPC', 0, 'S/C', 0) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '1326', 'SIN-PAT', 'AXLE BACK FREE', 'AXLE BACK FREE', 199900, 'completada', '2021-05-10');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 228: OT 1327
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'MIGUEL CUADRA' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'MIGUEL CUADRA', '18046934-6', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'FJSY77' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'FJSY77', 'MINI', 'MINI COOPERS', 2013, 'S/C', 65735) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '1327', 'FJSY77', 'REMOVER SILENCIADOR CENTRAL + STAGE 1', 'REMOVER SILENCIADOR CENTRAL + STAGE 1', 410000, 'completada', '2021-05-10');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 229: OT 1328
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'IVAN PIZARRO' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'IVAN PIZARRO', '10503462-8', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'PHKR35' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'PHKR35', 'ALFA ROMERO', 'STELVIO', 2020, 'S/C', 7232) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '1328', 'PHKR35', 'REDUCIR RUIDO, SE ANALIZAN OPCIONES DE INSTALACION', 'REDUCIR RUIDO, SE ANALIZAN OPCIONES DE INSTALACION', 0, 'completada', '2021-05-11');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 230: OT 1329
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'FELIPE' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'FELIPE', '8397330-7', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'GFCR93' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'GFCR93', 'MB', 'C63', 2014, 'S/C', 53512) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '1329', 'GFCR93', 'X PIPE INOX', 'X PIPE INOX', 319900, 'completada', '2021-05-12');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 231: OT 1330
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'MARIO DONOSO' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'MARIO DONOSO', '15736860-5', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'LHRL75' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'LHRL75', 'SUZUKI', 'SWIFT', 2019, 'S/C', 24890) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '1330', 'LHRL75', 'DOWNPIPE FABRICACION + MAGNAFLOW CENTRAL 2,5 4''BODY', 'DOWNPIPE FABRICACION + MAGNAFLOW CENTRAL 2,5 4''BODY', 539900, 'completada', '2021-05-12');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 232: OT 1331
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'NICOLAS MONSALVE' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'NICOLAS MONSALVE', '18050920-8', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'JBRL90' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'JBRL90', 'DODGE', 'RAM 1500', 2016, 'S/C', 0) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '1331', 'JBRL90', 'FABRICACION DOWNPIPE INOX 3 + REPROGRAMACION DPF Y GGR OFF', 'FABRICACION DOWNPIPE INOX 3 + REPROGRAMACION DPF Y GGR OFF', 699800, 'completada', '2021-05-13');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 233: OT 1332
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'GABRIEL BUSTOS' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'GABRIEL BUSTOS', '19083988-5', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'BPTB21' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'BPTB21', 'FORD', 'RAPTOR SUT', 2011, 'S/C', 142000) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '1332', 'BPTB21', 'INSTALACION BORLA 1 ENTRADA 2 SALIDAS 2,5', 'INSTALACION BORLA 1 ENTRADA 2 SALIDAS 2,5', 454800, 'completada', '2026-01-01');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 234: OT 1333
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'MARIO DONOSO' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'MARIO DONOSO', '99822311-9', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'LHRL75' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'LHRL75', 'SUZUKI', 'SWIFT', 2019, 'S/C', 250335) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '1333', 'LHRL75', 'REEMPLAZA BORLA PRO XS POR MAGNAFLOW', 'REEMPLAZA BORLA PRO XS POR MAGNAFLOW', 0, 'completada', '2021-05-17');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 235: OT 1334
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'MICHAEL DANS' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'MICHAEL DANS', '18050920-8', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'LDZR35' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'LDZR35', 'KIA', 'MORNING', 2019, 'S/C', 19765) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '1334', 'LDZR35', 'INSTALACION MUFFLER HKS CON REDUCCION Y CODOS EN INOX, MODIF PARACHOQUE', 'INSTALACION MUFFLER HKS CON REDUCCION Y CODOS EN INOX, MODIF PARACHOQUE', 75000, 'completada', '2021-05-17');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 236: OT 1335
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'JOAQUIN MUÑOZ' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'JOAQUIN MUÑOZ', '20140683-8', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'KHGD28' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'KHGD28', 'MINI', 'JCW', 2018, 'S/C', 30) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '1335', 'KHGD28', 'SUPRIMIR SILENCIADOR, COLAS DUAL 4 + INSTALACION DE ANILLO', 'SUPRIMIR SILENCIADOR, COLAS DUAL 4 + INSTALACION DE ANILLO', 255000, 'completada', '2021-05-17');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 237: OT 1336
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'FELIPE CORTES' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'FELIPE CORTES', '17681038-6', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'CKFF25' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'CKFF25', 'TOYOTA', '4 RUNNER', 2010, 'S/C', 0) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '1336', 'CKFF25', 'INSTALACION CUT OUT 2,5', 'INSTALACION CUT OUT 2,5', 229900, 'completada', '2021-05-17');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 238: OT 1337
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'EDGAR MONTERO' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'EDGAR MONTERO', '17176163-8', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'GPTV56' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'GPTV56', 'HYUNDAY', 'SANTA FE', 2014, 'S/C', 140725) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '1337', 'GPTV56', 'INSTALACION COLA DOBLE CROMO + INSTALACION DE BORLA EXHAUST', 'INSTALACION COLA DOBLE CROMO + INSTALACION DE BORLA EXHAUST', 414900, 'completada', '2021-05-18');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 239: OT 1338
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'CAMILO GOMEZ' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'CAMILO GOMEZ', '14721846-K', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'DXHT82' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'DXHT82', 'CITROEN', 'DS3', 2012, 'S/C', 0) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '1338', 'DXHT82', 'INSTALACION COLAS SMG', 'INSTALACION COLAS SMG', 100000, 'completada', '2021-05-18');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 240: OT 1339
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'MIGUEL CUADRA' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'MIGUEL CUADRA', '17811133-7', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'FJSY77' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'FJSY77', 'MINI', 'COOPERS', 2013, 'S/C', 0) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '1339', 'FJSY77', 'REPROGRAMACION STAGE 1', 'REPROGRAMACION STAGE 1', 390000, 'completada', '2021-05-18');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 241: OT 1340
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'ALEJANDRO AGUILAR' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'ALEJANDRO AGUILAR', '99235666-7', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'SIN-PAT' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'SIN-PAT', 'CHEVROLET', 'SILVERADO', 2017, 'S/C', 137) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '1340', 'SIN-PAT', 'INSTALACION CUT OUT 3 + CAMBIO DE COLA DE ESCAPE', 'INSTALACION CUT OUT 3 + CAMBIO DE COLA DE ESCAPE', 339800, 'completada', '2021-05-18');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 242: OT 1341
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'CLIENTE GENERICO' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'CLIENTE GENERICO', '5266351-2', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'KGCH15' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'KGCH15', 'VOLBA', 'GTI MK7,5', 0, 'S/C', 31839) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '1341', 'KGCH15', 'INSTALACION DOWNPIPE', 'INSTALACION DOWNPIPE', 0, 'completada', '2021-05-18');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 243: OT 1342
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'JOAQUIN MUÑOZ' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'JOAQUIN MUÑOZ', '', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'KHGD28' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'KHGD28', 'MINI', 'FOOPER F56', 2018, 'S/C', 30000) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '1342', 'KHGD28', 'GARANTIA SONIDO EN AXLE BACK + INSTALACION RESONADOR INOX AF 3''''', 'GARANTIA SONIDO EN AXLE BACK + INSTALACION RESONADOR INOX AF 3''''', 139900, 'completada', '2021-05-19');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 244: OT 1343
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'NICOLAS MONSALVE' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'NICOLAS MONSALVE', '17681038-6', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'JBRL90' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'JBRL90', 'DODGE', 'RAM 1500', 2016, 'S/C', 0) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '1343', 'JBRL90', 'REPROGRAMACION PARA APAGADO DE TESTIGOS', 'REPROGRAMACION PARA APAGADO DE TESTIGOS', 0, 'completada', '2021-05-19');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 245: OT 1344
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'GINO MARCHAN' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'GINO MARCHAN', '19083988-5', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'CFBL55' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'CFBL55', 'BMW', '550I', 2010, 'S/C', 79) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '1344', 'CFBL55', 'PIPE CENTRAL PARA SACAR DOBLE LINEA DEL CENTRO + DUAL EXNAUST CON BORLA 3''', 'PIPE CENTRAL PARA SACAR DOBLE LINEA DEL CENTRO + DUAL EXNAUST CON BORLA 3''', 0, 'completada', '2021-05-19');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 246: OT 1345
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'GONZALO RETAMALES' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'GONZALO RETAMALES', '13895334-3', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'HWKW27' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'HWKW27', 'MAZDA', 'MAZDA 3', 2016, 'S/C', 42687) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '1345', 'HWKW27', 'INSTALACION MAGNAFLOW CENTRAL ALTO FLUJO + AXLE BACKFREE INOX 2,5 COLAS', 'INSTALACION MAGNAFLOW CENTRAL ALTO FLUJO + AXLE BACKFREE INOX 2,5 COLAS', 519900, 'completada', '2021-05-20');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 247: OT 1346
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'FELIPE HERNANDES' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'FELIPE HERNANDES', '16144424-4', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'BTGS75' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'BTGS75', 'BMW', '130I', 2009, 'S/C', 124) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '1346', 'BTGS75', 'AXLE BACK FREE 4 COLAS DUAL CROMO 3''', 'AXLE BACK FREE 4 COLAS DUAL CROMO 3''', 180000, 'completada', '2021-05-24');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 248: OT 1347
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'JORGE GARI' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'JORGE GARI', '18942309-8', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'PKGJ70' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'PKGJ70', 'DODGE', 'RAM', 2021, 'S/C', 6242) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '1347', 'PKGJ70', 'REINSTALACION DE SILENCIADOR ORIGINAL Y MONTAJE E INSTALACION CUT OUT 3''', 'REINSTALACION DE SILENCIADOR ORIGINAL Y MONTAJE E INSTALACION CUT OUT 3''', 240000, 'completada', '2021-05-24');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 249: OT 1348
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'GABRIEL BUSTOS' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'GABRIEL BUSTOS', '15669280-8', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'GJSJ14' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'GJSJ14', 'BMW', 'M6', 2014, 'S/C', 78566) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '1348', 'GJSJ14', 'LINEA COMPLETA INOX CON 2 BORLA PROXS TRASERO + 2 COLAS DUALES NEGRAS', 'LINEA COMPLETA INOX CON 2 BORLA PROXS TRASERO + 2 COLAS DUALES NEGRAS', 1080000, 'completada', '2021-05-24');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 250: OT 1349
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'PABLO MASCARO' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'PABLO MASCARO', '15010536-6', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'GFJG25' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'GFJG25', 'TOYOTA', 'FJ', 2014, 'S/C', 0) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '1349', 'GFJG25', 'INSTALACION DE BORLA', 'INSTALACION DE BORLA', 279900, 'completada', '2021-05-25');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 251: OT 1350
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'GONZALO HOFER' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'GONZALO HOFER', '16978860-K', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'JRWB70' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'JRWB70', 'FORD', 'F150 LARIAT', 2017, 'S/C', 61793) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '1350', 'JRWB70', 'INSTALACION CUT OUT', 'INSTALACION CUT OUT', 239900, 'completada', '2021-05-20');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 252: OT 1351
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'ESTEBAN CLAVOS' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'ESTEBAN CLAVOS', '12467792-0', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'FGLD23' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'FGLD23', 'AUDI', 'S4', 2013, 'S/C', 66303) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '1351', 'FGLD23', 'DOWNPIPES DELETE CAT SUPRIME SILENCIADOR CENTRAL + 2 CUT OUT', 'DOWNPIPES DELETE CAT SUPRIME SILENCIADOR CENTRAL + 2 CUT OUT', 900000, 'completada', '2021-05-21');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 253: OT 1352
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'GINO MARCHANT' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'GINO MARCHANT', '13980587-6', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'CFBL55' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'CFBL55', 'BMW', '550I', 2010, 'S/C', 79682) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '1352', 'CFBL55', 'INSTALACION 2 RESONADORES CENTRAL 3''', 'INSTALACION 2 RESONADORES CENTRAL 3''', 250000, 'completada', '2021-05-26');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 254: OT 1353
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'PEDRO SEBASTIAN' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'PEDRO SEBASTIAN', '13895334-3', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'SIN-PAT' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'SIN-PAT', '120I', 'BMW', 2017, 'S/C', 15000) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '1353', 'SIN-PAT', 'INSTALACION DE DIFUSOR + SILENCIADOR ALTO FLUJO MAGNAFLOW+ COLAS NUEVAS 4', 'INSTALACION DE DIFUSOR + SILENCIADOR ALTO FLUJO MAGNAFLOW+ COLAS NUEVAS 4', 849900, 'completada', '2021-05-27');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 255: OT 1354
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'LEONARDO CAMPOS' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'LEONARDO CAMPOS', '20942542-4', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'LTVW93' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'LTVW93', 'VOLKSWAGEN', 'GOLF R', 2020, 'S/C', 10900) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '1354', 'LTVW93', 'INSTALACION LINEA REMUS', 'INSTALACION LINEA REMUS', 75000, 'completada', '2021-05-27');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 256: OT 1355
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'CARLOS VARGAS' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'CARLOS VARGAS', '18883075-7', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'LCYC56' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'LCYC56', 'HYUNDAY', 'VELOSTER', 2019, 'S/C', 50000) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '1355', 'LCYC56', 'INSTALACION MAGNAFLOW 1 ENTRADA 2 SALIDAS + COLAS 2 + SOPORTE NUEVO', 'INSTALACION MAGNAFLOW 1 ENTRADA 2 SALIDAS + COLAS 2 + SOPORTE NUEVO', 419900, 'completada', '2021-05-27');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 257: OT 1356
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'ESTEBAN MAGGIORA' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'ESTEBAN MAGGIORA', '17413942-3', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'PBJG37' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'PBJG37', 'MERCEDES', 'A250', 2021, 'S/C', 9274) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '1356', 'PBJG37', 'AXLE BACK FREE + INSTALACION DIFUSOR 4 COLAS '''' LO TRAE CLIENTE''''', 'AXLE BACK FREE + INSTALACION DIFUSOR 4 COLAS '''' LO TRAE CLIENTE''''', 399900, 'completada', '2021-05-28');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 258: OT 1357
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'PATRICIO SERRANO' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'PATRICIO SERRANO', '18932574-6', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'FTRS53' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'FTRS53', 'MINI COOPERS', 'R56', 2013, 'S/C', 109074) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '1357', 'FTRS53', 'LINEA COMPLETA INOX 2.5 + SILENCIADOR RESONADOR CENTRAL + SILEN ALTO FLUJO', 'LINEA COMPLETA INOX 2.5 + SILENCIADOR RESONADOR CENTRAL + SILEN ALTO FLUJO', 729900, 'completada', '2021-05-31');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 259: OT 1358
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'FELIPE MUÑOZ' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'FELIPE MUÑOZ', '15358013-8', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'FWST18' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'FWST18', 'AUDI', 'A3', 2013, 'S/C', 79086) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '1358', 'FWST18', 'MUFFLER DEAR DELETE + COLAS DUAL 3,5', 'MUFFLER DEAR DELETE + COLAS DUAL 3,5', 160000, 'completada', '2021-05-31');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 260: OT 1359
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'ESTEBAN BIANCHETTI' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'ESTEBAN BIANCHETTI', '17485921-3', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'LLLP22' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'LLLP22', 'VOLKSWAGEN', 'GOLF TSI', 2020, 'S/C', 13709) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '1359', 'LLLP22', 'AXLE BACK FREE + SILENCIADOR ALTO FLUJO MAGNAFLOW CENTRAL', 'AXLE BACK FREE + SILENCIADOR ALTO FLUJO MAGNAFLOW CENTRAL', 300000, 'completada', '2021-05-31');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 261: OT 1360
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'SERGIO PAZ' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'SERGIO PAZ', '20664486-9', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'LTTY44' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'LTTY44', 'HYUNDAY', 'I30N', 2020, 'S/C', 9329) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '1360', 'LTTY44', 'DOWNPIPE 3'' CON CATALITICO ALTO FLUJO + LINES 3'' SILENCIADOR ALTO FLUJO CUT', 'DOWNPIPE 3'' CON CATALITICO ALTO FLUJO + LINES 3'' SILENCIADOR ALTO FLUJO CUT', 2099900, 'completada', '2021-06-01');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 262: OT 1361
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'FELIPE RAMIREZ' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'FELIPE RAMIREZ', '14548159-7', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'GWXY57' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'GWXY57', 'OPEL', 'CORSA NUR', 2014, 'S/C', 47) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '1361', 'GWXY57', 'REINSTALACION COMPLETA AXLE BACK + 2 COLAS EN INOX 4''', 'REINSTALACION COMPLETA AXLE BACK + 2 COLAS EN INOX 4''', 300000, 'completada', '2021-06-01');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 263: OT 1362
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'MEMO OZESTE' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'MEMO OZESTE', '18081596-1', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'JCPH10' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'JCPH10', 'AUDI', 'A3', 2017, 'S/C', 17) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '1362', 'JCPH10', 'LINEA INOX 2,5 + SILENCIADOR ALTO FLUJO MAGNAFLOW + COLAS NUEVAS DUAL 3,5', 'LINEA INOX 2,5 + SILENCIADOR ALTO FLUJO MAGNAFLOW + COLAS NUEVAS DUAL 3,5', 725000, 'completada', '2021-06-01');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 264: OT 1363
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'DANIEL ALFONSO' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'DANIEL ALFONSO', '19061373-9', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'LJDP91' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'LJDP91', 'BMW', 'XZ ZOD', 2019, 'S/C', 30422) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '1363', 'LJDP91', 'REPRO STAGE 1', 'REPRO STAGE 1', 389900, 'completada', '2021-06-01');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 265: OT 1364
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'CRISTIAN LARENAS' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'CRISTIAN LARENAS', '13985942-1', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'LXRR57' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'LXRR57', 'SUZUKI', 'SWIFT SPORT', 2020, 'S/C', 15498) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '1364', 'LXRR57', 'DOWNPIPE + LINEA INOX 2,5 + SILENCIADOR ALTO FLUJO BORLA + COLAS NUEVAS 4', 'DOWNPIPE + LINEA INOX 2,5 + SILENCIADOR ALTO FLUJO BORLA + COLAS NUEVAS 4', 1515155, 'completada', '2021-06-02');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 266: OT 1365
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'BORIS IRRIBARRA' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'BORIS IRRIBARRA', '16517112-8', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'CYBW57' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'CYBW57', 'KIA', 'CERATOS', 2011, 'S/C', 0) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '1365', 'CYBW57', 'INSTALACION SILENCIADORES Z'' DEJA BALA Z'''' GARANTIA', 'INSTALACION SILENCIADORES Z'' DEJA BALA Z'''' GARANTIA', 0, 'completada', '2021-06-03');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 267: OT 1366
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'PAOLO ORELLANA' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'PAOLO ORELLANA', '16807863-3', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'FTYG83' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'FTYG83', 'OPEL', 'CORSA NUR', 2013, 'S/C', 81696) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '1366', 'FTYG83', 'FABRICACION E INSTALACION DE DOWNPIPE', 'FABRICACION E INSTALACION DE DOWNPIPE', 289900, 'completada', '2021-06-03');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 268: OT 1367
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'RODRIGO CIFUENTES GAVAS' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'RODRIGO CIFUENTES GAVAS', '16247312-3', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'GHHL83' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'GHHL83', 'BMW', '335I F30', 2014, 'S/C', 30066) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '1367', 'GHHL83', 'INSTALACION CHANGEPPI REPROGRAMACION DE ECU STAGE 1', 'INSTALACION CHANGEPPI REPROGRAMACION DE ECU STAGE 1', 825200, 'completada', '2021-06-04');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 269: OT 1368
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'PATRICIO SERRANO' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'PATRICIO SERRANO', '12867338-5', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'FTRS53' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'FTRS53', 'MINI', 'COOPER 5', 2013, 'S/C', 109239) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '1368', 'FTRS53', 'INSTALACION RELOJ DE PRESION DE TURBO', 'INSTALACION RELOJ DE PRESION DE TURBO', 150000, 'completada', '2021-06-04');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 270: OT 1369
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'JAVIER CASTRO' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'JAVIER CASTRO', '15358013-8', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'POR SACAR' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'POR SACAR', 'FORD', 'F150 PARTINI', 2021, 'S/C', 3773) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '1369', 'POR SACAR', 'INSTALACION BORLA 1 ENTRADA 2 SALIDAS 2,5', 'INSTALACION BORLA 1 ENTRADA 2 SALIDAS 2,5', 299900, 'completada', '2021-06-07');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 271: OT 1370
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'MATIAS IRRIBARRA' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'MATIAS IRRIBARRA', '16621446-7', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'TP5970' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'TP5970', 'PEUGEOT', '106', 0, 'S/C', 0) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '1370', 'TP5970', 'INSTALACION YMODIFICACION DE MULTIPLE + ALTO FLUJO BORLA + COLA NUEVA', 'INSTALACION YMODIFICACION DE MULTIPLE + ALTO FLUJO BORLA + COLA NUEVA', 460000, 'completada', '2021-06-07');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 272: OT 1371
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'MARCELO CERDA' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'MARCELO CERDA', '', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'PJTA51' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'PJTA51', 'CHEVROLET', 'SILVERADO', 2020, 'S/C', 14000) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '1371', 'PJTA51', 'INSTALACION CUT OUT', 'INSTALACION CUT OUT', 239900, 'completada', '2021-06-07');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 273: OT 1372
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'KEVIN GUTIERREZ' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'KEVIN GUTIERREZ', '20245190-K', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'JDLL35' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'JDLL35', 'AUDI', 'A3', 2017, 'S/C', 59526) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '1372', 'JDLL35', 'CAMBIO COLAS XZ', 'CAMBIO COLAS XZ', 255000, 'completada', '2021-06-08');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 274: OT 1373
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'CRISTOBAL LOPEZ' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'CRISTOBAL LOPEZ', '19438131-K', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'JRWC61' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'JRWC61', 'MERCEDES', 'GLA 250', 2017, 'S/C', 30157) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '1373', 'JRWC61', 'FABRICACION E INSTALACION DE DOWNPIPE INOX + REPROGRAMACION DE ECU STAGE', 'FABRICACION E INSTALACION DE DOWNPIPE INOX + REPROGRAMACION DE ECU STAGE', 789900, 'completada', '2021-06-08');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 275: OT 1374
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'JUAN PABLO CARVAJAL' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'JUAN PABLO CARVAJAL', '17819829-7', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'PHJL98' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'PHJL98', 'AUDI', 'A3', 2021, 'S/C', 12740) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '1374', 'PHJL98', 'MEDIA LINEA INOX 2,5'''' + SILENCIADOR ALTO FLUJO CENTRAL + 2 DUAL COLAS', 'MEDIA LINEA INOX 2,5'''' + SILENCIADOR ALTO FLUJO CENTRAL + 2 DUAL COLAS', 575000, 'completada', '2021-06-08');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 276: OT 1375
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'VICTOR POBLETE' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'VICTOR POBLETE', '19306814-6', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'LJFV95' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'LJFV95', 'BMW', '42OI', 2019, 'S/C', 41093) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '1375', 'LJFV95', 'DOWNPIPE+ LINEA + SILENCIADOR ALTO FLUJO BORLA + COLAS + REPRO STZ + 91HP', 'DOWNPIPE+ LINEA + SILENCIADOR ALTO FLUJO BORLA + COLAS + REPRO STZ + 91HP', 1424700, 'completada', '2021-06-09');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 277: OT 1376
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'VICTOR ZAVALA' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'VICTOR ZAVALA', '17006489-5', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'HWVL56' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'HWVL56', 'VOLKSWAGEN', 'GTI MW7', 2016, 'S/C', 54012) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '1376', 'HWVL56', 'LINEA COMPLETA+ SILENCIADOR ALTO FLUJO VIBRANT+ COLAS CROMO + REPRO STAGE', 'LINEA COMPLETA+ SILENCIADOR ALTO FLUJO VIBRANT+ COLAS CROMO + REPRO STAGE', 919900, 'completada', '2021-06-09');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 278: OT 1377
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'DAVID GUERRA' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'DAVID GUERRA', '16930430-0', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'HHYK16' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'HHYK16', 'VOLKSWAGEN', 'GTI MK7', 2015, 'S/C', 0) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '1377', 'HHYK16', 'INLET TURBO + TURBO MUFFLER DELETE', 'INLET TURBO + TURBO MUFFLER DELETE', 349800, 'completada', '2021-06-09');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 279: OT 1378
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'PETER RIVERA' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'PETER RIVERA', '', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'HFWC15' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'HFWC15', 'MINI', 'COOPER F56', 2015, 'S/C', 0) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '1378', 'HFWC15', 'AXLE BACK MAGNAFLOW, MANTIENE COLAS', 'AXLE BACK MAGNAFLOW, MANTIENE COLAS', 400000, 'completada', '2021-06-10');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 280: OT 1379
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'FELIPE SASSO' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'FELIPE SASSO', '15608938-9', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'DGLP56' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'DGLP56', 'AUDI', 'A1', 2011, 'S/C', 0) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '1379', 'DGLP56', 'AXLE BACK FREE + COLAS DUAL INOX', 'AXLE BACK FREE + COLAS DUAL INOX', 169900, 'completada', '2021-06-10');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 281: OT 1380
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'JULIO VALENZUELA' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'JULIO VALENZUELA', '19287703-2', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'FGFR60' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'FGFR60', 'DODGE', 'CHALLENGER', 2013, 'S/C', 59108) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '1380', 'FGFR60', 'REEMPLAZO SILENCIADORES INTERMEDIO POR 2 MAGNAFLOW ALTO FLUJO  AXLE BACK', 'REEMPLAZO SILENCIADORES INTERMEDIO POR 2 MAGNAFLOW ALTO FLUJO  AXLE BACK', 740000, 'completada', '2021-06-10');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 282: OT 1381
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'TOMAS' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'TOMAS', '18054271-K', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'FJZO42' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'FJZO42', 'MB', 'C63', 2013, 'S/C', 78498) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '1381', 'FJZO42', 'PIPE CON SUORIMIR SILENCIADORES + REPRO DE ECU STAGE 1', 'PIPE CON SUORIMIR SILENCIADORES + REPRO DE ECU STAGE 1', 987900, 'completada', '2021-06-11');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 283: OT 1382
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'GIOVANNI SCHIAPPACASSE' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'GIOVANNI SCHIAPPACASSE', '17082574-8', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'LRKH50' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'LRKH50', 'BMW', 'M3', 2019, 'S/C', 30) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '1382', 'LRKH50', 'INSTALACION MIDPIPE', 'INSTALACION MIDPIPE', 75000, 'completada', '2021-06-11');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 284: OT 1383
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'CRISTIAN LARENAS' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'CRISTIAN LARENAS', '16575266-K', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'LXRR57' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'LXRR57', 'SUZUKI', 'SWIPT', 2020, 'S/C', 0) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '1383', 'LXRR57', 'GARANTIA POR SONIDO, GOLPE METALICO. NIVELACION COLAS', 'GARANTIA POR SONIDO, GOLPE METALICO. NIVELACION COLAS', 0, 'completada', '2021-06-11');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 285: OT 1384
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'FELIPE RAMIREZ' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'FELIPE RAMIREZ', '16517112-8', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'GWXY57' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'GWXY57', 'OPEL', 'CORSA NVR', 2014, 'S/C', 48000) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '1384', 'GWXY57', 'NIVELACION DE COLAS ''''GARANTIA''''', 'NIVELACION DE COLAS ''''GARANTIA''''', 0, 'completada', '2021-06-11');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 286: OT 1385
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'JUAN ANDRES TERRISSE' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'JUAN ANDRES TERRISSE', '18081596-1', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'GCHX15' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'GCHX15', 'AUDI', 'A5', 2015, 'S/C', 70603) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '1385', 'GCHX15', 'DOWNPIPE + REPRO STZ + COLAS RSS STYLE BLACK + MEDIA LINEA + SILENCIADOR', 'DOWNPIPE + REPRO STZ + COLAS RSS STYLE BLACK + MEDIA LINEA + SILENCIADOR', 1615000, 'completada', '2021-06-14');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 287: OT 1386
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'JUAN' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'JUAN', '19401318-3', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'BVVP17' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'BVVP17', 'OPEL', 'CORSA', 2015, 'S/C', 75618) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '1386', 'BVVP17', 'STAGE 1', 'STAGE 1', 380000, 'completada', '2021-06-14');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 288: OT 1387
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'RODRIGO ARAVENA' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'RODRIGO ARAVENA', '19631830-5', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'JLGF84' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'JLGF84', 'SUBARU', 'WRX', 2017, 'S/C', 60) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '1387', 'JLGF84', 'INSTALACION DOWNNPIPE Y CONSTRUCCION DE PARTE FALTANTE', 'INSTALACION DOWNNPIPE Y CONSTRUCCION DE PARTE FALTANTE', 149900, 'completada', '2021-06-15');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 289: OT 1388
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'CARLOS RIVEROS' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'CARLOS RIVEROS', '13265626-6', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'LD3204' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'LD3204', 'HONDA', 'INTEGRA', 1993, 'S/C', 0) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '1388', 'LD3204', 'REPARACION BAJADA MULTIPLE, INSTALACION FLEXIBLE, REPARACION ABRAZADERA', 'REPARACION BAJADA MULTIPLE, INSTALACION FLEXIBLE, REPARACION ABRAZADERA', 30000, 'completada', '2021-06-15');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 290: OT 1389
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'FRANCO CANTO' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'FRANCO CANTO', '17611040-6', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'GSHS47' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'GSHS47', 'MAZDA', 'MX5', 2015, 'S/C', 39210) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '1389', 'GSHS47', 'CAMBIO COLAS X 4'''' + 2 REDUCCIONES INOX', 'CAMBIO COLAS X 4'''' + 2 REDUCCIONES INOX', 159900, 'completada', '2021-06-15');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 291: OT 1390
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'IGNACIO CASTILLO' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'IGNACIO CASTILLO', '17534059-9', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'HPFB58' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'HPFB58', 'BMW', '120I', 2016, 'S/C', 38213) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '1390', 'HPFB58', 'SUPRIMIR SILENCIADOR CENTRAL + AXLE BACK MAGNAFLOW + CORTE PARACHOQUE', 'SUPRIMIR SILENCIADOR CENTRAL + AXLE BACK MAGNAFLOW + CORTE PARACHOQUE', 580000, 'completada', '2021-06-16');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 292: OT 1391
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'FRANCISCO PALMA' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'FRANCISCO PALMA', '18905866-7', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'LZDY27' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'LZDY27', 'BMW', '140I', 2019, 'S/C', 16111) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '1391', 'LZDY27', 'LINEA INOX 3'''' HASTA AXLE BACK', 'LINEA INOX 3'''' HASTA AXLE BACK', 200000, 'completada', '2021-06-16');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 293: OT 1392
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'ROBERTO BARRAZA' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'ROBERTO BARRAZA', '20676100-8', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'SIN-PAT' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'SIN-PAT', 'CHEVROLET', 'SILVERADO', 2021, 'S/C', 267) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '1392', 'SIN-PAT', 'INSTALACION SILENCIADOR ALTO FLUJO BORLAA EXHAUST 3''''', 'INSTALACION SILENCIADOR ALTO FLUJO BORLAA EXHAUST 3''''', 299900, 'completada', '2021-06-16');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 294: OT 1393
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'OSCAR GAZABON' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'OSCAR GAZABON', '19646053-5', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'GJGB99' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'GJGB99', 'AUDI', 'A5 40TFSI', 2020, 'S/C', 15264) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '1393', 'GJGB99', 'REPRO DE ECU STAGE 1 + 70HP + 80 NM', 'REPRO DE ECU STAGE 1 + 70HP + 80 NM', 390000, 'completada', '2021-06-16');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 295: OT 1394
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'MIGUEL' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'MIGUEL', '22930222-1', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'GJGB99' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'GJGB99', 'BMW', '114I', 2014, 'S/C', 0) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '1394', 'GJGB99', 'TRABAJO AXLE BACK, UNA COLA DE ESCAPE', 'TRABAJO AXLE BACK, UNA COLA DE ESCAPE', 149900, 'completada', '2021-06-16');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 296: OT 1396
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'MARCELO FREI' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'MARCELO FREI', '', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'HKBW89' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'HKBW89', 'MERCEDES', 'CLA45', 2015, 'S/C', 62) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '1396', 'HKBW89', 'REMOVER AXLE BACK FREE, INSTALACION DE CODOS PROVISORIO  Y FABRICACION', 'REMOVER AXLE BACK FREE, INSTALACION DE CODOS PROVISORIO  Y FABRICACION', 45000, 'completada', '2021-06-17');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 297: OT 1397
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'MIGUEL GALLARDO' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'MIGUEL GALLARDO', '10111045-1', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'FDPC85' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'FDPC85', 'MASERATI', 'GRAN TURIS', 2012, 'S/C', 47625) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '1397', 'FDPC85', 'FABRICACION NUEVOS BRAZOS AXLEBACK EN INOX + 2 COLAS INOX 4''''', 'FABRICACION NUEVOS BRAZOS AXLEBACK EN INOX + 2 COLAS INOX 4''''', 399900, 'completada', '2021-06-18');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 298: OT 1398
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'RAFAEL UBAL' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'RAFAEL UBAL', '17303830-5', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'FGHZ76' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'FGHZ76', 'DODGE', 'CHALLENGER', 2013, 'S/C', 34320) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '1398', 'FGHZ76', 'LINEA COMPLETA + XPIPE + PULIDO DE COLAS Y SOPORTES NUEVOS', 'LINEA COMPLETA + XPIPE + PULIDO DE COLAS Y SOPORTES NUEVOS', 679900, 'completada', '2021-06-22');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 299: OT 1399
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'RODRIGO ARAVENA' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'RODRIGO ARAVENA', '12894323-4', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'JLGF84' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'JLGF84', 'SUBARU', 'WRX', 2017, 'S/C', 60) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '1399', 'JLGF84', 'INSTALACION DOWNPIPE Y CONSTRUCCION PARTE FALTANTE', 'INSTALACION DOWNPIPE Y CONSTRUCCION PARTE FALTANTE', 0, 'completada', '2021-06-22');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 300: OT 1400
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'MIGUEL FLORES' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'MIGUEL FLORES', '13265626-6', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'LKHT32' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'LKHT32', 'SUBARU', 'IMPREZA', 2019, 'S/C', 34724) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '1400', 'LKHT32', 'LINEA COMPLETA INOX 2.5'' CON SILENCIADOR MAGNAFLOW 4'''' + COLAS NEGRA', 'LINEA COMPLETA INOX 2.5'' CON SILENCIADOR MAGNAFLOW 4'''' + COLAS NEGRA', 525000, 'completada', '2021-06-23');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    RAISE NOTICE 'Procesados 300 registros...';
    -- Fila 301: OT 1401
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'LUIS BARRIOS' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'LUIS BARRIOS', '15040666-8', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'CWBL16' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'CWBL16', 'FORD', 'MUSTANG', 2011, 'S/C', 122485) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '1401', 'CWBL16', 'SUPRIMIR SILENCIADORES TRASEROS + 2 COLAS INOX CROMO 4''''', 'SUPRIMIR SILENCIADORES TRASEROS + 2 COLAS INOX CROMO 4''''', 250000, 'completada', '2021-06-23');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 302: OT 1402
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'CRISTOBAL HUERTA' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'CRISTOBAL HUERTA', '1485921-3', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'DSDL37' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'DSDL37', 'BMW', '135I', 2013, 'S/C', 149956) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '1402', 'DSDL37', 'INSTALACION Y VENTA DOWNPIPE VRSF - REPRO DE ECU STAGE 2 - REINSTA SILENCIADOR', 'INSTALACION Y VENTA DOWNPIPE VRSF - REPRO DE ECU STAGE 2 - REINSTA SILENCIADOR', 900000, 'completada', '2021-06-24');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 303: OT 1403
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'ESTEBAN DELLA MAGGIORA' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'ESTEBAN DELLA MAGGIORA', '15363992-2', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'PBJG37' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'PBJG37', 'MERCEDES', 'A250 W177', 2021, 'S/C', 11361) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '1403', 'PBJG37', 'INSTALACION DIFUSOR TRASERO DUAL - CONTINUACION DE AXLE BACK FREE', 'INSTALACION DIFUSOR TRASERO DUAL - CONTINUACION DE AXLE BACK FREE', 220000, 'completada', '2021-06-24');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 304: OT 1404
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'EDUARDO MALUJE' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'EDUARDO MALUJE', '18932574-6', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'EE1766' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'EE1766', 'PEUGEOT', '504', 1984, 'S/C', 230450) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '1404', 'EE1766', 'FABRICACION DE MULTIPLE INOX + INSTALACION RESONADOR ALTO FLUJO', 'FABRICACION DE MULTIPLE INOX + INSTALACION RESONADOR ALTO FLUJO', 360000, 'completada', '2021-06-24');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 305: OT 1405
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'DAVID GUERRA' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'DAVID GUERRA', '8989383-6', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'HHYK16' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'HHYK16', 'VOLKSWAGEN', 'GTI MK7', 2015, 'S/C', 74331) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '1405', 'HHYK16', 'INSTALACION INTAWE MISHIMOTO', 'INSTALACION INTAWE MISHIMOTO', 35000, 'completada', '2021-06-24');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 306: OT 1406
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'FRANCO CANTO' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'FRANCO CANTO', '', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'GZHS47' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'GZHS47', 'MAZDA', 'MX5', 2015, 'S/C', 39304) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '1406', 'GZHS47', 'AXLE BACK - MANTIENE COLAS YA INSTALADAS CON DOBLE RESONADOR CROMO 2,5''''', 'AXLE BACK - MANTIENE COLAS YA INSTALADAS CON DOBLE RESONADOR CROMO 2,5''''', 300000, 'completada', '2021-06-25');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 307: OT 1407
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'THOMAS AFFELD' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'THOMAS AFFELD', '17534009-9', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'KXKS75' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'KXKS75', 'BMW', 'MZ CORO', 2019, 'S/C', 15558) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '1407', 'KXKS75', 'RESONADOR DELETE CENTER', 'RESONADOR DELETE CENTER', 120000, 'completada', '2021-06-25');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 308: OT 1408
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'TIAGO CUMSP' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'TIAGO CUMSP', '17724222-5', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'FJJP33' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'FJJP33', 'AUDI', 'A3', 2012, 'S/C', 63) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '1408', 'FJJP33', 'CAMBIO DE COLA ''CLIENTE TRAE COLA DUAL FLOWMASTER REQUIERE CORTE PRCHOQ', 'CAMBIO DE COLA ''CLIENTE TRAE COLA DUAL FLOWMASTER REQUIERE CORTE PRCHOQ', 80000, 'completada', '2021-06-25');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 309: OT 1409
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'FRANCISCO VALENZUELA' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'FRANCISCO VALENZUELA', '27137329-5', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'LBVC21' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'LBVC21', 'SUZUKI', 'SWIFT SPORT', 2018, 'S/C', 26795) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '1409', 'LBVC21', 'LINEA COMLETA INOX 2,5'''' + SILENCIADOR ALTO FLUJO + COLAS NUEVAS 4'' CROMO', 'LINEA COMLETA INOX 2,5'''' + SILENCIADOR ALTO FLUJO + COLAS NUEVAS 4'' CROMO', 579900, 'completada', '2021-06-29');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 310: OT 1410
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'VICTOR' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'VICTOR', '21871053-0', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'HWVL56' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'HWVL56', 'VW', 'GTI MK7', 2016, 'S/C', 0) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '1410', 'HWVL56', 'INSTALACION SILENCIADOR 3''''', 'INSTALACION SILENCIADOR 3''''', 145000, 'completada', '2021-06-30');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 311: OT 1411
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'MIGUEL FLORES' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'MIGUEL FLORES', '16930430-0', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'LWHT32' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'LWHT32', 'SUBARU', 'IMPREZA', 0, 'S/C', 0) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '1411', 'LWHT32', 'INSTALACION SILENCIADOR 2,5''''', 'INSTALACION SILENCIADOR 2,5''''', 87100, 'completada', '2021-06-30');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 312: OT 1412
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'JUAN VEGA' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'JUAN VEGA', '', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'FLSL15' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'FLSL15', 'PEUGEOT', 'RCZ', 2013, 'S/C', 84249) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '1412', 'FLSL15', 'LINEA COMPLETA INOX 2,5'' CON FLEXIBRE + RESONADOR CENTRAL + SILEN ALTO FLUJ', 'LINEA COMPLETA INOX 2,5'' CON FLEXIBRE + RESONADOR CENTRAL + SILEN ALTO FLUJ', 720000, 'completada', '2021-06-30');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 313: OT 1413
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'JUAN BERGUES' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'JUAN BERGUES', '15866328-7', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'LRPT15' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'LRPT15', 'MB', 'CLA 180', 2020, 'S/C', 41928) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '1413', 'LRPT15', 'DOWNPIPE + REPRO DE ECU STAGE 2 + 190HP + 330NM', 'DOWNPIPE + REPRO DE ECU STAGE 2 + 190HP + 330NM', 1259900, 'completada', '2021-07-01');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 314: OT 1414
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'SEBASTIAN HERNANDEZ' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'SEBASTIAN HERNANDEZ', '18197284-K', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'LVCT75' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'LVCT75', 'VOLKSWAGEN', 'JETTA', 2020, 'S/C', 8500) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '1414', 'LVCT75', 'AXLE BACK CON SILENCIADOR BORLA  ''TRAE CLIENTE'' COLA CROMO 3'''' CENTRADA', 'AXLE BACK CON SILENCIADOR BORLA  ''TRAE CLIENTE'' COLA CROMO 3'''' CENTRADA', 350000, 'completada', '2021-07-05');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 315: OT 1415
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'DIEGO ARENAS' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'DIEGO ARENAS', '20099474-4', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'FWZD48' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'FWZD48', 'OPEL', 'CORSA OPC', 0, 'S/C', 78919) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '1415', 'FWZD48', 'LINEA COMPLETA 2,5'''' FREE', 'LINEA COMPLETA 2,5'''' FREE', 350000, 'completada', '2021-07-05');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 316: OT 1416
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'DANIEL GOMEZ' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'DANIEL GOMEZ', '19741586-K', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'GKRY76' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'GKRY76', 'MERCEDES', 'A200', 2014, 'S/C', 61433) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '1416', 'GKRY76', 'INSTALACION INDUCCION KCN', 'INSTALACION INDUCCION KCN', 429900, 'completada', '2021-07-05');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 317: OT 1417
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'JONATHAN VALDERRAMA' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'JONATHAN VALDERRAMA', '16796126-6', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'LXCT41' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'LXCT41', 'SUBARU', 'IMPRESA', 2020, 'S/C', 5841) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '1417', 'LXCT41', 'AXLE BACK DUAL CON ''Y'' CON MODIFICACION DE PARACHOQUE + 2 COLA CROMO 4''''', 'AXLE BACK DUAL CON ''Y'' CON MODIFICACION DE PARACHOQUE + 2 COLA CROMO 4''''', 570000, 'completada', '2021-07-06');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 318: OT 1418
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'PABLO' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'PABLO', '16639939-4', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'VZL451' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'VZL451', 'CITROEN', 'XSAARA', 0, 'S/C', 0) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '1418', 'VZL451', 'INSTALACION , SILENCIADOR 3'''' (BALA LARGA) REDUCCION', 'INSTALACION , SILENCIADOR 3'''' (BALA LARGA) REDUCCION', 150000, 'completada', '2021-07-06');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 319: OT 1419
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'KEVIN GUTIERREZ' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'KEVIN GUTIERREZ', '', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'JDLL35' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'JDLL35', 'AUDI', 'A3', 2016, 'S/C', 61642) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '1419', 'JDLL35', 'INSTALACION MAGNAFLOW 2,5'' CENTRAL', 'INSTALACION MAGNAFLOW 2,5'' CENTRAL', 239900, 'completada', '2021-07-06');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 320: OT 1420
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'MAX SOLUCIONES AUTOMOTRICE' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'MAX SOLUCIONES AUTOMOTRICE', '19438131-K', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'HDSH29' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'HDSH29', 'VOLKSWAGEN', 'GOLF GTI MK', 0, 'S/C', 78734) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '1420', 'HDSH29', 'INSTALACION DOWNPIPE ''LO TRAE CLIENTE'' MAS CHEQUEO GENERAL', 'INSTALACION DOWNPIPE ''LO TRAE CLIENTE'' MAS CHEQUEO GENERAL', 0, 'completada', '2021-07-06');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 321: OT 1421
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'HECTOR JORQUERA' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'HECTOR JORQUERA', '', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'PHHP59' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'PHHP59', 'CHEVROLET', 'SILVERADO', 2020, 'S/C', 18670) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '1421', 'PHHP59', 'AXLE BACK FREE DUAL TIP INOX CON COLAS CORSA CROMO 4'' + SOPORTES NUEVOS', 'AXLE BACK FREE DUAL TIP INOX CON COLAS CORSA CROMO 4'' + SOPORTES NUEVOS', 500000, 'completada', '2021-07-07');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 322: OT 1422
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'RENE URBINA' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'RENE URBINA', '13339602-0', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'LTWX31' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'LTWX31', 'FORD', 'F150', 2020, 'S/C', 42358) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '1422', 'LTWX31', 'LINEA COMPLETA INOX 3'' + SILENCIADOR ALTO FLUJO BORL + COLA INOX 4''''', 'LINEA COMPLETA INOX 3'' + SILENCIADOR ALTO FLUJO BORL + COLA INOX 4''''', 679900, 'completada', '2021-07-08');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 323: OT 1423
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'RENE URBINA' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'RENE URBINA', '15077789-5', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'PZKK77' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'PZKK77', 'JEEP', 'RUBICON GL', 2021, 'S/C', 1322) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '1423', 'PZKK77', 'LINEA ESCAPE INOX COMPLETA 3''''  + SILENCIADOR ALTO FLUJO BORLE 3''', 'LINEA ESCAPE INOX COMPLETA 3''''  + SILENCIADOR ALTO FLUJO BORLE 3''', 629900, 'completada', '2021-07-08');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 324: OT 1424
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'FABIAN PINO' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'FABIAN PINO', '15077789-5', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'BSWD18' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'BSWD18', 'ALFA ROMERO', '147', 2008, 'S/C', 89052) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '1424', 'BSWD18', 'LINEA COMPLETA INOX 2'' CON SILENCIADOR ALTO FLUJO + COLA INOX 4'' CORTE 45', 'LINEA COMPLETA INOX 2'' CON SILENCIADOR ALTO FLUJO + COLA INOX 4'' CORTE 45', 520000, 'completada', '2021-07-09');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 325: OT 1425
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'ALEXIS DONOSO' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'ALEXIS DONOSO', '19564550-7', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'HPJZ75' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'HPJZ75', 'PEUGEOT', '208 HDI', 2016, 'S/C', 128081) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '1425', 'HPJZ75', 'FABRICACION EINSTALACION DE DOWNPIPE + INSTALACION DE CAT AF ''LO TRAE CLIT''', 'FABRICACION EINSTALACION DE DOWNPIPE + INSTALACION DE CAT AF ''LO TRAE CLIT''', 699900, 'completada', '2021-07-09');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 326: OT 1426
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'FIDELMARQUES' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'FIDELMARQUES', '15399043-3', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'FZWT81' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'FZWT81', 'VOLVO', '560', 2014, 'S/C', 90986) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '1426', 'FZWT81', 'LINEA COMPLETA INOX 2,5'' + SILENCIADOR ALTO FLUJO MAGNAFLOW CRUZADO', 'LINEA COMPLETA INOX 2,5'' + SILENCIADOR ALTO FLUJO MAGNAFLOW CRUZADO', 730000, 'completada', '2021-07-12');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 327: OT 1427
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'FRANCISCO SALAS VIAL' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'FRANCISCO SALAS VIAL', '21892930-3', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'GGWV39' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'GGWV39', 'DODGE', 'RAM 1500', 2014, 'S/C', 128917) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '1427', 'GGWV39', 'SUPRIMIR SILENCIADOR CENTRAL  POR Y'' INOX DESMONTAJE DE PISADORES, MONTAJE', 'SUPRIMIR SILENCIADOR CENTRAL  POR Y'' INOX DESMONTAJE DE PISADORES, MONTAJE', 175000, 'completada', '2021-07-12');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 328: OT 1428
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'HECTOR BECERRA' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'HECTOR BECERRA', '20108207-2', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'FLTK63' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'FLTK63', 'BMW', '135I', 2013, 'S/C', 36401) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '1428', 'FLTK63', 'DESMONTAJE DE BRAZO DE ESCAPE PARA CIERRE DE VALVULA QTP 3''''', 'DESMONTAJE DE BRAZO DE ESCAPE PARA CIERRE DE VALVULA QTP 3''''', 24900, 'completada', '2021-07-12');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 329: OT 1429
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'CRISTIAN ROJAS' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'CRISTIAN ROJAS', '17427773-7', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'LXSC34' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'LXSC34', 'MAZDA', '6', 2020, 'S/C', 24000) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '1429', 'LXSC34', 'INSTALACION ALTO FLUJO VIBRANT  EXHAUST 2,5'' EN ZONA CENTRAL', 'INSTALACION ALTO FLUJO VIBRANT  EXHAUST 2,5'' EN ZONA CENTRAL', 240000, 'completada', '2021-07-12');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 330: OT 1430
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'MAX DIAZ' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'MAX DIAZ', '13899365-5', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'JGDR28' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'JGDR28', 'OPEL', 'OPC E', 2017, 'S/C', 41910) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '1430', 'JGDR28', 'AXLE BACK FREE, ELIMINA SILENCIADOR ORIGINAL TRASERO MANTIENE COLAS OEM', 'AXLE BACK FREE, ELIMINA SILENCIADOR ORIGINAL TRASERO MANTIENE COLAS OEM', 200000, 'completada', '2021-07-13');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 331: OT 1431
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'OSCAR PADILLA' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'OSCAR PADILLA', '18638603-5', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'LWXH88' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'LWXH88', 'MAZDA', '3', 2020, 'S/C', 25822) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '1431', 'LWXH88', 'AXLE BACK CON Z AF VIBRANT + 2 COLAS BLACK CON FLANCHE', 'AXLE BACK CON Z AF VIBRANT + 2 COLAS BLACK CON FLANCHE', 620000, 'completada', '2021-07-13');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 332: OT 1432
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'JUAN CARQUIN' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'JUAN CARQUIN', '16471873-5', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'PPVH11' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'PPVH11', 'BMW', '420', 2021, 'S/C', 17955) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '1432', 'PPVH11', 'DOWNPIPE INOX + LINEA CON RESONADOR + SILENCIADOR ALTO FLUJO + REPRO ECU', 'DOWNPIPE INOX + LINEA CON RESONADOR + SILENCIADOR ALTO FLUJO + REPRO ECU', 1550000, 'completada', '2021-07-14');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 333: OT 1433
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'DIAZ Y DIAZ LTDA' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'DIAZ Y DIAZ LTDA', '16384338-2', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'SIN-PAT' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'SIN-PAT', 'S/M', 'S/M', 0, 'S/C', 0) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '1433', 'SIN-PAT', '2 COLAS DUAL 3'''' CROMO ''VENTA EN MANO''', '2 COLAS DUAL 3'''' CROMO ''VENTA EN MANO''', 140000, 'completada', '2021-07-14');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 334: OT 1434
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'ARIES OLEA' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'ARIES OLEA', '77061210-1', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'GTZF49' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'GTZF49', 'VOLKSWAGEN', 'SCIROCCO', 2014, 'S/C', 63218) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '1434', 'GTZF49', 'AXLE BACK FREE EXHAUST CON ''Y'' DUAL COLA SMG 3'''' BORDE REDONDO', 'AXLE BACK FREE EXHAUST CON ''Y'' DUAL COLA SMG 3'''' BORDE REDONDO', 185000, 'completada', '2021-07-14');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 335: OT 1435
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'GIOVANNY BORRONI' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'GIOVANNY BORRONI', '18442900-4', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'PSTL13' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'PSTL13', 'MAZDA', '3', 2021, 'S/C', 20049) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '1435', 'PSTL13', 'AXLE BACK VIBRANT DUAL + COLAS CROMO 4''''', 'AXLE BACK VIBRANT DUAL + COLAS CROMO 4''''', 629900, 'completada', '2021-07-15');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 336: OT 1436
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'SEBASTIAN GONZALEZ' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'SEBASTIAN GONZALEZ', '17665941-6', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'JWVG63' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'JWVG63', 'TOYOTA', 'COROLLA', 2017, 'S/C', 58984) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '1436', 'JWVG63', 'FABRICACION DE HEADERS A MEDIDA INOX SUPRIMIENDO 3 CATALITICOS  REPRO  ECU', 'FABRICACION DE HEADERS A MEDIDA INOX SUPRIMIENDO 3 CATALITICOS  REPRO  ECU', 900000, 'completada', '2021-07-15');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 337: OT 1437
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'DANIEL GOMEZ' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'DANIEL GOMEZ', '16132426-4', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'GKRY76' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'GKRY76', 'MERCEDES  BENZ', 'A200', 2014, 'S/C', 61946) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '1437', 'GKRY76', 'CAMBIO COLAS X  4 DE  3,5''''', 'CAMBIO COLAS X  4 DE  3,5''''', 250000, 'completada', '2021-07-15');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 338: OT 1438
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'BERNARDO BARRATTINI' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'BERNARDO BARRATTINI', '16796126-6', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'SIN-PAT' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'SIN-PAT', 'S/M', 'S/M', 0, 'S/C', 0) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '1438', 'SIN-PAT', 'FABRICACION DE PIEZA EN INOX CON SILICONAS', 'FABRICACION DE PIEZA EN INOX CON SILICONAS', 120000, 'completada', '2021-07-15');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 339: OT 1439
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'MATIAS  IRIBARRA' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'MATIAS  IRIBARRA', '13431556-3', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'VJ6690' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'VJ6690', 'PEUGEOT', '206', 2001, 'S/C', 159331) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '1439', 'VJ6690', 'SOLDAR PLACA INOX CHASIS- SOPORTE CHASIS PARA SILENCIADOR ORIGINAL', 'SOLDAR PLACA INOX CHASIS- SOPORTE CHASIS PARA SILENCIADOR ORIGINAL', 85000, 'completada', '2021-07-19');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 340: OT 1440
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'DUAAMEL TORRES' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'DUAAMEL TORRES', '16210947-2', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'HKVK17' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'HKVK17', 'MAZDA', 'CX5', 2016, 'S/C', 61000) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '1440', 'HKVK17', 'AXLE BACK FREE + COLAS 4''''CROMO', 'AXLE BACK FREE + COLAS 4''''CROMO', 299900, 'completada', '2021-07-19');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 341: OT 1441
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'NATALIEL GUAMAN' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'NATALIEL GUAMAN', '16791563-9', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'FSDP39' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'FSDP39', 'VOLVO', '560 T6', 2013, 'S/C', 122990) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '1441', 'FSDP39', 'INSTALACION DIVERTER BLAWOFF GFB-FABRICACION DOWNPIPE-REPRO ECU STAGE 2', 'INSTALACION DIVERTER BLAWOFF GFB-FABRICACION DOWNPIPE-REPRO ECU STAGE 2', 1399800, 'completada', '2021-07-19');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 342: OT 1442
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'FRANCISCO CORO GARCIA' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'FRANCISCO CORO GARCIA', '19258009-9', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'XW3586' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'XW3586', 'DODGE', 'DURANGO', 2007, 'S/C', 126546) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '1442', 'XW3586', 'INSTALACION MAGNAFLOW CENTRAL', 'INSTALACION MAGNAFLOW CENTRAL', 240000, 'completada', '2021-07-20');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 343: OT 1443
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'ALEJANDRO GARCIA' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'ALEJANDRO GARCIA', '13903944-0', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'SIN-PAT' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'SIN-PAT', 'S/M', 'S/M', 0, 'S/C', 0) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '1443', 'SIN-PAT', 'CLIENTE TRAE PLANTILLA PARA FABRICAR FLANCHE + CODOS PARA CUT OUT INSTALADO', 'CLIENTE TRAE PLANTILLA PARA FABRICAR FLANCHE + CODOS PARA CUT OUT INSTALADO', 30000, 'completada', '2021-07-20');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 344: OT 1444
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'JOSE MANUEL ZALDIVAR' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'JOSE MANUEL ZALDIVAR', '11226154-0', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'HDJT73' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'HDJT73', 'VOLKSWAGEN', 'SCIROCCO', 0, 'S/C', 67457) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '1444', 'HDJT73', 'INSTALACION DIFUSOR ''LO TRAE CLIENTE'' MODIFICACION COMPLETA AXLE BACK', 'INSTALACION DIFUSOR ''LO TRAE CLIENTE'' MODIFICACION COMPLETA AXLE BACK', 0, 'completada', '2021-07-21');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 345: OT 1445
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'JUAN PABLO SOTO' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'JUAN PABLO SOTO', '17699199-2', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'KZSW17' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'KZSW17', 'HYUNDAY', 'VELOSTER', 2019, 'S/C', 44925) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '1445', 'KZSW17', 'MONTAJE AXLE BACK MAGNAFLOW ''LO TRAE CLIENTE''', 'MONTAJE AXLE BACK MAGNAFLOW ''LO TRAE CLIENTE''', 40000, 'completada', '2021-07-21');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 346: OT 1446
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'BRAHIM NUSAHE' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'BRAHIM NUSAHE', '17601846-1', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'LYYF80' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'LYYF80', 'DODGE', 'RAM 1500', 2020, 'S/C', 37849) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '1446', 'LYYF80', 'FABRICACION LINEA INOX CONSERVANDO SILENCIADOR ORIGINAL', 'FABRICACION LINEA INOX CONSERVANDO SILENCIADOR ORIGINAL', 550000, 'completada', '2021-07-22');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 347: OT 1447
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'JUAN ANDRE TERRISSE' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'JUAN ANDRE TERRISSE', '19406433-0', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'GCHX15' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'GCHX15', 'AUDI', 'A5', 0, 'S/C', 72546) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '1447', 'GCHX15', 'CHAQUEO CHECK Y REPRO - MONTAJE SILENCIADOR OIGINAL CENTRAL', 'CHAQUEO CHECK Y REPRO - MONTAJE SILENCIADOR OIGINAL CENTRAL', 0, 'completada', '2021-07-22');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 348: OT 1448
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'JONATHAN' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'JONATHAN', '19401318-3', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'FZZF32' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'FZZF32', 'BMW', '135I', 2014, 'S/C', 55378) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '1448', 'FZZF32', 'INSTALACION COLA CROMO M4'''' REMOVER CENTRAL', 'INSTALACION COLA CROMO M4'''' REMOVER CENTRAL', 220000, 'completada', '2021-07-23');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 349: OT 1449
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'ERNESTO CAGNOLI' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'ERNESTO CAGNOLI', '19483605-8', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'DYVS38' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'DYVS38', 'BMW', '316I', 2012, 'S/C', 96489) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '1449', 'DYVS38', 'STAGE 1 REPROGRAMACION - SE ENVIA INFORME PRE-REPROGRAMACION', 'STAGE 1 REPROGRAMACION - SE ENVIA INFORME PRE-REPROGRAMACION', 280000, 'completada', '2021-07-23');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 350: OT 1450
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'PABLO SANTOS' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'PABLO SANTOS', '25832073-5', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'JKKW21' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'JKKW21', 'SKODA', 'OCTAVIA', 2017, 'S/C', 46831) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '1450', 'JKKW21', 'REEMPLAZO SILENCIADOR ORIGINAL POR ALTO FLUJO MAGNAFLOW-CUTOUT 2'' ISTALD', 'REEMPLAZO SILENCIADOR ORIGINAL POR ALTO FLUJO MAGNAFLOW-CUTOUT 2'' ISTALD', 436810, 'completada', '2021-07-23');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 351: OT 1451
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'GINO' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'GINO', '24096926-2', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'CFBL55' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'CFBL55', 'BMW', '550I', 2010, 'S/C', 81375) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '1451', 'CFBL55', 'INSTALACION COLAS', 'INSTALACION COLAS', 100000, 'completada', '2021-07-23');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 352: OT 1452
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'BASTIAN SOLIS' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'BASTIAN SOLIS', '13985334-3', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'GHXY27' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'GHXY27', 'MERCEDES', 'A200', 2014, 'S/C', 0) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '1452', 'GHXY27', 'DOWNPIPE INOX - REPRO STAGE 2 + POPS AND BANG', 'DOWNPIPE INOX - REPRO STAGE 2 + POPS AND BANG', 949900, 'completada', '2021-07-26');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 353: OT 1453
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'JAVIER' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'JAVIER', '19229694-3', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'KYCF62' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'KYCF62', 'FORD', 'F150 PARTINI', 0, 'S/C', 28800) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '1453', 'KYCF62', 'REPRO STAGE 1 +50HP+70NM - LINEA COMPLETA INOX 2,5''+ COLA CROMO+FLOWMSTE', 'REPRO STAGE 1 +50HP+70NM - LINEA COMPLETA INOX 2,5''+ COLA CROMO+FLOWMSTE', 1295000, 'completada', '2021-07-26');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 354: OT 1454
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'FERNANDO CEZOR' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'FERNANDO CEZOR', '19828135-2', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'CFDW55' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'CFDW55', 'FORD', 'F150', 2010, 'S/C', 190180) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '1454', 'CFDW55', 'INSTALACION COLA ESCAPE SOLDADO ''CLIENTE TRAE COLA''', 'INSTALACION COLA ESCAPE SOLDADO ''CLIENTE TRAE COLA''', 40000, 'completada', '2021-07-27');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 355: OT 1455
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'BASTIAN SOLIS' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'BASTIAN SOLIS', '11631211-5', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'GHXY27' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'GHXY27', 'MERCEDES', 'A200', 2014, 'S/C', 0) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '1455', 'GHXY27', 'INSTALACION ALTO FLUJO TIPO BALA CENTRAL - SELLADO ESCAPE  '''' NULO''''', 'INSTALACION ALTO FLUJO TIPO BALA CENTRAL - SELLADO ESCAPE  '''' NULO''''', 120000, 'completada', '2021-07-28');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 356: OT 1456
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'CLAUDIO MEULME' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'CLAUDIO MEULME', '19229694-3', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'JCPY48' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'JCPY48', 'OPEL', 'CORSA OPC', 2017, 'S/C', 44) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '1456', 'JCPY48', 'AXLE BACK FREE - COLAS CROMO    GREDDY', 'AXLE BACK FREE - COLAS CROMO    GREDDY', 299900, 'completada', '2021-07-28');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 357: OT 1457
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'BASTIAN SOLIS' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'BASTIAN SOLIS', '17951333-1', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'GHXY27' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'GHXY27', 'MERCEDES', 'A200', 2014, 'S/C', 0) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '1457', 'GHXY27', 'INSTALACION ALTO FLUJO TIPO BALA CENTRAL', 'INSTALACION ALTO FLUJO TIPO BALA CENTRAL', 100000, 'completada', '2021-07-28');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 358: OT 1458
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'NICOLAS BASTIAN' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'NICOLAS BASTIAN', '19229694-3', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'GTZR92' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'GTZR92', 'KIA', 'RIO 5', 2015, 'S/C', 61991) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '1458', 'GTZR92', 'AXLE BACK  FREE 2'''' DUAL MANTIENE COLAS DE ESCAPE - REMOVER SILENCIADOR', 'AXLE BACK  FREE 2'''' DUAL MANTIENE COLAS DE ESCAPE - REMOVER SILENCIADOR', 299900, 'completada', '2021-07-28');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 359: OT 1459
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'ALEJANDRO GARCIA JIMENEZ' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'ALEJANDRO GARCIA JIMENEZ', '18701498-0', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'CLKK13' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'CLKK13', 'CHEVROLET', 'CAMARO 55', 2010, 'S/C', 16715) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '1459', 'CLKK13', 'AXLE BACK INOX 2,5 - ALTO FUJO TIPO BALA BLACK+DUAL TIP EXHAUST BLACK 4''''', 'AXLE BACK INOX 2,5 - ALTO FUJO TIPO BALA BLACK+DUAL TIP EXHAUST BLACK 4''''', 460000, 'completada', '2021-07-29');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 360: OT 1460
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'VICTOR ZABALA' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'VICTOR ZABALA', '11226154-0', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'HWVL56' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'HWVL56', 'VOLKSWAGEN', 'GOLF GTIMK7', 2016, 'S/C', 56735) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '1460', 'HWVL56', 'FABRICACION E INSTALACION ANTIDEINE', 'FABRICACION E INSTALACION ANTIDEINE', 50000, 'completada', '2021-07-29');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 361: OT 1461
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'JUAN PABLO SOTO' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'JUAN PABLO SOTO', '16930430-0', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'KZSW17' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'KZSW17', 'HYUNDAY', 'VELOSTER', 2019, 'S/C', 0) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '1461', 'KZSW17', 'REINSTALAR SILENCIADOR ORIGINAL', 'REINSTALAR SILENCIADOR ORIGINAL', 0, 'completada', '2026-01-01');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 362: OT 1462
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'IÑAKIAZCONA' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'IÑAKIAZCONA', '17601846-1', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'HDSH29' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'HDSH29', 'VOLKSWAGEN', 'GTI MK7', 0, 'S/C', 80134) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '1462', 'HDSH29', 'MODIFICACION COLA DE ESCAPE-SE SACAN COLAS MAS AFUERA Y SE SEPARA DIFUSOR', 'MODIFICACION COLA DE ESCAPE-SE SACAN COLAS MAS AFUERA Y SE SEPARA DIFUSOR', 70000, 'completada', '2021-07-29');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 363: OT 1463
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'PABLO SANTOS' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'PABLO SANTOS', '19438741-5', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'JKKW21' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'JKKW21', 'SKODA', 'OCTAVIA VRS', 2017, 'S/C', 46869) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '1463', 'JKKW21', 'INSTALACION COLAS DOBLE-CORTE PARACHOQUE', 'INSTALACION COLAS DOBLE-CORTE PARACHOQUE', 100000, 'completada', '2021-07-29');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 364: OT 1464
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'NICOLAS HUANG' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'NICOLAS HUANG', '24096926-2', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'HGB79' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'HGB79', 'BMW', 'M3', 2015, 'S/C', 33058) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '1464', 'HGB79', 'LINEA COMPLETA INOX 2,5'' +SILENCIADOR ALTO FLUJO MAGNAFLOW,COLA BLACK M', 'LINEA COMPLETA INOX 2,5'' +SILENCIADOR ALTO FLUJO MAGNAFLOW,COLA BLACK M', 1049000, 'completada', '2021-07-30');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 365: OT 1465
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'ENRIQUE ROMERO' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'ENRIQUE ROMERO', '19792679-1', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'RN5530' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'RN5530', 'HONDA', 'CIVIC', 1998, 'S/C', 220000) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '1465', 'RN5530', 'FABRICACION DE LINEA CON FLEXIBLE+SOPORTE NUEVO  CENTRAL+CORTE PARACHOQ', 'FABRICACION DE LINEA CON FLEXIBLE+SOPORTE NUEVO  CENTRAL+CORTE PARACHOQ', 195000, 'completada', '2021-07-30');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 366: OT 1466
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'CRISTIAN PAVEZ' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'CRISTIAN PAVEZ', '14716605-2', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'GP6318' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'GP6318', 'VOLKSWAGEN', 'GOLF GTI', 2005, 'S/C', 0) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '1466', 'GP6318', 'AXLE BACK INOX 2,5'' + SILENCIADOR AF BORLA 2,5'' + COLA DUAL 3''''CON SOPORTE NUV', 'AXLE BACK INOX 2,5'' + SILENCIADOR AF BORLA 2,5'' + COLA DUAL 3''''CON SOPORTE NUV', 330000, 'completada', '2021-07-30');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 367: OT 1467
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'SEBASTIAN GALLARDO' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'SEBASTIAN GALLARDO', '19858343-K', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'CPBY94' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'CPBY94', 'CHEVROLET', 'CAMARO 55', 2010, 'S/C', 0) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '1467', 'CPBY94', 'INTALACION DE HEADERS + AXLE BACK MAGNAFLOW  REPRO STAGE 2+65HP+44NM', 'INTALACION DE HEADERS + AXLE BACK MAGNAFLOW  REPRO STAGE 2+65HP+44NM', 1230000, 'completada', '2026-01-01');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 368: OT 1468
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'FABIAN MIRANDA' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'FABIAN MIRANDA', '19097201-1', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'YJ6285' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'YJ6285', 'PEUGEOT', '406 COUPE', 2005, 'S/C', 223562) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '1468', 'YJ6285', 'Carga masiva', 'Carga masiva', 0, 'completada', '2021-08-02');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 369: OT 1469
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'NICOLAS PEREZ' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'NICOLAS PEREZ', '18210843-K', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'KCRD92' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'KCRD92', 'CHEVROLET', 'CAMARO 55', 2018, 'S/C', 29056) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '1469', 'KCRD92', 'MONTAJE LINEA ORIGINAL CON SOLDADURA - CHEQUEO CHFCK ENGINE', 'MONTAJE LINEA ORIGINAL CON SOLDADURA - CHEQUEO CHFCK ENGINE', 80000, 'completada', '2021-08-02');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 370: OT 1470
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'MAXIMILIANO RIVERA' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'MAXIMILIANO RIVERA', '18053872-0', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'PRZB53' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'PRZB53', 'VOLKSWAGEN', 'GOLF R', 2021, 'S/C', 6720) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '1470', 'PRZB53', 'INSTALACION 4 COLAS ''TRAE CLIENTE''', 'INSTALACION 4 COLAS ''TRAE CLIENTE''', 120000, 'completada', '2021-08-02');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 371: OT 1471
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'SEBASTIAN GALLARDO' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'SEBASTIAN GALLARDO', '17110785-7', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'CPBY94' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'CPBY94', 'CHEVROLET', 'CAMARO 55', 2010, 'S/C', 65) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '1471', 'CPBY94', 'INSTALACION HEADERS ''TRAE CLIENTE'' INSTALACION MAGNAFLOW+2 COLA NEGRA 4''', 'INSTALACION HEADERS ''TRAE CLIENTE'' INSTALACION MAGNAFLOW+2 COLA NEGRA 4''', 1230000, 'completada', '2021-08-03');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 372: OT 1472
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'JOSE TOMAS' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'JOSE TOMAS', '19097201-1', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'GWWP27' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'GWWP27', 'TOYOTA', 'FJ', 2015, 'S/C', 150) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '1472', 'GWWP27', 'EXTENSION HEADERS', 'EXTENSION HEADERS', 420000, 'completada', '2021-08-04');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 373: OT 1473
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'LEONCIO CHAGON' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'LEONCIO CHAGON', '20807969-7', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'JYCW25' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'JYCW25', 'NISSAN', 'S/M', 2017, 'S/C', 37) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '1473', 'JYCW25', 'REMOVER SILENCIADOR BORLA POR MAGNAFLOW', 'REMOVER SILENCIADOR BORLA POR MAGNAFLOW', 220000, 'completada', '2021-08-04');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 374: OT 1474
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'CRISTOBAL MARTINEZ SAEZ' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'CRISTOBAL MARTINEZ SAEZ', '18077362-2', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'KWFV49' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'KWFV49', 'AUDI', 'A3', 2019, 'S/C', 35199) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '1474', 'KWFV49', 'SUPRIMIR SILENCIADOR POR INOX', 'SUPRIMIR SILENCIADOR POR INOX', 180000, 'completada', '2021-08-05');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 375: OT 1475
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'ALFREDO STEINMEYER' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'ALFREDO STEINMEYER', '18842260-8', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'VB2822' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'VB2822', 'BMW', '530', 2002, 'S/C', 144180) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '1475', 'VB2822', 'INSTALACION COLA 3'' RECTO SMG CON FABRICACION DE S', 'INSTALACION COLA 3'' RECTO SMG CON FABRICACION DE S', 64900, 'completada', '2021-08-06');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 376: OT 1476
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'MARCELO TORRIJO' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'MARCELO TORRIJO', '15385039-9', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'JBCX15' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'JBCX15', 'VOLKSWAGEN', 'GTI GOLF', 2017, 'S/C', 22145) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '1476', 'JBCX15', 'LINEA COMPLETA 3'' + SILENCIADOR ALTO FLUJO - 2 CROMO', 'LINEA COMPLETA 3'' + SILENCIADOR ALTO FLUJO - 2 CROMO', 590000, 'completada', '2021-08-09');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 377: OT 1477
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'JORGE ARELLANO' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'JORGE ARELLANO', '', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'KKLC36' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'KKLC36', 'MINI', 'COOPER', 2018, 'S/C', 11649) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '1477', 'KKLC36', 'AXLE BACK+COLA 4'' ALTO FLUJO - REPRO STAGE 1 +12HP+60NM', 'AXLE BACK+COLA 4'' ALTO FLUJO - REPRO STAGE 1 +12HP+60NM', 769800, 'completada', '2021-08-10');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 378: OT 1478
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'RODRIGO SALINAS CASTRO' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'RODRIGO SALINAS CASTRO', '20366232-7', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'DVXH80' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'DVXH80', 'AUDI', 'A4', 2012, 'S/C', 82300) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '1478', 'DVXH80', 'REMOVER SILENCIADOR', 'REMOVER SILENCIADOR', 80000, 'completada', '2021-08-11');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 379: OT 1479
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'BENJAMIN CARVAJAL' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'BENJAMIN CARVAJAL', '20088672-0', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'PRVB17' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'PRVB17', 'BMW', '128CI', 2021, 'S/C', 4600) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '1479', 'PRVB17', 'AXLE BACK FREE + COLA BLACK 4''', 'AXLE BACK FREE + COLA BLACK 4''', 349900, 'completada', '2021-08-11');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 380: OT 1480
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'GABRIEL  FERNANDEZ' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'GABRIEL  FERNANDEZ', '19308606-3', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'LCKD59' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'LCKD59', 'DODGE', 'RAM 1500', 2019, 'S/C', 67839) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '1480', 'LCKD59', 'INSTALACION MAGNAFLOW', 'INSTALACION MAGNAFLOW', 299900, 'completada', '2021-08-11');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 381: OT 1481
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'DANIEL CORREA SOTO' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'DANIEL CORREA SOTO', '', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'GFXF94' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'GFXF94', 'OPEL', 'ASTRA SEDAN', 2014, 'S/C', 59222) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '1481', 'GFXF94', 'GDOWNPIPE - REPROGRAMACION DE ECU', 'GDOWNPIPE - REPROGRAMACION DE ECU', 739800, 'completada', '2021-08-12');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 382: OT 1482
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'NICOLAS HUANG' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'NICOLAS HUANG', '16115033-9', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'HFGB79' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'HFGB79', 'BMW', 'M3', 2015, 'S/C', 33333) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '1482', 'HFGB79', 'INSTALACION 2 RESONADORES CENTRALES', 'INSTALACION 2 RESONADORES CENTRALES', 200000, 'completada', '2021-08-12');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 383: OT 1483
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'NICOLAS VERGARA' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'NICOLAS VERGARA', '19792679-1', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'JHKG18' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'JHKG18', 'MERCEDES', 'A250', 2017, 'S/C', 40900) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '1483', 'JHKG18', 'LINEA INOX 3'' + SILENCIADOR ALTO FLUJO VIBRANT', 'LINEA INOX 3'' + SILENCIADOR ALTO FLUJO VIBRANT', 519900, 'completada', '2021-08-13');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 384: OT 1484
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'ALFREDO HERRERA' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'ALFREDO HERRERA', '17926296-7', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'VB4587' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'VB4587', 'DODGE', 'RAM1500', 2007, 'S/C', 214825) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '1484', 'VB4587', 'INSTALACION CUTOUT ''CLIENTE TRAE EL PRODUCTO'' FABRICACION LINEA DUAL', 'INSTALACION CUTOUT ''CLIENTE TRAE EL PRODUCTO'' FABRICACION LINEA DUAL', 460000, 'completada', '2021-08-18');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 385: OT 1485
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'JULIAN MIRANDA' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'JULIAN MIRANDA', '15892054-9', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'PTPH52' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'PTPH52', 'DODGE', 'RAM', 2021, 'S/C', 8332) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '1485', 'PTPH52', 'INSTALACION MAGNAFLOW', 'INSTALACION MAGNAFLOW', 299900, 'completada', '2021-08-18');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 386: OT 1486
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'ITALO VILLAROL' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'ITALO VILLAROL', '11669148-5', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'FWPV27' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'FWPV27', 'VOLVO', 'V4O', 2014, 'S/C', 99949) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '1486', 'FWPV27', 'AXLE BACK FREE + COLA BLACK 4''', 'AXLE BACK FREE + COLA BLACK 4''', 299900, 'completada', '2021-08-19');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 387: OT 1487
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'BASTIAN MUNZENMAYER' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'BASTIAN MUNZENMAYER', '17299814-3', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'GYRC67' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'GYRC67', 'AUDI', 'A3 TAI', 2015, 'S/C', 86546) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '1487', 'GYRC67', 'AXLE BACK FREE + COLAS DUAL + MODIFICACION DE PARACHOQUE-REPRO DE ECU ST1', 'AXLE BACK FREE + COLAS DUAL + MODIFICACION DE PARACHOQUE-REPRO DE ECU ST1', 739900, 'completada', '2021-08-20');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 388: OT 1488
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'LUIS SILVA' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'LUIS SILVA', '18427514-7', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'KJDH26' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'KJDH26', 'AUDI', 'A5', 2018, 'S/C', 22044) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '1488', 'KJDH26', 'REINSTALACION DE 2 SILENCIADORES ORIGINAL', 'REINSTALACION DE 2 SILENCIADORES ORIGINAL', 140000, 'completada', '2021-08-24');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 389: OT 1489
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'EDUARDO BARRIOS' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'EDUARDO BARRIOS', '17189246-5', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'GLYS56' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'GLYS56', 'CHEVROLET', 'SILVERADO', 2014, 'S/C', 29747) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '1489', 'GLYS56', 'LINEA COMPLETA 3'' + SILENCIADOR ALTO FLUJO FLOWMASTER SUPER 44 + COLA CROMO', 'LINEA COMPLETA 3'' + SILENCIADOR ALTO FLUJO FLOWMASTER SUPER 44 + COLA CROMO', 680000, 'completada', '2021-08-24');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 390: OT 1490
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'SEBASTIAN' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'SEBASTIAN', '14345063-5', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'CPBY94' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'CPBY94', 'CHEVROLET', 'CAMARO 55', 0, 'S/C', 67064) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '1490', 'CPBY94', 'REPROGRAMACION STAGE 2 + INSTALACION EXTENSION SENSORES', 'REPROGRAMACION STAGE 2 + INSTALACION EXTENSION SENSORES', 0, 'completada', '2021-08-24');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 391: OT 1491
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'CLIENTE GENERICO' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'CLIENTE GENERICO', '', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'KFHJ69' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'KFHJ69', 'HYUNDAY', 'I10', 0, 'S/C', 0) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '1491', 'KFHJ69', 'REEMPLAZO DE FLEXIBLE 2''''', 'REEMPLAZO DE FLEXIBLE 2''''', 35000, 'completada', '2021-08-24');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 392: OT 1492
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'RAUL ESCUDERO' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'RAUL ESCUDERO', '', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'JRLS81' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'JRLS81', 'DODGE', 'RAM 1500', 2017, 'S/C', 83876) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '1492', 'JRLS81', 'SILENCIADOR ALTO FLUJO 3''FLOWMASTER-CAMBIO COLAS ESCAPE-SUPRIMIR SILENCI', 'SILENCIADOR ALTO FLUJO 3''FLOWMASTER-CAMBIO COLAS ESCAPE-SUPRIMIR SILENCI', 690000, 'completada', '2021-08-25');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 393: OT 1493
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'EDUARDO DUARTE' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'EDUARDO DUARTE', '19129915-9', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'LKLR66' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'LKLR66', 'BMW', '240I', 2020, 'S/C', 21324) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '1493', 'LKLR66', 'SUORIMIR SILENCIADOR CENTRAL INOX 3''''', 'SUORIMIR SILENCIADOR CENTRAL INOX 3''''', 70000, 'completada', '2021-08-25');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 394: OT 1494
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'OSCAR PADILLA' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'OSCAR PADILLA', '16719369-2', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'LWXH88' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'LWXH88', 'MAZDA', '3', 2021, 'S/C', 29539) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '1494', 'LWXH88', 'INSTALACION CUT OUT 2''''', 'INSTALACION CUT OUT 2''''', 230000, 'completada', '2021-08-26');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 395: OT 1495
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'TOMAS ALBOMOZ' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'TOMAS ALBOMOZ', '16471873-5', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'LZFJ23' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'LZFJ23', 'INFINITI', 'Q505', 2020, 'S/C', 8800) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '1495', 'LZFJ23', 'SUPRIMIR AMBOS SILENCIADORES CENTRALES', 'SUPRIMIR AMBOS SILENCIADORES CENTRALES', 150000, 'completada', '2021-08-26');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 396: OT 1496
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'THIAGO KUNST' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'THIAGO KUNST', '19819185-K', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'FJJP33' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'FJJP33', 'AUDI', 'A3', 2012, 'S/C', 64) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '1496', 'FJJP33', 'SUPRIMIR SILENCIADOR CENTRAL', 'SUPRIMIR SILENCIADOR CENTRAL', 65000, 'completada', '2021-08-26');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 397: OT 1497
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'SANTIAGO LOMBARDI' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'SANTIAGO LOMBARDI', '27137329-5', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'HSFR36' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'HSFR36', 'AUDI', 'Q3', 2016, 'S/C', 51506) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '1497', 'HSFR36', 'LINEA COMPLETA INOX 2,5'' + SILENCIADOR ALTO FLUJO MAGNAFLOW CON COLAS 3,5', 'LINEA COMPLETA INOX 2,5'' + SILENCIADOR ALTO FLUJO MAGNAFLOW CON COLAS 3,5', 0, 'completada', '2021-08-27');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 398: OT 1498
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'NELSON YANEZ' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'NELSON YANEZ', '24699755-1', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'TF1940' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'TF1940', 'JEEP', 'CHENOKEE', 1994, 'S/C', 243101) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '1498', 'TF1940', 'LINEA COMPLETTA 2,5'' (CATALITICO+FLOWMASTER) LOS TRAE CLIENTE', 'LINEA COMPLETTA 2,5'' (CATALITICO+FLOWMASTER) LOS TRAE CLIENTE', 500000, 'completada', '2026-01-01');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 399: OT 1499
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'SEBASTIAN HERNANDEZ' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'SEBASTIAN HERNANDEZ', '15336461-5', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'LVCT75' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'LVCT75', 'VOLKSWAGEN', 'JETTA GLI', 2020, 'S/C', 10236) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '1499', 'LVCT75', 'REPROGRAMACION DE ECU STAGE 1', 'REPROGRAMACION DE ECU STAGE 1', 349900, 'completada', '2021-08-27');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 400: OT 1500
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'CARLOS DOERR' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'CARLOS DOERR', '20099474-4', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'JXRV30' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'JXRV30', 'FORD', 'MUSTANG', 2018, 'S/C', 0) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '1500', 'JXRV30', 'INSTALACION AXLE BACK MAGNAFLOW %OFF', 'INSTALACION AXLE BACK MAGNAFLOW %OFF', 790000, 'completada', '2021-08-27');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    RAISE NOTICE 'Procesados 400 registros...';
    -- Fila 401: OT 1551
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'WILLIAM PEREZ' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'WILLIAM PEREZ', '5077042-7', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'PPYW27' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'PPYW27', 'SUBARU', 'IMPREZA STI', 2021, 'S/C', 7112) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '1551', 'PPYW27', 'LINEA INOX 3'' CON SILENCIADOR ALTO FLUJO MAGNAFLOW+4 COLAS DUAL DE 3,5', 'LINEA INOX 3'' CON SILENCIADOR ALTO FLUJO MAGNAFLOW+4 COLAS DUAL DE 3,5', 829900, 'completada', '2021-09-29');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 402: OT 1552
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'VALENTIN BENET' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'VALENTIN BENET', '15373743-6', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'AZ4929' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'AZ4929', 'BMW', 'E30', 1990, 'S/C', 0) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '1552', 'AZ4929', 'LINEA COMPLETA INOX 2,5''+SILENCIADOR ALTO FLUJO Y CAMBIO DE COLAS', 'LINEA COMPLETA INOX 2,5''+SILENCIADOR ALTO FLUJO Y CAMBIO DE COLAS', 0, 'completada', '2021-09-30');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 403: OT 1553
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'JAVIER UBILLA' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'JAVIER UBILLA', '23488582-0', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'LFRD31' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'LFRD31', 'AUDI', 'A3', 0, 'S/C', 45857) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '1553', 'LFRD31', 'FABRICACION E INTALACION DOWNPIPE 2,5', 'FABRICACION E INTALACION DOWNPIPE 2,5', 379900, 'completada', '2021-10-01');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 404: OT 1554
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'ROBER' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'ROBER', '16015333-4', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'PSRV21' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'PSRV21', 'CHEVROLET', 'SILVERADO', 2021, 'S/C', 19814) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '1554', 'PSRV21', 'INSTALACION CUT OUT', 'INSTALACION CUT OUT', 260000, 'completada', '2021-10-01');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 405: OT 1555
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'BERNARDO SANTIBAÑES' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'BERNARDO SANTIBAÑES', '', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'LXCT41' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'LXCT41', 'SUBARU', 'IMPREZA', 2020, 'S/C', 7846) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '1555', 'LXCT41', 'MONTAR SILENCIADOR ORIGINAL, NO CONSERVA SALIDAS DOBLE ''AXLE BACK''', 'MONTAR SILENCIADOR ORIGINAL, NO CONSERVA SALIDAS DOBLE ''AXLE BACK''', 80000, 'completada', '2021-10-04');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 406: OT 1556
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'BYRON MUÑOZ JARA' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'BYRON MUÑOZ JARA', '7990722-7', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'FKDR34' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'FKDR34', 'MERCEDES', 'ML', 2013, 'S/C', 96308) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '1556', 'FKDR34', 'LINEA COMPLETA INOX 2,5+DOBLE COLA DUAL 3,5 CON CORTE DE PARACHOQUE, ECU', 'LINEA COMPLETA INOX 2,5+DOBLE COLA DUAL 3,5 CON CORTE DE PARACHOQUE, ECU', 1082000, 'completada', '2021-10-04');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 407: OT 1557
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'CRISTIAN ABARCA' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'CRISTIAN ABARCA', '19276613-3', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'LYVP92' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'LYVP92', 'DODGE', 'RAM 1500', 2020, 'S/C', 26897) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '1557', 'LYVP92', 'LINEA + SILENCIADOR ALTO FLUJO BORLA + COLA SIMPLE BLACK 4''''', 'LINEA + SILENCIADOR ALTO FLUJO BORLA + COLA SIMPLE BLACK 4''''', 689900, 'completada', '2021-10-05');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 408: OT 1558
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'FERNANDO SAN MARTIN' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'FERNANDO SAN MARTIN', '16064930-5', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'BFFZ39' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'BFFZ39', 'FORD', 'MUSTANG', 2008, 'S/C', 111000) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '1558', 'BFFZ39', 'FABRICACION XPIPE CON DELETE RESONADOR - INSTALACION DE COLA ESCAPE BLACK', 'FABRICACION XPIPE CON DELETE RESONADOR - INSTALACION DE COLA ESCAPE BLACK', 489900, 'completada', '2021-10-05');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 409: OT 1559
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'YERKO PIZARRO' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'YERKO PIZARRO', '12163625-5', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'LHHY 95' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'LHHY 95', 'OPEL', 'CORSA', 2019, 'S/C', 0) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '1559', 'LHHY 95', 'REINSTALACION DE SILENCIADOR ORIGINAL', 'REINSTALACION DE SILENCIADOR ORIGINAL', 25000, 'completada', '2021-10-05');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 410: OT 1560
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'PEDRO VALDERRAMA' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'PEDRO VALDERRAMA', '20778825-2', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'GWLV28' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'GWLV28', 'FORD', 'MUSTANG', 2013, 'S/C', 105354) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '1560', 'GWLV28', 'AXLE BACK BORLA EXHAUST - COLA 4'''' CROMO', 'AXLE BACK BORLA EXHAUST - COLA 4'''' CROMO', 629900, 'completada', '2021-10-06');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 411: OT 1561
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'CRISTIAN HIGALDO' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'CRISTIAN HIGALDO', '16746412-2', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'GKRY76' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'GKRY76', 'MERCEDES', 'A200', 0, 'S/C', 104687) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '1561', 'GKRY76', 'NIVELACION COLA DE ESCAPE', 'NIVELACION COLA DE ESCAPE', 0, 'completada', '2021-10-06');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 412: OT 1562
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'VICENTE MARTINEZ' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'VICENTE MARTINEZ', '20000165-6', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'FSGL70' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'FSGL70', 'MINI', 'COOPER S', 2013, 'S/C', 79) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '1562', 'FSGL70', 'AXLE BACK FREE + COLA BLACK 4'' ( EJE TRASERO HACIA ATRÁS )', 'AXLE BACK FREE + COLA BLACK 4'' ( EJE TRASERO HACIA ATRÁS )', 229900, 'completada', '2021-10-06');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 413: OT 1563
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'VICENTE SAEZ' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'VICENTE SAEZ', '19669329-7', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'LVKY68' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'LVKY68', 'KIA', 'MORNING', 2020, 'S/C', 23) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '1563', 'LVKY68', 'LINEA COMPLETA INOX CON BORLA EXHAUST 2'''' + COLAS SMG CROMO', 'LINEA COMPLETA INOX CON BORLA EXHAUST 2'''' + COLAS SMG CROMO', 519900, 'completada', '2021-10-07');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 414: OT 1564
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'THIAGO' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'THIAGO', '19001743-5', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'FJJP33' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'FJJP33', 'AUDI', 'AB', 2012, 'S/C', 65000) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '1564', 'FJJP33', 'DOWNPIPE CON CATALITICO + EXTENSOR SONDA - INSTALACION ALTO FLUJO MAGNAF', 'DOWNPIPE CON CATALITICO + EXTENSOR SONDA - INSTALACION ALTO FLUJO MAGNAF', 364900, 'completada', '2021-10-07');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 415: OT 1565
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'MAURICIO ZUÑIGA' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'MAURICIO ZUÑIGA', '27137329-5', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'SIN-PAT' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'SIN-PAT', 'HARLEY-DAVIDS', 'PAN AMERIC', 2022, 'S/C', 0) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '1565', 'SIN-PAT', 'INSTALACION Y MODIFICACION DE SILENCIADOR', 'INSTALACION Y MODIFICACION DE SILENCIADOR', 85000, 'completada', '2021-10-07');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 416: OT 1566
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'SEBASTIAN MONTALVA' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'SEBASTIAN MONTALVA', '10813022-9', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'TR6793' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'TR6793', 'FORD', 'RANGER SPL', 30, 'S/C', 180) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '1566', 'TR6793', 'INSTALACION SILENCIADOR ALTO FLUJO BORLA 2,5'' LINEA COMPLETA INOX 2,5', 'INSTALACION SILENCIADOR ALTO FLUJO BORLA 2,5'' LINEA COMPLETA INOX 2,5', 569900, 'completada', '2021-10-08');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 417: OT 1567
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'ITALO HUERTA' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'ITALO HUERTA', '16458256-6', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'CWHC59' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'CWHC59', 'VOLVO', 'C30', 2011, 'S/C', 95) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '1567', 'CWHC59', 'LINEA COMPLETA INOX+SILENCIADOR ALTO FLUJO MAGNAFLOW +COLAS NUEVAS 4''''', 'LINEA COMPLETA INOX+SILENCIADOR ALTO FLUJO MAGNAFLOW +COLAS NUEVAS 4''''', 1369800, 'completada', '2021-10-08');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 418: OT 1568
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'TOMAS' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'TOMAS', '19568922-9', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'WZRL40' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'WZRL40', 'MINI', 'COOPERS', 2019, 'S/C', 36465) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '1568', 'WZRL40', 'ELIMINAR SILENCIADOR TRASERO + COLAS 4'''' BLACK', 'ELIMINAR SILENCIADOR TRASERO + COLAS 4'''' BLACK', 270000, 'completada', '2021-10-12');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 419: OT 1569
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'ANIBAL NUÑEZ' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'ANIBAL NUÑEZ', '19035684-1', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'FWWK82' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'FWWK82', 'SUBARU', 'IMPREZA', 2013, 'S/C', 142) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '1569', 'FWWK82', 'AXLE BACK FREE + COLA SMG', 'AXLE BACK FREE + COLA SMG', 190000, 'completada', '2021-10-12');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 420: OT 1570
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'BAYRON MUÑOZ JARA' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'BAYRON MUÑOZ JARA', '16572112-8', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'FKDR34' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'FKDR34', 'MERCEDES', 'ML 350', 2013, 'S/C', 96308) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '1570', 'FKDR34', 'INGRESA PARA TERMINO DE LINEA INOX 2,5 + DOBLE COLA DUAL 3,5 CORTE PARACHOQ', 'INGRESA PARA TERMINO DE LINEA INOX 2,5 + DOBLE COLA DUAL 3,5 CORTE PARACHOQ', 0, 'completada', '2021-10-12');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 421: OT 1571
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'EDUARDO GALLARDO NUÑEZ' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'EDUARDO GALLARDO NUÑEZ', '19276613-3', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'GYSR79' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'GYSR79', 'CHEVROLET', 'CAMARO', 2015, 'S/C', 45055) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '1571', 'GYSR79', 'LINEA COMPLETA+XPIPE+BORLA EXHAUST+COLAS NUEVAS CROMO', 'LINEA COMPLETA+XPIPE+BORLA EXHAUST+COLAS NUEVAS CROMO', 989900, 'completada', '2021-10-13');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 422: OT 1572
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'DANIEL GOMEZ' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'DANIEL GOMEZ', '15122259-5', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'XD6651' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'XD6651', 'PORSCHE', 'BOXTER', 25, 'S/C', 0) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '1572', 'XD6651', 'FABRICACION LINEA COMPLETA ELIMINAR CATALITICO-REPRO STAGE 2-AXLE BACK VIB', 'FABRICACION LINEA COMPLETA ELIMINAR CATALITICO-REPRO STAGE 2-AXLE BACK VIB', 1929700, 'completada', '2021-10-13');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 423: OT 1573
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'ADRIAN BLANCO' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'ADRIAN BLANCO', '16796126-6', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'CGLG12' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'CGLG12', 'CHEVROLET', 'CAMARO 55', 2010, 'S/C', 78366) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '1573', 'CGLG12', 'INSTALACION BORLA EXHAUST 3'''' + COLA 4'''' CROMO', 'INSTALACION BORLA EXHAUST 3'''' + COLA 4'''' CROMO', 669900, 'completada', '2021-10-14');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 424: OT 1574
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'SEBASTIAN BASCUÑAN' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'SEBASTIAN BASCUÑAN', '13258962-3', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'JVXW96' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'JVXW96', 'VOLKSWAGEN', 'GOLF TDI', 20, 'S/C', 51086) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '1574', 'JVXW96', 'REPRO DE ECU STAGE 1-FILTRO PANEL ALTO FLUJO BMC-DIAMOND OFF-SPRINTBOOST', 'REPRO DE ECU STAGE 1-FILTRO PANEL ALTO FLUJO BMC-DIAMOND OFF-SPRINTBOOST', 329190, 'completada', '2021-10-14');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 425: OT 1575
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'NICOLAS SOLOBARRIETA' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'NICOLAS SOLOBARRIETA', '17812555-9', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'KZRR73' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'KZRR73', 'BMW', 'M8I', 2019, 'S/C', 40545) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '1575', 'KZRR73', 'MEDIA LINEA INOX 2,5 + SILENCIADOR ALTO FLUJO MAGNAFLOW c/ COLA AKNAP', 'MEDIA LINEA INOX 2,5 + SILENCIADOR ALTO FLUJO MAGNAFLOW c/ COLA AKNAP', 315000, 'completada', '2021-10-14');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 426: OT 1576
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'SEBASTIAN OTEIZA' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'SEBASTIAN OTEIZA', '19539583-7', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'FTCV27' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'FTCV27', 'SKODA', 'FABIA HB', 2013, 'S/C', 165710) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '1576', 'FTCV27', 'STAGE 1 + 37HP + 58NM', 'STAGE 1 + 37HP + 58NM', 267500, 'completada', '2021-10-15');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 427: OT 1577
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'PABLO RIOS' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'PABLO RIOS', '18127136-1', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'RBJZ96' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'RBJZ96', 'DODGE', 'RAM 1500', 2021, 'S/C', 14) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '1577', 'RBJZ96', 'REEMPLAZO SILENCIADOR ORIGINAL X BORLA EXHAUST', 'REEMPLAZO SILENCIADOR ORIGINAL X BORLA EXHAUST', 309900, 'completada', '2021-10-15');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 428: OT 1578
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'VICTOR HUGO MUÑOZ FERRADA' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'VICTOR HUGO MUÑOZ FERRADA', '19135532-6', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'JCTH10' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'JCTH10', 'MAZDA', '3 HB', 2017, 'S/C', 69086) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '1578', 'JCTH10', 'STAGE 2-INSTALACION MULTIPLE DE ESCAPE-LINEA 2,5+SILENCIADOR ALTO FLUJO', 'STAGE 2-INSTALACION MULTIPLE DE ESCAPE-LINEA 2,5+SILENCIADOR ALTO FLUJO', 1840000, 'completada', '2021-10-18');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 429: OT 1579
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'RUBEN VALDES' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'RUBEN VALDES', '17756959-3', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'JHVV95' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'JHVV95', 'VOLVO', 'V4O T4', 2017, 'S/C', 52928) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '1579', 'JHVV95', 'STAGE 1 CYBER +45HP +70NM', 'STAGE 1 CYBER +45HP +70NM', 367500, 'completada', '2021-10-18');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;

    RAISE NOTICE 'Bloque finalizado con éxito.';
END $$;