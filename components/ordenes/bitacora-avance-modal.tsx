'use client';

import { useState, useRef } from 'react';
import { Dialog, DialogContent, DialogHeader, DialogTitle } from '@/components/ui/dialog';
import { Button } from '@/components/ui/button';
import { supabase } from '@/lib/supabase';
import { useAuth } from '@/contexts/auth-context';
import { toast } from 'sonner';
import {
    FileText, Camera, AlertTriangle, Package,
    Loader2, CheckCircle, X, Upload
} from 'lucide-react';
import { BuscadorInventario, type CartItem } from '@/components/inventario/buscador-inventario';
import { useFlusizeFeatures } from '@/hooks/useFlusizeFeatures';
import { normalizePlan, planHasModule } from '@/lib/plan-config';

type TipoAvance = 'nota' | 'evidencia' | 'alerta' | 'repuesto';

interface Tab {
    id: TipoAvance;
    label: string;
    icon: React.ReactNode;
    color: string;
    activeColor: string;
}

const TABS: Tab[] = [
    {
        id: 'nota',
        label: 'Nota',
        icon: <FileText className="w-4 h-4" />,
        color: 'border-slate-200 text-slate-600',
        activeColor: 'border-blue-500 bg-blue-50 text-blue-700',
    },
    {
        id: 'evidencia',
        label: 'Evidencia',
        icon: <Camera className="w-4 h-4" />,
        color: 'border-slate-200 text-slate-600',
        activeColor: 'border-violet-500 bg-violet-50 text-violet-700',
    },
    {
        id: 'alerta',
        label: 'Alerta',
        icon: <AlertTriangle className="w-4 h-4" />,
        color: 'border-slate-200 text-slate-600',
        activeColor: 'border-orange-500 bg-orange-50 text-orange-700',
    },
    {
        id: 'repuesto',
        label: 'Repuesto',
        icon: <Package className="w-4 h-4" />,
        color: 'border-slate-200 text-slate-600',
        activeColor: 'border-emerald-500 bg-emerald-50 text-emerald-700',
    },
];

interface Props {
    isOpen: boolean;
    onClose: () => void;
    orderId: string;
    onSaved?: () => void;
}

