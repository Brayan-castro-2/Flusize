const { createClient } = require('@supabase/supabase-js');

const supabaseUrl = process.env.NEXT_PUBLIC_SUPABASE_URL;
const serviceRoleKey = process.env.SUPABASE_SERVICE_ROLE_KEY;

const supabase = createClient(supabaseUrl, serviceRoleKey);

async function setupSteelmonkeyAdmin() {
    try {
        const email = 'contacto@steelmonkey.cl';
        const password = 'Titan2026!';

        console.log('1. Buscando usuario por email...');

        // Admin list users snippet
        // To simplify: we can just try to create the user, and if it fails due to existing email, get the user and update.
        let userId;

        // En supabase, no hay forma directa de buscar por email con la API de JS-client a menos de listar todo o invitar,
        // Bueno, podemos listar admin.listUsers() - pero asume pocos users o paginate.
        const { data: listData, error: listError } = await supabase.auth.admin.listUsers();
        if (listError) throw listError;

        const existingUser = listData.users.find(u => u.email === email);

        if (existingUser) {
            console.log('Usuario encontrado. Actualizando contraseña y forzando verificación de email...');
            const { data: updateData, error: updateError } = await supabase.auth.admin.updateUserById(
                existingUser.id,
                { password: password, email_confirm: true }
            );
            if (updateError) throw updateError;
            userId = updateData.user.id;
            console.log('Usuario actualizado: ' + userId);
        } else {
            console.log('Usuario no encontrado. Creando nuevo usuario...');
            const { data: createData, error: createError } = await supabase.auth.admin.createUser({
                email: email,
                password: password,
                email_confirm: true,
            });
            if (createError) throw createError;
            userId = createData.user.id;
            console.log('Usuario creado: ' + userId);
        }

        console.log('2. Buscando Taller "Steelmonkey Garage"...');
        const { data: talleres, error: tallerError } = await supabase
            .from('talleres')
            .select('id, nombre')
            .ilike('nombre', '%Steelmonkey%')
            .limit(1);

        if (tallerError) throw tallerError;

        if (!talleres || talleres.length === 0) {
            throw new Error('No se encontró el taller "Steelmonkey Garage". Por favor, verifica el nombre.');
        }

        const tallerId = talleres[0].id;
        console.log('Taller encontrado: ' + talleres[0].nombre + ' (ID: ' + tallerId + ')');

        console.log('3. Vinculando usuario al taller como superadmin...');
        const { data: linkData, error: linkError } = await supabase
            .from('taller_usuarios')
            .upsert({
                taller_id: tallerId,
                usuario_id: userId,
                rol: 'superadmin'
            }, { onConflict: 'taller_id,usuario_id' });

        if (linkError) throw linkError;

        console.log('¡Éxito! El usuario contacto@steelmonkey.cl ha sido configurado como superadmin del taller.');
        console.log('Contraseña forzada: Titan2026!');
    } catch (err) {
        console.error('ERROR FATAL:', err);
    }
}

setupSteelmonkeyAdmin();
