-- ============================================
-- FIX: Asignar taller_id a usuarios existentes
-- ============================================
-- EJECUTAR ESTO EN SUPABASE SQL EDITOR

-- 1. Verificar usuarios sin taller
SELECT id, email, nombre_completo, taller_id 
FROM perfiles 
WHERE taller_id IS NULL;

-- 2. Asignar el taller por defecto a TODOS los usuarios sin taller
UPDATE perfiles 
SET taller_id = (SELECT id FROM talleres WHERE nombre = 'Electromecánica JR' LIMIT 1)
WHERE taller_id IS NULL;

-- 3. Verificar que se asignó correctamente
SELECT id, email, nombre_completo, taller_id 
FROM perfiles;

-- ============================================
-- RESULTADO ESPERADO:
-- Todos los usuarios deben tener un taller_id
-- ============================================
