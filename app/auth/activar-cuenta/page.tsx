'use client';

import React, { useState, useEffect, Suspense } from 'react';
import { useSearchParams, useRouter } from 'next/navigation';
import { motion, AnimatePresence } from 'framer-motion';
import {
    Lock,
    Eye,
    EyeOff,
    ShieldCheck,
    AlertCircle,
    Loader2,
    ArrowRight,
    Zap,
    Sparkles
} from 'lucide-react';
import { cn } from '@/lib/utils';
import { Button } from '@/components/ui/button';

function ActivationForm() {
    const searchParams = useSearchParams();
    const router = useRouter();
    const token = searchParams.get('token');

    const [password, setPassword] = useState('');
    const [confirmPassword, setConfirmPassword] = useState('');
    const [showPassword, setShowPassword] = useState(false);
    const [isLoading, setIsLoading] = useState(false);
    const [isActivating, setIsActivating] = useState(false);
    const [error, setError] = useState<string | null>(null);

    // Password strength logic (simplificado para UI Feedback)
    const isStrong = password.length >= 8;
    const matches = password === confirmPassword && confirmPassword !== '';

    async function handleSubmit(e: React.FormEvent) {
        e.preventDefault();
        if (!matches) {
            setError('Las contraseñas no coinciden');
            return;
        }
        if (!isStrong) {
            setError('La contraseña debe tener al menos 8 caracteres');
            return;
        }

        setError(null);
        setIsLoading(true);

        // Simulación de proceso de activación premium
        try {
            // Aquí iría la llamada a Supabase/API para usar el token y setear pass
            await new Promise(resolve => setTimeout(resolve, 1500));

            setIsActivating(true);

            // Animación de "Cargando Ecosistema..."
            await new Promise(resolve => setTimeout(resolve, 2500));

            router.push('/admin/dashboard');
        } catch (err) {
            setError('Error al activar la cuenta. Por favor contacta a soporte.');
            setIsLoading(false);
        }
    }

    if (isActivating) {
        return (
            <motion.div
                initial={{ opacity: 0 }}
                animate={{ opacity: 1 }}
                className="flex flex-col items-center justify-center space-y-8 text-center"
            >
                <div className="relative">
                    <motion.div
                        animate={{ rotate: 360 }}
                        transition={{ duration: 2, repeat: Infinity, ease: "linear" }}
                        className="w-24 h-24 border-t-4 border-r-4 border-blue-500 rounded-full"
                    />
                    <Zap className="absolute inset-0 m-auto w-10 h-10 text-cyan-400 animate-pulse" />
                </div>
                <div className="space-y-2">
                    <h2 className="text-3xl font-black text-white tracking-tighter uppercase">Cargando Ecosistema...</h2>
                    <p className="text-blue-300 font-bold tracking-widest text-xs uppercase animate-pulse">Sincronizando herramientas de gestión avanzada</p>
                </div>
            </motion.div>
        );
    }

    return (
        <motion.div
            initial={{ opacity: 0, scale: 0.95, y: 20 }}
            animate={{ opacity: 1, scale: 1, y: 0 }}
            className="w-full max-w-md bg-white/10 backdrop-blur-xl border border-white/20 rounded-[2.5rem] p-10 shadow-2xl relative overflow-hidden"
        >
            {/* Glossy top highlight */}
            <div className="absolute top-0 left-0 right-0 h-px bg-gradient-to-r from-transparent via-white/30 to-transparent" />

            <div className="text-center mb-10 space-y-4">
                <div className="inline-flex items-center gap-2 px-3 py-1 rounded-full bg-blue-500/10 border border-blue-500/30 text-blue-400 mb-2">
                    <Sparkles className="w-3 h-3" />
                    <span className="text-[10px] font-black tracking-widest uppercase">Portal de Activación</span>
                </div>
                <h1 className="text-2xl md:text-3xl font-black text-white tracking-tight leading-none uppercase">
                    ¡BIENVENIDO A LA <br />
                    <span className="text-transparent bg-clip-text bg-gradient-to-r from-cyan-400 to-blue-400">RED FLUSIZE!</span>
                </h1>
                <p className="text-slate-300 text-sm font-medium leading-relaxed">
                    Tu taller ha sido pre-registrado con éxito. Crea tu contraseña de acceso para comenzar a digitalizar tu operación.
                </p>
            </div>

            <form onSubmit={handleSubmit} className="space-y-6">
                {/* Field 1: Password */}
                <div className="space-y-2">
                    <label className="text-[10px] font-black text-slate-400 uppercase tracking-widest pl-1">Nueva Contraseña</label>
                    <div className="relative group">
                        <div className="absolute inset-y-0 left-0 pl-4 flex items-center pointer-events-none text-slate-400 group-focus-within:text-blue-400 transition-colors">
                            <Lock className="w-4 h-4" />
                        </div>
                        <input
                            type={showPassword ? "text" : "password"}
                            required
                            value={password}
                            onChange={(e) => setPassword(e.target.value)}
                            placeholder="Mínimo 8 caracteres"
                            className="w-full bg-black/20 border border-white/10 rounded-2xl pl-11 pr-12 py-4 text-sm font-bold text-white placeholder:text-slate-500 focus:bg-black/30 focus:border-cyan-500/50 focus:ring-4 focus:ring-cyan-500/5 transition-all outline-none"
                        />
                        <button
                            type="button"
                            onClick={() => setShowPassword(!showPassword)}
                            className="absolute inset-y-0 right-0 pr-4 flex items-center text-slate-400 hover:text-white transition-colors"
                        >
                            {showPassword ? <EyeOff className="w-4 h-4" /> : <Eye className="w-4 h-4" />}
                        </button>
                    </div>
                </div>

                {/* Field 2: Confirm Password */}
                <div className="space-y-2">
                    <label className="text-[10px] font-black text-slate-400 uppercase tracking-widest pl-1">Confirmar Contraseña</label>
                    <div className="relative group">
                        <div className="absolute inset-y-0 left-0 pl-4 flex items-center pointer-events-none text-slate-400 group-focus-within:text-blue-400 transition-colors">
                            <Lock className="w-4 h-4" />
                        </div>
                        <input
                            type={showPassword ? "text" : "password"}
                            required
                            value={confirmPassword}
                            onChange={(e) => setConfirmPassword(e.target.value)}
                            placeholder="Repite tu contraseña"
                            className={cn(
                                "w-full bg-black/20 border border-white/10 rounded-2xl pl-11 pr-4 py-4 text-sm font-bold text-white placeholder:text-slate-500 focus:bg-black/30 focus:border-cyan-500/50 focus:ring-4 focus:ring-cyan-500/5 transition-all outline-none",
                                confirmPassword && !matches && "border-red-500/50 focus:border-red-500",
                                matches && "border-green-500/50 focus:border-green-500"
                            )}
                        />
                    </div>
                </div>

                {error && (
                    <motion.div
                        initial={{ opacity: 0, x: -10 }}
                        animate={{ opacity: 1, x: 0 }}
                        className="bg-red-500/10 border border-red-500/20 rounded-xl p-3 flex items-center gap-3"
                    >
                        <AlertCircle className="w-4 h-4 text-red-500 flex-shrink-0" />
                        <p className="text-xs font-bold text-red-400 leading-tight">{error}</p>
                    </motion.div>
                )}

                <button
                    type="submit"
                    disabled={isLoading || !matches || !isStrong}
                    className="w-full bg-blue-600 hover:bg-blue-500 text-white font-black py-5 rounded-2xl shadow-xl shadow-blue-600/20 active:scale-[0.98] transition-all disabled:opacity-50 disabled:cursor-not-allowed flex items-center justify-center gap-3 group relative overflow-hidden"
                >
                    <div className="absolute inset-0 bg-gradient-to-r from-transparent via-white/10 to-transparent -translate-x-full group-hover:translate-x-full transition-transform duration-1000" />
                    {isLoading ? (
                        <Loader2 className="w-5 h-5 animate-spin" />
                    ) : (
                        <>
                            <span className="uppercase text-sm tracking-tight text-nowrap">Activar mi Cuenta y Entrar</span>
                            <ArrowRight className="w-5 h-5 group-hover:translate-x-1 transition-transform" />
                        </>
                    )}
                </button>
            </form>

            <div className="mt-8 flex justify-center gap-4">
                <ShieldCheck className="w-10 h-10 text-slate-500 opacity-30" />
                <Lock className="w-10 h-10 text-slate-500 opacity-30" />
            </div>
        </motion.div>
    );
}

