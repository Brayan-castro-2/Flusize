import { NextResponse } from 'next/server';
import { createClient } from '@supabase/supabase-js';
import * as xlsx from 'xlsx';
import * as fs from 'fs';
import * as path from 'path';

export async function GET() {
    console.log('🚀 API /recover - Iniciando Recuperación de Datos: Steel Monkey 2026');

    try {
        const supabaseUrl = process.env.NEXT_PUBLIC_SUPABASE_URL;
        const supabaseKey = process.env.SUPABASE_SERVICE_ROLE_KEY;

        if (!supabaseUrl || !supabaseKey) {
            throw new Error("Faltan variables de entorno SUPABASE_URL o SUPABASE_SERVICE_ROLE_KEY");
        }

        const supabase = createClient(supabaseUrl, supabaseKey);

        // Uso de process.cwd() que siempre apunta a la root del proyecto en NextJS Runtime
        const CSV_PATH = path.join(process.cwd(), 'steel_monkey_2026_RECOVERED.csv');
        const TALLER_ID = 'e55ce6be-7b8c-4a1a-b333-666333666333'; // Steel Monkey ID

        if (!fs.existsSync(CSV_PATH)) {
            throw new Error(`Archivo CSV no encontrado en: ${CSV_PATH}`);
        }

        console.log(`📄 Leyendo archivo: ${CSV_PATH}`);

        const fileBuffer = fs.readFileSync(CSV_PATH);
        const workbook = xlsx.read(fileBuffer, { type: 'buffer' });
        const sheetName = workbook.SheetNames[0];
        const sheet = workbook.Sheets[sheetName];
        const rows = xlsx.utils.sheet_to_json(sheet, { defval: '' });

        console.log(`📊 Total filas detectadas: ${rows.length}`);

        let count = 0;
        let errors = 0;
        let notFound = 0;
        let successfulUpdates = [];

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

            let ot = String(otRaw).trim();
            if (ot.endsWith('.0')) {
                ot = ot.slice(0, -2);
            }
            if (!ot) continue;

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

            const updateData: any = {};
            // Filter invalid values from excel mapping issue
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
                console.warn(`⚠️ OT ${ot} no encontrada.`);
                notFound++;
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
                errors++;
            } else if (data && data.length > 0) {
                count++;
                successfulUpdates.push({ ot, patente });

                if (ordenExt.vehiculo_local_id && patente) {
                    await supabase.from('vehiculos').update({
                        patente: patente,
                        marca: marca || undefined,
                        modelo: modelo || undefined,
                        anio: anio || undefined,
                        color: color || undefined
                    }).eq('id', ordenExt.vehiculo_local_id);
                }
            }
        }

        console.log(`✅ COMPLETADO: ${count} actualizadas, ${notFound} no encontradas, ${errors} errores`);

        return NextResponse.json({
            status: 'success',
            message: 'Recuperación de datos exitosa',
            stats: {
                total_processed: rows.length,
                updated: count,
                not_found: notFound,
                errors: errors
            },
            sample_updates: successfulUpdates.slice(0, 10)
        });

    } catch (e: any) {
        console.error('Error fatal en API:', e);
        return NextResponse.json({ error: e.message }, { status: 500 });
    }
}
