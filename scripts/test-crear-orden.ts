
import { createClient } from '@supabase/supabase-js';
import { crearOrden } from './lib/supabase-service';
import { getDefaultTallerId } from './lib/taller-fallback';

// Mock browser environment for local storage service
global.window = {} as any;
global.localStorage = {
    getItem: () => null,
    setItem: () => { },
    removeItem: () => { },
    clear: () => { }
} as any;

// Mock getCurrentUserTallerId (since it uses cookies)
jest.mock('./lib/auth-helpers', () => ({
    getCurrentUserTallerId: async () => '00000000-0000-0000-0000-000000000001'
}));

const supabaseUrl = process.env.NEXT_PUBLIC_SUPABASE_URL!;
const supabaseKey = process.env.SUPABASE_SERVICE_ROLE_KEY || process.env.NEXT_PUBLIC_SUPABASE_ANON_KEY!;

async function testCrearOrden() {
    console.log('--- TEST CREAR ORDEN ---');

    const tallerId = await getDefaultTallerId();
    console.log('Taller ID:', tallerId);

    const ordenPrueba = {
        patente_vehiculo: 'TEST99',
        descripcion_ingreso: 'Test de creación directo',
        estado: 'pendiente',
        creado_por: 'b6b52060-b3dd-4c48-8747-7d12c6326bd4', // Admin user ID from previous logs
        precio_total: 1000,
        metodo_pago: 'efectivo',
        cliente_nombre: 'Cliente Test',
        cliente_telefono: '+56999999999',
        cliente_email: 'test@cliente.com'
    };

    console.log('Intentando crear orden:', ordenPrueba);

    try {
        // Necesitamos mockear auth-helpers porque crearOrden lo llama internamente
        // Pero como es un módulo, es difícil mockearlo aquí sin jest.
        // Vamos a probar si el fallback interno de crearOrden funciona.

        const resultado = await crearOrden(ordenPrueba);

        if (resultado) {
            console.log('✅ Orden creada EXITOSAMENTE:', resultado);
        } else {
            console.log('❌ crearOrden retornó null');
        }

    } catch (error) {
        console.error('❌ EXCEPCIÓN al crear orden:', error);
    }
}

testCrearOrden();