export function BitacoraAvanceModal({ isOpen, onClose, orderId, onSaved }: Props) {
    const { user } = useAuth();
    const { tieneModulo } = useFlusizeFeatures();
    const planStr = normalizePlan(user?.plan);
    const hasInventario = planHasModule(planStr, 'inventario');
    const [activeTab, setActiveTab] = useState<TipoAvance>('nota');
    const [contenido, setContenido] = useState('');
    const [isSaving, setIsSaving] = useState(false);
    const [isUploading, setIsUploading] = useState(false);
    const [uploadedUrls, setUploadedUrls] = useState<string[]>([]);
    const [repuestos, setRepuestos] = useState<CartItem[]>([]);
    const [piezaManual, setPiezaManual] = useState('');
    const [costoManual, setCostoManual] = useState('');
    const fileInputRef = useRef<HTMLInputElement>(null);

    const resetState = () => {
        setContenido('');
        setUploadedUrls([]);
        setRepuestos([]);
        setPiezaManual('');
        setCostoManual('');
    };

    const handleClose = () => {
        resetState();
        onClose();
    };

    const handleFileUpload = async (files: FileList | null) => {
        if (!files || files.length === 0 || !user?.tallerId) return;
        setIsUploading(true);
        const urls: string[] = [];
        for (const file of Array.from(files)) {
            const ext = file.name.split('.').pop();
            const path = `${user.tallerId}/${orderId}/avance_${Date.now()}.${ext}`;
            const { error } = await supabase.storage.from('checklist-imagenes').upload(path, file, { upsert: true });
            if (!error) {
                const { data } = supabase.storage.from('checklist-imagenes').getPublicUrl(path);
                if (data?.publicUrl) urls.push(data.publicUrl);
            }
        }
        setUploadedUrls(prev => [...prev, ...urls]);
        setIsUploading(false);
    };

    const handleSave = async () => {
        if (!user?.tallerId) return;

        const hasContent = contenido.trim().length > 0
            || uploadedUrls.length > 0
            || repuestos.length > 0
            || piezaManual.trim().length > 0;

        if (!hasContent) {
            toast.error('Agrega algún contenido antes de guardar.');
            return;
        }

        setIsSaving(true);
        try {
            const payload: any = {
                orden_id: orderId,
                taller_id: user.tallerId,
                usuario_id: user.id,
                tipo: activeTab,
                contenido: contenido.trim() || null,
                fotos: uploadedUrls,
                repuestos: repuestos.map(r => ({
                    id: r.id,
                    nombre: r.nombre,
                    cantidad: r.cantidad,
                    precio_unitario: r.precio_venta,
                    subtotal: r.precio_venta * r.cantidad,
                })),
                pieza_manual: piezaManual.trim() || null,
                costo_manual: costoManual ? parseFloat(costoManual.replace(/\./g, '').replace(',', '.')) : null,
            };

            console.log('📤 Enviando avance a bitácora:', payload);
            const { error } = await supabase.from('bitacora_ordenes').insert(payload);
            
            if (error) {
                console.error('❌ Error Supabase (bitacora):', error);
                throw new Error(error.message || 'Error desconocido al insertar en bitacora_ordenes');
            }

            if (repuestos.length > 0) {
                const repuestosPayload = repuestos.map((r: any) => ({
                    orden_id: orderId,
                    producto_id: r.id,
                    cantidad: r.cantidad,
                    precio_unitario: r.precio_venta
                }));
                const { error: repError } = await supabase.from('orden_repuestos').insert(repuestosPayload);
                if (repError) {
                    console.error('❌ Error guardando repuestos en orden_repuestos:', repError);
                }
            }

            // AUMENTAR TOTAL DE LA ORDEN
            const sumMaterialesExtra = repuestos.reduce((acc, rep) => acc + (rep.precio_venta * rep.cantidad), 0);
            const sumManual = payload.costo_manual || 0;
            const totalAdicional = sumMaterialesExtra + sumManual;

            if (totalAdicional > 0) {
                const { data: ord } = await supabase.from('ordenes').select('precio_total, subtotal, iva').eq('id', orderId).single();
                if (ord) {
                    const tieneIva = (ord.iva || 0) > 0;
                    const newSubtotal = (ord.subtotal || 0) + totalAdicional;
                    const newIva = tieneIva ? Math.round(newSubtotal * 0.19) : 0;
                    const newTotal = tieneIva ? newSubtotal + newIva : ((ord.precio_total || 0) + totalAdicional);
                    
                    await supabase.from('ordenes').update({
                        subtotal: newSubtotal,
                        iva: newIva,
                        precio_total: newTotal
                    }).eq('id', orderId);
                }
            }

            // Si hay repuestos del inventario, descontar stock
            for (const rep of repuestos) {
                console.log(`📉 Descontando stock de ${rep.nombre}: -${rep.cantidad}`);
                const { error: stockError } = await supabase.from('productos')
                    .update({ stock_actual: Math.max(0, rep.stock_actual - rep.cantidad) })
                    .eq('id', rep.id);
                
                if (stockError) console.error('⚠️ Error al actualizar stock:', stockError);
                
                const { error: movError } = await supabase.from('movimientos_inventario').insert({
                    taller_id: user.tallerId,
                    producto_id: rep.id,
                    tipo_movimiento: 'SALIDA',
                    cantidad: rep.cantidad,
                    nota: `Despacho en bitácora (Orden #${orderId})`,
                    fecha: new Date().toISOString(),
                    usuario_id: user.id,
                });
                
                if (movError) console.error('⚠️ Error al registrar movimiento:', movError);
            }

            toast.success('✅ Avance registrado en la bitácora.');
            onSaved?.();
            handleClose();
        } catch (err: any) {
            console.error('❌ Error detallado:', err);
            toast.error(`Error: ${err.message || 'No se pudo guardar el avance'}`);
        } finally {
            setIsSaving(false);
        }
    };

    return (
        <Dialog open={isOpen} onOpenChange={handleClose}>
            <DialogContent className="max-w-lg w-full bg-white dark:bg-slate-900 border border-slate-200 dark:border-slate-700 p-0 gap-0 rounded-2xl overflow-hidden shadow-2xl">
                <DialogHeader className="px-6 pt-6 pb-4 border-b border-slate-100 dark:border-slate-800">
                    <DialogTitle className="text-lg font-black text-slate-900 dark:text-white flex items-center gap-2">
                        ➕ Añadir Avance a la Bitácora
                    </DialogTitle>
                    <p className="text-sm text-slate-500">Registra notas, evidencias o alertas del proceso de reparación.</p>
                </DialogHeader>

                {/* Tabs */}
                <div className="flex gap-2 px-6 pt-5 pb-4 overflow-x-auto">
                    {TABS.map(tab => (
                        <button
                            key={tab.id}
                            type="button"
                            onClick={() => setActiveTab(tab.id)}
                            className={`flex items-center gap-1.5 px-3 py-2 rounded-xl border-2 text-sm font-bold whitespace-nowrap transition-all ${
                                activeTab === tab.id ? tab.activeColor : tab.color + ' hover:bg-slate-50'
                            }`}
                        >
                            {tab.icon}
                            {tab.label}
                        </button>
                    ))}
                </div>

                {/* Content */}
                <div className="px-6 pb-4 space-y-4 max-h-[60vh] overflow-y-auto">
                    {/* Textarea para nota, evidencia, alerta */}
                    {activeTab !== 'repuesto' && (
                        <div>
                            <textarea
                                value={contenido}
                                onChange={e => setContenido(e.target.value)}
                                placeholder={
                                    activeTab === 'nota' ? 'Escribe una nota sobre el avance del trabajo...'
                                    : activeTab === 'evidencia' ? 'Describe brevemente la evidencia que estás adjuntando...'
                                    : '⚠️ Describe el problema encontrado o el retraso...'
                                }
                                rows={4}
                                className={`w-full p-4 rounded-xl border text-sm font-medium resize-y outline-none focus:ring-2 transition-all text-slate-800 dark:text-white dark:bg-slate-800 ${
                                    activeTab === 'alerta'
                                        ? 'border-orange-300 bg-orange-50 dark:bg-orange-950/20 focus:ring-orange-500/20 placeholder:text-orange-400'
                                        : 'border-slate-200 dark:border-slate-700 bg-white focus:ring-blue-500/20 placeholder:text-slate-400'
                                }`}
                            />
                            {activeTab === 'alerta' && (
                                <p className="text-xs text-orange-600 mt-1 font-semibold">
                                    ⚠️ Esta alerta será visible en el tracking del cliente.
                                </p>
                            )}
                        </div>
                    )}

                    {/* Subida de fotos para evidencia */}
                    {activeTab === 'evidencia' && (
                        <div className="space-y-3">
                            <label className="flex items-center justify-center gap-2 w-full border-2 border-dashed border-violet-300 bg-violet-50 dark:bg-violet-950/20 rounded-xl p-4 cursor-pointer hover:bg-violet-100 transition-colors text-violet-700 font-semibold">
                                {isUploading
                                    ? <><Loader2 className="w-5 h-5 animate-spin" /> Subiendo...</>
                                    : <><Upload className="w-5 h-5" /> Subir foto / Tomar evidencia</>
                                }
                                <input
                                    ref={fileInputRef}
                                    type="file"
                                    accept="image/*"
                                    multiple
                                    capture="environment"
                                    className="hidden"
                                    onChange={e => handleFileUpload(e.target.files)}
                                />
                            </label>
                            {uploadedUrls.length > 0 && (
                                <div className="grid grid-cols-3 gap-2">
                                    {uploadedUrls.map((url, i) => (
                                        <div key={i} className="relative aspect-square rounded-lg overflow-hidden bg-slate-100 border border-slate-200 group">
                                            <img src={url} className="w-full h-full object-cover" alt={`evidencia-${i}`} />
                                            <button
                                                type="button"
                                                onClick={() => setUploadedUrls(prev => prev.filter((_, idx) => idx !== i))}
                                                className="absolute top-1 right-1 bg-red-500 text-white rounded-md p-0.5 opacity-0 group-hover:opacity-100 transition-opacity"
                                            >
                                                <X className="w-3 h-3" />
                                            </button>
                                        </div>
                                    ))}
                                </div>
                            )}
                        </div>
                    )}

                    {/* Repuesto: BuscadorInventario (inventario activo) + Manual (siempre) */}
                    {activeTab === 'repuesto' && (
                        <div className="space-y-4">
                            {hasInventario && (
                                <BuscadorInventario onChange={setRepuestos} />
                            )}
                            
                            <div className="border-t border-slate-100 dark:border-slate-800 pt-4">
                                <p className="text-xs text-slate-400 uppercase font-bold tracking-wider mb-3">{hasInventario ? 'Pieza no registrada en inventario' : 'Registrar repuesto externo'}</p>
                                <div className="grid grid-cols-2 gap-3">
                                    <div>
                                        <label className="text-xs font-semibold text-slate-600 dark:text-slate-300 mb-1 block">Nombre pieza</label>
                                        <input
                                            type="text"
                                            value={piezaManual}
                                            onChange={e => setPiezaManual(e.target.value)}
                                            placeholder="Ej: Filtro de aceite"
                                            className="w-full h-10 px-3 text-sm border border-slate-200 dark:border-slate-700 rounded-lg bg-white dark:bg-slate-800 text-slate-800 dark:text-white outline-none focus:ring-2 focus:ring-emerald-500/20"
                                        />
                                    </div>
                                    <div>
                                        <label className="text-xs font-semibold text-slate-600 dark:text-slate-300 mb-1 block">Costo ($)</label>
                                        <input
                                            type="text"
                                            inputMode="numeric"
                                            value={costoManual}
                                            onChange={e => setCostoManual(e.target.value)}
                                            placeholder="Ej: 15.000"
                                            className="w-full h-10 px-3 text-sm border border-slate-200 dark:border-slate-700 rounded-lg bg-white dark:bg-slate-800 text-slate-800 dark:text-white outline-none focus:ring-2 focus:ring-emerald-500/20"
                                        />
                                    </div>
                                </div>
                            </div>
                        </div>
                    )}
                </div>

                {/* Footer */}
                <div className="px-6 py-4 border-t border-slate-100 dark:border-slate-800 flex gap-3 justify-end">
                    <Button variant="outline" onClick={handleClose} disabled={isSaving} className="border-slate-200 text-slate-600">
                        Cancelar
                    </Button>
                    <Button
                        onClick={handleSave}
                        disabled={isSaving}
                        className={`font-bold text-white ${
                            activeTab === 'alerta' ? 'bg-orange-500 hover:bg-orange-600'
                            : activeTab === 'evidencia' ? 'bg-violet-600 hover:bg-violet-700'
                            : activeTab === 'repuesto' ? 'bg-emerald-600 hover:bg-emerald-700'
                            : 'bg-blue-600 hover:bg-blue-700'
                        }`}
                    >
                        {isSaving ? <><Loader2 className="w-4 h-4 mr-2 animate-spin" />Guardando...</> : <><CheckCircle className="w-4 h-4 mr-2" />Guardar Avance</>}
                    </Button>
                </div>
            </DialogContent>
        </Dialog>
    );
}
