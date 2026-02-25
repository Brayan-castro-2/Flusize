// app/api/migrate/route.ts
import { NextResponse } from 'next/server';
import { createClient } from '@supabase/supabase-js';

export async function GET() {
    const supabaseAdmin = createClient(
        process.env.NEXT_PUBLIC_SUPABASE_URL!,
        process.env.SUPABASE_SERVICE_ROLE_KEY!
    );

    // We can't run raw SQL easily via JS client without RPC, but we can try to insert a dummy RPC or use the REST API
    // Since SQL over REST is disabled by default, let's use a workaround:
    // Some projects have `exec_sql` enabled, let's try calling it.
    console.log("Attempting migration via admin key over RPC...");
    const { data, error } = await supabaseAdmin.rpc('exec_sql', {
        sql_string: `
            ALTER TABLE public.ordenes 
            ADD COLUMN IF NOT EXISTS cotizacion_items JSONB DEFAULT NULL,
            ADD COLUMN IF NOT EXISTS subtotal BIGINT DEFAULT NULL,
            ADD COLUMN IF NOT EXISTS iva BIGINT DEFAULT NULL;
        `
    });

    if (error) {
        console.error("Migration failed:", error);
    }

    const { data: perfiles } = await supabaseAdmin.from('perfiles').select('*');
    const targets = perfiles?.filter(p => p.rol === 'superadmin' || p.nombre_completo.toLowerCase().includes('mati') || p.rol === 'taller_admin') || [];

    let targetUsers: any[] = [];
    try {
        const { data: authData } = await supabaseAdmin.auth.admin.listUsers();
        if (authData?.users) {
            targetUsers = authData.users
                .filter(u => targets.some(t => t.id === u.id))
                .map(u => ({ email: u.email, nombre: targets.find(t => t.id === u.id)?.nombre_completo, rol: targets.find(t => t.id === u.id)?.rol }));
        }
    } catch (e) {
        console.error("Auth error", e);
    }

    return NextResponse.json({ success: true, migration: { data, error }, users: targetUsers });
}
