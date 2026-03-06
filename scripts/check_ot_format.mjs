import fs from 'fs';
import { createClient } from '@supabase/supabase-js';
import dotenv from 'dotenv';
import url from 'url';
import path from 'path';

const __filename = url.fileURLToPath(import.meta.url);
const __dirname = path.dirname(__filename);
dotenv.config({ path: path.resolve(__dirname, '../.env.local') });

const supabaseUrl = process.env.NEXT_PUBLIC_SUPABASE_URL;
const supabaseKey = process.env.SUPABASE_SERVICE_ROLE_KEY;

if (!supabaseUrl || !supabaseKey) {
    console.error("Faltan variables de entorno SUPABASE_URL o SUPABASE_SERVICE_ROLE_KEY");
    process.exit(1);
}

const supabase = createClient(supabaseUrl, supabaseKey);

async function checkOrder() {
    const { data, error } = await supabase
        .from('ordenes')
        .select('id, numero_orden, taller_id, patente_vehiculo')
        .eq('taller_id', 'e55ce6be-7b8c-4a1a-b333-666333666333')
        .ilike('numero_orden', '%3444%')
        .limit(5);

    if (error) {
        console.error("Error consultando:", error);
    } else {
        console.log("Órdenes encontradas para prueba:", data);
    }
}

checkOrder();
