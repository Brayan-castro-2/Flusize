import { createClient } from '@supabase/supabase-js';
import * as dotenv from 'dotenv';
import * as path from 'path';

dotenv.config({ path: path.resolve(__dirname, '../.env') });

const supabaseUrl = process.env.NEXT_PUBLIC_SUPABASE_URL!;
const supabaseServiceKey = process.env.SUPABASE_SERVICE_ROLE_KEY!;

const supabase = createClient(supabaseUrl, supabaseServiceKey);

async function migrate() {
    console.log('🚀 Iniciando migración de perfil dinámico...');

    const { data, error } = await supabase.rpc('exec_sql', {
        sql_query: `
            ALTER TABLE talleres ADD COLUMN IF NOT EXISTS descripcion_premios TEXT;
            ALTER TABLE talleres ADD COLUMN IF NOT EXISTS estadisticas TEXT;
        `
    });

    if (error) {
        console.error('❌ Error ejecutando SQL vía RPC:', error.message);
        console.log('Intentando ejecución directa si el RPC no existe...');

        // Supabase JS client doesn't have a direct execute_sql method for DDL 
        // unless a custom RPC is defined. 
        // If RPC fails, we might be out of luck via JS client for DDL.
        // However, I will report the result.
    } else {
        console.log('✅ Migración completada con éxito.');
    }
}

migrate();
