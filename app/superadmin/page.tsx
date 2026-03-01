'use client';

import { useState, useEffect, useCallback } from 'react';
import { createClient } from '@supabase/supabase-js';

// ── Cliente admin para que el superadmin vea TODA la data sin RLS ─────────────
// Solo funciona en el cliente porque el superadmin ya está verificado en el layout
const supabaseUrl = process.env.NEXT_PUBLIC_SUPABASE_URL!;
const supabaseAnon = process.env.NEXT_PUBLIC_SUPABASE_ANON_KEY!;
const supabase = createClient(supabaseUrl, supabaseAnon);

type Taller = {
    id: string;
    nombre: string;
    email: string | null;
    telefono: string | null;
    plan_suscripcion: string | null;
    activo: boolean | null;
    creado_en: string;
    slug: string | null;
    // extras calculados
    total_perfiles?: number;
    total_ordenes?: number;
};

const PLANES: Record<string, { label: string; color: string }> = {
    GRATIS: { label: 'Gratis', color: 'bg-slate-700 text-slate-300 border-slate-600' },
    PRO: { label: 'Pro', color: 'bg-blue-900 text-blue-300 border-blue-700' },
    PREMIUM: { label: 'Premium', color: 'bg-violet-900 text-violet-300 border-violet-700' },
};

