'use client';

import { useEffect, useState } from 'react';
import { useRouter, useSearchParams } from 'next/navigation';
import { useQueryClient } from '@tanstack/react-query';
import { useAuth } from '@/contexts/auth-context';
import { actualizarOrden, buscarVehiculoPorPatente, obtenerOrdenPorId, obtenerPerfiles, obtenerChecklist, type OrdenDB, type VehiculoDB, type PerfilDB } from '@/lib/storage-adapter';
import { useUpdateOrder } from '@/hooks/use-orders';
import { useToast } from '@/components/ui/use-toast';
import { generateOrderPDF } from '@/lib/pdf-generator';
import { Card, CardContent, CardHeader, CardTitle } from '@/components/ui/card';
import { Button } from '@/components/ui/button';
import { Badge } from '@/components/ui/badge';
import { Input } from '@/components/ui/input';
import { Textarea } from '@/components/ui/textarea';
import { Label } from '@/components/ui/label';
import {
    Select,
    SelectContent,
    SelectItem,
    SelectTrigger,
    SelectValue,
} from '@/components/ui/select';
import {
    Dialog,
    DialogContent,
    DialogHeader,
    DialogTitle,
    DialogDescription,
} from '@/components/ui/dialog';
import ChecklistForm from '@/components/ordenes/checklist-form';
import { ArrowLeft, CheckCircle, Download, Loader2, Printer, Save, ClipboardCheck, Eye, CheckCircle2, FileText, AlertCircle, Wrench, Flag } from 'lucide-react';
import Link from 'next/link';

