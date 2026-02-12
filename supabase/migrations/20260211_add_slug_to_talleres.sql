-- ============================================
-- MIGRACIÓN: Agregar SLUG a talleres
-- Fecha: 2026-02-11
-- Descripción: Agregar campo slug para URLs amigables
-- ============================================

-- Agregar columna slug
ALTER TABLE talleres ADD COLUMN IF NOT EXISTS slug TEXT UNIQUE;

-- Crear índice para búsquedas rápidas por slug
CREATE INDEX IF NOT EXISTS idx_talleres_slug ON talleres(slug);

-- Generar slug automático para talleres existentes
-- Convertir nombre a slug (minúsculas, sin espacios, sin acentos)
UPDATE talleres 
SET slug = LOWER(
    REGEXP_REPLACE(
        TRANSLATE(
            nombre,
            'áéíóúÁÉÍÓÚñÑ ',
            'aeiouAEIOUnn-'
        ),
        '[^a-z0-9-]',
        '',
        'g'
    )
)
WHERE slug IS NULL;

-- Hacer slug obligatorio después de generar valores
ALTER TABLE talleres ALTER COLUMN slug SET NOT NULL;

-- Función para generar slug automáticamente al insertar
CREATE OR REPLACE FUNCTION generate_slug_from_nombre()
RETURNS TRIGGER AS $$
BEGIN
    IF NEW.slug IS NULL THEN
        NEW.slug := LOWER(
            REGEXP_REPLACE(
                TRANSLATE(
                    NEW.nombre,
                    'áéíóúÁÉÍÓÚñÑ ',
                    'aeiouAEIOUnn-'
                ),
                '[^a-z0-9-]',
                '',
                'g'
            )
        );
    END IF;
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

-- Trigger para generar slug automáticamente
DROP TRIGGER IF EXISTS talleres_generate_slug ON talleres;
CREATE TRIGGER talleres_generate_slug
    BEFORE INSERT OR UPDATE ON talleres
    FOR EACH ROW
    EXECUTE FUNCTION generate_slug_from_nombre();

-- Comentario
COMMENT ON COLUMN talleres.slug IS 'URL-friendly identifier (e.g., "electromecanica-jr")';

-- ============================================
-- POLÍTICAS RLS PARA ACCESO PÚBLICO
-- ============================================

-- Permitir lectura pública de talleres por slug (para landing pages)
CREATE POLICY "Talleres son públicamente visibles por slug"
    ON talleres FOR SELECT
    USING (activo = true);

-- ============================================
-- FIN DE MIGRACIÓN
-- ============================================
