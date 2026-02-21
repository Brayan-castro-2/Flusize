
import { createClient } from '@supabase/supabase-js';

const supabaseUrl = process.env.NEXT_PUBLIC_SUPABASE_URL || '';
const supabaseKey = process.env.NEXT_PUBLIC_SUPABASE_ANON_KEY || '';

if (!supabaseUrl || !supabaseKey) {
    console.error("Missing Supabase env vars");
    process.exit(1);
}

const supabase = createClient(supabaseUrl, supabaseKey);

async function checkRpc() {
    console.log("Checking for 'exec_sql' RPC...");
    const { data, error } = await supabase.rpc('exec_sql', { sql: 'SELECT 1' });

    if (error) {
        console.log("RPC 'exec_sql' failed or not found:", error.message);
        // Try 'run_sql'?
        const { data: data2, error: error2 } = await supabase.rpc('run_sql', { sql: 'SELECT 1' });
        if (error2) {
            console.log("RPC 'run_sql' failed or not found:", error2.message);
        } else {
            console.log("RPC 'run_sql' FOUND!");
        }
    } else {
        console.log("RPC 'exec_sql' FOUND!");
    }
}

checkRpc();
