import { createClient } from '@supabase/supabase-js';
import * as dotenv from 'dotenv';
dotenv.config();

const supabase = createClient(
    process.env.NEXT_PUBLIC_SUPABASE_URL!,
    process.env.SUPABASE_SERVICE_ROLE_KEY || process.env.NEXT_PUBLIC_SUPABASE_ANON_KEY!
);

async function run() {
    console.log("--- PERFILES ---");
    const { data: perfiles, error } = await supabase.from('perfiles').select('*');
    if (error) {
        console.error("Error fetching perfiles:", error.message);
    } else {
        const targets = perfiles?.filter(p => p.rol === 'superadmin' || p.nombre_completo.toLowerCase().includes('mati') || p.rol === 'taller_admin') || [];
        console.log("Found Perfiles:", targets.map(t => ({ id: t.id, nombre: t.nombre_completo, rol: t.rol })));

        // Auth request
        try {
            const { data: { users } } = await supabase.auth.admin.listUsers();
            console.log("--- AUTH USERS ---");
            const targetsAuth = users.filter(u => targets.some(t => t.id === u.id));
            console.log(targetsAuth.map(u => ({ email: u.email, nombre: targets.find(t => t.id === u.id)?.nombre_completo, rol: targets.find(t => t.id === u.id)?.rol })));
        } catch (e) {
            console.log("Could not use auth.admin", e.message);
        }
    }
}
run();