export default function OrdenesCleanPage() {
    const router = useRouter();
    const searchParams = useSearchParams();
    const queryClient = useQueryClient();
    const { user, isLoading: authLoading } = useAuth();
    const updateOrder = useUpdateOrder();
    const { toast } = useToast();

    const orderIdParam = searchParams.get('id');
    const orderId = orderIdParam;

    const [order, setOrder] = useState<OrdenDB | null>(null);
    const [vehiculo, setVehiculo] = useState<VehiculoDB | null>(null);
    const [perfiles, setPerfiles] = useState<PerfilDB[]>([]);
    const [isLoading, setIsLoading] = useState(true);
    const [precioFinal, setPrecioFinal] = useState('');
    const [isSaving, setIsSaving] = useState(false);
    const [saveSuccess, setSaveSuccess] = useState(false);

    const [descripcion, setDescripcion] = useState('');
    const [estado, setEstado] = useState('pendiente');
    const [asignadoA, setAsignadoA] = useState<string>('');
    const [detalleTrabajos, setDetalleTrabajos] = useState('');
    const [kmIngreso, setKmIngreso] = useState<string>('');
    const [kmSalida, setKmSalida] = useState<string>('');
    const [clienteNombre, setClienteNombre] = useState<string>('');
    const [clienteTelefono, setClienteTelefono] = useState<string>('');
    const [metodosPago, setMetodosPago] = useState<Array<{ metodo: string; monto: number }>>([]);

    const canViewPrices = user?.name?.toLowerCase().includes('juan');

    const parsePrecio = (value: string) => {
        const digits = value.replace(/[^0-9]/g, '');
        return digits ? Number(digits) : 0;
    };

    const formatPrecio = (value: number) => {
        return value.toLocaleString('es-CL');
    };

    useEffect(() => {
        if (authLoading) return;
        if (!user) {
            router.push('/login');
        }
    }, [authLoading, user, router]);

    const [showKm, setShowKm] = useState(false);

    const [checklist, setChecklist] = useState<any>(null);

    const [checklistDialog, setChecklistDialog] = useState<{
        open: boolean;
        mode: 'checklist' | 'readonly_ingreso' | 'salida';
    }>({
        open: false,
        mode: 'checklist'
    });

    useEffect(() => {
        if (!orderId) {
            setIsLoading(false);
            setOrder(null);
            setVehiculo(null);
            return;
        }

        const loadData = async () => {
            setIsLoading(true);
            try {
                const [ordenData, perfs, checklistData] = await Promise.all([
                    obtenerOrdenPorId(orderId),
                    obtenerPerfiles(),
                    obtenerChecklist(String(orderId))
                ]);

                setPerfiles(perfs);
                setChecklist(checklistData);

                if (ordenData) {
                    setOrder(ordenData);
                    setPrecioFinal(formatPrecio(ordenData.precio_total || 0));

                    // Clean Description Logic
                    const rawDesc = ordenData.descripcion_ingreso || '';
                    const cleanedDesc = rawDesc.replace(/^Motor:.*?( - |$)/i, '').trim() || rawDesc;
                    setDescripcion(cleanedDesc);

                    setEstado(ordenData.estado);
                    setAsignadoA(ordenData.asignado_a || '');
                    setDetalleTrabajos(ordenData.detalle_trabajos || '');
                    setMetodosPago(ordenData.metodos_pago || []);

                    // KM Logic
                    const kmMatch = rawDesc.match(/KM:\s*(\d+\.?\d*)/);
                    const kmSalidaMatch = rawDesc.match(/→\s*(\d+\.?\d*)/);

                    if (kmMatch) setKmIngreso(kmMatch[1]);
                    if (kmSalidaMatch) setKmSalida(kmSalidaMatch[1]);

                    if (kmMatch || kmSalidaMatch) {
                        setShowKm(true);
                    }

                    // Client Info Logic (Smart Fallback)
                    const veh = await buscarVehiculoPorPatente(ordenData.patente_vehiculo);
                    setVehiculo(veh);

                    setClienteNombre(ordenData.cliente?.nombre_completo || ordenData.cliente_nombre || veh?.clientes?.nombre_completo || '');
                    setClienteTelefono(ordenData.cliente?.telefono || ordenData.cliente_telefono || veh?.clientes?.telefono || '');
                }
            } catch (error) {
                console.error("Error loading order:", error);
            } finally {
                setIsLoading(false);
            }
        };

        loadData();
    }, [orderId]);

    const handlePrint = () => {
        if (!orderId) return;
        window.open(`/print/orden/${orderId}`, '_blank');
    };

    const handleTicket = () => {
        if (!orderId) return;
        window.open(`/print/ticket/${orderId}`, '_blank');
    };

    const handleDownloadPDF = async () => {
        if (!order) return;
        try {
            await generateOrderPDF({
                order,
                vehicle: vehiculo,
                checklist, // New checklist data
                companyInfo: {
                    name: "TALLER MECÁNICO",
                    address: "Av. Principal 123", // TODO: Configurable?
                    phone: "+56 9 1234 5678"
                }
            });
        } catch (error) {
            console.error('Error generando PDF:', error);
            alert('Error al generar el PDF. Por favor intenta nuevamente.');
        }
    };

    const handleGuardarTodo = async () => {
        if (!order) return;
        if (user?.role !== 'admin') return;

        const precio = parsePrecio(precioFinal);
        if (precio < 0) {
            alert('El precio no puede ser negativo');
            return;
        }

        // Validar métodos de pago si hay alguno
        if (metodosPago.length > 0) {
            const totalPagos = metodosPago.reduce((sum, mp) => sum + mp.monto, 0);
            if (totalPagos !== precio) {
                alert(`La suma de los métodos de pago ($${totalPagos.toLocaleString('es-CL')}) debe ser igual al precio total ($${precio.toLocaleString('es-CL')})`);
                return;
            }
        }

        let descripcionActualizada = descripcion;
        if (showKm && kmIngreso && kmSalida) {
            const precioKm = precio > 0 ? precio : 15000;
            descripcionActualizada = `${descripcion}\n\nServicios:\n- KM: ${kmIngreso} KM → ${kmSalida} KM: $${precioKm.toLocaleString('es-CL')}`;
        }

        setIsSaving(true);

        // PREPARAR PAYLOAD: Solo campos que existen en la tabla 'ordenes'
        // Mapeamos metodos_pago (array) a metodo_pago (string) para compatibilidad DB
        const metodoPagoText = metodosPago.map(m => m.metodo).join(', ');

        const updateData: any = {
            descripcion_ingreso: descripcion,
            estado,
            precio_total: parsePrecio(precioFinal),
            metodo_pago: metodoPagoText || null,
            metodos_pago: metodosPago.length > 0 ? metodosPago : null,
            asignado_a: asignadoA || null,
            detalle_trabajos: detalleTrabajos || null,
        };

        // LÓGICA DE FECHAS
        // 1. Si se marca como completada, establecer fecha de salida
        if (estado === 'completada') {
            const now = new Date().toISOString();
            updateData.fecha_salida = now;
        }
        // 2. Si se cambia de completada a pendiente, LIMPIAR fecha de salida
        else if (estado === 'pendiente' && order.estado === 'completada') {
            console.log('🔄 Revertiendo estado a Pendiente: Limpiando fecha de salida');
            updateData.fecha_salida = null;
        }

        console.log('📤 Enviando actualización optimista:', updateData);

        // Actualización Optimista: Feedback visual inmediato
        setSaveSuccess(true);
        setTimeout(() => setSaveSuccess(false), 2500);

        // Opcional: Actualizar el estado local de la página de inmediato
        setOrder(prev => prev ? { ...prev, ...updateData } : null);
        if (updateData.precio_total !== undefined) {
            setPrecioFinal(formatPrecio(updateData.precio_total));
        }

        updateOrder.mutate({ id: order.id, updates: updateData });
        setIsSaving(false);
    };

    const handleUpdateStatus = async (newStatus: 'en_proceso' | 'completada') => {
        if (!order) return;
        setIsSaving(true);
        const now = new Date().toISOString();
        const updateData: any = {
            estado: newStatus,
        };

        if (newStatus === 'completada') {
            updateData.fecha_salida = now;
        }

        // Optimista
        setOrder(prev => prev ? { ...prev, ...updateData } : null);
        setEstado(newStatus);
        setSaveSuccess(true);
        setTimeout(() => setSaveSuccess(false), 2500);

        updateOrder.mutate({ id: order.id, updates: updateData });
        setIsSaving(false);
    };

    const handleMarcarListo = async () => {
        if (!order) return;
        if (user?.role !== 'admin') return;

        setIsSaving(true);
        const now = new Date().toISOString();
        const updateData = {
            estado: 'completada' as const,
            fecha_salida: now,
        };

        // Optimista
        setOrder(prev => prev ? { ...prev, ...updateData } : null);
        setEstado('completada');
        setSaveSuccess(true);
        setTimeout(() => setSaveSuccess(false), 2500);

        updateOrder.mutate({ id: order.id, updates: updateData });
        setIsSaving(false);
    };

    // Checklist Handlers
    const handleOpenChecklist = (mode: 'checklist' | 'readonly_ingreso' | 'salida') => {
        setChecklistDialog({ open: true, mode });
    };

    const handleChecklistClose = async () => {
        setChecklistDialog({ open: false, mode: 'checklist' });
        // Refresh checklist data
        const checklistData = await obtenerChecklist(String(orderId));
        setChecklist(checklistData);
    };

    const handleGeneratePDF = async () => {
        if (!order) return;
        try {
            await generateOrderPDF({
                order,
                vehicle: vehiculo,
                checklist,
                companyInfo: {
                    name: 'ELECTROMECANICA JR. SPA',
                    address: 'A INMAR 2290 L IND SEC 2, PUERTO MONTT',
                    phone: '+56 9 1234 5678'
                }
            });
        } catch (error) {
            console.error('Error generating PDF:', error);
        }
    };

    if (authLoading || isLoading) {
        return (
            <div className="flex items-center justify-center py-20">
                <Loader2 className="w-8 h-8 animate-spin text-blue-500" />
            </div>
        );
    }

    if (!orderId) {
        return (
            <div className="text-center py-12">
                <p className="text-slate-400 mb-4">Selecciona una orden</p>
                <Link href="/admin/ordenes">
                    <Button variant="outline" className="border-slate-300 text-slate-700 hover:bg-slate-900 hover:text-white rounded-xl transition-colors">
                        Volver a órdenes
                    </Button>
                </Link>
            </div>
        );
    }

    if (!order) {
        return (
            <div className="text-center py-12">
                <p className="text-slate-400 mb-4">Orden no encontrada</p>
                <Link href="/admin/ordenes">
                    <Button variant="outline" className="border-slate-300 text-slate-700 hover:bg-slate-900 hover:text-white rounded-xl transition-colors">
                        Volver a órdenes
                    </Button>
                </Link>
            </div>
        );
    }

    return (
        <div className="space-y-6 max-w-3xl mx-auto pb-12">
            {saveSuccess && (
                <div className="fixed top-20 left-4 right-4 md:left-1/2 md:-translate-x-1/2 md:w-auto z-50">
                    <div className="bg-emerald-600 text-white px-6 py-3 rounded-xl shadow-xl flex items-center gap-2">
                        <CheckCircle className="w-5 h-5" />
                        Cambios guardados
                    </div>
                </div>
            )}
            <div className="flex items-center justify-between">
                <div>
                    <h1 className="text-xl md:text-2xl font-bold text-slate-900">Orden #{order.id}</h1>
                    <p className="text-sm text-slate-500">{new Date(order.fecha_ingreso).toLocaleString('es-CL')}</p>
                </div>
                {/* Header Buttons */}
                <div className="flex gap-2">
                    {user?.role === 'admin' && (
                        <Button onClick={handleTicket} className="bg-slate-900 text-white hover:bg-white hover:text-slate-900 border border-slate-900 rounded-xl transition-colors shadow-sm">
                            <Printer className="w-4 h-4 mr-2" />
                            <span className="hidden sm:inline">Boleta/Ticket</span>
                        </Button>
                    )}
                    <Button onClick={handleGeneratePDF} className="bg-slate-900 text-white hover:bg-white hover:text-slate-900 border border-slate-900 rounded-xl transition-colors shadow-sm">
                        <Download className="w-4 h-4 mr-2" />
                        <span className="hidden sm:inline">PDF{checklist ? ' (con Checklist)' : ''}</span>
                        <span className="sm:hidden">PDF</span>
                    </Button>
                    <Button onClick={handlePrint} className="bg-slate-900 text-white hover:bg-white hover:text-slate-900 border border-slate-900 rounded-xl transition-colors shadow-sm">
                        <Printer className="w-4 h-4 mr-2" />
                        <span className="hidden sm:inline">Imprimir Orden</span>
                    </Button>
                </div>
            </div>

            <Card className="bg-white border-slate-200 shadow-sm">
                <CardHeader>
                    <CardTitle className="text-slate-900">Detalles de la Orden</CardTitle>
                </CardHeader>
                <CardContent className="space-y-5">
                    {/* Read-only details */}
                    <div className="flex items-center justify-between">
                        <span className="text-slate-500">Patente</span>
                        <span className="font-mono font-bold text-slate-900">{order.patente_vehiculo}</span>
                    </div>
                    <div className="flex items-center justify-between">
                        <span className="text-slate-500">Vehículo</span>
                        <span className="text-slate-900">{vehiculo ? `${vehiculo.marca} ${vehiculo.modelo}` : '-'}</span>
                    </div>

                    {user?.role === 'admin' && (
                        <div className="grid md:grid-cols-2 gap-4">
                            <div className="space-y-2">
                                <Label className="text-slate-600">Nombre del Cliente</Label>
                                <Input
                                    value={clienteNombre}
                                    onChange={(e) => setClienteNombre(e.target.value)}
                                    className="bg-white border-slate-300 text-slate-900 focus:border-blue-500 rounded-xl"
                                    placeholder="Nombre del cliente"
                                />
                            </div>
                            <div className="space-y-2">
                                <Label className="text-slate-600">Teléfono del Cliente</Label>
                                <Input
                                    value={clienteTelefono}
                                    onChange={(e) => setClienteTelefono(e.target.value)}
                                    className="bg-white border-slate-300 text-slate-900 focus:border-blue-500 rounded-xl"
                                    placeholder="+56 9 1234 5678"
                                />
                            </div>
                        </div>
                    )}

                    {user?.role === 'admin' ? (
                        <>
                            {/* Editor Fields */}
                            <div className="grid md:grid-cols-2 gap-4">
                                <div className="space-y-2">
                                    <Label className="text-slate-600">Estado</Label>
                                    <Select value={estado} onValueChange={setEstado}>
                                        <SelectTrigger className="bg-white border-slate-300 text-slate-900 rounded-xl">
                                            <SelectValue />
                                        </SelectTrigger>
                                        <SelectContent className="bg-white border-slate-200">
                                            <SelectItem value="pendiente" className="text-slate-700 hover:bg-slate-50">Pendiente</SelectItem>
                                            <SelectItem value="completada" className="text-slate-700 hover:bg-slate-50">Completada</SelectItem>
                                        </SelectContent>
                                    </Select>
                                </div>
                                <div className="space-y-2">
                                    <Label className="text-slate-600">Asignado a</Label>
                                    <Select value={asignadoA || 'none'} onValueChange={(v) => setAsignadoA(v === 'none' ? '' : v)}>
                                        <SelectTrigger className="bg-white border-slate-300 text-slate-900 rounded-xl">
                                            <SelectValue placeholder="Seleccionar mecánico" />
                                        </SelectTrigger>
                                        <SelectContent className="bg-white border-slate-200">
                                            <SelectItem value="none" className="text-slate-700">Sin asignar</SelectItem>
                                            {perfiles.filter(p => p.rol === 'mecanico' || p.rol === 'admin').map((perfil) => (
                                                <SelectItem key={perfil.id} value={perfil.id} className="text-slate-700 hover:bg-slate-50">
                                                    {perfil.nombre_completo}
                                                </SelectItem>
                                            ))}
                                        </SelectContent>
                                    </Select>
                                </div>
                            </div>

                            <div className="space-y-4 border-t border-slate-200 pt-4">
                                <div className="flex items-center justify-between">
                                    <Label className="text-slate-600">Control de Kilometraje</Label>
                                    <div className="flex items-center gap-2">
                                        <span className="text-xs text-slate-500">{showKm ? 'Activado' : 'Desactivado'}</span>
                                        <Button
                                            type="button"
                                            variant={showKm ? "default" : "outline"}
                                            size="sm"
                                            onClick={() => setShowKm(!showKm)}
                                            className={showKm ? "bg-blue-600 hover:bg-blue-500 h-7" : "border-slate-300 text-slate-600 h-7"}
                                        >
                                            {showKm ? 'Ocultar' : 'Mostrar'}
                                        </Button>
                                    </div>
                                </div>

                                {showKm && (
                                    <div className="grid md:grid-cols-2 gap-4 animate-in fade-in slide-in-from-top-2">
                                        <div className="space-y-2">
                                            <Label className="text-slate-600">KM Ingreso</Label>
                                            <Input
                                                type="number"
                                                value={kmIngreso}
                                                onChange={(e) => setKmIngreso(e.target.value)}
                                                className="bg-white border-slate-300 text-slate-900 rounded-xl"
                                                placeholder="150000"
                                                min="0"
                                            />
                                        </div>
                                        <div className="space-y-2">
                                            <Label className="text-slate-600">KM Salida</Label>
                                            <Input
                                                type="number"
                                                value={kmSalida}
                                                onChange={(e) => setKmSalida(e.target.value)}
                                                className="bg-white border-slate-300 text-slate-900 rounded-xl"
                                                placeholder="130000"
                                                min="0"
                                            />
                                        </div>
                                    </div>
                                )}
                            </div>

                            <div className="space-y-2">
                                <Label className="text-slate-600">Motivo de Ingreso</Label>
                                <Textarea
                                    value={descripcion}
                                    onChange={(e) => setDescripcion(e.target.value)}
                                    className="min-h-[100px] bg-white border-slate-300 text-slate-900 rounded-xl"
                                    placeholder="Describe el motivo de ingreso del vehículo..."
                                />
                            </div>

                            <div className="space-y-2">
                                <Label className="text-slate-600">Detalle de Trabajos Realizados</Label>
                                <Textarea
                                    value={detalleTrabajos}
                                    onChange={(e) => setDetalleTrabajos(e.target.value)}
                                    className="min-h-[100px] bg-white border-slate-300 text-slate-900 rounded-xl"
                                    placeholder="Describe los trabajos realizados en el vehículo..."
                                />
                            </div>

                            <div className="space-y-2">
                                <Label className="text-slate-600">Precio Total ($)</Label>
                                <Input
                                    value={precioFinal}
                                    onChange={(e) => setPrecioFinal(e.target.value)}
                                    onBlur={() => setPrecioFinal(formatPrecio(parsePrecio(precioFinal)))}
                                    inputMode="numeric"
                                    className="bg-white border-slate-300 text-slate-900 rounded-xl text-lg font-semibold"
                                    placeholder="15000"
                                />
                                <p className="text-xs text-slate-500">Precio en pesos chilenos</p>
                            </div>

                            {/* Métodos de Pago */}
                            <div className="space-y-3 border-t border-slate-200 pt-4">
                                <div className="flex items-center justify-between">
                                    <Label className="text-slate-600 text-base">Métodos de Pago</Label>
                                    <Button
                                        type="button"
                                        size="sm"
                                        onClick={() => setMetodosPago([...metodosPago, { metodo: 'efectivo', monto: 0 }])}
                                        className="bg-slate-600 hover:bg-slate-500 text-white rounded-lg"
                                    >
                                        + Agregar Método
                                    </Button>
                                </div>


                                {metodosPago.length > 0 && (
                                    <div className="space-y-2">
                                        {metodosPago.map((mp, idx) => (
                                            <div key={idx} className="flex gap-2 items-center bg-slate-50 border border-slate-200 p-3 rounded-lg">
                                                <Select
                                                    value={mp.metodo}
                                                    onValueChange={(value) => {
                                                        const updated = [...metodosPago];
                                                        updated[idx].metodo = value;
                                                        setMetodosPago(updated);
                                                    }}
                                                >
                                                    <SelectTrigger className="w-[140px] bg-white border-slate-300 text-slate-900 rounded-lg">
                                                        <SelectValue />
                                                    </SelectTrigger>
                                                    <SelectContent className="bg-white border-slate-200">
                                                        <SelectItem value="efectivo" className="text-slate-700">Efectivo</SelectItem>
                                                        <SelectItem value="debito" className="text-slate-700">Débito</SelectItem>
                                                        <SelectItem value="credito" className="text-slate-700">Crédito</SelectItem>
                                                        <SelectItem value="transferencia" className="text-slate-700">Transferencia</SelectItem>
                                                        <SelectItem value="debe" className="text-slate-700">Debe (Deuda)</SelectItem>
                                                    </SelectContent>
                                                </Select>
                                                <Input
                                                    type="text"
                                                    value={mp.monto > 0 ? formatPrecio(mp.monto) : ''}
                                                    onChange={(e) => {
                                                        const updated = [...metodosPago];
                                                        updated[idx].monto = parsePrecio(e.target.value);
                                                        setMetodosPago(updated);
                                                    }}
                                                    onBlur={(e) => {
                                                        const updated = [...metodosPago];
                                                        updated[idx].monto = parsePrecio(e.target.value);
                                                        setMetodosPago(updated);
                                                        e.target.value = formatPrecio(updated[idx].monto);
                                                    }}
                                                    placeholder="Monto"
                                                    className="flex-1 bg-white border-slate-300 text-slate-900 rounded-lg"
                                                />
                                                <Button
                                                    type="button"
                                                    size="sm"
                                                    variant="ghost"
                                                    onClick={() => {
                                                        const updated = metodosPago.filter((_, i) => i !== idx);
                                                        setMetodosPago(updated);
                                                    }}
                                                    className="text-red-400 hover:text-red-300 hover:bg-red-500/10"
                                                >
                                                    ✕
                                                </Button>
                                            </div>
                                        ))}
                                        <div className="flex justify-between items-center text-sm pt-2 border-t border-slate-200">
                                            <span className="text-slate-500">Total pagos:</span>
                                            <span className="text-slate-900 font-semibold">
                                                ${formatPrecio(metodosPago.reduce((sum, mp) => sum + mp.monto, 0))}
                                            </span>
                                        </div>
                                        {metodosPago.length > 0 && parsePrecio(precioFinal) > 0 && (
                                            <div className="flex justify-between items-center text-sm">
                                                <span className="text-slate-500">Precio total:</span>
                                                <span className="text-slate-900 font-semibold">${precioFinal}</span>
                                            </div>
                                        )}
                                    </div>
                                )}
                            </div>

                            <div className="flex items-center justify-between">
                                <Button
                                    onClick={handleGuardarTodo}
                                    disabled={isSaving}
                                    className="bg-blue-600 hover:bg-blue-700 rounded-xl"
                                >
                                    {isSaving ? (
                                        <>
                                            <Loader2 className="w-4 h-4 mr-2 animate-spin" />
                                            Guardando...
                                        </>
                                    ) : (
                                        <>
                                            <Save className="w-4 h-4 mr-2" />
                                            Guardar Cambios
                                        </>
                                    )}
                                </Button>
                                <Link href="/admin/ordenes">
                                    <Button
                                        variant="outline"
                                        className="border-slate-300 text-slate-700 hover:bg-slate-900 hover:text-white rounded-xl transition-colors"
                                    >
                                        <ArrowLeft className="w-4 h-4 mr-2" />
                                        Volver a Órdenes
                                    </Button>
                                </Link>
                            </div>

                            {/* Botones de Boleta, PDF e Imprimir - Aparecen solo después de guardar */}
                            {saveSuccess && (
                                <div className="flex flex-col sm:flex-row gap-2 pt-4 border-t border-slate-200">
                                    {user?.role === 'admin' && (
                                        <Button onClick={handleTicket} className="flex-1 sm:flex-none bg-slate-900 text-white hover:bg-white hover:text-slate-900 border border-slate-900 rounded-xl transition-colors shadow-sm">
                                            <Printer className="w-4 h-4 mr-2" />
                                            Boleta/Ticket
                                        </Button>
                                    )}
                                    <Button onClick={handleDownloadPDF} className="flex-1 sm:flex-none bg-slate-900 text-white hover:bg-white hover:text-slate-900 border border-slate-900 rounded-xl transition-colors shadow-sm">
                                        <Download className="w-4 h-4 mr-2" />
                                        Descargar PDF
                                    </Button>
                                    <Button onClick={handlePrint} className="flex-1 sm:flex-none bg-slate-900 text-white hover:bg-white hover:text-slate-900 border border-slate-900 rounded-xl transition-colors shadow-sm">
                                        <Printer className="w-4 h-4 mr-2" />
                                        Imprimir Orden
                                    </Button>
                                </div>
                            )}
                        </>
                    ) : (
                        <>
                            <div className="flex items-center justify-between">
                                <span className="text-slate-500">Precio Final</span>
                                <span className="text-slate-900 font-bold">${(order.precio_total || 0).toLocaleString('es-CL')}</span>
                            </div>
                            <div className="pt-2">
                                <p className="text-slate-500 text-sm mb-1">Motivo</p>
                                <p className="text-slate-900 whitespace-pre-wrap">{order.descripcion_ingreso}</p>
                            </div>
                        </>
                    )}

                    {order.detalles_vehiculo ? (
                        <div className="pt-2">
                            <p className="text-slate-500 text-sm mb-1">Detalles del Vehículo</p>
                            <p className="text-slate-900 whitespace-pre-wrap">{order.detalles_vehiculo}</p>
                        </div>
                    ) : null}

                    {order.fotos_urls?.length ? (
                        <div className="pt-2">
                            <p className="text-slate-500 text-sm mb-2">Imágenes</p>
                            <div className="grid grid-cols-2 gap-3 md:grid-cols-4">
                                {order.fotos_urls.map((src, idx) => (
                                    <button
                                        key={idx}
                                        type="button"
                                        onClick={() => window.open(src, '_blank')}
                                        className="rounded-xl border border-slate-200 bg-slate-50 p-2 hover:bg-slate-100"
                                    >
                                        <img src={src} alt={`foto-${idx}`} className="h-28 w-full rounded-lg object-cover" />
                                    </button>
                                ))}
                            </div>
                        </div>
                    ) : null}
                </CardContent>
            </Card>

            {/* SECCIÓN CHECKLIST */}
            <Card className="bg-white border-slate-200 shadow-sm">
                <CardHeader>
                    <CardTitle className="flex items-center gap-2 text-slate-900">
                        <ClipboardCheck className="w-5 h-5 text-blue-600" />
                        Lista de Chequeo
                    </CardTitle>
                </CardHeader>
                <CardContent>
                    {!checklist ? (
                        // Sin checklist
                        <div className="text-center py-8">
                            <p className="text-slate-500 mb-4">No se ha creado checklist para esta orden</p>
                            <Button
                                onClick={() => handleOpenChecklist('checklist')}
                                className="bg-blue-600 hover:bg-blue-700 text-white"
                            >
                                <ClipboardCheck className="w-4 h-4 mr-2" />
                                Crear Checklist Ingreso
                            </Button>
                        </div>
                    ) : !checklist.revisado_por_mecanico_at ? (
                        // Checklist sin confirmar
                        <div className="space-y-4">
                            <div className="flex items-center gap-2 text-amber-500 bg-amber-50 p-3 rounded-lg border border-amber-100">
                                <AlertCircle className="w-5 h-5" />
                                <span className="font-medium">Confirmación Pendiente</span>
                            </div>
                            <Button
                                onClick={() => handleOpenChecklist('readonly_ingreso')}
                                variant="outline"
                                className="w-full border-slate-300 text-slate-700 hover:bg-slate-900 hover:text-white rounded-xl transition-colors"
                            >
                                <Eye className="w-4 h-4 mr-2" />
                                Ver Ingreso para Confirmar
                            </Button>
                        </div>
                    ) : (
                        // Checklist confirmado - FLUJO COMPLETO
                        <div className="space-y-4">
                            {(() => {
                                const isSalidaConfirmed = !!checklist.confirmado_salida_en;
                                const isEnProceso = order.estado === 'en_proceso';
                                const isPendiente = order.estado === 'pendiente';

                                return (
                                    <>
                                        <div className="flex items-center gap-2 text-emerald-600 bg-emerald-50 p-3 rounded-lg border border-emerald-100">
                                            <CheckCircle2 className="w-5 h-5" />
                                            <span className="font-medium">
                                                {isSalidaConfirmed ? 'Salida Revisada' : 'Ingreso Revisado'}
                                            </span>
                                        </div>

                                        <div className="grid grid-cols-1 md:grid-cols-2 gap-3">
                                            <Button
                                                onClick={() => handleOpenChecklist('readonly_ingreso')}
                                                variant="outline"
                                                className="border-slate-300 text-slate-700 hover:bg-slate-900 hover:text-white rounded-xl transition-colors"
                                            >
                                                <Eye className="w-4 h-4 mr-2" />
                                                Ver Ingreso
                                            </Button>

                                            {/* Logic for Start/Finish Work Buttons */}
                                            {isPendiente && (
                                                <Button
                                                    onClick={() => handleUpdateStatus('en_proceso')}
                                                    className="bg-indigo-600 hover:bg-indigo-700 text-white animate-pulse"
                                                >
                                                    <Wrench className="w-4 h-4 mr-2" />
                                                    Empezar Reparación
                                                </Button>
                                            )}

                                            {isEnProceso && (
                                                <Button
                                                    onClick={() => handleUpdateStatus('completada')}
                                                    className="bg-blue-600 hover:bg-blue-700 text-white"
                                                >
                                                    <Flag className="w-4 h-4 mr-2" />
                                                    Terminar Trabajo
                                                </Button>
                                            )}

                                            {!isPendiente && !isEnProceso && (
                                                <Button
                                                    onClick={() => handleOpenChecklist('salida')}
                                                    className="bg-emerald-600 hover:bg-emerald-700 text-white"
                                                >
                                                    <CheckCircle2 className="w-4 h-4 mr-2" />
                                                    Checklist Salida
                                                </Button>
                                            )}
                                        </div>
                                    </>
                                );
                            })()}
                        </div>
                    )}
                </CardContent>
            </Card>

            {/* CHECKLIST DIALOG */}
            <Dialog open={checklistDialog.open} onOpenChange={(open) => !open && handleChecklistClose()}>
                <DialogContent className="max-w-4xl max-h-[90vh] overflow-y-auto bg-white border-slate-200 text-slate-900">
                    <DialogHeader>
                        <DialogTitle className="text-slate-900">
                            {checklistDialog.mode === 'checklist' && 'Crear Checklist de Ingreso'}
                            {checklistDialog.mode === 'readonly_ingreso' && 'Checklist de Ingreso'}
                            {checklistDialog.mode === 'salida' && 'Checklist de Salida'}
                        </DialogTitle>
                        <DialogDescription className="text-slate-500">
                            {checklistDialog.mode === 'checklist' && 'Registra el estado del vehículo al momento del ingreso'}
                            {checklistDialog.mode === 'readonly_ingreso' && 'Nota: Solo lectura. Para editar, usa la app móvil.'}
                            {checklistDialog.mode === 'salida' && 'Registra el estado del vehículo al momento de la entrega'}
                        </DialogDescription>
                    </DialogHeader>

                    <ChecklistForm
                        orderId={String(orderId)}
                        onClose={handleChecklistClose}
                        initialData={checklist}
                        mode={checklistDialog.mode}
                    />
                </DialogContent>
            </Dialog>
        </div >
    );
}
