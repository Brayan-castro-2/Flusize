
import 'dotenv/config';
import { createClient } from '@supabase/supabase-js';

const supabaseUrl = process.env.NEXT_PUBLIC_SUPABASE_URL || '';
const supabaseKey = process.env.NEXT_PUBLIC_SUPABASE_ANON_KEY || ''; // USE ANON KEY to simulate real user

if (!supabaseUrl || !supabaseKey) {
    console.error("Missing Supabase env vars");
    process.exit(1);
}

const supabase = createClient(supabaseUrl, supabaseKey);

async function checkOrder() {
    const orderId = '47751166-f24c-4927-a82d-84dc3018bff0';
    console.log(`Checking Order ${orderId}...`);

    // 1. Fetch with SELECT *
    console.log("1. Attempting SELECT * (Anon)...");
    const { data: order, error: fetchError } = await supabase
        .from('ordenes')
        .select('*')
        .eq('id', orderId)
        .single();

    if (fetchError) {
        console.error("❌ SELECT Failed:", fetchError);
    } else {
        console.log("✅ SELECT Success. Status:", order.estado);
        console.log("   Taller ID:", order.taller_id);
    }

    // 2. Mock Update (We might fail efficiently here if RLS blocks)
    // We can't easily mock a logged-in user here without a password/token.
    // BUT we can check if the SELECT worked. If SELECT worked, RLS allows reading.
    // If SELECT failed with 406 or empty, then RLS is blocking everything.
}

checkOrder();
