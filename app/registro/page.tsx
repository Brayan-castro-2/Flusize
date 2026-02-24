'use client';

import { useState, useEffect, Suspense } from 'react';
import { createBrowserClient } from '@supabase/ssr';
import { ArrowLeft, Mail, User, Lock, Loader2, CheckCircle2, AlertCircle } from 'lucide-react';
import Link from 'next/link';
import { useRouter, useSearchParams } from 'next/navigation';
import { Button } from '@/components/ui/button';
import { Input } from '@/components/ui/input';

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

function RegistroForm() {
    const router = useRouter();
    const searchParams = useSearchParams();

    const [nombre, setNombre] = useState('');
    const [email, setEmail] = useState('');
    const [password, setPassword] = useState('');
    const [status, setStatus] = useState<'idle' | 'loading' | 'success' | 'error'>('idle');
    const [errorMsg, setErrorMsg] = useState('');

    useEffect(() => {
        const emailParam = searchParams.get('email');
        if (emailParam) {
            setEmail(emailParam);
        }
    }, [searchParams]);

    const handleRegistro = async (e: React.FormEvent) => {
        e.preventDefault();

        if (!email || !email.includes('@')) {
            setStatus('error');
            setErrorMsg('Por favor ingresa un correo válido.');
            return;
        }

        if (!password || password.length < 6) {
            setStatus('error');
            setErrorMsg('La contraseña debe tener al menos 6 caracteres.');
            return;
        }

        setStatus('loading');

        try {
            const supabaseBrowser = createBrowserClient(
                process.env.NEXT_PUBLIC_SUPABASE_URL!,
                process.env.NEXT_PUBLIC_SUPABASE_ANON_KEY!
            );

            // 1. Crear el auth user
            const { data, error } = await supabaseBrowser.auth.signUp({
                email,
                password,
                options: {
                    data: {
                        full_name: nombre,
                    }
                }
            });

            if (error) throw error;

            // 2. Ejecutar la vinculación del lado del servidor seguro
            if (data.user) {
                const res = await fetch('/api/public/activate-client', {
                    method: 'POST',
                    headers: { 'Content-Type': 'application/json' },
                    body: JSON.stringify({
                        userId: data.user.id,
                        email: email,
                        nombre: nombre
                    })
                });

                if (!res.ok) {
                    console.warn('Advertencia vinculando el perfil global', await res.text());
                }
            }

            setStatus('success');

            // Redirigir al inicio o a Mi Garage
            setTimeout(() => {
                router.push('/login');
            }, 3000);

        } catch (error: any) {
            console.error('Registration error:', error);
            setStatus('error');
            setErrorMsg(error.message || 'Ocurrió un error creando la cuenta.');
        }
    };

    return (
        <div className="bg-white rounded-3xl p-8 border border-slate-100 shadow-xl shadow-slate-200/50 mb-6">
            {status === 'success' ? (
                <div className="text-center animate-in fade-in zoom-in duration-300">
                    <div className="w-16 h-16 bg-emerald-50 rounded-full flex items-center justify-center mx-auto mb-4">
                        <CheckCircle2 className="w-8 h-8 text-emerald-500" />
                    </div>
                    <h3 className="text-lg font-bold text-slate-800 mb-2">¡Cuenta creada!</h3>
                    <p className="text-sm text-slate-500 mb-6">
                        Hemos creado tu cuenta exitosamente. Serás redirigido para iniciar sesión.
                    </p>
                    <Button
                        variant="outline"
                        className="w-full font-semibold border-slate-200 text-slate-600 rounded-xl hover:bg-slate-50 transition-colors h-14"
                        onClick={() => router.push('/login')}
                    >
                        Ir a Iniciar Sesión
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

                    <form onSubmit={handleRegistro} className="space-y-6">
                        <div className="space-y-4">
                            <div className="relative">
                                <User className="absolute left-4 top-1/2 -translate-y-1/2 w-5 h-5 text-slate-400" />
                                <Input
                                    id="nombre"
                                    type="text"
                                    value={nombre}
                                    onChange={(e) => setNombre(e.target.value)}
                                    placeholder="Tu Nombre"
                                    className="h-14 pl-12 bg-slate-50 border-slate-200 text-slate-800 rounded-2xl focus-visible:ring-blue-500 focus-visible:ring-offset-0 text-base shadow-sm"
                                    required
                                />
                            </div>
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
                                    placeholder="Crea una contraseña segura"
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
                                'Crear Cuenta'
                            )}
                        </Button>
                    </form>
                </div>
            )}
        </div>
    );
}

export default function RegistroPage() {
    return (
        <main className="min-h-screen bg-slate-50 flex flex-col relative overflow-hidden">
            {/* Nav Back */}
            <div className="absolute top-6 left-6 z-20">
                <Link href="/login" className="flex items-center gap-2 text-slate-500 hover:text-slate-800 transition-colors">
                    <ArrowLeft className="w-5 h-5" />
                    <span className="text-sm font-semibold">Volver al login</span>
                </Link>
            </div>

            <div className="flex-1 flex flex-col justify-center items-center p-6 z-10 w-full">
                <div className="w-full max-w-sm">
                    {/* Header */}
                    <div className="text-center mb-10">
                        <Logo />
                        <h1 className="text-2xl font-bold text-slate-800 mt-6">Activa tu cuenta</h1>
                        <p className="text-sm text-slate-500 mt-2">
                            Crea una contraseña para acceder a todo el historial de tu vehículo.
                        </p>
                    </div>

                    <Suspense fallback={
                        <div className="bg-white rounded-3xl p-8 border border-slate-100 shadow-xl shadow-slate-200/50 mb-6 flex justify-center py-20">
                            <Loader2 className="w-8 h-8 animate-spin text-slate-400" />
                        </div>
                    }>
                        <RegistroForm />
                    </Suspense>

                </div>
            </div>

            {/* Decorative Orbs */}
            <div className="absolute -top-40 -right-40 w-96 h-96 bg-blue-100 rounded-full mix-blend-multiply filter blur-3xl opacity-50 animate-blob"></div>
            <div className="absolute -bottom-40 -left-40 w-96 h-96 bg-cyan-100 rounded-full mix-blend-multiply filter blur-3xl opacity-50 animate-blob animation-delay-2000"></div>
        </main>
    );
}
