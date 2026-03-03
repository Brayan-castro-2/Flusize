const { createClient } = require('@supabase/supabase-js');
const supabase = createClient(process.env.NEXT_PUBLIC_SUPABASE_URL, process.env.NEXT_PUBLIC_SUPABASE_ANON_KEY);

async function testLogin() {
    const { data, error } = await supabase.auth.signInWithPassword({
        email: 'contacto@steelmonkey.cl',
        password: 'Titan2026!'
    });
    if (error) {
        console.error('Login Failed:', error.message);
    } else {
        console.log('Login Success! User ID:', data.user.id);
    }
}
testLogin();
