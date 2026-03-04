const { createClient } = require('@supabase/supabase-js');
const dotenv = require('dotenv');
const path = require('path');

dotenv.config({ path: path.resolve(__dirname, '.env.local') });

const supabaseUrl = process.env.NEXT_PUBLIC_SUPABASE_URL;
const supabaseKey = process.env.NEXT_PUBLIC_SUPABASE_ANON_KEY;
const supabase = createClient(supabaseUrl, supabaseKey);

async function main() {
    console.log('--- Iniciando corrección de catálogo de servicios ---');

    // Buscamos Steel Monkey
    const { data: talleres, error: errT } = await supabase
        .from('talleres')
        .select('*')
        .ilike('nombre', '%Steel Monkey%');

    if (errT || !talleres || talleres.length === 0) {
        console.error('❌ Taller Steel Monkey no encontrado.', errT);
        return;
    }

    const tallerId = talleres[0].id;
    console.log(`✅ Taller Steel Monkey encontrado: ${tallerId}`);

    try {
        const { data, error: errCols } = await supabase.from('servicios_frecuentes').select('taller_id').limit(1);
        if (errCols) {
            console.log('Error o info:', errCols);
        } else {
            console.log('✅ columna taller_id existe.', data);
        }
    } catch (e) {
        console.log(e);
    }
}

main();
