
import { createClient } from '@supabase/supabase-js';

const supabaseUrl = process.env.NEXT_PUBLIC_SUPABASE_URL || '';
const supabaseKey = process.env.NEXT_PUBLIC_SUPABASE_ANON_KEY || '';

const supabase = createClient(supabaseUrl, supabaseKey);

async function checkMetodosPago() {
    const { data, error } = await supabase
        .from('ordenes')
        .select('*')
        .limit(1);

    if (error) {
        console.error("Error:", error);
        return;
    }

    if (data && data.length > 0) {
        const columns = Object.keys(data[0]);
        console.log("COLUMNS_FOUND:", columns.join(', '));
        console.log("has_metodos_pago (plural):", columns.includes('metodos_pago'));
        console.log("has_metodo_pago (singular):", columns.includes('metodo_pago'));
    }
}

checkMetodosPago();
