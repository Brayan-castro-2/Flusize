
import { createClient } from '@supabase/supabase-js';

const supabaseUrl = process.env.NEXT_PUBLIC_SUPABASE_URL || '';
const supabaseKey = process.env.NEXT_PUBLIC_SUPABASE_ANON_KEY || '';

if (!supabaseUrl || !supabaseKey) {
    console.error("Missing Supabase env vars");
    process.exit(1);
}

const supabase = createClient(supabaseUrl, supabaseKey);

async function inspectColumns() {
    console.log("Inspecting 'ordenes' table columns...");

    // Try to get a single row to check column names
    const { data, error } = await supabase
        .from('ordenes')
        .select('*')
        .limit(1);

    if (error) {
        console.error("Error selecting from ordenes:", error);
        return;
    }

    if (data && data.length > 0) {
        const columns = Object.keys(data[0]);
        console.log("COLUMN_LIST_START");
        columns.forEach(col => console.log(col));
        console.log("COLUMN_LIST_END");
    } else {
        console.log("No data found in 'ordenes'. Trying to find any metadata...");
    }
}

inspectColumns();
