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
    const [successData, setSuccessData] = useState<{ nombre: string; slug: string; serviciosInsertados: number } | null>(null);

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

            {/* Asistente Registro Pro */}
            {modalOpen && (
                <div className="fixed inset-0 bg-black/80 backdrop-blur-sm z-50 flex items-center justify-center p-4"
                    onClick={e => { if (e.target === e.currentTarget) setModalOpen(false); }}
                >
                    <div className="bg-[#0D1528] border border-slate-700 rounded-2xl w-full max-w-xl shadow-2xl shadow-violet-900/20 overflow-hidden">
                        <AsistenteRegistroTaller
                            onClose={() => setModalOpen(false)}
                            onError={(msg) => showToast(msg, 'err')}
                            onSuccess={(data) => {
                                setModalOpen(false);
                                setSuccessData(data);
                                fetchTalleres();
                            }}
                        />
                    </div>
                </div>
            )}

            {/* Modal de Éxito */}
            {successData && (
                <div className="fixed inset-0 bg-black/90 backdrop-blur-md z-50 flex items-center justify-center p-4">
                    <div className="bg-[#0D1528] border border-emerald-700/50 rounded-2xl w-full max-w-sm shadow-2xl shadow-emerald-900/30 p-8 text-center">
                        <div className="w-16 h-16 bg-emerald-500/20 rounded-full flex items-center justify-center mx-auto mb-4">
                            <span className="text-3xl">✓</span>
                        </div>
                        <h2 className="text-white font-black text-xl mb-1">¡Taller Registrado!</h2>
                        <p className="text-emerald-400 font-semibold">{successData.nombre}</p>
                        <p className="text-slate-500 text-sm mt-2">
                            {successData.serviciosInsertados > 0
                                ? `${successData.serviciosInsertados} servicios base configurados automáticamente.`
                                : 'Taller listo para operar.'}
                        </p>

                        <div className="mt-6 space-y-3">
                            <button
                                onClick={() => {
                                    const url = `${window.location.origin}/admin/ordenes`;
                                    navigator.clipboard.writeText(url);
                                    showToast('Enlace copiado al portapapeles ✓');
                                }}
                                className="w-full py-2.5 bg-slate-800 hover:bg-slate-700 text-white font-semibold rounded-xl border border-slate-700 transition-all text-sm flex items-center justify-center gap-2"
                            >
                                <span>🔗</span> Copiar Enlace de Acceso
                            </button>
                            <a
                                href="/admin/ordenes"
                                className="w-full py-2.5 bg-gradient-to-r from-violet-600 to-purple-700 hover:from-violet-500 hover:to-purple-600 text-white font-bold rounded-xl transition-all text-sm flex items-center justify-center gap-2 shadow-lg shadow-violet-500/30"
                            >
                                <span>⚡</span> Ir al Panel del Taller
                            </a>
                            <button
                                onClick={() => setSuccessData(null)}
                                className="text-slate-600 hover:text-slate-400 text-xs transition-colors"
                            >
                                Volver al God Mode →
                            </button>
                        </div>
                    </div>
                </div>
            )}
        </>
    );
}

// ── Tipo de datos del formulario completo ─────────────────────────────────────
type FormData = {
    nombre: string; rut: string; dueno_nombre: string;
    direccion: string; ciudad: string; latitud: string; longitud: string;
    telefono: string; email: string; whatsapp: string;
    instagram: string; facebook: string;
    aplica_iva: boolean; porcentaje_iva: string;
    plan_suscripcion: string;
    servicios_base: string;
};

