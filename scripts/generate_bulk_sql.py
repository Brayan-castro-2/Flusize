import csv
import os

# Configuración
CSV_FILE = r'c:\Users\FLUSIZE\Documents\GitHub\Flusize\FLUSIZE_V3_CLEAN_SLATE_FILTERED.csv'
OUTPUT_SQL = r'c:\Users\FLUSIZE\Documents\GitHub\Flusize\carga_masiva_flusize.sql'
TALLER_ID = 'e55ce6be-7b8c-4a1a-b333-666333666333'

def clean_val(val):
    if val is None: return ''
    s = str(val).strip()
    if s.upper() in ['NAN', 'NULO', 'UNDEFINED', 'NULL', '']:
        return ''
    return s

def clean_num(val):
    s = clean_val(val)
    if not s: return '0'
    # Eliminar .0 si existe
    if s.endswith('.0'):
        s = s[:-2]
    # Quedarse solo con dígitos
    s = ''.join(filter(str.isdigit, s))
    return s if s else '0'

def escape_sql(val):
    if val is None: return 'NULL'
    return "'" + str(val).replace("'", "''") + "'"

def generate_sql():
    if not os.path.exists(CSV_FILE):
        print(f"Error: No se encuentra el archivo {CSV_FILE}")
        return

    with open(CSV_FILE, mode='r', encoding='utf-8') as f:
        reader = csv.DictReader(f)
        rows = list(reader)

    print(f"Procesando {len(rows)} filas...")

    sql_lines = []
    sql_lines.append("DO $$")
    sql_lines.append("DECLARE")
    sql_lines.append(f"    v_taller_id UUID := '{TALLER_ID}';")
    sql_lines.append("    v_cliente_id UUID;")
    sql_lines.append("    v_vehiculo_id UUID;")
    sql_lines.append("BEGIN")
    sql_lines.append("    RAISE NOTICE 'Iniciando carga de 2144 registros...';")

    for i, row in enumerate(rows):
        # Sanitización de Clientes
        cliente_nombre = clean_val(row.get('cliente_nombre'))
        if not cliente_nombre:
            cliente_nombre = 'CLIENTE GENERICO'
        
        cliente_rut = clean_val(row.get('cliente_rut'))
        cliente_tel = clean_val(row.get('cliente_telefono'))

        # Sanitización de Vehículos
        patente = clean_val(row.get('patente_vehiculo'))
        if not patente:
            patente = 'SIN-PAT'
        
        marca = clean_val(row.get('vehiculo_marca')) or 'S/M'
        modelo = clean_val(row.get('vehiculo_modelo')) or 'S/M'
        anio = clean_num(row.get('vehiculo_anio'))
        color = clean_val(row.get('vehiculo_color')) or 'S/C'
        km = clean_num(row.get('kilometraje'))

        # Sanitización de Órdenes
        ot = clean_num(row.get('numero_orden'))
        detalle = clean_val(row.get('detalle_trabajos')) or 'Carga masiva'
        precio = clean_num(row.get('precio_total'))
        fecha = clean_val(row.get('fecha_ingreso')) or '2026-01-01'
        estado = clean_val(row.get('estado')).lower() or 'completada'
        
        desc_ingreso = (detalle[:197] + '...') if len(detalle) > 200 else detalle

        sql_lines.append(f"    -- Fila {i+1}: OT {ot}")
        
        # Lógica Cliente
        sql_lines.append(f"    SELECT id INTO v_cliente_id FROM clientes WHERE nombre_completo = {escape_sql(cliente_nombre)} AND taller_id = v_taller_id LIMIT 1;")
        sql_lines.append("    IF v_cliente_id IS NULL THEN")
        sql_lines.append(f"        INSERT INTO clientes (taller_id, nombre_completo, rut_dni, telefono, tipo) VALUES (v_taller_id, {escape_sql(cliente_nombre)}, {escape_sql(cliente_rut)}, {escape_sql(cliente_tel)}, 'persona') RETURNING id INTO v_cliente_id;")
        sql_lines.append("    END IF;")

        # Lógica Vehículo
        sql_lines.append(f"    SELECT id INTO v_vehiculo_id FROM vehiculos WHERE patente = {escape_sql(patente)} AND taller_id = v_taller_id LIMIT 1;")
        sql_lines.append("    IF v_vehiculo_id IS NULL THEN")
        sql_lines.append(f"        INSERT INTO vehiculos (taller_id, cliente_id, patente, marca, modelo, ano, color, kilometraje) VALUES (v_taller_id, v_cliente_id, {escape_sql(patente)}, {escape_sql(marca)}, {escape_sql(modelo)}, {anio}, {escape_sql(color)}, {km}) RETURNING id INTO v_vehiculo_id;")
        sql_lines.append("    END IF;")

        # Lógica Orden
        sql_lines.append("    BEGIN")
        sql_lines.append(f"        INSERT INTO ordenes (taller_id, cliente_id, vehiculo_local_id, numero_orden, patente_vehiculo, descripcion_ingreso, detalle_trabajos, precio_total, estado, fecha_ingreso) VALUES (v_taller_id, v_cliente_id, v_vehiculo_id, {escape_sql(ot)}, {escape_sql(patente)}, {escape_sql(desc_ingreso)}, {escape_sql(detalle)}, {precio}, {escape_sql(estado)}, {escape_sql(fecha)});")
        sql_lines.append("    EXCEPTION WHEN unique_violation THEN")
        sql_lines.append("        NULL;")
        sql_lines.append("    END;")
        
        if (i + 1) % 100 == 0:
            sql_lines.append(f"    RAISE NOTICE 'Procesados {i+1} registros...';")

    sql_lines.append("    RAISE NOTICE 'Carga masiva finalizada con éxito.';")
    sql_lines.append("END $$;")

    with open(OUTPUT_SQL, 'w', encoding='utf-8') as f_out:
        f_out.write('\n'.join(sql_lines))

    print(f"Éxito: Archivo generado en {OUTPUT_SQL}")

if __name__ == "__main__":
    generate_sql()
