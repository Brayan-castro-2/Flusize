import { createClient } from '@supabase/supabase-js';
import * as dotenv from 'dotenv';

dotenv.config({ path: '.env.local' });

const supabaseUrl = process.env.NEXT_PUBLIC_SUPABASE_URL || process.env.SUPABASE_URL;
const supabaseKey = process.env.NEXT_PUBLIC_SUPABASE_ANON_KEY || process.env.SUPABASE_ANON_KEY;
const supabase = createClient(supabaseUrl!, supabaseKey!);

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
        const { data, error: errCols } = await supabase.from('servicios_frecuentes').select('*').limit(1);
        if (errCols) {
            console.log('Error o info:', errCols);
        } else {
            console.log('✅ Datos de servicios_frecuentes:', data);
        }
    } catch (e) {
        console.log(e);
    }
}

main();
