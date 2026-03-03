import { createClient } from '@supabase/supabase-js';
import { readFileSync } from 'fs';
import { resolve } from 'path';

// Leer variables de entorno manualmnte desde .env
function loadEnv() {
    try {
        const envPath = resolve(process.cwd(), '.env');
        const content = readFileSync(envPath, 'utf8');
        for (const line of content.split('\n')) {
            const trimmed = line.trim();
            if (trimmed && !trimmed.startsWith('#')) {
                const eqIndex = trimmed.indexOf('=');
                if (eqIndex > -1) {
                    const key = trimmed.slice(0, eqIndex).trim();
                    const val = trimmed.slice(eqIndex + 1).trim().replace(/^["']|["']$/g, '');
                    if (!process.env[key]) process.env[key] = val;
                }
            }
        }
    } catch (e) {
        console.log('No se pudo leer .env, usando variables del entorno...');
    }
}

loadEnv();

const SUPABASE_URL = process.env.NEXT_PUBLIC_SUPABASE_URL;
const SERVICE_ROLE_KEY = process.env.SUPABASE_SERVICE_ROLE_KEY;

if (!SUPABASE_URL || !SERVICE_ROLE_KEY) {
    console.error('❌ ERROR: No se encontraron NEXT_PUBLIC_SUPABASE_URL o SUPABASE_SERVICE_ROLE_KEY en las variables de entorno.');
    process.exit(1);
}

const supabase = createClient(SUPABASE_URL, SERVICE_ROLE_KEY, {
    auth: {
        autoRefreshToken: false,
        persistSession: false,
    },
});

const USER_ID = '0d23174d-be32-469d-a273-4f7a2ec4a290';
const NEW_PASSWORD = '12345678';

console.log(`🔑 Reseteando contraseña del usuario: contacto@steelmonkey.cl`);
console.log(`📋 User ID: ${USER_ID}`);

const { data, error } = await supabase.auth.admin.updateUserById(
    USER_ID,
    { password: NEW_PASSWORD }
);

if (error) {
    console.error('❌ Error al resetear la contraseña:', error.message);
    process.exit(1);
}

console.log('✅ ¡Contraseña actualizada exitosamente!');
console.log('👤 Usuario:', data.user.email);
console.log('🕐 Actualizado en:', data.user.updated_at);
