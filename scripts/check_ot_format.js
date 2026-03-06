const fs = require('fs');
const { createClient } = require('@supabase/supabase-js');
require('dotenv').config({ path: '.env.local' });

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
        .ilike('numero_orden', '%3444%')
        .limit(5);

    if (error) {
        console.error("Error consultando:", error);
    } else {
        console.log("Órdenes encontradas:", data);
    }
}

checkOrder();
