import { createClient } from '@supabase/supabase-js';
import * as dotenv from 'dotenv';
import { fileURLToPath } from 'url';
import { dirname, resolve } from 'path';

const __filename = fileURLToPath(import.meta.url);
const __dirname = dirname(__filename);
dotenv.config({ path: resolve(__dirname, '.env.local') });

const supabaseUrl = process.env.NEXT_PUBLIC_SUPABASE_URL;
const supabaseKey = process.env.NEXT_PUBLIC_SUPABASE_ANON_KEY;
// Usamos el role key o supabase_service_role si es posible, o auth normal
const supabase = createClient(supabaseUrl, supabaseKey);

async function main() {
    console.log('--- Iniciando corrección de catálogo de servicios ---');

    // Asumimos que podemos obtener el target taller_id
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

    // Limpiamos o modificamos la información vieja
    console.log('Borrando datos falsos previos de la base...');
    // Para simplificar, desvinculamos o eliminamos cualquier "servicios_frecuentes" de Juan o que no correspondan
    // Si la tabla no tiene taller_id, esto fallará. Si falla, manejaremos el error.
    try {
        const { data, error: errCols } = await supabase.from('servicios_frecuentes').select('taller_id').limit(1);
        if (errCols && errCols.code === '42703') {
            console.log('⚠️ La columna taller_id NO EXISTE en servicios_frecuentes, hay que crearla primero.');
        } else {
            console.log('✅ columna taller_id existe.');
        }
    } catch (e) {
        console.log(e);
    }
}

main();
