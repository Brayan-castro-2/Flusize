require('dotenv').config({ path: '.env.local' });
const { createClient } = require('@supabase/supabase-js');

const supabaseUrl = process.env.NEXT_PUBLIC_SUPABASE_URL;
const supabaseKey = process.env.SUPABASE_SERVICE_ROLE_KEY || process.env.NEXT_PUBLIC_SUPABASE_ANON_KEY;

if (!supabaseUrl || !supabaseKey) {
    console.error('❌ Faltan variables de entorno');
    process.exit(1);
}

const supabase = createClient(supabaseUrl, supabaseKey);

async function checkVehiculosSchema() {
    console.log('--- CHECK VEHICULOS SCHEMA FOR MOTOR ---');

    const { data, error } = await supabase
        .from('vehiculos')
        .select('*')
        .limit(1);

    if (error) {
        console.error('❌ Error al consultar vehículos:', error);
        return;
    }

    if (data && data.length > 0) {
        console.log('✅ Keys en `vehiculos`:');
        console.log(Object.keys(data[0]));

        if ('motor' in data[0]) {
            console.log('✅ La columna "motor" EXISTE.');
        } else {
            console.error('❌ La columna "motor" NO EXISTE en el resultado.');
        }
    } else {
        console.log('⚠️ Tabla vacía. No se puede inferir schema.');
    }
}

checkVehiculosSchema();
