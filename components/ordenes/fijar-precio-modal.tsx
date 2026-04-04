'use client';

import { useState, useEffect } from 'react';
import { Dialog, DialogContent, DialogTitle } from '@/components/ui/dialog';
import { Button } from '@/components/ui/button';
import { Input } from '@/components/ui/input';
import { Label } from '@/components/ui/label';
import { supabase } from '@/lib/supabase';
import { toast } from 'sonner';
import { DollarSign, CheckCircle, Loader2, AlertCircle, CreditCard, Banknote, Smartphone, MoreHorizontal, AlertTriangle, BadgeX } from 'lucide-react';
import { VisuallyHidden } from '@radix-ui/react-visually-hidden';

interface Props {
    isOpen: boolean;
    onClose: () => void;
    order: any;
    onSaved: () => void;
}

type MetodoPago = 'transferencia' | 'efectivo' | 'tarjeta' | 'otros';

const METODOS: { key: MetodoPago; label: string; icon: React.ReactNode; color: string; activeColor: string }[] = [
    {
        key: 'transferencia',
        label: 'Transferencia',
        icon: <Smartphone className="w-4 h-4" />,
        color: 'border-blue-200 text-blue-700 hover:bg-blue-50',
        activeColor: 'bg-blue-600 text-white border-blue-600 hover:bg-blue-700',
    },
    {
        key: 'efectivo',
        label: 'Efectivo',
        icon: <Banknote className="w-4 h-4" />,
        color: 'border-emerald-200 text-emerald-700 hover:bg-emerald-50',
        activeColor: 'bg-emerald-600 text-white border-emerald-600 hover:bg-emerald-700',
    },
    {
        key: 'tarjeta',
        label: 'Tarjeta',
        icon: <CreditCard className="w-4 h-4" />,
        color: 'border-violet-200 text-violet-700 hover:bg-violet-50',
        activeColor: 'bg-violet-600 text-white border-violet-600 hover:bg-violet-700',
    },
    {
        key: 'otros',
        label: 'Otros',
        icon: <MoreHorizontal className="w-4 h-4" />,
        color: 'border-slate-200 text-slate-600 hover:bg-slate-50',
        activeColor: 'bg-slate-700 text-white border-slate-700 hover:bg-slate-800',
    },
];

