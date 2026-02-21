-- SCRIPT PARA AÑADIR COLUMNA DE MÉTODOS DE PAGO JSONB
-- Este script permite guardar el detalle de pagos (monto y tipo) para soportar pagos parciales.

ALTER TABLE "public"."ordenes" 
ADD COLUMN IF NOT EXISTS "metodos_pago" jsonb DEFAULT '[]'::jsonb;

-- Comentario para documentación
COMMENT ON COLUMN "public"."ordenes"."metodos_pago" IS 'Almacena un array de objetos {metodo: string, monto: number} para pagos parciales y mixtos.';
