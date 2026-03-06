const fs = require('fs');
const { createClient } = require('@supabase/supabase-js');
const xlsx = require('xlsx');
const dotenv = require('dotenv');
const path = require('path');

dotenv.config({ path: path.resolve(process.cwd(), '.env.local') });

const supabaseUrl = process.env.NEXT_PUBLIC_SUPABASE_URL;
const supabaseKey = process.env.SUPABASE_SERVICE_ROLE_KEY;

if (!supabaseUrl || !supabaseKey) {
    console.error("❌ Faltan variables de entorno SUPABASE_URL o SUPABASE_SERVICE_ROLE_KEY");
    process.exit(1);
}

const supabase = createClient(supabaseUrl, supabaseKey);

const CSV_PATH = path.resolve(process.cwd(), 'steel_monkey_2026_RECOVERED.csv');
const TALLER_ID = 'e55ce6be-7b8c-4a1a-b333-666333666333'; // Steel Monkey ID

async function runRecovery() {
    console.log('🚀 Iniciando Recuperación de Datos: Steel Monkey 2026');

    if (!fs.existsSync(CSV_PATH)) {
        console.error(`❌ Archivo CSV no encontrado en: ${CSV_PATH}`);
        process.exit(1);
    }

    console.log(`📄 Leyendo archivo: ${CSV_PATH}`);

    const workbook = xlsx.readFile(CSV_PATH);
    const sheetName = workbook.SheetNames[0];
    const sheet = workbook.Sheets[sheetName];
    const rows = xlsx.utils.sheet_to_json(sheet, { defval: '' });

    console.log(`📊 Total filas detectadas en CSV: ${rows.length}`);

    let updatedCount = 0;
    let notFoundCount = 0;
    let errorCount = 0;

    for (const [index, row] of rows.entries()) {
        let otRaw = '';
        let patenteRaw = '';
        let marcaRaw = '';
        let modeloRaw = '';
        let anioRaw = '';
        let colorRaw = '';
        let kmRaw = '';
        let detalleRaw = '';
        let totalRaw = '';

        for (const key of Object.keys(row)) {
            const kl = key.trim().toUpperCase();
            if (kl === 'OT') otRaw = row[key];
            if (kl === 'PATENTE') patenteRaw = row[key];
            if (kl === 'MARCA') marcaRaw = row[key];
            if (kl === 'MODELO') modeloRaw = row[key];
            if (kl === 'AÑO' || kl === 'ANO') anioRaw = row[key];
            if (kl === 'COLOR') colorRaw = row[key];
            if (kl === 'KM' || kl === 'KILOMETROS') kmRaw = row[key];
            if (kl === 'DETALLE' || kl === 'TRABAJO') detalleRaw = row[key];
            if (kl === 'TOTAL' || kl === 'PRECIO') {
                if (typeof totalRaw === 'string' && totalRaw === '') {
                    totalRaw = row[key];
                } else {
                    totalRaw = row[key] || totalRaw;
                }
            }
            if (key.includes('TOTAL_1')) totalRaw = row[key];
        }

        const ot = String(otRaw).trim();
        if (!ot) continue;

        // Limpieza de campos CRÍTICA
        const patente = String(patenteRaw).trim().toUpperCase();
        const marca = String(marcaRaw).trim();
        const modelo = String(modeloRaw).trim();
        const anio = String(anioRaw).trim();
        const color = String(colorRaw).trim();
        const kmStr = String(kmRaw).replace(/[^0-9]/g, '');
        const kilometraje = kmStr ? parseInt(kmStr) : null;

        const totalStr = String(totalRaw).replace(/[^0-9]/g, '');
        const precioTotal = totalStr ? parseInt(totalStr) : 0;

        const detalle = String(detalleRaw).trim();

        const updateData = {};
        if (patente && patente !== 'S/P' && patente !== 'NULO' && patente !== 'UNDEFINED') updateData.patente_vehiculo = patente;
        if (marca && marca !== 'undefined') updateData.vehiculo_marca = marca;
        if (modelo && modelo !== 'undefined') updateData.vehiculo_modelo = modelo;
        if (anio && anio !== 'undefined') updateData.vehiculo_anio = anio;
        if (color && color !== 'undefined') updateData.vehiculo_color = color;
        if (kilometraje) updateData.kilometraje = kilometraje;
        if (detalle && detalle !== 'undefined') updateData.detalle_trabajos = detalle;
        if (precioTotal) updateData.precio_total = precioTotal;

        if (Object.keys(updateData).length === 0) continue;

        const { data: ordenExt, error: extErr } = await supabase
            .from('ordenes')
            .select('id, numero_orden, vehiculo_local_id')
            .eq('taller_id', TALLER_ID)
            .eq('numero_orden', ot)
            .maybeSingle();

        if (extErr || !ordenExt) {
            console.warn(`⚠️ OT ${ot} no encontrada en base de datos para este taller.`);
            notFoundCount++;
            continue;
        }

        const { data, error } = await supabase
            .from('ordenes')
            .update(updateData)
            .eq('taller_id', TALLER_ID)
            .eq('numero_orden', ot)
            .select('id, numero_orden, patente_vehiculo');

        if (error) {
            console.error(`❌ Error actualizando OT ${ot}:`, error.message);
            errorCount++;
        } else if (data && data.length > 0) {
            updatedCount++;
            if (ordenExt.vehiculo_local_id && patente) {
                await supabase.from('vehiculos').update({
                    patente: patente,
                    marca: marca || undefined,
                    modelo: modelo || undefined,
                    anio: anio || undefined,
                    color: color || undefined
                }).eq('id', ordenExt.vehiculo_local_id);
            }
            if (index % 10 === 0) console.log(`✅ [${index}/${rows.length}] OT ${ot} actualizada -> Patente: ${patente}`);
        }
    }

    console.log('\n=======================================');
    console.log('✅ REPORTE FINAL DE RECUPERACIÓN');
    console.log(`- Órdenes Actualizadas con éxito: ${updatedCount}`);
    console.log(`- Órdenes No Encontradas (Posible mismatch): ${notFoundCount}`);
    console.log(`- Errores de BD: ${errorCount}`);
    console.log('=======================================');
}

runRecovery().catch(console.error);
