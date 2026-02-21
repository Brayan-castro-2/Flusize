
import { createClient } from '@supabase/supabase-js';

const supabaseUrl = process.env.NEXT_PUBLIC_SUPABASE_URL || '';
const supabaseKey = process.env.NEXT_PUBLIC_SUPABASE_ANON_KEY || '';

if (!supabaseUrl || !supabaseKey) {
    console.error("Missing Supabase env vars");
    process.exit(1);
}

const supabase = createClient(supabaseUrl, supabaseKey);

// Simulating the actualizarOrden function with the fix
async function testUpdate(id: string, updates: any) {
    const datosParaActualizar = { ...updates };

    // Sanitization list from lib/supabase-service.ts
    const fieldsToDelete = [
        'updated_at', 'fecha_actualizacion', 'id', 'fecha_ingreso', 'fecha_creacion',
        'fecha_entrega', 'fecha_completada', 'fecha_lista',
        'cliente_nombre', 'cliente_telefono', 'cliente_email', 'cliente_rut',
        'clientes', 'vehiculos', 'perfiles', 'cliente', 'vehiculo', 'asignado', 'creado',
        'creado_por_perfil', 'perfiles_creado', 'perfiles_asignado'
    ];

    fieldsToDelete.forEach(field => {
        delete datosParaActualizar[field];
    });

    console.log("Payload after sanitization:", JSON.stringify(datosParaActualizar));

    const { data, error } = await supabase
        .from('ordenes')
        .update(datosParaActualizar)
        .eq('id', id)
        .select()
        .single();

    if (error) {
        console.error("❌ Update failed with error:", error);
    } else {
        console.log("✅ Update successful! Data:", JSON.stringify(data));
    }
}

// Using the ID from the screenshot: 3a7980b8-5fc3-4cc1-b0cc-bb6327888c65
const testId = "3a7980b8-5fc3-4cc1-b0cc-bb6327888c65";
const badPayload = {
    "descripcion_ingreso": "Scanner (Test Fix)",
    "estado": "completada",
    "precio_total": 500000,
    "cliente_nombre": "brayan",
    "cliente_telefono": "+56979430387",
    "metodos_pago": null,
    "asignado_a": "b6b52060-b3dd-4c48-8747-7d17c5326bd4",
    "detalle_trabajos": "- Scanner: $500.000",
    "fecha_entrega": "2026-02-16T23:03:38.050Z",
    "fecha_salida": "2026-02-16T23:03:38.050Z"
};

testUpdate(testId, badPayload);
