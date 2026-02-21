
const { createClient } = require('@supabase/supabase-js');

const supabaseUrl = process.env.NEXT_PUBLIC_SUPABASE_URL || 'https://dccymmnjzhxneexscboo.supabase.co';
const supabaseKey = process.env.NEXT_PUBLIC_SUPABASE_ANON_KEY || 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImRjY3ltbW5qemh4bmVleHNjYm9vIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NjgxODA0MjIsImV4cCI6MjA4Mzc1NjQyMn0.IKpjys-3Rqqv2omj0LtFKowzQi5Z_M99JkhOgR29sx8';

const supabase = createClient(supabaseUrl, supabaseKey);

async function checkConstraints() {
    console.log('🔍 Checking Constraints for ordenes and citas...');

    // We can't query information_schema directly via JS client easily depending on permissions,
    // but we can try to infer relationships or just test queries.
    // Better yet, let's try to run a raw RPC if available, or just test the queries without hints.

    // 1. Try to fetch one order without hints to see if it works (basic connectivity)
    const { data: basicOrder, error: basicError } = await supabase
        .from('ordenes')
        .select('id')
        .limit(1);

    if (basicError) console.error('❌ Basic Order Fetch Error:', basicError);
    else console.log('✅ Basic Order Fetch OK');

    // 2. Try to verify the specific relationship names by failure or by guessing
    // Actually, since we have a 400, the best way is to try the query *without* the hint
    // and see if Supabase complains about ambiguity.

    console.log('\n🧪 Testing Ordenes -> Vehiculos relationship...');
    const { data: relTest, error: relError } = await supabase
        .from('ordenes')
        .select('id, vehiculos(*)') // No hint
        .limit(1);

    if (relError) {
        console.error('❌ Error prompting ambiguity (or missing rel):', relError.message);
        if (relError.message.includes('Could not find a relationship')) {
            console.log('   => Relationship possibly missing entirely.');
        } else if (relError.message.includes('More than one relationship')) {
            console.log('   => Ambiguity detected! Hints needed.');
        }
    } else {
        console.log('✅ Relationship works WITHOUT hint! (Maybe hint was wrong?)');
    }

    console.log('\n🧪 Testing Citas -> Vehiculos relationship...');
    const { data: citaTest, error: citaError } = await supabase
        .from('citas')
        .select('id, vehiculos(*)') // No hint
        .limit(1);

    if (citaError) {
        console.error('❌ Error prompting ambiguity (or missing rel):', citaError.message);
    } else {
        console.log('✅ Citas Relationship works WITHOUT hint!');
    }
}

checkConstraints();
