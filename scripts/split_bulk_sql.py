import os

# Configuración
INPUT_FILE = r'c:\Users\FLUSIZE\Documents\GitHub\Flusize\carga_masiva_flusize.sql'
OUTPUT_PATTERN = r'c:\Users\FLUSIZE\Documents\GitHub\Flusize\carga_parte{}.sql'
TALLER_ID = 'e55ce6be-7b8c-4a1a-b333-666333666333'

HEADER = f"""DO $$
DECLARE
    v_taller_id UUID := '{TALLER_ID}';
    v_cliente_id UUID;
    v_vehiculo_id UUID;
BEGIN
    RAISE NOTICE 'Iniciando carga de bloque...';
"""

FOOTER = """
    RAISE NOTICE 'Bloque finalizado con éxito.';
END $$;"""

def split_sql():
    if not os.path.exists(INPUT_FILE):
        print(f"Error: No se encuentra {INPUT_FILE}")
        return

    with open(INPUT_FILE, 'r', encoding='utf-8') as f:
        lines = f.readlines()

    # Encontrar las líneas que contienen las inserciones de fila
    # Las filas empiezan con "    -- Fila X:"
    fila_indices = []
    for i, line in enumerate(lines):
        if line.strip().startswith('-- Fila'):
            fila_indices.append(i)

    total_filas = len(fila_indices)
    if total_filas == 0:
        print("Error: No se encontraron bloques de filas.")
        return

    print(f"Total de filas encontradas: {total_filas}")

    # Dividir en 5 partes
    num_parts = 5
    filas_per_part = (total_filas // num_parts) + 1
    
    current_fila_idx = 0
    for p in range(1, num_parts + 1):
        start_line_idx = fila_indices[current_fila_idx]
        
        # Calcular el final de este bloque
        next_fila_idx = current_fila_idx + filas_per_part
        if next_fila_idx >= total_filas or p == num_parts:
            # Es la última parte o llegamos al final
            end_line_idx = -1 # Hasta el final del archivo (necesitaremos limpiar el END $$; original)
            current_chunk_indices = fila_indices[current_fila_idx:]
        else:
            end_line_idx = fila_indices[next_fila_idx]
            current_chunk_indices = fila_indices[current_fila_idx:next_fila_idx]

        output_file = OUTPUT_PATTERN.format(p)
        
        with open(output_file, 'w', encoding='utf-8') as f_out:
            f_out.write(HEADER)
            
            # Extraer las líneas de este chunk
            if end_line_idx == -1:
                # Buscar hasta donde termina la última fila procesada (antes del END $$ final)
                chunk_lines = lines[start_line_idx:]
                # Limpiar el final del archivo original si existe (el END $$;)
                clean_chunk = []
                for line in chunk_lines:
                    if line.strip() == "END $$;":
                        break
                    clean_chunk.append(line)
                f_out.writelines(clean_chunk)
            else:
                f_out.writelines(lines[start_line_idx:end_line_idx])
            
            f_out.write(FOOTER)
        
        print(f"Generado: {output_file} ({len(current_chunk_indices)} filas)")
        current_fila_idx = next_fila_idx
        if current_fila_idx >= total_filas:
            break

if __name__ == "__main__":
    split_sql()
