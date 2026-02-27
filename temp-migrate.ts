import { createClient } from '@supabase/supabase-js';
// @ts-ignore
import * as dotenv from 'dotenv';
dotenv.config();

const supabase = createClient(
    process.env.NEXT_PUBLIC_SUPABASE_URL!,
    process.env.SUPABASE_SERVICE_ROLE_KEY!
);

async function run() {
    console.log("Executing migration RPC...");
    const { data, error } = await supabase.rpc('exec_sql', {
        sql_string: `
      ALTER TABLE public.ordenes 
      ADD COLUMN IF NOT EXISTS cotizacion_items JSONB DEFAULT NULL,
      ADD COLUMN IF NOT EXISTS subtotal BIGINT DEFAULT NULL,
      ADD COLUMN IF NOT EXISTS iva BIGINT DEFAULT NULL;
    `
    });

    if (error) {
        console.error("Migration failed:", error);
    } else {
        console.log("Migration successful:", data);
    }
}
run();
