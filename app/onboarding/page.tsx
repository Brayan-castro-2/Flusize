'use client';

import { useState, useEffect } from 'react';
import { useRouter } from 'next/navigation';
import { Search, Phone, Hash, Loader2, Info } from 'lucide-react';
import { Button } from '@/components/ui/button';
import { Input } from '@/components/ui/input';
import { sileo } from 'sileo';
import { supabase } from '@/lib/supabase';
import { useAuth } from '@/contexts/auth-context';

export default function OnboardingPage() {
    const router = useRouter();
    const { user } = useAuth();

    const [phone, setPhone] = useState('');
    const [patente, setPatente] = useState('');
    const [loading, setLoading] = useState(false);
    const [claimId, setClaimId] = useState<string | null>(null);

    useEffect(() => {
        // Redirigir a login si no está autenticado
        if (user === null) {
            router.replace('/login');
        }

        // Recuperar claim_id del context si existe (guardado en login)
        const storedClaim = localStorage.getItem('claim_id');
        if (storedClaim) {
            setClaimId(storedClaim);
        }
    }, [user, router]);

    const handleSearch = async (e: React.FormEvent) => {
        e.preventDefault();

        if (!phone) {
            sileo.error({
                title: 'Campo requerido',
                description: 'Por favor, ingresa tu número de teléfono.',
                position: 'top-center'
            });
            return;
        }

        setLoading(true);

        try {
            // Llamar al RPC de supabase para buscar y fusionar cuenta
            // Usando el RPC "fuse_account_by_phone" que definimos en Supabase
            const { error, data } = await supabase.rpc('fuse_account_by_phone', {
                user_phone: phone,
                claim_id_param: claimId
            });

            if (error) {
                throw error;
            }

            // Si hay éxito, limpiar localStorage y redirigir
            localStorage.removeItem('claim_id');
            sileo.success({
                title: '¡Historial encontrado!',
                description: 'Tus registros se han vinculado exitosamente.',
                position: 'top-center',
                duration: 2000
            });

            // Optimistic Redirect: Rápido y sin esperas innecesarias
            setLoading(true); // Keep loading state visually active
            setTimeout(() => {
                router.replace('/mi-garage');
            }, 300);

        } catch (error: any) {
            console.error('Error al fusionar cuenta:', error);
            sileo.error({
                title: 'No pudimos vincular tus datos',
                description: error.message || 'Verifica que el teléfono coincida con el registrado en el taller.',
                position: 'top-center'
            });
            setLoading(false); // Only turn off loading if error
        }
    };

    if (user === null) return null;

    return (
        <div className="min-h-screen bg-slate-50 flex flex-col pt-12 p-6 font-sans relative overflow-hidden">
            {/* Background Decorations */}
            <div className="absolute top-0 right-0 w-[500px] h-[500px] bg-gradient-to-bl from-blue-100/50 to-transparent rounded-full blur-3xl -z-10 -mr-40 -mt-20"></div>
            <div className="absolute bottom-0 left-0 w-[400px] h-[400px] bg-gradient-to-tr from-cyan-100/40 to-transparent rounded-full blur-3xl -z-10 -ml-20 -mb-20"></div>

            <main className="flex-1 w-full max-w-md mx-auto relative z-10 flex flex-col justify-center pb-20">
                {/* Header Section */}
                <div className="mb-10 text-center">
                    <div className="w-16 h-16 bg-gradient-to-tr from-blue-600 to-cyan-400 rounded-3xl mx-auto flex items-center justify-center shadow-lg shadow-blue-500/20 mb-6 rotate-3">
                        <Search className="w-8 h-8 text-white -rotate-3" />
                    </div>

                    <h1 className="text-3xl font-black text-slate-800 tracking-tight leading-tight mb-3">
                        Encontremos tu<br />
                        <span className="text-transparent bg-clip-text bg-gradient-to-r from-blue-600 to-cyan-500">
                            historial automotriz
                        </span>
                    </h1>

                    <p className="text-[15px] font-medium text-slate-500 leading-relaxed max-w-[280px] mx-auto">
                        Ingresa el teléfono que le diste al taller para vincular tus vehículos y reparaciones anteriores a esta cuenta.
                    </p>
                </div>

                {claimId && (
                    <div className="mb-6 p-4 bg-blue-50/80 backdrop-blur-sm border border-blue-100 rounded-2xl flex items-start gap-3">
                        <Info className="w-5 h-5 text-blue-500 shrink-0 mt-0.5" />
                        <div>
                            <p className="text-sm font-bold text-blue-800 tracking-tight">Orden detectada</p>
                            <p className="text-xs text-blue-600/80 mt-0.5 leading-relaxed">
                                Hemos detectado que vienes de un enlace de seguimiento. Solo necesitamos confirmar tu identidad.
                            </p>
                        </div>
                    </div>
                )}

                {/* Main Form Box */}
                <form onSubmit={handleSearch} className="bg-white/80 backdrop-blur-md border border-slate-100 rounded-[2rem] p-6 shadow-xl shadow-slate-200/40">
                    <div className="space-y-5">
                        <div className="space-y-1.5">
                            <label className="text-xs font-bold uppercase tracking-widest text-slate-400 ml-1">
                                Número de Teléfono
                            </label>
                            <div className="relative">
                                <div className="absolute inset-y-0 left-0 pl-4 flex items-center pointer-events-none">
                                    <Phone className="h-5 w-5 text-slate-400" />
                                </div>
                                <Input
                                    type="tel"
                                    placeholder="+56 9 1234 5678"
                                    value={phone}
                                    onChange={(e) => setPhone(e.target.value)}
                                    className="pl-12 h-14 bg-slate-50 border-slate-200 text-slate-800 text-base font-medium rounded-2xl focus:bg-white focus:ring-2 focus:ring-blue-500/20 focus:border-blue-500 transition-all shadow-sm placeholder:text-slate-300"
                                    required
                                />
                            </div>
                        </div>

                        <div className="space-y-1.5">
                            <label className="text-xs font-bold uppercase tracking-widest text-slate-400 ml-1 flex items-center justify-between">
                                <span>Patente <span className="text-[10px] text-slate-300 font-medium normal-case">(Opcional)</span></span>
                            </label>
                            <div className="relative">
                                <div className="absolute inset-y-0 left-0 pl-4 flex items-center pointer-events-none">
                                    <Hash className="h-5 w-5 text-slate-400" />
                                </div>
                                <Input
                                    type="text"
                                    placeholder="ABCD12"
                                    value={patente}
                                    onChange={(e) => setPatente(e.target.value)}
                                    className="pl-12 h-14 bg-slate-50 border-slate-200 text-slate-800 text-base font-medium uppercase rounded-2xl focus:bg-white focus:ring-2 focus:ring-blue-500/20 focus:border-blue-500 transition-all shadow-sm placeholder:text-slate-300 placeholder:normal-case"
                                />
                            </div>
                        </div>
                    </div>

                    <div className="mt-8">
                        <Button
                            type="submit"
                            disabled={loading || !phone}
                            className="w-full h-14 bg-blue-600 hover:bg-blue-700 text-white rounded-2xl text-[15px] font-bold shadow-lg shadow-blue-600/20 transition-all hover:scale-[1.02] active:scale-[0.98] focus:ring-4 focus:ring-blue-500/20 disabled:opacity-50 disabled:hover:scale-100"
                        >
                            {loading ? (
                                <><Loader2 className="w-5 h-5 mr-2 animate-spin" /> Buscando...</>
                            ) : (
                                'Buscar mis datos'
                            )}
                        </Button>
                    </div>

                    <div className="mt-6 text-center">
                        <button
                            type="button"
                            onClick={() => router.replace('/mi-garage')}
                            className="text-sm font-bold text-slate-400 hover:text-slate-600 transition-colors"
                        >
                            Saltar por ahora y entrar a mi garage
                        </button>
                    </div>
                </form>
            </main>
        </div>
    );
}
