-- Tabla satélite para analíticas de tracking
CREATE TABLE IF NOT EXISTS public.orden_tracking_analytics (
    orden_id UUID PRIMARY KEY REFERENCES public.ordenes(id) ON DELETE CASCADE,
    vistas_cliente INTEGER DEFAULT 0,
    clicks_registro INTEGER DEFAULT 0,
    ultimo_acceso_cliente TIMESTAMP WITH TIME ZONE
);

-- Habilitar RLS
ALTER TABLE public.orden_tracking_analytics ENABLE ROW LEVEL SECURITY;

-- Políticas de lectura/escritura (abiertas temporalmente para uso de RPC anónimo)
CREATE POLICY "Accesible públicamente (lectura)" ON public.orden_tracking_analytics
    FOR SELECT USING (true);
    
CREATE POLICY "Creable públicamente (RPC)" ON public.orden_tracking_analytics
    FOR INSERT WITH CHECK (true);
    
CREATE POLICY "Editable públicamente (RPC)" ON public.orden_tracking_analytics
    FOR UPDATE USING (true);


-- Función de RPC para incrementar contadores sin riesgo de condiciones de carrera y accesible anónimamente
CREATE OR REPLACE FUNCTION public.incrementar_metrica_tracking(p_orden_id UUID, p_metrica TEXT)
RETURNS void
LANGUAGE plpgsql
SECURITY DEFINER
AS $$
BEGIN
    -- Si no existe la fila, la creamos
    INSERT INTO public.orden_tracking_analytics (orden_id, vistas_cliente, clicks_registro, ultimo_acceso_cliente)
    VALUES (p_orden_id, 0, 0, NOW())
    ON CONFLICT (orden_id) DO NOTHING;

    -- Incrementamos según el tipo de métrica
    IF p_metrica = 'visita' THEN
        UPDATE public.orden_tracking_analytics
        SET vistas_cliente = vistas_cliente + 1,
            ultimo_acceso_cliente = NOW()
        WHERE orden_id = p_orden_id;
    ELSIF p_metrica = 'click_registro' THEN
        UPDATE public.orden_tracking_analytics
        SET clicks_registro = clicks_registro + 1
        WHERE orden_id = p_orden_id;
    END IF;
END;
$$;
