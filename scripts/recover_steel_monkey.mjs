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

    // Leer CSV con xlsx
    const workbook = xlsx.readFile(CSV_PATH);
    const sheetName = workbook.SheetNames[0];
    const sheet = workbook.Sheets[sheetName];
    // Convertir a JSON
    const rows = xlsx.utils.sheet_to_json(sheet, { defval: '' });

    console.log(`📊 Total filas detectadas: ${rows.length}`);

    let updatedCount = 0;
    let notFoundCount = 0;
    let errorCount = 0;

    for (const [index, row] of rows.entries()) {
        // Encontrar columna OT de forma flexible por posibles espacios ocultos
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
            if (kl === 'TOTAL' || kl === 'PRECIO') typeof totalRaw === 'string' && totalRaw === '' ? totalRaw = row[key] : (totalRaw = row[key] || totalRaw); // Tomar el primero o ultimo si hay duplicados
            if (key.includes('TOTAL_1')) totalRaw = row[key]; // Caso específico de duplicidad
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

        // El precio lo limpiamos de signos $ o puntos
        const totalStr = String(totalRaw).replace(/[^0-9]/g, '');
        const precioTotal = totalStr ? parseInt(totalStr) : 0;

        const detalle = String(detalleRaw).trim();

        // Actualizar en Supabase
        const updateData = {};
        if (patente) updateData.patente_vehiculo = patente;
        if (marca) updateData.vehiculo_marca = marca;
        if (modelo) updateData.vehiculo_modelo = modelo;
        if (anio) updateData.vehiculo_anio = anio;
        if (color) updateData.vehiculo_color = color;
        if (kilometraje) updateData.kilometraje = kilometraje;
        if (detalle) updateData.detalle_trabajos = detalle;
        if (precioTotal) updateData.precio_total = precioTotal;

        if (Object.keys(updateData).length === 0) continue;

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
            if (index % 20 === 0) console.log(`✅ [${index}/${rows.length}] OT ${ot} actualizada -> Patente: ${patente}`);
        } else {
            console.warn(`⚠️ OT ${ot} no encontrada en base de datos para este taller.`);
            notFoundCount++;
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
