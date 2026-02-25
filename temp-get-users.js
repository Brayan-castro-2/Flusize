const { createClient } = require('@supabase/supabase-js');
const dotenv = require('dotenv');
dotenv.config();

const supabase = createClient(
    process.env.NEXT_PUBLIC_SUPABASE_URL,
    process.env.SUPABASE_SERVICE_ROLE_KEY || process.env.NEXT_PUBLIC_SUPABASE_ANON_KEY
);

async function run() {
    console.log("--- PERFILES ---");
    const { data: perfiles, error: err2 } = await supabase.from('perfiles').select('*');

    if (err2) {
        console.error("Error fetching perfiles:", err2);
    } else {
        console.log(perfiles.filter(p => p.rol === 'superadmin' || p.nombre_completo.toLowerCase().includes('mati') || p.rol === 'taller_admin'));
    }

    console.log("--- AUTH USERS ---");
    try {
        const { data: { users }, error } = await supabase.auth.admin.listUsers();
        if (error) throw error;
        const targetUsers = users.filter(u =>
            perfiles.some(p => p.id === u.id && (p.rol === 'superadmin' || p.nombre_completo.toLowerCase().includes('mati') || p.rol === 'taller_admin'))
        );
        console.log(targetUsers.map(u => ({ email: u.email, id: u.id })));
    } catch (e) {
        console.log("Could not use auth.admin, probably missing service role key or permissions.");
        console.log(e.message);
    }
}

run();
