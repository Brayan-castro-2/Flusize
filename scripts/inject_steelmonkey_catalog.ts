import { createClient } from '@supabase/supabase-js';
import * as dotenv from 'dotenv';
import path from 'path';

// Load environment variables from .env.local
dotenv.config({ path: path.resolve(process.cwd(), '.env.local') });

const supabaseUrl = process.env.NEXT_PUBLIC_SUPABASE_URL;
const supabaseServiceKey = process.env.SUPABASE_SERVICE_ROLE_KEY;

if (!supabaseUrl || !supabaseServiceKey) {
    console.error("Missing Supabase credentials in .env.local");
    process.exit(1);
}

const supabase = createClient(supabaseUrl, supabaseServiceKey);

const SERVICIOS_NUEVOS = [
    "Instalación / Cambio de Colas de Escape",
    "Instalación de Silenciador (Alto Flujo)",
    "Modificación / Fabricación Línea de Escape",
    "Instalación de Axle Back",
    "Reprogramación ECU (General)",
    "Fabricación / Instalación Downpipe",
    "Instalación de Cut-Out",
    "Reprogramación Stage 2",
    "Reprogramación Stage 1",
    "Eliminación / Desactivación EGR",
    "Eliminación / Desactivación DPF",
    "Sistema Valvetronic",
    "Instalación de Catback"
];

async function run() {
    console.log('--- Iniciando Inyección de Catálogo de Servicios para Steel Monkey ---');

    // 1. Obtener el taller_id de Steel Monkey
    const { data: taller, error: tallerErr } = await supabase
        .from('talleres')
        .select('id, nombre')
        .ilike('nombre', '%Steel Monkey%')
        .single();

    if (tallerErr || !taller) {
        console.error('Error al encontrar el taller Steel Monkey:', tallerErr?.message);
        process.exit(1);
    }

    console.log(`✅ Taller encontrado: ${taller.nombre} (ID: ${taller.id})`);
    const tallerId = taller.id;

    // 2. Limpiar servicios existentes para ese taller (borrado físico o desactivación)
    // Como es un catálogo nuevo, borraremos los de prueba.
    const { error: deleteErr } = await supabase
        .from('servicios')
        .delete()
        .eq('taller_id', tallerId);

    if (deleteErr) {
        console.error('Error al limpiar servicios antiguos:', deleteErr.message);
        // No salimos, quizás no había nada, o quizás no tenemos permisos de delete, intentemos continuar
    } else {
        console.log('✅ Servicios antiguos de prueba eliminados para este taller.');
    }

    // 3. Crear los nuevos servicios
    const serviciosInsertar = SERVICIOS_NUEVOS.map(nombre => ({
        nombre,
        descripcion: '', // Opcional
        precio_base: 0, // El CEO no especificó precios estáticos
        activo: true,
        taller_id: tallerId
    }));

    const { data: insertData, error: insertErr } = await supabase
        .from('servicios')
        .insert(serviciosInsertar)
        .select();

    if (insertErr) {
        console.error('❌ Error inyectando nuevos servicios:', insertErr.message);
        process.exit(1);
    }

    console.log(`✅ ¡Éxito! Se han inyectado ${insertData?.length} servicios oficiales al catálogo de Steel Monkey.`);
    process.exit(0);
}

run();