export default function SuperAdminPage() {
    const [talleres, setTalleres] = useState<Taller[]>([]);
    const [isLoading, setIsLoading] = useState(true);
    const [searchQuery, setSearchQuery] = useState('');
    const [modalOpen, setModalOpen] = useState(false);
    const [actionLoading, setActionLoading] = useState<string | null>(null);
    const [toast, setToast] = useState<{ msg: string; type: 'ok' | 'err' } | null>(null);

    // Stats globales
    const [stats, setStats] = useState({ totalTalleres: 0, activos: 0, ingresos: 0 });

    const showToast = (msg: string, type: 'ok' | 'err' = 'ok') => {
        setToast({ msg, type });
        setTimeout(() => setToast(null), 3500);
    };

    const fetchTalleres = useCallback(async () => {
        setIsLoading(true);
        try {
            const { data, error } = await supabase
                .from('talleres')
                .select('id, nombre, email, telefono, plan_suscripcion, activo, creado_en, slug')
                .order('creado_en', { ascending: false });

            if (error) throw error;

            setTalleres(data || []);
            setStats({
                totalTalleres: data?.length || 0,
                activos: data?.filter(t => t.activo).length || 0,
                ingresos: 0, // Placeholder para integración futura con pagos
            });
        } catch (err) {
            console.error('Error fetching talleres:', err);
        } finally {
            setIsLoading(false);
        }
    }, []);

    useEffect(() => {
        fetchTalleres();
    }, [fetchTalleres]);

    const handleToggleActivo = async (taller: Taller) => {
        setActionLoading(taller.id);
        try {
            const { error } = await supabase
                .from('talleres')
                .update({ activo: !taller.activo })
                .eq('id', taller.id);

            if (error) throw error;

            setTalleres(prev =>
                prev.map(t => t.id === taller.id ? { ...t, activo: !t.activo } : t)
            );
            showToast(`Taller "${taller.nombre}" ${!taller.activo ? 'activado' : 'suspendido'}.`);
        } catch (err: any) {
            showToast(err.message || 'Error al cambiar estado.', 'err');
        } finally {
            setActionLoading(null);
        }
    };

    const filteredTalleres = talleres.filter(t =>
        t.nombre.toLowerCase().includes(searchQuery.toLowerCase()) ||
        (t.email || '').toLowerCase().includes(searchQuery.toLowerCase())
    );

    const formatDate = (iso: string) =>
        new Date(iso).toLocaleDateString('es-CL', { day: '2-digit', month: 'short', year: 'numeric' });

    return (
        <>
            {/* Toast */}
            {toast && (
                <div className={`fixed top-6 right-6 z-50 px-5 py-3 rounded-xl text-sm font-medium shadow-2xl border transition-all duration-300 ${toast.type === 'ok'
                        ? 'bg-emerald-950 text-emerald-300 border-emerald-700'
                        : 'bg-red-950 text-red-300 border-red-700'
                    }`}>
                    {toast.type === 'ok' ? '✓ ' : '✗ '}{toast.msg}
                </div>
            )}

            <div className="space-y-8">
                {/* Header */}
                <div className="flex flex-col sm:flex-row sm:items-center justify-between gap-4">
                    <div>
                        <h1 className="text-3xl font-bold text-white tracking-tight">
                            Panel Global
                        </h1>
                        <p className="text-slate-400 mt-1 text-sm">
                            Gestión de todos los talleres del ecosistema Flusize
                        </p>
                    </div>
                    <button
                        onClick={() => setModalOpen(true)}
                        className="flex items-center gap-2 px-5 py-2.5 bg-gradient-to-r from-violet-600 to-purple-700 hover:from-violet-500 hover:to-purple-600 text-white font-semibold rounded-xl shadow-lg shadow-violet-500/30 transition-all duration-200 hover:scale-[1.02] active:scale-[0.98] whitespace-nowrap"
                    >
                        <span className="text-lg">+</span> Registrar Taller
                    </button>
                </div>

                {/* Stats Cards */}
                <div className="grid grid-cols-1 sm:grid-cols-3 gap-4">
                    <div className="bg-[#0D1528] border border-slate-800 rounded-2xl p-5">
                        <p className="text-slate-500 text-xs font-medium uppercase tracking-wider mb-1">Total Talleres</p>
                        <p className="text-3xl font-bold text-white">{stats.totalTalleres}</p>
                        <p className="text-slate-500 text-xs mt-1">registrados en la plataforma</p>
                    </div>
                    <div className="bg-[#0D1528] border border-slate-800 rounded-2xl p-5">
                        <p className="text-slate-500 text-xs font-medium uppercase tracking-wider mb-1">Activos ahora</p>
                        <p className="text-3xl font-bold text-emerald-400">{stats.activos}</p>
                        <div className="w-full bg-slate-800 rounded-full h-1.5 mt-2">
                            <div
                                className="bg-emerald-500 h-1.5 rounded-full transition-all"
                                style={{ width: stats.totalTalleres ? `${(stats.activos / stats.totalTalleres) * 100}%` : '0%' }}
                            />
                        </div>
                    </div>
                    <div className="bg-[#0D1528] border border-slate-800 rounded-2xl p-5">
                        <p className="text-slate-500 text-xs font-medium uppercase tracking-wider mb-1">Suspendidos</p>
                        <p className="text-3xl font-bold text-red-400">{stats.totalTalleres - stats.activos}</p>
                        <p className="text-slate-500 text-xs mt-1">requieren atención</p>
                    </div>
                </div>

                {/* Tabla de Talleres */}
                <div className="bg-[#0D1528] border border-slate-800 rounded-2xl overflow-hidden">
                    {/* Toolbar */}
                    <div className="flex items-center justify-between px-6 py-4 border-b border-slate-800">
                        <h2 className="text-white font-semibold text-lg">Talleres Registrados</h2>
                        <div className="relative">
                            <span className="absolute left-3 top-1/2 -translate-y-1/2 text-slate-500 text-sm">🔍</span>
                            <input
                                type="text"
                                placeholder="Buscar taller o email..."
                                value={searchQuery}
                                onChange={e => setSearchQuery(e.target.value)}
                                className="bg-slate-900 border border-slate-700 rounded-lg px-9 py-2 text-sm text-slate-200 placeholder-slate-600 focus:outline-none focus:border-violet-500 focus:ring-1 focus:ring-violet-500/50 w-56 transition-colors"
                            />
                        </div>
                    </div>

                    {/* Table */}
                    <div className="overflow-x-auto">
                        <table className="w-full">
                            <thead>
                                <tr className="border-b border-slate-800/50">
                                    <th className="text-left px-6 py-4 text-xs font-semibold text-slate-500 uppercase tracking-wider">Nombre del Taller</th>
                                    <th className="text-left px-4 py-4 text-xs font-semibold text-slate-500 uppercase tracking-wider hidden sm:table-cell">Contacto</th>
                                    <th className="text-left px-4 py-4 text-xs font-semibold text-slate-500 uppercase tracking-wider">Plan</th>
                                    <th className="text-left px-4 py-4 text-xs font-semibold text-slate-500 uppercase tracking-wider">Estado</th>
                                    <th className="text-left px-4 py-4 text-xs font-semibold text-slate-500 uppercase tracking-wider hidden md:table-cell">Registro</th>
                                    <th className="text-right px-6 py-4 text-xs font-semibold text-slate-500 uppercase tracking-wider">Acciones</th>
                                </tr>
                            </thead>
                            <tbody className="divide-y divide-slate-800/50">
                                {isLoading ? (
                                    // Skeleton loader
                                    Array.from({ length: 4 }).map((_, i) => (
                                        <tr key={i}>
                                            {Array.from({ length: 5 }).map((_, j) => (
                                                <td key={j} className="px-6 py-4">
                                                    <div className="h-4 bg-slate-800 rounded animate-pulse" style={{ width: `${60 + Math.random() * 30}%` }} />
                                                </td>
                                            ))}
                                        </tr>
                                    ))
                                ) : filteredTalleres.length === 0 ? (
                                    <tr>
                                        <td colSpan={6} className="px-6 py-16 text-center">
                                            <div className="text-4xl mb-3">🏭</div>
                                            <p className="text-slate-500">
                                                {searchQuery ? 'No se encontraron talleres con ese criterio' : 'No hay talleres registrados aún'}
                                            </p>
                                        </td>
                                    </tr>
                                ) : (
                                    filteredTalleres.map(taller => {
                                        const plan = PLANES[taller.plan_suscripcion || 'GRATIS'] || PLANES.GRATIS;
                                        return (
                                            <tr
                                                key={taller.id}
                                                className="hover:bg-slate-800/30 transition-colors duration-100"
                                            >
                                                {/* Nombre */}
                                                <td className="px-6 py-4">
                                                    <div className="flex items-center gap-3">
                                                        <div className="w-9 h-9 bg-gradient-to-br from-slate-700 to-slate-800 rounded-lg flex items-center justify-center text-lg flex-shrink-0">
                                                            🔧
                                                        </div>
                                                        <div>
                                                            <p className="text-white font-medium text-sm">{taller.nombre}</p>
                                                            {taller.slug && (
                                                                <p className="text-xs text-slate-600 font-mono">/{taller.slug}</p>
                                                            )}
                                                        </div>
                                                    </div>
                                                </td>

                                                {/* Contacto */}
                                                <td className="px-4 py-4 hidden sm:table-cell">
                                                    <p className="text-slate-300 text-sm">{taller.email || '—'}</p>
                                                    <p className="text-slate-600 text-xs mt-0.5">{taller.telefono || ''}</p>
                                                </td>

                                                {/* Plan */}
                                                <td className="px-4 py-4">
                                                    <span className={`text-xs font-semibold px-2.5 py-1 rounded-full border ${plan.color}`}>
                                                        {plan.label}
                                                    </span>
                                                </td>

                                                {/* Estado */}
                                                <td className="px-4 py-4">
                                                    <div className="flex items-center gap-2">
                                                        <div className={`w-2 h-2 rounded-full ${taller.activo ? 'bg-emerald-400' : 'bg-red-500'}`} />
                                                        <span className={`text-xs font-medium ${taller.activo ? 'text-emerald-400' : 'text-red-400'}`}>
                                                            {taller.activo ? 'Activo' : 'Suspendido'}
                                                        </span>
                                                    </div>
                                                </td>

                                                {/* Fecha */}
                                                <td className="px-4 py-4 hidden md:table-cell">
                                                    <p className="text-slate-500 text-xs">{formatDate(taller.creado_en)}</p>
                                                </td>

                                                {/* Acciones */}
                                                <td className="px-6 py-4">
                                                    <div className="flex items-center justify-end gap-2">
                                                        <button
                                                            className="text-xs px-3 py-1.5 rounded-lg bg-slate-800 hover:bg-slate-700 text-slate-300 border border-slate-700 hover:border-slate-600 transition-all"
                                                            onClick={() => {/* TODO: modal editar plan */ }}
                                                        >
                                                            Editar
                                                        </button>
                                                        <button
                                                            onClick={() => handleToggleActivo(taller)}
                                                            disabled={actionLoading === taller.id}
                                                            className={`text-xs px-3 py-1.5 rounded-lg border transition-all disabled:opacity-50 ${taller.activo
                                                                    ? 'bg-red-950/50 hover:bg-red-900/60 text-red-400 border-red-800'
                                                                    : 'bg-emerald-950/50 hover:bg-emerald-900/60 text-emerald-400 border-emerald-800'
                                                                }`}
                                                        >
                                                            {actionLoading === taller.id ? '...' : taller.activo ? 'Suspender' : 'Activar'}
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

                    {/* Footer */}
                    {!isLoading && (
                        <div className="px-6 py-3 border-t border-slate-800/50 text-right">
                            <p className="text-slate-600 text-xs">
                                {filteredTalleres.length} de {talleres.length} talleres
                            </p>
                        </div>
                    )}
                </div>
            </div>

            {/* Modal: Registrar Nuevo Taller */}
            {modalOpen && (
                <div
                    className="fixed inset-0 bg-black/70 backdrop-blur-sm z-50 flex items-center justify-center p-4"
                    onClick={e => { if (e.target === e.currentTarget) setModalOpen(false); }}
                >
                    <div className="bg-[#0D1528] border border-slate-700 rounded-2xl w-full max-w-md shadow-2xl">
                        <div className="flex items-center justify-between p-6 border-b border-slate-800">
                            <div>
                                <h2 className="text-white font-bold text-lg">Registrar Nuevo Taller</h2>
                                <p className="text-slate-500 text-xs mt-0.5">Crea un nuevo tenant en la plataforma</p>
                            </div>
                            <button
                                onClick={() => setModalOpen(false)}
                                className="text-slate-500 hover:text-slate-300 text-xl leading-none transition-colors"
                            >
                                ×
                            </button>
                        </div>

                        <NewTallerForm
                            onSuccess={() => {
                                setModalOpen(false);
                                fetchTalleres();
                                showToast('Taller creado correctamente.');
                            }}
                            onError={(msg) => showToast(msg, 'err')}
                        />
                    </div>
                </div>
            )}
        </>
    );
}

// ── Formulario de Nuevo Taller ─────────────────────────────────────────────────
function NewTallerForm({ onSuccess, onError }: {
    onSuccess: () => void;
    onError: (msg: string) => void;
}) {
    const [nombre, setNombre] = useState('');
    const [email, setEmail] = useState('');
    const [telefono, setTelefono] = useState('');
    const [plan, setPlan] = useState('GRATIS');
    const [isSaving, setIsSaving] = useState(false);

    const handleSubmit = async (e: React.FormEvent) => {
        e.preventDefault();
        if (!nombre.trim()) { onError('El nombre del taller es obligatorio.'); return; }

        setIsSaving(true);
        try {
            const slug = nombre.toLowerCase()
                .replace(/\s+/g, '-')
                .replace(/[^a-z0-9-]/g, '')
                .substring(0, 50);

            const { error } = await supabase.from('talleres').insert({
                nombre: nombre.trim(),
                email: email.trim() || null,
                telefono: telefono.trim() || null,
                plan_suscripcion: plan,
                activo: true,
                slug,
            });

            if (error) throw error;
            onSuccess();
        } catch (err: any) {
            onError(err.message || 'Error al crear el taller.');
        } finally {
            setIsSaving(false);
        }
    };

    return (
        <form onSubmit={handleSubmit} className="p-6 space-y-4">
            <div>
                <label className="block text-xs font-semibold text-slate-400 uppercase tracking-wider mb-1.5">Nombre del Taller *</label>
                <input
                    type="text"
                    required
                    value={nombre}
                    onChange={e => setNombre(e.target.value)}
                    placeholder="Ej: Taller Mecánico González"
                    className="w-full bg-slate-900 border border-slate-700 rounded-lg px-4 py-2.5 text-sm text-white placeholder-slate-600 focus:outline-none focus:border-violet-500 focus:ring-1 focus:ring-violet-500/50 transition-colors"
                />
            </div>

            <div>
                <label className="block text-xs font-semibold text-slate-400 uppercase tracking-wider mb-1.5">Email de Contacto</label>
                <input
                    type="email"
                    value={email}
                    onChange={e => setEmail(e.target.value)}
                    placeholder="contacto@taller.cl"
                    className="w-full bg-slate-900 border border-slate-700 rounded-lg px-4 py-2.5 text-sm text-white placeholder-slate-600 focus:outline-none focus:border-violet-500 focus:ring-1 focus:ring-violet-500/50 transition-colors"
                />
            </div>

            <div>
                <label className="block text-xs font-semibold text-slate-400 uppercase tracking-wider mb-1.5">Teléfono</label>
                <input
                    type="tel"
                    value={telefono}
                    onChange={e => setTelefono(e.target.value)}
                    placeholder="+56 9 1234 5678"
                    className="w-full bg-slate-900 border border-slate-700 rounded-lg px-4 py-2.5 text-sm text-white placeholder-slate-600 focus:outline-none focus:border-violet-500 focus:ring-1 focus:ring-violet-500/50 transition-colors"
                />
            </div>

            <div>
                <label className="block text-xs font-semibold text-slate-400 uppercase tracking-wider mb-1.5">Plan de Suscripción</label>
                <select
                    value={plan}
                    onChange={e => setPlan(e.target.value)}
                    className="w-full bg-slate-900 border border-slate-700 rounded-lg px-4 py-2.5 text-sm text-white focus:outline-none focus:border-violet-500 focus:ring-1 focus:ring-violet-500/50 transition-colors"
                >
                    <option value="GRATIS">🆓 Gratis</option>
                    <option value="PRO">⚡ Pro</option>
                    <option value="PREMIUM">👑 Premium</option>
                </select>
            </div>

            <div className="flex gap-3 pt-2">
                <button
                    type="submit"
                    disabled={isSaving}
                    className="flex-1 py-2.5 bg-gradient-to-r from-violet-600 to-purple-700 hover:from-violet-500 hover:to-purple-600 text-white font-semibold rounded-xl transition-all disabled:opacity-60 disabled:cursor-not-allowed"
                >
                    {isSaving ? 'Creando...' : 'Crear Taller'}
                </button>
                <button
                    type="button"
                    onClick={() => { }}
                    className="px-4 py-2.5 bg-slate-800 hover:bg-slate-700 text-slate-300 rounded-xl border border-slate-700 transition-colors text-sm"
                >
                    Cancelar
                </button>
            </div>
        </form>
    );
}
