'use client';

import { useEffect, useState } from 'react';
import { supabase } from '@/lib/supabase';
import { DEFAULT_MODULES_JSON, type ModulosJson } from '@/hooks/useFlusizeFeatures';
import { Loader2, ToggleLeft, ToggleRight, Save, Building2, ChevronRight } from 'lucide-react';
import { toast } from 'sonner';

// ──────────────────────────────────────────────────────────────
// Module & sub-feature registry
// ──────────────────────────────────────────────────────────────
type SubFeature = { key: string; label: string; description?: string };
type ModuleConfig = {
    key: string;
    label: string;
    icon: string;
    description: string;
    subFeatures: SubFeature[];
};

const MODULE_REGISTRY: ModuleConfig[] = [
    {
        key: 'recepcion',
        label: 'Recepción',
        icon: '🛎️',
        description: 'Formulario de ingreso de órdenes',
        subFeatures: [],
    },
    {
        key: 'ordenes',
        label: 'Órdenes',
        icon: '📋',
        description: 'Gestión de órdenes de trabajo',
        subFeatures: [],
    },
    {
        key: 'checklist',
        label: 'Checklist',
        icon: '✅',
        description: 'Inspección visual de ingreso/salida',
        subFeatures: [],
    },
    {
        key: 'clientes',
        label: 'Clientes (CRM)',
        icon: '👥',
        description: 'Directorio de clientes',
        subFeatures: [
            { key: 'mini_crm', label: 'Mini-CRM', description: 'Alias, notas internas y nivel de alerta por cliente' },
        ],
    },
    {
        key: 'inventario',
        label: 'Inventario',
        icon: '📦',
        description: 'Control de stock de piezas y repuestos',
        subFeatures: [],
    },
    {
        key: 'agenda',
        label: 'Agenda / Citas',
        icon: '📅',
        description: 'Calendario de citas y agendamiento',
        subFeatures: [],
    },
    {
        key: 'cotizaciones',
        label: 'Cotizaciones',
        icon: '💰',
        description: 'Generador de cotizaciones',
        subFeatures: [],
    },
    {
        key: 'analytics',
        label: 'Analytics',
        icon: '📊',
        description: 'Reportes y métricas del taller',
        subFeatures: [],
    },
    {
        key: 'public_profile',
        label: 'Perfil Público',
        icon: '🌐',
        description: 'Página pública del taller',
        subFeatures: [],
    },
    {
        key: 'tracking',
        label: 'Tracking',
        icon: '🔍',
        description: 'Seguimiento de órdenes para el cliente',
        subFeatures: [],
    },
];

// ──────────────────────────────────────────────────────────────
// Types
// ──────────────────────────────────────────────────────────────
type Taller = { id: string; nombre: string; modulos_activos: ModulosJson | null };

// ──────────────────────────────────────────────────────────────
// Toggle component
// ──────────────────────────────────────────────────────────────
function Toggle({ value, onChange, disabled }: { value: boolean; onChange: (v: boolean) => void; disabled?: boolean }) {
    return (
        <button
            type="button"
            onClick={() => !disabled && onChange(!value)}
            disabled={disabled}
            className={`relative flex items-center transition-all ${disabled ? 'opacity-40 cursor-not-allowed' : 'cursor-pointer'}`}
            aria-checked={value}
        >
            {value
                ? <ToggleRight className={`w-9 h-9 ${disabled ? 'text-slate-600' : 'text-violet-400'} transition-colors`} />
                : <ToggleLeft className="w-9 h-9 text-slate-600 transition-colors" />
            }
        </button>
    );
}

