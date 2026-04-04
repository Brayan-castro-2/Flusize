const fs = require('fs');
const env = fs.existsSync('.env') ? fs.readFileSync('.env','utf8') : fs.readFileSync('.env.development','utf8');
const url = env.match(/NEXT_PUBLIC_SUPABASE_URL=(.*)/)?.[1]?.trim();
const key = env.match(/NEXT_PUBLIC_SUPABASE_ANON_KEY=(.*)/)?.[1]?.trim();

// See what columns contratos actually has
fetch(url + '/rest/v1/contratos?select=*&limit=1', {
  headers: { 'apikey': key, 'Authorization': 'Bearer '+key },
}).then(async r => {
  console.log('STATUS:', r.status);
  const t = await r.text();
  console.log('BODY:', t);
}).catch(e => console.error(e));
