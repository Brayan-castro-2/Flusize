'use client';

import { useState, useEffect, useCallback } from 'react';
import { supabase } from '@/lib/supabase';

type Taller = {
    id: string;
    nombre: string;
    email: string | null;
    telefono: string | null;
    plan_suscripcion: string | null;
    activo: boolean | null;
    creado_en: string;
    slug: string | null;
    totalUsuarios: number;
    totalOrdenes: number;
};

const PLANES: Record<string, { label: string; color: string; emoji: string }> = {
    GRATIS: { label: 'Gratis', emoji: '🆓', color: 'bg-slate-800 text-slate-300 border-slate-700' },
    PRO: { label: 'Pro', emoji: '⚡', color: 'bg-blue-950 text-blue-300 border-blue-800' },
    PREMIUM: { label: 'Premium', emoji: '👑', color: 'bg-violet-950 text-violet-300 border-violet-800' },
};

async function getAuthToken(): Promise<string> {
    const { data } = await supabase.auth.getSession();
    return data.session?.access_token || '';
}

export default function GodModePage() {
    const [talleres, setTalleres] = useState<Taller[]>([]);
    const [isLoading, setIsLoading] = useState(true);
    const [searchQuery, setSearchQuery] = useState('');
    const [modalOpen, setModalOpen] = useState(false);
    const [editPlanTaller, setEditPlanTaller] = useState<Taller | null>(null);
    const [actionLoading, setActionLoading] = useState<string | null>(null);
    const [toast, setToast] = useState<{ msg: string; type: 'ok' | 'err' } | null>(null);

    const showToast = (msg: string, type: 'ok' | 'err' = 'ok') => {
        setToast({ msg, type });
        setTimeout(() => setToast(null), 3500);
    };

    const fetchTalleres = useCallback(async () => {
        setIsLoading(true);
        try {
            const token = await getAuthToken();
            const res = await fetch('/api/godmode/talleres', {
                headers: { Authorization: `Bearer ${token}` },
            });
            if (!res.ok) throw new Error((await res.json()).error);
            const data = await res.json();
            setTalleres(data.talleres);
        } catch (err: any) {
            showToast(err.message || 'Error cargando talleres', 'err');
        } finally {
            setIsLoading(false);
        }
    }, []);

    useEffect(() => { fetchTalleres(); }, [fetchTalleres]);

    const handleToggleActivo = async (taller: Taller) => {
        setActionLoading(taller.id + '_activo');
        try {
            const token = await getAuthToken();
            const res = await fetch('/api/godmode/talleres', {
                method: 'PATCH',
                headers: { 'Content-Type': 'application/json', Authorization: `Bearer ${token}` },
                body: JSON.stringify({ tallerId: taller.id, activo: !taller.activo }),
            });
            if (!res.ok) throw new Error((await res.json()).error);
            setTalleres(prev => prev.map(t => t.id === taller.id ? { ...t, activo: !t.activo } : t));
            showToast(`"${taller.nombre}" ${!taller.activo ? 'activado' : 'suspendido'}.`);
        } catch (err: any) {
            showToast(err.message, 'err');
        } finally {
            setActionLoading(null);
        }
    };

    const handleEditPlan = async (taller: Taller, newPlan: string) => {
        setActionLoading(taller.id + '_plan');
        try {
            const token = await getAuthToken();
            const res = await fetch('/api/godmode/talleres', {
                method: 'PATCH',
                headers: { 'Content-Type': 'application/json', Authorization: `Bearer ${token}` },
                body: JSON.stringify({ tallerId: taller.id, plan_suscripcion: newPlan }),
            });
            if (!res.ok) throw new Error((await res.json()).error);
            setTalleres(prev => prev.map(t => t.id === taller.id ? { ...t, plan_suscripcion: newPlan } : t));
            setEditPlanTaller(null);
            showToast(`Plan de "${taller.nombre}" cambiado a ${newPlan}.`);
        } catch (err: any) {
            showToast(err.message, 'err');
        } finally {
            setActionLoading(null);
        }
    };

    const filteredTalleres = talleres.filter(t =>
        t.nombre.toLowerCase().includes(searchQuery.toLowerCase()) ||
        (t.email || '').toLowerCase().includes(searchQuery.toLowerCase())
    );

    const stats = {
        total: talleres.length,
        activos: talleres.filter(t => t.activo).length,
        pro: talleres.filter(t => t.plan_suscripcion === 'PRO').length,
        premium: talleres.filter(t => t.plan_suscripcion === 'PREMIUM').length,
    };

    const formatDate = (iso: string) =>
        new Date(iso).toLocaleDateString('es-CL', { day: '2-digit', month: 'short', year: 'numeric' });

    return (
        <>
            {/* Toast */}
            {toast && (
                <div className={`fixed top-6 right-6 z-[100] px-5 py-3 rounded-xl text-sm font-medium shadow-2xl border transition-all animate-in slide-in-from-right-4 ${toast.type === 'ok' ? 'bg-emerald-950 text-emerald-300 border-emerald-700' : 'bg-red-950 text-red-300 border-red-700'
                    }`}>
                    {toast.type === 'ok' ? '✓ ' : '✗ '}{toast.msg}
                </div>
            )}

            <div className="space-y-8">
                {/* Page Header */}
                <div className="flex flex-col sm:flex-row sm:items-end justify-between gap-4">
                    <div>
                        <p className="text-violet-400 text-sm font-semibold uppercase tracking-widest mb-1">Control Global</p>
                        <h2 className="text-4xl font-black text-white tracking-tight">Panel de Talleres</h2>
                        <p className="text-slate-500 mt-1 text-sm">Gestión completa de todos los tenants de Flusize</p>
                    </div>
                    <button
                        onClick={() => setModalOpen(true)}
                        className="flex items-center gap-2 px-5 py-2.5 bg-gradient-to-r from-violet-600 to-purple-700 hover:from-violet-500 hover:to-purple-600 text-white font-bold rounded-xl shadow-lg shadow-violet-500/30 transition-all hover:scale-[1.02] active:scale-[0.98] whitespace-nowrap text-sm"
                    >
                        <span className="text-xl leading-none">+</span> Registrar Taller
                    </button>
                </div>

                {/* Stats */}
                <div className="grid grid-cols-2 lg:grid-cols-4 gap-4">
                    {[
                        { label: 'Total Talleres', value: stats.total, color: 'text-white', sub: 'en la plataforma' },
                        { label: 'Activos', value: stats.activos, color: 'text-emerald-400', sub: `${stats.total ? Math.round((stats.activos / stats.total) * 100) : 0}% del total` },
                        { label: 'Plan Pro', value: stats.pro, color: 'text-blue-400', sub: 'subscripciones activas' },
                        { label: 'Plan Premium', value: stats.premium, color: 'text-violet-400', sub: 'subscripciones activas' },
                    ].map(s => (
                        <div key={s.label} className="bg-[#0D1528] border border-slate-800 rounded-2xl p-5">
                            <p className="text-slate-500 text-xs font-medium uppercase tracking-wider mb-2">{s.label}</p>
                            <p className={`text-4xl font-black ${s.color}`}>{s.value}</p>
                            <p className="text-slate-600 text-xs mt-1">{s.sub}</p>
                        </div>
                    ))}
                </div>

                {/* Tabla Principal */}
                <div className="bg-[#0D1528] border border-slate-800 rounded-2xl overflow-hidden shadow-2xl">
                    <div className="px-6 py-4 border-b border-slate-800 flex items-center justify-between gap-4">
                        <h3 className="text-white font-bold">Tenants Registrados</h3>
                        <div className="flex items-center gap-3">
                            <button
                                onClick={fetchTalleres}
                                disabled={isLoading}
                                className="text-slate-500 hover:text-slate-300 transition-colors text-sm disabled:opacity-50"
                                title="Refrescar"
                            >
                                {isLoading ? '⟳' : '↺'}
                            </button>
                            <div className="relative">
                                <span className="absolute left-3 top-1/2 -translate-y-1/2 text-slate-500 text-xs">🔍</span>
                                <input
                                    type="text"
                                    placeholder="Buscar por nombre o email..."
                                    value={searchQuery}
                                    onChange={e => setSearchQuery(e.target.value)}
                                    className="bg-slate-900/80 border border-slate-700 rounded-lg pl-8 pr-4 py-2 text-xs text-slate-200 placeholder-slate-600 focus:outline-none focus:border-violet-500 focus:ring-1 focus:ring-violet-500/30 w-60 transition-colors"
                                />
                            </div>
                        </div>
                    </div>

                    <div className="overflow-x-auto">
                        <table className="w-full">
                            <thead>
                                <tr className="border-b border-slate-800/60">
                                    {['Nombre del Taller', 'Email de Contacto', 'Usuarios / Órdenes', 'Plan Actual', 'Estado', 'Fecha Registro', 'Acciones'].map(h => (
                                        <th key={h} className="text-left px-5 py-3 text-xs font-semibold text-slate-500 uppercase tracking-wider whitespace-nowrap">
                                            {h}
                                        </th>
                                    ))}
                                </tr>
                            </thead>
                            <tbody className="divide-y divide-slate-800/40">
                                {isLoading ? (
                                    Array.from({ length: 3 }).map((_, i) => (
                                        <tr key={i}>
                                            {Array.from({ length: 7 }).map((_, j) => (
                                                <td key={j} className="px-5 py-4">
                                                    <div className="h-4 bg-slate-800 rounded animate-pulse" style={{ width: `${50 + (j * 7) % 40}%` }} />
                                                </td>
                                            ))}
                                        </tr>
                                    ))
                                ) : filteredTalleres.length === 0 ? (
                                    <tr>
                                        <td colSpan={7} className="px-6 py-20 text-center">
                                            <div className="text-5xl mb-3">🏭</div>
                                            <p className="text-slate-500 text-sm">
                                                {searchQuery ? 'No se encontraron resultados' : 'No hay talleres registrados'}
                                            </p>
                                        </td>
                                    </tr>
                                ) : (
                                    filteredTalleres.map(taller => {
                                        const plan = PLANES[taller.plan_suscripcion || 'GRATIS'] || PLANES.GRATIS;
                                        return (
                                            <tr key={taller.id} className="hover:bg-white/[0.02] transition-colors">
                                                {/* Nombre */}
                                                <td className="px-5 py-4">
                                                    <div className="flex items-center gap-3">
                                                        <div className="w-8 h-8 bg-gradient-to-br from-slate-700 to-slate-800 rounded-lg flex items-center justify-center text-base flex-shrink-0">
                                                            🔧
                                                        </div>
                                                        <div>
                                                            <p className="text-white font-semibold text-sm">{taller.nombre}</p>
                                                            {taller.slug && <p className="text-slate-600 text-xs font-mono">/{taller.slug}</p>}
                                                        </div>
                                                    </div>
                                                </td>
                                                {/* Email */}
                                                <td className="px-5 py-4">
                                                    <p className="text-slate-300 text-sm">{taller.email || '—'}</p>
                                                    {taller.telefono && <p className="text-slate-600 text-xs">{taller.telefono}</p>}
                                                </td>
                                                {/* Stats */}
                                                <td className="px-5 py-4">
                                                    <div className="flex items-center gap-3 text-xs">
                                                        <span className="text-slate-400"><span className="font-bold text-white">{taller.totalUsuarios}</span> usuarios</span>
                                                        <span className="text-slate-700">·</span>
                                                        <span className="text-slate-400"><span className="font-bold text-white">{taller.totalOrdenes}</span> órdenes</span>
                                                    </div>
                                                </td>
                                                {/* Plan */}
                                                <td className="px-5 py-4">
                                                    <span className={`inline-flex items-center gap-1 text-xs font-semibold px-2.5 py-1 rounded-full border ${plan.color}`}>
                                                        {plan.emoji} {plan.label}
                                                    </span>
                                                </td>
                                                {/* Estado */}
                                                <td className="px-5 py-4">
                                                    <div className="flex items-center gap-2">
                                                        <div className={`w-2 h-2 rounded-full flex-shrink-0 ${taller.activo ? 'bg-emerald-400 shadow-sm shadow-emerald-400/60' : 'bg-red-500'}`} />
                                                        <span className={`text-xs font-semibold ${taller.activo ? 'text-emerald-400' : 'text-red-400'}`}>
                                                            {taller.activo ? 'Activo' : 'Suspendido'}
                                                        </span>
                                                    </div>
                                                </td>
                                                {/* Fecha */}
                                                <td className="px-5 py-4">
                                                    <p className="text-slate-500 text-xs">{formatDate(taller.creado_en)}</p>
                                                </td>
                                                {/* Acciones */}
                                                <td className="px-5 py-4">
                                                    <div className="flex items-center gap-2">
                                                        {/* Botón editar plan */}
                                                        <div className="relative">
                                                            <button
                                                                onClick={() => setEditPlanTaller(editPlanTaller?.id === taller.id ? null : taller)}
                                                                className="text-xs px-3 py-1.5 bg-slate-800 hover:bg-slate-700 text-slate-300 rounded-lg border border-slate-700 transition-all"
                                                            >
                                                                Editar Plan
                                                            </button>
                                                            {editPlanTaller?.id === taller.id && (
                                                                <div className="absolute right-0 mt-1 bg-[#0D1528] border border-slate-700 rounded-xl shadow-2xl z-20 overflow-hidden min-w-[140px]">
                                                                    {Object.entries(PLANES).map(([key, p]) => (
                                                                        <button
                                                                            key={key}
                                                                            onClick={() => handleEditPlan(taller, key)}
                                                                            disabled={actionLoading === taller.id + '_plan'}
                                                                            className={`w-full text-left px-4 py-2.5 text-xs hover:bg-slate-800 transition-colors flex items-center gap-2 ${taller.plan_suscripcion === key ? 'text-violet-400 font-bold' : 'text-slate-300'}`}
                                                                        >
                                                                            {p.emoji} {p.label}
                                                                            {taller.plan_suscripcion === key && ' ✓'}
                                                                        </button>
                                                                    ))}
                                                                </div>
                                                            )}
                                                        </div>

                                                        {/* Toggle activo/suspendido */}
                                                        <button
                                                            onClick={() => handleToggleActivo(taller)}
                                                            disabled={actionLoading === taller.id + '_activo'}
                                                            className={`text-xs px-3 py-1.5 rounded-lg border transition-all disabled:opacity-50 ${taller.activo
                                                                ? 'bg-red-950/50 hover:bg-red-900/70 text-red-400 border-red-900'
                                                                : 'bg-emerald-950/50 hover:bg-emerald-900/70 text-emerald-400 border-emerald-900'
                                                                }`}
                                                        >
                                                            {actionLoading === taller.id + '_activo' ? '...' : taller.activo ? 'Suspender' : 'Activar'}
                                                        </button>
                                                    </div>
                                                </td>
                                            </tr>
                                        );
                                    })
                                )}
                            </tbody>
                        </table>
                    </div>

                    {!isLoading && (
                        <div className="px-6 py-3 border-t border-slate-800/40 flex items-center justify-between">
                            <p className="text-slate-600 text-xs">{filteredTalleres.length} de {talleres.length} talleres</p>
                            <p className="text-slate-700 text-xs font-mono">Datos via SERVICE_ROLE_KEY · RLS Bypass ✓</p>
                        </div>
                    )}
                </div>
            </div>

            {/* Modal Nuevo Taller */}
            {modalOpen && (
                <div className="fixed inset-0 bg-black/80 backdrop-blur-sm z-50 flex items-center justify-center p-4"
                    onClick={e => { if (e.target === e.currentTarget) setModalOpen(false); }}
                >
                    <div className="bg-[#0D1528] border border-slate-700 rounded-2xl w-full max-w-md shadow-2xl shadow-violet-900/20">
                        <div className="flex items-center justify-between p-6 border-b border-slate-800">
                            <div>
                                <h2 className="text-white font-bold text-lg">Registrar Nuevo Taller</h2>
                                <p className="text-slate-500 text-xs mt-0.5">Crea un nuevo tenant en la plataforma Flusize</p>
                            </div>
                            <button onClick={() => setModalOpen(false)} className="text-slate-500 hover:text-slate-300 text-2xl leading-none transition-colors">×</button>
                        </div>
                        <NewTallerForm
                            onSuccess={(nombre) => { setModalOpen(false); fetchTalleres(); showToast(`Taller "${nombre}" creado correctamente.`); }}
                            onError={(msg) => showToast(msg, 'err')}
                        />
                    </div>
                </div>
            )}
        </>
    );
}

