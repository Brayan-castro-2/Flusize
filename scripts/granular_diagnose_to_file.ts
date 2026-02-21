
import { createClient } from '@supabase/supabase-js';
import * as fs from 'fs';

const supabaseUrl = process.env.NEXT_PUBLIC_SUPABASE_URL || '';
const supabaseKey = process.env.NEXT_PUBLIC_SUPABASE_ANON_KEY || '';

const supabase = createClient(supabaseUrl, supabaseKey);

async function runTest() {
    let output = "";
    const log = (msg) => {
        console.log(msg);
        output += msg + "\n";
    };

    const { data, error } = await supabase
        .from('ordenes')
        .select('*')
        .limit(1);

    if (error || !data || data.length === 0) {
        log("Error or no data: " + JSON.stringify(error));
        return;
    }

    log("--- COLUMNS ---");
    Object.keys(data[0]).sort().forEach(c => log(c));

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

    log("--- TESTS ---");
    for (const col of testCols) {
        const updates = {};
        updates[col] = data[0][col];
        if (col === "precio_total") updates[col] = 1;
        if (updates[col] === undefined) updates[col] = null;

        const { error: err } = await supabase
            .from('ordenes')
            .update(updates)
            .eq('id', data[0].id);

        log(`${col}: ${err ? "FAIL " + err.code + " " + err.message : "SUCCESS"}`);
    }

    fs.writeFileSync('diagnose_output.txt', output);
}

runTest();
