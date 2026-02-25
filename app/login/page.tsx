'use client';

import { useState, useEffect } from 'react';
import { createBrowserClient } from '@supabase/ssr';
import { ArrowLeft, Mail, Loader2, CheckCircle2, AlertCircle, Lock } from 'lucide-react';
import Link from 'next/link';
import { useRouter } from 'next/navigation';
import { Button } from '@/components/ui/button';
import { Input } from '@/components/ui/input';
import { Label } from '@/components/ui/label';

// Logo Component
const Logo = () => (
    <div className="flex items-center gap-2 justify-center">
        <img src="/logo_flusize.png" alt="Flusize" className="w-10 h-10 object-contain" />
        <div className="flex flex-col leading-none">
            <span className="font-extrabold text-3xl tracking-wide text-slate-800">FLUSIZE</span>
            <span className="text-[0.65rem] font-bold text-blue-600 tracking-wider">ORDEN Y CONTROL</span>
        </div>
    </div>
);

export default function LoginPage() {
    const router = useRouter();
    const [email, setEmail] = useState('');
    const [password, setPassword] = useState('');
    const [status, setStatus] = useState<'idle' | 'loading' | 'success' | 'error'>('idle');
    const [errorMsg, setErrorMsg] = useState('');

    useEffect(() => {
        // Guardar claim_id si viene en la URL para la Fusión de Perfiles B2C
        try {
            const params = new URLSearchParams(window.location.search);
            const claimId = params.get('claim_id');
            if (claimId) {
                console.log('Claim ID detectado:', claimId);
                localStorage.setItem('claim_id', claimId);
            }
        } catch (e) {
            console.error('Error parseando URL params:', e);
        }
    }, []);

    const handlePasswordLogin = async (e: React.FormEvent) => {
        e.preventDefault();

        if (!email || !email.includes('@')) {
            setStatus('error');
            setErrorMsg('Por favor ingresa un correo válido.');
            return;
        }

        if (!password) {
            setStatus('error');
            setErrorMsg('Por favor ingresa tu contraseña.');
            return;
        }

        setStatus('loading');

        try {
            const supabaseBrowser = createBrowserClient(
                process.env.NEXT_PUBLIC_SUPABASE_URL!,
                process.env.NEXT_PUBLIC_SUPABASE_ANON_KEY!
            );
            const { error } = await supabaseBrowser.auth.signInWithPassword({
                email,
                password
            });

            if (error) throw error;

            router.push('/admin/ordenes');
        } catch (error: any) {
            console.error('Password Login error:', error);
            setStatus('error');
            setErrorMsg(error.message || 'Contraseña o correo incorrectos.');
        }
    };

    const handleMagicLink = async () => {
        if (!email || !email.includes('@')) {
            setStatus('error');
            setErrorMsg('Escribe tu correo primero para usar el Link Mágico.');
            return;
        }

        setStatus('loading');

        try {
            const supabaseBrowser = createBrowserClient(
                process.env.NEXT_PUBLIC_SUPABASE_URL!,
                process.env.NEXT_PUBLIC_SUPABASE_ANON_KEY!
            );
            const { error } = await supabaseBrowser.auth.signInWithOtp({
                email,
                options: {
                    emailRedirectTo: `${window.location.origin}/auth/callback`,
                },
            });

            if (error) throw error;

            setStatus('success');
        } catch (error: any) {
            console.error('Login error:', error);
            setStatus('error');
            setErrorMsg(error.message || 'Ocurrió un error enviando el enlace.');
        }
    };

    const handleGoogleLogin = async () => {
        setStatus('loading');
        try {
            const supabaseBrowser = createBrowserClient(
                process.env.NEXT_PUBLIC_SUPABASE_URL!,
                process.env.NEXT_PUBLIC_SUPABASE_ANON_KEY!
            );
            const { error } = await supabaseBrowser.auth.signInWithOAuth({
                provider: 'google',
                options: {
                    redirectTo: `${window.location.origin}/auth/callback`,
                },
            });
            if (error) throw error;
            // No seteamos status a success ya que esto redirige la ventana a Google.
        } catch (error: any) {
            console.error('Google login error:', error);
            setStatus('error');
            setErrorMsg(error.message || 'Ocurrió un error inicializando el login con Google.');
        }
    };

    const GoogleIcon = () => (
        <svg className="w-5 h-5 mr-3" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg">
            <path d="M22.56 12.25c0-.78-.07-1.53-.2-2.25H12v4.26h5.92c-.26 1.37-1.04 2.53-2.21 3.31v2.77h3.57c2.08-1.92 3.28-4.74 3.28-8.09z" fill="#4285F4" />
            <path d="M12 23c2.97 0 5.46-.98 7.28-2.66l-3.57-2.77c-.98.66-2.23 1.06-3.71 1.06-2.86 0-5.29-1.93-6.16-4.53H2.18v2.84C3.99 20.53 7.7 23 12 23z" fill="#34A853" />
            <path d="M5.84 14.09c-.22-.66-.35-1.36-.35-2.09s.13-1.43.35-2.09V7.07H2.18C1.43 8.55 1 10.22 1 12s.43 3.45 1.18 4.93l2.85-2.22.81-.62z" fill="#FBBC05" />
            <path d="M12 5.38c1.62 0 3.06.56 4.21 1.64l3.15-3.15C17.45 2.09 14.97 1 12 1 7.7 1 3.99 3.47 2.18 7.07l3.66 2.84c.87-2.6 3.3-4.53 6.16-4.53z" fill="#EA4335" />
        </svg>
    );

    return (
        <main className="min-h-screen bg-slate-50 flex flex-col relative overflow-hidden">
            {/* Nav Back */}
            <div className="absolute top-6 left-6 z-20">
                <Link href="/" className="flex items-center gap-2 text-slate-500 hover:text-slate-800 transition-colors">
                    <ArrowLeft className="w-5 h-5" />
                    <span className="text-sm font-semibold">Volver</span>
                </Link>
            </div>

            <div className="flex-1 flex flex-col justify-center items-center p-6 z-10 w-full">
                <div className="w-full max-w-sm">
                    {/* Header */}
                    <div className="text-center mb-10">
                        <Logo />
                        <h1 className="text-2xl font-bold text-slate-800 mt-6">Accede a tu cuenta</h1>
                        <p className="text-sm text-slate-500 mt-2">
                            Ingresa tu correo o usa Google para entrar instantáneamente.
                        </p>
                    </div>

                    {/* Card */}
                    <div className="bg-white rounded-3xl p-8 border border-slate-100 shadow-xl shadow-slate-200/50 mb-6">

                        {status === 'success' ? (
                            <div className="text-center animate-in fade-in zoom-in duration-300">
                                <div className="w-16 h-16 bg-emerald-50 rounded-full flex items-center justify-center mx-auto mb-4">
                                    <CheckCircle2 className="w-8 h-8 text-emerald-500" />
                                </div>
                                <h3 className="text-lg font-bold text-slate-800 mb-2">¡Enlace enviado!</h3>
                                <p className="text-sm text-slate-500 mb-6">
                                    Revisa la bandeja de entrada de <b>{email}</b> y haz clic en el enlace para entrar.
                                </p>
                                <Button
                                    variant="outline"
                                    className="w-full font-semibold border-slate-200 text-slate-600 rounded-xl hover:bg-slate-50 transition-colors h-14"
                                    onClick={() => {
                                        setStatus('idle');
                                        setEmail('');
                                    }}
                                >
                                    Ingresar otro correo
                                </Button>
                            </div>
                        ) : (
                            <div className="space-y-6">
                                {status === 'error' && (
                                    <div className="flex items-start gap-3 p-3.5 bg-red-50 text-red-600 rounded-xl text-sm font-medium">
                                        <AlertCircle className="w-5 h-5 shrink-0 mt-0.5" />
                                        <p>{errorMsg}</p>
                                    </div>
                                )}

                                <form onSubmit={handlePasswordLogin} className="space-y-6">
                                    <div className="space-y-4">
                                        <div className="relative">
                                            <Mail className="absolute left-4 top-1/2 -translate-y-1/2 w-5 h-5 text-slate-400" />
                                            <Input
                                                id="email"
                                                type="email"
                                                value={email}
                                                onChange={(e) => setEmail(e.target.value)}
                                                placeholder="tu@correo.com"
                                                className="h-14 pl-12 bg-slate-50 border-slate-200 text-slate-800 rounded-2xl focus-visible:ring-blue-500 focus-visible:ring-offset-0 text-base shadow-sm"
                                                required
                                            />
                                        </div>
                                        <div className="relative">
                                            <Lock className="absolute left-4 top-1/2 -translate-y-1/2 w-5 h-5 text-slate-400" />
                                            <Input
                                                id="password"
                                                type="password"
                                                value={password}
                                                onChange={(e) => setPassword(e.target.value)}
                                                placeholder="Contraseña secreta"
                                                className="h-14 pl-12 bg-slate-50 border-slate-200 text-slate-800 rounded-2xl focus-visible:ring-blue-500 focus-visible:ring-offset-0 text-base shadow-sm"
                                                required
                                            />
                                        </div>
                                    </div>

                                    <Button
                                        type="submit"
                                        disabled={status === 'loading'}
                                        className="w-full h-14 bg-slate-800 hover:bg-slate-900 text-white rounded-2xl text-base font-bold shadow-lg shadow-slate-900/20 active:scale-[0.98] transition-all"
                                    >
                                        {status === 'loading' ? (
                                            <Loader2 className="w-5 h-5 animate-spin" />
                                        ) : (
                                            'Iniciar Sesión'
                                        )}
                                    </Button>
                                </form>

                                <div className="relative">
                                    <div className="absolute inset-0 flex items-center">
                                        <div className="w-full border-t border-slate-200"></div>
                                    </div>
                                    <div className="relative flex justify-center text-sm">
                                        <span className="px-4 bg-white text-slate-400 font-medium">O usa otras opciones</span>
                                    </div>
                                </div>

                                <div className="flex flex-col gap-3">
                                    <Button
                                        type="button"
                                        variant="outline"
                                        onClick={handleGoogleLogin}
                                        disabled={status === 'loading'}
                                        className="w-full h-14 bg-white border-slate-200 hover:bg-slate-50 text-slate-700 rounded-2xl text-base font-bold shadow-sm transition-all flex items-center justify-center"
                                    >
                                        {status === 'loading' ? <Loader2 className="w-5 h-5 animate-spin" /> : <><GoogleIcon /> Continuar con Google</>}
                                    </Button>

                                    <Button
                                        type="button"
                                        variant="outline"
                                        onClick={handleMagicLink}
                                        disabled={status === 'loading'}
                                        className="w-full h-14 bg-white border-slate-200 hover:bg-slate-50 text-slate-700 rounded-2xl text-base font-bold shadow-sm transition-all flex items-center justify-center"
                                    >
                                        {status === 'loading' ? <Loader2 className="w-5 h-5 animate-spin" /> : 'Enviar Link Mágico'}
                                    </Button>
                                </div>
                            </div>
                        )}
                    </div>

                    {/* Taller Registration Banner */}
                    <div className="text-center p-6 bg-blue-50/50 rounded-2xl border border-blue-100/50">
                        <h3 className="text-sm font-semibold text-slate-800 mb-1">¿Eres un taller mecánico?</h3>
                        <p className="text-xs text-slate-500 mb-3">
                            Únete a Flusize y gestiona tus clientes, órdenes y presupuestos de forma profesional.
                        </p>
                        <Link href="/registro-taller" className="text-sm font-bold text-blue-600 hover:text-blue-700 transition-colors inline-flex items-center gap-1">
                            Registra tu Taller <span>&rarr;</span>
                        </Link>
                    </div>

                </div>
            </div>

            <p className="text-center text-xs text-slate-400 pb-6">
                © {new Date().getFullYear()} Flusize.
            </p>
        </main>
    );
}

