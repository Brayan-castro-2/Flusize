import { createClient } from '@supabase/supabase-js';
import * as dotenv from 'dotenv';
import { resolve } from 'path';

// Load .env from project root
dotenv.config({ path: resolve(process.cwd(), '.env') });

const supabaseUrl = process.env.NEXT_PUBLIC_SUPABASE_URL;
const supabaseServiceKey = process.env.SUPABASE_SERVICE_ROLE_KEY;

if (!supabaseUrl || !supabaseServiceKey) {
    console.error('Error: NEXT_PUBLIC_SUPABASE_URL or SUPABASE_SERVICE_ROLE_KEY not found in .env');
    process.exit(1);
}

const supabaseAdmin = createClient(supabaseUrl, supabaseServiceKey);

async function resetFounderPassword() {
    const email = 'founder@flusize.com';
    const newPassword = '12345678'; // Fixed password for restoration

    console.log(`Intentando resetear contraseña para: ${email}...`);

    // 1. Get user id
    const { data: userData, error: userError } = await supabaseAdmin
        .from('perfiles')
        .select('id')
        .eq('email', email)
        .single();

    if (userError || !userData) {
        console.error('Error buscando el perfil del fundador:', userError?.message || 'Perfil no encontrado');
        return;
    }

    // 2. Update auth password
    const { data: authData, error: authError } = await supabaseAdmin.auth.admin.updateUserById(
        userData.id,
        { password: newPassword }
    );

    if (authError) {
        console.error('Error actualizando la contraseña en Auth:', authError.message);
        return;
    }

    console.log('✅ Contraseña reseteada con éxito.');
    console.log(`Email: ${email}`);
    console.log(`Nueva Contraseña: ${newPassword}`);
}

resetFounderPassword();
