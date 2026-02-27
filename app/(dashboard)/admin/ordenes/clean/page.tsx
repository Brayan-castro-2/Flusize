'use client';

import { useEffect, useState } from 'react';
import { useRouter, useSearchParams } from 'next/navigation';
import { useQueryClient } from '@tanstack/react-query';
import { useAuth } from '@/contexts/auth-context';

import {
    actualizarOrden,
    buscarVehiculoPorPatente,
    obtenerOrdenPorId,
    obtenerPerfiles,
    obtenerChecklist,
    type OrdenDB,
    type VehiculoDB,
    type PerfilDB
} from '@/lib/storage-adapter';
import { useUpdateOrder } from '@/hooks/use-orders';

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
import { ArrowLeft, CheckCircle, Download, Loader2, Printer, Save, X, Plus, Play, ClipboardCheck, Package, Wrench } from 'lucide-react';
import ChecklistForm from '@/components/ordenes/checklist-form';
import { Dialog, DialogContent, DialogHeader, DialogTitle } from '@/components/ui/dialog';
import Link from 'next/link';

export default function DetalleOrdenPage() {
    const router = useRouter();
    const searchParams = useSearchParams();
    const queryClient = useQueryClient();
    const { user, isLoading: authLoading } = useAuth();
    const updateOrder = useUpdateOrder();

    const orderIdParam = searchParams.get('id');
    const orderId = Number(orderIdParam);

    const [order, setOrder] = useState<OrdenDB | null>(null);
    const [vehiculo, setVehiculo] = useState<VehiculoDB | null>(null);
    const [perfiles, setPerfiles] = useState<PerfilDB[]>([]);
    const [isLoading, setIsLoading] = useState(true);
    const [precioFinal, setPrecioFinal] = useState('');
    const [isSaving, setIsSaving] = useState(false);
    const [saveSuccess, setSaveSuccess] = useState(false);
    const [showChecklistModal, setShowChecklistModal] = useState(false);
    const [checklistMode, setChecklistMode] = useState<'checklist' | 'salida'>('checklist');
    const [checklistData, setChecklistData] = useState<any>(null);
    const [isLoadingChecklist, setIsLoadingChecklist] = useState(false);

    // Campos del formulario
    const [descripcion, setDescripcion] = useState('');
    const [estado, setEstado] = useState('pendiente');
    const [asignadoA, setAsignadoA] = useState<string>('');
    const [detalleTrabajos, setDetalleTrabajos] = useState('');
    const [kmIngreso, setKmIngreso] = useState<string>('');
    const [kmSalida, setKmSalida] = useState<string>('');
    const [clienteNombre, setClienteNombre] = useState<string>('');
    const [clienteTelefono, setClienteTelefono] = useState<string>('');
    const [metodosPago, setMetodosPago] = useState<Array<{ metodo: string; monto: number }>>([]);
    const [showKm, setShowKm] = useState(true);

    // Chameleon Quoter State
    const [isAvanzado, setIsAvanzado] = useState(false);
    const [calcularIva, setCalcularIva] = useState(false);
    const [cotizacionItems, setCotizacionItems] = useState<Array<{ descripcion: string; monto: number }>>([{ descripcion: '', monto: 0 }]);
    const [subtotalAvanzado, setSubtotalAvanzado] = useState(0);
    const [ivaAvanzado, setIvaAvanzado] = useState(0);

    const parsePrecio = (value: string) => {
        const digits = value.replace(/[^0-9]/g, '');
        return digits ? Number(digits) : 0;
    };

    const formatPrecio = (value: number) => {
        return value.toLocaleString('es-CL');
    };

    // Verificación de autenticación
    useEffect(() => {
        if (authLoading) return;
        if (!user) {
            router.push('/login');
        }
    }, [authLoading, user, router]);

    // Carga inicial de datos
    useEffect(() => {
        if (!orderIdParam) {
            setIsLoading(false);
            setOrder(null);
            setVehiculo(null);
            return;
        }

        const loadData = async () => {
            try {
                const [ordenData, perfs] = await Promise.all([
                    obtenerOrdenPorId(String(orderIdParam)),
                    obtenerPerfiles()
                ]);

                setOrder(ordenData);
                setPerfiles(perfs);

                if (ordenData) {
                    setPrecioFinal(formatPrecio(ordenData.precio_total || 0));

                    const rawDesc = ordenData.descripcion_ingreso || '';
                    const cleanedDesc = rawDesc.replace(/^Motor:.*?( - |$)/i, '').trim() || rawDesc;
                    setDescripcion(cleanedDesc);

                    setEstado(ordenData.estado || 'pendiente');
                    setAsignadoA(ordenData.asignado_a || '');
                    setDetalleTrabajos(ordenData.detalle_trabajos || '');
                    setClienteNombre(ordenData.cliente_nombre || '');
                    setClienteTelefono(ordenData.cliente_telefono || '');
                    setMetodosPago(ordenData.metodos_pago || []);

                    const kmMatch = rawDesc.match(/KM:\s*(\d+\.?\d*)/);
                    const kmSalidaMatch = rawDesc.match(/→\s*(\d+\.?\d*)/);

                    if (kmMatch) setKmIngreso(kmMatch[1]);
                    if (kmSalidaMatch) setKmSalida(kmSalidaMatch[1]);

                    if (ordenData.patente_vehiculo) {
                        const veh = await buscarVehiculoPorPatente(ordenData.patente_vehiculo);
                        setVehiculo(veh);
                    }

                    // Restore Chameleon State
                    if (ordenData.cotizacion_items && ordenData.cotizacion_items.length > 0) {
                        setIsAvanzado(true);
                        setCotizacionItems(ordenData.cotizacion_items);
                        setCalcularIva((ordenData.iva || 0) > 0);
                    }
                }
            } catch (error) {
                console.error("Error cargando orden:", error);
            } finally {
                setIsLoading(false);
            }
        };

        setIsLoading(true);
        loadData();
    }, [orderIdParam]);

    // NUEVO: Cargar checklist dinámicamente
    useEffect(() => {
        if (!orderIdParam) return;

        const loadChecklist = async () => {
            setIsLoadingChecklist(true);
            try {
                const data = await obtenerChecklist(String(orderIdParam));
                setChecklistData(data);
            } catch (err) {
                console.error("Error cargando checklist:", err);
            } finally {
                setIsLoadingChecklist(false);
            }
        };

        loadChecklist();
    }, [orderIdParam, showChecklistModal, estado]); // Recargar si se cierra el modal o cambia el estado

    // Calcular Subtotal e IVA dinámicamente
    useEffect(() => {
        if (!isAvanzado) return;
        const sub = cotizacionItems.reduce((acc, curr) => acc + (Number(curr.monto) || 0), 0);
        const calcIva = calcularIva ? Math.round(sub * 0.19) : 0;
        setSubtotalAvanzado(sub);
        setIvaAvanzado(calcIva);
        setPrecioFinal(formatPrecio(sub + calcIva));
    }, [cotizacionItems, calcularIva, isAvanzado]);

    // Exportaciones (Imprimir y Ticket)
    const handlePrint = () => {
        if (!orderIdParam) return;
        window.open(`/print/orden/${orderIdParam}`, '_blank');
    };

    const handleTicket = () => {
        if (!orderIdParam) return;
        window.open(`/print/ticket/${orderIdParam}`, '_blank');
    };

    // Generación de PDF en el cliente (Placeholder original, referenciando a nueva lógica si es necesario, pero mantenemos el nativo pedido)
    const handleDownloadPDF = async () => {
        if (!order) return;
        try {
            const { generateOrderPDF } = await import('@/lib/pdf-generator');

            // Adapt the local 'vehiculo' state perfectly to the 'vehicle' argument 
            const vehicleArg = vehiculo || undefined;

            await generateOrderPDF({
                order,
                vehicle: vehicleArg,
                checklist: null, // Si no se carga el checklist en base, mandamos null
                companyInfo: {
                    name: "TALLER MECÁNICO",
                    address: "Av. Principal 123",
                    phone: "+56 9 1234 5678"
                }
            });
        } catch (error) {
            console.error('Error generando PDF:', error);
            alert('Error al generar el PDF.');
        }
    };

    // Función para guardar cambios
    const handleGuardarTodo = async () => {
        if (!order) return;

        if (!['taller_admin', 'superadmin', 'admin'].includes((user as any)?.role || (user as any)?.rol || '')) {
            alert('No tienes permisos para editar esta orden de forma avanzada.');
            return;
        }

        const precio = parsePrecio(precioFinal);
        if (precio < 0) {
            alert('El precio no puede ser negativo');
            return;
        }

        if (metodosPago.length > 0) {
            const totalPagos = metodosPago.reduce((sum, mp) => sum + mp.monto, 0);
            if (totalPagos !== precio) {
                alert(`La suma de los pagos ($${totalPagos.toLocaleString('es-CL')}) debe ser igual al precio total ($${precio.toLocaleString('es-CL')})`);
                return;
            }
        }

        setIsSaving(true);

        const metodoPagoText = metodosPago.length > 0
            ? metodosPago.map(m => `${m.metodo}:${m.monto}`).join(', ')
            : null;

        let descripcionActualizada = descripcion;
        if (showKm && kmIngreso && kmSalida) {
            const precioKm = precio > 0 ? precio : 15000;
            descripcionActualizada = `${descripcion}\n\nServicios:\n- KM: ${kmIngreso} KM → ${kmSalida} KM: $${precioKm.toLocaleString('es-CL')}`;
        }

        const updateData: any = {
            descripcion_ingreso: descripcionActualizada,
            estado,
            precio_total: precio,
            cliente_nombre: clienteNombre || null,
            cliente_telefono: clienteTelefono || null,
            metodo_pago: metodoPagoText || null,
            metodos_pago: metodosPago.length > 0 ? metodosPago : null,
            asignado_a: asignadoA || null,
            detalle_trabajos: detalleTrabajos || null,
            cotizacion_items: isAvanzado ? cotizacionItems.filter(item => item.descripcion.trim() !== '') : null,
            subtotal: isAvanzado ? subtotalAvanzado : null,
            iva: isAvanzado ? ivaAvanzado : null
        };

        if (estado === 'completada' && order.estado !== 'completada') {
            const now = new Date().toISOString();
            updateData.fecha_salida = now;
        } else if (estado === 'pendiente' && order.estado === 'completada') {
            updateData.fecha_salida = null;
        }

        try {
            setSaveSuccess(true);
            setTimeout(() => setSaveSuccess(false), 2500);

            // Si es avanzado, nos aseguramos que precio_total sea subtotal + iva
            if (isAvanzado) {
                updateData.precio_total = subtotalAvanzado + ivaAvanzado;
            }

            setOrder(prev => prev ? { ...prev, ...updateData } : null);
            if (updateData.precio_total !== undefined) {
                setPrecioFinal(formatPrecio(updateData.precio_total));
            }

            updateOrder.mutate({ id: order.id, updates: updateData });
        } catch (error) {
            console.error("Error guardando orden:", error);
            alert("Error al guardar los cambios.");
        } finally {
            setIsSaving(false);
        }
    };

    if (authLoading || isLoading) {
        return (
            <div className="flex items-center justify-center py-20">
                <Loader2 className="w-8 h-8 animate-spin text-blue-500" />
            </div>
        );
    }

    if (!order) {
        return (
            <div className="text-center py-12">
                <p className="text-slate-400 mb-4">Orden no encontrada o no seleccionada</p>
                <Link href="/admin/ordenes">
                    <Button variant="outline" className="border-slate-600 text-slate-300">Volver a órdenes</Button>
                </Link>
            </div>
        );
    }

    const isAdmin = ['taller_admin', 'superadmin', 'admin'].includes((user as any)?.role || (user as any)?.rol || '');

    const handleCambiarEstado = async (nuevoEstado: string) => {
        if (!order) return;
        setIsSaving(true);
        try {
            // Actualizar en base de datos
            await actualizarOrden(String(orderIdParam), { estado: nuevoEstado as any });

            // Actualizar estados locales para UI inmediata
            setOrder(prev => prev ? { ...prev, estado: nuevoEstado as any } : null);
            setEstado(nuevoEstado);

            // Si el estado es completada, nos aseguramos de invalidar la query de órdenes para que se vea el cambio en la lista
            queryClient.invalidateQueries({ queryKey: ['orders'] });
        } catch (error) {
            console.error("Error cambiando estado:", error);
            alert("Error al actualizar el estado de la orden.");
        } finally {
            setIsSaving(false);
        }
    };

    return (
        <>
            <div className="space-y-6 max-w-3xl mx-auto pb-24">
                {saveSuccess && (
                    <div className="fixed top-20 left-4 right-4 md:left-1/2 md:-translate-x-1/2 md:w-auto z-50">
                        <div className="bg-gradient-to-r from-green-500 to-emerald-600 text-white px-6 py-3 rounded-xl shadow-xl flex items-center gap-2">
                            <CheckCircle className="w-5 h-5" />
                            Cambios guardados
                        </div>
                    </div>
                )}

                <div className="flex flex-col md:flex-row items-start md:items-center justify-between gap-4">
                    <div>
                        <h1 className="text-xl md:text-2xl font-bold text-slate-900 border-b-0">Orden #{order.id}</h1>
                        <p className="text-sm text-slate-500">{new Date(order.fecha_ingreso || new Date()).toLocaleString('es-CL')}</p>
                    </div>
                    <div className="flex flex-wrap gap-2 w-full md:w-auto">
                        {isAdmin && (
                            <Button onClick={handleTicket} variant="outline" className="flex-1 md:flex-none border-slate-300 text-slate-700 hover:bg-slate-100 rounded-xl">
                                <Printer className="w-4 h-4 mr-2" />
                                <span className="hidden sm:inline">Ticket</span>
                            </Button>
                        )}
                        <Button onClick={handleDownloadPDF} variant="outline" className="flex-1 md:flex-none border-slate-300 text-slate-700 hover:bg-slate-100 rounded-xl">
                            <Download className="w-4 h-4 mr-2" />
                            <span className="hidden sm:inline">PDF</span>
                        </Button>
                        <Button onClick={handlePrint} variant="outline" className="flex-1 md:flex-none border-slate-300 text-slate-700 hover:bg-slate-100 rounded-xl">
                            <Printer className="w-4 h-4 mr-2" />
                            <span className="hidden sm:inline">Imprimir</span>
                        </Button>
                    </div>
                </div>

                <Card className="bg-white border-slate-200 shadow-sm">
                    <CardHeader className="bg-slate-50 border-b border-slate-200">
                        <CardTitle className="text-slate-900">Detalles de la Orden</CardTitle>
                    </CardHeader>
                    <CardContent className="space-y-6 pt-6">

                        <div className="flex items-center justify-between border-b border-slate-100 pb-4">
                            <span className="text-slate-500">Patente</span>
                            <span className="font-mono font-bold text-slate-900 bg-slate-100 px-3 py-1 rounded-lg">{order.patente_vehiculo}</span>
                        </div>
                        <div className="flex items-center justify-between border-b border-slate-100 pb-4">
                            <span className="text-slate-500">Vehículo</span>
                            <span className="text-slate-900 font-medium">{vehiculo ? `${vehiculo.marca} ${vehiculo.modelo}` : '-'}</span>
                        </div>

                        {isAdmin ? (
                            <>
                                <div className="grid md:grid-cols-2 gap-4">
                                    <div className="space-y-2">
                                        <Label className="text-slate-700">Nombre del Cliente</Label>
                                        <Input value={clienteNombre} onChange={(e) => setClienteNombre(e.target.value)} className="bg-white border-slate-300 text-slate-900 rounded-xl" placeholder="Nombre completo" />
                                    </div>
                                    <div className="space-y-2">
                                        <Label className="text-slate-700">Teléfono</Label>
                                        <Input value={clienteTelefono} onChange={(e) => setClienteTelefono(e.target.value)} className="bg-white border-slate-300 text-slate-900 rounded-xl" placeholder="+56 9..." />
                                    </div>
                                </div>

                                <div className="grid md:grid-cols-2 gap-4">
                                    <div className="space-y-2">
                                        <Label className="text-slate-700">Estado</Label>
                                        <Select value={estado} onValueChange={setEstado}>
                                            <SelectTrigger className="bg-white border-slate-300 text-slate-900 rounded-xl">
                                                <SelectValue />
                                            </SelectTrigger>
                                            <SelectContent className="bg-white border-slate-200 shadow-xl">
                                                <SelectItem value="pendiente" className="text-slate-900 cursor-pointer focus:bg-slate-100">Pendiente</SelectItem>
                                                <SelectItem value="completada" className="text-slate-900 cursor-pointer focus:bg-slate-100">Completada</SelectItem>
                                                <SelectItem value="debe" className="text-slate-900 cursor-pointer focus:bg-slate-100">Debe</SelectItem>
                                            </SelectContent>
                                        </Select>
                                    </div>
                                    <div className="space-y-2">
                                        <Label className="text-slate-700">Asignado a (Mecánico)</Label>
                                        <Select value={asignadoA || 'none'} onValueChange={(v) => setAsignadoA(v === 'none' ? '' : v)}>
                                            <SelectTrigger className="bg-white border-slate-300 text-slate-900 rounded-xl">
                                                <SelectValue placeholder="Sin asignar" />
                                            </SelectTrigger>
                                            <SelectContent className="bg-white border-slate-200 shadow-xl">
                                                <SelectItem value="none" className="text-slate-500 cursor-pointer focus:bg-slate-100">Sin asignar</SelectItem>
                                                {perfiles.map((perfil) => (
                                                    <SelectItem key={perfil.id} value={perfil.id} className="text-slate-900 cursor-pointer focus:bg-slate-100">
                                                        {perfil.nombre_completo}
                                                    </SelectItem>
                                                ))}
                                            </SelectContent>
                                        </Select>
                                    </div>
                                </div>

                                <div className="space-y-4 border-t border-slate-100 pt-4">
                                    <div className="flex items-center justify-between">
                                        <Label className="text-slate-700">Control de Kilometraje</Label>
                                        <Button
                                            type="button"
                                            variant={showKm ? "default" : "outline"}
                                            size="sm"
                                            onClick={() => setShowKm(!showKm)}
                                            className={showKm ? "bg-slate-900 text-white hover:bg-slate-800 h-8 rounded-lg" : "border-slate-300 text-slate-600 h-8 rounded-lg"}
                                        >
                                            {showKm ? 'Ocultar' : 'Activar KM'}
                                        </Button>
                                    </div>

                                    {showKm && (
                                        <div className="grid md:grid-cols-2 gap-4 animate-in fade-in slide-in-from-top-2">
                                            <div className="space-y-2">
                                                <Label className="text-slate-600">KM Ingreso</Label>
                                                <Input type="number" value={kmIngreso} onChange={(e) => setKmIngreso(e.target.value)} className="bg-white border-slate-300 text-slate-900 rounded-xl" placeholder="Ej: 150000" />
                                            </div>
                                            <div className="space-y-2">
                                                <Label className="text-slate-600">KM Salida</Label>
                                                <Input type="number" value={kmSalida} onChange={(e) => setKmSalida(e.target.value)} className="bg-white border-slate-300 text-slate-900 rounded-xl" placeholder="Ej: 150050" />
                                            </div>
                                        </div>
                                    )}
                                </div>

                                <div className="space-y-2">
                                    <Label className="text-slate-700">Motivo de Ingreso</Label>
                                    <Textarea value={descripcion} onChange={(e) => setDescripcion(e.target.value)} className="min-h-[100px] bg-white border-slate-300 text-slate-900 rounded-xl" placeholder="Describe los síntomas o solicitud del cliente..." />
                                </div>

                                <div className="space-y-2">
                                    <Label className="text-slate-700">Detalle de Trabajos Realizados</Label>
                                    <Textarea value={detalleTrabajos} onChange={(e) => setDetalleTrabajos(e.target.value)} className="min-h-[120px] bg-white border-slate-300 text-slate-900 rounded-xl" placeholder="Paso a paso de las reparaciones ejecutadas..." />
                                </div>

                                {/* COTIZADOR CAMALEÓN */}
                                <div className="pt-6 border-t border-slate-200 mt-6 mt-8">
                                    <div className="flex items-center justify-between mb-4">
                                        <div>
                                            <Label className="text-slate-900 text-lg font-bold">Resumen de Cobro y Finanzas</Label>
                                            <p className="text-xs text-slate-500">Monto cerrado directo o desglose Enterprise.</p>
                                        </div>
                                        <Button
                                            type="button"
                                            variant={isAvanzado ? "default" : "outline"}
                                            size="sm"
                                            onClick={() => setIsAvanzado(!isAvanzado)}
                                            className={isAvanzado ? "bg-blue-600 text-white rounded-xl shadow-sm" : "border-slate-300 text-slate-700 rounded-xl bg-white"}
                                        >
                                            {isAvanzado ? 'Volver a Monto Simple' : '➕ Desglosar Cotización (Ítems e IVA)'}
                                        </Button>
                                    </div>

                                    {!isAvanzado ? (
                                        <div className="space-y-2 p-5 bg-slate-50 rounded-2xl border border-slate-200 animate-in fade-in duration-300">
                                            <Label className="text-slate-700 font-semibold mb-1 block">Precio Total ($)</Label>
                                            <Input
                                                value={precioFinal}
                                                onChange={(e) => setPrecioFinal(e.target.value)}
                                                onBlur={() => setPrecioFinal(formatPrecio(parsePrecio(precioFinal)))}
                                                className="bg-white border-slate-300 text-slate-900 rounded-xl text-2xl font-bold h-14"
                                                placeholder="15000"
                                            />
                                        </div>
                                    ) : (
                                        <div className="space-y-4 bg-slate-50 p-5 rounded-2xl border border-slate-200 animate-in fade-in slide-in-from-top-4 duration-300 shadow-sm">
                                            <Label className="text-slate-800 font-semibold block border-b border-slate-200 pb-2">Ítems Cotizados</Label>

                                            <div className="space-y-3 pt-2">
                                                {cotizacionItems.map((item, idx) => (
                                                    <div key={idx} className="flex gap-2 items-center">
                                                        <Input
                                                            placeholder="Descripción del ítem (ej. Mano de Obra, Repuesto XXX)"
                                                            value={item.descripcion}
                                                            onChange={(e) => {
                                                                const newItems = [...cotizacionItems];
                                                                newItems[idx].descripcion = e.target.value;
                                                                setCotizacionItems(newItems);
                                                            }}
                                                            className="flex-1 bg-white border-slate-300 text-slate-900 rounded-xl shadow-sm"
                                                        />
                                                        <Input
                                                            type="text"
                                                            placeholder="$ Monto"
                                                            value={item.monto > 0 ? formatPrecio(item.monto) : ''}
                                                            onChange={(e) => {
                                                                const newItems = [...cotizacionItems];
                                                                newItems[idx].monto = parsePrecio(e.target.value);
                                                                setCotizacionItems(newItems);
                                                            }}
                                                            onBlur={(e) => {
                                                                const newItems = [...cotizacionItems];
                                                                newItems[idx].monto = parsePrecio(e.target.value);
                                                                setCotizacionItems(newItems);
                                                                e.target.value = formatPrecio(newItems[idx].monto);
                                                            }}
                                                            className="w-[140px] bg-white border-slate-300 text-slate-900 rounded-xl font-semibold text-right shadow-sm"
                                                        />
                                                        <Button
                                                            type="button"
                                                            size="icon"
                                                            variant="ghost"
                                                            onClick={() => {
                                                                const newItems = cotizacionItems.filter((_, i) => i !== idx);
                                                                setCotizacionItems(newItems.length ? newItems : [{ descripcion: '', monto: 0 }]);
                                                            }}
                                                            className="text-red-500 hover:text-red-700 hover:bg-red-50"
                                                        >
                                                            <X className="w-5 h-5" />
                                                        </Button>
                                                    </div>
                                                ))}
                                            </div>

                                            <Button
                                                type="button"
                                                variant="outline"
                                                onClick={() => setCotizacionItems([...cotizacionItems, { descripcion: '', monto: 0 }])}
                                                className="text-blue-600 border-blue-200 hover:bg-blue-50 rounded-xl w-full border-dashed bg-white shadow-sm mt-2"
                                            >
                                                <Plus className="w-4 h-4 mr-2" /> Agregar otro ítem
                                            </Button>

                                            <div className="flex items-center justify-between bg-white border-slate-200 border p-4 rounded-xl shadow-sm mt-6">
                                                <span className="text-slate-700 font-semibold">Calcular 19% IVA (Automotriz)</span>
                                                <button
                                                    type="button"
                                                    onClick={() => setCalcularIva(!calcularIva)}
                                                    className={`w-12 h-6 rounded-full transition-colors duration-200 ease-in-out flex items-center ${calcularIva ? 'bg-blue-600' : 'bg-slate-300'} relative p-1 cursor-pointer`}
                                                >
                                                    <span className={`bg-white w-4 h-4 rounded-full shadow-sm transform transition-transform duration-200 ease-in-out ${calcularIva ? 'translate-x-6' : 'translate-x-0'}`} />
                                                </button>
                                            </div>

                                            <div className="bg-slate-900 text-white p-5 rounded-2xl space-y-3 mt-4 shadow-md">
                                                <div className="flex justify-between text-base font-medium text-slate-300">
                                                    <span>Subtotal Neto:</span>
                                                    <span>${formatPrecio(subtotalAvanzado)}</span>
                                                </div>
                                                {calcularIva && (
                                                    <div className="flex justify-between text-base font-medium text-blue-300">
                                                        <span>IVA (19%):</span>
                                                        <span>+ ${formatPrecio(ivaAvanzado)}</span>
                                                    </div>
                                                )}
                                                <div className="flex justify-between text-2xl font-bold pt-3 border-t border-slate-700 mt-2">
                                                    <span>Total a Pagar:</span>
                                                    <span className="text-green-400">${precioFinal || 0}</span>
                                                </div>
                                            </div>
                                        </div>
                                    )}
                                </div>

                                {/* Métodos de Pago */}
                                <div className="space-y-4 pt-6 mt-4">
                                    <div className="flex items-center justify-between">
                                        <Label className="text-slate-800 font-semibold">Distribución de Pagos</Label>
                                        <Button type="button" size="sm" onClick={() => setMetodosPago([...metodosPago, { metodo: 'efectivo', monto: 0 }])} className="bg-slate-100 hover:bg-slate-200 text-slate-700 border border-slate-300 rounded-lg">
                                            <Plus className="w-4 h-4 mr-2" /> Pago Manual
                                        </Button>
                                    </div>

                                    <div className="space-y-3 border-l-2 border-slate-200 pl-4 py-2">
                                        {metodosPago.map((mp, idx) => (
                                            <div key={idx} className="flex gap-2 items-center bg-white p-2 rounded-xl border border-slate-200 shadow-sm animate-in zoom-in duration-200">
                                                <Select value={mp.metodo} onValueChange={(value) => {
                                                    const updated = [...metodosPago];
                                                    updated[idx].metodo = value;
                                                    setMetodosPago(updated);
                                                }}>
                                                    <SelectTrigger className="w-[150px] bg-slate-50 border-slate-200 text-slate-800 rounded-lg">
                                                        <SelectValue />
                                                    </SelectTrigger>
                                                    <SelectContent className="bg-white border-slate-200 shadow-xl">
                                                        <SelectItem value="efectivo" className="text-slate-900 cursor-pointer focus:bg-slate-100">Efectivo</SelectItem>
                                                        <SelectItem value="debito" className="text-slate-900 cursor-pointer focus:bg-slate-100">Débito</SelectItem>
                                                        <SelectItem value="credito" className="text-slate-900 cursor-pointer focus:bg-slate-100">Crédito</SelectItem>
                                                        <SelectItem value="transferencia" className="text-slate-900 cursor-pointer focus:bg-slate-100">Transferencia</SelectItem>
                                                        <SelectItem value="debe" className="text-slate-900 cursor-pointer focus:bg-slate-100">Debe (Deuda)</SelectItem>
                                                    </SelectContent>
                                                </Select>
                                                <Input
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
                                                    placeholder="Monto $"
                                                    className="flex-1 bg-slate-50 border-slate-200 text-slate-900 rounded-lg text-right font-medium"
                                                />
                                                <Button variant="ghost" size="icon" onClick={() => setMetodosPago(metodosPago.filter((_, i) => i !== idx))} className="text-slate-400 hover:text-red-500 hover:bg-red-50 rounded-lg">
                                                    <X className="w-5 h-5" />
                                                </Button>
                                            </div>
                                        ))}
                                        {metodosPago.length === 0 && (
                                            <p className="text-sm text-slate-400 italic">No hay pagos registrados aún.</p>
                                        )}
                                    </div>
                                </div>

                                <div className="flex flex-col-reverse sm:flex-row items-center justify-between gap-4 pt-8 border-t border-slate-200">
                                    <Link href="/admin/ordenes" className="w-full sm:w-auto">
                                        <Button variant="outline" className="w-full sm:w-auto border-slate-300 text-slate-700 hover:bg-slate-100 rounded-xl h-14 font-medium px-8 shadow-sm">
                                            <ArrowLeft className="w-4 h-4 mr-2" /> Volver sin guardar
                                        </Button>
                                    </Link>
                                    <Button onClick={handleGuardarTodo} disabled={isSaving} className="w-full sm:w-auto bg-slate-900 hover:bg-slate-800 text-white rounded-xl h-14 px-10 font-bold shadow-md text-lg">
                                        {isSaving ? <Loader2 className="w-6 h-6 mr-2 animate-spin" /> : <Save className="w-6 h-6 mr-2" />}
                                        Finalizar y Guardar
                                    </Button>
                                </div>
                            </>
                        ) : (
                            <div className="space-y-4 pt-4">
                                <div className="flex items-center justify-between border-b border-slate-100 pb-4">
                                    <span className="text-slate-500">Estado</span>
                                    <Badge className={`px-4 py-1 text-sm ${order.estado === 'completada' ? 'bg-green-100 text-green-700 border-green-200' : 'bg-amber-100 text-amber-700 border-amber-200'} border`}>
                                        {order.estado === 'completada' ? 'Completada y Lista' : 'En Taller / Pendiente'}
                                    </Badge>
                                </div>
                                <div className="flex items-center justify-between bg-slate-50 p-4 rounded-xl border border-slate-200 mt-4">
                                    <span className="text-slate-700 font-medium text-lg">Total General:</span>
                                    <span className="text-slate-900 font-bold text-2xl">${(order.precio_total || 0).toLocaleString('es-CL')}</span>
                                </div>

                                <div className="bg-white p-5 rounded-xl border border-slate-200 mt-6 shadow-sm">
                                    <p className="text-slate-900 font-bold mb-3 flex items-center gap-2"><ArrowLeft className="w-4 h-4 text-blue-600 rotate-180" /> Motivo de Ingreso y Diagnóstico Oficial</p>
                                    <p className="text-slate-600 whitespace-pre-wrap leading-relaxed">{order.descripcion_ingreso}</p>
                                </div>
                                {order.detalle_trabajos && (
                                    <div className="bg-slate-50 p-5 rounded-xl border border-slate-200 mt-4 shadow-sm">
                                        <p className="text-slate-900 font-bold mb-3 flex items-center gap-2"><CheckCircle className="w-4 h-4 text-emerald-500" /> Trabajos Realizados por el Equipo</p>
                                        <p className="text-slate-600 whitespace-pre-wrap leading-relaxed">{order.detalle_trabajos}</p>
                                    </div>
                                )}
                            </div>
                        )}

                        {order.fotos_urls && order.fotos_urls.length > 0 && (
                            <div className="pt-8 mt-6">
                                <p className="text-slate-900 font-bold mb-4 flex items-center gap-2">Registro Fotográfico Adjunto</p>
                                <div className="grid grid-cols-2 sm:grid-cols-3 md:grid-cols-4 gap-4">
                                    {order.fotos_urls.map((src: string, idx: number) => (
                                        <a key={idx} href={src} target="_blank" rel="noreferrer" className="block relative aspect-square rounded-2xl overflow-hidden border border-slate-200 hover:border-blue-500 transition-colors shadow-sm group">
                                            <div className="absolute inset-0 bg-black/40 opacity-0 group-hover:opacity-100 transition-opacity flex items-center justify-center pointer-events-none z-10">
                                                <span className="text-white font-medium drop-shadow-md">Ver Imagen</span>
                                            </div>
                                            <img src={src} alt={`Evidencia O.T ${order.id} - Foto ${idx + 1}`} className="w-full h-full object-cover group-hover:scale-110 transition-transform duration-500 origin-center" />
                                        </a>
                                    ))}
                                </div>
                            </div>
                        )}

                    </CardContent>
                </Card>
            </div>

            {/* ── BARRA DE ACCIONES FLOTANTE (Flujo de Trabajo Dinámico) ── */}
            <div className="fixed bottom-0 left-0 right-0 z-50 p-4 bg-white/90 backdrop-blur-md border-t border-slate-200 shadow-[0_-8px_30px_rgb(0,0,0,0.12)]">
                <div className="max-w-3xl mx-auto">
                    <div className="flex items-center justify-center gap-1 mb-2">
                        <div className="h-[2px] w-4 bg-blue-500 rounded-full"></div>
                        <p className="text-[10px] text-slate-500 font-bold uppercase tracking-[0.2em]">Flujo de Trabajo Quick-Action</p>
                        <div className="h-[2px] w-4 bg-blue-500 rounded-full"></div>
                    </div>

                    <div className="grid grid-cols-4 gap-3">
                        {/* Botón 1: Checklist Ingreso o Link Tracking */}
                        {!checklistData ? (
                            <button
                                type="button"
                                onClick={() => { setChecklistMode('checklist'); setShowChecklistModal(true); }}
                                className="flex flex-col items-center justify-center gap-1.5 py-3 px-1 rounded-2xl bg-white hover:bg-slate-50 border-2 border-slate-200 transition-all shadow-sm active:scale-95 group"
                            >
                                <Plus className="w-5 h-5 text-blue-600 group-hover:scale-110 transition-transform" />
                                <span className="text-[10px] font-bold text-slate-700">Checklist Ingreso</span>
                            </button>
                        ) : (
                            <Link
                                href={`/tracking/${order.id}`}
                                target="_blank"
                                className="flex flex-col items-center justify-center gap-1.5 py-3 px-1 rounded-2xl bg-blue-50 hover:bg-blue-100 border-2 border-blue-200 transition-all shadow-sm active:scale-95 group"
                            >
                                <ClipboardCheck className="w-5 h-5 text-blue-600 group-hover:scale-110 transition-transform" />
                                <span className="text-[10px] font-bold text-blue-700">Ver Tracking</span>
                            </Link>
                        )}

                        {/* Botón 2: Empezar Reparación (Solo si está Pendiente y hay checklist revisado o forzado) */}
                        {order.estado === 'pendiente' ? (
                            <button
                                type="button"
                                onClick={() => handleCambiarEstado('en_proceso')}
                                disabled={isSaving}
                                className={`flex flex-col items-center justify-center gap-1.5 py-3 px-1 rounded-2xl border-2 transition-all shadow-sm active:scale-95 animate-pulse-subtle bg-blue-600 hover:bg-blue-700 border-blue-700 text-white`}
                            >
                                <Play className="w-5 h-5" />
                                <span className="text-[10px] font-bold">Empezar Reparación</span>
                            </button>
                        ) : (
                            <div className="flex flex-col items-center justify-center gap-1.5 py-3 px-1 rounded-2xl bg-slate-100 border-2 border-slate-200 opacity-60">
                                <Play className="w-5 h-5 text-slate-400" />
                                <span className="text-[10px] font-bold text-slate-500">
                                    {order.estado === 'en_proceso' ? 'Ya en Proceso' : 'Iniciado'}
                                </span>
                            </div>
                        )}

                        {/* Botón 3: Terminar Trabajo (Solo si está en_proceso) */}
                        <button
                            type="button"
                            onClick={() => handleCambiarEstado('completada')}
                            disabled={isSaving || order.estado !== 'en_proceso'}
                            className={`flex flex-col items-center justify-center gap-1.5 py-3 px-1 rounded-2xl border-2 transition-all shadow-sm active:scale-95 ${order.estado === 'en_proceso'
                                    ? 'bg-emerald-600 hover:bg-emerald-700 border-emerald-700 text-white shadow-emerald-200/50'
                                    : 'bg-slate-100 border-slate-200 text-slate-400 opacity-60'
                                }`}
                        >
                            <CheckCircle className="w-5 h-5" />
                            <span className="text-[10px] font-bold">
                                {['completada', 'entregada', 'debe'].includes(order.estado) ? 'Trabajo Listo' : 'Terminar Trabajo'}
                            </span>
                        </button>

                        {/* Botón 4: Entregar (Abre checklist salida) */}
                        <button
                            type="button"
                            onClick={() => { setChecklistMode('salida'); setShowChecklistModal(true); }}
                            disabled={isSaving || order.estado === 'entregada'}
                            className={`flex flex-col items-center justify-center gap-1.5 py-3 px-1 rounded-2xl border-2 transition-all shadow-sm active:scale-95 ${order.estado === 'entregada'
                                    ? 'bg-slate-100 border-slate-200 text-slate-400 opacity-60'
                                    : 'bg-purple-600 hover:bg-purple-700 border-purple-700 text-white shadow-purple-200/50'
                                }`}
                        >
                            <Package className="w-5 h-5" />
                            <span className="text-[10px] font-bold">
                                {order.estado === 'entregada' ? 'Entregado' : 'Checklist Salida'}
                            </span>
                        </button>
                    </div>
                </div>
            </div>

            {/* ── MODAL CHECKLIST ── */}
            <Dialog open={showChecklistModal} onOpenChange={setShowChecklistModal}>
                <DialogContent className="bg-slate-900 border-slate-700 max-w-2xl max-h-[90vh] overflow-y-auto">
                    <DialogHeader>
                        <DialogTitle className="text-white flex items-center gap-2">
                            <Wrench className="w-5 h-5 text-blue-400" />
                            {checklistMode === 'salida' ? 'Checklist Salida / Entrega' : 'Checklist de Ingreso'}
                        </DialogTitle>
                    </DialogHeader>
                    {orderIdParam && (
                        <ChecklistForm
                            orderId={orderIdParam}
                            mode={checklistMode}
                            onClose={() => {
                                setShowChecklistModal(false);
                                if (checklistMode === 'salida') handleCambiarEstado('entregada');
                            }}
                        />
                    )}
                </DialogContent>
            </Dialog>
        </>
    );
}
