-- ============================================================
-- MIGRACIÓN: Sistema de Roles de 3 Niveles (superadmin, admin, mecanico)
-- Ejecutar en el SQL Editor de la consola de Supabase
-- ============================================================

-- 1. Actualizar el CHECK constraint de la tabla perfiles para incluir 'superadmin'
ALTER TABLE public.perfiles DROP CONSTRAINT IF EXISTS perfiles_rol_check;
ALTER TABLE public.perfiles
ADD CONSTRAINT perfiles_rol_check
CHECK (rol IN ('superadmin', 'admin', 'mecanico'));

-- 2. (Opcional) Actualizar al usuario actual "Juan" a superadmin si está en la tabla perfiles
-- Descomenta la siguiente línea y reemplaza el email real si deseas hacerlo directamente:
-- UPDATE public.perfiles SET rol = 'superadmin' WHERE email = 'juan@tutaller.com';

-- 3. Verificar que el constraint se aplicó correctamente
SELECT constraint_name, check_clause
FROM information_schema.check_constraints
WHERE constraint_name = 'perfiles_rol_check';
