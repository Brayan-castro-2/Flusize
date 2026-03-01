'use client';

import { useEffect } from 'react';
import { useRouter } from 'next/navigation';
import { useAuth } from '@/contexts/auth-context';

export default function SuperAdminLayout({ children }: { children: React.ReactNode }) {
    const router = useRouter();
    const { user, isLoading } = useAuth();

    useEffect(() => {
        // Esperar a que el auth termine de cargar
        if (isLoading) return;

        // Sin sesión → login
        if (!user) {
            router.replace('/login');
            return;
        }

        // Solo flusize_admin puede entrar (NO superadmin de talleres)
        if (user.role !== 'flusize_admin') {
            router.replace(user.role === 'mecanico' ? '/recepcion' : '/admin/ordenes');
        }
    }, [user, isLoading, router]);

    // Cargando auth
    if (isLoading) {
        return (
            <div className="min-h-screen bg-[#0B1121] flex items-center justify-center">
                <div className="text-center space-y-4">
                    <div className="w-12 h-12 border-4 border-violet-500 border-t-transparent rounded-full animate-spin mx-auto" />
                    <p className="text-slate-400 text-sm">Verificando acceso al God Mode...</p>
                </div>
            </div>
        );
    }

    // Sin usuario o no autorizado → no renderizar nada (useEffect ya redirige)
    if (!user || user.role !== 'flusize_admin') {
        return (
            <div className="min-h-screen bg-[#0B1121] flex items-center justify-center">
                <div className="text-center p-8 bg-red-950/40 border border-red-500/30 rounded-2xl max-w-sm">
                    <div className="text-6xl mb-4">🚫</div>
                    <h1 className="text-xl font-bold text-red-400 mb-2">Acceso Denegado</h1>
                    <p className="text-slate-400 text-sm">Esta área es exclusiva para los fundadores de Flusize.</p>
                    <a href="/" className="mt-4 inline-block text-xs text-slate-600 hover:text-slate-400 transition-colors">
                        ← Volver al inicio
                    </a>
                </div>
            </div>
        );
    }

    return (
        <div className="min-h-screen bg-[#0B1121] text-white">
            {/* Header God Mode */}
            <header className="border-b border-slate-800/80 bg-[#080f1e]/80 backdrop-blur-xl sticky top-0 z-50">
                <div className="max-w-7xl mx-auto px-6 py-4 flex items-center justify-between">
                    <div className="flex items-center gap-3">
                        <div className="relative">
                            <div className="w-9 h-9 bg-gradient-to-br from-violet-500 via-purple-600 to-indigo-700 rounded-xl flex items-center justify-center shadow-lg shadow-violet-500/40">
                                <span className="text-base">⚡</span>
                            </div>
                            <div className="absolute -top-1 -right-1 w-3 h-3 bg-emerald-400 rounded-full border-2 border-[#080f1e] animate-pulse" />
                        </div>
                        <div>
                            <h1 className="font-black text-white tracking-tight leading-none text-lg">
                                FLUSIZE
                                <span className="ml-2 text-xs bg-violet-500/20 text-violet-400 px-2 py-0.5 rounded-full border border-violet-500/30 font-semibold align-middle">
                                    GOD MODE
                                </span>
                            </h1>
                            <p className="text-slate-600 text-xs leading-none mt-0.5">{user.email}</p>
                        </div>
                    </div>
                    <a
                        href="/admin/ordenes"
                        className="text-xs text-slate-600 hover:text-slate-400 transition-colors"
                    >
                        ← Salir del God Mode
                    </a>
                </div>
            </header>

            <main className="max-w-7xl mx-auto px-6 py-8">
                {children}
            </main>
        </div>
    );
}
