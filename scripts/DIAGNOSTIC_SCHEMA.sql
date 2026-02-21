-- DIAGNOSTICO COMPLETO DE ESQUEMA (Ordenes y Citas)
-- Copia y pega el resultado de estas consultas en el chat.

-- 1. VER COLUMNAS (Para ver si existe fecha_inicio, fecha_creacion, etc)
SELECT table_name, column_name, data_type 
FROM information_schema.columns 
WHERE table_name IN ('ordenes', 'citas') 
ORDER BY table_name, column_name;

-- 2. VER RELACIONES / FOREIGN KEYS (Para ver duplicados)
SELECT
    tc.table_name, 
    kcu.column_name, 
    tc.constraint_name, 
    ccu.table_name AS foreign_table_name,
    ccu.column_name AS foreign_column_name
FROM 
    information_schema.table_constraints AS tc 
    JOIN information_schema.key_column_usage AS kcu
      ON tc.constraint_name = kcu.constraint_name
      AND tc.table_schema = kcu.table_schema
    JOIN information_schema.constraint_column_usage AS ccu
      ON ccu.constraint_name = tc.constraint_name
      AND ccu.table_schema = tc.table_schema
WHERE tc.constraint_type = 'FOREIGN KEY' 
  AND tc.table_name IN ('ordenes', 'citas');
