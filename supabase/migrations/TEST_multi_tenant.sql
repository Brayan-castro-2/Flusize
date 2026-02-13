-- Script para probar Multi-Tenancy: Crear segundo taller y usuario

-- 1. Crear segundo taller
INSERT INTO talleres (nombre, slug, direccion, telefono, email, activo)
VALUES (
    'Taller Mecánico Los Andes',
    'taller-los-andes',
    'Av. Los Andes 456, Santiago',
    '+56987654321',
    'contacto@tallerlosandes.cl',
    true
)
RETURNING id, nombre, slug;

-- 2. Crear usuario para el segundo taller (primero necesitamos el UUID del auth)
-- NOTA: Este usuario debe crearse desde la UI o mediante Supabase Auth API
-- Por ahora, solo documentamos el proceso:

/*
Para crear un usuario del segundo taller:
1. Ir a Supabase Dashboard > Authentication > Users
2. Crear usuario con email: admin@tallerlosandes.cl, password: Admin123!
3. Copiar el UUID del usuario creado
4. Ejecutar el siguiente INSERT en perfiles:

INSERT INTO perfiles (id, email, nombre_completo, rol, taller_id, activo)
VALUES (
    '<UUID_DEL_USUARIO>',
    'admin@tallerlosandes.cl',
    'Admin Los Andes',
    'admin',
    '<ID_DEL_TALLER_LOS_ANDES>',
    true
);
*/

-- 3. Verificar que los talleres están separados
SELECT 
    t.id,
    t.nombre,
    t.slug,
    COUNT(DISTINCT p.id) as usuarios,
    COUNT(DISTINCT c.id) as clientes,
    COUNT(DISTINCT v.id) as vehiculos,
    COUNT(DISTINCT o.id) as ordenes
FROM talleres t
LEFT JOIN perfiles p ON p.taller_id = t.id
LEFT JOIN clientes c ON c.taller_id = t.id
LEFT JOIN vehiculos v ON v.taller_id = t.id
LEFT JOIN ordenes o ON o.taller_id = t.id
GROUP BY t.id, t.nombre, t.slug
ORDER BY t.nombre;

-- 4. Verificar que las órdenes tienen access_token
SELECT 
    id,
    patente_vehiculo,
    estado,
    taller_id,
    access_token,
    token_created_at,
    fecha_ingreso
FROM ordenes
ORDER BY fecha_ingreso DESC
LIMIT 5;
