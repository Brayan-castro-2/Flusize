import { createClient } from '@supabase/supabase-js';
import * as xlsx from 'xlsx';
import * as dotenv from 'dotenv';
import path from 'path';

dotenv.config({ path: path.resolve(process.cwd(), '.env.local') });

const supabaseUrl = process.env.NEXT_PUBLIC_SUPABASE_URL;
const supabaseKey = process.env.SUPABASE_SERVICE_ROLE_KEY;
const supabase = createClient(supabaseUrl, supabaseKey);

const EXCEL_PATH = path.resolve(process.cwd(), '2025 actual OT STEEL MONKEY.xlsx');

async function checkExistentOrInsert(table, matchKey, matchValue, insertData) {
    if (!matchValue) return null;
    const { data: existing } = await supabase.from(table).select('id').eq(matchKey, matchValue).single();
    if (existing) return existing.id;

    const { data: inserted, error } = await supabase.from(table).insert(insertData).select('id').single();
    if (error) {
        console.error(`Error inserting into ${table}:`, error.message, insertData);
        return null;
    }
    return inserted.id;
}

function parseExcelDate(excelDate) {
    if (!excelDate) return new Date().toISOString();
    if (typeof excelDate === 'number') {
        const date = new Date((excelDate - (25567 + 2)) * 86400 * 1000);
        return date.toISOString();
    }
    try {
        return new Date(excelDate).toISOString();
    } catch {
        return new Date().toISOString();
    }
}

async function runMigration() {
    console.log('🚀 Iniciando Migración Maestra: Steel Monkey');

    const { data: taller } = await supabase.from('talleres').select('id, nombre').ilike('nombre', '%Rent%').single();
    if (!taller) {
        console.error('❌ Taller de Steel Monkey (RentMontt) no encontrado');
        process.exit(1);
    }
    const tallerId = taller.id;
    console.log(`✅ Taller encontrado: ${taller.nombre} (${tallerId})`);

    console.log('🧹 Vaciando historial antiguo...');
    await supabase.from('ordenes').delete().eq('taller_id', tallerId);
    await supabase.from('vehiculos').delete().eq('taller_id', tallerId);
    await supabase.from('clientes').delete().eq('taller_id', tallerId);
    console.log('✅ Historial vaciado');

    console.log(`📄 Leyendo archivo Excel: ${EXCEL_PATH}`);
    const workbook = xlsx.default ? xlsx.default.readFile(EXCEL_PATH) : xlsx.readFile(EXCEL_PATH);
    const sheetName = workbook.SheetNames[0];
    const sheet = workbook.Sheets[sheetName];
    const xlsxUtils = xlsx.default ? xlsx.default.utils : xlsx.utils;
    const rows = xlsxUtils.sheet_to_json(sheet, { defval: '' });

    console.log(`📊 Total filas encontradas: ${rows.length}`);

    let countOrdenes = 0;

    const cacheClientes = {};
    const cacheVehiculos = {};

    for (const [index, row] of rows.entries()) {
        const getColumn = (hints) => {
            for (const key of Object.keys(row)) {
                for (const hint of hints) {
                    if (key.toUpperCase().includes(hint.toUpperCase())) return row[key];
                }
            }
            return '';
        };

        const ot = getColumn(['OT']);
        const nombre = getColumn(['NOMBRE']);
        const rut = getColumn(['RUT']);
        const patente = getColumn(['PATENTE']);
        const marca = getColumn(['MARCA']);
        const modelo = getColumn(['MODELO']);
        const anio = getColumn(['AÑO', 'ANO']);
        const fechaRaw = getColumn(['FECHA']);
        const trabajo = getColumn(['TRABAJO', 'DETALLE']);
        const totalRaw = getColumn(['TOTAL', 'PRECIO']);

        if (!ot && !nombre && !patente) continue;

        let clienteId = null;
        let clientKey = rut ? String(rut).trim() : nombre ? String(nombre).trim() : 'Desconocido';

        if (clientKey) {
            if (cacheClientes[clientKey]) {
                clienteId = cacheClientes[clientKey];
            } else {
                clienteId = await checkExistentOrInsert('clientes', rut ? 'rut' : 'nombre', clientKey, {
                    nombre: nombre ? String(nombre) : 'Cliente sin nombre',
                    rut: rut ? String(rut) : null,
                    taller_id: tallerId
                });
                if (clienteId) cacheClientes[clientKey] = clienteId;
            }
        }

        let vehiculoId = null;
        let vehiculoKey = patente ? String(patente).trim().toUpperCase() : null;

        if (vehiculoKey) {
            if (cacheVehiculos[vehiculoKey]) {
                vehiculoId = cacheVehiculos[vehiculoKey];
            } else {
                vehiculoId = await checkExistentOrInsert('vehiculos', 'patente', vehiculoKey, {
                    patente: vehiculoKey,
                    marca: marca ? String(marca) : '-',
                    modelo: modelo ? String(modelo) : '-',
                    anio: anio ? String(anio) : '-',
                    cliente_id: clienteId,
                    taller_id: tallerId
                });
                if (vehiculoId) cacheVehiculos[vehiculoKey] = vehiculoId;
            }
        }

        const precioTotal = parseInt(String(totalRaw).replace(/[^0-9]/g, '')) || 0;
        const fechaNorm = parseExcelDate(fechaRaw);

        const ordenData = {
            taller_id: tallerId,
            cliente_id: clienteId,
            vehiculo_id: vehiculoId,
            patente_vehiculo: vehiculoKey || 'S/P',
            numero_orden: ot ? String(ot) : null,
            descripcion_ingreso: trabajo ? String(trabajo).substring(0, 255) : 'Ingreso por migración',
            detalle_trabajos: trabajo ? String(trabajo) : '',
            precio_total: precioTotal,
            estado: 'completada',
            fecha_ingreso: fechaNorm
        };

        const { error: errOrden } = await supabase.from('ordenes').insert(ordenData);
        if (errOrden) {
            console.error(`[Error OT ${ot}]`, errOrden.message);
        } else {
            countOrdenes++;
        }

        if (index % 100 === 0 && index > 0) {
            console.log(`... procesadas ${index} filas ...`);
        }
    }

    console.log(`🎉 Migración finalizada! Se importaron ${countOrdenes} órdenes de trabajo.`);
    process.exit(0);
}

runMigration();
