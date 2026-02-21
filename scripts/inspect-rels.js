
const { createClient } = require('@supabase/supabase-js');
const fs = require('fs');

const supabaseUrl = process.env.NEXT_PUBLIC_SUPABASE_URL || 'https://dccymmnjzhxneexscboo.supabase.co';
const supabaseKey = process.env.NEXT_PUBLIC_SUPABASE_ANON_KEY || 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImRjY3ltbW5qemh4bmVleHNjYm9vIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NjgxODA0MjIsImV4cCI6MjA4Mzc1NjQyMn0.IKpjys-3Rqqv2omj0LtFKowzQi5Z_M99JkhOgR29sx8';

const supabase = createClient(supabaseUrl, supabaseKey);

async function inspect() {
    const logVal = [];
    const log = (msg) => {
        console.log(msg);
        logVal.push(msg);
    };

    log('--- START INSPECTION ---');

    // 1. Check ORDENES relationships
    log('\n1. Testing ORDENES -> VEHICULOS');

    // A. No Hint
    const res1 = await supabase.from('ordenes').select('id, vehiculos(*)').limit(1);
    log(`  [No Hint] Error: ${res1.error ? res1.error.message : 'NONE (Success!)'}`);

    // B. Old Hint (vehiculo_id)
    const res2 = await supabase.from('ordenes').select('id, vehiculos!ordenes_vehiculo_id_fkey(*)').limit(1);
    log(`  [Hint: vehiculo_id] Error: ${res2.error ? res2.error.message : 'NONE (Success!)'}`);

    // C. New Hint (patente_vehiculo)
    const res3 = await supabase.from('ordenes').select('id, vehiculos!ordenes_patente_vehiculo_fkey(*)').limit(1);
    log(`  [Hint: patente_vehiculo] Error: ${res3.error ? res3.error.message : 'NONE (Success!)'}`);

    // 2. Check CITAS relationships
    log('\n2. Testing CITAS -> VEHICULOS');

    // A. No Hint
    const res4 = await supabase.from('citas').select('id, vehiculos(*)').limit(1);
    log(`  [No Hint] Error: ${res4.error ? res4.error.message : 'NONE (Success!)'}`);

    // B. Old Hint
    const res5 = await supabase.from('citas').select('id, vehiculos!citas_vehiculo_id_fkey(*)').limit(1);
    log(`  [Hint: vehiculo_id] Error: ${res5.error ? res5.error.message : 'NONE (Success!)'}`);

    // C. New Hint
    const res6 = await supabase.from('citas').select('id, vehiculos!citas_patente_vehiculo_fkey(*)').limit(1);
    log(`  [Hint: patente_vehiculo] Error: ${res6.error ? res6.error.message : 'NONE (Success!)'}`);

    fs.writeFileSync('scripts/debug_output.txt', logVal.join('\n'));
}

inspect();
