import { NextResponse } from 'next/server';
import { createClient } from '@supabase/supabase-js';
import * as xlsx from 'xlsx';
import * as fs from 'fs';
import * as path from 'path';

export async function GET() {
    console.log('🚀 API /clean-slate - Clean Slate Import V3: Steel Monkey');

    try {
        const supabaseUrl = process.env.NEXT_PUBLIC_SUPABASE_URL;
        const supabaseKey = process.env.SUPABASE_SERVICE_ROLE_KEY;
        if (!supabaseUrl || !supabaseKey) throw new Error("Faltan variables de entorno Supabase");

        const supabase = createClient(supabaseUrl, supabaseKey);
        const CSV_PATH = path.join(process.cwd(), 'FLUSIZE_V3_CLEAN_SLATE_FILTERED.csv');
        const TALLER_ID = 'e55ce6be-7b8c-4a1a-b333-666333666333';

        if (!fs.existsSync(CSV_PATH)) throw new Error(`CSV no encontrado: ${CSV_PATH}`);

        // Leer CSV como buffer
        const fileBuffer = fs.readFileSync(CSV_PATH);
        const workbook = xlsx.read(fileBuffer, { type: 'buffer' });
        const sheet = workbook.Sheets[workbook.SheetNames[0]];
        const rows = xlsx.utils.sheet_to_json(sheet, { defval: '' });
        console.log(`📊 Total filas: ${rows.length}`);

        const parseDate = (v: any) => {
            if (!v) return new Date().toISOString();
            if (typeof v === 'number') return new Date((v - (25567 + 2)) * 86400 * 1000).toISOString();
            try { return new Date(v).toISOString(); } catch { return new Date().toISOString(); }
        };

        const cacheClientes = new Map<string, string>();
        const cacheVehiculos = new Map<string, string>();
        let inserted = 0, errors = 0;
        const errorLog: string[] = [];

        for (const [index, rowRaw] of rows.entries()) {
            const row = rowRaw as any;
            try {
                // Extracción flexible por nombre exacto
                const get = (keys: string[]) => {
                    for (const k of Object.keys(row)) {
                        if (keys.some(hint => k.trim().toUpperCase() === hint.toUpperCase())) return row[k];
                    }
                    return '';
                };

                let ot = String(get(['NUMERO_ORDEN', 'OT'])).trim();
                if (ot.endsWith('.0')) ot = ot.slice(0, -2);
                if (!ot) continue;

                const patente = String(get(['PATENTE_VEHICULO', 'PATENTE'])).trim().toUpperCase();
                const marca = String(get(['VEHICULO_MARCA', 'MARCA'])).trim() || '-';
                const modelo = String(get(['VEHICULO_MODELO', 'MODELO'])).trim() || '-';
                const anioStr = String(get(['VEHICULO_ANIO', 'AÑO', 'ANO'])).replace(/[^0-9]/g, '');
                const ano = anioStr ? parseInt(anioStr) : null;
                const color = String(get(['VEHICULO_COLOR', 'COLOR'])).trim();
                const kmStr = String(get(['KILOMETRAJE', 'KM'])).replace(/[^0-9]/g, '');
                const kilometraje = kmStr ? parseInt(kmStr) : null;
                const nombre = String(get(['CLIENTE_NOMBRE', 'NOMBRE'])).trim() || 'Sin Nombre';
                const rut = String(get(['CLIENTE_RUT', 'RUT'])).trim() || null;
                const telefono = String(get(['CLIENTE_TELEFONO', 'TELEFONO', 'CELULAR'])).trim() || null;
                const detalle = String(get(['DETALLE_TRABAJOS', 'DETALLE', 'TRABAJO'])).trim() || '-';
                const precioStr = String(get(['PRECIO_TOTAL', 'TOTAL', 'PRECIO'])).replace(/[^0-9]/g, '');
                const precio = precioStr ? parseInt(precioStr) : 0;
                const fechaRaw = get(['FECHA_INGRESO', 'FECHA']);
                const fecha = parseDate(fechaRaw);
                const estado = String(get(['ESTADO'])).trim().toLowerCase() || 'completada';

                // PASO A: Cliente
                const clientKey = `${nombre.toLowerCase()}|${rut || ''}`;
                let clienteId = cacheClientes.get(clientKey);
                if (!clienteId) {
                    const { data: cli, error: clErr } = await supabase.from('clientes').insert({
                        taller_id: TALLER_ID,
                        nombre_completo: nombre,
                        rut_dni: rut,
                        telefono: telefono
                    }).select('id').single();
                    if (clErr) throw new Error(`Cliente: ${clErr.message}`);
                    clienteId = cli.id;
                    cacheClientes.set(clientKey, clienteId as string);
                }

                // PASO B: Vehículo
                let vehiculoId: string | null = null;
                if (patente && patente !== 'S/P' && patente.length > 2) {
                    vehiculoId = cacheVehiculos.get(patente) || null;
                    if (!vehiculoId) {
                        const vehData: any = {
                            taller_id: TALLER_ID,
                            cliente_id: clienteId,
                            patente,
                            marca,
                            modelo,
                            color
                        };
                        if (ano) vehData.ano = ano;
                        if (kilometraje) vehData.kilometraje = kilometraje;

                        const { data: veh, error: vehErr } = await supabase.from('vehiculos').insert(vehData).select('id').single();
                        if (vehErr) throw new Error(`Vehículo ${patente}: ${vehErr.message}`);
                        vehiculoId = veh.id;
                        cacheVehiculos.set(patente, vehiculoId as string);
                    }
                }

                // PASO C: Orden (solo columnas que existen en BD)
                const { error: ordErr } = await supabase.from('ordenes').insert({
                    taller_id: TALLER_ID,
                    cliente_id: clienteId,
                    vehiculo_local_id: vehiculoId,
                    numero_orden: ot,
                    patente_vehiculo: patente || null,
                    descripcion_ingreso: detalle.substring(0, 250),
                    detalle_trabajos: detalle,
                    precio_total: precio,
                    estado: estado,
                    fecha_ingreso: fecha
                });
                if (ordErr) throw new Error(`Orden OT ${ot}: ${ordErr.message}`);

                inserted++;
                if (inserted % 50 === 0) console.log(`✅ [${index}] Insertadas: ${inserted}`);

            } catch (err: any) {
                errors++;
                const msg = `Fila ${index}: ${err.message}`;
                if (errors <= 20) errorLog.push(msg);
                console.error('❌', msg);
            }
        }

        console.log(`🎉 COMPLETADO: ${inserted} órdenes, ${cacheClientes.size} clientes, ${cacheVehiculos.size} vehículos, ${errors} errores`);

        return NextResponse.json({
            status: 'success',
            stats: { total: rows.length, inserted, clients: cacheClientes.size, vehicles: cacheVehiculos.size, errors },
            first_errors: errorLog
        });

    } catch (e: any) {
        console.error('❌ ERROR FATAL:', e);
        return NextResponse.json({ error: e.message }, { status: 500 });
    }
}
