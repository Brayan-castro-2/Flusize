import { createClient } from '@supabase/supabase-js';

const supabaseUrl = process.env.NEXT_PUBLIC_SUPABASE_URL;
const supabaseKey = process.env.SUPABASE_SERVICE_ROLE_KEY;
const supabase = createClient(supabaseUrl, supabaseKey);

async function clean() {
    console.log("Limpiando ordenes huérfanas...");
    const { data, count, error } = await supabase
        .from('ordenes')
        .delete()
        .eq('taller_id', '78a71bd3-c3e3-4cf3-8f62-6b6a420952b5')
        .is('cliente_id', null)
        .gte('fecha_ingreso', '2025-12-01')
        .select();

    if (error) {
        console.error("Error cleaning:", error);
    } else {
        console.log(`Borradas ${data?.length || 0} órdenes corruptas.`);
    }
}

clean();