export default function ActivarCuentaPage() {
    return (
        <main className="relative min-h-screen flex items-center justify-center overflow-hidden bg-black">
            {/* Cinematic Video Background */}
            <video
                autoPlay
                loop
                muted
                playsInline
                preload="metadata"
                className="absolute inset-0 w-full h-full object-cover z-0 blur-[12px] scale-110"
            >
                <source src="/hero-bg.mp4" type="video/mp4" />
            </video>

            {/* Dark Overlay for Contrast */}
            <div className="absolute inset-0 bg-black/60 z-0 pointer-events-none" />

            {/* Neural/Mesh background accent */}
            <div className="absolute inset-0 -z-0 pointer-events-none overflow-hidden opacity-30">
                <div className="absolute top-[-10%] right-[-10%] w-[500px] h-[500px] rounded-full bg-blue-600/20 blur-[120px]" />
                <div className="absolute bottom-[-10%] left-[-10%] w-[600px] h-[600px] rounded-full bg-cyan-600/20 blur-[150px]" />
            </div>

            <div className="relative z-10 w-full px-6 flex justify-center py-12">
                <Suspense fallback={
                    <div className="flex flex-col items-center gap-4">
                        <Loader2 className="w-12 h-12 text-blue-500 animate-spin" />
                        <p className="text-slate-400 font-bold tracking-widest text-[10px] uppercase">Cargando Portal Digital...</p>
                    </div>
                }>
                    <ActivationForm />
                </Suspense>
            </div>
        </main>
    );
}
