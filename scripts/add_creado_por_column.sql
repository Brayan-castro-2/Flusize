-- Agregar columna 'creado_por' a la tabla 'ordenes' si no existe
ALTER TABLE "public"."ordenes" 
ADD COLUMN IF NOT EXISTS "creado_por" uuid REFERENCES auth.users(id);

-- (Opcional) Agregar también 'metodo_pago' si faltara, por si acaso
ALTER TABLE "public"."ordenes" 
ADD COLUMN IF NOT EXISTS "metodo_pago" text DEFAULT 'efectivo';

-- (Opcional) Agregar 'fotos_urls' si faltara (array de textos)
ALTER TABLE "public"."ordenes" 
ADD COLUMN IF NOT EXISTS "fotos_urls" text[] DEFAULT '{}';

-- Comentarios
COMMENT ON COLUMN "public"."ordenes"."creado_por" IS 'Usuario que creó la orden';
