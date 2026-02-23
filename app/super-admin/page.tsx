import { SupabaseClient } from '@supabase/supabase-js';
import { supabase } from '@/lib/supabase';
import { Store, Car, DollarSign } from 'lucide-react';

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

                {/* ── METRICS CARDS ── */}
                <div className="grid grid-cols-1 md:grid-cols-3 gap-6">
                    <div className="bg-white rounded-2xl p-6 shadow-sm border border-slate-100 flex items-start justify-between">
                        <div>
                            <p className="text-sm font-medium text-slate-500 mb-1">Total Talleres</p>
                            <h2 className="text-3xl font-bold text-slate-800">{metrics.talleres}</h2>
                        </div>
                        <div className="w-12 h-12 bg-blue-50 text-blue-600 rounded-xl flex items-center justify-center">
                            <Store className="w-6 h-6" />
                        </div>
                    </div>

                    <div className="bg-white rounded-2xl p-6 shadow-sm border border-slate-100 flex items-start justify-between">
                        <div>
                            <p className="text-sm font-medium text-slate-500 mb-1">Vehículos Registrados</p>
                            <h2 className="text-3xl font-bold text-slate-800">{metrics.vehiculos}</h2>
                        </div>
                        <div className="w-12 h-12 bg-emerald-50 text-emerald-600 rounded-xl flex items-center justify-center">
                            <Car className="w-6 h-6" />
                        </div>
                    </div>

                    <div className="bg-white rounded-2xl p-6 shadow-sm border border-slate-100 flex items-start justify-between">
                        <div>
                            <p className="text-sm font-medium text-slate-500 mb-1">MRR Estimado (CLP)</p>
                            <h2 className="text-3xl font-bold text-slate-800">${metrics.mrr.toLocaleString('es-CL')}</h2>
                        </div>
                        <div className="w-12 h-12 bg-cyan-50 text-cyan-600 rounded-xl flex items-center justify-center">
                            <DollarSign className="w-6 h-6" />
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
