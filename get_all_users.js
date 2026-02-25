const fs = require('fs');
const env = fs.readFileSync('.env', 'utf8').split('\n').reduce((acc, line) => {
    const [k, ...v] = line.split('=');
    if (k && v.length) acc[k.trim()] = v.join('=').trim().replace(/['"]/g, '');
    return acc;
}, {});

const url = env.NEXT_PUBLIC_SUPABASE_URL;
const key = env.SUPABASE_SERVICE_ROLE_KEY || env.NEXT_PUBLIC_SUPABASE_ANON_KEY;

async function go() {
    let res = await fetch(url + '/rest/v1/perfiles?select=*', { headers: { apikey: key, 'Authorization': `Bearer ${key}` } });
    let perfiles = await res.json();

    let res2 = await fetch(url + '/auth/v1/admin/users', { headers: { apikey: key, 'Authorization': `Bearer ${key}` } });
    let auth = await res2.json();

    let result = {
        perfiles: perfiles.map(p => ({ id: p.id, nombre: p.nombre_completo, rol: p.rol })),
        auth: (auth.users || []).map(u => ({ id: u.id, email: u.email }))
    };

    fs.writeFileSync('users.json', JSON.stringify(result, null, 2), 'utf8');
    console.log("Wrote to users.json");
}
go();
