'use client';

import { useState, Suspense } from 'react';
import { useSearchParams, useRouter } from 'next/navigation';
import { supabase } from '@/lib/supabase';
import {
    Key,
    Lock,
    ShieldCheck,
    AlertCircle,
    Loader2,
    ArrowRight,
    Settings
} from 'lucide-react';

function ActivationContent() {
    const searchParams = useSearchParams();
    const router = useRouter();
    const email = searchParams.get('email') || '';

    const [claveTemporal, setClaveTemporal] = useState('');
    const [nuevaClave, setNuevaClave] = useState('');
    const [error, setError] = useState<string | null>(null);
    const [loading, setLoading] = useState(false);
    const [success, setSuccess] = useState(false);

    const handleActivate = async (e: React.FormEvent) => {
        e.preventDefault();
        setError(null);
        setLoading(true);

        try {
            // 1. Iniciar sesión con la clave temporal
            const { error: signInError } = await supabase.auth.signInWithPassword({
                email,
                password: claveTemporal
            });

            if (signInError) throw new Error('La clave temporal es incorrecta o ha expirado.');

            // 2. Actualizar a la clave definitiva
            const { error: updateError } = await supabase.auth.updateUser({
                password: nuevaClave
            });

            if (updateError) throw new Error('No se pudo establecer la nueva contraseña. Intenta con una más segura.');

            setSuccess(true);
            setTimeout(() => {
                router.push('/admin/perfil');
            }, 2000);

        } catch (err: any) {
            setError(err.message);
            setLoading(false);
        }
    };

    if (success) {
        return (
            <div className="text-center space-y-6 animate-in fade-in zoom-in duration-500">
                <div className="w-20 h-20 bg-emerald-500 rounded-3xl flex items-center justify-center mx-auto shadow-xl shadow-emerald-500/20">
                    <ShieldCheck className="w-10 h-10 text-white" />
                </div>
                <div className="space-y-2">
                    <h2 className="text-2xl font-black text-gray-900">¡Cuenta Activada!</h2>
                    <p className="text-gray-500 font-medium">Bienvenido a la familia Flusize. Redirigiendo...</p>
                </div>
            </div>
        );
    }

    return (
        <div className="w-full max-w-md space-y-8 animate-in fade-in slide-in-from-bottom-4 duration-700">
            {/* Logo y Titulo */}
            <div className="text-center space-y-3">
                <div className="w-16 h-16 bg-gradient-to-br from-cyan-500 to-blue-600 rounded-2xl flex items-center justify-center mx-auto shadow-xl shadow-blue-500/20">
                    <Settings className="w-8 h-8 text-white" />
                </div>
                <div className="space-y-1">
                    <h1 className="text-3xl font-black text-gray-900 tracking-tight">Activa tu cuenta</h1>
                    <p className="text-gray-500 font-medium text-sm">Configura tu acceso definitivo a Flusize</p>
                </div>
            </div>

            <div className="bg-white border border-gray-100 rounded-[32px] p-8 shadow-2xl shadow-gray-200/50 space-y-6">
                <form onSubmit={handleActivate} className="space-y-5">
                    {/* Email Read-only */}
                    <div className="space-y-2">
                        <label className="text-[10px] font-black text-gray-400 uppercase tracking-widest pl-1">Email de Usuario</label>
                        <div className="relative group">
                            <div className="absolute inset-y-0 left-0 pl-4 flex items-center pointer-events-none text-gray-400">
                                <span>@</span>
                            </div>
                            <input
                                type="email"
                                value={email}
                                readOnly
                                className="w-full bg-gray-50 border border-gray-100 rounded-2xl pl-10 pr-4 py-3.5 text-sm font-bold text-gray-400 outline-none cursor-not-allowed"
                            />
                        </div>
                    </div>

                    {/* Clave Temporal */}
                    <div className="space-y-2">
                        <label className="text-[10px] font-black text-gray-500 uppercase tracking-widest pl-1">Clave Temporal</label>
                        <div className="relative group">
                            <div className="absolute inset-y-0 left-0 pl-4 flex items-center pointer-events-none text-gray-400 group-focus-within:text-blue-500 transition-colors">
                                <Key className="w-4 h-4" />
                            </div>
                            <input
                                type="password"
                                required
                                value={claveTemporal}
                                onChange={e => setClaveTemporal(e.target.value)}
                                placeholder="La clave que te envió Matías"
                                className="w-full bg-gray-50 border border-gray-200 rounded-2xl pl-11 pr-4 py-3.5 text-sm font-semibold text-gray-900 placeholder:text-gray-400 focus:bg-white focus:border-blue-500 focus:ring-4 focus:ring-blue-500/5 transition-all outline-none"
                            />
                        </div>
                    </div>

                    {/* Nueva Clave */}
                    <div className="space-y-2">
                        <label className="text-[10px] font-black text-gray-500 uppercase tracking-widest pl-1">Nueva Contraseña</label>
                        <div className="relative group">
                            <div className="absolute inset-y-0 left-0 pl-4 flex items-center pointer-events-none text-gray-400 group-focus-within:text-blue-500 transition-colors">
                                <Lock className="w-4 h-4" />
                            </div>
                            <input
                                type="password"
                                required
                                minLength={6}
                                value={nuevaClave}
                                onChange={e => setNuevaClave(e.target.value)}
                                placeholder="Define tu clave secreta"
                                className="w-full bg-gray-50 border border-gray-200 rounded-2xl pl-11 pr-4 py-3.5 text-sm font-semibold text-gray-900 placeholder:text-gray-400 focus:bg-white focus:border-blue-500 focus:ring-4 focus:ring-blue-500/5 transition-all outline-none"
                            />
                        </div>
                    </div>

                    {error && (
                        <div className="bg-red-50 border border-red-100 rounded-xl p-3 flex items-center gap-3 animate-shake">
                            <AlertCircle className="w-4 h-4 text-red-500 flex-shrink-0" />
                            <p className="text-xs font-bold text-red-600 leading-tight">{error}</p>
                        </div>
                    )}

                    <button
                        type="submit"
                        disabled={loading}
                        className="w-full bg-[#0066FF] hover:bg-blue-700 text-white font-black py-4 rounded-2xl shadow-xl shadow-blue-500/20 active:scale-[0.98] transition-all disabled:opacity-50 flex items-center justify-center gap-2 group"
                    >
                        {loading ? (
                            <Loader2 className="w-5 h-5 animate-spin" />
                        ) : (
                            <>
                                <span className="uppercase text-xs tracking-widest">Activar Mi Cuenta</span>
                                <ArrowRight className="w-4 h-4 group-hover:translate-x-1 transition-transform" />
                            </>
                        )}
                    </button>
                </form>
            </div>

            <p className="text-center text-xs text-gray-400 font-medium tracking-wide">
                Al activar tu cuenta aceptas los Términos de Servicio de Flusize.
            </p>
        </div>
    );
}

export default function ActivarPage() {
    return (
        <div className="min-h-screen bg-[#F8FAFC] flex flex-col items-center justify-center p-6 sm:p-12 relative overflow-hidden">
            {/* Decoración de fondo */}
            <div className="absolute top-0 right-0 -mr-20 -mt-20 w-96 h-96 bg-blue-50 rounded-full blur-3xl opacity-50" />
            <div className="absolute bottom-0 left-0 -ml-20 -mb-20 w-96 h-96 bg-cyan-50 rounded-full blur-3xl opacity-50" />

            <Suspense fallback={
                <div className="flex flex-col items-center justify-center space-y-4">
                    <Loader2 className="w-10 h-10 text-blue-600 animate-spin" />
                    <p className="text-gray-400 text-sm font-bold animate-pulse uppercase tracking-[0.2em]">Cargando Portal...</p>
                </div>
            }>
                <ActivationContent />
            </Suspense>
        </div>
    );
}
