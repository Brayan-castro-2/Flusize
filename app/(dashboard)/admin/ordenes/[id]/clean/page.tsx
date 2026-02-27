'use client';

import { useEffect, useState, useCallback } from 'react';
import { useSearchParams, useRouter } from 'next/navigation';
import { useAuth } from '@/contexts/auth-context';
import { obtenerOrdenPorId, buscarVehiculoPorPatente } from '@/lib/local-storage-service';
import { actualizarOrden } from '@/lib/storage-adapter';
import { OrdenDB, VehiculoDB } from '@/lib/supabase';
import { Card, CardContent, CardHeader, CardTitle } from '@/components/ui/card';
import { Button } from '@/components/ui/button';
import { Badge } from '@/components/ui/badge';
import { Input } from '@/components/ui/input';
import { Label } from '@/components/ui/label';
import {
    Loader2, Printer, FileText, ArrowLeft, Wrench,
    CheckCircle2, Play, ClipboardCheck, Package,
    CreditCard, Banknote, Building2, DollarSign, AlertTriangle
} from 'lucide-react';
import Link from 'next/link';
import ChecklistForm from '@/components/ordenes/checklist-form';
import { Dialog, DialogContent, DialogHeader, DialogTitle } from '@/components/ui/dialog';

// ─── Estado Badges ────────────────────────────────────────────────────────────
function EstadoBadge({ estado }: { estado: string }) {
    const map: Record<string, string> = {
        pendiente: 'bg-yellow-500/20 text-yellow-300 border-yellow-500/40',
        en_proceso: 'bg-blue-500/20 text-blue-300 border-blue-500/40',
        completada: 'bg-emerald-500/20 text-emerald-300 border-emerald-500/40',
        entregada: 'bg-purple-500/20 text-purple-300 border-purple-500/40',
        cancelada: 'bg-red-500/20 text-red-300 border-red-500/40',
        debe: 'bg-orange-500/20 text-orange-300 border-orange-500/40',
    };
    const label: Record<string, string> = {
        pendiente: 'Pendiente',
        en_proceso: 'En Proceso',
        completada: 'Listo / Terminado',
        entregada: 'Entregada',
        cancelada: 'Cancelada',
        debe: 'Deudor',
    };
    const classes = map[estado] || 'bg-slate-700 text-slate-300 border-slate-600';
    return (
        <Badge className={`border text-sm font-semibold px-3 py-1 ${classes}`}>
            {label[estado] || estado}
        </Badge>
    );
}

// ─── Módulo Financiero ─────────────────────────────────────────────────────────
interface ModuloFinancieroProps {
    orden: OrdenDB;
    onSave: (updates: Partial<OrdenDB>) => Promise<void>;
    saving: boolean;
}

