// SOLUCIÓN TEMPORAL: Hardcodear el taller_id del primer taller
// Esto permite que el sistema funcione mientras arreglamos la autenticación

import { createClient } from '@supabase/supabase-js';

const supabaseUrl = process.env.NEXT_PUBLIC_SUPABASE_URL!;
const supabaseKey = process.env.SUPABASE_SERVICE_ROLE_KEY || process.env.NEXT_PUBLIC_SUPABASE_ANON_KEY!;

export async function getDefaultTallerId(): Promise<string | null> {
    const supabase = createClient(supabaseUrl, supabaseKey);

    const { data, error } = await supabase
        .from('talleres')
        .select('id')
        .eq('activo', true)
        .order('creado_en', { ascending: true })
        .limit(1)
        .single();

    if (error || !data) {
        console.error('❌ No se pudo obtener taller por defecto:', error);
        return null;
    }

    console.log('✅ Usando taller por defecto:', data.id);
    return data.id;
}
