DO $$
DECLARE
    v_taller_id UUID := 'e55ce6be-7b8c-4a1a-b333-666333666333';
    v_cliente_id UUID;
    v_vehiculo_id UUID;
BEGIN
    RAISE NOTICE 'Iniciando carga de bloque...';
    -- Fila 1717: OT 3051
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'DAVID OLMEDO' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'DAVID OLMEDO', '14044004-3', '964076755', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'LPKH85' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'LPKH85', 'BMW', '420I', 2019, 'BLANCO', 129000) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '3051', 'LPKH85', 'MUFFLER DELETE', 'MUFFLER DELETE', 100000, 'completada', '2025-07-14');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 1718: OT 3052
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'LUIS PATRON' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'LUIS PATRON', '22542622-K', '972173701', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'SYTH12' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'SYTH12', 'TOYOTA', 'LAND CRUISER', 2024, 'BEIGE', 25500) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '3052', 'SYTH12', 'LINEA +ALTO FLUJO', 'LINEA +ALTO FLUJO', 649900, 'completada', '2025-07-15');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 1719: OT 3053
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'PEDRO COSTA' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'PEDRO COSTA', '20859062-6', '988881086', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'LLLP22' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'LLLP22', 'VW', 'GOLF', 2020, 'GRIS', 64000) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '3053', 'LLLP22', 'REINSTALACION SILENCIADOR', 'REINSTALACION SILENCIADOR', 100000, 'completada', '2025-07-17');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 1720: OT 3054
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'ROBERTO DROGSTE' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'ROBERTO DROGSTE', '13027447-1', '989378800', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'TBXX86' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'TBXX86', 'CHEVROLET', 'SILVERADO', 2024, 'GRIS', 30000) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '3054', 'TBXX86', 'CUT-OUT', 'CUT-OUT', 449000, 'completada', '2025-07-17');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 1721: OT 3055
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'FELIPE RUMINOT TORRES' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'FELIPE RUMINOT TORRES', '16618186-0', '973873296', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'LGJL12' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'LGJL12', 'SUBARU', 'WRX', 2019, 'AZUL', 26988) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '3055', 'LGJL12', 'CATBACK + MAGNAFLOW + 4 COLAS 3,5"', 'CATBACK + MAGNAFLOW + 4 COLAS 3,5"', 849900, 'completada', '2025-07-17');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 1722: OT 3056
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'CRISTOBAL RAMDOHR' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'CRISTOBAL RAMDOHR', '18767572-3', '946434574', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'DZYX41' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'DZYX41', 'AUDI', 'S5', 2013, 'NEGRO', 100000) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '3056', 'DZYX41', 'REPARACION DE ESCAPE', 'REPARACION DE ESCAPE', 149900, 'completada', '2025-07-17');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 1723: OT 3057
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'CRISTOBAL' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'CRISTOBAL', '', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'SLHL68' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'SLHL68', 'BMW', '340', 2023, 'AZUL', 40000) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '3057', 'SLHL68', 'REPARACION DE ESCAPE', 'REPARACION DE ESCAPE', 149900, 'completada', '2025-07-17');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 1724: OT 3058
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'BERNARDO BARRANTES' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'BERNARDO BARRANTES', '14282516-9', '994191720', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'VCJB82' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'VCJB82', 'CHEVROLET', 'SILVERADO', 2025, 'GRIS', 5500) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '3058', 'VCJB82', 'INSTALACION CUT-OUT', 'INSTALACION CUT-OUT', 100000, 'completada', '2025-07-18');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 1725: OT 3059
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'JAVIER SANTANA' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'JAVIER SANTANA', '16682685-3', '934949715', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'PPCH77' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'PPCH77', 'BMW', 'X3', 2021, 'BLANCO', 50000) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '3059', 'PPCH77', 'REPARACION DE ESCAPE', 'REPARACION DE ESCAPE', 39900, 'completada', '2025-07-18');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 1726: OT 3060
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'RODRIGO POBLETE' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'RODRIGO POBLETE', '9112591-9', '977494340', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'SZRZ27' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'SZRZ27', 'CUPRA', 'ATECA', 2023, 'GRIS', 20000) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '3060', 'SZRZ27', 'INSTALACION SILENCIADOR +ALTO FLUJO', 'INSTALACION SILENCIADOR +ALTO FLUJO', 299900, 'completada', '2025-07-18');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 1727: OT 3061
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'ALEJANDRO CORREA' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'ALEJANDRO CORREA', '21159931-6', '956125199', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'VFKW75' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'VFKW75', 'SUBARU', 'WRX', 2025, 'GRIS', 1500) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '3061', 'VFKW75', 'AXLE BACK FREE', 'AXLE BACK FREE', 449900, 'completada', '2025-07-21');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 1728: OT 3062
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'GONZALO REYES' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'GONZALO REYES', '17651104-4', '942516270', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'TPHT23' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'TPHT23', 'CHEVROLET', 'SILVERADO', 2025, 'GRIS', 20000) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '3062', 'TPHT23', 'CUT-OU+ WICKED FLOW KAMIKAZE +BMC ALTO FLUJO', 'CUT-OU+ WICKED FLOW KAMIKAZE +BMC ALTO FLUJO', 889900, 'completada', '2025-07-22');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 1729: OT 3063
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'ARTURO LARRAIN' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'ARTURO LARRAIN', '17060373-7', '988559803', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'DYHP15' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'DYHP15', 'CHEVROLET', 'COLORADO', 2012, 'ROJO', 178000) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '3063', 'DYHP15', 'SILENCIADOR ALTO FLUJO MAGNOFLOW', 'SILENCIADOR ALTO FLUJO MAGNOFLOW', 460000, 'completada', '2025-07-22');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 1730: OT 3064
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'JOSE TOMAS VALDES' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'JOSE TOMAS VALDES', '20807969-7', '989220792', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'SIN-PAT' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'SIN-PAT', 'FORD', '150', 0, 'S/C', 0) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '3064', 'SIN-PAT', 'REPARACION', 'REPARACION', 65450, 'completada', '2025-07-22');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 1731: OT 3065
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'CRISTOBAL REYES' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'CRISTOBAL REYES', '15732635-K', '944064941', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'SIN-PAT' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'SIN-PAT', 'DODGE', 'RAM', 2020, 'GRIS', 88000) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '3065', 'SIN-PAT', 'FILTRO ALTO FLUJO', 'FILTRO ALTO FLUJO', 139900, 'completada', '2025-07-23');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 1732: OT 3066
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'LUIS PATRON' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'LUIS PATRON', '22542621-K', '972173701', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'SYTH12' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'SYTH12', 'TOYOTA', 'LAND CRUISER', 2024, 'BEIGE', 25500) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '3066', 'SYTH12', 'SILENCIADOR ALTO FLUJO SILENT PRO', 'SILENCIADOR ALTO FLUJO SILENT PRO', 199900, 'completada', '2025-07-23');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 1733: OT 3067
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'ALEJANDRO GONZALEZ' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'ALEJANDRO GONZALEZ', '25225311-4', '965331755', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'SIN-PAT' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'SIN-PAT', 'FORD', 'MUSTANG', 2022, 'S/C', 0) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '3067', 'SIN-PAT', 'RECUBRIMIENTO TERMICO', 'RECUBRIMIENTO TERMICO', 590000, 'completada', '2025-07-23');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 1734: OT 3068
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'CRISTOBAL RAMDOHR' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'CRISTOBAL RAMDOHR', '18767572-3', '946434574', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'DZYX41' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'DZYX41', 'AUDI', 'S5', 2013, 'NEGRO', 100000) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '3068', 'DZYX41', 'REPARACION', 'REPARACION', 149900, 'completada', '2025-07-23');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 1735: OT 3069
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'MIGUEL RUBIO' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'MIGUEL RUBIO', '12904268-8', '998244373', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'HDTJ72' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'HDTJ72', 'SUBARU', 'LEGACY', 2015, 'BLANCO', 137359) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '3069', 'HDTJ72', 'ESCAPE AXLE BACK FREE + COLAS NEGRAS', 'ESCAPE AXLE BACK FREE + COLAS NEGRAS', 419900, 'completada', '2025-07-24');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 1736: OT 3070
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'CRISTIAN REBOLLEDO' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'CRISTIAN REBOLLEDO', '16322520-4', '956481811', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'DVWR41' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'DVWR41', 'NISSAN', '370Z', 2012, 'NEGRO', 80738) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '3070', 'DVWR41', 'REPRO + MDOIFICACION ESCAPE', 'REPRO + MDOIFICACION ESCAPE', 1050000, 'completada', '2025-07-24');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 1737: OT 3071
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'EUGENIO MASSA' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'EUGENIO MASSA', '8034131-8', '992383912', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'TWTB47' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'TWTB47', 'GREATWALL', 'TANK300', 2025, 'GRIS ARENA', 3200) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '3071', 'TWTB47', 'CUT-OUT', 'CUT-OUT', 449900, 'completada', '2025-07-25');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 1738: OT 3072
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'MIGUEL RODRIGUEZ' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'MIGUEL RODRIGUEZ', '15648710-4', '961342985', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'VFSS97' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'VFSS97', 'FORD', 'F150', 2025, 'AZUL', 1900) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '3072', 'VFSS97', 'CUT-OUT', 'CUT-OUT', 449900, 'completada', '2025-07-25');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 1739: OT 3073
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'FULLEN INTERNATIONAL' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'FULLEN INTERNATIONAL', '76497234-1', '934284652', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'SIN-PAT' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'SIN-PAT', 'GRUA', 'HORQUILLA', 0, 'S/C', 0) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '3073', 'SIN-PAT', 'REPRO DE ECU DPF OFF', 'REPRO DE ECU DPF OFF', 449900, 'completada', '2025-07-25');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 1740: OT 3074
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'CLAUDIO SANDOVAL' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'CLAUDIO SANDOVAL', '13237915-K', '934816131', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'BTYL66' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'BTYL66', 'JAGUAR', 'XF', 2009, 'GRIS', 108517) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '3074', 'BTYL66', 'MUFFLER DELETE', 'MUFFLER DELETE', 199900, 'completada', '2025-07-25');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 1741: OT 3075
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'IGNACIO MEDINA' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'IGNACIO MEDINA', '19959912-7', '958080446', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'GHXK77' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'GHXK77', 'MERCEDES', 'A45', 2014, 'BLANCO', 0) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '3075', 'GHXK77', 'REPARACION SISTEMA VALVETRONIC', 'REPARACION SISTEMA VALVETRONIC', 80000, 'completada', '2025-07-28');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 1742: OT 3076
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'ALEXIS GANDARA' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'ALEXIS GANDARA', '18091970-8', '939171844', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'PFZP51' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'PFZP51', 'MERCEDES', 'A45', 2020, 'PLATA', 20000) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '3076', 'PFZP51', 'CATBACK 3" + ALTO LFUJO BORLA + VALVULA MERCEDES', 'CATBACK 3" + ALTO LFUJO BORLA + VALVULA MERCEDES', 929900, 'completada', '2025-07-28');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 1743: OT 3077
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'MIGUEL RODRIGUEZ' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'MIGUEL RODRIGUEZ', '15648710-4', '961342985', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'VFSS97' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'VFSS97', 'FORD', 'F150', 2025, 'AZUL', 0) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '3077', 'VFSS97', 'ALTO FLUJO BORLA + MODIFICACION ESCAPE', 'ALTO FLUJO BORLA + MODIFICACION ESCAPE', 200000, 'completada', '2025-07-29');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 1744: OT 3078
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'RODRIGO FLORES' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'RODRIGO FLORES', '15777329-1', '926362659', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'DFCT28' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'DFCT28', 'HYUNDAI', 'GENESIS', 2011, 'ROJO', 108000) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '3078', 'DFCT28', 'CUT OUT + MODIFICACION', 'CUT OUT + MODIFICACION', 499900, 'completada', '2025-07-30');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 1745: OT 3079
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'JONATHAN ARAVENA' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'JONATHAN ARAVENA', '16278205-3', '950996794', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'SIN-PAT' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'SIN-PAT', 'VW', 'SAVEIRO', 1992, 'S/C', 0) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '3079', 'SIN-PAT', 'RECUBRIMIENTO TERMICO +DOWNPIPE', 'RECUBRIMIENTO TERMICO +DOWNPIPE', 149900, 'completada', '2025-07-30');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 1746: OT 3080
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'VICENTE VILLANUEVA' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'VICENTE VILLANUEVA', '22258232-6', '932299629', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'JCCB78' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'JCCB78', 'BMW', '240', 2017, 'GRIS', 70446) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '3080', 'JCCB78', 'AXLE BACK FREE', 'AXLE BACK FREE', 239900, 'completada', '2025-07-30');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 1747: OT 3081
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'MATIAS  CORDOVA' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'MATIAS  CORDOVA', '19244499-3', '952187825', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'BKFZ99' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'BKFZ99', 'BMW', '325I', 2008, 'NEGRO', 176000) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '3081', 'BKFZ99', 'AXLE BACK + SILENCIADOR ALTO FLUJO COLAS NUEVAS', 'AXLE BACK + SILENCIADOR ALTO FLUJO COLAS NUEVAS', 399900, 'completada', '2025-07-30');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 1748: OT 3082
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'JAVIER RIOS' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'JAVIER RIOS', '19182713-9', '997865566', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'PZSY67' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'PZSY67', 'FORD', 'F150', 2021, 'AZUL', 0) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '3082', 'PZSY67', 'SILENCIADOR CON VALVULA + DOBLE SOLIDO DE ESCAPE', 'SILENCIADOR CON VALVULA + DOBLE SOLIDO DE ESCAPE', 1219800, 'completada', '2025-07-30');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 1749: OT 3083
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'ANDRES GONZALEZ' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'ANDRES GONZALEZ', '25857120-7', '930823863', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'KJFC42' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'KJFC42', 'FORD', 'MUSTANG', 2008, 'PLATA', 57500) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '3083', 'KJFC42', 'X-PIPE', 'X-PIPE', 249900, 'completada', '2025-07-31');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 1750: OT 3084
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'CARLOS RUIZ' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'CARLOS RUIZ', '28110222-2', '999937365', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'TYYS47' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'TYYS47', 'SUBARU', 'WRX', 2025, 'BLANCO', 5000) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '3084', 'TYYS47', 'CUT-OUT + SPRINT BOOSTER A7300', 'CUT-OUT + SPRINT BOOSTER A7300', 779800, 'completada', '2025-07-31');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 1751: OT 3085
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'MATIAS PINO' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'MATIAS PINO', '21035698-3', '920562668', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'PKHV23' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'PKHV23', 'CHEVROLET', 'SILVERADO', 2021, 'NEGRO', 120000) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '3085', 'PKHV23', 'REMOVER SILENCIADORES', 'REMOVER SILENCIADORES', 239800, 'completada', '2025-08-01');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 1752: OT 3086
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'JORGE CAÑAS' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'JORGE CAÑAS', '77367267-9', '966154903', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'SXKK87' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'SXKK87', 'FORD', 'RAPTOR', 2022, 'NEGRO', 47166) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '3086', 'SXKK87', 'REPROGRAMACION ECU 521 460HP', 'REPROGRAMACION ECU 521 460HP', 1780000, 'completada', '2025-08-04');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 1753: OT 3087
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'JOSE HERRERA' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'JOSE HERRERA', '18918594-4', '990947832', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'PDGP21' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'PDGP21', 'FORD', 'F150', 2021, 'ROJO', 65000) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '3087', 'PDGP21', 'CUT-OUT', 'CUT-OUT', 449900, 'completada', '2025-08-04');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 1754: OT 3088
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'IGNACIO FUENTES SALINA S' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'IGNACIO FUENTES SALINA S', '18085336-7', '987331267', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'PYVF91' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'PYVF91', 'SUZUKI', 'SWIFT', 2021, 'ROJO', 40800) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '3088', 'PYVF91', 'STAGE 1 + 28HP+60NM', 'STAGE 1 + 28HP+60NM', 319900, 'completada', '2025-08-04');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 1755: OT 3089
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'JORGE BRUNA' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'JORGE BRUNA', '18023498-5', '942657099', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'KFXP97' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'KFXP97', 'MAZDA', 'CX5', 2018, 'AZUL', 0) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '3089', 'KFXP97', 'COLAS UEVAS 4" NEGRAS', 'COLAS UEVAS 4" NEGRAS', 149800, 'completada', '2025-08-04');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 1756: OT 3090
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'JOAQUIN TOLEDO' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'JOAQUIN TOLEDO', '20871811-8', '59194479', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'TLFX20' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'TLFX20', 'SUZUKI', 'SWIFT', 2025, 'GR', 14830) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '3090', 'TLFX20', 'LINEA COMPLETA INOXIDABLE+BORLA ALTO FLUJO CENTRAL +COLAS NUEVAS 4"', 'LINEA COMPLETA INOXIDABLE+BORLA ALTO FLUJO CENTRAL +COLAS NUEVAS 4"', 739900, 'completada', '2025-08-05');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 1757: OT 3091
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'MATIAS URRUTIA' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'MATIAS URRUTIA', '84900900-1', '961704019', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'SIN-PAT' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'SIN-PAT', 'KIA', 'SPORTAGE', 2018, 'PLATA', 20365) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '3091', 'SIN-PAT', 'SOFTWARE DESACTIVACION CATALITICO', 'SOFTWARE DESACTIVACION CATALITICO', 180000, 'completada', '2025-08-05');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 1758: OT 3092
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'ISRAEL SANTIBAÑEZ' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'ISRAEL SANTIBAÑEZ', '18030128-3', '971416354', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'VDZT94' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'VDZT94', 'SUBARU', 'WRX', 2025, 'AZUL', 0) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '3092', 'VDZT94', 'LINEA COMPLETA + SILENCIADOR  ALTO FLUJO + COLAS 4" CROMO', 'LINEA COMPLETA + SILENCIADOR  ALTO FLUJO + COLAS 4" CROMO', 849900, 'completada', '2025-08-05');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 1759: OT 3093
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'FELIPE FLORES' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'FELIPE FLORES', '18867419-4', '982289633', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'SKFJ40' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'SKFJ40', 'FORD', 'F150', 2023, 'PLATA', 78000) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '3093', 'SKFJ40', 'CUT-OUT + DOBLE SALIDA', 'CUT-OUT + DOBLE SALIDA', 1010000, 'completada', '2025-08-06');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 1760: OT 3094
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'YHOVANY LOPEZ' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'YHOVANY LOPEZ', '20013929-1', '30658117', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'GFYL58' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'GFYL58', 'BMW', '428I', 2014, 'PLATA', 156000) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '3094', 'GFYL58', 'AXLE BACK FREE CON 2 COLAS +DIFUSOR BMW 435I', 'AXLE BACK FREE CON 2 COLAS +DIFUSOR BMW 435I', 699800, 'completada', '2025-08-07');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 1761: OT 3095
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'VICTOR MIRANDA' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'VICTOR MIRANDA', '9476670-2', '982322247', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'SIN-PAT' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'SIN-PAT', 'OUTBACK', 'S/M', 0, 'S/C', 0) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '3095', 'SIN-PAT', 'REPARACION MULTIPLE', 'REPARACION MULTIPLE', 90000, 'completada', '2025-08-07');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 1762: OT 3096
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'LUIS MEDINA' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'LUIS MEDINA', '17339412-8', '942654335', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'DJSV52' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'DJSV52', 'MINI', 'COOPER 5', 2011, 'BLANCO', 111000) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '3096', 'DJSV52', 'COLAS NUEVAS +REPRO', 'COLAS NUEVAS +REPRO', 600000, 'completada', '2025-08-08');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 1763: OT 3097
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'KEVIN GUZMAN' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'KEVIN GUZMAN', '18340765-1', '92490427', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'FCCH39' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'FCCH39', 'BMW', '320', 2013, 'GRIS', 143000) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '3097', 'FCCH39', 'SILENCIADOR ALTO FLUJO MAGNAFLOW COLA DE ESCAPENUEVA', 'SILENCIADOR ALTO FLUJO MAGNAFLOW COLA DE ESCAPENUEVA', 384900, 'completada', '2025-08-08');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 1764: OT 3098
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'MATIAS FEGER' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'MATIAS FEGER', '17601157-2', '968205452', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'SSKD83' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'SSKD83', 'TOYOTA', 'RAM', 2023, 'NEGRO', 1500) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '3098', 'SSKD83', 'CUT-OUT', 'CUT-OUT', 449900, 'completada', '2025-08-08');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 1765: OT 3099
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'ANDY GOMEZ' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'ANDY GOMEZ', '14864125-0', '974952314', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'SIN-PAT' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'SIN-PAT', 'CHEVROLET', 'CORSA', 0, 'S/C', 0) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '3099', 'SIN-PAT', 'RECUBRIMIENTO TERMICO+MULTIPLE+ CARACOLA', 'RECUBRIMIENTO TERMICO+MULTIPLE+ CARACOLA', 349900, 'completada', '2025-08-08');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 1766: OT 3100
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'RAFAEL PAREJA' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'RAFAEL PAREJA', '17319132-4', '952541255', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'JKYD77' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'JKYD77', 'AUDI', 'TT', 2017, 'GRIS', 0) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '3100', 'JKYD77', 'REPARACION CUT-OUT', 'REPARACION CUT-OUT', 44900, 'completada', '2025-08-08');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 1767: OT 3101
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'MARCO AGUIRRE' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'MARCO AGUIRRE', '15818087-1', '982497919', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'CRGT17' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'CRGT17', 'BMW', '135I', 2010, 'PLATA', 131000) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '3101', 'CRGT17', 'MODIFICACION AXLE BACK CON SILENCIADOR +VALVULA CUT-OUT+NIVELACION COLAS', 'MODIFICACION AXLE BACK CON SILENCIADOR +VALVULA CUT-OUT+NIVELACION COLAS', 700000, 'completada', '2025-08-08');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 1768: OT 3102
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'BENJAMIN ITURRIAGA' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'BENJAMIN ITURRIAGA', '15163797-3', '968418913', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'HSDW33' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'HSDW33', 'BMW', '420I', 2016, 'PLATA', 118000) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '3102', 'HSDW33', 'CUT-OUT', 'CUT-OUT', 449900, 'completada', '2025-08-08');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 1769: OT 3103
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'PATRICIO TORRES' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'PATRICIO TORRES', '12464460-7', '964813348', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'WD9463' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'WD9463', 'FORD', 'MUSTANG', 2000, 'ROJO', 103000) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '3103', 'WD9463', 'INSTALACION MULTIPLE  +FABRICACION LINEA AACERO INOX +ALTO FLUJO BORLA+ REPRO +INDUCCION', 'INSTALACION MULTIPLE  +FABRICACION LINEA AACERO INOX +ALTO FLUJO BORLA+ REPRO +INDUCCION', 2002000, 'completada', '2025-08-11');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 1770: OT 3104
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'MATIAS MARTINEZ' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'MATIAS MARTINEZ', '20289027-K', '977278861', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'RWVZ29' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'RWVZ29', 'MG', 'GT', 2022, 'ROJO', 76000) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '3104', 'RWVZ29', 'REPARACION CAÑERIA', 'REPARACION CAÑERIA', 79900, 'completada', '2025-08-11');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 1771: OT 3105
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'ROBERTO LASEN' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'ROBERTO LASEN', '10841421-9', '998281407', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'DJXB20' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'DJXB20', 'CHEVROLET', 'SILVERADO', 0, 'GRIS', 80000) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '3105', 'DJXB20', 'SILENCIADOR ALTO FLUJO MAGNAFLOW+DOBLE SALIDA + COLAS NEGRAS', 'SILENCIADOR ALTO FLUJO MAGNAFLOW+DOBLE SALIDA + COLAS NEGRAS', 899900, 'completada', '2025-08-12');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 1772: OT 3106
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'BENJAMIN ITURRIAGA' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'BENJAMIN ITURRIAGA', '15163797-3', '968418913', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'HSDW33' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'HSDW33', 'BMW', '420I', 2016, 'PLATA', 118000) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '3106', 'HSDW33', 'CAMBIO PARACHOQUE Y DIFUSOR M4+MODIFICACION DE ESCAPE CON VALVULAS ON/OFF', 'CAMBIO PARACHOQUE Y DIFUSOR M4+MODIFICACION DE ESCAPE CON VALVULAS ON/OFF', 1125000, 'completada', '2025-08-13');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 1773: OT 3107
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'OLIVER MARICURA' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'OLIVER MARICURA', '18185642-4', '987227529', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'LKHB20' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'LKHB20', 'FORD', 'MUSTANG', 2019, 'AZUL', 77414) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '3107', 'LKHB20', 'XPIPE INOX CENTRAL', 'XPIPE INOX CENTRAL', 249900, 'completada', '2025-08-14');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 1774: OT 3108
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'DAVID VILLANUEVA' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'DAVID VILLANUEVA', '18875766-8', '940998817', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'VGLX64' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'VGLX64', 'FORD', 'MUSTANG', 2025, 'ROJO', 3000) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '3108', 'VGLX64', 'H X-PIPE', 'H X-PIPE', 379900, 'completada', '2025-08-14');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 1775: OT 3109
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'MARIO BARRIOS' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'MARIO BARRIOS', '1336072-7', '997192431', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'SVBB98' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'SVBB98', 'SUBARU', 'WRX', 2023, 'GRIS', 20000) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '3109', 'SVBB98', 'AXLE BACK FREE', 'AXLE BACK FREE', 449900, 'completada', '2025-08-18');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 1776: OT 3110
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'FULLEN INTERNATIONAL' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'FULLEN INTERNATIONAL', '76497234-1', '934284652', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'SIN-PAT' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'SIN-PAT', 'GRUA', 'HORQUILLA', 0, 'S/C', 0) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '3110', 'SIN-PAT', 'REPRO DE ECU', 'REPRO DE ECU', 449900, 'completada', '2025-08-18');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 1777: OT 3111
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'MARCELO ARCE' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'MARCELO ARCE', '21632084-0', '984258692', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'GJKZ18' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'GJKZ18', 'OPEL', 'ASTRA', 2014, 'GRIS', 185000) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '3111', 'GJKZ18', 'INSPECCION', 'INSPECCION', 25000, 'completada', '2025-08-18');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 1778: OT 3112
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'KAUFFMAN' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'KAUFFMAN', '', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'TTXS87' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'TTXS87', 'MERCEDES', 'A35', 2025, 'BLANCO', 0) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '3112', 'TTXS87', 'CATBACK COMPLETO+SILENCIADOR+ALTOFLUJO BORLA +VALVULAS MERCEDES', 'CATBACK COMPLETO+SILENCIADOR+ALTOFLUJO BORLA +VALVULAS MERCEDES', 929900, 'completada', '2025-08-18');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 1779: OT 3113
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'COMERCIAL GENERICALTDA' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'COMERCIAL GENERICALTDA', '76675428-7', '979792115', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'RBSJ44' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'RBSJ44', 'CHEVROLET', 'SILVERADO', 2021, 'BLANCO', 64000) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '3113', 'RBSJ44', 'REEMPLAZO SILENCIADOR ORIGINAL POR ALTO FLUJO WICKED FLOW', 'REEMPLAZO SILENCIADOR ORIGINAL POR ALTO FLUJO WICKED FLOW', 299900, 'completada', '2025-08-18');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 1780: OT 3114
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'OSCAR ARAYA' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'OSCAR ARAYA', '17252873-2', '992115222', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'SIN-PAT' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'SIN-PAT', 'BMW', '120', 0, 'S/C', 0) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '3114', 'SIN-PAT', 'RECUBRIMIENTO TERMICO', 'RECUBRIMIENTO TERMICO', 99900, 'completada', '2025-08-18');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 1781: OT 3115
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'MARIO BARRIOS' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'MARIO BARRIOS', '1336072-7', '997192431', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'SVBB98' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'SVBB98', 'SUBARU', 'WRX', 2023, 'GRIS', 20000) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '3115', 'SVBB98', 'MODIFICACION AXLE BACK + ALTO FLUJO VIBRANT', 'MODIFICACION AXLE BACK + ALTO FLUJO VIBRANT', 599900, 'completada', '2025-08-20');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 1782: OT 3116
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'JUAN LUIS GARCIA' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'JUAN LUIS GARCIA', '16427611-2', '933575070', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'TKYJ70' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'TKYJ70', 'CHEVROLET', 'SILVERADO', 2024, 'AZUL', 30000) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '3116', 'TKYJ70', 'CUT-OUT + 1 CONTROL Y 1 AÑO DE GARANTIA', 'CUT-OUT + 1 CONTROL Y 1 AÑO DE GARANTIA', 449900, 'completada', '2025-08-20');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 1783: OT 3117
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'JOSE PEREZ' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'JOSE PEREZ', '18039340-4', '994165915', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'PKSR38' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'PKSR38', 'RAM', '1500', 2019, 'GRIS', 43000) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '3117', 'PKSR38', 'DESINTALACION CUT OUT', 'DESINTALACION CUT OUT', 99900, 'completada', '2025-08-20');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 1784: OT 3118
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'ALEXIS BARRALES' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'ALEXIS BARRALES', '14911070-4', '965599463', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'LKTT96' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'LKTT96', 'DODGE', 'DURANGO', 2019, 'GRIS', 75000) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '3118', 'LKTT96', 'DOBLE CUT-OUT REMOVER SILENCIADORES + MODIFICACION', 'DOBLE CUT-OUT REMOVER SILENCIADORES + MODIFICACION', 1179800, 'completada', '2025-08-21');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 1785: OT 3119
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'CRISTIAN ZAMORANO' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'CRISTIAN ZAMORANO', '19526953-K', '958827504', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'KLJH41' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'KLJH41', 'AUDI', 'A35', 2018, 'GRIAS', 55000) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '3119', 'KLJH41', 'MUFFLER CENTERDELETE +XLEBACK FREE+4COLAS INSTALACION DIFUSOR +ALTOFLUJOSILEN PRO', 'MUFFLER CENTERDELETE +XLEBACK FREE+4COLAS INSTALACION DIFUSOR +ALTOFLUJOSILEN PRO', 799900, 'completada', '2025-08-22');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 1786: OT 3120
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'MATEO GARAY' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'MATEO GARAY', '22414303-6', '934133203', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'KCDW53' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'KCDW53', 'LEXUS', 'IS 200 T', 2018, 'BLANCO', 40111) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '3120', 'KCDW53', 'FALLA ECU STAGE 2+37HP+65NM', 'FALLA ECU STAGE 2+37HP+65NM', 1, 'completada', '2025-08-25');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 1787: OT 3121
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'ABRAHAM MUÑOZ' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'ABRAHAM MUÑOZ', '20190004-2', '973390266', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'HCLW94' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'HCLW94', 'FORD', 'MUSTANG', 2015, 'ROJO', 77000) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '3121', 'HCLW94', 'X-PIPE COLAS NUEVS NEGRAS', 'X-PIPE COLAS NUEVS NEGRAS', 399800, 'completada', '2025-08-25');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 1788: OT 3122
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'YERKO PIZARRO' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'YERKO PIZARRO', '20778825-2', '950788263', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'JCZG79' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'JCZG79', 'MERCEDES', 'A200', 2016, 'VERDE', 0) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '3122', 'JCZG79', 'REINSTALACION DE LINEA+SOPORTES NUEVOS', 'REINSTALACION DE LINEA+SOPORTES NUEVOS', 184900, 'completada', '2025-08-25');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 1789: OT 3123
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'MARTIN PEÑA' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'MARTIN PEÑA', '21538045-9', '976135806', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'HKPS90' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'HKPS90', 'BMW', '120I', 2016, 'GRIS', 64000) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '3123', 'HKPS90', 'AXLE BACK FREE+STAGE 1+28HP+65NM', 'AXLE BACK FREE+STAGE 1+28HP+65NM', 749800, 'completada', '2025-08-25');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 1790: OT 3124
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'JOSE MANUEL BELLATA' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'JOSE MANUEL BELLATA', '14906850-3', '993293578', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'KWDZ68' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'KWDZ68', 'AUDI', 'S5', 2019, 'GRIS', 65000) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '3124', 'KWDZ68', 'X-PIPE', 'X-PIPE', 299900, 'completada', '2025-08-26');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 1791: OT 3125
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'GONZALO LOPEZ' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'GONZALO LOPEZ', '18717359-0', '942886100', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'KLGS32' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'KLGS32', 'BMW', '120I', 2018, 'GRIS', 74600) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '3125', 'KLGS32', 'DOWNPIPE', 'DOWNPIPE', 379900, 'completada', '2025-08-26');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 1792: OT 3126
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'RAUL CASTRO' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'RAUL CASTRO', '18406991-1', '94419592', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'JHVP17' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'JHVP17', 'VW', 'BORA', 2017, 'GRIS', 88000) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '3126', 'JHVP17', 'REPRO STAGE 1+AXLE BACK FREE+ COLAS', 'REPRO STAGE 1+AXLE BACK FREE+ COLAS', 544900, 'completada', '2025-08-27');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 1793: OT 3127
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'ANDRES ROJAS' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'ANDRES ROJAS', '13191477-6', '993235737', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'SIN-PAT' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'SIN-PAT', 'FORD', 'RANGER', 2014, 'BLANCO', 13000) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '3127', 'SIN-PAT', 'STAGE 1 UNLOCK + CAMBIOS EN BUJIAS+ GASOLINA', 'STAGE 1 UNLOCK + CAMBIOS EN BUJIAS+ GASOLINA', 1289900, 'completada', '2025-08-27');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 1794: OT 3128
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'PEPE AUDIO' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'PEPE AUDIO', '', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'KZBB885' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'KZBB885', 'TOYOTA', 'RAM', 2019, 'GRIS', 1500) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '3128', 'KZBB885', 'DPF+REPROGRAMACION', 'DPF+REPROGRAMACION', 579900, 'completada', '2025-08-27');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 1795: OT 3129
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'PATRICIO MACAYA' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'PATRICIO MACAYA', '8982802-3', '942954206', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'XR6937' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'XR6937', 'CHEVROLET', 'SILVERADO', 2004, 'GRIS', 206000) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '3129', 'XR6937', 'INSTALACION SILENCIADOR ORIGINAL +COLA DE ESCAPE NUEVA', 'INSTALACION SILENCIADOR ORIGINAL +COLA DE ESCAPE NUEVA', 269900, 'completada', '2025-08-27');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 1796: OT 3130
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'CAMILO ALARCON' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'CAMILO ALARCON', '17086735-1', '984098715', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'FTGL76' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'FTGL76', 'SKODA', 'FABIA', 2013, 'PLATA', 215000) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '3130', 'FTGL76', 'DOWNPIPE+DPF,EGROFF', 'DOWNPIPE+DPF,EGROFF', 679800, 'completada', '2025-08-28');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 1797: OT 3131
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'ALLEM ANTUNEZ' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'ALLEM ANTUNEZ', '20785549-9', '931225696', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'GSBL62' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'GSBL62', 'AUDI', 'A35', 2014, 'BLANCO', 148000) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '3131', 'GSBL62', 'DOWNPIPE+LINEA INOX+ALTOFLUJO+COLA NEGRA +STAGE 2', 'DOWNPIPE+LINEA INOX+ALTOFLUJO+COLA NEGRA +STAGE 2', 1414700, 'completada', '2025-08-28');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 1798: OT 3132
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'GABRIEL ARREDONDO' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'GABRIEL ARREDONDO', '20139198-9', '979243792', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'DWKS49' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'DWKS49', 'VW', 'VENTO', 2012, 'PLATA', 170000) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '3132', 'DWKS49', 'MUFFLER DELETE + AXLE BACK FREE +COLA DOBLE', 'MUFFLER DELETE + AXLE BACK FREE +COLA DOBLE', 255000, 'completada', '2025-08-29');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 1799: OT 3133
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'ANGEL FARIÑA' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'ANGEL FARIÑA', '', '988079637', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'VFRV77' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'VFRV77', 'VW', 'JETTA', 2025, 'GRIS', 2000) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '3133', 'VFRV77', 'CUT-OUT ALTO FLUJO WICKEDFLOW', 'CUT-OUT ALTO FLUJO WICKEDFLOW', 670000, 'completada', '2025-08-29');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 1800: OT 3134
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'JALIL HAMED' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'JALIL HAMED', '19391111-0', '978529764', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'DE4908' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'DE4908', 'BMW', '316', 1990, 'BEIGE', 250000) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '3134', 'DE4908', 'INSTALACION HIP FRONTAL +AXLEBACKFREE', 'INSTALACION HIP FRONTAL +AXLEBACKFREE', 239900, 'completada', '2025-08-29');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    RAISE NOTICE 'Procesados 1800 registros...';
    -- Fila 1801: OT 3135
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'DIESEL TUNING' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'DIESEL TUNING', '76319264-4', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'JDCS50' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'JDCS50', 'CHEVROLET', 'SILVERADO', 2019, 'NEGRO', 0) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '3135', 'JDCS50', 'REEMPLAZO SILENCIADOR ORIGINAL POR ALTO FLUJO', 'REEMPLAZO SILENCIADOR ORIGINAL POR ALTO FLUJO', 249900, 'completada', '2025-09-01');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 1802: OT 3136
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'PATRICIO TORRES' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'PATRICIO TORRES', '12464460-7', '964813348', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'WD9463' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'WD9463', 'FORD', 'MUSTANG', 2000, 'ROJO', 115000) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '3136', 'WD9463', 'INSTALACION INTAKE AIR', 'INSTALACION INTAKE AIR', 199900, 'completada', '2025-09-01');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 1803: OT 3137
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'KAUFFMAN' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'KAUFFMAN', '', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'VFYX14' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'VFYX14', 'MERCEDES', 'A45S', 2025, 'GRIS', 1500) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '3137', 'VFYX14', 'CATBACK + BORLA +VALVULA+ORIGINAL MERCEDES', 'CATBACK + BORLA +VALVULA+ORIGINAL MERCEDES', 919900, 'completada', '2025-09-01');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 1804: OT 3138
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'DAN GALDAMES' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'DAN GALDAMES', '17152517-9', '951753610', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'DSGZ46' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'DSGZ46', 'TOYOTA', 'FJ CRUISER', 2012, 'BLANCO', 100000) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '3138', 'DSGZ46', 'REPARACION FISURA CATALIZADOR + SOPORTES NUEVOS', 'REPARACION FISURA CATALIZADOR + SOPORTES NUEVOS', 339900, 'completada', '2025-09-02');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 1805: OT 3139
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'MATEO MONTERO' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'MATEO MONTERO', '21818744-7', '955302628', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'VCTJ31' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'VCTJ31', 'VW', 'POLO', 2025, 'BLANCO', 4000) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '3139', 'VCTJ31', 'MUFFLER DELETE', 'MUFFLER DELETE', 84900, 'completada', '2025-09-02');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 1806: OT 3140
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'PABLO OJEDA' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'PABLO OJEDA', '15913687-6', '988041779', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'PSKK71' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'PSKK71', 'BMW', '430', 2021, 'AZUL', 0) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '3140', 'PSKK71', 'AXLE BACK +VALVULA ORIGINAL BMW +COLAS NUEVS +WICKED FLOW+PINTURA', 'AXLE BACK +VALVULA ORIGINAL BMW +COLAS NUEVS +WICKED FLOW+PINTURA', 937700, 'completada', '2025-09-02');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 1807: OT 3141
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'CRISTOFER MORALES' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'CRISTOFER MORALES', '20964108-9', '971593235', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'VHVY99' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'VHVY99', 'SUBARU', 'WRX', 2025, 'NARANJO', 500) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '3141', 'VHVY99', 'MULTIPLE + CUT-OUT', 'MULTIPLE + CUT-OUT', 1849800, 'completada', '2025-09-03');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 1808: OT 3142
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'TOMAS ANDREWS' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'TOMAS ANDREWS', '19401392-2', '982486005', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'CTTG43' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'CTTG43', 'FORD', 'EXPLORER', 2011, 'ROJO', 160000) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '3142', 'CTTG43', 'CUT-OUT + AXLE BACK +COLAS NEGRAS DOBLES 4"', 'CUT-OUT + AXLE BACK +COLAS NEGRAS DOBLES 4"', 789900, 'completada', '2025-09-04');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 1809: OT 3143
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'DANIEL MACIAS' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'DANIEL MACIAS', '19336658-9', '936973076', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'SCLV45' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'SCLV45', 'BMW', '330I', 2022, 'BLANCO', 43000) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '3143', 'SCLV45', 'INSTALACIÓN ESCAPE FF CON CUT OUT + DOWNPIPE', 'INSTALACIÓN ESCAPE FF CON CUT OUT + DOWNPIPE', 260000, 'completada', '2025-09-04');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 1810: OT 3144
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'CHRISTIAN WAGNER' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'CHRISTIAN WAGNER', '21199141-0', '936485351', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'LHFH60' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'LHFH60', 'AUDI', 'A3', 2019, 'GRIS', 115000) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '3144', 'LHFH60', 'DOWNPIPE + STAGE 2', 'DOWNPIPE + STAGE 2', 729800, 'completada', '2025-09-05');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 1811: OT 3145
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'SADY AGUILAR' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'SADY AGUILAR', '13404691-0', '957610073', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'TCGP82' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'TCGP82', 'CUPRA', 'LEON VZ', 2024, 'BLANCO', 30000) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '3145', 'TCGP82', 'STAGE 1', 'STAGE 1', 454800, 'completada', '2025-09-05');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 1812: OT 3146
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'ROBERTO PINO' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'ROBERTO PINO', '13904948-9', '979883625', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'SIN-PAT' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'SIN-PAT', 'LOTUS', 'EVORA', 2012, 'GRIS', 18000) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '3146', 'SIN-PAT', 'ESCAPES', 'ESCAPES', 499900, 'completada', '2025-09-05');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 1813: OT 3147
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'KAUFFMAN' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'KAUFFMAN', '', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'SIN-PAT' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'SIN-PAT', 'MERCEDES', 'GLC 63S', 2020, 'S/C', 0) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '3147', 'SIN-PAT', 'REINSTALACION DE SILENCIADOR ORIGINAL', 'REINSTALACION DE SILENCIADOR ORIGINAL', 450000, 'completada', '2025-09-05');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 1814: OT 3148
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'NICOLAS ROJAS' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'NICOLAS ROJAS', '16833686-1', '940924562', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'SIN-PAT' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'SIN-PAT', 'STARKEN', 'S/M', 0, 'S/C', 0) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '3148', 'SIN-PAT', 'WICKED FLOW KAMIZAKE 250 ENVIO A COQUIMBO', 'WICKED FLOW KAMIZAKE 250 ENVIO A COQUIMBO', 229900, 'completada', '2025-09-05');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 1815: OT 3149
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'LUCIANO GONZALEZ' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'LUCIANO GONZALEZ', '19551420-8', '988246809', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'GFTY28' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'GFTY28', 'HYUNDAI', 'GENESIS', 2014, 'BLANCO', 143000) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '3149', 'GFTY28', 'MEDIA LINEA + CUT OUT+ WICKED FLOW WFR254009', 'MEDIA LINEA + CUT OUT+ WICKED FLOW WFR254009', 1669900, 'completada', '2025-09-08');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 1816: OT 3150
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'ETHAN CHRISTIANSEN' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'ETHAN CHRISTIANSEN', '22497801-4', '938629240', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'PTGD17' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'PTGD17', 'BMW', '240', 2021, 'GRIS', 42100) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '3150', 'PTGD17', 'AXLE BACK FREE', 'AXLE BACK FREE', 239900, 'completada', '2025-09-08');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 1817: OT 3151
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'SARRET SPA' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'SARRET SPA', '77963574-0', '996790415', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'FPRJ64' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'FPRJ64', 'BMW', 'Z4', 2013, 'GRIS', 74000) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '3151', 'FPRJ64', 'REPARACION DE ESCAPE', 'REPARACION DE ESCAPE', 279900, 'completada', '2025-09-08');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 1818: OT 3152
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'RICHARD PEREZ' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'RICHARD PEREZ', '18321505-1', '995624839', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'SIN-PAT' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'SIN-PAT', 'STARKEN', 'S/M', 0, 'S/C', 0) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '3152', 'SIN-PAT', 'STARKEN WICKED FLOW 129.900', 'STARKEN WICKED FLOW 129.900', 359800, 'completada', '2025-09-08');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 1819: OT 3153
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'GABRIEL VEGA' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'GABRIEL VEGA', '16701149-7', '934432510', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'VDDV82' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'VDDV82', 'SUZUKI', 'JIMNY', 2025, 'PLATA', 11500) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '3153', 'VDDV82', 'LINEA + BORLA + 3" + SPRINTBOOSTER', 'LINEA + BORLA + 3" + SPRINTBOOSTER', 959800, 'completada', '2025-09-09');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 1820: OT 3154
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'HERNAN RETAMAL' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'HERNAN RETAMAL', '16201989-9', '930050963', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'JPTR45' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'JPTR45', 'SUBARU', 'IMPREZA', 2017, 'BLANCO', 102000) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '3154', 'JPTR45', 'COLAS DOBLES + CUT OUT 729.900 + 119.900 + 1.128.000', 'COLAS DOBLES + CUT OUT 729.900 + 119.900 + 1.128.000', 1128000, 'completada', '2025-09-09');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 1821: OT 3155
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'ALLEM ANTUNEZ' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'ALLEM ANTUNEZ', '20785549-9', '931225690', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'GSBL62' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'GSBL62', 'AUDI', 'A3', 2014, 'BLANCO', 149000) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '3155', 'GSBL62', 'REPARACION', 'REPARACION', 60000, 'completada', '2025-09-09');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 1822: OT 3156
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'ESTEBAN CABEZAS' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'ESTEBAN CABEZAS', '16017248-7', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'WK6156' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'WK6156', 'FORD', 'F350', 2000, 'NEGRO', 0) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '3156', 'WK6156', 'REPARACIÓN DE ESCAPE', 'REPARACIÓN DE ESCAPE', 199900, 'completada', '2025-09-09');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 1823: OT 3157
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'ALVARO OTTO' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'ALVARO OTTO', '13773815-7', '998108382', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'SIN-PAT' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'SIN-PAT', 'MERCEDES', 'GLC43', 2019, 'S/C', 0) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '3157', 'SIN-PAT', 'INSTALACIÓN 2 BORLA POR XS ABONO $400.000', 'INSTALACIÓN 2 BORLA POR XS ABONO $400.000', 639800, 'completada', '2025-09-09');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 1824: OT 3158
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'RAUL CASTRO' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'RAUL CASTRO', '18406991-1', '994419592', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'JHVP17' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'JHVP17', 'VW', 'BORA', 2017, 'GRIS', 88000) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '3158', 'JHVP17', 'SPRINTBOOSTER', 'SPRINTBOOSTER', 279900, 'completada', '2025-09-09');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 1825: OT 3159
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'MATIAS PARADA' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'MATIAS PARADA', '21692296-4', '972662890', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'KHGJ83' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'KHGJ83', 'VW', 'GOLF  GTI', 2018, 'BLANCO', 95000) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '3159', 'KHGJ83', 'INSTALACIÓN SILENCIADOR SMG COLAS CROMO', 'INSTALACIÓN SILENCIADOR SMG COLAS CROMO', 1684800, 'completada', '2025-09-10');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 1826: OT 3160
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'DIEGO ARCE' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'DIEGO ARCE', '20203607-4', '991838883', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'KVTH45' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'KVTH45', 'BMW', '12Oi', 2019, 'GRIS', 46000) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '3160', 'KVTH45', 'SILENCIADOR SMG + COLAS', 'SILENCIADOR SMG + COLAS', 1190000, 'completada', '2025-09-10');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 1827: OT 3161
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'JOSE IGNACIO IRIGOITIA' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'JOSE IGNACIO IRIGOITIA', '20429098-9', '961132108', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'FWJG16' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'FWJG16', 'MERCEDES', 'CLS63', 2014, 'PLATA', 36580) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '3161', 'FWJG16', 'X-PIPE', 'X-PIPE', 220000, 'completada', '2025-09-10');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 1828: OT 3162
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'JAVIER RIOS' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'JAVIER RIOS', '19182713-9', '997865566', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'PZJY67' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'PZJY67', 'FORD', 'F150', 2021, 'AZUL', 64000) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '3162', 'PZJY67', 'SILENCIADOR SMG 1 ENT 1 SAL + SALIDA DOBLE UNA COLA A CADA LADO NEGRA 4"', 'SILENCIADOR SMG 1 ENT 1 SAL + SALIDA DOBLE UNA COLA A CADA LADO NEGRA 4"', 1199800, 'completada', '2025-09-11');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 1829: OT 3163
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'CARLOS ENCINA' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'CARLOS ENCINA', '11344182-8', '976991625', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'SLBZ72' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'SLBZ72', 'CUPRA', 'FORMENTOR', 2023, 'GRIS', 30500) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '3163', 'SLBZ72', 'SILENCIADOR SMG 1 ENTR 2 SALID + COLAS DOBLES 4"+ BMC ALTO FLUJO+SPRINTBOOSTER', 'SILENCIADOR SMG 1 ENTR 2 SALID + COLAS DOBLES 4"+ BMC ALTO FLUJO+SPRINTBOOSTER', 1964700, 'completada', '2025-09-11');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 1830: OT 3164
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'KAUFMANN' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'KAUFMANN', '', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'SIN-PAT' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'SIN-PAT', 'MERCEDES', 'S/M', 0, 'S/C', 0) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '3164', 'SIN-PAT', 'REPARACIÓN DOWNPIPE', 'REPARACIÓN DOWNPIPE', 214200, 'completada', '2025-09-11');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 1831: OT 3165
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'JAIME RIFFO' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'JAIME RIFFO', '17740874-3', '965743456', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'PDGX96' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'PDGX96', 'RENAULT', 'MEGANE', 2021, 'NARANJO', 50000) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '3165', 'PDGX96', 'SILENCIADOR SMG', 'SILENCIADOR SMG', 750000, 'completada', '2025-09-12');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 1832: OT 3166
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'MATIAS GONZALEZ' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'MATIAS GONZALEZ', '18880514-0', '991257842', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'X' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'X', 'CAN AM', 'MAVERICK X3', 2023, 'NARANJO', 200) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '3166', 'X', 'CUT-OUT MAS BOTON', 'CUT-OUT MAS BOTON', 380000, 'completada', '2025-09-12');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 1833: OT 3167
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'JOSE BARRA' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'JOSE BARRA', '20426643-3', '966615883', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'LIEBRE' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'LIEBRE', 'HOTWHEELS', 'LIEBRE', 0, 'NEGRO', 0) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '3167', 'LIEBRE', 'PROTECTOR TERMICO', 'PROTECTOR TERMICO', 0, 'completada', '2025-09-12');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 1834: OT 3168
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'DIEGO SOLAR' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'DIEGO SOLAR', '17172001-K', '942718806', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'LGBP17' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'LGBP17', 'MERCEDES', 'A250', 2017, 'GRIS', 0) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '3168', 'LGBP17', 'REPARACIÓN', 'REPARACIÓN', 35000, 'completada', '2025-09-12');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 1835: OT 3169
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'HANS DORVILNE' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'HANS DORVILNE', '25824210-6', '974700299', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'PLDH39' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'PLDH39', 'BMW', 'X1 S DRIVE 20I', 2021, 'BLANCO', 46000) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '3169', 'PLDH39', 'MODULO CUT OUT + MUFFLER CENTER DELETE + COLAS NUEVAS', 'MODULO CUT OUT + MUFFLER CENTER DELETE + COLAS NUEVAS', 710000, 'completada', '2025-09-15');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 1836: OT 3170
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'FERNANDO SILBERMAN' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'FERNANDO SILBERMAN', '7480510-8', '995379882', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'KGBV50' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'KGBV50', 'TOYOTA', 'HILUX', 2018, 'BLANCO', 131000) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '3170', 'KGBV50', 'REVISIÓN', 'REVISIÓN', 35000, 'completada', '2025-09-15');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 1837: OT 3171
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'MICHAEL RADEMACHER' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'MICHAEL RADEMACHER', '16562471-8', '954030534', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'PDKL34' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'PDKL34', 'JEEP', 'GLADIATOR', 2021, 'GRIS', 47800) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '3171', 'PDKL34', 'REPARACIÓN', 'REPARACIÓN', 79900, 'completada', '2025-09-15');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 1838: OT 3172
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'PABLO PANGUIMAO' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'PABLO PANGUIMAO', '17580501-K', '953338125', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'DYVS90' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'DYVS90', 'CHEVROLET', 'SONIC', 2012, 'GRIS', 127000) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '3172', 'DYVS90', 'REPRO STAGE 1 GANACIAS +10hp +12nm', 'REPRO STAGE 1 GANACIAS +10hp +12nm', 249900, 'completada', '2025-09-15');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 1839: OT 3173
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'RICARDO MIRANDA' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'RICARDO MIRANDA', '20478613-5', '945098464', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'SWWW10' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'SWWW10', 'CHEVROLET', 'SILVERADO', 2023, 'BLANCO', 42000) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '3173', 'SWWW10', 'CUT-OUT MAS ALTO FLUJO BMC FILTOR', 'CUT-OUT MAS ALTO FLUJO BMC FILTOR', 330000, 'completada', '2025-09-16');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 1840: OT 3174
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'SEBASTIAN OLIVARES' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'SEBASTIAN OLIVARES', '17642926-7', '994645877', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'PRFF33' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'PRFF33', 'ALFA ROMEO', 'GIULIA', 2021, 'NEGRO', 40000) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '3174', 'PRFF33', 'REPRO STAGE 1 GANACIAS', 'REPRO STAGE 1 GANACIAS', 379900, 'completada', '2025-09-16');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 1841: OT 3175
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'ANDRÉS ANGULO' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'ANDRÉS ANGULO', '17667952-2', '997564383', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'TYC57' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'TYC57', 'YAMAHA', 'MT07', 2021, 'NEGRO', 22000) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '3175', 'TYC57', 'CUT-OUT MOTO', 'CUT-OUT MOTO', 299900, 'completada', '2025-09-16');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 1842: OT 3176
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'DANIEL MARTINEAU' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'DANIEL MARTINEAU', '19163204-4', '968405814', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'JTZF80' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'JTZF80', 'BMW', '120i', 2017, 'AZUL', 100000) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '3176', 'JTZF80', 'MUFFLER DELETE X2 + ACOMODAR CUT OUT', 'MUFFLER DELETE X2 + ACOMODAR CUT OUT', 250000, 'completada', '2025-09-16');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 1843: OT 3177
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'FRANCISCO ARIAS' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'FRANCISCO ARIAS', '16935920-2', '990500285', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'FWCY76' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'FWCY76', 'BMW', 'Z3', 2000, 'ROJO', 93000) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '3177', 'FWCY76', 'SILENCIADOR ALTO FLUJO BORLA + COLA ESCAPE DOBLE 3"', 'SILENCIADOR ALTO FLUJO BORLA + COLA ESCAPE DOBLE 3"', 454900, 'completada', '2025-09-16');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 1844: OT 3178
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'PABLO CISTERNAS' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'PABLO CISTERNAS', '20814909-8', '967768433', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'KXLX66' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'KXLX66', 'VW', 'POLO', 2019, 'GRIS', 66000) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '3178', 'KXLX66', 'AXLE BACK', 'AXLE BACK', 229900, 'completada', '2025-09-22');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 1845: OT 3179
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'ALEJANDRO ISLA' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'ALEJANDRO ISLA', '20226694-0', '984159282', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'SIN-PAT' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'SIN-PAT', 'FLOWMASTER', 'S/M', 0, 'S/C', 0) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '3179', 'SIN-PAT', 'STARKEN LOS ANGELES', 'STARKEN LOS ANGELES', 219900, 'completada', '2025-09-22');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 1846: OT 3180
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'JAIRO HERRERA' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'JAIRO HERRERA', '20573760-K', '945528128', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'KWSK10' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'KWSK10', 'MERCEDES', 'A250', 2019, 'GRIS', 102000) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '3180', 'KWSK10', 'AXLE BACK', 'AXLE BACK', 249900, 'completada', '2025-09-22');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 1847: OT 3181
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'CHRISTIAN DELASOTTA' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'CHRISTIAN DELASOTTA', '15355291-6', '962478641', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'SSVR10' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'SSVR10', 'BMW', '440I', 2023, 'BLANCO', 16776) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '3181', 'SSVR10', 'SILENCIADOR SMG + AXLE BACK CLIENTE TRAE LAS COLAS', 'SILENCIADOR SMG + AXLE BACK CLIENTE TRAE LAS COLAS', 990000, 'completada', '2025-09-22');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 1848: OT 3182
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'CAMILO VILCHES' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'CAMILO VILCHES', '18.475.448-7', '976439540', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'SIN-PAT' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'SIN-PAT', 'STARKEN', 'S/M', 0, 'S/C', 0) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '3182', 'SIN-PAT', 'ENVIO A TALCA', 'ENVIO A TALCA', 1079601, 'completada', '2025-09-24');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 1849: OT 3183
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'MARCEL LOBOS' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'MARCEL LOBOS', '17909515-7', '947074377', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'JKSW38' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'JKSW38', 'VW', 'SIROCCO', 2017, 'AZUL', 152000) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '3183', 'JKSW38', 'DESPLAZAR CUT-OUT MAS ATRÁS', 'DESPLAZAR CUT-OUT MAS ATRÁS', 50000, 'completada', '2025-09-24');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 1850: OT 3184
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'ARIEL BUROTTO' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'ARIEL BUROTTO', '12866963-9', '996430510', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'SIN-PAT' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'SIN-PAT', 'SUBARU', 'IMPREZA', 0, 'S/C', 12500) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '3184', 'SIN-PAT', 'CATBACK  + WICKED FLOW DEMON + COLAS DOBLES 4" NEGRA', 'CATBACK  + WICKED FLOW DEMON + COLAS DOBLES 4" NEGRA', 849900, 'completada', '2025-09-24');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 1851: OT 3185
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'JULIO AGUILERA' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'JULIO AGUILERA', '11624654-6', '965949596', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'CWLR47' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'CWLR47', 'DODGE', 'DAKOTA', 2011, 'NEGRO', 134000) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '3185', 'CWLR47', 'INSTALACIÓN SILENCIADOR  ALTO FLUJO MAGNAFLOW', 'INSTALACIÓN SILENCIADOR  ALTO FLUJO MAGNAFLOW', 289900, 'completada', '2025-09-24');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 1852: OT 3186
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'BASTIAN VERA' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'BASTIAN VERA', '19069281-7', '945418752', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'HHRD38' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'HHRD38', 'MINI', 'COOPER S', 2015, 'GRIS', 110000) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '3186', 'HHRD38', 'SILENCIADOR SMG CON VALVULAS 1 CONTROL REMOTO, REMOVER SILENCIADOR MAS COLAS NUEVAS EN 3.5', 'SILENCIADOR SMG CON VALVULAS 1 CONTROL REMOTO, REMOVER SILENCIADOR MAS COLAS NUEVAS EN 3.5', 849990, 'completada', '2025-09-25');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 1853: OT 3187
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'MARTIN CAMPOS' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'MARTIN CAMPOS', '20623838-0', '933818654', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'JXXR73' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'JXXR73', 'MB', 'C43', 2018, 'NEGRO', 110000) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '3187', 'JXXR73', 'CATBACK MAS SOPORTES MAS SMG MAS DEMOND', 'CATBACK MAS SOPORTES MAS SMG MAS DEMOND', 2200000, 'completada', '2025-09-25');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 1854: OT 3188
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'ALEX CORDERO' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'ALEX CORDERO', '26064144-1', '930035421', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'SIN-PAT' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'SIN-PAT', 'AUDI', 'TT', 2017, 'NEGRO', 70000) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '3188', 'SIN-PAT', 'AXLE BACK', 'AXLE BACK', 280000, 'completada', '2025-09-25');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 1855: OT 3189
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'FELIPE CARO' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'FELIPE CARO', '16227982-3', '998729654', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'SIN-PAT' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'SIN-PAT', 'FORD', 'F150', 0, 'S/C', 0) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '3189', 'SIN-PAT', 'VENTA KAMIKAZE', 'VENTA KAMIKAZE', 229900, 'completada', '2025-09-25');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 1856: OT 3190
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'MKL SERVICIOS' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'MKL SERVICIOS', '76157462-0', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'SIN-PAT' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'SIN-PAT', 'S/M', 'S/M', 0, 'S/C', 0) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '3190', 'SIN-PAT', 'ENVIO A LA SERENA CUT-OUT', 'ENVIO A LA SERENA CUT-OUT', 379900, 'completada', '2025-09-26');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 1857: OT 3191
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'JOSE LUIS NEIRA' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'JOSE LUIS NEIRA', '13828332-1', '974087032', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'PGVD49' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'PGVD49', 'CHEVROLET', 'SILVERADO', 2021, 'GRIS', 97000) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '3191', 'PGVD49', 'REPARACIÓN CUT OUT', 'REPARACIÓN CUT OUT', 50000, 'completada', '2025-09-26');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 1858: OT 3192
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'MARCELO REYES' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'MARCELO REYES', '9702514-2', '992840102', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'PDRZ47' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'PDRZ47', 'VW', 'GOLF R', 2021, 'BLANCO', 45000) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '3192', 'PDRZ47', 'INSTALACIÓN CUT', 'INSTALACIÓN CUT', 582900, 'completada', '2025-09-29');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 1859: OT 3193
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'MATIAS VALENZUELA' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'MATIAS VALENZUELA', '20727609-K', '990975515', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'RXXB93' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'RXXB93', 'FORD', 'F150', 2022, 'BLANCO', 147000) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '3193', 'RXXB93', 'CUT OUT CON CONTROL', 'CUT OUT CON CONTROL', 449900, 'completada', '2025-09-29');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 1860: OT 3194
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'CRISTOPHER BRAVO' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'CRISTOPHER BRAVO', '17877949-4', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'VHXD34' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'VHXD34', 'BMW', '240I X', 2025, 'GRIS', 5549) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '3194', 'VHXD34', 'INSTALACIÓN LINEA IMPORTADA FI', 'INSTALACIÓN LINEA IMPORTADA FI', 100000, 'completada', '2025-09-29');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 1861: OT 3195
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'GUILLERMO MESIAS' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'GUILLERMO MESIAS', '10718824-K', '999149916', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'SIN-PAT' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'SIN-PAT', 'CHRISLER', 'PACIFICA', 2005, 'S/C', 0) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '3195', 'SIN-PAT', 'SOLDADURA PIEZA', 'SOLDADURA PIEZA', 30000, 'completada', '2025-09-29');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 1862: OT 3196
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'JOSE' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'JOSE', '', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'SIN-PAT' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'SIN-PAT', 'FORD', 'MUSTANG', 0, 'S/C', 0) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '3196', 'SIN-PAT', 'REMOVER CATALITICOS + REPRO STAGE 2', 'REMOVER CATALITICOS + REPRO STAGE 2', 850000, 'completada', '2025-09-29');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 1863: OT 3197
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'CRISTOBAL VARGAS LAMA' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'CRISTOBAL VARGAS LAMA', '22563352-3', '991350249', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'GYYB21' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'GYYB21', 'VW', 'AMAROK', 2916, 'BLANCO', 216000) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '3197', 'GYYB21', 'CATBACK + WICKED FLOW BALA', 'CATBACK + WICKED FLOW BALA', 719900, 'completada', '2025-09-30');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 1864: OT 3198
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'PABLO ASTUDILLO' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'PABLO ASTUDILLO', '17065402-1', '982497196', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'HZHJ13' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'HZHJ13', 'BMW', '220I', 2016, 'NEGRO', 93000) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '3198', 'HZHJ13', 'CATBACK CLIENTE TRAE BORLA Y COLAS CARBONO', 'CATBACK CLIENTE TRAE BORLA Y COLAS CARBONO', 479900, 'completada', '2025-10-02');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 1865: OT 3199
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'MIRCO GOMEZ' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'MIRCO GOMEZ', '17317116-1', '967890365', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'SZZC99' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'SZZC99', 'CHEVROLET', 'TRAVERSE', 2023, 'BLANCO', 40000) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '3199', 'SZZC99', 'INSTALACION CATALITICOS MAGNAFLOW X2 MAS REPARACION FLEXIBLE', 'INSTALACION CATALITICOS MAGNAFLOW X2 MAS REPARACION FLEXIBLE', 690000, 'completada', '2025-10-02');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 1866: OT 3200
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'BASS AUDIO' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'BASS AUDIO', 'BASS AUDIO', 'BASS AUDIO', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'GCFH47' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'GCFH47', 'PORSCHE', 'CAYMAN S 918', 2014, 'AZUL', 40000) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '3200', 'GCFH47', 'LINEA + 2 SMG VALVETRONIC Y COLAS NUEVAS CROMO', 'LINEA + 2 SMG VALVETRONIC Y COLAS NUEVAS CROMO', 1990000, 'completada', '2025-10-02');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 1867: OT 3201
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'DIEGO VELASQUEZ' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'DIEGO VELASQUEZ', '76750260-5', '975298018', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'SIN' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'SIN', 'FORD', 'RANGER', 2026, 'NEGRO', 53) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '3201', 'SIN', 'REPRO STAGE 1', 'REPRO STAGE 1', 1270000, 'completada', '2025-10-02');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 1868: OT 3202
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'TENNYSON MARDONES' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'TENNYSON MARDONES', '15440586-0', '957184513', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'ENVIO' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'ENVIO', 'ENVIO', 'ENVIO', 0, 'ENVIO', 0) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '3202', 'ENVIO', 'DOWNPIPE B58', 'DOWNPIPE B58', 399900, 'completada', '2025-10-03');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 1869: OT 3203
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'JOSE MIGUEL PEREIRA' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'JOSE MIGUEL PEREIRA', '21323201-0', '948487921', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'JCYF25' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'JCYF25', 'BMW', '440I', 2017, 'NEGRO', 94000) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '3203', 'JCYF25', 'CUT OUT MAS MUFFLER DELETE', 'CUT OUT MAS MUFFLER DELETE', 500000, 'completada', '2025-10-03');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 1870: OT 3204
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'DAN GALDAMES' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'DAN GALDAMES', '17152517-9', '951753610', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'DSGZ46' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'DSGZ46', 'TOYOTA', 'FJ CRUISER', 2012, 'BLANCO', 105000) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '3204', 'DSGZ46', 'MULTIPLES IMPORTADOS + INSTALACIÓN', 'MULTIPLES IMPORTADOS + INSTALACIÓN', 1350000, 'completada', '2025-10-06');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 1871: OT 3205
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'IGNACIO SOTO' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'IGNACIO SOTO', '16796487-7', '979781882', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'TZVV89' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'TZVV89', 'BMW', 'M2', 2024, 'CELESTE', 14000) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '3205', 'TZVV89', 'CATBACK', 'CATBACK', 1990000, 'completada', '2025-10-06');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 1872: OT 3206
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'DIEGO VELASQUEZ' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'DIEGO VELASQUEZ', '76750260-5', '975298018', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'SIN PLACA' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'SIN PLACA', 'FORD', 'RANGER', 2026, 'NEGRO', 100) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '3206', 'SIN PLACA', 'COLAS DE ESCAPE NEGRA MATE 4"', 'COLAS DE ESCAPE NEGRA MATE 4"', 180000, 'completada', '2025-10-06');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 1873: OT 3207
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'MATHIAS TRINCADO' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'MATHIAS TRINCADO', '19617610-1', '949723676', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'LYGD30' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'LYGD30', 'SUBARU', 'IMPREZA STI', 2020, 'AZUL', 28500) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '3207', 'LYGD30', 'CUT OUT', 'CUT OUT', 450000, 'completada', '2025-10-08');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 1874: OT 3208
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'CAMILO GONZALEZ' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'CAMILO GONZALEZ', '17908195-4', '997069145', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'CDWS71' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'CDWS71', 'BMW', '550', 2010, 'BLANCO', 108000) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '3208', 'CDWS71', 'SILENCIADOR SMG MAS COLAS NUEVAS', 'SILENCIADOR SMG MAS COLAS NUEVAS', 704900, 'completada', '2025-10-08');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 1875: OT 3209
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'ALEXIS GANDARA' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'ALEXIS GANDARA', '18091970-8', '939171844', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'LKSH64' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'LKSH64', 'SUBARU', 'IMPREZA STI', 2019, 'BLANCO', 9000) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '3209', 'LKSH64', 'AXLE BACK FREE', 'AXLE BACK FREE', 479700, 'completada', '2025-10-08');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 1876: OT 3210
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'PATRICIO TORRES' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'PATRICIO TORRES', '12464460-7', '964813348', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'SP5996' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'SP5996', 'VW', 'ESCARABAJO', 1996, 'NEGRO', 100000) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '3210', 'SP5996', 'ESCAPE CUSTOM + CAMBIO CATALIZADOR', 'ESCAPE CUSTOM + CAMBIO CATALIZADOR', 450000, 'completada', '2025-10-08');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 1877: OT 3211
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'JAVIER RODRIGUEZ' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'JAVIER RODRIGUEZ', '16979450-2', '977377564', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'VKKP43' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'VKKP43', 'PEUGEOT', '308', 2026, 'ROJO', 1500) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '3211', 'VKKP43', 'CUT OUT + MUFFLER DELETE', 'CUT OUT + MUFFLER DELETE', 529900, 'completada', '2025-10-08');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 1878: OT 3212
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'JUAN REYES' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'JUAN REYES', '18780817-0', '950227999', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'FVJY20' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'FVJY20', 'BMW', '116i', 2013, 'BLANCO', 140000) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '3212', 'FVJY20', 'AXLE BACK FREE + COLAS 3.5" + STAGE 1', 'AXLE BACK FREE + COLAS 3.5" + STAGE 1', 699900, 'completada', '2025-10-09');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 1879: OT 3213
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'MATIAS ARAYA' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'MATIAS ARAYA', '18659608-0', '953778168', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'TRTV93' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'TRTV93', 'BMW', '420', 2024, 'GRIS', 5900) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '3213', 'TRTV93', 'CUT OUT CONTROL', 'CUT OUT CONTROL', 449900, 'completada', '2025-10-09');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 1880: OT 3214
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'CARLOS DIAZ' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'CARLOS DIAZ', '19546817-6', '986996237', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'RG4594' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'RG4594', 'VW', 'VENTO', 1997, 'BLANCO', 293000) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '3214', 'RG4594', 'CUT OUT CON BOTON', 'CUT OUT CON BOTON', 379900, 'completada', '2025-10-09');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 1881: OT 3215
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'HANS DORVILNE' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'HANS DORVILNE', '25824210-6', '974700299', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'PLDH39' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'PLDH39', 'BMW', 'X1', 2021, 'BLANCO', 46000) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '3215', 'PLDH39', 'TUNEBOX', 'TUNEBOX', 740000, 'completada', '2025-10-09');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 1882: OT 3216
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'HECTOR GAJARDO' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'HECTOR GAJARDO', '15607294-K', '926490387', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'SWTC42' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'SWTC42', 'VW', 'TIGUAN', 2023, 'GRIS', 36240) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '3216', 'SWTC42', 'REINSTALACIÓN ESCAPE', 'REINSTALACIÓN ESCAPE', 149900, 'completada', '2025-10-09');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 1883: OT 3217
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'KAUFMANN' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'KAUFMANN', 'KAUFMANN', 'KAUFMANN', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'JKWG43' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'JKWG43', 'MERCEDES', 'G500', 2017, 'GRIS', 0) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '3217', 'JKWG43', 'KAUFMANN', 'KAUFMANN', 800000, 'completada', '2025-10-09');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 1884: OT 3218
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'DONALD METALMACK' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'DONALD METALMACK', '78938070-8', '999761278', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'VLKW35' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'VLKW35', 'RAM', 'REBEL X', 2026, 'NEGRO', 200) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '3218', 'VLKW35', 'SILENCIADOR ALTO FLUJO', 'SILENCIADOR ALTO FLUJO', 429900, 'completada', '2025-10-09');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 1885: OT 3219
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'ERWIN HEVIA' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'ERWIN HEVIA', '8966931-6', '993097876', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'NJ7713' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'NJ7713', 'BMW', '540i', 1995, 'BURDEO', 220000) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '3219', 'NJ7713', 'CAMBIO DE CATALIZADORES', 'CAMBIO DE CATALIZADORES', 599900, 'completada', '2025-10-10');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 1886: OT 3220
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'SEBASTIAN AMPUERO' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'SEBASTIAN AMPUERO', '20429479-8', '992631632', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'RKDX65' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'RKDX65', 'BMW', '530', 2022, 'GRIS', 40000) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '3220', 'RKDX65', 'CUT OUT MAS MUFFLER DELETE', 'CUT OUT MAS MUFFLER DELETE', 529900, 'completada', '2025-10-10');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 1887: OT 3221
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'FRANCISCO AGUILERA' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'FRANCISCO AGUILERA', '19792459-4', '985298490', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'VKYP35' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'VKYP35', 'FORD', 'MUSTANG', 2026, 'AZUL GRIS', 123) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '3221', 'VKYP35', 'X-PIPE', 'X-PIPE', 249900, 'completada', '2025-10-10');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 1888: OT 3222
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'FRANCISCO AGUILERA' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'FRANCISCO AGUILERA', '19792459-4', '985298490', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'VJKC30' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'VJKC30', 'FORD', 'MUSTANG', 2026, 'NEGRO', 100) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '3222', 'VJKC30', 'X-PIPE', 'X-PIPE', 249900, 'completada', '2025-10-10');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 1889: OT 3223
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'FRANCISCO CASTILLO' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'FRANCISCO CASTILLO', '26225125-K', '948434968', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'DY6846' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'DY6846', 'VW', 'GOLF', 1992, 'BLANCO', 100000) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '3223', 'DY6846', 'LINEA COMPLETA INOX + COLA CROMADA', 'LINEA COMPLETA INOX + COLA CROMADA', 640000, 'completada', '2025-10-13');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 1890: OT 3224
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'ALVARO OTTO' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'ALVARO OTTO', '13773815-5', '998108382', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'LGGL21' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'LGGL21', 'MB', 'GLE43', 2018, 'PLATA', 98000) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '3224', 'LGGL21', 'INSTALACIÓN SILENCIADORES', 'INSTALACIÓN SILENCIADORES', 600000, 'completada', '2025-10-13');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 1891: OT 3225
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'DAN GALDAMES' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'DAN GALDAMES', '17152517-9', '951753610', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'DSGZ46' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'DSGZ46', 'TOYOTA', 'FJ CRUISER', 2012, 'BLANCO', 105000) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '3225', 'DSGZ46', 'INSTALACIÓN SILENCIADOR ALTO FLUJO WICKED FLOW + FLEXIBLE', 'INSTALACIÓN SILENCIADOR ALTO FLUJO WICKED FLOW + FLEXIBLE', 640000, 'completada', '2025-10-13');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 1892: OT 3226
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'KAUFMANN' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'KAUFMANN', 'KAUFMANN', 'KAUFMANN', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'KAUFMANN' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'KAUFMANN', 'MERCEDES', 'C63', 0, 'KAUFMANN', 0) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '3226', 'KAUFMANN', 'REPARACIÓN + CATALIZADOR ALTO FLUJO', 'REPARACIÓN + CATALIZADOR ALTO FLUJO', 450000, 'completada', '2025-10-13');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 1893: OT 3227
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'RODRIGO SALAZAR' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'RODRIGO SALAZAR', '22324941-1', '992127843', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'VKJP27' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'VKJP27', 'CHEVROLET', 'SILVERADO', 2026, 'PLATA', 2500) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '3227', 'VKJP27', 'CUT-OUT', 'CUT-OUT', 449900, 'completada', '2025-10-13');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 1894: OT 3228
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'DAVID ANZA' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'DAVID ANZA', '9776395-K', '942095859', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'STARKEN' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'STARKEN', 'STARKEN', 'STARKEN', 0, 'STARKEN', 0) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '3228', 'STARKEN', 'STARKEN CALAMA', 'STARKEN CALAMA', 199900, 'completada', '2025-10-13');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 1895: OT 3229
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'BRANCO BUROTTO' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'BRANCO BUROTTO', '21189329-K', '934185730', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'SXDH16' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'SXDH16', 'SUBARU', 'WRX TS', 2023, 'GRIS', 22000) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '3229', 'SXDH16', 'CUT OUT DB KILLER', 'CUT OUT DB KILLER', 420000, 'completada', '2025-10-14');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 1896: OT 3230
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'MANUEL FAUSTINO' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'MANUEL FAUSTINO', '22576222-8', '996318328', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'SBFV17' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'SBFV17', 'GEELY', 'COOLRAY', 2022, 'ROJO', 81000) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '3230', 'SBFV17', 'MOVER CUT OUT', 'MOVER CUT OUT', 150000, 'completada', '2025-10-14');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 1897: OT 3231
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'GONZALO ALARCON' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'GONZALO ALARCON', '15793698-0', '981575654', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'TDCV47' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'TDCV47', 'CHEVROLET', 'SILVERADO', 2024, 'ROJO', 24000) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '3231', 'TDCV47', 'CUT-OUT', 'CUT-OUT', 449900, 'completada', '2025-10-14');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 1898: OT 3232
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'SEBASTIAN CARVACHO' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'SEBASTIAN CARVACHO', '16571551-9', '950172806', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'BOSS SHINE' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'BOSS SHINE', 'SUBARU', 'CROSSTREK', 2025, 'PLATA', 1000) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '3232', 'BOSS SHINE', 'BOSS SHINE CARNAUBA Y INSIDE SPACE', 'BOSS SHINE CARNAUBA Y INSIDE SPACE', 23580, 'completada', '2025-10-14');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 1899: OT 3233
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'KAUFMANN' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'KAUFMANN', 'KAUFMANN', 'KAUFMANN', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'FHKZ83' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'FHKZ83', 'MERCEDES', 'C180', 2013, 'PLATA', 80000) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '3233', 'FHKZ83', 'REPARACIÓN', 'REPARACIÓN', 550000, 'completada', '2025-10-14');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 1900: OT 3234
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'PABLO RIOS' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'PABLO RIOS', '19135532-6', '966741977', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'VHXX87' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'VHXX87', 'FORD', 'BRONCO', 2026, 'VERDE', 5000) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '3234', 'VHXX87', 'AXLE MAS SILENCIADOR ALTO FLUJO MAS COLAS EN NEGRAS 4"', 'AXLE MAS SILENCIADOR ALTO FLUJO MAS COLAS EN NEGRAS 4"', 660000, 'completada', '2025-10-15');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    RAISE NOTICE 'Procesados 1900 registros...';
    -- Fila 1901: OT 3235
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'CRISTIAN ANTUNEZ' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'CRISTIAN ANTUNEZ', '21921205-4', '954725604', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'SRFK64' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'SRFK64', 'SUBARU', 'WRX TS', 2023, 'PLATA', 10500) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '3235', 'SRFK64', 'INSTALACION MULITPLES DESFASADOS + CATBACK EN 4" CROMO', 'INSTALACION MULITPLES DESFASADOS + CATBACK EN 4" CROMO', 2249900, 'completada', '2025-10-15');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 1902: OT 3236
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'DIEGO VELASQUEZ' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'DIEGO VELASQUEZ', '76750260-5', '975298018', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'TRVH92' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'TRVH92', 'FORD', 'F150 RAPTOR', 2024, 'BLANCO A', 5000) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '3236', 'TRVH92', 'REPRO STAGE 1', 'REPRO STAGE 1', 1500000, 'completada', '2025-10-16');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 1903: OT 3237
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'BRYAN DÍAZ' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'BRYAN DÍAZ', '19699308-8', '979436169', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'TBYR71' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'TBYR71', 'MERCEDES', 'A250', 2023, 'PLATA', 12000) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '3237', 'TBYR71', 'CUT OUT MAS SILENCIADOR', 'CUT OUT MAS SILENCIADOR', 800000, 'completada', '2025-10-16');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 1904: OT 3238
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'ISRAEL MENARES' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'ISRAEL MENARES', '19647365-3', '945135581', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'GFTJ22' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'GFTJ22', 'MERCEDES', 'C63', 2014, 'BLANCO', 80000) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '3238', 'GFTJ22', 'DOBLE CUT OUT PINTAR COLAS Y SOPORTES', 'DOBLE CUT OUT PINTAR COLAS Y SOPORTES', 1000000, 'completada', '2025-10-16');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 1905: OT 3239
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'PABLO' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'PABLO', '', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'SIN-PAT' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'SIN-PAT', 'VW', 'PASSAT', 0, 'S/C', 0) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '3239', 'SIN-PAT', 'VACIAR CATALIZADOR', 'VACIAR CATALIZADOR', 150000, 'completada', '2025-10-16');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 1906: OT 3240
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'ANDRÉS HERNANDEZ' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'ANDRÉS HERNANDEZ', '16742300-0', '984034630', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'CE8171' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'CE8171', 'FORD', 'BRONCO', 1967, 'VERDE', 300) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '3240', 'CE8171', 'SILENCIADOR SMG + 1 CONTROL + 1 AÑO DE GARANTIA', 'SILENCIADOR SMG + 1 CONTROL + 1 AÑO DE GARANTIA', 859900, 'completada', '2025-10-16');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 1907: OT 3241
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'RICARDO SEPULVEDA' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'RICARDO SEPULVEDA', '17376600-9', '962076784', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'HRKV48' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'HRKV48', 'VW', 'GOLF', 2017, 'PLATA', 144000) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '3241', 'HRKV48', 'CODO LIBERACIÓN DE ESCPAPE MAS FILTRO ALTO FLUJO BMC', 'CODO LIBERACIÓN DE ESCPAPE MAS FILTRO ALTO FLUJO BMC', 229990, 'completada', '2025-10-16');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 1908: OT 3242
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'GIANFRANCO CALTAGIRONE' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'GIANFRANCO CALTAGIRONE', '16574865-4', '999999406', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'HCBT16' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'HCBT16', 'PORSCHE', 'CAYENNE', 2015, 'NEGRO', 98642) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '3242', 'HCBT16', 'VACIADO DOWNPIPES + STAGE2 +85HP +130NM + SPRINTBOOSTER + KIT BMC DE MANTENCIÓN', 'VACIADO DOWNPIPES + STAGE2 +85HP +130NM + SPRINTBOOSTER + KIT BMC DE MANTENCIÓN', 1524800, 'completada', '2025-10-20');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 1909: OT 3243
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'GUILLERMO GONZALEZ' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'GUILLERMO GONZALEZ', '16172004-6', '992830816', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'KLVL55' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'KLVL55', 'FORD', 'MUSTANG', 2018, 'PLATA', 80000) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '3243', 'KLVL55', 'CATBACK + X-PIPE + DOBLE SMG + 1 CONTROL, CLIENTE TRAE COLAS AKRA', 'CATBACK + X-PIPE + DOBLE SMG + 1 CONTROL, CLIENTE TRAE COLAS AKRA', 1700000, 'completada', '2025-10-20');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 1910: OT 3244
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'IGNACIO CORONADO' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'IGNACIO CORONADO', '20488791-8', '984130362', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'LTJK93' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'LTJK93', 'MAZDA', 'MX5', 2021, 'ROJO', 34000) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '3244', 'LTJK93', 'DB KILLER MAS SILENCIADOR ORIGINAL', 'DB KILLER MAS SILENCIADOR ORIGINAL', 180000, 'completada', '2025-10-20');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 1911: OT 3245
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'ALEJADNRO E.' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'ALEJADNRO E.', '19902327-6', '944829606', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'JTZS16' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'JTZS16', 'VW', 'POLO', 2017, 'BLANCO', 113000) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '3245', 'JTZS16', 'AXLE BACK FREE', 'AXLE BACK FREE', 90000, 'completada', '2025-10-21');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 1912: OT 3246
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'ANDRÉS HERNANDEZ' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'ANDRÉS HERNANDEZ', '16742300-0', '984034630', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'FKKD64' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'FKKD64', 'BMW', 'M3', 1990, 'NEGRO', 34000) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '3246', 'FKKD64', '2X FLOWMASTER CATALIZADOR + 1 WICKED FLOW BALA + SMG + 1 CONTROL + MANTA TERMICA + PROTECTOR TERMICO CHASIS + LINEA 2.5"', '2X FLOWMASTER CATALIZADOR + 1 WICKED FLOW BALA + SMG + 1 CONTROL + MANTA TERMICA + PROTECTOR TERMICO CHASIS + LINEA 2.5"', 1790000, 'completada', '2025-10-21');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 1913: OT 3247
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'JORGE ARAYA' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'JORGE ARAYA', '16342179-8', '998215952', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'GYPW87' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'GYPW87', 'MERCEDES', 'S/M', 2015, 'BLANCO', 79000) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '3247', 'GYPW87', 'REPARACIÓN DE ESCAPE', 'REPARACIÓN DE ESCAPE', 250000, 'completada', '2025-10-21');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 1914: OT 3248
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'LORENZO REYES' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'LORENZO REYES', '15441120-8', '940877326', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'KTYZ77' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'KTYZ77', 'PORSCHE', 'CAYENNE', 2019, 'NEGRO', 80000) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '3248', 'KTYZ77', 'CATBACK + SILENCIADOR SMG + 1 CONTROL + STAGE 1', 'CATBACK + SILENCIADOR SMG + 1 CONTROL + STAGE 1', 2320000, 'completada', '2025-10-22');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 1915: OT 3249
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'MAURICIO PINCHEIRA' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'MAURICIO PINCHEIRA', '15476009-1', '957495097', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'VHXY38' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'VHXY38', 'CUPRA', 'LEON', 2025, 'DORADO', 4000) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '3249', 'VHXY38', 'CUT-OUT + 1 CONTROL + SPRINTBOOSTER', 'CUT-OUT + 1 CONTROL + SPRINTBOOSTER', 714800, 'completada', '2025-10-22');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 1916: OT 3250
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'CLEMENTE VERGARA' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'CLEMENTE VERGARA', '20707371-7', '989463963', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'KDXH12' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'KDXH12', 'AUDI', 'A1', 2018, 'BLANCO', 120000) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '3250', 'KDXH12', 'FLEXIBLE CATBACK COLA NEGRA 3.5', 'FLEXIBLE CATBACK COLA NEGRA 3.5', 874900, 'completada', '2025-10-23');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 1917: OT 3251
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'DANIEL PAREDES' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'DANIEL PAREDES', '21613582-2', '949266512', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'PGRJ91' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'PGRJ91', 'VW', 'GTI', 2020, 'GRIS', 62000) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '3251', 'PGRJ91', 'CATBACK MAS MAGNAFLOW Y COLAS 4" CROMO', 'CATBACK MAS MAGNAFLOW Y COLAS 4" CROMO', 729900, 'completada', '2025-10-23');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 1918: OT 3252
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'JAVIER MATTA' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'JAVIER MATTA', '19904421-4', '966403392', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'LHRK18' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'LHRK18', 'MITSUBISHI', 'ASX', 2019, 'GRIS', 123000) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '3252', 'LHRK18', 'CUT-OUT + CONTROL REMOTO', 'CUT-OUT + CONTROL REMOTO', 449900, 'completada', '2025-10-23');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 1919: OT 3253
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'RAUL GARDILCIC' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'RAUL GARDILCIC', '7046660-0', '975490126', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'GHXK19' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'GHXK19', 'MERCEDES', 'C63 AMG', 2014, 'GRIS', 86000) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '3253', 'GHXK19', 'CATBACK + 2 X SMG + 1 CONTROL + COLAS AMG + SPRINTBOOSTER + 2 BMC', 'CATBACK + 2 X SMG + 1 CONTROL + COLAS AMG + SPRINTBOOSTER + 2 BMC', 2919800, 'completada', '2025-10-24');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 1920: OT 3254
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'DIEGO ORDENES' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'DIEGO ORDENES', '16977905-8', '993192710', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'SB8121' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'SB8121', 'CHEVROLET', 'SILVERADO', 1997, 'CELESTE', 230000) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '3254', 'SB8121', 'REINSTALACIÓN ESCAPE', 'REINSTALACIÓN ESCAPE', 25000, 'completada', '2025-10-25');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 1921: OT 3255
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'SEBASTIAN MARTINEZ' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'SEBASTIAN MARTINEZ', '14134436-6', '958252090', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'CWVZ89' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'CWVZ89', 'CHEVROLET', 'COLORADO', 2011, 'PLATA', 200000) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '3255', 'CWVZ89', 'SILENCIADOR ALTO FLUJO BORLA + COLA 4"', 'SILENCIADOR ALTO FLUJO BORLA + COLA 4"', 499900, 'completada', '2025-10-25');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 1922: OT 3256
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'MAGDALENA VALDES' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'MAGDALENA VALDES', '21182302-K', '982759068', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'JBFP38' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'JBFP38', 'MINI', 'COOPER', 2016, 'GRAFITO', 98000) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '3256', 'JBFP38', 'REVISIÓN DEL SISTEMA DE VALVULAS REMUS', 'REVISIÓN DEL SISTEMA DE VALVULAS REMUS', 40000, 'completada', '2025-10-27');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 1923: OT 3257
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'JORDAN CARRASCO' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'JORDAN CARRASCO', '18030045-7', '966462909', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'TCLZ48' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'TCLZ48', 'BMW', '240', 2024, 'BLANCO', 16000) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '3257', 'TCLZ48', 'INSTALACIÓN DE COLAS', 'INSTALACIÓN DE COLAS', 180000, 'completada', '2025-10-28');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 1924: OT 3258
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'PÍETRO LOBOS' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'PÍETRO LOBOS', '22173904-3', '956422768', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'PBGT79' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'PBGT79', 'MERCEDES', 'A200', 2021, 'BLANCO', 30000) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '3258', 'PBGT79', 'AXLE BACK FREE', 'AXLE BACK FREE', 70000, 'completada', '2025-10-28');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 1925: OT 3259
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'MARIO GARRIDO' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'MARIO GARRIDO', '18467423-8', '991568772', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'FGVW20' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'FGVW20', 'FORD', 'F150 LARIAT', 2013, 'BLANCO', 190000) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '3259', 'FGVW20', 'CUT-OUT + CONTROL + FILTRO BMC + SPRINTBOOSTER + STAGE 1 + KIT LAVADO BMC + COLA NEGRA', 'CUT-OUT + CONTROL + FILTRO BMC + SPRINTBOOSTER + STAGE 1 + KIT LAVADO BMC + COLA NEGRA', 1634500, 'completada', '2025-10-28');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 1926: OT 3260
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'BRANDON GONZALEZ' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'BRANDON GONZALEZ', '20670683-K', '977928738', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'SIN-PAT' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'SIN-PAT', 'VW', 'GOLF', 2016, 'S/C', 0) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '3260', 'SIN-PAT', 'PROTECTOR TERMICO', 'PROTECTOR TERMICO', 180000, 'completada', '2025-10-28');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 1927: OT 3261
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'FRANCHESCA' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'FRANCHESCA', '', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'RCDB10' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'RCDB10', 'NISSAN', 'VERSA', 2022, 'BLANCO', 50000) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '3261', 'RCDB10', 'REPARACIÓN', 'REPARACIÓN', 30000, 'completada', '2025-10-28');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 1928: OT 3262
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'FRANCISCO SCHMALZ' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'FRANCISCO SCHMALZ', '13356631-7', '991596018', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'HPZR47' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'HPZR47', 'MERCEDES', 'G63', 2016, 'GRIS', 105000) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '3262', 'HPZR47', 'CUT-OUT X2', 'CUT-OUT X2', 849900, 'completada', '2025-10-29');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 1929: OT 3263
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'GONZALO NAHUM' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'GONZALO NAHUM', '10234808-7', '995420445', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'VHCT33' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'VHCT33', 'FORD', 'DARK HORSE', 2025, 'BLANCO', 600) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '3263', 'VHCT33', 'ELIMINAR CATALITICOS + LINEA DOBLE DE ACERO INOX SE MANTIENEN SILENCIADORES TRASEROS', 'ELIMINAR CATALITICOS + LINEA DOBLE DE ACERO INOX SE MANTIENEN SILENCIADORES TRASEROS', 1300000, 'completada', '2025-10-29');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 1930: OT 3264
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'IVAN CASTRO' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'IVAN CASTRO', '9158899-4', '993452469', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'BL8729' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'BL8729', 'CHEVROLET', 'CAMARO', 1970, 'DORADO', 75639) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '3264', 'BL8729', 'CATBACK + WICKED FLOW CAMARO + 1 COLA A CADA COSTADO DE TUBO', 'CATBACK + WICKED FLOW CAMARO + 1 COLA A CADA COSTADO DE TUBO', 919900, 'completada', '2025-10-29');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 1931: OT 3265
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'LISSETE MEDINA' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'LISSETE MEDINA', '18918692-4', '923974602', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'VCKT88' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'VCKT88', 'VW', 'CROSSTREK', 2025, 'GRIS', 2500) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '3265', 'VCKT88', 'CUT-OUT + 1 CONTROL', 'CUT-OUT + 1 CONTROL', 449900, 'completada', '2025-10-29');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 1932: OT 3266
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'LEONARDO A' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'LEONARDO A', '16647046-3', '934054362', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'BTBG55' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'BTBG55', 'VW', 'GOLF Gti', 2009, 'NEGRO', 76600) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '3266', 'BTBG55', 'INSTALACIÓN ESCAPE REMUS', 'INSTALACIÓN ESCAPE REMUS', 160000, 'completada', '2025-10-30');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 1933: OT 3267
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'DIEGO ORDENES' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'DIEGO ORDENES', '16977905-8', '993192710', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'SB8121' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'SB8121', 'CHEVROLET', 'SILVERADO', 1997, 'CELESTE', 237631) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '3267', 'SB8121', 'LINEA 2.5" + SILENCIADOR ALTO FLUJO MAGNAFLOW', 'LINEA 2.5" + SILENCIADOR ALTO FLUJO MAGNAFLOW', 1876180, 'completada', '2025-11-03');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 1934: OT 3268
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'BRAYAN PEÑA' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'BRAYAN PEÑA', '26282203-6', '968736664', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'RVSC37' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'RVSC37', 'BMW', '128ti', 2022, 'GRIS', 21000) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '3268', 'RVSC37', 'INSTALACIÓN CUT OUT + FILTRO ALTO FLUJO BMC  + SPRINTBOOSTER', 'INSTALACIÓN CUT OUT + FILTRO ALTO FLUJO BMC  + SPRINTBOOSTER', 959700, 'completada', '2025-11-04');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 1935: OT 3269
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'PATRICIO MANQUI' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'PATRICIO MANQUI', '19420778-6', '954948443', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'GVJL34' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'GVJL34', 'JEEP', 'GRAND CHEROKEE', 2015, 'NEGRO', 140000) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '3269', 'GVJL34', 'REPARACIÓN SOPORTE', 'REPARACIÓN SOPORTE', 40000, 'completada', '2025-11-04');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 1936: OT 3270
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'CRISTOBAL VARGAS' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'CRISTOBAL VARGAS', '76229272-6', '991350249', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'SIN-PAT' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'SIN-PAT', 'VW', 'AMAROK', 2016, 'BLANCO', 180000) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '3270', 'SIN-PAT', 'SPRINTBOOSTER', 'SPRINTBOOSTER', 279900, 'completada', '2025-11-04');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 1937: OT 3271
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'DAN GALDAMES' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'DAN GALDAMES', '17152517-9', '951753610', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'DSGZ46' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'DSGZ46', 'TOYOTA', 'FJ CRUISER', 2012, 'BLANCO', 177000) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '3271', 'DSGZ46', 'FABRICACIÓN TRAMO', 'FABRICACIÓN TRAMO', 180000, 'completada', '2025-11-05');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 1938: OT 3272
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'HERNAN MANZOR' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'HERNAN MANZOR', '16839113-7', '995444560', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'DSCY97' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'DSCY97', 'FORD', 'MUSTANG GT', 2012, 'NEGRO', 100000) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '3272', 'DSCY97', 'X-PIPE', 'X-PIPE', 399900, 'completada', '2025-11-06');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 1939: OT 3273
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'FRED GODOY' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'FRED GODOY', '20852528-K', '968719915', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'LSHS28' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'LSHS28', 'BMW', '240i', 2019, 'GRIS', 46000) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '3273', 'LSHS28', 'INSTALACIÓN COLAS', 'INSTALACIÓN COLAS', 80000, 'completada', '2025-11-07');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 1940: OT 3274
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'KARIN M' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'KARIN M', '', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'SIN-PAT' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'SIN-PAT', 'HYUNDAI', 'GETZ', 2010, 'PLATA', 150000) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '3274', 'SIN-PAT', 'APRIETE', 'APRIETE', 15000, 'completada', '2025-11-08');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 1941: OT 3275
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'JAVIER OSES' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'JAVIER OSES', '15217574-4', '966584644', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'BZDW16' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'BZDW16', 'SUBARU', 'LEGACY', 2009, 'AZUL DIAMANTE', 175000) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '3275', 'BZDW16', 'REEMPLAZA DE CATALIZADORES', 'REEMPLAZA DE CATALIZADORES', 279900, 'completada', '2025-11-09');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 1942: OT 3276
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'FRANCISCO CASTILLO' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'FRANCISCO CASTILLO', '26225125-K', '948434968', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'SV5675' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'SV5675', 'CHEVROLET', 'CHEYEN', 1989, 'BURDEO', 300000) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '3276', 'SV5675', 'LINEA 2.5" + SILENCIADOR ALTO FLUJO MAGNAFLOW', 'LINEA 2.5" + SILENCIADOR ALTO FLUJO MAGNAFLOW', 675900, 'completada', '2025-11-10');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 1943: OT 3277
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'MARCELO VENEGAS' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'MARCELO VENEGAS', '18042479-2', '955305948', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'LPRG82' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'LPRG82', 'SUBARU', 'WRX', 2020, 'PLATA', 50000) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '3277', 'LPRG82', 'CUT-OUT MAS MUFFLER DELETE', 'CUT-OUT MAS MUFFLER DELETE', 549900, 'completada', '2025-11-07');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 1944: OT 3278
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'CLAUDIO ROJAS' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'CLAUDIO ROJAS', '12108531-3', '945534215', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'SIN-PAT' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'SIN-PAT', 'FORD', 'EXPLORER ST', 2025, 'PLATA', 10000) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '3278', 'SIN-PAT', '6 BUJIAS NGK 95605', '6 BUJIAS NGK 95605', 150000, 'completada', '2025-11-10');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 1945: OT 3279
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'JAVIER MENDOZA' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'JAVIER MENDOZA', '18979528', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'URUGUAY' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'URUGUAY', 'MERCEDES', 'SPRINTER', 2017, 'BLANCO', 200000) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '3279', 'URUGUAY', 'SOLDADURA TANQUE DE AGUA', 'SOLDADURA TANQUE DE AGUA', 100000, 'completada', '2025-11-10');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 1946: OT 3280
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'IVAN CASTRO' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'IVAN CASTRO', '9158899-4', '993452469', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'BL8729' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'BL8729', 'CHEVROLET', 'CAMARO', 1970, 'DORADO', 75639) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '3280', 'BL8729', 'CAMBIO DE SILENCIADOR', 'CAMBIO DE SILENCIADOR', 399990, 'completada', '2025-11-10');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 1947: OT 3281
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'RICHARD CORTEZ' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'RICHARD CORTEZ', '6875426-7', '985009698', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'TJTJ57' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'TJTJ57', 'JEEP', 'GLADIATOR', 2024, 'GRS', 6800) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '3281', 'TJTJ57', 'CUT-OUT MAS MUFFLER DELETE', 'CUT-OUT MAS MUFFLER DELETE', 400000, 'completada', '2025-11-11');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 1948: OT 3282
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'DIEGO ORDENES' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'DIEGO ORDENES', '16977905-8', '993192710', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'JXWX83' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'JXWX83', 'AUDI', 'A5', 2018, 'ROJO', 13365) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '3282', 'JXWX83', 'PROTECTOR TERMICO DOWNPIPE', 'PROTECTOR TERMICO DOWNPIPE', 171000, 'completada', '2025-11-11');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 1949: OT 3283
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'PEDRO RUIZ' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'PEDRO RUIZ', '19235619-9', '958735673', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'LCYC56' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'LCYC56', 'HYUNDAI', 'VELOSTER', 2019, 'GRIS', 90000) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '3283', 'LCYC56', 'INSPECCIÓN', 'INSPECCIÓN', 40000, 'completada', '2025-11-11');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 1950: OT 3284
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'ALFONSO VILLALOBOS' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'ALFONSO VILLALOBOS', '19062743-8', '972260378', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'LCYC80' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'LCYC80', 'VW', 'GOLF', 2019, 'BLANCO', 31000) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '3284', 'LCYC80', 'MODULO VACIO MAS 2 CONTROLES', 'MODULO VACIO MAS 2 CONTROLES', 200000, 'completada', '2025-11-11');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 1951: OT 3285
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'GUILLERMO GONZALEZ' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'GUILLERMO GONZALEZ', '16172004-6', '992830816', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'KLVL55' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'KLVL55', 'FORD', 'MUSTANG GT', 2018, 'PLATA', 80000) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '3285', 'KLVL55', 'CATBACK 3"', 'CATBACK 3"', 500000, 'completada', '2025-11-11');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 1952: OT 3286
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'RAMI ALMHNA' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'RAMI ALMHNA', '25034801-0', '972174840', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'LFYC69' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'LFYC69', 'BMW', '420', 2019, 'BLANCO', 81000) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '3286', 'LFYC69', 'SILENPRO', 'SILENPRO', 470000, 'completada', '2025-11-12');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 1953: OT 3287
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'CARLOS OVIEDO' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'CARLOS OVIEDO', '19757436-4', '983574302', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'TBWX61' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'TBWX61', 'SUZUKI', 'SWIFT', 2024, 'AZUL DIAMANTE', 23000) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '3287', 'TBWX61', 'CATBACK 2.5" CLIENTE TRAE COLAS', 'CATBACK 2.5" CLIENTE TRAE COLAS', 809900, 'completada', '2025-11-13');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 1954: OT 3288
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'DARIO PEREZ' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'DARIO PEREZ', '20909899-7', '974696417', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'RYXT61' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'RYXT61', 'TOYOTA', '4 RUNNER', 2022, 'GRIS', 29500) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '3288', 'RYXT61', 'DESINSTALACIÓN SILENCIADOR VALVETRONIC', 'DESINSTALACIÓN SILENCIADOR VALVETRONIC', 149900, 'completada', '2025-11-13');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 1955: OT 3289
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'JOSÉ TOMÁS' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'JOSÉ TOMÁS', '22511555-9', '934104732', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'VKKF56' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'VKKF56', 'BMW', '220i', 2026, 'NEGRO', 1700) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '3289', 'VKKF56', 'AXLE BACK FREE + COLAS NEGRAS 4"', 'AXLE BACK FREE + COLAS NEGRAS 4"', 350000, 'completada', '2025-11-13');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 1956: OT 3290
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'FERNANDO MARAGLIANO' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'FERNANDO MARAGLIANO', '18167432-6', '995033696', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'PGYG54' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'PGYG54', 'BMW', 'M4', 2021, 'AMARILLO', 34000) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '3290', 'PGYG54', 'INSTALACIÓN DOWNPIPES + INTAKE', 'INSTALACIÓN DOWNPIPES + INTAKE', 195000, 'completada', '2025-11-13');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 1957: OT 3291
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'KAUFMANN' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'KAUFMANN', 'KAUFMANN', 'KAUFMANN', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'SIN-PAT' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'SIN-PAT', 'MERCEDES', 'A35', 2024, 'BLANCO', 8000) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '3291', 'SIN-PAT', 'CATBACK + BORLA DB KILLER + VALVULA ORIGINAL', 'CATBACK + BORLA DB KILLER + VALVULA ORIGINAL', 919900, 'completada', '2025-11-13');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 1958: OT 3292
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'BENJAMIN SOTO' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'BENJAMIN SOTO', '21464764-8', '953398728', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'SIN-PAT' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'SIN-PAT', 'BMW', 'E30', 1990, 'BLANCO', 200000) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '3292', 'SIN-PAT', 'RECUBRIMIENTO TERMICO', 'RECUBRIMIENTO TERMICO', 89900, 'completada', '2025-11-13');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 1959: OT 3293
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'JORGE GUZMAN' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'JORGE GUZMAN', '13492557-4', '933883194', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'DKJL52' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'DKJL52', 'DODGE', 'CHARGER', 2012, 'GRIS', 135000) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '3293', 'DKJL52', 'DOBLE CUT OUT', 'DOBLE CUT OUT', 1050000, 'completada', '2025-11-17');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 1960: OT 3294
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'BASTIAN LARA' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'BASTIAN LARA', '16927984-5', '968451520', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'JXRV30' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'JXRV30', 'FORD', 'MUSTANG', 2018, 'NEGRO', 49000) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '3294', 'JXRV30', 'X-PIPE', 'X-PIPE', 279900, 'completada', '2025-11-17');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 1961: OT 3295
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'FELIPE ORELLANA' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'FELIPE ORELLANA', '18447435-2', '962086701', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'VHSH88' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'VHSH88', 'CHEVROLET', 'SILVERADO', 2026, 'GRIS', 500) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '3295', 'VHSH88', 'COLAS DOBLES NEGRA 4"', 'COLAS DOBLES NEGRA 4"', 499900, 'completada', '2025-11-18');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 1962: OT 3296
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'ARTURO M' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'ARTURO M', '18972178-1', '978002362', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'VGSP55' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'VGSP55', 'FORD', 'BRONCO', 2026, 'NEGRO', 1000) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '3296', 'VGSP55', 'INSTALACIÓN SILENCIADOR ALTO FLUJO WICKED FLOW', 'INSTALACIÓN SILENCIADOR ALTO FLUJO WICKED FLOW', 399900, 'completada', '2025-11-18');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 1963: OT 3297
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'CRISTIAN LAGOS' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'CRISTIAN LAGOS', '12393880-1', '981986990', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'GZGT52' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'GZGT52', 'TOYOTA', 'TUNDRA', 2015, 'GRIS', 130000) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '3297', 'GZGT52', 'REEMPLAZO SILENCIADOR POR DOBLE ALTO FLUJO WICKED FLOW', 'REEMPLAZO SILENCIADOR POR DOBLE ALTO FLUJO WICKED FLOW', 500000, 'completada', '2025-11-18');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 1964: OT 3298
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'CRISTIAN CABRERA' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'CRISTIAN CABRERA', '', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'SIN-PAT' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'SIN-PAT', 'MERCEDES', 'A35', 2023, 'GRIS', 40000) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '3298', 'SIN-PAT', 'SILENCIADOR ORIGINAL REEINSTALACIÓN', 'SILENCIADOR ORIGINAL REEINSTALACIÓN', 90000, 'completada', '2025-11-18');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 1965: OT 3299
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'EDGARD AVILES' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'EDGARD AVILES', '17763336-4', '951691921', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'SCKC22' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'SCKC22', 'RAM', '1500', 2022, 'NEGRO', 50000) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '3299', 'SCKC22', 'INSTALACIÓN SILENCIADOR ALTO FLUJO WICKED FLOW', 'INSTALACIÓN SILENCIADOR ALTO FLUJO WICKED FLOW', 349900, 'completada', '2025-11-18');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 1966: OT 3300
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'NICOLAS GUERRA' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'NICOLAS GUERRA', '17611085-6', '963938146', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'HGSL43' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'HGSL43', 'MERCEDES', 'CLA250', 2016, 'BLANCO', 90000) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '3300', 'HGSL43', 'DOWNPIPE + MUFFLER DELETE + REPRO  DECAT + POPS', 'DOWNPIPE + MUFFLER DELETE + REPRO  DECAT + POPS', 1199900, 'completada', '2025-11-20');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 1967: OT 3301
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'ANDRES MORA' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'ANDRES MORA', '17960752-2', '965718291', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'RLXP28' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'RLXP28', 'BMW', '128TI', 2022, 'GRIS', 60000) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '3301', 'RLXP28', 'AXLE BACK CON VALVULAS BMW Y COLAS NUEVAS DE 4"', 'AXLE BACK CON VALVULAS BMW Y COLAS NUEVAS DE 4"', 729000, 'completada', '2025-11-20');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 1968: OT 3302
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'LEANDRO PULGAR' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'LEANDRO PULGAR', '23045673-9', '941097319', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'TXVW10' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'TXVW10', 'SUZUKI', 'JIMNY', 2024, 'GRIS', 25000) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '3302', 'TXVW10', 'CATBACK + WICKED FLOW + COLA 2.5"', 'CATBACK + WICKED FLOW + COLA 2.5"', 1344600, 'completada', '2025-11-21');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 1969: OT 3303
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'SEBASTIAN HENRIQUEZ' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'SEBASTIAN HENRIQUEZ', '18295153-6', '985210904', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'JFBT81' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'JFBT81', 'BMW', '120i', 2017, 'GRIS', 84000) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '3303', 'JFBT81', 'AXLE BACK + CAMBIO DE DIFUSOR COLAS NEGRAS', 'AXLE BACK + CAMBIO DE DIFUSOR COLAS NEGRAS', 669800, 'completada', '2025-11-21');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 1970: OT 3304
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'FRANCISCO SANTANDER' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'FRANCISCO SANTANDER', '17851654-K', '926389225', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'SIN-PAT' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'SIN-PAT', 'FORD', 'F150', 2016, 'ROJO', 180000) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '3304', 'SIN-PAT', 'INSTALACIÓN SILENCIADOR ALTO FLUJO MAGNAFLOW', 'INSTALACIÓN SILENCIADOR ALTO FLUJO MAGNAFLOW', 650000, 'completada', '2025-11-21');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 1971: OT 3305
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'CESAR MARTINEZ' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'CESAR MARTINEZ', '16280928-8', '956598767', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'KFXX60' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'KFXX60', 'AUDI', 'A3', 2018, 'GRIS', 80000) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '3305', 'KFXX60', 'REPARACIÓN SOPORTE', 'REPARACIÓN SOPORTE', 39900, 'completada', '2025-11-24');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 1972: OT 3306
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'SOLEDAD PALMA' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'SOLEDAD PALMA', '18311768-7', '994590109', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'SIN-PAT' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'SIN-PAT', 'MERCEDES', 'A45', 2018, 'BLANCO', 100000) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '3306', 'SIN-PAT', 'REPARACIÓN SOPORTE', 'REPARACIÓN SOPORTE', 25000, 'completada', '2025-11-24');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 1973: OT 3307
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'PATRICIA GONZALEZ' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'PATRICIA GONZALEZ', '16487529-6', '994394385', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'TPHL96' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'TPHL96', 'CUPRA', 'FORMENTOR VZ', 2025, 'BLANCO', 17000) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '3307', 'TPHL96', 'CUT-OUT CON CONTROL', 'CUT-OUT CON CONTROL', 420000, 'completada', '2025-11-24');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 1974: OT 3308
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'DIESEL TUNING' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'DIESEL TUNING', '76319264-4', '988298131', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'PY8757' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'PY8757', 'FORD', 'EXPEDITION', 1997, 'ROJO', 200000) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '3308', 'PY8757', 'REEMPLAZO DE SILENCIADOR POR MAGNAFLOW GLASSPACK', 'REEMPLAZO DE SILENCIADOR POR MAGNAFLOW GLASSPACK', 299900, 'completada', '2025-11-24');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 1975: OT 3309
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'CHRISTIAN MARTINEZ' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'CHRISTIAN MARTINEZ', '76842727-5', '975626300', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'LBXK46' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'LBXK46', 'FORD', 'F150', 2019, 'BLANCO', 130000) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '3309', 'LBXK46', 'LINEA + BORLA + DOBLE SALIDA + COLAS NEGRAS 4"', 'LINEA + BORLA + DOBLE SALIDA + COLAS NEGRAS 4"', 1349900, 'completada', '2025-11-25');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 1976: OT 3310
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'KAUFMANN' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'KAUFMANN', 'KAUFMANN', 'KAUFMANN', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'UZ8680' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'UZ8680', 'MERCEDES', 'SLK 230', 2002, 'AZUL', 82000) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '3310', 'UZ8680', 'REPARACION FUGA', 'REPARACION FUGA', 50000, 'completada', '2025-11-25');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 1977: OT 3311
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'KAUFMANN' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'KAUFMANN', 'KAUFMANN', 'KAUFMANN', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'TFTL11' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'TFTL11', 'MERCEDES', 'G500', 2024, 'BEIGE', 14704) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '3311', 'TFTL11', 'DOBLE CUT DB KILLER', 'DOBLE CUT DB KILLER', 900000, 'completada', '2025-11-25');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 1978: OT 3312
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'BORIS AGUILERA' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'BORIS AGUILERA', '17182003-0', '958473468', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'HKRB15' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'HKRB15', 'BMW', '120i', 2016, 'GRIS', 135000) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '3312', 'HKRB15', 'CAMBIO DIFUSOR + AXLE BACK', 'CAMBIO DIFUSOR + AXLE BACK', 669800, 'completada', '2025-11-25');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 1979: OT 3313
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'JUAN PABLO' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'JUAN PABLO', '14443694-6', '996590350', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'JYXL37' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'JYXL37', 'FORD', 'F150', 2018, 'NEGRA', 120000) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '3313', 'JYXL37', 'FILTRO BMC + CARGADOR AUTO SKY', 'FILTRO BMC + CARGADOR AUTO SKY', 201800, 'completada', '2025-11-25');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 1980: OT 3314
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'FELIPE CORTÉS' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'FELIPE CORTÉS', '18189849-6', '964561931', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'TXCZ36' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'TXCZ36', 'FORD', 'MUSTANG', 2025, 'NEGRO', 7000) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '3314', 'TXCZ36', 'X-PIPE', 'X-PIPE', 299900, 'completada', '2025-11-26');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 1981: OT 3315
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'TODO CONTENEDOR SPA' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'TODO CONTENEDOR SPA', '77359876-2', '956198171', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'SJXL37' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'SJXL37', 'RAM', '1500', 2023, 'ROJO', 73000) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '3315', 'SJXL37', 'CUT-OUT MAS CONTROL REMOTO', 'CUT-OUT MAS CONTROL REMOTO', 449900, 'completada', '2025-11-26');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 1982: OT 3316
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'DAVID THOMANN' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'DAVID THOMANN', '18739942-4', '981528521', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'BRGP82' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'BRGP82', 'BMW', '550', 2010, 'BLANCO', 22349) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '3316', 'BRGP82', 'SILENCIADOR SMG + CONTROL + COLAS NUEVAS', 'SILENCIADOR SMG + CONTROL + COLAS NUEVAS', 719900, 'completada', '2025-11-26');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 1983: OT 3317
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'JONATAN DIAZ OLIVARES' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'JONATAN DIAZ OLIVARES', '15717071-6', '968986805', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'TCWL45' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'TCWL45', 'SKODA', 'OCTAVIA VRS', 2024, 'GRIS METALIZADO', 22300) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '3317', 'TCWL45', 'LINEA 2.5" MAS 2 VALVETRONIC INCLUYE 1 CONTROL REMOTO Y ROMOVER CUT OUT', 'LINEA 2.5" MAS 2 VALVETRONIC INCLUYE 1 CONTROL REMOTO Y ROMOVER CUT OUT', 1530000, 'completada', '2025-11-27');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 1984: OT 3318
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'CARLOS YAÑEZ' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'CARLOS YAÑEZ', '16788086-k', '995300074', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'SIN-PAT' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'SIN-PAT', 'FORD', 'F150', 2024, 'GRIS', 60000) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '3318', 'SIN-PAT', 'CUT-OUT MAS CONTROL REMOTO', 'CUT-OUT MAS CONTROL REMOTO', 400000, 'completada', '2025-11-27');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 1985: OT 3319
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'RAUL MEGAMIN' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'RAUL MEGAMIN', '76011809-5', '975490126', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'GHXK19' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'GHXK19', 'MERCEDES', 'C63', 2014, 'GRIS', 120000) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '3319', 'GHXK19', 'REMOVER CATALIZADOR', 'REMOVER CATALIZADOR', 500000, 'completada', '2025-11-27');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 1986: OT 3320
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'FELIPE JIMENEZ' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'FELIPE JIMENEZ', '10284807-1', '974981973', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'WE5868' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'WE5868', 'CHEVROLET', 'COLORADO', 2006, 'ROJO', 208000) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '3320', 'WE5868', 'INSTALAR SILENCIADOR MAGNAFLOW LO TRAE CLIENTE', 'INSTALAR SILENCIADOR MAGNAFLOW LO TRAE CLIENTE', 100000, 'completada', '2025-11-27');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 1987: OT 3321
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'KEVIN POBLETE' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'KEVIN POBLETE', '19733863-6', '983528449', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'CPXG54' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'CPXG54', 'BMW', '316i', 2011, 'GRIS', 130000) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '3321', 'CPXG54', 'CUTOUT MAS CONTROL', 'CUTOUT MAS CONTROL', 399900, 'completada', '2025-11-28');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 1988: OT 3322
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'FRANCISCO BRAVO' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'FRANCISCO BRAVO', '17355273-4', '995291386', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'SXGC83' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'SXGC83', 'SUBARU', 'IMPREZA', 2023, 'GRIS', 21000) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '3322', 'SXGC83', 'CUT-OUT MAS CONTROL', 'CUT-OUT MAS CONTROL', 399900, 'completada', '2025-12-01');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 1989: OT 3323
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'YORKI ROJAS' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'YORKI ROJAS', '18.497.299-9', '994480603', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'KFGG67' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'KFGG67', 'FORD', 'F-150', 2018, 'NEGRO', 70000) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '3323', 'KFGG67', 'CUT-OUT MAS CONTROL', 'CUT-OUT MAS CONTROL', 449900, 'completada', '2025-12-01');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 1990: OT 3324
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'DIESEL TUNING' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'DIESEL TUNING', '76319264-4', '988298131', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'GSWR69' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'GSWR69', 'FORD', 'F-150', 2014, 'VERDE', 330354) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '3324', 'GSWR69', 'ALTO FLUJO MAGNAFLOW', 'ALTO FLUJO MAGNAFLOW', 299900, 'completada', '2025-12-01');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 1991: OT 3325
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'FRANCISCO RÍOS' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'FRANCISCO RÍOS', '12476189-1', '995112460', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'RT3599' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'RT3599', 'CHEVROLET', 'TAHOE', 1998, 'ROJO', 125800) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '3325', 'RT3599', 'DOBLE SILENCIADOR WICKED FLOW + COLAS DOBLES CROMO', 'DOBLE SILENCIADOR WICKED FLOW + COLAS DOBLES CROMO', 989900, 'completada', '2025-12-01');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 1992: OT 3326
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'ANDRES MORA' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'ANDRES MORA', '17960752-2', '965718291', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'RLXP28' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'RLXP28', 'BMW', '128TI', 2022, 'GRIS', 61000) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '3326', 'RLXP28', 'MUFFLER DELETE', 'MUFFLER DELETE', 80000, 'completada', '2025-12-01');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 1993: OT 3327
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'JAVIER DIAZ PEREZ' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'JAVIER DIAZ PEREZ', '20540804-5', '995817843', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'SFFH31' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'SFFH31', 'GEELY', 'COOLRAY', 2022, 'BLANCO', 60000) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '3327', 'SFFH31', 'CUT-OUT MAS CONTROL', 'CUT-OUT MAS CONTROL', 399900, 'completada', '2025-12-02');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 1994: OT 3328
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'MATIAS CASABONNE' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'MATIAS CASABONNE', '19084392-0', '961362919', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'CCVD17' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'CCVD17', 'NISSAN', '370Z', 2010, 'NEGRO', 97000) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '3328', 'CCVD17', 'REPARACIÓN AMBOS MULTIPLES', 'REPARACIÓN AMBOS MULTIPLES', 350000, 'completada', '2025-12-02');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 1995: OT 3329
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'JUAN MANUEL ACEVEDO' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'JUAN MANUEL ACEVEDO', '13289233-4', '957789492', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'SJLH89' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'SJLH89', 'CHEVROLET', 'SILVERADO ZR2', 2023, 'NEGRO', 38000) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '3329', 'SJLH89', 'SILENCIADOR SMG VALVETRONIC', 'SILENCIADOR SMG VALVETRONIC', 699900, 'completada', '2025-12-02');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 1996: OT 3330
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'JOHAN MARTINEZ' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'JOHAN MARTINEZ', '20142766-5', '992715707', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'SIN-PAT' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'SIN-PAT', 'SUBARU', 'FORESTER', 2022, 'GRIS', 40000) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '3330', 'SIN-PAT', 'BOSS SHINE ROYAL WHEELS', 'BOSS SHINE ROYAL WHEELS', 10900, 'completada', '2025-12-02');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 1997: OT 3331
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'FRANCISCO PEÑA' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'FRANCISCO PEÑA', '16571457-1', '954006047', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'JVBL58' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'JVBL58', 'MERCEDES', 'A200', 2017, 'BLANCO', 80000) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '3331', 'JVBL58', 'SILENCIADOR SMG VALVETRONIC + MUFFLER DELETE + SPRINTBOOSTER + REPRO STAGE1 $299', 'SILENCIADOR SMG VALVETRONIC + MUFFLER DELETE + SPRINTBOOSTER + REPRO STAGE1 $299', 1659700, 'completada', '2025-12-03');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 1998: OT 3332
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'MARIO LARA' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'MARIO LARA', '19890609-3', '982623350', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'TW5265' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'TW5265', 'JAGUAR', 'XJ8', 2007, 'NEGRO', 145000) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '3332', 'TW5265', 'DOBLE CUT-OUT', 'DOBLE CUT-OUT', 849900, 'completada', '2025-12-03');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 1999: OT 3333
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'FRANCO CALDERON' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'FRANCO CALDERON', '28558121-4', '3735610785', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'SIN-PAT' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'SIN-PAT', 'VW', 'AMAROK', 2023, 'NEGRO', 30000) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '3333', 'SIN-PAT', 'CUT-OUT MAS CONTROL', 'CUT-OUT MAS CONTROL', 449900, 'completada', '2025-12-03');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 2000: OT 3334
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'KAUFMANN' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'KAUFMANN', 'KAUFMANN', 'KAUFMANN', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'SRZT64' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'SRZT64', 'MERCEDES', 'GLE53', 2023, 'GRIS', 20000) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '3334', 'SRZT64', 'AXLE BACK', 'AXLE BACK', 699900, 'completada', '2025-12-03');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    RAISE NOTICE 'Procesados 2000 registros...';
    -- Fila 2001: OT 3335
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'DETAILING CHILE' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'DETAILING CHILE', '77304335-3', '997002466', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'STARKEN' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'STARKEN', 'STARKEN', 'STARKEN', 0, 'STARKEN', 0) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '3335', 'STARKEN', 'X-PIPE', 'X-PIPE', 249900, 'completada', '2025-12-03');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 2002: OT 3336
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'RICARDO JORQUERA' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'RICARDO JORQUERA', '19523618-6', '977061216', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'LZHC75' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'LZHC75', 'FORD', 'F150', 2020, 'NEGRO', 36000) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '3336', 'LZHC75', 'REPARACIÓN FUGA DE ESCAPE MAS BUJIAS NUEVAS NGK', 'REPARACIÓN FUGA DE ESCAPE MAS BUJIAS NUEVAS NGK', 230000, 'completada', '2025-12-04');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 2003: OT 3337
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'FRANCISCO ILLANES' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'FRANCISCO ILLANES', '16251212-9', '985462257', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'KCFP74' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'KCFP74', 'BMW', 'X4', 2018, 'ROJA', 84974) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '3337', 'KCFP74', 'CATBACK + WICKED FLOW + COLA DOBLE 3.5" NEGRA', 'CATBACK + WICKED FLOW + COLA DOBLE 3.5" NEGRA', 769900, 'completada', '2025-12-04');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 2004: OT 3338
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'DAN GALDAMES' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'DAN GALDAMES', '17152517-9', '951753610', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'DSGZ46' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'DSGZ46', 'TOYOTA', 'FJ CRUISER', 2012, 'BLANCO', 183000) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '3338', 'DSGZ46', 'REPARACIÓN DE MULTIPLE 2 SOPORTES NUEVOS A LA CAJA MAS MID PIPE', 'REPARACIÓN DE MULTIPLE 2 SOPORTES NUEVOS A LA CAJA MAS MID PIPE', 820000, 'completada', '2025-12-04');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 2005: OT 3339
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'LUIS ALVARADO' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'LUIS ALVARADO', '15923347-2', '978058342', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'SLKY30' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'SLKY30', 'CHEVROLET', 'SILVERADO ZR2', 2023, 'PLATA', 62412) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '3339', 'SLKY30', 'CUT-OUT MAS CONTROL REMOTO', 'CUT-OUT MAS CONTROL REMOTO', 449900, 'completada', '2025-12-04');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 2006: OT 3340
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'DIEGO CÁCERES' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'DIEGO CÁCERES', '18228968-K', '985836804', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'RXGH28' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'RXGH28', 'FORD', 'F-150', 2022, 'ROJO', 60000) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '3340', 'RXGH28', 'CUT-OUT MAS CONTROL REMOTO', 'CUT-OUT MAS CONTROL REMOTO', 449900, 'completada', '2025-12-04');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 2007: OT 3341
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'RODRIGO URZUA' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'RODRIGO URZUA', '18798578-1', '975183677', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'HTLG80' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'HTLG80', 'MERCEDES', 'A200', 2016, 'PLATA', 76000) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '3341', 'HTLG80', 'AXLE BACK FREE', 'AXLE BACK FREE', 249900, 'completada', '2025-12-05');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 2008: OT 3342
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'SEBASTIAN GOMEZ' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'SEBASTIAN GOMEZ', '', '932207914', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'LVZT43' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'LVZT43', 'SUBARU', 'WRX', 2020, 'BLANCO', 80000) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '3342', 'LVZT43', 'SCANNER', 'SCANNER', 25000, 'completada', '2025-12-05');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 2009: OT 3343
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'DIESEL TUNING' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'DIESEL TUNING', '76319264-4', 'DIESEL TUNING', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'GSWR69' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'GSWR69', 'FORD', 'F-150', 2014, 'VERDE', 180000) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '3343', 'GSWR69', 'RECAMBIO DE SILENCIADOR ALTO FLUJO WICKED FLOW POR BORLA 3"', 'RECAMBIO DE SILENCIADOR ALTO FLUJO WICKED FLOW POR BORLA 3"', 100000, 'completada', '2025-12-05');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 2010: OT 3344
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'AGUSTIN MARRA' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'AGUSTIN MARRA', '22512306-3', '976136544', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'SHFV59' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'SHFV59', 'CHEVROLET', 'COLORADO', 2023, 'BLANCO', 20000) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '3344', 'SHFV59', 'STAGE 1 + VACIAR CATALIZADOR', 'STAGE 1 + VACIAR CATALIZADOR', 399900, 'completada', '2025-12-09');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 2011: OT 3345
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'FRANCISCO AGUILERA' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'FRANCISCO AGUILERA', '', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'SKXX96' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'SKXX96', 'CHEVROLET', 'CORVETTE', 1973, 'CELESTE', 0) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '3345', 'SKXX96', 'REPARACIÓN', 'REPARACIÓN', 1200000, 'completada', '2025-12-09');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 2012: OT 3346
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'SEBASTIAN GOMEZ' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'SEBASTIAN GOMEZ', '', '932207914', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'LVZT43' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'LVZT43', 'SUBARU', 'WRX', 2020, 'BLANCO', 80000) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '3346', 'LVZT43', 'REPARACIÓN', 'REPARACIÓN', 449900, 'completada', '2025-12-09');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 2013: OT 3347
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'ARNAU MUÑOZ' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'ARNAU MUÑOZ', '24724507-3', '934081311', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'RCKZ14' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'RCKZ14', 'DODGE', 'DURANGO', 2022, 'BLANCO', 57504) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '3347', 'RCKZ14', 'REMOVER SILENCIADOR CENTRAL MAS INSTALACION DE SILENCIADOR ALTO FLUJO MAS COLA CROMADA 4"', 'REMOVER SILENCIADOR CENTRAL MAS INSTALACION DE SILENCIADOR ALTO FLUJO MAS COLA CROMADA 4"', 649800, 'completada', '2025-12-10');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 2014: OT 3348
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'CRISTIAN BENAVIDES' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'CRISTIAN BENAVIDES', '18338190-3', '952769401', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'GPFB26' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'GPFB26', 'MINI', 'COOPER S', 2014, 'NEGRO', 94000) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '3348', 'GPFB26', 'CUT-OUT MAS CONTROL REMOTO', 'CUT-OUT MAS CONTROL REMOTO', 400000, 'completada', '2025-12-10');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 2015: OT 3349
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'FRANCISCO ASTUDILLO' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'FRANCISCO ASTUDILLO', '15947242-6', '989948079', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'DYSH85' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'DYSH85', 'BMW', '116i', 2012, 'NEGRO', 141787) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '3349', 'DYSH85', 'SILENCIADOR ALTO FLUJO MAS COLAS 3" DOBLE CROMO', 'SILENCIADOR ALTO FLUJO MAS COLAS 3" DOBLE CROMO', 349900, 'completada', '2025-12-10');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 2016: OT 3350
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'HORACIO MORA' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'HORACIO MORA', '15450728-0', '974760592', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'VRDH42' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'VRDH42', 'SUBARU', 'WRX', 2026, 'PLATA', 400) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '3350', 'VRDH42', 'CATBACK+ COLAS CROMO', 'CATBACK+ COLAS CROMO', 849900, 'completada', '2025-12-11');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 2017: OT 3351
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'MARIA JOSÉ CORREA' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'MARIA JOSÉ CORREA', '17987162-9', '983185466', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'JWVH44' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'JWVH44', 'FORD', 'F-150', 2018, 'PLATA', 186000) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '3351', 'JWVH44', 'LINEA CON SALIDA DOBLE + VALVETRONIC SMG + 1 CONTROL + 1 COLA NEGRA POR LADO', 'LINEA CON SALIDA DOBLE + VALVETRONIC SMG + 1 CONTROL + 1 COLA NEGRA POR LADO', 1499900, 'completada', '2025-12-12');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 2018: OT 3352
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'JUAN MANRIQUEZ' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'JUAN MANRIQUEZ', '18229955-3', '996457754', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'SZXS80' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'SZXS80', 'FORD', 'MUSTANG MACH 1', 2024, 'CELESTS', 18000) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '3352', 'SZXS80', 'INTAKE +X-PIPE + REPRO', 'INTAKE +X-PIPE + REPRO', 1469700, 'completada', '2025-12-12');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 2019: OT 3353
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'CAMILO OYARZUN' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'CAMILO OYARZUN', '16356916-7', '950152828', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'RFGB55' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'RFGB55', 'BMW', '128Ti', 2021, 'GRIS', 80000) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '3353', 'RFGB55', 'AXLE BACK + 2 SILENCIADORES ALTO FLUJO', 'AXLE BACK + 2 SILENCIADORES ALTO FLUJO', 729900, 'completada', '2025-12-15');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 2020: OT 3354
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'ALEXIS GANDARA' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'ALEXIS GANDARA', '76982089-2', '939171844', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'KYSB90' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'KYSB90', 'MERCEDES', 'E63S', 2019, 'BLANCO', 24000) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '3354', 'KYSB90', 'REPARACIÓN', 'REPARACIÓN', 99900, 'completada', '2025-12-15');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 2021: OT 3355
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'LUIS NOVA' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'LUIS NOVA', '76735954-3', '975302496', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'PBGY61' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'PBGY61', 'CHEVROLET', 'SILVERADO', 2021, 'GRIS', 92482) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '3355', 'PBGY61', 'CUT OUT', 'CUT OUT', 449900, 'completada', '2025-12-15');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 2022: OT 3356
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'GUILLERMO FARIAS' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'GUILLERMO FARIAS', '76.995.411-2', '996585828', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'GWVS69' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'GWVS69', 'BMW', 'X6', 2015, 'ROJO', 61100) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '3356', 'GWVS69', 'AXLE MAS 4 SILENCIADORES CON VALVULAS OEM + 450 PINTURA LLANTAS NEGRO BRILLANTE', 'AXLE MAS 4 SILENCIADORES CON VALVULAS OEM + 450 PINTURA LLANTAS NEGRO BRILLANTE', 2449900, 'completada', '2025-12-15');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 2023: OT 3357
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'DIEGO MALLEA' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'DIEGO MALLEA', '17661076-K', '983031843', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'VCJC53' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'VCJC53', 'SUBARU', 'IMPREZA WRX', 2025, 'AZUL', 10000) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '3357', 'VCJC53', 'CATBACK + WICKE FLOW Y COLAS CROMO 4"', 'CATBACK + WICKE FLOW Y COLAS CROMO 4"', 849900, 'completada', '2025-12-17');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 2024: OT 3358
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'ELEAZAR MOLINA' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'ELEAZAR MOLINA', '19.467.378-7', '998879340', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'FLOWMASTER' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'FLOWMASTER', 'FLOWMASTER', 'FLOWMASTER', 0, 'FLOWMASTER', 0) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '3358', 'FLOWMASTER', 'VENTA REGION FLOWMASTE', 'VENTA REGION FLOWMASTE', 199900, 'completada', '2025-12-17');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 2025: OT 3359
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'AGRICOLA LA ARBOLEDA' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'AGRICOLA LA ARBOLEDA', '77008850-K', '974795849', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'SWGY40' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'SWGY40', 'CHEVROLET', 'SILVERADO', 2023, 'GRIS', 27000) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '3359', 'SWGY40', 'INSTALACIÓN ESCAPE', 'INSTALACIÓN ESCAPE', 90000, 'completada', '2025-12-17');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 2026: OT 3360
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'DIESEL TUNING' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'DIESEL TUNING', '76319264-4', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'TSHX45' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'TSHX45', 'CHEVROLET', 'SUBURBAN', 2024, 'BLANCO', 22156) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '3360', 'TSHX45', 'SILENCIADOR ALTO FLUJO BORLA PRO XS', 'SILENCIADOR ALTO FLUJO BORLA PRO XS', 350000, 'completada', '2025-12-17');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 2027: OT 3361
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'RAMI ALMHNA' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'RAMI ALMHNA', '25034801-0', '972174840', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'LFYC90' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'LFYC90', 'BMW', '420i', 2019, 'BLANCO', 83000) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '3361', 'LFYC90', 'CAMBIO DE BUJIAS -1', 'CAMBIO DE BUJIAS -1', 169900, 'completada', '2025-12-18');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 2028: OT 3362
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'NICOLAS LUNCUMILLA' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'NICOLAS LUNCUMILLA', '15724099-4', '957747556', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'JWTS41' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'JWTS41', 'FORD', 'F150', 2018, 'NEGRO', 147000) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '3362', 'JWTS41', 'CATBACK + VALVETRONIC + 1 COLA POR LADO 4"', 'CATBACK + VALVETRONIC + 1 COLA POR LADO 4"', 1499900, 'completada', '2025-12-18');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 2029: OT 3363
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'ALVARO COVA' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'ALVARO COVA', '24907391-1', '934187159', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'SIN-PAT' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'SIN-PAT', 'SUZUKI', 'SWIFT', 2020, 'GRIS', 77000) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '3363', 'SIN-PAT', 'RECUBRIMIENTO TERMICO', 'RECUBRIMIENTO TERMICO', 99900, 'completada', '2025-12-18');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 2030: OT 3364
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'JOAQUIN URRUTIA' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'JOAQUIN URRUTIA', '17603270-7', '999111343', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'VRCV81' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'VRCV81', 'FORD', 'F-150 RAPTOR', 2026, 'NEGRA', 600) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '3364', 'VRCV81', 'REPRO + ESCAPE', 'REPRO + ESCAPE', 1499900, 'completada', '2025-12-19');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 2031: OT 3365
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'CRISTOPHER PARDO' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'CRISTOPHER PARDO', '17878207-K', '997558200', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'KZDB44' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'KZDB44', 'FORD', 'MUSTANG', 2019, 'NEGRO', 85000) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '3365', 'KZDB44', 'X-PIPE MAS PINTURA COLAS', 'X-PIPE MAS PINTURA COLAS', 279900, 'completada', '2025-12-19');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 2032: OT 3366
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'MATIAS RUA' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'MATIAS RUA', '24750054-5', '985558366', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'PL8190' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'PL8190', 'CHEVROLET', 'TAHOE', 1997, 'VERDE', 160000) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '3366', 'PL8190', 'CATBACK + MAGNAFLOW OVALADO + COLAS', 'CATBACK + MAGNAFLOW OVALADO + COLAS', 1399900, 'completada', '2025-12-22');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 2033: OT 3367
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'HUGO CARNDENAS' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'HUGO CARNDENAS', '16872550-7', '978479154', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'RYFC33' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'RYFC33', 'BMW', '420I', 2022, 'NEGRO', 25500) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '3367', 'RYFC33', 'AXLE BACK + CUT OUT + 1 CONTROL + COLAS NEGRAS 3.5" + LIP MALETERO + TAPAS ESPEJOS', 'AXLE BACK + CUT OUT + 1 CONTROL + COLAS NEGRAS 3.5" + LIP MALETERO + TAPAS ESPEJOS', 1019800, 'completada', '2025-12-22');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 2034: OT 3368
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'MIGUEL RIOS' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'MIGUEL RIOS', '17309479-5', '979536481', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'KPTR90' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'KPTR90', 'FORD', 'F150', 2018, 'BLANCO', 70000) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '3368', 'KPTR90', 'WICKED FLOW KAMIKAZE+SALIDA "Y"+ 2 COLAS NEGRA MATE', 'WICKED FLOW KAMIKAZE+SALIDA "Y"+ 2 COLAS NEGRA MATE', 990000, 'completada', '2025-12-22');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 2035: OT 3369
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'JONATHAN CARRASCO' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'JONATHAN CARRASCO', '18385710-K', '957085732', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'SIN-PAT' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'SIN-PAT', 'KIA', 'KOUP', 2010, 'BLANCO', 120000) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '3369', 'SIN-PAT', 'GOMAS SOPORTE ESCAPE', 'GOMAS SOPORTE ESCAPE', 9000, 'completada', '2025-12-22');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 2036: OT 3370
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'RENE ESCOBAR' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'RENE ESCOBAR', '18354504-3', '961207484', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'VKHR77' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'VKHR77', 'SUBARU', 'IMPREZA WRX', 2026, 'GRIS', 2500) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '3370', 'VKHR77', 'INSTALACIÓN INTAKE', 'INSTALACIÓN INTAKE', 45000, 'completada', '2025-12-22');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 2037: OT 3371
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'BELEN BARAHONA' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'BELEN BARAHONA', '19041364-0', '977456990', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'SJVV58' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'SJVV58', 'CHEVROLET', 'SILVERADO', 2023, 'GRIS', 30000) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '3371', 'SJVV58', 'SILENCIADOR ALTO FLUJO WICKED FLOW KAMIKAZE', 'SILENCIADOR ALTO FLUJO WICKED FLOW KAMIKAZE', 349900, 'completada', '2025-12-23');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 2038: OT 3372
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'PAU SANTOS ROCHA' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'PAU SANTOS ROCHA', '24096926-2', '955269864', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'PRWB33' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'PRWB33', 'CUPRA', 'FORMENTOR VZ', 2021, 'BLANCO', 64000) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '3372', 'PRWB33', 'INSTALACIÓN COLAS MAS DISPOSITIVO MANUAL DE APERTURA ESCAPE', 'INSTALACIÓN COLAS MAS DISPOSITIVO MANUAL DE APERTURA ESCAPE', 140000, 'completada', '2025-12-29');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 2039: OT 3373
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'HANS' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'HANS', '', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'GR9425' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'GR9425', 'CHEVROLET', 'CAMARO', 1973, 'GRIS', 0) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '3373', 'GR9425', 'REPARACIÓN', 'REPARACIÓN', 60000, 'completada', '2025-12-29');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 2040: OT 3374
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'FELIPE ARELLANO' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'FELIPE ARELLANO', '15890813-1', '947975060', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'HELICOPTERO' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'HELICOPTERO', 'HELICOPTERO', 'HELICOPTERO', 0, 'HELICOPTERO', 0) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '3374', 'HELICOPTERO', 'REPARACIÓN', 'REPARACIÓN', 12000, 'completada', '2025-12-29');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 2041: OT 3375
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'MARCELO SOARZO' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'MARCELO SOARZO', '16888568-7', '942563247', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'BWKG63' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'BWKG63', 'MERCEDES', 'KOMPRESSOR', 2009, 'PLATA', 170000) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '3375', 'BWKG63', 'LINEA + COLA CROMO 3"', 'LINEA + COLA CROMO 3"', 759800, 'completada', '2025-12-30');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 2042: OT 3376
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'CRISTIAN QUILAMAN' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'CRISTIAN QUILAMAN', '15987626-8', '975252066', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'KPFX40' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'KPFX40', 'TOYOTA', 'HILUX', 2018, 'ROJO', 119000) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '3376', 'KPFX40', 'CAMBIO DE COLA CROMO 4"', 'CAMBIO DE COLA CROMO 4"', 159900, 'completada', '2025-12-30');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 2043: OT 3377
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'MAURICIO FUENTES' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'MAURICIO FUENTES', '20985032-K', '933975765', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'TZFH38' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'TZFH38', 'HYUNDAI', 'ACCENT', 2025, 'ROJO', 53000) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '3377', 'TZFH38', 'AXLE BACK + COLA CROMO 3"', 'AXLE BACK + COLA CROMO 3"', 300000, 'completada', '2025-12-30');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 2044: OT 3378
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'CRISTIAN AGUILAR' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'CRISTIAN AGUILAR', '22620916-6', '927493678', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'TYYG95' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'TYYG95', 'KAIYI', 'KYE5', 2025, 'PLATA', 31000) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '3378', 'TYYG95', 'CAMBIO DE ACEITE FUCH + FILTRO ACEITE + REPRO STAGE 1', 'CAMBIO DE ACEITE FUCH + FILTRO ACEITE + REPRO STAGE 1', 400000, 'completada', '2025-12-30');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 2045: OT 3379
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'DIEGO ANTICOI' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'DIEGO ANTICOI', '19918967-0', '952048578', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'HHPW72' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'HHPW72', 'AUDI', 'A3', 2015, 'BLANCO', 93000) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '3379', 'HHPW72', 'CUT-OUT + REPRO STAGE 1', 'CUT-OUT + REPRO STAGE 1', 679800, 'completada', '2025-12-31');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 2046: OT 3380
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'RODRIGO TAPIA' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'RODRIGO TAPIA', '6976568-8', '979966852', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'RKHF30' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'RKHF30', 'CHEVROLET', 'SILVERADO', 2022, 'NEGRO', 60000) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '3380', 'RKHF30', 'CUT-OUT + CONTROL REMOTO', 'CUT-OUT + CONTROL REMOTO', 449900, 'completada', '2025-12-31');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 2047: OT 3381
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'ERICK CAROCA' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'ERICK CAROCA', '15736622-K', '965953885', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'SIN-PAT' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'SIN-PAT', 'BMW', '140', 2022, 'S/C', 0) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '3381', 'SIN-PAT', 'RECUBRIMIENTO TERMICO', 'RECUBRIMIENTO TERMICO', 89900, 'completada', '2025-12-31');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 2048: OT 3382
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'BENJAMIN MORALES' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'BENJAMIN MORALES', '21226116-5', '977830669', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'DWRT52' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'DWRT52', 'VW', 'POLO', 2012, 'PLATA', 150000) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '3382', 'DWRT52', 'REPRO STAGE 1', 'REPRO STAGE 1', 549800, 'completada', '2025-01-05');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 2049: OT 3383
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'SEBASTIAN TOUMA' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'SEBASTIAN TOUMA', '19671855-9', '967465571', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'VPWH83' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'VPWH83', 'BMW', '220I', 2026, 'BLANCO', 1100) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '3383', 'VPWH83', 'CATBACK + COLAS CROMO', 'CATBACK + COLAS CROMO', 749900, 'completada', '2025-01-05');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 2050: OT 3384
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'BLAS VARGAS' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'BLAS VARGAS', '19730664-5', '984994702', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'TVBF61' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'TVBF61', 'CHERY', 'TIGGO 8', 2024, 'GRIS', 6700) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '3384', 'TVBF61', 'REPRO STAGE 1', 'REPRO STAGE 1', 299900, 'completada', '2025-01-05');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 2051: OT 3385
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'AUTOMECANICA RVAL' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'AUTOMECANICA RVAL', '76515620-3', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'SIN-PAT' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'SIN-PAT', 'DATSUN', '240SX', 1990, 'BLANCO', 300000) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '3385', 'SIN-PAT', 'CATBACK RESTAURACIÓN', 'CATBACK RESTAURACIÓN', 450000, 'completada', '2025-01-05');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 2052: OT 3386
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'CRISTOBAL CABALLERO' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'CRISTOBAL CABALLERO', '19619493-2', '940967883', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'JYWG93' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'JYWG93', 'FORD', 'F150', 2018, 'BLANCO', 137000) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '3386', 'JYWG93', 'AXLE BACK SALIDA DOBLE COLAS NEGRAS', 'AXLE BACK SALIDA DOBLE COLAS NEGRAS', 649900, 'completada', '2025-01-06');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 2053: OT 3387
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'PÍETRO LOBOS' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'PÍETRO LOBOS', '22173904-3', '956422768', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'PBGT79' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'PBGT79', 'MERCEDES', 'A200', 2021, 'BLANCO', 30000) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '3387', 'PBGT79', 'MANTENCIÓN', 'MANTENCIÓN', 149900, 'completada', '2025-01-06');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 2054: OT 3388
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'MATIAS URZUA' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'MATIAS URZUA', '16646696-2', '957028836', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'HDXY29' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'HDXY29', 'MERCEDES', 'GLA200', 2015, 'NEGRO', 150000) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '3388', 'HDXY29', 'MANTENCIÓN 150.000 ACEITE, FILTRO ACEITE, POLEN Y AIRE REPARACIÓN DE ESCAPE', 'MANTENCIÓN 150.000 ACEITE, FILTRO ACEITE, POLEN Y AIRE REPARACIÓN DE ESCAPE', 209600, 'completada', '2025-01-06');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 2055: OT 3389
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'ABRAHAM MUÑOZ' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'ABRAHAM MUÑOZ', '20190004-2', '973390266', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'HCLW94' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'HCLW94', 'FORD', 'MUSTANG GT', 2015, 'ROJO', 80000) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '3389', 'HCLW94', 'REMOVER AMBOS SILENACIADORES', 'REMOVER AMBOS SILENACIADORES', 538600, 'completada', '2025-01-07');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 2056: OT 3390
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'MARIO LARA' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'MARIO LARA', '19890609-3', '982623350', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'TW5265' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'TW5265', 'JAGUAR', 'XJ', 2007, 'NEGRO', 146000) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '3390', 'TW5265', 'MUFFLER DELETE', 'MUFFLER DELETE', 150000, 'completada', '2025-01-07');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 2057: OT 3391
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'MATIAS VALENCIA' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'MATIAS VALENCIA', '17729362-8', '982838400', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'VKTY44' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'VKTY44', 'SUZUKI', 'SWIFT', 2026, 'AZUL', 1000) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '3391', 'VKTY44', 'INSTALACIÓN CATBACK REMUS', 'INSTALACIÓN CATBACK REMUS', 150000, 'completada', '2025-01-07');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 2058: OT 3392
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'BORIS QUIROZ' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'BORIS QUIROZ', '19744905-5', '991097691', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'SIN-PAT' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'SIN-PAT', 'FORD', 'EXPLORER', 2025, 'AZUL', 10000) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '3392', 'SIN-PAT', 'AXLE BACK FREE MAS COLAS NEGRAS DOBLES 4"', 'AXLE BACK FREE MAS COLAS NEGRAS DOBLES 4"', 449900, 'completada', '2025-01-07');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 2059: OT 3393
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'JAVIER LUNA' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'JAVIER LUNA', '19484521-9', '995917922', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'GHPX96' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'GHPX96', 'VW', 'GOLF', 2015, 'BLANCO', 114032) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '3393', 'GHPX96', 'MANTENCIÓN + CAMBIO ACEITE + FILTRO ACEITE + FILTRO POLEN', 'MANTENCIÓN + CAMBIO ACEITE + FILTRO ACEITE + FILTRO POLEN', 128800, 'completada', '2025-01-07');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 2060: OT 3394
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'TRANSPORTES LS' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'TRANSPORTES LS', '76704181-0', '998174044', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'VRDF71' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'VRDF71', 'FORD', 'RANGER RAPTOR', 2026, 'GRIS', 2000) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '3394', 'VRDF71', 'LINEA + BMC + BUJIAS', 'LINEA + BMC + BUJIAS', 2584700, 'completada', '2025-01-08');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 2061: OT 3395
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'MATIAS VALENCIA' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'MATIAS VALENCIA', '17729362-8', '982838400', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'VKTY44' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'VKTY44', 'SUZUKI', 'SWIFT', 2026, 'AZUL', 2500) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '3395', 'VKTY44', 'INSTALACIÓN DOWNPIPE', 'INSTALACIÓN DOWNPIPE', 185000, 'completada', '2025-01-08');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 2062: OT 3396
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'VICENTE CONTRERAS' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'VICENTE CONTRERAS', '21294072-0', '982515841', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'KLBW45' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'KLBW45', 'MERCEDES', 'A250', 2018, 'PLATA', 74000) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '3396', 'KLBW45', 'CUT-OUT MAS CONTROL', 'CUT-OUT MAS CONTROL', 450000, 'completada', '2025-01-08');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 2063: OT 3397
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'GONZALO QUIROZ' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'GONZALO QUIROZ', '16702409-3', '983877803', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'LBTK53' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'LBTK53', 'FORD', 'F150', 2019, 'BLANCO', 80000) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '3397', 'LBTK53', 'CUT-OUT DB-KILLER', 'CUT-OUT DB-KILLER', 430000, 'completada', '2025-01-09');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 2064: OT 3398
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'MATIAS URZUA' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'MATIAS URZUA', '16646696-2', '957028836', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'HDXY29' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'HDXY29', 'MERCEDES', 'GLA200', 2015, 'NEGRO', 150000) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '3398', 'HDXY29', 'SPRINTBOOSTER', 'SPRINTBOOSTER', 279900, 'completada', '2025-01-09');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 2065: OT 3399
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'AQUILES CASTRO' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'AQUILES CASTRO', '21412786-5', '997576549', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'SKZT99' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'SKZT99', 'MAZDA', 'MX5', 2023, 'GRIS', 39700) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '3399', 'SKZT99', 'MULTIPLES POPS Y REPRO', 'MULTIPLES POPS Y REPRO', 1100000, 'completada', '2025-01-12');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 2066: OT 3400
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'DIESEL TUNING' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'DIESEL TUNING', '76319264-4', '988298131', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'GWXL83' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'GWXL83', 'MINI', 'COOPER S', 2014, 'BLANCO', 95000) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '3400', 'GWXL83', 'CAMBIO SILENCIADOR POR WICKED FLOW', 'CAMBIO SILENCIADOR POR WICKED FLOW', 385000, 'completada', '2026-01-12');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 2067: OT 3401
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'DIEGO ORDENES' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'DIEGO ORDENES', '16977905-8', '993192710', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'SB8121' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'SB8121', 'CHEVROLET', 'SILVERADO', 1997, 'CELESTE', 237631) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '3401', 'SB8121', 'CAMBIO BUJIAS', 'CAMBIO BUJIAS', 128900, 'completada', '2026-01-12');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 2068: OT 3402
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'BERNARDO FERNANDEZ' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'BERNARDO FERNANDEZ', '17704229-3', '978393986', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'SIN-PAT' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'SIN-PAT', 'MITSUBISHI', 'LANCER', 1998, 'BLANCO', 200000) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '3402', 'SIN-PAT', 'REPARACIÓN DE MULTIPLE', 'REPARACIÓN DE MULTIPLE', 160000, 'completada', '2026-01-12');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 2069: OT 3403
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'MARTIN MOYA' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'MARTIN MOYA', '20392484-4', '978872240', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'TKCV74' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'TKCV74', 'FORD', 'MAVERICK', 2024, 'AZUL', 31000) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '3403', 'TKCV74', 'REPRO STAGE 1', 'REPRO STAGE 1', 349900, 'completada', '2026-01-12');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 2070: OT 3404
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'JOAQUIN RENDIC' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'JOAQUIN RENDIC', '19245541-3', '940894533', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'JXXC30' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'JXXC30', 'BMW', 'M4', 2018, 'NEGRO', 49000) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '3404', 'JXXC30', 'AXLE BACK', 'AXLE BACK', 1499900, 'completada', '2026-01-13');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 2071: OT 3405
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'KAUFMANN' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'KAUFMANN', '', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'TVVL50' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'TVVL50', 'MERCEDES', 'G800', 2025, 'NEGRO', 10000) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '3405', 'TVVL50', 'REPARACION VALVULAS ESCAPE', 'REPARACION VALVULAS ESCAPE', 599900, 'completada', '2026-01-13');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 2072: OT 3406
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'KAUFMANN' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'KAUFMANN', '', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'SPBS97' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'SPBS97', 'MERCEDES', 'A35S', 2023, 'GRIS', 10000) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '3406', 'SPBS97', 'REPARACIÓN LINEA MAS VALVULAS', 'REPARACIÓN LINEA MAS VALVULAS', 919900, 'completada', '2026-01-13');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 2073: OT 3407
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'TRANSPORTES LS' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'TRANSPORTES LS', '76704181-0', '998174044', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'SLRR67' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'SLRR67', 'RAM', '2500', 2026, 'PLATA', 40000) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '3407', 'SLRR67', '7290000 DPF Y EGR OFF BULLY DOG ECU NUEVA', '7290000 DPF Y EGR OFF BULLY DOG ECU NUEVA', 1100000, 'completada', '2026-01-13');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 2074: OT 3408
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'LUIS FERREIRA' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'LUIS FERREIRA', '6613642-6', '950804086', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'AA2222' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'AA2222', 'VW', 'COMBI', 1975, 'BLANCO', 200000) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '3408', 'AA2222', 'SILENCIADOR A MEDIDA MAS ESCAPE', 'SILENCIADOR A MEDIDA MAS ESCAPE', 350000, 'completada', '2026-01-13');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 2075: OT 3409
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'DASSEN' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'DASSEN', '77537871-9', '987670659', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'AA1111' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'AA1111', 'VW', 'TIGUAN', 2019, 'BLANCA', 90000) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '3409', 'AA1111', 'VENTA COLAS 4" DOBLE', 'VENTA COLAS 4" DOBLE', 249900, 'completada', '2026-01-13');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 2076: OT 3410
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'JUAN ARAYA' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'JUAN ARAYA', '15745527-3', '982557266', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'GXGB88' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'GXGB88', 'JEEP', 'GRAND CHEROKEE', 2015, 'NEGRO', 182000) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '3410', 'GXGB88', 'X-PIPE + SILENCIADOR ALTO FLUJO VALVETRONIC + COLAS 4" CROMO', 'X-PIPE + SILENCIADOR ALTO FLUJO VALVETRONIC + COLAS 4" CROMO', 1600000, 'completada', '2026-01-14');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 2077: OT 3411
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'SEBASTIAN SALINAS' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'SEBASTIAN SALINAS', '77152386-2', '984043940', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'KFXS81' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'KFXS81', 'BMW', '540', 2018, 'GRIS', 83000) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '3411', 'KFXS81', 'DOWNPIPE + PROTECCIÓN TERMICA + REPRO STAGE 2 + BUJIAS  -1 GRADO', 'DOWNPIPE + PROTECCIÓN TERMICA + REPRO STAGE 2 + BUJIAS  -1 GRADO', 1150000, 'completada', '2025-01-15');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 2078: OT 3412
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'NIBALDO ARANCIBIA' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'NIBALDO ARANCIBIA', '19588338-6', '962048770', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'JRWH18' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'JRWH18', 'MERCEDES', 'A200', 2017, 'BLANCO', 153000) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '3412', 'JRWH18', 'CUT-OUT MAS CONTROL REMOTO', 'CUT-OUT MAS CONTROL REMOTO', 449900, 'completada', '2026-01-16');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 2079: OT 3413
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'JUAN MUÑOZ' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'JUAN MUÑOZ', '78278577-K', '998837086', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'STXH86' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'STXH86', 'FORD', 'F150', 2024, 'BLANCO', 60000) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '3413', 'STXH86', 'CUT-OUT SPRINTBOOSTER + BMC', 'CUT-OUT SPRINTBOOSTER + BMC', 859700, 'completada', '2026-01-16');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 2080: OT 3414
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'TOMAS MONROY' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'TOMAS MONROY', '21199168-2', '969178676', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'KSXS32' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'KSXS32', 'VW', 'SCIROCCO', 2018, 'BLANCO', 75000) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '3414', 'KSXS32', 'CUT OUT MAS CONTROL', 'CUT OUT MAS CONTROL', 449900, 'completada', '2026-01-16');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 2081: OT 3415
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'GABRIEL PONCE' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'GABRIEL PONCE', '26213430', '5492664301288', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'SIN-PAT' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'SIN-PAT', 'AUDI', 'A7', 2017, 'PLATA', 49000) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '3415', 'SIN-PAT', 'DOBLE CUT OUT MAS MUFFLER DELETE', 'DOBLE CUT OUT MAS MUFFLER DELETE', 1009900, 'completada', '2026-01-19');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 2082: OT 3416
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'FRANCISCO BOBADILLA' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'FRANCISCO BOBADILLA', '18220313-0', '944903816', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'RGTW60' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'RGTW60', 'JEEP', 'GRAND CHEROKEE', 2022, 'BLANCO', 55000) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '3416', 'RGTW60', 'LINEA COMPLETAS MAS VALVETRONIC MAS 1 CONTROL COLAS CROMO', 'LINEA COMPLETAS MAS VALVETRONIC MAS 1 CONTROL COLAS CROMO', 2100000, 'completada', '2025-01-19');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 2083: OT 3417
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'SEBASTIAN AGUIRRE' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'SEBASTIAN AGUIRRE', '18298095-1', '975291632', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'PKTT10' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'PKTT10', 'BMW', 'M235', 2021, 'AZUL', 49000) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '3417', 'PKTT10', 'CATBACK MAS SILENCIADOR ALTO FLUJO WICKED FLOW COLAS NEGRAS', 'CATBACK MAS SILENCIADOR ALTO FLUJO WICKED FLOW COLAS NEGRAS', 849000, 'completada', '2026-01-19');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 2084: OT 3418
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'MATIAS CARVAJAL' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'MATIAS CARVAJAL', '14255675-2', '964866880', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'HG3131' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'HG3131', 'HYUNDAI', 'GENESIS', 2012, 'ROJO', 130000) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '3418', 'HG3131', 'INSPECCIÓN', 'INSPECCIÓN', 25000, 'completada', '2026-01-19');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 2085: OT 3419
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'SIMON ALVAREZ' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'SIMON ALVAREZ', '19112927-K', '976370656', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'FTBR19' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'FTBR19', 'FIAT', 'BRAVO', 2010, 'BLANCO', 120000) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '3419', 'FTBR19', 'RECUBRIMIENTO TERMICO MULTIPLE TURBO Y MODIFICAR MULTIPLE', 'RECUBRIMIENTO TERMICO MULTIPLE TURBO Y MODIFICAR MULTIPLE', 304900, 'completada', '2026-01-19');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 2086: OT 3420
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'RENATO RIVERA' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'RENATO RIVERA', '20296580-6', '966304303', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'STARKEN' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'STARKEN', 'MAGNAFLOW', 'SILENCIADOR', 2000, 'BLANCO', 100000) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '3420', 'STARKEN', 'SILENCIADOR ALTO FLUJO MAGNAFLOW', 'SILENCIADOR ALTO FLUJO MAGNAFLOW', 209900, 'completada', '2026-01-19');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 2087: OT 3421
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'IVAN ARIS' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'IVAN ARIS', '5748448-9', '998222010', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'VRYG76' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'VRYG76', 'FORD', 'F150', 2025, 'ROJO', 700) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '3421', 'VRYG76', 'INSTALACIÓN LINEA', 'INSTALACIÓN LINEA', 199900, 'completada', '2026-01-20');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 2088: OT 3422
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'YORDANO CID' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'YORDANO CID', '12386675-4', '982407526', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'TZHL10' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'TZHL10', 'CHEVROLET', 'SILVERADO', 2025, 'NEGRA', 60000) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '3422', 'TZHL10', 'CUT-OUT', 'CUT-OUT', 449900, 'completada', '2026-01-20');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 2089: OT 3423
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'MATIAS ORELLANA' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'MATIAS ORELLANA', '17459970-K', '933545615', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'JPJW69' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'JPJW69', 'SUBARU', 'WRX', 2017, 'BLANCO', 94000) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '3423', 'JPJW69', 'CAMBIO DE FLEXIBLE', 'CAMBIO DE FLEXIBLE', 210000, 'completada', '2026-01-21');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 2090: OT 3424
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'ALFONSO GAMBOA' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'ALFONSO GAMBOA', '20508435-5', '989056310', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'GLYB87' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'GLYB87', 'BMW', '335', 2014, 'PLATA', 140000) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '3424', 'GLYB87', 'AXLE BACK COLAS NEGRAS 4"', 'AXLE BACK COLAS NEGRAS 4"', 549900, 'completada', '2026-01-22');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 2091: OT 3425
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'MARCELO SAN MARTIN' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'MARCELO SAN MARTIN', '19053610-6', '966949210', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'FRSD32' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'FRSD32', 'HYUNDAI', 'ELANTRA', 2012, 'NEGRO', 200000) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '3425', 'FRSD32', 'BOSS SHINE SHAMPOO HIDRO', 'BOSS SHINE SHAMPOO HIDRO', 9000, 'completada', '2026-01-22');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 2092: OT 3426
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'MAX WOLFF' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'MAX WOLFF', '16097255-6', '995382901', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'JPYX59' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'JPYX59', 'FORD', 'MUSTANG GT', 2017, 'ROJO', 33500) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '3426', 'JPYX59', 'X PIPE', 'X PIPE', 330000, 'completada', '2026-01-22');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 2093: OT 3427
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'MANUEL IGUALT' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'MANUEL IGUALT', '11124974-1', '995384076', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'LH6464' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'LH6464', 'CHEVROLET', 'SILVERADO', 1990, 'VERDE', 219000) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '3427', 'LH6464', 'SALIDA DOBLE DELANTE DE LAS RUEDAS TRASERAS MAS COLA DOBLE', 'SALIDA DOBLE DELANTE DE LAS RUEDAS TRASERAS MAS COLA DOBLE', 1299900, 'completada', '2026-01-22');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 2094: OT 3428
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'IVAN MARTINEZ' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'IVAN MARTINEZ', '77154858-k', '993972232', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'VHPJ65' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'VHPJ65', 'MASERATI', 'MC20', 2023, 'NEGRO', 10000) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '3428', 'VHPJ65', 'LINEA DE ESCAPE', 'LINEA DE ESCAPE', 2499900, 'completada', '2026-01-22');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 2095: OT 3429
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'GEOVANNI ANDREOTTI' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'GEOVANNI ANDREOTTI', '17559010-2', '974668006', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'KRBF83' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'KRBF83', 'CHEVROLET', 'CAMARO', 2018, 'BLANCO', 39900) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '3429', 'KRBF83', 'CUT-OUT', 'CUT-OUT', 449900, 'completada', '2026-01-23');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 2096: OT 3430
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'ORIOL SANCHO' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'ORIOL SANCHO', '14720044-7', '968010335', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'DXTB40' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'DXTB40', 'MINI', 'COOPER JW', 2012, 'BLANCO', 130000) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '3430', 'DXTB40', 'PROTECTOR TERMICO', 'PROTECTOR TERMICO', 200000, 'completada', '2026-01-23');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 2097: OT 3431
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'GONZALO' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'GONZALO', '78058814-4', '942365455', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'HRWT93' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'HRWT93', 'FORD', 'F150', 2016, 'AZUL', 171000) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '3431', 'HRWT93', 'CATBACK VALVELTRONIC MAS COLAS NEGRAS 4"', 'CATBACK VALVELTRONIC MAS COLAS NEGRAS 4"', 1499900, 'completada', '2026-01-26');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 2098: OT 3432
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'MAVERICK GOMEZ' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'MAVERICK GOMEZ', '77834817-9', '950985914', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'VCXD93' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'VCXD93', 'CHEVROLET', 'SILVERADO', 2025, 'NEGRO', 7000) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '3432', 'VCXD93', 'SILENCIADOR ALTO FLUJO WICKED FLOW KAMIKAZE', 'SILENCIADOR ALTO FLUJO WICKED FLOW KAMIKAZE', 349900, 'completada', '2026-01-26');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 2099: OT 3433
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'LUIS HIGUERAS' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'LUIS HIGUERAS', '21860635-0', '996381601', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'KPXW23' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'KPXW23', 'BMW', '118D', 2018, 'GRIS', 33700) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '3433', 'KPXW23', 'MANTENCIÓN', 'MANTENCIÓN', 110000, 'completada', '2026-01-26');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 2100: OT 3434
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'BLAS VARGAS' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'BLAS VARGAS', '19730664-5', '984994702', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'TVBF61' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'TVBF61', 'CHERY', 'TIGGO 8', 2025, 'GRIS', 8500) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '3434', 'TVBF61', 'STAGE 2', 'STAGE 2', 600000, 'completada', '2026-01-26');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    RAISE NOTICE 'Procesados 2100 registros...';
    -- Fila 2101: OT 3435
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'MAXI MUÑOZ' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'MAXI MUÑOZ', '19663091-0', '942527677', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'KCFH19' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'KCFH19', 'BMW', '420', 2018, 'BLANCO', 108000) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '3435', 'KCFH19', 'CATBACK MAS POPS DOWNPIPE COLAS 3" EN CROMO', 'CATBACK MAS POPS DOWNPIPE COLAS 3" EN CROMO', 2100000, 'completada', '2026-01-27');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 2102: OT 3436
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'SEBASTIAN URRA' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'SEBASTIAN URRA', '19782565-0', '991957375', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'CTJD98' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'CTJD98', 'NISSAN', '370Z', 2011, 'PLATA', 80000) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '3436', 'CTJD98', 'AXLE BACK CON VALVETREONIC INCLUYE 1 CONTROL 1 AÑO DE GARANTIA', 'AXLE BACK CON VALVETREONIC INCLUYE 1 CONTROL 1 AÑO DE GARANTIA', 990000, 'completada', '2026-01-27');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 2103: OT 3437
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'VICTOR QUINTEOS' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'VICTOR QUINTEOS', '20335729-K', '976180224', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'SZPS42' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'SZPS42', 'CUPRA', 'FORMENTOR', 2023, 'BLANCO', 38000) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '3437', 'SZPS42', 'REPARACIÓN', 'REPARACIÓN', 175000, 'completada', '2026-01-27');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 2104: OT 3438
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'FERNANDO CHAPARRO' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'FERNANDO CHAPARRO', '15943479-6', '991387584', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'SIN-PAT' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'SIN-PAT', 'FORD', 'MUSTANG DARK HORSE', 2026, 'GRIS', 2700) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '3438', 'SIN-PAT', 'X-PIPE', 'X-PIPE', 299900, 'completada', '2026-01-28');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 2105: OT 3439
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'LUIS MIRANDA' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'LUIS MIRANDA', '10641933-7', '992300149', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'VGFL70' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'VGFL70', 'BMW', 'M5 COMPETITION', 2025, 'GRIS', 12629) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '3439', 'VGFL70', 'AXLE BACK', 'AXLE BACK', 1750000, 'completada', '2026-01-28');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 2106: OT 3440
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'BRYAN PEÑA' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'BRYAN PEÑA', '26282203-6', '976118732', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'PFTX88' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'PFTX88', 'MERCEDES', 'A35', 2020, 'BLANCO', 65000) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '3440', 'PFTX88', 'CUT-OUT', 'CUT-OUT', 449900, 'completada', '2026-01-28');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 2107: OT 3441
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'JAVIER SANDOVAL' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'JAVIER SANDOVAL', '77561443-9', '985740619', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'VSRV25' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'VSRV25', 'MAZDA', 'MX-5', 2026, 'AZUL', 1300) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '3441', 'VSRV25', 'BORLA MAS COLA CROMO DOBLE 3"', 'BORLA MAS COLA CROMO DOBLE 3"', 499900, 'completada', '2026-01-29');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 2108: OT 3442
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'CRISTIAN VAZQUES' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'CRISTIAN VAZQUES', '18740760-5', '989494179', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'SPKY13' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'SPKY13', 'SUZUKI', 'SWIFT', 2022, 'ROJO', 56000) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '3442', 'SPKY13', 'REINSTALACIÓN DE LINEA', 'REINSTALACIÓN DE LINEA', 150000, 'completada', '2026-01-29');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 2109: OT 3443
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'JAVIER CASADO' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'JAVIER CASADO', '25727861-1', '967776315', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'GJRK59' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'GJRK59', 'TOYOTA', 'FJ CRUISER', 2014, 'NEGRO', 144000) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '3443', 'GJRK59', 'GARANTIA', 'GARANTIA', 40000, 'completada', '2026-01-29');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 2110: OT 3444
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'KAUFFMAN' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'KAUFFMAN', 'KAUFFMAN', 'KAUFFMAN', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'SPBS97' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'SPBS97', 'MERCEDES', 'A35 S', 2023, 'GRIS', 26000) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '3444', 'SPBS97', 'GARANTIA', 'GARANTIA', 0, 'completada', '2026-01-29');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 2111: OT 3445
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'CHRISTOPHER PALTA' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'CHRISTOPHER PALTA', '18689213-5', '940645875', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'HKRG63' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'HKRG63', 'BMW', '420 GRAND COUPE', 2016, 'PLATA', 126000) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '3445', 'HKRG63', 'DOWNPIPE + STAGE 2 + POPS + CUT-OUT + *CAMBIO DE BUJIAS', 'DOWNPIPE + STAGE 2 + POPS + CUT-OUT + *CAMBIO DE BUJIAS', 1359700, 'completada', '2026-01-29');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 2112: OT 3446
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'KAUFFMAN' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'KAUFFMAN', 'KAUFFMAN', 'KAUFFMAN', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'HVVF84' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'HVVF84', 'MERCEDES', 'G500', 2016, 'AZUL', 80000) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '3446', 'HVVF84', 'REINSTALACIÓN ORIGINAL', 'REINSTALACIÓN ORIGINAL', 300000, 'completada', '2026-01-29');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 2113: OT 3447
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'NICOLAS SEPULVEDA' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'NICOLAS SEPULVEDA', '19687988-9', '955318468', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'JPLL19' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'JPLL19', 'VW', 'GOLF', 2017, 'BLANCO', 98000) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '3447', 'JPLL19', 'WICKED FLOW CENTRAL + AXLE BACK COLA CROMO 4"', 'WICKED FLOW CENTRAL + AXLE BACK COLA CROMO 4"', 450000, 'completada', '2026-01-30');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 2114: OT 3448
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'EDUARDO MUÑOZ' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'EDUARDO MUÑOZ', '16361467-7', '991250461', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'VJRL23' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'VJRL23', 'MAZDA', 'MX-5', 2026, 'GRIS', 6000) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '3448', 'VJRL23', 'CATBACK VALVETRONIC + CONTROL REMOTO + COLA CROMO', 'CATBACK VALVETRONIC + CONTROL REMOTO + COLA CROMO', 1099900, 'completada', '2026-01-30');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 2115: OT 3449
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'EMILIO' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'EMILIO', '26611680-2', '998220688', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'KHCF39' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'KHCF39', 'MAZDA', 'MAZDA 6', 2018, 'GRIS', 23000) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '3449', 'KHCF39', 'AXLE BACK', 'AXLE BACK', 449900, 'completada', '2026-02-02');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 2116: OT 3450
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'CLAUDIO' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'CLAUDIO', '77567117-3', '956379889', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'VTFP77' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'VTFP77', 'FORD', 'F150', 2026, 'GRIS', 1000) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '3450', 'VTFP77', 'CUT-OUT', 'CUT-OUT', 449900, 'completada', '2026-02-02');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 2117: OT 3451
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'GABRIEL VALDERRAMA' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'GABRIEL VALDERRAMA', '10837808-4', '945629251', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'JKHT66' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'JKHT66', 'BMW', '120i', 2018, 'GRIS', 50000) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '3451', 'JKHT66', 'DOWNPIPE', 'DOWNPIPE', 389900, 'completada', '2026-02-02');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 2118: OT 3452
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'NICOLAS RIQUELME' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'NICOLAS RIQUELME', '18308797-5', '979687731', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'EX6782' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'EX6782', 'BMW', '525 E34', 1990, 'GRIS', 185000) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '3452', 'EX6782', 'REPARACIÓN ESCAPE', 'REPARACIÓN ESCAPE', 120000, 'completada', '2026-02-02');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 2119: OT 3453
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'ALEXANDER SALAZAR' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'ALEXANDER SALAZAR', '21236741-9', '944306244', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'VHRW61' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'VHRW61', 'VW', 'POLO', 2025, 'PLATA', 7600) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '3453', 'VHRW61', 'MODIFIC', 'MODIFIC', 75000, 'completada', '2026-02-03');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 2120: OT 3454
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'IGNACIO MORAES' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'IGNACIO MORAES', '20427704-4', '965729979', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'JLDW33' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'JLDW33', 'AUDI', 'A3', 2018, 'GRIS', 120000) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '3454', 'JLDW33', 'AXLE BACK FREE CON COLAS NUEVAS 3.5" CROMO', 'AXLE BACK FREE CON COLAS NUEVAS 3.5" CROMO', 356800, 'completada', '2026-02-04');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 2121: OT 3455
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'LUIS PLAZA' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'LUIS PLAZA', '17079053-7', '959016781', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'KSWS45' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'KSWS45', 'SUZUKI', 'GRAND VITARA', 2018, 'GRIS', 104000) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '3455', 'KSWS45', 'AXLE BACK SILENCIADOR ALTO FLUJO MAS CUT OUT', 'AXLE BACK SILENCIADOR ALTO FLUJO MAS CUT OUT', 319900, 'completada', '2026-02-04');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 2122: OT 3456
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'BRYAN SAN MARTIN' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'BRYAN SAN MARTIN', '18848449-2', '961916599', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'DFLK65' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'DFLK65', 'VW', 'AMAROK', 2012, 'BLANCO', 281606) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '3456', 'DFLK65', 'REPARACIÓN ESCAPE', 'REPARACIÓN ESCAPE', 60000, 'completada', '2026-02-04');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 2123: OT 3457
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'INVERSIONES ACR' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'INVERSIONES ACR', '76797593-7', 'DESPACHO', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'BORLA' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'BORLA', 'BORLA', 'BORLA', 2012, 'CROMO', 0) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '3457', 'BORLA', 'DESPACHO', 'DESPACHO', 219900, 'completada', '2026-02-04');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 2124: OT 3458
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'PABLO VARGAS' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'PABLO VARGAS', '16938083-K', '954348547', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'BLANCO' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'BLANCO', 'MERCEDES', 'A250', 2019, 'BLANCO', 160000) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '3458', 'BLANCO', 'MANTENCION MARIPOSA', 'MANTENCION MARIPOSA', 45000, 'completada', '2026-02-04');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 2125: OT 3459
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'JM&H CONSTRUCCIONES SPA' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'JM&H CONSTRUCCIONES SPA', '77657779-0', '967271587', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'DRKZ58' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'DRKZ58', 'FORD', 'F150', 2012, 'AZUL', 218802) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '3459', 'DRKZ58', 'FALTA CARGAR MAPA', 'FALTA CARGAR MAPA', 499900, 'completada', '2026-02-04');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 2126: OT 3460
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'VLADIMIR MENESES' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'VLADIMIR MENESES', '21009150-5', '948497583', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'GBDT66' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'GBDT66', 'DODGE', 'CHALLENGER', 2014, 'AZUL', 18000) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '3460', 'GBDT66', 'CATBACK + REPRO', 'CATBACK + REPRO', 1299900, 'completada', '2026-02-05');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 2127: OT 3461
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'RODRIGO BENAVIDES' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'RODRIGO BENAVIDES', '17231800-2', '944546921', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'PKJD67' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'PKJD67', 'JEEP', 'WRANGLER', 2021, 'GRIS', 58000) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '3461', 'PKJD67', 'CATBACK CON VALVETRONIC MAS SPRINTBOOSTER Y ALTO FLUO BMC', 'CATBACK CON VALVETRONIC MAS SPRINTBOOSTER Y ALTO FLUO BMC', 1709700, 'completada', '2026-02-06');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 2128: OT 3462
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'SEBASTIAN ESCARATE' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'SEBASTIAN ESCARATE', '', '944062849', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'KPFH86' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'KPFH86', 'FORD', 'ESCAPE', 2018, 'BLANCO', 130000) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '3462', 'KPFH86', 'REPRO STAGE 1', 'REPRO STAGE 1', 299900, 'completada', '2026-02-06');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 2129: OT 3463
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'TRANSPORTES LS' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'TRANSPORTES LS', '76704181-0', '998174044', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'RWWZ45' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'RWWZ45', 'RAM', '2500', 2023, 'BLANCO', 18000) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '3463', 'RWWZ45', 'BULLY DOG CAMBIO DE ECU, CATBACK + CHERRY BOMB', 'BULLY DOG CAMBIO DE ECU, CATBACK + CHERRY BOMB', 7100000, 'completada', '2026-02-06');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 2130: OT 3464
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'JM&H CONSTRUCCIONES SPA' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'JM&H CONSTRUCCIONES SPA', '77657779-0', '967271587', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'DRKZ58' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'DRKZ58', 'FORD', 'F150', 2012, 'AZUL', 218802) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '3464', 'DRKZ58', 'CAMBIO DE SILENCIADOR ORIGINAL POR WICKED FLOW KAMIKAZE', 'CAMBIO DE SILENCIADOR ORIGINAL POR WICKED FLOW KAMIKAZE', 349900, 'completada', '2026-02-06');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 2131: OT 3465
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'AXEL LIZANA' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'AXEL LIZANA', '20974672-7', '972244655', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'FLKF96' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'FLKF96', 'VOLVO', 'V40', 2013, 'BLANCO', 81000) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '3465', 'FLKF96', 'REPRO STAGE 1', 'REPRO STAGE 1', 319900, 'completada', '2026-02-09');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 2132: OT 3466
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'MATIAS GONZALEZ' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'MATIAS GONZALEZ', '19410422-7', '963212823', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'STXG25' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'STXG25', 'CUPRA', 'FORMENTOR VZ', 2023, 'BLANCO', 30000) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '3466', 'STXG25', 'CUT-OUT MAS CONTROL', 'CUT-OUT MAS CONTROL', 449900, 'completada', '2026-02-09');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 2133: OT 3467
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'TRANS CARLOS ESCOBAR' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'TRANS CARLOS ESCOBAR', '77083984-K', '', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'SYKH95' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'SYKH95', 'FORD', 'F150', 2023, 'AZUL', 20000) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '3467', 'SYKH95', 'CATBACK MAS SALIDA DOBLE Y COLAS NEGRAS', 'CATBACK MAS SALIDA DOBLE Y COLAS NEGRAS', 1499900, 'completada', '2026-02-09');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 2134: OT 3468
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'FRANCISCO FUENTES' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'FRANCISCO FUENTES', '77702651-8', '994376132', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'VTVY41' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'VTVY41', 'PORSCHE', 'CAYENNE S', 2026, 'AZUL', 34) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '3468', 'VTVY41', 'AXLE BACK MAS COLAS NUEVAS MAS MUFFLER DELETE', 'AXLE BACK MAS COLAS NUEVAS MAS MUFFLER DELETE', 1399900, 'completada', '2026-02-10');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 2135: OT 3469
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'BLAS VARGAS' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'BLAS VARGAS', '19730664-5', '984994702', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'TVBF61' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'TVBF61', 'CHERY', 'TIGGO 8', 2025, 'GRIS', 8700) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '3469', 'TVBF61', 'MANTENCIÓN 8700 KMS', 'MANTENCIÓN 8700 KMS', 99900, 'completada', '2026-02-11');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 2136: OT 3470
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'LUIS FELIPE GUTIERREZ' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'LUIS FELIPE GUTIERREZ', '19130440-3', '992650008', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'SGSF99' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'SGSF99', 'SUBARU', 'WRX', 2023, 'BLANCO', 22000) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '3470', 'SGSF99', 'LINEA COMPLETA MAS SILENCIADOR ALTO FLUJO WICKED Y COLAS NUEVAS DOBLES CROMO', 'LINEA COMPLETA MAS SILENCIADOR ALTO FLUJO WICKED Y COLAS NUEVAS DOBLES CROMO', 819900, 'completada', '2026-02-12');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 2137: OT 3471
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'FRANCISCO MUÑOZ' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'FRANCISCO MUÑOZ', '18632177-4', '989337523', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'KZGH22' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'KZGH22', 'CHEVROLET', 'SILVERADO', 2019, 'GRIS', 125000) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '3471', 'KZGH22', 'REEINSTALACIÓN SILENCIADOR ALTO FLUJO WICKED FLOW', 'REEINSTALACIÓN SILENCIADOR ALTO FLUJO WICKED FLOW', 150000, 'completada', '2026-02-12');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 2138: OT 3472
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'JORDANO CID' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'JORDANO CID', '12386675-4', '982407526', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'TZHL10' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'TZHL10', 'CHEVROLET', 'SILVERADO', 2025, 'NEGRO', 20000) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '3472', 'TZHL10', 'COLAS DOBLES FIBRA DE CARBONO', 'COLAS DOBLES FIBRA DE CARBONO', 599900, 'completada', '2026-02-12');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 2139: OT 3473
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'AGUSTIN MIRANDA' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'AGUSTIN MIRANDA', '22138467-9', '959112792', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'JKPV59' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'JKPV59', 'HONDA', 'CIVIC', 2017, 'BLANCO', 86000) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '3473', 'JKPV59', 'CUT-OUT MAS CONTROL', 'CUT-OUT MAS CONTROL', 629900, 'completada', '2026-02-13');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 2140: OT 3474
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'MATIAS FURLONG' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'MATIAS FURLONG', '', '950002694', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'BSGJ33' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'BSGJ33', 'JEEP', 'GRAND CHEROKEE', 2009, 'NEGRO', 200000) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '3474', 'BSGJ33', 'CAMBIO SILENCIADOR Y COLA', 'CAMBIO SILENCIADOR Y COLA', 1050000, 'completada', '2026-02-13');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 2141: OT 3475
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'MARCOS VILCHES' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'MARCOS VILCHES', '16924870-2', '990160213', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'HDVW46' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'HDVW46', 'FIAT', 'FIORINO CITY', 2015, 'BLANCO', 250000) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '3475', 'HDVW46', 'REPRO DESACTIVACIÓN', 'REPRO DESACTIVACIÓN', 150000, 'completada', '2026-02-13');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 2142: OT 3476
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'IÑIGO OVALLE' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'IÑIGO OVALLE', '21502388-5', '951328844', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'JVRX10' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'JVRX10', 'AUDI', 'A3', 2017, 'GRIS', 113000) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '3476', 'JVRX10', 'CUT-OUT MAS CONTROL REMOTO', 'CUT-OUT MAS CONTROL REMOTO', 449900, 'completada', '2026-02-13');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 2143: OT 3477
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'MIGUEL PALMA' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'MIGUEL PALMA', '18375904-3', '951705661', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'RXYK24' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'RXYK24', 'BMW', '240 M', 2023, 'MORADO', 30000) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '3477', 'RXYK24', 'CATBACK + VALVETRONIC + COLAS DOBLES 4"', 'CATBACK + VALVETRONIC + COLAS DOBLES 4"', 1399900, 'completada', '2026-03-02');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    -- Fila 2144: OT 3478
    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = 'JUAN PABLO OSSA' AND taller_id = v_taller_id LIMIT 1;
    IF v_cliente_id IS NULL THEN
        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, 'JUAN PABLO OSSA', '7003083-7', '992329074', 'persona') RETURNING id INTO v_cliente_id;
    END IF;
    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = 'VHTG99' AND taller_id = v_taller_id LIMIT 1;
    IF v_vehiculo_id IS NULL THEN
        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, 'VHTG99', 'CHEVROLET', 'TAHOE', 2026, 'PLATA', 21500) RETURNING id INTO v_vehiculo_id;
    END IF;
    BEGIN
        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, '3478', 'VHTG99', 'CUT-OUT MAS CONTROL', 'CUT-OUT MAS CONTROL', 449900, 'completada', '2026-03-02');
    EXCEPTION WHEN unique_violation THEN
        NULL;
    END;
    RAISE NOTICE 'Carga masiva finalizada con éxito.';

    RAISE NOTICE 'Bloque finalizado con éxito.';
END $$;