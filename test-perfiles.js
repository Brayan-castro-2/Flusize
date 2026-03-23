const fs = require('fs');
const { createClient } = require('@supabase/supabase-js');
const s2 = createClient(
    'https://dccymmnjzhxneexscboo.supabase.co',
    'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImRjY3ltbW5qemh4bmVleHNjYm9vIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NjgxODA0MjIsImV4cCI6MjA4Mzc1NjQyMn0.IKpjys-3Rqqv2omj0LtFKowzQi5Z_M99JkhOgR29sx8'
);
async function test() {
    const { data: cols, error: colError } = await s2.from('perfiles').select('*').limit(1);
    fs.writeFileSync('test-perfiles-out.json', JSON.stringify(cols ? Object.keys(cols[0] || {}) : colError));
}
test();