export function FijarPrecioModal({ isOpen, onClose, order, onSaved }: Props) {
    const [precioTotal, setPrecioTotal] = useState<string>('');
    const [metodosSeleccionados, setMetodosSeleccionados] = useState<MetodoPago[]>(['transferencia']);
    const [montoPagado, setMontoPagado] = useState<string>('');
    const [tieneDeuda, setTieneDeuda] = useState(false);
    const [isSaving, setIsSaving] = useState(false);
    const [costoMateriales, setCostoMateriales] = useState(0);
    const [sumarIva, setSumarIva] = useState(false);

    const baseTotal = Number(precioTotal) || 0;
    const iva = sumarIva ? Math.round(baseTotal * 0.19) : 0;
    const finalTotal = baseTotal + iva;
    
    const pagado = Number(montoPagado) || 0;
    const deuda = Math.max(0, finalTotal - pagado);
    const pagoCompleto = pagado >= finalTotal && finalTotal > 0;

    useEffect(() => {
        if (order) {
            const isIva = (order.iva || 0) > 0;
            const precio = isIva ? (order.subtotal?.toString() || '') : (order.precio_total?.toString() || '');
            setPrecioTotal(precio);
            setSumarIva(isIva);
            
            const totalToPay = isIva ? (Number(precio) + Math.round(Number(precio) * 0.19)) : Number(precio);
            setMontoPagado(totalToPay.toString()); // por defecto, paga todo
            setTieneDeuda(false);

            // parse existing metodo_pago
            const mp = order.metodo_pago || 'transferencia';
            const metodosExistentes = METODOS.map(m => m.key).filter(k => mp.includes(k)) as MetodoPago[];
            setMetodosSeleccionados(metodosExistentes.length > 0 ? metodosExistentes : ['transferencia']);

            fetchCostoMateriales();
        }
    }, [order]);

    // Sync deuda toggle con montos
    useEffect(() => {
        if (!tieneDeuda) {
            setMontoPagado(finalTotal.toString());
        }
    }, [tieneDeuda, finalTotal]);

    const fetchCostoMateriales = async () => {
        if (!order?.id) return;
        try {
            let totalMateriales = 0;

            const { data: repData, error: repError } = await supabase
                .from('orden_repuestos')
                .select('subtotal')
                .eq('orden_id', order.id);

            if (!repError && repData) {
                totalMateriales += repData.reduce((acc, curr) => acc + (curr.subtotal || 0), 0);
            }

            const { data: bitData, error: bitError } = await supabase
                .from('bitacora_ordenes')
                .select('repuestos, costo_manual')
                .eq('orden_id', order.id);

            if (!bitError && bitData) {
                bitData.forEach(bit => {
                    if (bit.costo_manual) {
                        totalMateriales += parseFloat(bit.costo_manual.toString()) || 0;
                    }
                    if (Array.isArray(bit.repuestos)) {
                        bit.repuestos.forEach((r: any) => {
                            totalMateriales += parseFloat(r.subtotal) || 0;
                        });
                    }
                });
            }

            setCostoMateriales(totalMateriales);
        } catch (err: any) {
            console.error('Error fetching materials cost:', err);
        }
    };

    const toggleMetodo = (metodo: MetodoPago) => {
        setMetodosSeleccionados(prev => {
            if (prev.includes(metodo)) {
                // No dejar vacío
                if (prev.length === 1) return prev;
                return prev.filter(m => m !== metodo);
            }
            return [...prev, metodo];
        });
    };

    const handleSave = async () => {
        if (!precioTotal || isNaN(Number(precioTotal)) || finalTotal <= 0) {
            toast.error('Ingresa un precio válido');
            return;
        }

        if (tieneDeuda && pagado <= 0) {
            toast.error('El monto pagado no puede ser $0 si hay pago parcial');
            return;
        }

        setIsSaving(true);
        try {
            // Construir string de metodo_pago
            let metodoPagoStr = metodosSeleccionados.join(', ');
            if (tieneDeuda && deuda > 0) {
                metodoPagoStr += ', debe';
            }

            const { error } = await supabase
                .from('ordenes')
                .update({
                    subtotal: baseTotal,
                    iva: iva,
                    precio_total: finalTotal,
                    metodo_pago: metodoPagoStr,
                    estado: 'completada',
                    fecha_termino: new Date().toISOString(),
                    fecha_entrega: new Date().toISOString(),
                    // guardar monto pagado como nota si hay deuda
                    ...(tieneDeuda && deuda > 0 ? {
                        observaciones_mecanico: [
                            order.observaciones_mecanico,
                            `[DEUDA] Pagó: $${pagado.toLocaleString('es-CL')} | Debe: $${deuda.toLocaleString('es-CL')}`
                        ].filter(Boolean).join('\n')
                    } : {}),
                })
                .eq('id', order.id);

            if (error) throw error;

            if (tieneDeuda && deuda > 0) {
                toast.warning(`Orden finalizada. Cliente debe $${deuda.toLocaleString('es-CL')} — marcado como moroso.`);
            } else {
                toast.success('Orden finalizada y pagada completamente ✓');
            }
            onSaved();
            onClose();
        } catch (err: any) {
            console.error(err);
            toast.error(`Error: ${err.message || 'No se pudo guardar'}`);
        } finally {
            setIsSaving(false);
        }
    };

    return (
        <Dialog open={isOpen} onOpenChange={onClose}>
            <DialogContent className="sm:max-w-[460px] bg-white dark:bg-slate-900 border-slate-200 dark:border-slate-800 p-0 overflow-hidden">
                <VisuallyHidden>
                    <DialogTitle>Finalizar Orden y Cobrar</DialogTitle>
                </VisuallyHidden>

                {/* Header visual */}
                <div className="px-6 pt-6 pb-4 border-b border-slate-100 dark:border-slate-800">
                    <div className="flex items-center gap-3">
                        <div className="w-10 h-10 rounded-xl bg-emerald-100 dark:bg-emerald-900/40 flex items-center justify-center">
                            <DollarSign className="w-5 h-5 text-emerald-600" />
                        </div>
                        <div>
                            <p className="text-lg font-black text-slate-900 dark:text-white leading-none">Finalizar Orden y Cobrar</p>
                            <p className="text-xs text-slate-500 mt-0.5">Registra el pago y cierra la orden</p>
                        </div>
                    </div>
                </div>

                <div className="px-6 pt-4 pb-2 space-y-4 max-h-[85vh] overflow-y-auto overflow-x-hidden">
                    {/* Precio final editable */}
                    <div className="space-y-2">
                        <Label className="text-sm font-bold text-slate-700 dark:text-slate-300">
                            Precio Neto a Cobrar ($)
                        </Label>
                        <Input
                            type="number"
                            value={precioTotal}
                            onChange={(e) => setPrecioTotal(e.target.value)}
                            className="h-12 text-lg font-bold border-2 focus:ring-emerald-500/20 focus:border-emerald-500"
                            placeholder="Ej: 85000"
                        />
                    </div>
                    
                    {/* IVA Toggle */}
                    <div className="flex items-center justify-between p-3 bg-slate-50 dark:bg-slate-800/80 border border-slate-100 dark:border-slate-700 rounded-xl">
                        <span className="text-sm font-bold text-slate-700 dark:text-slate-300">Sumar IVA (19%)</span>
                        <button
                            type="button"
                            onClick={() => setSumarIva(!sumarIva)}
                            className={`relative inline-flex h-6 w-11 items-center rounded-full transition-colors ${sumarIva ? 'bg-emerald-500' : 'bg-slate-200 dark:bg-slate-700'}`}
                        >
                            <span className={`inline-block w-4 h-4 transform bg-white rounded-full transition-transform ${sumarIva ? 'translate-x-6' : 'translate-x-1'}`} />
                        </button>
                    </div>

                    {/* Resumen de costos dinámico */}
                    <div className="bg-slate-50 dark:bg-slate-800/50 rounded-xl border border-slate-100 dark:border-slate-700 divide-y divide-slate-100 dark:divide-slate-700 overflow-hidden">
                        <div className="flex justify-between items-center px-4 py-3 text-sm">
                            <span className="text-slate-500">Costo Materiales:</span>
                            <span className="font-mono font-bold text-slate-700 dark:text-slate-200">${costoMateriales.toLocaleString('es-CL')}</span>
                        </div>
                        <div className="flex justify-between items-center px-4 py-3 text-sm">
                            <span className="text-slate-500">Mano de Obra:</span>
                            <span className="font-mono font-bold text-slate-500">${Math.max(0, baseTotal - costoMateriales).toLocaleString('es-CL')}</span>
                        </div>
                        {sumarIva && (
                            <div className="flex justify-between items-center px-4 py-3 text-sm bg-indigo-50/50 dark:bg-indigo-900/10">
                                <span className="font-bold text-indigo-700 dark:text-indigo-400">IVA (19%):</span>
                                <span className="font-mono font-bold text-indigo-700 dark:text-indigo-400">+ ${iva.toLocaleString('es-CL')}</span>
                            </div>
                        )}
                        <div className="flex justify-between items-center px-4 py-3 bg-emerald-50/50 dark:bg-emerald-900/20">
                            <span className="text-sm font-black text-slate-900 dark:text-white uppercase tracking-wide">Total a Pagar</span>
                            <span className="text-xl font-black text-emerald-600">${finalTotal.toLocaleString('es-CL')}</span>
                        </div>
                    </div>

                    {/* Métodos de pago — multi-select */}
                    <div className="space-y-2">
                        <Label className="text-sm font-bold text-slate-700 dark:text-slate-300">
                            Método(s) de Pago
                            <span className="ml-1.5 text-[10px] font-normal text-slate-400">(selección múltiple)</span>
                        </Label>
                        <div className="grid grid-cols-2 gap-2">
                            {METODOS.map((m) => {
                                const activo = metodosSeleccionados.includes(m.key);
                                return (
                                    <button
                                        key={m.key}
                                        type="button"
                                        onClick={() => toggleMetodo(m.key)}
                                        className={`flex items-center justify-center gap-2 h-11 rounded-xl border-2 font-bold text-sm transition-all duration-150 ${activo ? m.activeColor : m.color} ${activo ? 'ring-2 ring-offset-1 ring-current/30 scale-[1.02]' : ''}`}
                                    >
                                        {m.icon}
                                        {m.label}
                                    </button>
                                );
                            })}
                        </div>
                    </div>

                    {/* Toggle deuda */}
                    <div>
                        <button
                            type="button"
                            onClick={() => setTieneDeuda(prev => !prev)}
                            className={`w-full flex items-center gap-3 px-4 py-3 rounded-xl border-2 font-bold text-sm transition-all duration-200 ${
                                tieneDeuda
                                    ? 'bg-red-50 border-red-400 text-red-700 dark:bg-red-900/20 dark:border-red-600 dark:text-red-400'
                                    : 'bg-slate-50 border-slate-200 text-slate-500 hover:border-red-300 hover:text-red-500 dark:bg-slate-800 dark:border-slate-700'
                            }`}
                        >
                            <div className={`w-5 h-5 rounded flex items-center justify-center flex-shrink-0 border-2 transition-colors ${tieneDeuda ? 'bg-red-500 border-red-500' : 'border-slate-300'}`}>
                                {tieneDeuda && <BadgeX className="w-3.5 h-3.5 text-white" />}
                            </div>
                            <div className="flex-1 text-left">
                                <span>El cliente queda con deuda (moroso)</span>
                                {tieneDeuda && <span className="block text-[10px] font-normal opacity-70 mt-0.5">Ingresa cuánto pagó ahora</span>}
                            </div>
                            {tieneDeuda && <AlertTriangle className="w-4 h-4 flex-shrink-0" />}
                        </button>

                        {/* Panel de deuda */}
                        {tieneDeuda && (
                            <div className="mt-3 p-4 bg-red-50 dark:bg-red-950/20 border border-red-200 dark:border-red-800/50 rounded-xl space-y-3 animate-in slide-in-from-top-2 duration-200">
                                <div className="space-y-1.5">
                                    <Label className="text-xs font-bold text-red-700 dark:text-red-400 uppercase tracking-wide">
                                        Monto pagado ahora ($)
                                    </Label>
                                    <Input
                                        type="number"
                                        value={montoPagado}
                                        onChange={(e) => setMontoPagado(e.target.value)}
                                        className="h-11 font-bold border-2 border-red-300 focus:border-red-500 focus:ring-red-200 bg-white dark:bg-slate-900 text-slate-900 dark:text-white"
                                        placeholder="0"
                                        max={finalTotal}
                                    />
                                </div>

                                {/* Resumen deuda */}
                                <div className="grid grid-cols-2 gap-2 pt-1">
                                    <div className="bg-white dark:bg-slate-900 rounded-lg p-3 border border-red-100 dark:border-red-900/50 text-center">
                                        <p className="text-[10px] text-slate-500 uppercase tracking-wider font-bold">Pagó ahora</p>
                                        <p className="text-base font-black text-emerald-600 mt-0.5">${pagado.toLocaleString('es-CL')}</p>
                                    </div>
                                    <div className="bg-white dark:bg-slate-900 rounded-lg p-3 border border-red-200 dark:border-red-800/50 text-center">
                                        <p className="text-[10px] text-red-500 uppercase tracking-wider font-bold">Queda debiendo</p>
                                        <p className={`text-base font-black mt-0.5 ${deuda > 0 ? 'text-red-600' : 'text-emerald-600'}`}>
                                            ${deuda.toLocaleString('es-CL')}
                                        </p>
                                    </div>
                                </div>

                                {pagoCompleto && (
                                    <p className="text-xs text-emerald-700 dark:text-emerald-400 font-medium text-center bg-emerald-50 dark:bg-emerald-900/20 rounded-lg py-2">
                                        ✓ El monto cubre el total — no quedará deuda
                                    </p>
                                )}
                            </div>
                        )}
                    </div>

                    {/* Aviso */}
                    <div className={`flex items-start gap-2.5 p-3 rounded-xl border text-[11px] leading-snug ${
                        tieneDeuda && deuda > 0
                            ? 'bg-red-50 dark:bg-red-950/20 border-red-200 dark:border-red-800/50 text-red-700 dark:text-red-400'
                            : 'bg-amber-50 dark:bg-amber-950/20 border-amber-100 dark:border-amber-900/50 text-amber-700 dark:text-amber-400'
                    }`}>
                        <AlertCircle className="w-4 h-4 shrink-0 mt-0.5" />
                        <p>
                            {tieneDeuda && deuda > 0
                                ? <>La orden se marcará como <strong>COMPLETADA</strong> y el cliente quedará registrado como <strong>MOROSO</strong> con una deuda de <strong>${deuda.toLocaleString('es-CL')}</strong>.</>
                                : <>Al confirmar, la orden pasará a estado <strong>COMPLETADA</strong> y se registrará la fecha de entrega actual.</>
                            }
                        </p>
                    </div>
                </div>

                {/* Footer */}
                <div className="px-6 py-4 border-t border-slate-100 dark:border-slate-800 flex gap-3">
                    <Button variant="outline" onClick={onClose} disabled={isSaving} className="flex-1 font-bold">
                        Cancelar
                    </Button>
                    <Button
                        onClick={handleSave}
                        disabled={isSaving}
                        className={`flex-[2] font-black ${
                            tieneDeuda && deuda > 0
                                ? 'bg-red-600 hover:bg-red-700 text-white'
                                : 'bg-emerald-600 hover:bg-emerald-700 text-white'
                        }`}
                    >
                        {isSaving ? (
                            <><Loader2 className="w-4 h-4 mr-2 animate-spin" /> Procesando...</>
                        ) : tieneDeuda && deuda > 0 ? (
                            <><BadgeX className="w-4 h-4 mr-2" /> Confirmar (con deuda)</>
                        ) : (
                            <><CheckCircle className="w-4 h-4 mr-2" /> Confirmar y Cerrar</>
                        )}
                    </Button>
                </div>
            </DialogContent>
        </Dialog>
    );
}

