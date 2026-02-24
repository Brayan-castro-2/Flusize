import { SupabaseClient } from '@supabase/supabase-js';
import { supabase } from '@/lib/supabase';
import { Store, Car, DollarSign, Rocket, Users } from 'lucide-react';
import { TallerForm } from './TallerForm';

export const revalidate = 0; // Force dynamic rendering for admin dashboard

async function getAdminMetrics() {
    // Total Talleres
    const { count: countTalleres } = await supabase
        .from('talleres')
        .select('*', { count: 'exact', head: true });

    // Total Vehículos
    const { count: countVehiculos } = await supabase
        .from('vehiculos')
        .select('*', { count: 'exact', head: true });

    // For MRR, we don't have a subscriptions table yet, so we mock it for now
    // based on the $20,000 assumed MRR per active workshop (example).
    const assumedMrr = (countTalleres || 0) * 20000;

    // Talleres para la tabla
    const { data: talleres } = await supabase
        .from('talleres')
        .select('id, nombre, direccion, telefono, activo, creado_en')
        .order('creado_en', { ascending: false });

    return {
        metrics: {
            talleres: countTalleres || 0,
            vehiculos: countVehiculos || 0,
            mrr: assumedMrr,
        },
        talleres: talleres || [],
    };
}

export default async function SuperAdminPage() {
    const { metrics, talleres } = await getAdminMetrics();

    return (
        <div className="mx-auto max-w-7xl p-6 bg-slate-50 min-h-screen">
            <div className="flex flex-col gap-6">

                {/* Header simple */}
                <div>
                    <h1 className="text-2xl font-bold text-slate-800 tracking-tight">Panel de Control</h1>
                    <p className="text-sm text-slate-500 mt-1">Visión general del ecosistema Flusize.</p>
                </div>

                {/* ── TOP SECTION: FORM & METRICS ── */}
                <div className="grid grid-cols-1 lg:grid-cols-3 gap-6">
                    {/* Generador Flash */}
                    <div className="lg:col-span-1 bg-white rounded-2xl shadow-sm border border-slate-100 overflow-hidden">
                        <div className="px-6 py-5 border-b border-slate-100 bg-gradient-to-r from-blue-50 to-white">
                            <div className="flex items-center gap-2 mb-1">
                                <Rocket className="h-5 w-5 text-blue-600" />
                                <h3 className="text-base font-bold text-slate-800">Generador Flash</h3>
                            </div>
                            <p className="text-xs text-slate-500">Crea un taller y asigna Plan Pro al instante.</p>
                        </div>
                        <div className="p-6">
                            <TallerForm />
                        </div>
                    </div>

                    {/* Metrics Grid */}
                    <div className="lg:col-span-2 grid grid-cols-1 sm:grid-cols-2 gap-6">
                        <div className="bg-white rounded-2xl p-6 shadow-sm border border-slate-100 flex flex-col justify-center relative overflow-hidden">
                            <div className="absolute -right-4 -top-4 w-24 h-24 bg-blue-50 rounded-full opacity-50 pointer-events-none" />
                            <div className="flex items-center gap-4 mb-4 relative z-10">
                                <div className="w-12 h-12 bg-blue-100 text-blue-600 rounded-xl flex items-center justify-center shrink-0">
                                    <Store className="w-6 h-6" />
                                </div>
                                <div>
                                    <p className="text-sm font-bold text-slate-500 uppercase tracking-widest">Total Talleres</p>
                                    <h2 className="text-4xl font-black text-slate-800 tracking-tight">{metrics.talleres}</h2>
                                </div>
                            </div>
                        </div>

                        <div className="bg-white rounded-2xl p-6 shadow-sm border border-slate-100 flex flex-col justify-center relative overflow-hidden">
                            <div className="absolute -right-4 -top-4 w-24 h-24 bg-emerald-50 rounded-full opacity-50 pointer-events-none" />
                            <div className="flex items-center gap-4 mb-4 relative z-10">
                                <div className="w-12 h-12 bg-emerald-100 text-emerald-600 rounded-xl flex items-center justify-center shrink-0">
                                    <Car className="w-6 h-6" />
                                </div>
                                <div>
                                    <p className="text-sm font-bold text-slate-500 uppercase tracking-widest">Vehículos Registrados</p>
                                    <h2 className="text-4xl font-black text-slate-800 tracking-tight">{metrics.vehiculos}</h2>
                                </div>
                            </div>
                        </div>

                        <div className="sm:col-span-2 bg-gradient-to-br from-slate-800 to-slate-900 rounded-2xl p-6 shadow-lg border border-slate-700 flex flex-col justify-center relative overflow-hidden text-white">
                            <div className="absolute -right-10 -bottom-10 w-40 h-40 bg-blue-500 rounded-full opacity-20 blur-2xl pointer-events-none" />
                            <div className="flex items-center gap-4 relative z-10">
                                <div className="w-14 h-14 bg-white/10 text-cyan-400 rounded-xl flex items-center justify-center shrink-0 border border-white/5 font-bold">
                                    CLP
                                </div>
                                <div>
                                    <p className="text-xs font-bold text-slate-400 uppercase tracking-widest flex items-center gap-1"><DollarSign className="w-3 h-3" /> MRR Estimado</p>
                                    <h2 className="text-4xl sm:text-5xl font-black text-transparent bg-clip-text bg-gradient-to-r from-white to-slate-300 tracking-tight mt-1">
                                        ${metrics.mrr.toLocaleString('es-CL')}
                                    </h2>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                {/* ── TENANTS TABLE ── */}
                <div className="bg-white rounded-2xl shadow-sm border border-slate-100 overflow-hidden">
                    <div className="px-6 py-5 border-b border-slate-100">
                        <h3 className="text-base font-bold text-slate-800">Gestión de Talleres</h3>
                    </div>
                    <div className="overflow-x-auto">
                        <table className="w-full text-sm text-left">
                            <thead className="bg-slate-50 text-slate-500 font-semibold border-b border-slate-100">
                                <tr>
                                    <th className="px-6 py-4 rounded-tl-xl font-medium uppercase text-xs tracking-wider">Taller</th>
                                    <th className="px-6 py-4 font-medium uppercase text-xs tracking-wider">Teléfono / Dir</th>
                                    <th className="px-6 py-4 font-medium uppercase text-xs tracking-wider">Registro</th>
                                    <th className="px-6 py-4 font-medium uppercase text-xs tracking-wider">Estado</th>
                                    <th className="px-6 py-4 rounded-tr-xl font-medium uppercase text-xs tracking-wider text-right">Acción</th>
                                </tr>
                            </thead>
                            <tbody className="divide-y divide-slate-100">
                                {talleres.map((taller) => (
                                    <tr key={taller.id} className="hover:bg-slate-50/50 transition-colors">
                                        <td className="px-6 py-4">
                                            <div className="font-bold text-slate-800">{taller.nombre}</div>
                                            <div className="text-xs text-slate-500 font-mono mt-0.5">{taller.id.slice(0, 8)}...</div>
                                        </td>
                                        <td className="px-6 py-4">
                                            <div className="text-slate-700">{taller.telefono || '—'}</div>
                                            <div className="text-xs text-slate-500 truncate max-w-[200px]">{taller.direccion || '—'}</div>
                                        </td>
                                        <td className="px-6 py-4 text-slate-600">
                                            {new Date(taller.creado_en).toLocaleDateString('es-CL')}
                                        </td>
                                        <td className="px-6 py-4">
                                            <span className={`inline-flex items-center px-2.5 py-1 rounded-full text-xs font-bold ${taller.activo
                                                ? 'bg-emerald-50 text-emerald-700 border border-emerald-200/50'
                                                : 'bg-slate-100 text-slate-600 border border-slate-200'
                                                }`}>
                                                {taller.activo ? 'Activo' : 'Inactivo'}
                                            </span>
                                        </td>
                                        <td className="px-6 py-4 text-right">
                                            <button className="text-blue-600 hover:text-blue-800 font-semibold text-sm transition-colors">
                                                Ver panel
                                            </button>
                                        </td>
                                    </tr>
                                ))}
                                {talleres.length === 0 && (
                                    <tr>
                                        <td colSpan={5} className="px-6 py-12 text-center text-slate-500">
                                            No hay talleres registrados en el sistema.
                                        </td>
                                    </tr>
                                )}
                            </tbody>
                        </table>
                    </div>
                </div>

            </div>
        </div>
    );
}
