'use client';

import { useEffect, useState } from 'react';
import { useRouter } from 'next/navigation';
import { supabase } from '@/lib/supabase';

// ── EMAILS DE FUNDADORES (barrera de seguridad adicional) ─────────────────────
const FOUNDER_EMAILS = [
    'brayan.castro@flusize.com',
    'admin@flusize.com',
];

export default function SuperAdminLayout({ children }: { children: React.ReactNode }) {
    const router = useRouter();
    const [isVerifying, setIsVerifying] = useState(true);
    const [isAuthorized, setIsAuthorized] = useState(false);

    useEffect(() => {
        const verify = async () => {
            try {
                // Obtener sesión actual
                const { data: { session } } = await supabase.auth.getSession();

                if (!session?.user) {
                    router.replace('/login');
                    return;
                }

                // Verificar rol en tabla perfiles (validación principal)
                const { data: perfil } = await supabase
                    .from('perfiles')
                    .select('rol, email')
                    .eq('id', session.user.id)
                    .maybeSingle();

                const isFounderEmail = FOUNDER_EMAILS.includes(session.user.email || '');
                const isSuperAdminRole = perfil?.rol === 'superadmin';

                if (!isSuperAdminRole && !isFounderEmail) {
                    // No es fundador ni superadmin → acceso denegado
                    router.replace('/admin/ordenes');
                    return;
                }

                setIsAuthorized(true);
            } catch (err) {
                console.error('[SuperAdmin] Error verificando acceso:', err);
                router.replace('/login');
            } finally {
                setIsVerifying(false);
            }
        };

        verify();
    }, [router]);

    if (isVerifying) {
        return (
            <div className="min-h-screen bg-[#0B1121] flex items-center justify-center">
                <div className="text-center">
                    <div className="w-10 h-10 border-4 border-violet-500 border-t-transparent rounded-full animate-spin mx-auto mb-4" />
                    <p className="text-slate-400 text-sm">Verificando acceso...</p>
                </div>
            </div>
        );
    }

    if (!isAuthorized) {
        return (
            <div className="min-h-screen bg-[#0B1121] flex items-center justify-center">
                <div className="text-center p-8 bg-red-950/50 border border-red-500/30 rounded-2xl max-w-sm">
                    <div className="text-6xl mb-4">🚫</div>
                    <h1 className="text-xl font-bold text-red-400 mb-2">Acceso Denegado</h1>
                    <p className="text-slate-400 text-sm">No tienes permisos para acceder al panel de administración global.</p>
                </div>
            </div>
        );
    }

    return (
        <div className="min-h-screen bg-[#0B1121] text-white">
            {/* Header del God Mode */}
            <header className="border-b border-slate-800 bg-[#0D1528]/80 backdrop-blur-sm sticky top-0 z-50">
                <div className="max-w-7xl mx-auto px-6 py-4 flex items-center justify-between">
                    <div className="flex items-center gap-3">
                        <div className="w-8 h-8 bg-gradient-to-br from-violet-500 to-purple-700 rounded-lg flex items-center justify-center text-sm font-bold shadow-lg shadow-violet-500/30">
                            ⚡
                        </div>
                        <div>
                            <span className="font-bold text-white tracking-tight">FLUSIZE</span>
                            <span className="ml-2 text-xs bg-violet-500/20 text-violet-400 px-2 py-0.5 rounded-full border border-violet-500/30 font-semibold">
                                GOD MODE
                            </span>
                        </div>
                    </div>
                    <a
                        href="/admin/ordenes"
                        className="text-xs text-slate-500 hover:text-slate-300 transition-colors"
                    >
                        ← Volver al Taller
                    </a>
                </div>
            </header>

            <main className="max-w-7xl mx-auto px-6 py-8">
                {children}
            </main>
        </div>
    );
}
