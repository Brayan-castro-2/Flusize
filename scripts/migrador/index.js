const { createClient } = require('@supabase/supabase-js');
const xlsx = require('xlsx');
const dotenv = require('dotenv');
const path = require('path');

// Env file is in project root (two levels up)
dotenv.config({ path: path.resolve(__dirname, '../../.env') });

const supabaseUrl = process.env.NEXT_PUBLIC_SUPABASE_URL;
const supabaseKey = process.env.SUPABASE_SERVICE_ROLE_KEY;

if (!supabaseUrl || !supabaseKey) {
    console.error('Missing Supabase URL or Key');
    process.exit(1);
}

const supabase = createClient(supabaseUrl, supabaseKey);

const EXCEL_PATH = path.resolve(__dirname, '../../2025 actual OT STEEL MONKEY.xlsx');

async function checkExistentOrInsert(table, matchKey, matchValue, insertData) {
    if (!matchValue) return null;
    const { data: existing } = await supabase.from(table).select('id').eq(matchKey, matchValue).single();
    if (existing) return existing.id;

    const { data: inserted, error } = await supabase.from(table).insert(insertData).select('id').single();
    if (error) {
        require('fs').writeFileSync('error.json', JSON.stringify({ table, message: error.message, code: error.code, details: error.details, hint: error.hint, data: insertData }, null, 2));
        console.error(`Error inserting into ${table}:`, error.message);
        process.exit(1);
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
        const parsed = new Date(excelDate);
        if (isNaN(parsed.getTime())) return new Date().toISOString();
        return parsed.toISOString();
    } catch {
        return new Date().toISOString();
    }
}

async function runMigration() {
    console.log('🚀 Iniciando Migración Maestra: Steel Monkey');

    // IDs definidos explícitamente por el usuario
    const rentMonttId = '78a71bd3-c3e3-4cf3-8f62-6b6a420952b5';
    const steelMonkeyId = 'e55ce6be-7b8c-4a1a-b333-666333666333';
    const tallerId = steelMonkeyId; // EL DESTINO FINAL

    const { data: perfil } = await supabase.from('perfiles').select('id').eq('taller_id', tallerId).limit(1).single();
    const perfilId = perfil ? perfil.id : '00000000-0000-0000-0000-000000000000';
    console.log(`👤 Perfil asignado para la inyección: ${perfilId}`);

    console.log('🧹 Eliminando 1601 órdenes erróneas de Rent Montt...');
    await supabase.from('ordenes').delete().eq('taller_id', rentMonttId);
    await supabase.from('vehiculos').delete().eq('taller_id', rentMonttId);
    await supabase.from('clientes').delete().eq('taller_id', rentMonttId);

    console.log('🧹 Vaciando las 953 órdenes basuras antiguas de Steel Monkey (espera por favor)...');
    await supabase.from('ordenes').delete().eq('taller_id', steelMonkeyId);
    await supabase.from('vehiculos').delete().eq('taller_id', steelMonkeyId);
    await supabase.from('clientes').delete().eq('taller_id', steelMonkeyId);

    console.log('✅ Historiales vaciados completamente.');

    console.log(`📄 Leyendo archivo Excel: ${EXCEL_PATH}`);
    try {
        const workbook = xlsx.readFile(EXCEL_PATH);
        const sheetName = workbook.SheetNames[0];
        const sheet = workbook.Sheets[sheetName];
        const rows = xlsx.utils.sheet_to_json(sheet, { defval: '' });

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
            const marca = getColumn(['MARCA', 'VEHICULO']);
            const modelo = getColumn(['MODELO']);
            const anio = getColumn(['AÑO', 'ANO']);
            let fechaRaw = getColumn(['FECHA']);
            const trabajo = getColumn(['TRABAJO', 'DETALLE', 'SERVICIO']);
            const totalRaw = getColumn(['TOTAL', 'PRECIO', 'VALOR']);

            if (!ot && !nombre && !patente && !trabajo) continue;

            let clienteId = null;
            let clientKey = rut ? String(rut).trim() : nombre ? String(nombre).trim() : 'Desconocido';

            if (clientKey) {
                if (cacheClientes[clientKey]) {
                    clienteId = cacheClientes[clientKey];
                } else {
                    clienteId = await checkExistentOrInsert('clientes', rut ? 'rut_dni' : 'nombre_completo', clientKey, {
                        nombre_completo: nombre ? String(nombre).substring(0, 100) : 'Cliente sin nombre',
                        rut_dni: rut ? String(rut).substring(0, 50) : null,
                        tipo: 'persona',
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
                        patente: vehiculoKey.substring(0, 15),
                        marca: marca ? String(marca).substring(0, 50) : '-',
                        modelo: modelo ? String(modelo).substring(0, 50) : '-',
                        ano: parseInt(anio) || null,
                        cliente_id: clienteId,
                        taller_id: tallerId
                    });
                    if (vehiculoId) cacheVehiculos[vehiculoKey] = vehiculoId;
                }
            }

            const precioTotal = parseInt(String(totalRaw).replace(/[^0-9-]/g, '')) || 0;
            const fechaNorm = parseExcelDate(fechaRaw);

            const ordenData = {
                taller_id: tallerId,
                cliente_id: clienteId,
                vehiculo_local_id: vehiculoId,
                patente_vehiculo: vehiculoKey || 'S/P',
                numero_orden: ot ? String(ot).substring(0, 20) : null,
                descripcion_ingreso: trabajo ? String(trabajo).substring(0, 255) : 'OT Histórica',
                detalle_trabajos: trabajo ? String(trabajo) : '',
                precio_total: precioTotal,
                estado: 'completada',
                fecha_ingreso: fechaNorm,
                creado_por: perfilId,
            };

            const { error: errOrden } = await supabase.from('ordenes').insert(ordenData);
            if (errOrden) {
                // Ignore null fkey constraint for creado_por if it fails, delete 'creado_por'
                if (errOrden.code === '23503' && errOrden.message.includes('creado_por')) {
                    delete ordenData.creado_por;
                    const { error: retryError } = await supabase.from('ordenes').insert(ordenData);
                    if (!retryError) countOrdenes++;
                } else {
                    require('fs').writeFileSync('error.json', JSON.stringify({ table: 'ordenes', message: errOrden.message, code: errOrden.code, details: errOrden.details, hint: errOrden.hint, data: ordenData }, null, 2));
                    console.error(`[Error OT ${ot}]`, errOrden.message);
                    process.exit(1);
                }
            } else {
                countOrdenes++;
            }

            if (index % 50 === 0 && index > 0) {
                console.log(`... procesadas ${index} filas ...`);
            }
        }

        console.log(`🎉 Migración finalizada! Se importaron exitosamente ${countOrdenes} órdenes de trabajo procedentes del Maestro Excel.`);
    } catch (e) {
        console.error('Fatal error en parsing o db:', e);
    }

    process.exit(0);
}

runMigration();
