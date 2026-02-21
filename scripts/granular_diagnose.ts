
import { createClient } from '@supabase/supabase-js';

const supabaseUrl = process.env.NEXT_PUBLIC_SUPABASE_URL || '';
const supabaseKey = process.env.NEXT_PUBLIC_SUPABASE_ANON_KEY || '';

if (!supabaseUrl || !supabaseKey) {
    console.error("Missing Supabase env vars");
    process.exit(1);
}

const supabase = createClient(supabaseUrl, supabaseKey);

async function inspectColumns() {
    console.log("--- TABLE: ordenes ---");
    const { data, error } = await supabase
        .from('ordenes')
        .select('*')
        .limit(1);

    if (error) {
        console.error("Error fetching data:", error);
        return;
    }

    if (data && data.length > 0) {
        Object.keys(data[0]).sort().forEach(col => {
            console.log(`COLUMN: ${col}`);
        });

        const testCols = [
            "descripcion_ingreso",
            "estado",
            "precio_total",
            "metodos_pago",
            "asignado_a",
            "detalle_trabajos",
            "fecha_salida",
            "fecha_entrega",
            "cliente_nombre"
        ];

        console.log("--- INDIVIDUAL UPDATE TESTS ---");
        for (const col of testCols) {
            const updates: any = {};
            updates[col] = data[0][col] || "test_val";
            if (col === "precio_total") updates[col] = 100;
            if (col === "metodos_pago") updates[col] = null;
            if (col === "fecha_salida" || col === "fecha_entrega") updates[col] = new Date().toISOString();

            const { error: uErr } = await supabase
                .from('ordenes')
                .update(updates)
                .eq('id', data[0].id);

            console.log(`Update ${col}: ${uErr ? "FAILED (" + uErr.code + "): " + uErr.message : "SUCCESS"}`);
        }
    }
}

inspectColumns();
