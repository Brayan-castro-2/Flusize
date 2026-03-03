import fs from 'fs';
import { createClient } from '@supabase/supabase-js';
import dotenv from 'dotenv';

// Cargar variables de entorno desde .env.local y .env superior si existe
dotenv.config({ path: '.env.local' });
dotenv.config({ path: '.env', override: false });

const supabaseUrl = process.env.NEXT_PUBLIC_SUPABASE_URL;
const supabaseServiceKey = process.env.SUPABASE_SERVICE_ROLE_KEY;

if (!supabaseUrl || !supabaseServiceKey) {
    console.error('❌ Faltan variables de entorno NEXT_PUBLIC_SUPABASE_URL o SUPABASE_SERVICE_ROLE_KEY en .env.local');
    process.exit(1);
}

const supabase = createClient(supabaseUrl, supabaseServiceKey);
const STEELMONKEY_TALLER_ID = 'e55ce6be-7b8c-4a1a-b333-666333666333';

// Sleep de 150ms para no saturar las conexiones
const sleep = (ms) => new Promise((r) => setTimeout(r, ms));

const filePath = "C:\\Users\\FLUSIZE\\Downloads\\Flusize-main\\Flusize-main\\steelmonkey_masivo_completo.json";

async function iniciarInyeccionNativa() {
    console.log(`🚀 IMPORTADOR NATIVO SUPABASE 🚀`);
    console.log(`Leyendo archivo: ${filePath}`);

    if (!fs.existsSync(filePath)) {
        console.error("❌ El archivo no existe.");
        return;
    }

    const rawData = fs.readFileSync(filePath, 'utf8');
    let payload;

    try {
        payload = JSON.parse(rawData);
        console.log(`✅ JSON Cargado: ${payload.length} registros a procesar.`);
    } catch (e) {
        console.error("❌ Error decodificando JSON:", e);
        return;
    }

    let stats = { procesados: 0, errores: 0, clientes: 0, vehiculos: 0, ordenes: 0 };

    for (let i = 0; i < payload.length; i++) {
        const item = payload[i];
        console.log(`\n⏳ Fila ${i + 1}/${payload.length} | OT Excel: ${item.ot || 'S/N'}`);

        try {
            const { fecha, ot, nombre, rut, fono, correo, marca, modelo, km, año, color, patente, detalle, total } = item;

            // 1. Cliente
            let clienteId;
            const rutLimpio = rut ? rut.toString().trim() : `S/RUT-${Date.now()}-${Math.floor(Math.random() * 1000)}`;

            const { data: clienteExistente } = await supabase
                .from('clientes')
                .select('id')
                .eq('rut_dni', rutLimpio)
                .eq('taller_id', STEELMONKEY_TALLER_ID)
                .single();

            if (clienteExistente) {
                clienteId = clienteExistente.id;
            } else {
                const { data: nuevoCliente, error: errCliente } = await supabase
                    .from('clientes')
                    .insert({
                        taller_id: STEELMONKEY_TALLER_ID,
                        nombre_completo: nombre || 'Sin Nombre',
                        rut_dni: rutLimpio,
                        telefono: fono ? fono.toString() : null,
                        email: correo ? correo.toString() : null,
                        tipo: 'persona'
                    })
                    .select('id')
                    .single();

                if (errCliente) throw new Error(`Error Cliente: ${errCliente.message}`);
                clienteId = nuevoCliente.id;
                stats.clientes++;
            }

            // 2. Vehículo
            let vehiculoId;
            const patenteLimpia = patente ? patente.toString().trim().toUpperCase() : `S/P-${Date.now()}`;

            const { data: vehiculoExistente } = await supabase
                .from('vehiculos')
                .select('id')
                .eq('patente', patenteLimpia)
                .eq('taller_id', STEELMONKEY_TALLER_ID)
                .single();

            if (vehiculoExistente) {
                vehiculoId = vehiculoExistente.id;
            } else {
                const { data: nuevoVehiculo, error: errVehiculo } = await supabase
                    .from('vehiculos')
                    .insert({
                        taller_id: STEELMONKEY_TALLER_ID,
                        cliente_id: clienteId,
                        patente: patenteLimpia,
                        marca: marca ? marca.toString() : 'Desconocida',
                        modelo: modelo ? modelo.toString() : 'Desconocido',
                        ano: año ? parseInt(año.toString().replace(/[^0-9]/g, "")) : null,
                        color: color ? color.toString() : null,
                        kilometraje: km ? parseInt(km.toString().replace(/[^0-9]/g, "")) : null
                    })
                    .select('id')
                    .single();

                if (errVehiculo) throw new Error(`Error Vehiculo: ${errVehiculo.message}`);
                vehiculoId = nuevoVehiculo.id;
                stats.vehiculos++;
            }

            // 3. Orden de Trabajo
            const numeroOT = ot ? ot.toString().trim() : `OT-HISTORICA-${Date.now()}-${Math.floor(Math.random() * 100)}`;

            // PREVENIR DUPLICADOS DE ÓRDENES SI YA SE CREARON (SOLO SI TIENEN OT FIJO)
            if (ot) {
                const { data: ordenExistente } = await supabase
                    .from('ordenes')
                    .select('id')
                    .eq('numero_orden', numeroOT)
                    .eq('taller_id', STEELMONKEY_TALLER_ID)
                    .single();

                if (ordenExistente) {
                    console.log(`⏩ [Saltado] La orden ${numeroOT} ya existe en el historial.`);
                    stats.procesados++;
                    continue; // Pasa a la siguiente iteración
                }
            }

            let fechaIngreso = new Date().toISOString();
            if (fecha) {
                const parsedDate = new Date(fecha);
                if (!isNaN(parsedDate.getTime())) {
                    fechaIngreso = parsedDate.toISOString();
                }
            }

            const precioTotal = total ? parseFloat(total.toString().replace(/[^0-9.-]+/g, "")) : 0;

            const { error: errOrden } = await supabase
                .from('ordenes')
                .insert({
                    taller_id: STEELMONKEY_TALLER_ID,
                    cliente_id: clienteId,
                    vehiculo_local_id: vehiculoId,
                    patente_vehiculo: patenteLimpia,
                    numero_orden: numeroOT,
                    estado: 'entregada', // Estado histórico final
                    fecha_ingreso: fechaIngreso,
                    fecha_estimada_salida: fechaIngreso,
                    fecha_salida: fechaIngreso,
                    descripcion_problema: detalle ? detalle.toString() : 'Importado Histórico',
                    trabajos_realizados: detalle ? detalle.toString() : 'Importado Histórico',
                    precio_total: precioTotal,
                    metodo_pago: 'transferencia'
                });

            if (errOrden) throw new Error(`Error Orden: ${errOrden.message}`);

            console.log(`🟢 [OK] Orden creada: ${numeroOT} - Total: $${precioTotal}`);
            stats.ordenes++;
            stats.procesados++;

        } catch (itemError) {
            console.error(`🔴 Falló la inserción en la Fila ${i + 1}:`, itemError.message);
            stats.errores++;
        }

        // Descanso de red vital
        await sleep(150);
    }

    console.log(`\n========================================`);
    console.log(`🏁 RESUMEN DE IMPORTACIÓN NATIVA 🏁`);
    console.log(`========================================`);
    console.log(`Filas Leídas:       ${payload.length}`);
    console.log(`Filas Exitosas:     ${stats.procesados}`);
    console.log(`Filas con Error:    ${stats.errores}`);
    console.log(`----------------------------------------`);
    console.log(`Clientes Creados:   ${stats.clientes}`);
    console.log(`Vehículos Creados:  ${stats.vehiculos}`);
    console.log(`Órdenes Creadas:    ${stats.ordenes}`);
    console.log(`========================================`);
}

iniciarInyeccionNativa();
