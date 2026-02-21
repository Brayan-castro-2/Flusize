-- Fix Missing Foreign Keys in 'ordenes' table
-- The previous debugging showed that 'creado_por' and 'asignado_a' columns exist but lack FK constraints.
-- PostgREST requires these constraints to perform joins.

BEGIN;

-- 1. Add Foreign Key for 'creado_por'
ALTER TABLE ordenes
ADD CONSTRAINT ordenes_creado_por_fkey
FOREIGN KEY (creado_por)
REFERENCES perfiles(id);

-- 2. Add Foreign Key for 'asignado_a'
ALTER TABLE ordenes
ADD CONSTRAINT ordenes_asignado_a_fkey
FOREIGN KEY (asignado_a)
REFERENCES perfiles(id);

COMMIT;

-- Verification Query (Run this after applying the changes)
SELECT
    kcu.constraint_name,
    kcu.table_name,
    kcu.column_name,
    ccu.table_name AS foreign_table_name
FROM information_schema.key_column_usage AS kcu
JOIN information_schema.constraint_column_usage AS ccu
    ON ccu.constraint_name = kcu.constraint_name
WHERE kcu.table_name = 'ordenes'
AND kcu.column_name IN ('creado_por', 'asignado_a');
