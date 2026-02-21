
import { createClient } from '@supabase/supabase-js';

const supabaseUrl = process.env.NEXT_PUBLIC_SUPABASE_URL || '';
const supabaseKey = process.env.NEXT_PUBLIC_SUPABASE_ANON_KEY || ''; // Use ANON key to simulate client, or SERVICE to bypass RLS

if (!supabaseUrl || !supabaseKey) {
    console.error("Missing Supabase env vars");
    process.exit(1);
}

// Using service key to rule out RLS first, or maybe I should use ANON to replicate user?
// Let's use SERVICE key if available to inspect structure, but ANON to test permission.
// The user has NEXT_PUBLIC_SUPABASE_SERVICE_ROLE_KEY or similar? Usually not exposed to client.
// I'll stick to ANON key first. If RLS fails, I'll see 403.
const supabase = createClient(supabaseUrl, supabaseKey);

async function testUpdate() {
    const orderId = '47751166-f24c-4927-a82d-84dc3018bff0'; // Grabbed from logs
    console.log(`Testing update for Order ${orderId}...`);

    // 1. Fetch current
    const { data: current, error: fetchError } = await supabase
        .from('ordenes')
        .select('*')
        .eq('id', orderId)
        .single();

    if (fetchError) {
        console.error("Fetch Error:", fetchError);
        return;
    }
    console.log("Current Status:", current.estado);
    console.log("Order Taller ID:", current.taller_id);
    console.log("Order ID:", current.id);
    console.log("Full Order:", JSON.stringify(current, null, 2));

    // 2. Try Update WITHOUT updated_at (The Fix)
    console.log("Attempting Update WITHOUT updated_at...");
    const { data: update1, error: error1 } = await supabase
        .from('ordenes')
        .update({ estado: 'en_proceso' })
        .eq('id', orderId)
        .select()
        .single();

    if (error1) {
        console.error("❌ Update WITHOUT updated_at FAILED:", error1);
    } else {
        console.log("✅ Update WITHOUT updated_at SUCCEEDED:", update1.estado);
    }

    // 3. Try Update WITH updated_at (To confirm the original bug)
    console.log("Attempting Update WITH updated_at...");
    const { data: update2, error: error2 } = await supabase
        .from('ordenes')
        .update({ estado: 'pendiente', updated_at: new Date().toISOString() })
        .eq('id', orderId)
        .select()
        .single();

    if (error2) {
        console.error("❌ Update WITH updated_at FAILED (Expected):", error2);
    } else {
        console.log("✅ Update WITH updated_at SUCCEEDED (Unexpected):", update2.estado);
    }
}

testUpdate();
