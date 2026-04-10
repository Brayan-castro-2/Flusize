'use client';

import { useState, useEffect } from 'react';
import { X, Shield, Loader2, Save } from 'lucide-react';
import { Button } from '@/components/ui/button';
import { supabase } from '@/lib/supabase';
import { useAuth } from '@/contexts/auth-context';
import { toast } from 'sonner';

interface MisDatosLegalesModalProps {
    isOpen: boolean;
    onClose: () => void;
}

export function MisDatosLegalesModal({ isOpen, onClose }: MisDatosLegalesModalProps) {
    const { user } = useAuth();
    const [nombreLegal, setNombreLegal] = useState('');
    const [rutLegal, setRutLegal] = useState('');
    const [cargando, setCargando] = useState(true);
    const [guardando, setGuardando] = useState(false);

    useEffect(() => {
        if (isOpen && user?.id) {
            fetchDatos();
        }
    }, [isOpen, user?.id]);

    const fetchDatos = async () => {
        try {
            setCargando(true);
            const { data, error } = await supabase
                .from('perfiles')
                .select('nombre_legal, rut_legal')
                .eq('id', user?.id)
                .single();

            if (error) throw error;
            if (data) {
                setNombreLegal(data.nombre_legal || '');
                setRutLegal(data.rut_legal || '');
            }
        } catch (error: any) {
            console.error('Error fetching legal data:', error.message);
        } finally {
            setCargando(false);
        }
    };

    const handleSave = async () => {
        if (!nombreLegal.trim() || !rutLegal.trim()) {
            toast.error('Todos los campos son obligatorios');
            return;
        }

        try {
            setGuardando(true);
            const { error } = await supabase
                .from('perfiles')
                .update({
                    nombre_legal: nombreLegal.trim(),
                    rut_legal: rutLegal.trim(),
                    actualizado_en: new Date().toISOString()
                })
                .eq('id', user?.id);

            if (error) throw error;
            toast.success('Datos legales actualizados correctamente');
            onClose();
        } catch (error: any) {
            toast.error('Error al guardar: ' + error.message);
        } finally {
            setGuardando(false);
        }
    };

    if (!isOpen) return null;

    return (
        <div className="fixed inset-0 z-[100] flex items-center justify-center p-4 bg-black/60 backdrop-blur-sm">
            <div className="bg-white rounded-2xl w-full max-w-md shadow-2xl overflow-hidden animate-in fade-in zoom-in duration-200">
                {/* Header */}
                <div className="bg-slate-50 p-6 border-b border-slate-100 flex items-center justify-between">
                    <div>
                        <h3 className="text-xl font-bold text-slate-900 flex items-center gap-2">
                            <Shield className="w-6 h-6 text-emerald-600" />
                            Mis Datos Legales
                        </h3>
                        <p className="text-sm text-slate-500 mt-1">Configuración para contratos digitales</p>
                    </div>
                    <button onClick={onClose} className="p-2 hover:bg-slate-200 rounded-full transition-colors">
                        <X className="w-5 h-5 text-slate-500" />
                    </button>
                </div>

                {/* Content */}
                <div className="p-6 space-y-6">
                    {cargando ? (
                        <div className="flex flex-col items-center justify-center py-10 space-y-4">
                            <Loader2 className="w-8 h-8 text-emerald-600 animate-spin" />
                            <p className="text-slate-500 font-medium">Cargando configuración...</p>
                        </div>
                    ) : (
                        <>
                            <div className="space-y-4">
                                <div className="space-y-1.5">
                                    <label htmlFor="nombre_legal" className="text-sm font-semibold text-slate-700 ml-1">
                                        Nombre Completo (Legal)
                                    </label>
                                    <input
                                        id="nombre_legal"
                                        type="text"
                                        placeholder="Ej: Juan Pérez Soto"
                                        className="w-full px-4 py-3 rounded-xl border border-slate-200 focus:ring-2 focus:ring-emerald-500/20 focus:border-emerald-500 transition-all outline-none"
                                        style={{ color: '#1e293b' }}
                                        value={nombreLegal}
                                        onChange={(e) => setNombreLegal(e.target.value)}
                                    />
                                    <p className="text-[11px] text-slate-400 ml-1 italic">
                                        Este nombre aparecerá como representante en los documentos PDF.
                                    </p>
                                </div>

                                <div className="space-y-1.5">
                                    <label htmlFor="rut_legal" className="text-sm font-semibold text-slate-700 ml-1">
                                        RUT / DNI
                                    </label>
                                    <input
                                        id="rut_legal"
                                        type="text"
                                        placeholder="Ej: 12.345.678-9"
                                        className="w-full px-4 py-3 rounded-xl border border-slate-200 focus:ring-2 focus:ring-emerald-500/20 focus:border-emerald-500 transition-all outline-none"
                                        style={{ color: '#1e293b' }}
                                        value={rutLegal}
                                        onChange={(e) => setRutLegal(e.target.value)}
                                    />
                                    <p className="text-[11px] text-slate-400 ml-1 italic">
                                        Identificación legal del firmante.
                                    </p>
                                </div>
                            </div>

                            <div className="bg-amber-50 border border-amber-100 rounded-xl p-4 flex items-start gap-3">
                                <div className="bg-amber-100 p-1.5 rounded-lg">
                                    <Shield className="w-4 h-4 text-amber-600" />
                                </div>
                                <p className="text-[12px] text-amber-800 leading-relaxed font-medium">
                                    Asegúrate de que los datos coincidan con tu identificación legal para la validez de los contratos electrónicos.
                                </p>
                            </div>
                        </>
                    )}
                </div>

                {/* Footer */}
                <div className="p-6 bg-slate-50 border-t border-slate-100 flex items-center gap-3">
                    <Button
                        variant="outline"
                        className="flex-1 h-12 rounded-xl font-bold border-slate-200"
                        onClick={onClose}
                        disabled={guardando}
                    >
                        Cancelar
                    </Button>
                    <Button
                        className="flex-[2] h-12 rounded-xl font-bold bg-emerald-600 hover:bg-emerald-700 text-white shadow-lg shadow-emerald-600/20 transition-all active:scale-95"
                        onClick={handleSave}
                        disabled={guardando || cargando}
                    >
                        {guardando ? (
                            <div className="flex items-center gap-2">
                                <Loader2 className="w-4 h-4 animate-spin" />
                                Guardando...
                            </div>
                        ) : (
                            <div className="flex items-center gap-2">
                                <Save className="w-5 h-5" />
                                Guardar Datos
                            </div>
                        )}
                    </Button>
                </div>
            </div>
        </div>
    );
}
