-- ARREGLO: Asignar taller_id al usuario admin@taller.demo
-- La tabla talleres NO tiene columna 'slug', solo tiene: id, nombre, direccion, telefono, email, logo_url, activo, created_at

-- 1. Ver talleres disponibles (sin slug)
SELECT id, nombre, activo, created_at
FROM talleres
ORDER BY created_at;

-- 2. Si NO hay talleres, crear uno
INSERT INTO talleres (nombre, direccion, telefono, email, activo)
VALUES (
    'Taller Demo',
    'Dirección de prueba',
    '+56912345678',
    'contacto@taller.demo',
    true
)
RETURNING id, nombre;

-- 3. Ver el perfil actual
SELECT id, email, nombre_completo, rol, taller_id, activo
FROM perfiles
WHERE email = 'admin@taller.demo';

-- 4. Asignar el primer taller al usuario
UPDATE perfiles
SET taller_id = (SELECT id FROM talleres WHERE activo = true ORDER BY created_at LIMIT 1)
WHERE email = 'admin@taller.demo';

-- 5. Verificar que se asignó correctamente
SELECT 
    p.id,
    p.email, 
    p.nombre_completo, 
    p.rol, 
    p.taller_id,
    t.nombre as taller_nombre
FROM perfiles p
LEFT JOIN talleres t ON p.taller_id = t.id
WHERE p.email = 'admin@taller.demo';
