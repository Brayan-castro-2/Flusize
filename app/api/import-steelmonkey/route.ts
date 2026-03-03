import { NextResponse } from 'next/server';
import { createClient } from '@supabase/supabase-js';

// Usamos Service Role Key para evadir RLS y tener privilegios completos para importar historiales
const supabaseUrl = process.env.NEXT_PUBLIC_SUPABASE_URL;
const supabaseServiceKey = process.env.SUPABASE_SERVICE_ROLE_KEY;

if (!supabaseUrl || !supabaseServiceKey) {
    throw new Error('Faltan variables de entorno de Supabase.');
}

const supabase = createClient(supabaseUrl, supabaseServiceKey);

// Taller ID de Steelmonkey Garage
const STEELMONKEY_TALLER_ID = 'e55ce6be-7b8c-4a1a-b333-666333666333';

export async function POST(request: Request) {
    try {
        // 0. Protección de la ruta secreta temporal
        const url = new URL(request.url);
        const secret = url.searchParams.get("secret");

        if (secret !== "titan2026-import") {
            return NextResponse.json({ error: "Unauthorized. Se requiere clave secreta." }, { status: 401 });
        }

        const data = await request.json();

        if (!Array.isArray(data)) {
            return NextResponse.json({ error: 'Payload debe ser un arreglo de objetos JSON.' }, { status: 400 });
        }

        const results = {
            procesados: 0,
            clientesCreados: 0,
            vehiculosCreados: 0,
            ordenesCreadas: 0,
            errores: [] as any[]
        };

        console.log(`🚀 Iniciando importación de ${data.length} registros para Steelmonkey...`);

        for (const item of data) {
            try {
                const {
                    fecha, ot, nombre, rut, fono, correo,
                    marca, modelo, km, año, color, patente,
                    detalle, total
                } = item;

                // 1. PASO A: Buscar o crear Cliente por RUT
                let clienteId;
                const rutLimpio = rut ? rut.toString().trim() : `S/RUT-${Date.now()}-${Math.floor(Math.random() * 1000)}`;

                const { data: clienteResult } = await supabase
                    .from('clientes')
                    .select('id')
                    .eq('rut_dni', rutLimpio)
                    .eq('taller_id', STEELMONKEY_TALLER_ID)
                    .single();

                if (clienteResult) {
                    clienteId = clienteResult.id;
                } else {
                    // Asegurar manejo de nulos
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

                    if (errCliente) throw new Error(`[Paso A] Error creando cliente ${rutLimpio}: ${errCliente.message}`);
                    clienteId = nuevoCliente.id;
                    results.clientesCreados++;
                }

                // 2. PASO B: Buscar o crear Vehículo por Patente
                let vehiculoId;
                const patenteLimpia = patente ? patente.toString().trim().toUpperCase() : `S/P-${Date.now()}`;

                const { data: vehiculoResult } = await supabase
                    .from('vehiculos')
                    .select('id')
                    .eq('patente', patenteLimpia)
                    .eq('taller_id', STEELMONKEY_TALLER_ID)
                    .single();

                if (vehiculoResult) {
                    vehiculoId = vehiculoResult.id;
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

                    if (errVehiculo) throw new Error(`[Paso B] Error creando vehículo ${patenteLimpia}: ${errVehiculo.message}`);
                    vehiculoId = nuevoVehiculo.id;
                    results.vehiculosCreados++;
                }

                // 3. PASO C: Crear la Orden de Trabajo (Historial)
                // Convertimos la fecha de Excel a String ISO si es posible. Si no, usamos la actual.
                let fechaIngreso = new Date().toISOString();
                if (fecha) {
                    const parsedDate = new Date(fecha);
                    if (!isNaN(parsedDate.getTime())) {
                        fechaIngreso = parsedDate.toISOString();
                    }
                }

                const precioTotal = total ? parseFloat(total.toString().replace(/[^0-9.-]+/g, "")) : 0;
                const numeroOT = ot ? ot.toString().trim() : `OT-HISTORICA-${Date.now()}`;

                const { error: errOrden } = await supabase
                    .from('ordenes')
                    .insert({
                        taller_id: STEELMONKEY_TALLER_ID,
                        cliente_id: clienteId,
                        vehiculo_local_id: vehiculoId,
                        patente_vehiculo: patenteLimpia,
                        numero_orden: numeroOT,
                        estado: 'entregado', // Asumimos que es historial completado
                        fecha_ingreso: fechaIngreso,
                        fecha_estimada_salida: fechaIngreso,
                        fecha_salida: fechaIngreso,
                        descripcion_problema: detalle ? detalle.toString() : 'Importado desde Excel Histórico',
                        trabajos_realizados: detalle ? detalle.toString() : 'Importado desde Excel Histórico',
                        precio_total: precioTotal,
                        metodo_pago: 'transferencia' // Por defecto
                    });

                if (errOrden) throw new Error(`[Paso C] Error creando orden ${numeroOT}: ${errOrden.message}`);

                results.ordenesCreadas++;
                results.procesados++;

            } catch (itemError: any) {
                console.error('Error registrando fila:', itemError.message);
                results.errores.push({
                    datosOriginales: item,
                    error: itemError.message
                });
            }
        }

        console.log(`✅ Importación finalizada. Procesados: ${results.procesados}`);

        return NextResponse.json({
            success: true,
            message: 'Lote de importación procesado exitosamente',
            resultados: results
        });

    } catch (error: any) {
        console.error('FATAL ERROR en importador:', error);
        return NextResponse.json({ success: false, error: error.message }, { status: 500 });
    }
}
