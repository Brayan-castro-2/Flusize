require('dotenv').config({ path: '.env.local' });
const { createClient } = require('@supabase/supabase-js');

const supabaseUrl = process.env.NEXT_PUBLIC_SUPABASE_URL;
const supabaseKey = process.env.SUPABASE_SERVICE_ROLE_KEY || process.env.NEXT_PUBLIC_SUPABASE_ANON_KEY;

if (!supabaseUrl || !supabaseKey) {
    console.error('❌ Faltan variables de entorno');
    process.exit(1);
}

const supabase = createClient(supabaseUrl, supabaseKey);

async function checkOrdenesFull() {
    console.log('--- CHECK ORDENES FULL SCHEMA ---');

    // Intentamos obtener una fila
    const { data, error } = await supabase
        .from('ordenes')
        .select('*')
        .limit(1);

    if (error) {
        console.error('❌ Error al leer ordenes:', error.message);
        return;
    }

    if (data && data.length > 0) {
        console.log('✅ Columnas encontradas:', Object.keys(data[0]));
    } else {
        console.log('⚠️ Tabla vacía. No puedo ver las columnas con select *.');
        // Truco: Intentar insertar algo inválido para que el error nos diga columnas? 
        // No, mejor asumimos que si falta patente_vehiculo faltan las basicas.
    }
}

checkOrdenesFull();
