import { createClient } from '@supabase/supabase-js';

const supabaseUrl = 'https://dccymmnjzhxneexschoo.supabase.co'; // Corrected URL from console
const supabaseKey = process.env.NEXT_PUBLIC_SUPABASE_ANON_KEY || 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImRjY3ltbW5qemh4bmVleHNjaG9vIiwicm9sZSI6ImFub24iLCJpYXQiOjE3MDY5MzAyNDAsImV4cCI6MjAyMjUwNjI0MH0.K1y1_u6T7sU8P6_0x...'; // Will use exact anon key from lib/supabase

const fallbackAnonKey = "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImRjY3ltbW5qemh4bmVleHNjaG9vIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NjgxODA0MjIsImV4cCI6MjA4Mzc1NjQyMn0.IKpjys-3Rqqv2omj0LtFKowzQi5Z_M99JkhOgR29sx8"; // Adjusted taking from lib/supabase.ts but noted typo 'scboo' vs 'schoo'

const url = 'https://dccymmnjzhxneexschoo.supabase.co';
const key = fallbackAnonKey;
const supabase = createClient(url, key);

async function check() {
    const targetId = '0eb40b31-6b78-455b-a07c-722a96753796'; // From user's error screenshot

    console.log("Checking perfil_global_id:", targetId);
    const { data, error } = await supabase
        .from('perfiles_globales')
        .select('*')
        .eq('id', targetId)
        .single();

    if (error) {
        console.error("Error fetching perfil:", error.message);
    } else {
        console.log("Perfil found:", data);
    }

    // Also check if they created a local profile in `perfiles`
    const { data: data2, error: error2 } = await supabase
        .from('perfiles')
        .select('*')
        .eq('id', targetId)
        .single();

    if (error2) {
        console.error("Error fetching from legacy perfiles:", error2.message);
    } else {
        console.log("Legacy perfil found:", data2);
    }
}

check();
