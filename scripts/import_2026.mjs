import { createClient } from '@supabase/supabase-js';
import * as xlsx from 'xlsx';
import path from 'path';

const supabaseUrl = process.env.NEXT_PUBLIC_SUPABASE_URL;
const supabaseKey = process.env.SUPABASE_SERVICE_ROLE_KEY;
const supabase = createClient(supabaseUrl, supabaseKey);

const EXCEL_PATH = path.resolve(process.cwd(), 'VENTAS STEEL MONKEY 2026.xlsx');

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
        const d = new Date(excelDate);
        if (isNaN(d.getTime())) return new Date().toISOString();
        return d.toISOString();
    } catch {
        return new Date().toISOString();
    }
}

async function runMigration() {
    console.log('🚀 Iniciando Carga Incremental: Steel Monkey 2026');

    // Get Taller (Hardcode a la orden del cliente)
    const tallerId = 'e55ce6be-7b8c-4a1a-b333-666333666333';
    console.log(`✅ Taller forzado a: ${tallerId}`);

    console.log(`📄 Leyendo archivo Excel: ${EXCEL_PATH}`);
    let workbook;
    try {
        workbook = xlsx.default ? xlsx.default.readFile(EXCEL_PATH) : xlsx.readFile(EXCEL_PATH);
    } catch (err) {
        console.error("❌ Error leyendo excel:", err);
        process.exit(1);
    }

    const sheetName = workbook.SheetNames[0];
    const sheet = workbook.Sheets[sheetName];
    const xlsxUtils = xlsx.default ? xlsx.default.utils : xlsx.utils;
    const rows = xlsxUtils.sheet_to_json(sheet, { defval: '' });

    console.log(`📊 Total filas encontradas: ${rows.length}`);

    let countOrdenes = 0;
    let omitidas = 0;

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

        const otRaw = getColumn(['OT']);
        const ot = String(otRaw).trim();
        const nombre = getColumn(['NOMBRE', 'CLIENTE']);
        const rut = getColumn(['RUT']);
        const patenteRaw = getColumn(['PATENTE', 'PPU', 'PLACA']);
        const patente = String(patenteRaw).trim().toUpperCase();
        const marca = getColumn(['MARCA']);
        const modelo = getColumn(['MODELO']);
        const anio = getColumn(['AÑO', 'ANO']);
        const fechaRaw = getColumn(['FECHA', 'INGRESO']);
        const trabajo = getColumn(['TRABAJO', 'DETALLE', 'SERVICIO']);
        const totalRaw = getColumn(['TOTAL', 'PRECIO', 'VALOR']);

        // Stop processing if it's an empty row
        if (!ot && !nombre && (!patente || patente === 'UNDEFINED' || patente === '')) {
            omitidas++;
            continue;
        }

        // Check if OT already exists for this taller to avoid duplicates
        if (ot && ot !== 'undefined' && ot !== '') {
            const { data: ordenEx } = await supabase.from('ordenes')
                .select('id').eq('taller_id', tallerId).eq('numero_orden', ot).maybeSingle();
            if (ordenEx) {
                omitidas++;
                continue; // Ya existe esta orden
            }
        }

        let clienteId = null;
        let clientKey = rut ? String(rut).trim() : nombre ? String(nombre).trim() : 'Desconocido';

        if (clientKey !== 'Desconocido' && clientKey !== '') {
            if (cacheClientes[clientKey]) {
                clienteId = cacheClientes[clientKey];
            } else {
                clienteId = await checkExistentOrInsert('clientes', rut ? 'rut_dni' : 'nombre_completo', clientKey, {
                    nombre_completo: nombre ? String(nombre).trim() : 'Cliente sin nombre',
                    rut_dni: rut ? String(rut).trim() : null,
                    taller_id: tallerId,
                    tipo: 'persona'
                });
                if (clienteId) cacheClientes[clientKey] = clienteId;
            }
        }

        let vehiculoId = null;
        let vehiculoKey = patente !== 'UNDEFINED' && patente !== '' ? patente : null;

        if (vehiculoKey && vehiculoKey !== 'S/P' && vehiculoKey !== 'NULO') {
            if (cacheVehiculos[vehiculoKey]) {
                vehiculoId = cacheVehiculos[vehiculoKey];
            } else {
                vehiculoId = await checkExistentOrInsert('vehiculos', 'patente', vehiculoKey, {
                    patente: vehiculoKey,
                    marca: marca ? String(marca) : '-',
                    modelo: modelo ? String(modelo) : '-',
                    ano: anio ? parseInt(String(anio).replace(/[^0-9]/g, "")) || null : null,
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
            vehiculo_local_id: vehiculoId,
            patente_vehiculo: vehiculoKey || 'S/P',
            numero_orden: ot && ot !== 'undefined' && ot !== '' ? ot : null,
            descripcion_problema: trabajo ? String(trabajo).substring(0, 255) : 'Ingreso 2026',
            trabajos_realizados: trabajo ? String(trabajo) : '',
            precio_total: precioTotal,
            estado: 'completada',
            fecha_ingreso: fechaNorm,
            fecha_estimada_salida: fechaNorm,
            fecha_salida: fechaNorm,
            metodo_pago: 'transferencia'
        };

        const { error: errOrden } = await supabase.from('ordenes').insert(ordenData);
        if (errOrden) {
            console.error(`[Error OT ${ot}]`, errOrden.message);
        } else {
            countOrdenes++;
        }

        if (index % 10 === 0 && index > 0) {
            console.log(`... evaluadas ${index} filas ... (Ingresadas: ${countOrdenes})`);
        }
    }

    console.log(`🎉 Importación 2026 finalizada! Nuevas ingresadas: ${countOrdenes}, Omitidas/Ya Existentes: ${omitidas}`);
    process.exit(0);
}

runMigration();