function ModuloFinanciero({ orden, onSave, saving }: ModuloFinancieroProps) {
    const [modoIVA, setModoIVA] = useState(!!orden.iva && orden.iva > 0);
    const [precioNeto, setPrecioNeto] = useState(
        orden.subtotal ?? orden.precio_total ?? 0
    );
    const [metodoPago, setMetodoPago] = useState<string>(orden.metodo_pago || '');
    const [esDeudor, setEsDeudor] = useState(orden.estado === 'debe');

    const iva = modoIVA ? Math.round(precioNeto * 0.19) : 0;
    const total = precioNeto + iva;

    const handleGuardar = async () => {
        const nuevoEstado = esDeudor ? 'debe' : orden.estado === 'debe' ? 'completada' : orden.estado;
        await onSave({
            precio_total: total,
            subtotal: precioNeto,
            iva: modoIVA ? iva : 0,
            metodo_pago: metodoPago,
            estado: nuevoEstado as OrdenDB['estado'],
        });
    };

    return (
        <Card className="bg-slate-800/50 border-slate-700/50">
            <CardHeader className="pb-2">
                <CardTitle className="text-white flex items-center gap-2">
                    <DollarSign className="w-5 h-5 text-emerald-400" />
                    Módulo Financiero
                </CardTitle>
            </CardHeader>
            <CardContent className="space-y-5">
                {/* Precio Neto */}
                <div className="space-y-2">
                    <Label className="text-slate-400">Precio Total (Neto)</Label>
                    <div className="relative">
                        <span className="absolute left-4 top-1/2 -translate-y-1/2 text-slate-400 font-bold">$</span>
                        <Input
                            type="number"
                            value={precioNeto}
                            onChange={e => setPrecioNeto(Number(e.target.value))}
                            className="pl-8 bg-slate-900 border-slate-700 text-white text-lg font-bold"
                            placeholder="0"
                        />
                    </div>
                </div>

                {/* Toggle IVA */}
                <div
                    onClick={() => setModoIVA(v => !v)}
                    className={`flex items-center justify-between p-4 rounded-xl border cursor-pointer transition-all ${modoIVA
                        ? 'bg-blue-600/10 border-blue-500/50'
                        : 'bg-slate-900/50 border-slate-700 hover:border-slate-600'
                        }`}
                >
                    <div className="flex items-center gap-3">
                        <div className={`p-2 rounded-lg ${modoIVA ? 'bg-blue-600 text-white' : 'bg-slate-700 text-slate-400'}`}>
                            <Building2 className="w-4 h-4" />
                        </div>
                        <div>
                            <p className="text-sm font-semibold text-slate-200">Incluir IVA (19%)</p>
                            <p className="text-xs text-slate-500">Para clientes empresa / Enterprise</p>
                        </div>
                    </div>
                    <div className={`w-12 h-7 rounded-full p-1 transition-colors ${modoIVA ? 'bg-blue-600' : 'bg-slate-700'}`}>
                        <div className={`w-5 h-5 rounded-full bg-white shadow-sm transition-transform ${modoIVA ? 'translate-x-5' : 'translate-x-0'}`} />
                    </div>
                </div>

                {/* Resumen */}
                <div className="bg-slate-900/70 rounded-xl p-4 space-y-2 border border-slate-800">
                    <div className="flex justify-between text-slate-400 text-sm">
                        <span>Subtotal (Neto)</span>
                        <span>${precioNeto.toLocaleString('es-CL')}</span>
                    </div>
                    {modoIVA && (
                        <div className="flex justify-between text-slate-400 text-sm">
                            <span>IVA (19%)</span>
                            <span>${iva.toLocaleString('es-CL')}</span>
                        </div>
                    )}
                    <div className="flex justify-between text-white font-bold text-lg border-t border-slate-700 pt-2">
                        <span>Total a Pagar</span>
                        <span className="text-emerald-400">${total.toLocaleString('es-CL')}</span>
                    </div>
                </div>

                {/* Métodos de Pago */}
                <div className="space-y-2">
                    <Label className="text-slate-400">Método de Pago</Label>
                    <div className="grid grid-cols-3 gap-2">
                        {[
                            { key: 'efectivo', label: 'Efectivo', icon: Banknote },
                            { key: 'tarjeta', label: 'Tarjeta', icon: CreditCard },
                            { key: 'transferencia', label: 'Transferencia', icon: Building2 },
                        ].map(({ key, label, icon: Icon }) => (
                            <button
                                key={key}
                                type="button"
                                onClick={() => setMetodoPago(prev => prev === key ? '' : key)}
                                className={`flex flex-col items-center gap-1 p-3 rounded-xl border text-sm font-medium transition-all ${metodoPago === key
                                    ? 'bg-emerald-600/20 border-emerald-500 text-emerald-300'
                                    : 'bg-slate-900/50 border-slate-700 text-slate-400 hover:border-slate-500'
                                    }`}
                            >
                                <Icon className="w-5 h-5" />
                                <span>{label}</span>
                            </button>
                        ))}
                    </div>
                </div>

                {/* Estado Deudor */}
                <div
                    onClick={() => setEsDeudor(v => !v)}
                    className={`flex items-center justify-between p-4 rounded-xl border cursor-pointer transition-all ${esDeudor
                        ? 'bg-orange-600/10 border-orange-500/50'
                        : 'bg-slate-900/50 border-slate-700 hover:border-slate-600'
                        }`}
                >
                    <div className="flex items-center gap-3">
                        <div className={`p-2 rounded-lg ${esDeudor ? 'bg-orange-600 text-white' : 'bg-slate-700 text-slate-400'}`}>
                            <AlertTriangle className="w-4 h-4" />
                        </div>
                        <div>
                            <p className="text-sm font-semibold text-slate-200">Marcar como Deudor</p>
                            <p className="text-xs text-slate-500">El cliente tiene pago pendiente</p>
                        </div>
                    </div>
                    <div className={`w-12 h-7 rounded-full p-1 transition-colors ${esDeudor ? 'bg-orange-600' : 'bg-slate-700'}`}>
                        <div className={`w-5 h-5 rounded-full bg-white shadow-sm transition-transform ${esDeudor ? 'translate-x-5' : 'translate-x-0'}`} />
                    </div>
                </div>

                <Button
                    onClick={handleGuardar}
                    disabled={saving}
                    className="w-full h-12 bg-emerald-600 hover:bg-emerald-500 text-white font-bold rounded-xl"
                >
                    {saving ? <Loader2 className="w-4 h-4 animate-spin mr-2" /> : null}
                    Guardar Información Financiera
                </Button>
            </CardContent>
        </Card>
    );
}

