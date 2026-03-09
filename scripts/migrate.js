const { createClient } = require('@supabase/supabase-js');

const supabaseUrl = process.env.NEXT_PUBLIC_SUPABASE_URL || 'https://dccymmnjzhxneexscboo.supabase.co';
const supabaseServiceKey = process.env.SUPABASE_SERVICE_ROLE_KEY || 'YOUR_SUPABASE_SERVICE_KEY';

const supabase = createClient(supabaseUrl, supabaseServiceKey);

async function migrate() {
    console.log('🚀 Ejecutando migración SQL...');

    // Intentar ejecutar mediante un RPC común 'exec_sql'
    const { data, error } = await supabase.rpc('exec_sql', {
        sql_query: `
            ALTER TABLE talleres ADD COLUMN IF NOT EXISTS descripcion_premios TEXT;
            ALTER TABLE talleres ADD COLUMN IF NOT EXISTS estadisticas TEXT;
        `
    });

    if (error) {
        console.error('❌ Error:', error.message);
        if (error.message.includes('function exec_sql() does not exist')) {
            console.log('---');
            console.log('La función rpc.exec_sql no existe en tu base de datos.');
            console.log('Por favor, ejecuta esto manualmente en el SQL Editor de Supabase:');
            console.log('ALTER TABLE talleres ADD COLUMN IF NOT EXISTS descripcion_premios TEXT;');
            console.log('ALTER TABLE talleres ADD COLUMN IF NOT EXISTS estadisticas TEXT;');
        }
    } else {
        console.log('✅ Columnas añadidas exitosamente.');
    }
}

migrate();