// ── Asistente de Registro Pro (4 pasos) ───────────────────────────────────────
function AsistenteRegistroTaller({
    onSuccess, onError, onClose
}: {
    onSuccess: (data: { nombre: string; slug: string; serviciosInsertados: number }) => void;
    onError: (msg: string) => void;
    onClose: () => void;
}) {
    const [step, setStep] = useState(1);
    const TOTAL_STEPS = 4;
    const [isSaving, setIsSaving] = useState(false);
    const [form, setForm] = useState<FormData>({
        nombre: '', rut: '', dueno_nombre: '',
        direccion: '', ciudad: '', latitud: '', longitud: '',
        telefono: '', email: '', whatsapp: '',
        instagram: '', facebook: '',
        aplica_iva: true, porcentaje_iva: '19',
        plan_suscripcion: 'GRATIS',
        servicios_base: '',
    });

    const set = (field: keyof FormData) =>
        (e: React.ChangeEvent<HTMLInputElement | HTMLTextAreaElement | HTMLSelectElement>) => {
            const value = e.target.type === 'checkbox'
                ? (e.target as HTMLInputElement).checked
                : e.target.value;
            setForm(prev => ({ ...prev, [field]: value }));
        };

    const handleSubmit = async () => {
        if (!form.nombre.trim()) { onError('El nombre es obligatorio.'); return; }
        setIsSaving(true);
        try {
            const token = await getAuthToken();
            const res = await fetch('/api/godmode/talleres', {
                method: 'POST',
                headers: { 'Content-Type': 'application/json', Authorization: `Bearer ${token}` },
                body: JSON.stringify(form),
            });
            if (!res.ok) throw new Error((await res.json()).error);
            const data = await res.json();
            onSuccess({ nombre: data.taller.nombre, slug: data.taller.slug, serviciosInsertados: data.serviciosInsertados });
        } catch (err: any) {
            onError(err.message || 'Error al registrar el taller.');
        } finally {
            setIsSaving(false);
        }
    };

    const STEPS = [
        { n: 1, label: 'Empresa', icon: '🏢' },
        { n: 2, label: 'Ubicación', icon: '📍' },
        { n: 3, label: 'Contacto', icon: '📞' },
        { n: 4, label: 'Config.', icon: '⚙️' },
    ];

    return (
        <div className="flex flex-col" style={{ maxHeight: '90vh' }}>
            {/* Header */}
            <div className="flex items-center justify-between px-6 pt-6 pb-4 border-b border-slate-800 flex-shrink-0">
                <div>
                    <h2 className="text-white font-black text-xl">Asistente de Registro</h2>
                    <p className="text-slate-500 text-xs mt-0.5">Configura el taller completo desde el primer día</p>
                </div>
                <button onClick={onClose} className="text-slate-500 hover:text-slate-300 text-2xl leading-none transition-colors">×</button>
            </div>

            {/* Steps */}
            <div className="px-6 py-3 border-b border-slate-800/60 flex items-center gap-2 flex-shrink-0">
                {STEPS.map((s, i) => (
                    <div key={s.n} className="flex items-center gap-2 flex-1">
                        <button onClick={() => setStep(s.n)}
                            className={`flex items-center gap-1.5 text-xs font-semibold px-3 py-1.5 rounded-lg transition-all flex-1 justify-center ${step === s.n ? 'bg-violet-600 text-white shadow-lg shadow-violet-500/30'
                                : step > s.n ? 'bg-emerald-900/50 text-emerald-400 border border-emerald-800'
                                    : 'bg-slate-800 text-slate-500 border border-slate-700'}`}>
                            <span>{step > s.n ? '✓' : s.icon}</span>
                            <span className="hidden sm:inline">{s.label}</span>
                        </button>
                        {i < STEPS.length - 1 && (
                            <div className={`h-px flex-shrink-0 w-4 ${step > s.n ? 'bg-emerald-700' : 'bg-slate-800'}`} />
                        )}
                    </div>
                ))}
            </div>

            {/* Form body */}
            <div className="flex-1 overflow-y-auto p-6 space-y-4">
                {/* PASO 1: Empresa */}
                {step === 1 && (
                    <div className="space-y-4">
                        <p className="text-violet-400 text-xs font-bold uppercase tracking-widest">🏢 Datos de la Empresa</p>
                        <FField label="Nombre del Taller *" value={form.nombre} onChange={set('nombre')} placeholder="Ej: Taller Mecánico González" required />
                        <div className="grid grid-cols-2 gap-4">
                            <FField label="RUT / NIT" value={form.rut} onChange={set('rut')} placeholder="76.123.456-7" />
                            <FField label="Nombre del Dueño" value={form.dueno_nombre} onChange={set('dueno_nombre')} placeholder="Ej: Carlos González" />
                        </div>
                        <div>
                            <label className="block text-xs font-semibold text-slate-400 uppercase tracking-wider mb-1.5">Plan</label>
                            <select value={form.plan_suscripcion} onChange={set('plan_suscripcion')}
                                className="w-full bg-slate-900 border border-slate-700 rounded-lg px-4 py-2.5 text-sm text-white focus:outline-none focus:border-violet-500">
                                <option value="GRATIS">🆓 Gratis</option>
                                <option value="PRO">⚡ Pro</option>
                                <option value="PREMIUM">👑 Premium</option>
                            </select>
                        </div>
                    </div>
                )}

                {/* PASO 2: Ubicación */}
                {step === 2 && (
                    <div className="space-y-4">
                        <p className="text-violet-400 text-xs font-bold uppercase tracking-widest">📍 Ubicación</p>
                        <FField label="Dirección Completa" value={form.direccion} onChange={set('direccion')} placeholder="Av. Libertador 1234, Local 2" />
                        <FField label="Ciudad" value={form.ciudad} onChange={set('ciudad')} placeholder="Santiago, Concepción, Temuco..." />
                        <div className="grid grid-cols-2 gap-4">
                            <FField label="Latitud" value={form.latitud} onChange={set('latitud')} placeholder="-33.4569" type="text" />
                            <FField label="Longitud" value={form.longitud} onChange={set('longitud')} placeholder="-70.6483" type="text" />
                        </div>
                        <div className="bg-slate-900/60 border border-slate-800 rounded-xl p-3 text-xs text-slate-500">
                            💡 Abre{' '}
                            <a href="https://maps.google.com" target="_blank" rel="noopener" className="text-violet-400 hover:underline">Google Maps</a>,
                            haz clic derecho en la dirección y copia las coordenadas.
                        </div>
                    </div>
                )}

                {/* PASO 3: Contacto + Redes */}
                {step === 3 && (
                    <div className="space-y-4">
                        <p className="text-violet-400 text-xs font-bold uppercase tracking-widest">📞 Contacto y Redes</p>
                        <div className="grid grid-cols-2 gap-4">
                            <FField label="Teléfono Citas" value={form.telefono} onChange={set('telefono')} placeholder="+56 9 1234 5678" type="tel" />
                            <FField label="WhatsApp (Intl)" value={form.whatsapp} onChange={set('whatsapp')} placeholder="+56912345678" type="tel" />
                        </div>
                        <FField label="Email Comercial" value={form.email} onChange={set('email')} placeholder="contacto@taller.cl" type="email" />
                        <div className="grid grid-cols-2 gap-4">
                            <FField label="Instagram (@user)" value={form.instagram} onChange={set('instagram')} placeholder="tallergonzalez" prefix="@" />
                            <FField label="Facebook URL" value={form.facebook} onChange={set('facebook')} placeholder="facebook.com/taller" />
                        </div>
                    </div>
                )}

                {/* PASO 4: Config fiscal + Servicios */}
                {step === 4 && (
                    <div className="space-y-5">
                        <p className="text-violet-400 text-xs font-bold uppercase tracking-widest">⚙️ Fiscal y Servicios</p>

                        {/* Toggle IVA */}
                        <div className="bg-slate-900/60 border border-slate-800 rounded-xl p-4 space-y-3">
                            <label className="flex items-center gap-3 cursor-pointer">
                                <button type="button"
                                    onClick={() => setForm(p => ({ ...p, aplica_iva: !p.aplica_iva }))}
                                    className={`relative w-11 h-6 rounded-full transition-colors flex-shrink-0 ${form.aplica_iva ? 'bg-violet-600' : 'bg-slate-700'}`}>
                                    <div className={`absolute top-1 left-1 w-4 h-4 bg-white rounded-full transition-transform shadow ${form.aplica_iva ? 'translate-x-5' : ''}`} />
                                </button>
                                <div>
                                    <p className="text-white text-sm font-medium">¿Aplica IVA?</p>
                                    <p className="text-slate-500 text-xs">Activa si emite boletas/facturas con IVA</p>
                                </div>
                            </label>
                            {form.aplica_iva && (
                                <div className="flex items-center gap-3 ml-14">
                                    <span className="text-slate-400 text-sm">Porcentaje:</span>
                                    <input type="number" min="1" max="30" value={form.porcentaje_iva} onChange={set('porcentaje_iva')}
                                        className="w-20 bg-slate-800 border border-slate-700 rounded-lg px-3 py-1.5 text-sm text-white text-center focus:outline-none focus:border-violet-500" />
                                    <span className="text-slate-400 text-sm">%</span>
                                </div>
                            )}
                        </div>

                        {/* Servicios */}
                        <div>
                            <label className="block text-xs font-semibold text-slate-400 uppercase tracking-wider mb-1.5">Servicios Base</label>
                            <textarea value={form.servicios_base} onChange={set('servicios_base')}
                                placeholder="Cambio de aceite, Mecánica general, Scanner diagnóstico, Frenos, Suspensión"
                                rows={4}
                                className="w-full bg-slate-900 border border-slate-700 rounded-xl px-4 py-3 text-sm text-white placeholder-slate-600 focus:outline-none focus:border-violet-500 focus:ring-1 focus:ring-violet-500/30 transition-colors resize-none" />
                            <p className="text-slate-600 text-xs mt-1">Separados por coma. Se crean automáticamente en el menú del taller.</p>
                        </div>

                        {/* Resumen */}
                        <div className="bg-violet-950/30 border border-violet-800/30 rounded-xl p-4">
                            <p className="text-violet-400 text-xs font-bold uppercase tracking-wider mb-2">Resumen</p>
                            <div className="grid grid-cols-2 gap-y-1 text-xs">
                                {[
                                    ['Taller', form.nombre || '—'],
                                    ['Ciudad', form.ciudad || '—'],
                                    ['Dueño', form.dueno_nombre || '—'],
                                    ['Plan', form.plan_suscripcion],
                                    ['IVA', form.aplica_iva ? `${form.porcentaje_iva}%` : 'No aplica'],
                                    ['Servicios', form.servicios_base ? `${form.servicios_base.split(',').filter(Boolean).length} items` : 'Ninguno'],
                                ].map(([k, v]) => (
                                    <><span key={k + 'k'} className="text-slate-500">{k}:</span><span key={k + 'v'} className="text-white font-medium">{v}</span></>
                                ))}
                            </div>
                        </div>
                    </div>
                )}
            </div>

            {/* Footer navegación */}
            <div className="px-6 py-4 border-t border-slate-800 flex items-center justify-between gap-3 flex-shrink-0">
                <button onClick={() => step > 1 ? setStep(s => s - 1) : onClose()}
                    className="px-4 py-2.5 bg-slate-800 hover:bg-slate-700 text-slate-300 rounded-xl border border-slate-700 text-sm transition-colors">
                    {step > 1 ? '← Anterior' : 'Cancelar'}
                </button>

                <div className="flex items-center gap-1.5">
                    {STEPS.map(s => (
                        <div key={s.n} className={`w-2 h-2 rounded-full transition-colors ${step >= s.n ? 'bg-violet-500' : 'bg-slate-700'}`} />
                    ))}
                </div>

                {step < TOTAL_STEPS ? (
                    <button onClick={() => setStep(s => s + 1)} disabled={step === 1 && !form.nombre.trim()}
                        className="px-5 py-2.5 bg-gradient-to-r from-violet-600 to-purple-700 hover:from-violet-500 hover:to-purple-600 text-white font-bold rounded-xl text-sm transition-all disabled:opacity-50">
                        Siguiente →
                    </button>
                ) : (
                    <button onClick={handleSubmit} disabled={isSaving || !form.nombre.trim()}
                        className="px-5 py-2.5 bg-gradient-to-r from-emerald-600 to-green-700 hover:from-emerald-500 hover:to-green-600 text-white font-bold rounded-xl text-sm shadow-lg shadow-emerald-500/30 transition-all disabled:opacity-60">
                        {isSaving ? '⟳ Registrando...' : '✓ Registrar Taller'}
                    </button>
                )}
            </div>
        </div>
    );
}

// ── Campo de formulario reutilizable ──────────────────────────────────────────
function FField({ label, value, onChange, placeholder, type = 'text', required, prefix }: {
    label: string; value: string; onChange: any; placeholder?: string;
    type?: string; required?: boolean; prefix?: string;
}) {
    return (
        <div>
            <label className="block text-xs font-semibold text-slate-400 uppercase tracking-wider mb-1.5">{label}</label>
            <div className="relative">
                {prefix && <span className="absolute left-3 top-1/2 -translate-y-1/2 text-slate-500 text-sm">{prefix}</span>}
                <input type={type} required={required} value={value} onChange={onChange} placeholder={placeholder}
                    className={`w-full bg-slate-900 border border-slate-700 rounded-lg py-2.5 text-sm text-white placeholder-slate-600 focus:outline-none focus:border-violet-500 focus:ring-1 focus:ring-violet-500/30 transition-colors ${prefix ? 'pl-7 pr-4' : 'px-4'}`} />
            </div>
        </div>
    );
}
