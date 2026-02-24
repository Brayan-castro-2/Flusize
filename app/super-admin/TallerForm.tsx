'use client';

import { useState } from 'react';
import { useRouter } from 'next/navigation';
import { Store, Mail, Phone, Lock, Loader2, Rocket } from 'lucide-react';
import { sileo } from 'sileo';
import { crearTallerAction } from './actions';

export function TallerForm() {
    const [loading, setLoading] = useState(false);
    const router = useRouter();

    async function actionSubmit(formData: FormData) {
        setLoading(true);
        try {
            const res = await crearTallerAction(formData);
            if (res.error) {
                sileo.error(res.error, {
                    timeout: 5000,
                    position: 'top-center'
                });
            } else if (res.success) {
                sileo.success(res.message, {
                    timeout: 5000,
                    position: 'top-center'
                });

                // Clear the form
                const formElement = document.getElementById('taller-form') as HTMLFormElement;
                if (formElement) formElement.reset();

                // Refresh data
                router.refresh();
            }
        } catch (e: any) {
            sileo.error(e.message || 'Error al enviar el formulario');
        } finally {
            setLoading(false);
        }
    }

    return (
        <form id="taller-form" action={actionSubmit} className="space-y-5">
            <div>
                <label className="text-xs font-bold text-slate-500 uppercase tracking-widest mb-1 block">Nombre del Taller</label>
                <div className="relative">
                    <div className="absolute inset-y-0 left-0 pl-3 flex items-center pointer-events-none">
                        <Store className="h-5 w-5 text-slate-400" />
                    </div>
                    <input
                        type="text"
                        name="nombre"
                        required
                        className="w-full pl-10 pr-3 py-3 border border-slate-200 rounded-xl bg-slate-50 focus:bg-white focus:border-blue-500 focus:ring-1 focus:ring-blue-500 transition-colors text-slate-800 outline-none"
                        placeholder="Automotriz Express"
                    />
                </div>
            </div>

            <div className="grid grid-cols-1 md:grid-cols-2 gap-5">
                <div>
                    <label className="text-xs font-bold text-slate-500 uppercase tracking-widest mb-1 block">Email (Admin)</label>
                    <div className="relative">
                        <div className="absolute inset-y-0 left-0 pl-3 flex items-center pointer-events-none">
                            <Mail className="h-5 w-5 text-slate-400" />
                        </div>
                        <input
                            type="email"
                            name="email"
                            required
                            className="w-full pl-10 pr-3 py-3 border border-slate-200 rounded-xl bg-slate-50 focus:bg-white focus:border-blue-500 focus:ring-1 focus:ring-blue-500 transition-colors text-slate-800 outline-none"
                            placeholder="admin@taller.cl"
                        />
                    </div>
                </div>
                <div>
                    <label className="text-xs font-bold text-slate-500 uppercase tracking-widest mb-1 block">Teléfono Opcional</label>
                    <div className="relative">
                        <div className="absolute inset-y-0 left-0 pl-3 flex items-center pointer-events-none">
                            <Phone className="h-5 w-5 text-slate-400" />
                        </div>
                        <input
                            type="text"
                            name="telefono"
                            className="w-full pl-10 pr-3 py-3 border border-slate-200 rounded-xl bg-slate-50 focus:bg-white focus:border-blue-500 focus:ring-1 focus:ring-blue-500 transition-colors text-slate-800 outline-none"
                            placeholder="+56912345678"
                        />
                    </div>
                </div>
            </div>

            <div>
                <label className="text-xs font-bold text-slate-500 uppercase tracking-widest mb-1 block">Contraseña Temporal</label>
                <div className="relative">
                    <div className="absolute inset-y-0 left-0 pl-3 flex items-center pointer-events-none">
                        <Lock className="h-5 w-5 text-slate-400" />
                    </div>
                    <input
                        type="password"
                        name="password"
                        required
                        minLength={6}
                        className="w-full pl-10 pr-3 py-3 border border-slate-200 rounded-xl bg-slate-50 focus:bg-white focus:border-blue-500 focus:ring-1 focus:ring-blue-500 transition-colors text-slate-800 outline-none"
                        placeholder="Min. 6 caracteres"
                    />
                </div>
                <p className="text-xs text-slate-400 mt-2">
                    El administrador del taller podrá cambiar esta contraseña después de ingresar por primera vez.
                </p>
            </div>

            <button
                type="submit"
                disabled={loading}
                className="w-full mt-2 h-12 flex items-center justify-center rounded-xl bg-blue-600 text-white font-bold transition-all hover:bg-blue-700 disabled:opacity-50 disabled:cursor-not-allowed shadow-md shadow-blue-500/30"
            >
                {loading ? (
                    <Loader2 className="w-5 h-5 animate-spin mr-2" />
                ) : (
                    <Rocket className="w-5 h-5 mr-2" />
                )}
                Crear Taller y Asignar Plan Pro
            </button>
        </form>
    );
}
