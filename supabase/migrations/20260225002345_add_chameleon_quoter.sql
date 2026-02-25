-- Migration to add Chameleon Quoter fields to ordenes table

ALTER TABLE public.ordenes 
    ADD COLUMN IF NOT EXISTS cotizacion_items JSONB DEFAULT NULL,
    ADD COLUMN IF NOT EXISTS subtotal BIGINT DEFAULT NULL,
    ADD COLUMN IF NOT EXISTS iva BIGINT DEFAULT NULL;

-- Description of new fields
COMMENT ON COLUMN public.ordenes.cotizacion_items IS 'Stores the array of { descripcion: string, monto: number } for detailed quotes.';
COMMENT ON COLUMN public.ordenes.subtotal IS 'Stores the sum of all items before taxes.';
COMMENT ON COLUMN public.ordenes.iva IS 'Stores the calculated 19% tax if applicable.';
