
import { createClient } from '@supabase/supabase-js';

const supabaseUrl = process.env.NEXT_PUBLIC_SUPABASE_URL || '';
const supabaseKey = process.env.NEXT_PUBLIC_SUPABASE_ANON_KEY || '';

if (!supabaseUrl || !supabaseKey) {
    console.error("Missing Supabase env vars");
    process.exit(1);
}

const supabase = createClient(supabaseUrl, supabaseKey);

async function inspectColumns() {
    const { data, error } = await supabase
        .from('ordenes')
        .select('*')
        .limit(1);

    if (error) {
        console.error("Error:", error);
        return;
    }

    if (data && data.length > 0) {
        const columns = Object.keys(data[0]);
        console.log("ALL_COLUMNS:", JSON.stringify(columns));

        const payloadFields = [
            "descripcion_ingreso",
            "estado",
            "precio_total",
            "cliente_nombre",
            "cliente_telefono",
            "metodos_pago",
            "asignado_a",
            "detalle_trabajos",
            "fecha_entrega",
            "fecha_salida"
        ];

        console.log("CHECKING_PAYLOAD_FIELDS:");
        payloadFields.forEach(field => {
            console.log(`${field}: ${columns.includes(field) ? "EXISTS" : "MISSING"}`);
        });
    }
}

inspectColumns();
