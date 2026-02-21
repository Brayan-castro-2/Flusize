
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

    // Attempt to select one row and print keys, as we can't easily query schema via API without specific permissions usually,
    // but selecting * helps see what is returned.
    const { data, error } = await supabase
        .from('ordenes')
        .select('*')
        .limit(1);

    if (error) {
        console.error("Error selecting from ordenes:", error);
        return;
    }

    if (data && data.length > 0) {
        console.log("Columns found in 'ordenes':", Object.keys(data[0]));
    } else {
        console.log("No data in 'ordenes' to inspect columns. Trying to insert a dummy to see error or structure?");
        // If empty, we can't see columns via select *.
        // But the user has orders.
        console.log("Table seems empty or RLS prevented reading.");
    }
}

inspectColumns();
