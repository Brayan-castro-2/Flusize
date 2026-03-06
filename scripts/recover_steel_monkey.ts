import * as fs from 'fs';
import { createClient } from '@supabase/supabase-js';
import * as xlsx from 'xlsx';
import * as dotenv from 'dotenv';
import path from 'path';

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

    const workbook = xlsx.default ? xlsx.default.readFile(CSV_PATH) : xlsx.readFile(CSV_PATH);
    const sheetName = workbook.SheetNames[0];
    const sheet = workbook.Sheets[sheetName];
    const xlsxUtils = xlsx.default ? xlsx.default.utils : xlsx.utils;
    const rows = xlsxUtils.sheet_to_json(sheet, { defval: '' });

    console.log(`📊 Total filas detectadas: ${rows.length}`);

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
        let totalRaw: any = '';

        for (const key of Object.keys(row as object)) {
            const kl = key.trim().toUpperCase();
            if (kl === 'OT') otRaw = (row as any)[key];
            if (kl === 'PATENTE') patenteRaw = (row as any)[key];
            if (kl === 'MARCA') marcaRaw = (row as any)[key];
            if (kl === 'MODELO') modeloRaw = (row as any)[key];
            if (kl === 'AÑO' || kl === 'ANO') anioRaw = (row as any)[key];
            if (kl === 'COLOR') colorRaw = (row as any)[key];
            if (kl === 'KM' || kl === 'KILOMETROS') kmRaw = (row as any)[key];
            if (kl === 'DETALLE' || kl === 'TRABAJO') detalleRaw = (row as any)[key];
            if (kl === 'TOTAL' || kl === 'PRECIO') {
                if (typeof totalRaw === 'string' && totalRaw === '') {
                    totalRaw = (row as any)[key];
                } else {
                    totalRaw = (row as any)[key] || totalRaw;
                }
            }
            if (key.includes('TOTAL_1')) totalRaw = (row as any)[key];
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

        // Actualizar en Supabase (tabla ordenes)
        const updateData: any = {};
        if (patente && patente !== 'S/P' && patente !== 'NULO' && patente !== 'UNDEFINED') updateData.patente_vehiculo = patente;
        if (marca && marca !== 'undefined') updateData.vehiculo_marca = marca;
        if (modelo && modelo !== 'undefined') updateData.vehiculo_modelo = modelo;
        if (anio && anio !== 'undefined') updateData.vehiculo_anio = anio;
        if (color && color !== 'undefined') updateData.vehiculo_color = color;
        if (kilometraje) updateData.kilometraje = kilometraje;
        if (detalle && detalle !== 'undefined') updateData.detalle_trabajos = detalle;
        if (precioTotal) updateData.precio_total = precioTotal;

        if (Object.keys(updateData).length === 0) continue;

        // Primero consultamos la orden para ver si existe el vehiculo_local_id
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

        // Si la orden existía, aplicamos el Update masivo
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
            // Update the linked vehicle if it has one
            if (ordenExt.vehiculo_local_id && patente) {
                await supabase.from('vehiculos').update({
                    patente: patente,
                    marca: marca || undefined,
                    modelo: modelo || undefined,
                    anio: anio || undefined,
                    color: color || undefined
                }).eq('id', ordenExt.vehiculo_local_id);
            }
            if (index % 20 === 0) console.log(`✅ [${index}/${rows.length}] OT ${ot} actualizada -> Patente: ${patente}`);
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
