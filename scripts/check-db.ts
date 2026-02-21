
import { createClient } from '@supabase/supabase-js';

const supabaseUrl = process.env.NEXT_PUBLIC_SUPABASE_URL!;
const supabaseKey = process.env.SUPABASE_SERVICE_ROLE_KEY || process.env.NEXT_PUBLIC_SUPABASE_ANON_KEY!;

const supabase = createClient(supabaseUrl, supabaseKey);

async function checkDatabase() {
    console.log('--- DIAGNÓSTICO BASE DE DATOS ---');

    // Tablas a verificar
    const tables = ['talleres', 'perfiles', 'vehiculos', 'clientes', 'ordenes'];

    for (const table of tables) {
        const { count, error } = await supabase
            .from(table)
            .select('*', { count: 'exact', head: true });

        if (error) {
            console.error(`❌ Error en tabla ${table}:`, error.message);
        } else {
            console.log(`✅ Tabla ${table}: ${count} registros`);
        }
    }

    // Verificar ids de talleres
    const { data: talleres } = await supabase.from('talleres').select('id, nombre, activo');
    console.log('\nTalleres activos:', JSON.stringify(talleres, null, 2));

    console.log('--------------------------------');
}

checkDatabase().catch(console.error);
