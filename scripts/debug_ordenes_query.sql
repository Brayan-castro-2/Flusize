-- Consulta directa para verificar relaciones en Supabase SQL Editor

-- 1. Verificación básica de la tabla ordenes
SELECT count(*) as total_ordenes FROM ordenes;

-- 2. Intento de JOIN con Vehículos (asumiendo que patente_vehiculo es la clave de unión correcta)
SELECT 
    o.id, 
    o.creado_por, 
    o.asignado_a,
    v.marca, 
    v.modelo 
FROM ordenes o
JOIN vehiculos v ON o.patente_vehiculo = v.patente
LIMIT 5;

-- 3. Intento de JOIN con Perfiles (Creado Por y Asignado A)
-- Esto nos dirá si las claves foráneas (FK) existen y son correctas
SELECT 
    o.id, 
    pc.nombre_completo as creado_por,
    pa.nombre_completo as asignado_a
FROM ordenes o
LEFT JOIN perfiles pc ON o.creado_por = pc.id
LEFT JOIN perfiles pa ON o.asignado_a = pa.id
LIMIT 5;

-- 4. Consulta que simula lo que hace la aplicación (con JSON Select similar a PostgREST)
-- Si esto falla, es un problema de permisos o de definición de FK desconocida para PostgREST
-- Nota: En SQL puro no usamos la sintaxis de embedding !clase, eso es de PostgREST API.
-- Pero podemos verificar las constraints:

SELECT
    observable_con_kcu.table_name,
    observable_con_kcu.column_name,
    observable_con_kcu.constraint_name,
    observable_con_ccu.table_name AS foreign_table_name,
    observable_con_ccu.column_name AS foreign_column_name
FROM information_schema.key_column_usage AS observable_con_kcu
JOIN information_schema.referential_constraints AS observable_con_rc
    ON observable_con_rc.constraint_name = observable_con_kcu.constraint_name
JOIN information_schema.constraint_column_usage AS observable_con_ccu
    ON observable_con_ccu.constraint_name = observable_con_rc.constraint_name
WHERE observable_con_kcu.table_name = 'ordenes';
