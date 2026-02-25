const fs = require('fs');
const env = fs.readFileSync('.env', 'utf8').split('\n').reduce((acc, line) => {
    const [k, ...v] = line.split('=');
    if (k && v.length) acc[k.trim()] = v.join('=').trim().replace(/['"]/g, '');
    return acc;
}, {});

const url = env.NEXT_PUBLIC_SUPABASE_URL;
const key = env.SUPABASE_SERVICE_ROLE_KEY || env.NEXT_PUBLIC_SUPABASE_ANON_KEY;

async function go() {
    try {
        console.log("1. Get Perfiles");
        let res = await fetch(url + '/rest/v1/perfiles?select=*', {
            headers: { apikey: key, Authorization: `Bearer ${key}` }
        });
        let perfiles = await res.json();
        let targets = perfiles.filter(p => !p.nombre_completo ? false : (p.rol === 'superadmin' || p.nombre_completo.toLowerCase().includes('mati') || p.rol === 'taller_admin'));

        console.log("2. Get Auth Users");
        let res2 = await fetch(url + '/auth/v1/admin/users', {
            headers: { apikey: key, Authorization: `Bearer ${key}` }
        });
        let auth = await res2.json();
        let targetsAuth = (auth.users || []).filter(u => targets.some(t => t.id === u.id));

        console.log("------------------- USERS -------------------");
        console.log(JSON.stringify(targetsAuth.map(u => ({
            email: u.email,
            nombre: targets.find(t => t.id === u.id)?.nombre_completo,
            rol: targets.find(t => t.id === u.id)?.rol
        })), null, 2));

        console.log("---------------------------------------------");
        console.log("3. Execute Migration via RPC");
        let res3 = await fetch(url + '/rest/v1/rpc/exec_sql', {
            method: 'POST',
            headers: { apikey: key, Authorization: `Bearer ${key}`, 'Content-Type': 'application/json' },
            body: JSON.stringify({
                sql_string: `
                  ALTER TABLE public.ordenes 
                  ADD COLUMN IF NOT EXISTS cotizacion_items JSONB DEFAULT NULL,
                  ADD COLUMN IF NOT EXISTS subtotal BIGINT DEFAULT NULL,
                  ADD COLUMN IF NOT EXISTS iva BIGINT DEFAULT NULL;
                `
            })
        });
        let rpc = await res3.text();
        console.log("Migration result code:", res3.status);
        console.log("Migration response:", rpc);
    } catch (e) {
        console.error("Script Error:", e);
    }
}
go();
