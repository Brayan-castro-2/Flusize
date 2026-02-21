
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
    console.log('--- CHECK VEHICULOS SCHEMA ---');

    // Intentamos insertar una columna dummy para forzar error y ver columnas validas si es posible,
    // o mejor, hacemos un select * limit 1 y vemos las keys

    const { data, error } = await supabase
        .from('vehiculos')
        .select('*')
        .limit(1);

    if (error) {
        console.error('❌ Error al consultar vehículos:', error);
        return;
    }

    if (data && data.length > 0) {
        console.log('✅ Columnas encontradas en `vehiculos`:');
        console.log(Object.keys(data[0]));

        // Verificar específicamente 'anio'
        if ('anio' in data[0]) {
            console.log('✅ La columna "anio" EXISTE.');
        } else {
            console.error('❌ La columna "anio" NO EXISTE en el resultado.');
        }

    } else {
        console.log('⚠️ La tabla `vehiculos` está vacía, no puedo inferir esquema por select *.');

        // Intentar insertar con 'anio' para ver el error específico
        console.log('Intentando insertar dummy con anio...');
        const { error: insertError } = await supabase
            .from('vehiculos')
            .insert([{
                patente: 'SCHEMA1',
                marca: 'Test',
                modelo: 'Test',
                anio: '2024',
                taller_id: '00000000-0000-0000-0000-000000000001',
                cliente_id: '00000000-0000-0000-0000-000000000000' // UUID zero
            }]);

        if (insertError) {
            console.error('Error al insertar:', insertError);
        }
    }
}

checkVehiculosSchema();