function NewTallerForm({ onSuccess, onError }: { onSuccess: (nombre: string) => void; onError: (msg: string) => void }) {
    const [nombre, setNombre] = useState('');
    const [email, setEmail] = useState('');
    const [telefono, setTelefono] = useState('');
    const [plan, setPlan] = useState('GRATIS');
    const [isSaving, setIsSaving] = useState(false);

    const handleSubmit = async (e: React.FormEvent) => {
        e.preventDefault();
        if (!nombre.trim()) { onError('El nombre es obligatorio.'); return; }
        setIsSaving(true);
        try {
            const token = await getAuthToken();
            const res = await fetch('/api/godmode/talleres', {
                method: 'POST',
                headers: { 'Content-Type': 'application/json', Authorization: `Bearer ${token}` },
                body: JSON.stringify({ nombre, email, telefono, plan_suscripcion: plan }),
            });
            if (!res.ok) throw new Error((await res.json()).error);
            onSuccess(nombre);
        } catch (err: any) {
            onError(err.message || 'Error al crear el taller.');
        } finally {
            setIsSaving(false);
        }
    };

    return (
        <form onSubmit={handleSubmit} className="p-6 space-y-4">
            {[
                { label: 'Nombre del Taller *', value: nombre, set: setNombre, type: 'text', placeholder: 'Ej: Taller González', required: true },
                { label: 'Email de Contacto', value: email, set: setEmail, type: 'email', placeholder: 'contacto@taller.cl' },
                { label: 'Teléfono', value: telefono, set: setTelefono, type: 'tel', placeholder: '+56 9 1234 5678' },
            ].map(f => (
                <div key={f.label}>
                    <label className="block text-xs font-semibold text-slate-400 uppercase tracking-wider mb-1.5">{f.label}</label>
                    <input type={f.type} required={f.required} value={f.value} onChange={e => f.set(e.target.value)} placeholder={f.placeholder}
                        className="w-full bg-slate-900 border border-slate-700 rounded-lg px-4 py-2.5 text-sm text-white placeholder-slate-600 focus:outline-none focus:border-violet-500 focus:ring-1 focus:ring-violet-500/30 transition-colors" />
                </div>
            ))}
            <div>
                <label className="block text-xs font-semibold text-slate-400 uppercase tracking-wider mb-1.5">Plan de Suscripción</label>
                <select value={plan} onChange={e => setPlan(e.target.value)}
                    className="w-full bg-slate-900 border border-slate-700 rounded-lg px-4 py-2.5 text-sm text-white focus:outline-none focus:border-violet-500 focus:ring-1 focus:ring-violet-500/30 transition-colors">
                    <option value="GRATIS">🆓 Gratis</option>
                    <option value="PRO">⚡ Pro</option>
                    <option value="PREMIUM">👑 Premium</option>
                </select>
            </div>
            <div className="flex gap-3 pt-2">
                <button type="submit" disabled={isSaving}
                    className="flex-1 py-2.5 bg-gradient-to-r from-violet-600 to-purple-700 hover:from-violet-500 hover:to-purple-600 text-white font-bold rounded-xl transition-all disabled:opacity-60 text-sm">
                    {isSaving ? 'Creando...' : 'Crear Taller'}
                </button>
                <button type="button" onClick={() => { }}
                    className="px-4 py-2.5 bg-slate-800 hover:bg-slate-700 text-slate-300 rounded-xl border border-slate-700 transition-colors text-sm">
                    Cancelar
                </button>
            </div>
        </form>
    );
}

