-- Verificar y asignar taller_id al usuario admin@flusize.com

-- 1. Ver el estado actual del perfil
SELECT id, email, nombre_completo, rol, taller_id, activo
FROM perfiles
WHERE email = 'admin@flusize.com';

-- 2. Ver talleres disponibles
SELECT id, nombre, slug, activo
FROM talleres
ORDER BY created_at;

-- 3. Asignar el primer taller al usuario admin (ajusta el UUID según tu caso)
-- IMPORTANTE: Ejecuta esto solo si el usuario no tiene taller_id
UPDATE perfiles
SET taller_id = (SELECT id FROM talleres WHERE activo = true ORDER BY created_at LIMIT 1)
WHERE email = 'admin@flusize.com' AND taller_id IS NULL;

-- 4. Verificar que se asignó correctamente
SELECT p.email, p.nombre_completo, p.rol, t.nombre as taller_nombre
FROM perfiles p
LEFT JOIN talleres t ON p.taller_id = t.id
WHERE p.email = 'admin@flusize.com';
