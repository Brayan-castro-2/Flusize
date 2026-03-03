import { createClient } from '@supabase/supabase-js';
import dotenv from 'dotenv';
dotenv.config({ path: '.env.local' });
dotenv.config({ path: '.env', override: false });

const supabase = createClient(process.env.NEXT_PUBLIC_SUPABASE_URL, process.env.SUPABASE_SERVICE_ROLE_KEY);
const STEELMONKEY_TALLER_ID = 'e55ce6be-7b8c-4a1a-b333-666333666333';

async function run() {
    const { count, error } = await supabase.from('ordenes').select('id', { count: 'exact', head: true }).eq('taller_id', STEELMONKEY_TALLER_ID);
    console.log(`TOTAL DE ORDENES DE STEELMONKEY EN LA NUBE: ${count}`);
}
run();
