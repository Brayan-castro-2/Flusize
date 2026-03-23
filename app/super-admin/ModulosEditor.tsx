'use client';

import { useState, useTransition } from 'react';
import { supabase } from '@/lib/supabase';

const ALL_MODULES = [
    { key: 'recepcion',    label: 'Recepción',    color: 'blue' },
    { key: 'ordenes',      label: 'Órdenes',      color: 'indigo' },
    { key: 'checklist',    label: 'Checklist',    color: 'cyan' },
    { key: 'agenda',       label: 'Agenda',       color: 'violet' },
    { key: 'crm',          label: 'CRM Clientes', color: 'pink' },
    { key: 'inventario',   label: 'Inventario',   color: 'amber' },
    { key: 'cotizaciones', label: 'Cotizaciones', color: 'orange' },
    { key: 'analytics',   label: 'Analytics',    color: 'emerald' },
] as const;

const COLOR_MAP: Record<string, string> = {
    blue:    'bg-blue-100 text-blue-700 border-blue-300',
    indigo:  'bg-indigo-100 text-indigo-700 border-indigo-300',
    cyan:    'bg-cyan-100 text-cyan-700 border-cyan-300',
    violet:  'bg-violet-100 text-violet-700 border-violet-300',
    pink:    'bg-pink-100 text-pink-700 border-pink-300',
    amber:   'bg-amber-100 text-amber-700 border-amber-300',
    orange:  'bg-orange-100 text-orange-700 border-orange-300',
    emerald: 'bg-emerald-100 text-emerald-700 border-emerald-300',
};

interface Props {
    tallerId: string;
    tallerNombre: string;
    modulosActivos: string[];
}

export function ModulosEditor({ tallerId, tallerNombre, modulosActivos: initialModulos }: Props) {
    const [open, setOpen] = useState(false);
    const [modulos, setModulos] = useState<string[]>(initialModulos || ['recepcion', 'ordenes', 'checklist']);
    const [saving, setSaving] = useState(false);
    const [saved, setSaved] = useState(false);
    const [, startTransition] = useTransition();

    const toggle = (key: string) => {
        setModulos(prev =>
            prev.includes(key) ? prev.filter(m => m !== key) : [...prev, key]
        );
        setSaved(false);
    };

    const handleSave = async () => {
        setSaving(true);
        const { error } = await supabase
            .from('talleres')
            .update({ modulos_activos: modulos })
            .eq('id', tallerId);

        if (!error) {
            setSaved(true);
            setTimeout(() => setSaved(false), 2000);
        } else {
            console.error('Error guardando módulos:', error);
            alert('Error al guardar módulos. Revisar consola.');
        }
        setSaving(false);
    };

    return (
        <>
            {/* Botón de apertura con badge de cantidad */}
            <button
                onClick={() => setOpen(true)}
                className="inline-flex items-center gap-1.5 text-xs px-2.5 py-1.5 rounded-lg font-semibold transition-all
                           bg-slate-100 hover:bg-slate-200 text-slate-600 border border-slate-200"
            >
                <span>⚙️</span>
                <span>Módulos</span>
                <span className="bg-slate-700 text-white rounded-full px-1.5 py-0.5 text-[10px] font-bold leading-none">
                    {modulos.length}
                </span>
            </button>

            {/* Modal overlay */}
            {open && (
                <div
                    className="fixed inset-0 z-50 flex items-center justify-center p-4"
                    style={{ backgroundColor: 'rgba(0,0,0,0.45)', backdropFilter: 'blur(4px)' }}
                    onClick={(e) => { if (e.target === e.currentTarget) setOpen(false); }}
                >
                    <div className="bg-white rounded-2xl shadow-2xl w-full max-w-md border border-slate-100 animate-in fade-in zoom-in-95 duration-200">
                        {/* Header */}
                        <div className="px-6 pt-6 pb-4 border-b border-slate-100">
                            <div className="flex items-start justify-between">
                                <div>
                                    <h3 className="text-base font-black text-slate-800">Módulos Activos</h3>
                                    <p className="text-xs text-slate-500 mt-0.5 font-mono">{tallerNombre}</p>
                                </div>
                                <button
                                    onClick={() => setOpen(false)}
                                    className="text-slate-400 hover:text-slate-600 text-xl font-bold leading-none ml-4"
                                >×</button>
                            </div>
                        </div>

                        {/* Toggles Grid */}
                        <div className="p-6 grid grid-cols-2 gap-3">
                            {ALL_MODULES.map(({ key, label, color }) => {
                                const isActive = modulos.includes(key);
                                const activeClass = isActive ? COLOR_MAP[color] : 'bg-slate-50 text-slate-400 border-slate-200';
                                return (
                                    <button
                                        key={key}
                                        onClick={() => toggle(key)}
                                        className={`flex items-center gap-2.5 px-3 py-2.5 rounded-xl border font-semibold text-sm
                                                    transition-all ${activeClass}`}
                                    >
                                        {/* Lucide-less toggle dot */}
                                        <span className={`w-3 h-3 rounded-full flex-shrink-0 border-2 transition-all
                                                          ${isActive ? 'bg-current border-current scale-110' : 'bg-slate-300 border-slate-300'}`} />
                                        {label}
                                    </button>
                                );
                            })}
                        </div>

                        {/* Footer */}
                        <div className="px-6 pb-6 flex gap-3">
                            <button
                                onClick={() => setOpen(false)}
                                className="flex-1 h-10 rounded-xl border border-slate-200 text-slate-600 text-sm font-semibold hover:bg-slate-50 transition-all"
                            >
                                Cancelar
                            </button>
                            <button
                                onClick={handleSave}
                                disabled={saving}
                                className={`flex-1 h-10 rounded-xl text-sm font-bold transition-all text-white
                                            ${saved
                                                ? 'bg-emerald-500 hover:bg-emerald-600'
                                                : 'bg-blue-600 hover:bg-blue-700 disabled:opacity-60'
                                            }`}
                            >
                                {saving ? 'Guardando...' : saved ? '✓ Guardado' : 'Guardar Módulos'}
                            </button>
                        </div>
                    </div>
                </div>
            )}
        </>
    );
}
