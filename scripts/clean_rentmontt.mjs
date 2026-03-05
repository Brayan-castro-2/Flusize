import { createClient } from '@supabase/supabase-js';

const supabaseUrl = process.env.NEXT_PUBLIC_SUPABASE_URL;
const supabaseKey = process.env.SUPABASE_SERVICE_ROLE_KEY;
const supabase = createClient(supabaseUrl, supabaseKey);

async function cleanRentMontt() {
    console.log("🔥 INICIANDO PURGA DE ORDENES POR ERROR (Taller RentMontt)...");

    // Purga órdenes
    const { data: ordenes, error: errOrd } = await supabase
        .from('ordenes')
        .delete()
        .eq('taller_id', '78a71bd3-c3e3-4cf3-8f62-6b6a420952b5')
        .ilike('descripcion_problema', '%Ingreso 2026%')
        .select('id, cliente_id, vehiculo_local_id');

    if (errOrd) {
        console.error("❌ Error borrando órdenes:", errOrd);
        return;
    }

    console.log(`✅ Borradas ${ordenes?.length || 0} órdenes asociadas al error.`);

    // Extrayendo IDs para purgar clientes y vehiculos huérfanos generados hoy
    if (ordenes && ordenes.length > 0) {
        const clienteIds = [...new Set(ordenes.map(o => o.cliente_id).filter(Boolean))];
        const vehiculoIds = [...new Set(ordenes.map(o => o.vehiculo_local_id).filter(Boolean))];

        if (vehiculoIds.length > 0) {
            const { data: vehiculos, error: errVeh } = await supabase
                .from('vehiculos')
                .delete()
                .eq('taller_id', '78a71bd3-c3e3-4cf3-8f62-6b6a420952b5')
                .in('id', vehiculoIds)
                .select('id');
            console.log(`✅ Borrados ${vehiculos?.length || 0} vehículos asociados.`);
        }

        if (clienteIds.length > 0) {
            const { data: clientes, error: errCli } = await supabase
                .from('clientes')
                .delete()
                .eq('taller_id', '78a71bd3-c3e3-4cf3-8f62-6b6a420952b5')
                .in('id', clienteIds)
                .select('id');
            console.log(`✅ Borrados ${clientes?.length || 0} clientes creados.`);
        }
    }
}

cleanRentMontt();
