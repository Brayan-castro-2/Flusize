import { createClient } from '@supabase/supabase-js';

const fallbackAnonKey = "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImRjY3ltbW5qemh4bmVleHNjYm9vIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NjgxODA0MjIsImV4cCI6MjA4Mzc1NjQyMn0.IKpjys-3Rqqv2omj0LtFKowzQi5Z_M99JkhOgR29sx8";
const url = 'https://dccymmnjzhxneexscboo.supabase.co';
const supabase = createClient(url, fallbackAnonKey);

async function testRPC() {
    console.log("Testing fuse_account_by_phone RPC...");
    const startTime = Date.now();

    // We can't fully test it without auth context, but we can see if it hangs or returns an auth error instantly.
    try {
        const { data, error } = await supabase.rpc('fuse_account_by_phone', {
            user_phone: '+56979430387',
            claim_id_param: null
        });

        console.log(`RPC returned in ${Date.now() - startTime}ms`);
        if (error) {
            console.error("RPC Error:", error);
        } else {
            console.log("RPC Data:", data);
        }
    } catch (err) {
        console.error("Caught exception:", err);
    }
}

testRPC();
