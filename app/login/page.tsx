'use client';

import { useState } from 'react';
import { useRouter } from 'next/navigation';
import Link from 'next/link';
import { Button } from '@/components/ui/button';
import { Input } from '@/components/ui/input';
import { Label } from '@/components/ui/label';
import { AlertCircle, Loader2, User, Lock, ArrowLeft, Zap } from 'lucide-react';

// Logo Component (same as landing page)
const Logo = () => (
    <div className="flex items-center gap-2 justify-center">
        <div className="relative w-10 h-10">
            <div className="absolute inset-0 bg-gradient-to-tr from-cyan-500 to-blue-600 rounded-tr-xl rounded-bl-xl transform skew-x-[-10deg]"></div>
            <div className="absolute top-1/2 left-0 w-6 h-1 bg-white transform -translate-y-1/2 skew-x-[-10deg] ml-1"></div>
            <div className="absolute bottom-2 left-1 w-4 h-1 bg-white skew-x-[-10deg]"></div>
        </div>
        <div className="flex flex-col leading-none">
            <span className="font-extrabold text-3xl tracking-wide text-white">FLUSIZE</span>
            <span className="text-[0.65rem] font-medium text-cyan-400 tracking-wider">ORDEN Y CONTROL</span>
        </div>
    </div>
);

export default function LoginPage() {
    const [username, setUsername] = useState('');
    const [password, setPassword] = useState('');
    const [error, setError] = useState('');
    const [isLoading, setIsLoading] = useState(false);
    const router = useRouter();

    const handleSubmit = async (e: React.FormEvent) => {
        e.preventDefault();
        setError('');
        setIsLoading(true);

        // Simulate login delay
        setTimeout(() => {
            // Mock authentication logic
            if (username === 'admin' && password === '1234') {
                router.push('/admin');
            } else if (username === 'cliente' && password === '1234') {
                router.push('/conductores/mapa');
            } else {
                setError('Credenciales incorrectas. Intenta con las credenciales demo.');
            }
            setIsLoading(false);
        }, 1000);
    };

    return (
        <main className="min-h-screen flex flex-col bg-gradient-to-br from-slate-900 via-slate-800 to-slate-900 relative overflow-hidden">
            {/* Background decorations */}
            <div className="absolute top-0 right-0 w-96 h-96 bg-cyan-500/10 rounded-full blur-3xl"></div>
            <div className="absolute bottom-0 left-0 w-96 h-96 bg-blue-600/10 rounded-full blur-3xl"></div>

            {/* Back to Home */}
            <div className="absolute top-6 left-6 z-10">
                <Link href="/">
                    <button className="flex items-center gap-2 text-slate-400 hover:text-cyan-400 transition-colors">
                        <ArrowLeft className="w-5 h-5" />
                        <span className="text-sm font-medium">Volver al inicio</span>
                    </button>
                </Link>
            </div>

            <div className="flex-1 flex items-center justify-center p-6 relative z-10">
                <div className="w-full max-w-md">
                    {/* Logo */}
                    <div className="text-center mb-10">
                        <Logo />
                        <p className="text-sm text-slate-400 mt-4">
                            Acceso Unificado para Talleres y Clientes
                        </p>
                    </div>

                    {/* Login Card */}
                    <div className="bg-slate-800/50 backdrop-blur-md rounded-2xl p-8 border border-slate-700 shadow-2xl">
                        <h1 className="text-2xl font-bold text-white mb-6">Iniciar Sesión</h1>

                        <form onSubmit={handleSubmit} className="space-y-5">
                            {/* Error Message */}
                            {error && (
                                <div className="flex items-center gap-3 p-4 bg-red-500/10 border border-red-500/30 rounded-xl text-red-400">
                                    <AlertCircle className="w-5 h-5 flex-shrink-0" />
                                    <span className="text-sm">{error}</span>
                                </div>
                            )}

                            {/* Username Field */}
                            <div className="space-y-2">
                                <Label htmlFor="username" className="text-slate-300 text-sm font-medium">
                                    Usuario
                                </Label>
                                <div className="relative">
                                    <User className="absolute left-4 top-1/2 -translate-y-1/2 w-5 h-5 text-slate-500" />
                                    <Input
                                        id="username"
                                        type="text"
                                        value={username}
                                        onChange={(e) => setUsername(e.target.value)}
                                        placeholder="admin o cliente"
                                        className="h-12 pl-12 bg-slate-900/50 border-slate-600 text-white placeholder:text-slate-500 rounded-xl focus:ring-2 focus:ring-cyan-500"
                                        autoFocus
                                    />
                                </div>
                            </div>

                            {/* Password Field */}
                            <div className="space-y-2">
                                <Label htmlFor="password" className="text-slate-300 text-sm font-medium">
                                    Contraseña
                                </Label>
                                <div className="relative">
                                    <Lock className="absolute left-4 top-1/2 -translate-y-1/2 w-5 h-5 text-slate-500" />
                                    <Input
                                        id="password"
                                        type="password"
                                        value={password}
                                        onChange={(e) => setPassword(e.target.value)}
                                        placeholder="••••"
                                        className="h-12 pl-12 bg-slate-900/50 border-slate-600 text-white placeholder:text-slate-500 rounded-xl focus:ring-2 focus:ring-cyan-500"
                                    />
                                </div>
                            </div>

                            {/* Submit Button */}
                            <Button
                                type="submit"
                                className="w-full h-12 bg-gradient-to-r from-cyan-500 to-blue-600 hover:from-cyan-400 hover:to-blue-500 text-white text-base font-semibold rounded-xl shadow-lg shadow-cyan-500/25 transition-all"
                                disabled={isLoading}
                            >
                                {isLoading ? (
                                    <>
                                        <Loader2 className="w-5 h-5 mr-2 animate-spin" />
                                        Ingresando...
                                    </>
                                ) : (
                                    'Ingresar'
                                )}
                            </Button>

                            {/* Demo Credentials */}
                            <div className="text-center space-y-2 mt-6 p-4 bg-slate-900/50 rounded-xl border border-slate-700">
                                <p className="text-xs text-slate-400 font-semibold mb-2 flex items-center justify-center gap-2">
                                    <Zap className="w-3 h-3 text-cyan-400" />
                                    Credenciales Demo
                                </p>
                                <div className="flex flex-col gap-1 text-xs text-slate-500 font-mono">
                                    <p>Taller: <span className="text-cyan-400">admin</span> / <span className="text-cyan-400">1234</span></p>
                                    <p>Cliente: <span className="text-emerald-400">cliente</span> / <span className="text-cyan-400">1234</span></p>
                                </div>
                            </div>
                        </form>

                        {/* Register Link */}
                        <div className="mt-6 text-center">
                            <p className="text-sm text-slate-400">
                                ¿Eres un taller nuevo?{' '}
                                <Link href="/registro-taller" className="text-cyan-400 hover:text-cyan-300 font-semibold">
                                    Regístrate aquí
                                </Link>
                            </p>
                        </div>
                    </div>
                </div>
            </div>

            {/* Footer */}
            <div className="py-6 text-center relative z-10">
                <p className="text-xs text-slate-600">
                    © 2024 Flusize • Plataforma de Gestión Automotriz
                </p>
            </div>
        </main>
    );
}
