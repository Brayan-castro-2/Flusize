require('dotenv').config({ path: '.env.local' });
const { createClient } = require('@supabase/supabase-js');

const supabaseUrl = process.env.NEXT_PUBLIC_SUPABASE_URL;
const supabaseKey = process.env.SUPABASE_SERVICE_ROLE_KEY || process.env.NEXT_PUBLIC_SUPABASE_ANON_KEY;

if (!supabaseUrl || !supabaseKey) {
    console.error('❌ Faltan variables de entorno');
    process.exit(1);
}

const supabase = createClient(supabaseUrl, supabaseKey);

async function checkOrdenesColumns() {
    console.log('--- CHECK ORDENES COLUMNS ---');

    const { data, error } = await supabase
        .from('ordenes')
        .select('*')
        .limit(1);

    if (error) {
        console.error('❌ Error:', error.message);
        return;
    }

    if (data && data.length > 0) {
        const keys = Object.keys(data[0]);
        console.log('Columnas encontradas:', keys);
        console.log('¿Existe creado_por?', keys.includes('creado_por'));
        console.log('¿Existe asignado_a?', keys.includes('asignado_a'));
    } else {
        console.log('⚠️ Tabla vacía.');
    }
}

checkOrdenesColumns();
