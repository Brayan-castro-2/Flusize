
import { createClient } from '@supabase/supabase-js';

const supabaseUrl = process.env.NEXT_PUBLIC_SUPABASE_URL || '';
const supabaseKey = process.env.NEXT_PUBLIC_SUPABASE_ANON_KEY || '';

if (!supabaseUrl || !supabaseKey) {
    console.error("Missing Supabase env vars");
    process.exit(1);
}

const supabase = createClient(supabaseUrl, supabaseKey);

async function inspectColumns() {
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
        console.log("ACTUAL_COLUMNS_IN_DB:", columns);

        // Let's also check if we can update with NO date fields first
        const { error: updateError } = await supabase
            .from('ordenes')
            .update({ descripcion_ingreso: data[0].descripcion_ingreso + " (Updated)" })
            .eq('id', data[0].id);

        if (updateError) {
            console.log("BASIC_UPDATE_ERROR:", updateError);
        } else {
            console.log("BASIC_UPDATE_SUCCESS");
        }
    }
}

inspectColumns();