// ─── Página Principal ──────────────────────────────────────────────────────────
export default function OrdenDetailCleanPage() {
    const searchParams = useSearchParams();
    const router = useRouter();
    const orderId = searchParams.get('id') as string;

    const { user, isLoading: authLoading } = useAuth();

    const [order, setOrder] = useState<OrdenDB | null>(null);
    const [vehiculo, setVehiculo] = useState<VehiculoDB | null>(null);
    const [isLoading, setIsLoading] = useState(true);
    const [saving, setSaving] = useState(false);

    // Modales Checklist
    const [showChecklistModal, setShowChecklistModal] = useState(false);
    const [checklistMode, setChecklistMode] = useState<'checklist' | 'salida'>('checklist');

    const loadData = useCallback(async () => {
        if (!orderId) return;
        setIsLoading(true);
        const ordenData = await obtenerOrdenPorId(orderId);
        setOrder(ordenData);
        if (ordenData?.patente_vehiculo) {
            const veh = await buscarVehiculoPorPatente(ordenData.patente_vehiculo);
            setVehiculo(veh);
        }
        setIsLoading(false);
    }, [orderId]);

    useEffect(() => {
        if (authLoading) return;
        if (!user) { router.push('/login'); return; }
        loadData();
    }, [authLoading, user, router, loadData]);

    const handleUpdateOrden = async (updates: Partial<OrdenDB>) => {
        if (!orderId) return;
        setSaving(true);
        try {
            const updated = await actualizarOrden(orderId, updates);
            if (updated) setOrder(updated);
            else loadData();
        } catch (e) {
            console.error(e);
        } finally {
            setSaving(false);
        }
    };

    const handleCambiarEstado = async (nuevoEstado: OrdenDB['estado']) => {
        await handleUpdateOrden({ estado: nuevoEstado });
    };

    const handlePrint = () => window.open(`/print/orden/${orderId}`, '_blank');
    const handleTicket = () => window.open(`/print/ticket/${orderId}`, '_blank');

    if (authLoading || isLoading) {
        return (
            <div className="flex items-center justify-center py-20">
                <Loader2 className="w-8 h-8 animate-spin text-blue-500" />
                <span className="ml-3 text-slate-400">Cargando orden...</span>
            </div>
        );
    }

    if (!order) {
        return (
            <div className="text-center py-12">
                <p className="text-slate-400 mb-4">Orden no encontrada</p>
                <Link href="/admin/ordenes">
                    <Button variant="outline" className="border-slate-600 text-slate-300">
                        Volver a órdenes
                    </Button>
                </Link>
            </div>
        );
    }

    return (
        <>
            <div className="space-y-6 max-w-3xl mx-auto pb-32">
                {/* ── HEADER ── */}
                <div className="flex items-start justify-between gap-4">
                    <div className="flex items-center gap-3">
                        <Link href="/admin/ordenes">
                            <Button variant="ghost" size="icon" className="text-slate-400 hover:text-white hover:bg-slate-800 rounded-xl">
                                <ArrowLeft className="w-5 h-5" />
                            </Button>
                        </Link>
                        <div>
                            <h1 className="text-xl md:text-2xl font-bold text-white">
                                Orden {order.numero_orden ? `#${order.numero_orden}` : `#${order.id.slice(0, 8).toUpperCase()}`}
                            </h1>
                            <p className="text-sm text-slate-400">
                                {new Date(order.fecha_ingreso).toLocaleString('es-CL')}
                            </p>
                        </div>
                    </div>
                    <div className="flex gap-2 flex-shrink-0">
                        {['superadmin', 'taller_admin', 'admin'].includes((user as any)?.role || (user as any)?.rol || '') && (
                            <Button
                                onClick={handleTicket}
                                className="bg-slate-700 hover:bg-slate-600 text-white border-0 rounded-xl font-semibold"
                            >
                                <FileText className="w-4 h-4 mr-1.5" />
                                <span className="hidden sm:inline">Boleta</span>
                            </Button>
                        )}
                        <Button
                            onClick={handlePrint}
                            className="bg-slate-700 hover:bg-slate-600 text-white border-0 rounded-xl font-semibold"
                        >
                            <Printer className="w-4 h-4 mr-1.5" />
                            <span className="hidden sm:inline">Imprimir</span>
                        </Button>
                    </div>
                </div>

                {/* ── RESUMEN ── */}
                <Card className="bg-slate-800/50 border-slate-700/50">
                    <CardHeader className="pb-2">
                        <CardTitle className="text-white flex items-center justify-between">
                            <span>Resumen de Orden</span>
                            <EstadoBadge estado={order.estado} />
                        </CardTitle>
                    </CardHeader>
                    <CardContent className="space-y-3">
                        <div className="grid grid-cols-2 gap-x-4 gap-y-3">
                            <div>
                                <p className="text-xs text-slate-500 mb-0.5">Patente</p>
                                <p className="font-mono font-bold text-white text-lg">{order.patente_vehiculo}</p>
                            </div>
                            <div>
                                <p className="text-xs text-slate-500 mb-0.5">Vehículo</p>
                                <p className="text-white">{vehiculo ? `${vehiculo.marca} ${vehiculo.modelo} (${vehiculo.anio})` : '-'}</p>
                            </div>
                            {order.cliente_nombre && (
                                <div>
                                    <p className="text-xs text-slate-500 mb-0.5">Cliente</p>
                                    <p className="text-white">{order.cliente_nombre}</p>
                                </div>
                            )}
                            {order.cliente_telefono && (
                                <div>
                                    <p className="text-xs text-slate-500 mb-0.5">Teléfono</p>
                                    <p className="text-white">{order.cliente_telefono}</p>
                                </div>
                            )}
                        </div>
                        <div className="pt-2 border-t border-slate-700/50">
                            <p className="text-xs text-slate-500 mb-1">Motivo / Descripción</p>
                            <p className="text-slate-200 whitespace-pre-wrap">{order.descripcion_ingreso}</p>
                        </div>
                        {order.diagnostico && (
                            <div>
                                <p className="text-xs text-slate-500 mb-1">Diagnóstico</p>
                                <p className="text-slate-200 whitespace-pre-wrap">{order.diagnostico}</p>
                            </div>
                        )}
                    </CardContent>
                </Card>

                {/* ── MÓDULO FINANCIERO ── */}
                <ModuloFinanciero orden={order} onSave={handleUpdateOrden} saving={saving} />
            </div>

            {/* ── BARRA DE ACCIONES FLOTANTE (Flujo de Trabajo) ── */}
            <div className="fixed bottom-0 left-0 right-0 z-50 p-4 bg-slate-950/95 backdrop-blur-md border-t border-slate-800">
                <div className="max-w-3xl mx-auto">
                    <p className="text-xs text-slate-500 text-center mb-3 font-semibold uppercase tracking-wider">Flujo de Trabajo</p>
                    <div className="grid grid-cols-2 md:grid-cols-4 gap-2">
                        {/* Ver Checklist */}
                        <Button
                            onClick={() => { setChecklistMode('checklist'); setShowChecklistModal(true); }}
                            className="bg-slate-800 hover:bg-slate-700 text-white border border-slate-700 rounded-xl h-auto py-3 flex flex-col gap-1"
                        >
                            <ClipboardCheck className="w-5 h-5 text-blue-400" />
                            <span className="text-xs font-medium">Ver Checklist</span>
                        </Button>

                        {/* Empezar Reparación */}
                        <Button
                            onClick={() => handleCambiarEstado('en_proceso')}
                            disabled={saving || order.estado === 'en_proceso'}
                            className={`border rounded-xl h-auto py-3 flex flex-col gap-1 ${order.estado === 'en_proceso'
                                ? 'bg-blue-800/40 border-blue-600/50 text-blue-300 cursor-default'
                                : 'bg-slate-800 hover:bg-blue-900 text-white border-slate-700'
                                }`}
                        >
                            <Play className="w-5 h-5 text-blue-400" />
                            <span className="text-xs font-medium">
                                {order.estado === 'en_proceso' ? '✓ En Proceso' : 'Empezar'}
                            </span>
                        </Button>

                        {/* Terminar Trabajo */}
                        <Button
                            onClick={() => handleCambiarEstado('completada')}
                            disabled={saving || order.estado === 'completada' || order.estado === 'entregada'}
                            className={`border rounded-xl h-auto py-3 flex flex-col gap-1 ${['completada', 'entregada'].includes(order.estado)
                                ? 'bg-emerald-800/40 border-emerald-600/50 text-emerald-300 cursor-default'
                                : 'bg-slate-800 hover:bg-emerald-900 text-white border-slate-700'
                                }`}
                        >
                            <CheckCircle2 className="w-5 h-5 text-emerald-400" />
                            <span className="text-xs font-medium">
                                {['completada', 'entregada'].includes(order.estado) ? '✓ Listo' : 'Terminado'}
                            </span>
                        </Button>

                        {/* Checklist Salida / Entrega */}
                        <Button
                            onClick={() => { setChecklistMode('salida'); setShowChecklistModal(true); }}
                            className="bg-purple-900/50 hover:bg-purple-800 text-purple-200 border border-purple-700/50 rounded-xl h-auto py-3 flex flex-col gap-1"
                        >
                            <Package className="w-5 h-5 text-purple-400" />
                            <span className="text-xs font-medium">Entregar</span>
                        </Button>
                    </div>
                </div>
            </div>

            {/* ── MODAL CHECKLIST ── */}
            <Dialog open={showChecklistModal} onOpenChange={setShowChecklistModal}>
                <DialogContent className="bg-slate-900 border-slate-700 max-w-2xl max-h-[90vh] overflow-y-auto">
                    <DialogHeader>
                        <DialogTitle className="text-white flex items-center gap-2">
                            <Wrench className="w-5 h-5 text-blue-400" />
                            {checklistMode === 'salida' ? 'Checklist de Salida / Entrega' : 'Checklist de Ingreso'}
                        </DialogTitle>
                    </DialogHeader>
                    {orderId && (
                        <ChecklistForm
                            orderId={orderId}
                            mode={checklistMode}
                            onClose={() => {
                                setShowChecklistModal(false);
                                if (checklistMode === 'salida') {
                                    handleCambiarEstado('entregada');
                                }
                                loadData();
                            }}
                        />
                    )}
                </DialogContent>
            </Dialog>
        </>
    );
}
