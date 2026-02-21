require('dotenv').config({ path: '.env.local' });
const { createClient } = require('@supabase/supabase-js');

const supabaseUrl = process.env.NEXT_PUBLIC_SUPABASE_URL;
const supabaseKey = process.env.SUPABASE_SERVICE_ROLE_KEY || process.env.NEXT_PUBLIC_SUPABASE_ANON_KEY;

if (!supabaseUrl || !supabaseKey) {
    console.error('❌ Faltan variables de entorno');
    process.exit(1);
}

const supabase = createClient(supabaseUrl, supabaseKey);

async function checkChequeoSchema() {
    console.log('--- CHECK LISTAS_CHEQUEO SCHEMA ---');

    const { data, error } = await supabase
        .from('listas_chequeo')
        .select('*')
        .limit(1);

    if (error) {
        console.error('❌ Error al consultar listas_chequeo:', error.message);
        // Si la tabla no existe, es un hallazgo importante
        return;
    }

    if (data && data.length > 0) {
        const keys = Object.keys(data[0]);
        console.log('Columnas encontradas:', keys);

        // Columnas esperadas según Imagen 3 (Target)
        const expected = [
            'detalles_salida',
            'fotos_salida',
            'confirmado_salida_en',
            'confirmado_salida_por',
            'revisado_por_mecanico' // O revisado_por_mecanico_at
        ];

        expected.forEach(col => {
            console.log(`¿Existe ${col}?`, keys.find(k => k.includes(col)) ? '✅' : '❌');
        });

    } else {
        console.log('⚠️ Tabla listas_chequeo vacía.');
        // No podemos inferir schema de data vacía con select *, 
        // pero si no da error, la tabla existe.
    }
}

checkChequeoSchema();