// ──────────────────────────────────────────────────────────────
// Page
// ──────────────────────────────────────────────────────────────
export default function FeaturesPage() {
    const [talleres, setTalleres] = useState<Taller[]>([]);
    const [selectedId, setSelectedId] = useState<string | null>(null);
    const [flags, setFlags] = useState<ModulosJson>({});
    const [isSaving, setIsSaving] = useState(false);
    const [isLoading, setIsLoading] = useState(true);

    // ── Fetch all talleres ──────────────────────────────────
    useEffect(() => {
        supabase
            .from('talleres')
            .select('id, nombre, modulos_activos')
            .order('nombre')
            .then(({ data, error }) => {
                if (error) { console.error(error); return; }
                setTalleres((data || []) as Taller[]);
                if ((data || []).length > 0) setSelectedId(data![0].id);
                setIsLoading(false);
            });
    }, []);

    // ── Load flags for selected taller ─────────────────────
    useEffect(() => {
        if (!selectedId) return;
        const taller = talleres.find(t => t.id === selectedId);
        if (!taller) return;

        // Merge raw DB flags with defaults so new sub-features appear
        const raw = (taller.modulos_activos || {}) as ModulosJson;
        const merged: ModulosJson = {};
        for (const mod of MODULE_REGISTRY) {
            const defaultsForMod = DEFAULT_MODULES_JSON[mod.key] || { activo: false };
            const dbMod = raw[mod.key] || {};
            merged[mod.key] = { ...defaultsForMod, ...dbMod };
        }
        setFlags(merged);
    }, [selectedId, talleres]);

    // ── Setters ────────────────────────────────────────────
    const setModuleActive = (modKey: string, value: boolean) => {
        setFlags(prev => ({
            ...prev,
            [modKey]: { ...prev[modKey], activo: value },
        }));
    };

    const setSubFeature = (modKey: string, subKey: string, value: boolean) => {
        setFlags(prev => ({
            ...prev,
            [modKey]: { ...prev[modKey], [subKey]: value },
        }));
    };

    // ── Save ───────────────────────────────────────────────
    const handleSave = async () => {
        if (!selectedId) return;
        setIsSaving(true);
        try {
            const { error } = await supabase
                .from('talleres')
                .update({ modulos_activos: flags })
                .eq('id', selectedId);

            if (error) throw error;

            // Update local cache
            setTalleres(prev => prev.map(t =>
                t.id === selectedId ? { ...t, modulos_activos: flags } : t
            ));
            toast.success('Feature flags guardados correctamente ✅');
        } catch (err) {
            console.error(err);
            toast.error('Error al guardar los cambios');
        } finally {
            setIsSaving(false);
        }
    };

    const selectedTaller = talleres.find(t => t.id === selectedId);

    // ── Loading ────────────────────────────────────────────
    if (isLoading) {
        return (
            <div className="flex items-center justify-center h-64">
                <Loader2 className="w-8 h-8 animate-spin text-violet-400" />
            </div>
        );
    }

    return (
        <div className="space-y-6">
            {/* Header */}
            <div className="flex items-center justify-between">
                <div>
                    <h1 className="text-2xl font-black text-white tracking-tight flex items-center gap-2">
                        <span className="text-violet-400">⚙️</span> Feature Flags
                    </h1>
                    <p className="text-slate-500 text-sm mt-1">
                        Controla qué módulos y sub-funciones tiene cada taller habilitados.
                    </p>
                </div>
                <button
                    onClick={handleSave}
                    disabled={isSaving || !selectedId}
                    className="flex items-center gap-2 bg-violet-600 hover:bg-violet-700 disabled:opacity-50 disabled:cursor-not-allowed text-white font-bold px-5 py-2.5 rounded-xl transition-colors"
                >
                    {isSaving ? <Loader2 className="w-4 h-4 animate-spin" /> : <Save className="w-4 h-4" />}
                    Guardar cambios
                </button>
            </div>

            <div className="grid grid-cols-[260px_1fr] gap-6 items-start">
                {/* Sidebar — taller list */}
                <div className="rounded-2xl border border-slate-800 bg-slate-900/60 overflow-hidden">
                    <div className="px-4 py-3 border-b border-slate-800 text-xs font-bold uppercase tracking-widest text-slate-500">
                        Talleres ({talleres.length})
                    </div>
                    <ul className="divide-y divide-slate-800/50 max-h-[70vh] overflow-y-auto">
                        {talleres.map(t => (
                            <li key={t.id}>
                                <button
                                    onClick={() => setSelectedId(t.id)}
                                    className={`w-full text-left px-4 py-3 flex items-center gap-2.5 transition-colors hover:bg-slate-800/50 ${
                                        selectedId === t.id ? 'bg-violet-600/15 border-l-2 border-violet-500' : ''
                                    }`}
                                >
                                    <Building2 className={`w-4 h-4 shrink-0 ${selectedId === t.id ? 'text-violet-400' : 'text-slate-600'}`} />
                                    <span className={`text-sm font-medium truncate ${selectedId === t.id ? 'text-white' : 'text-slate-400'}`}>
                                        {t.nombre}
                                    </span>
                                    {selectedId === t.id && <ChevronRight className="w-3.5 h-3.5 text-violet-400 ml-auto shrink-0" />}
                                </button>
                            </li>
                        ))}
                    </ul>
                </div>

                {/* Main panel — flags editor */}
                <div className="space-y-3">
                    {selectedTaller && (
                        <div className="rounded-xl bg-slate-900/60 border border-slate-800 px-5 py-3 flex items-center gap-3 mb-1">
                            <Building2 className="w-5 h-5 text-violet-400" />
                            <div>
                                <p className="text-white font-bold text-sm leading-none">{selectedTaller.nombre}</p>
                                <p className="text-slate-500 text-xs mt-0.5 font-mono">{selectedTaller.id}</p>
                            </div>
                        </div>
                    )}

                    {MODULE_REGISTRY.map(mod => {
                        const modFlags = flags[mod.key] || {};
                        const isActive = modFlags.activo === true;

                        return (
                            <div key={mod.key} className={`rounded-2xl border transition-colors ${
                                isActive ? 'border-slate-700 bg-slate-900/40' : 'border-slate-800/50 bg-slate-950/30'
                            }`}>
                                {/* Module row */}
                                <div className="flex items-center gap-4 px-5 py-4">
                                    <span className="text-2xl w-8 text-center">{mod.icon}</span>
                                    <div className="flex-1 min-w-0">
                                        <div className="font-bold text-white text-sm">{mod.label}</div>
                                        <div className="text-slate-500 text-xs">{mod.description}</div>
                                    </div>
                                    <Toggle value={isActive} onChange={v => setModuleActive(mod.key, v)} />
                                </div>

                                {/* Sub-features */}
                                {mod.subFeatures.length > 0 && (
                                    <div className="border-t border-slate-800/50 divide-y divide-slate-800/30">
                                        {mod.subFeatures.map(sf => (
                                            <div key={sf.key} className="flex items-center gap-4 px-5 py-3 pl-16">
                                                <div className="flex-1 min-w-0">
                                                    <div className={`text-sm font-semibold ${isActive ? 'text-slate-200' : 'text-slate-600'}`}>
                                                        {sf.label}
                                                    </div>
                                                    {sf.description && (
                                                        <div className="text-slate-600 text-xs">{sf.description}</div>
                                                    )}
                                                </div>
                                                <Toggle
                                                    value={modFlags[sf.key] === true}
                                                    onChange={v => setSubFeature(mod.key, sf.key, v)}
                                                    disabled={!isActive}
                                                />
                                            </div>
                                        ))}
                                    </div>
                                )}
                            </div>
                        );
                    })}
                </div>
            </div>
        </div>
    );
}
