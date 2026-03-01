// NOTA: Este archivo ya NO es una Server Action.
// La creación de usuarios se hace via la ruta API /api/usuarios/crear
// que usa la SERVICE_ROLE_KEY del servidor para no interrumpir la sesión del admin.

import { supabase } from '@/lib/supabase';

export async function crearUsuarioAdminAction(data: {
    email: string;
    password: string;
    nombreCompleto: string;
    rol: 'mecanico' | 'taller_admin' | 'superadmin';
    tallerId: string;
}): Promise<{ success?: boolean; error?: string; userId?: string }> {
    try {
        // Obtener el token de la sesión actual para que el backend pueda verificar
        // el rol del admin que está creando el usuario (validación de jerarquía)
        const { data: sessionData } = await supabase.auth.getSession();
        const token = sessionData?.session?.access_token;

        const response = await fetch('/api/usuarios/crear', {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json',
                ...(token ? { Authorization: `Bearer ${token}` } : {}),
            },
            body: JSON.stringify(data),
        });

        const result = await response.json();

        if (!response.ok) {
            return { error: result.error || `Error del servidor (${response.status})` };
        }

        return { success: true, userId: result.userId };
    } catch (e: any) {
        return { error: e.message || 'Error de red al conectar con el servidor' };
    }
}
