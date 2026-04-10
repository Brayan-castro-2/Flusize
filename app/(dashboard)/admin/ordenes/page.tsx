'use client';

import React, { useState, useMemo, useCallback, Fragment, useRef, useEffect } from 'react';
import { supabase } from '@/lib/supabase';
import dynamic from 'next/dynamic';
import { Loader2 } from 'lucide-react';

// Importaciones dinámicas para reducir el JS inicial (PageSpeed Optimization)
const ChecklistForm = dynamic(() => import('@/components/ordenes/checklist-form'), {
    ssr: false,
    loading: () => <div className="flex justify-center p-8"><Loader2 className="w-8 h-8 animate-spin text-blue-500" /></div>
});

const OrderWorkflowActions = dynamic(() => import('@/components/ordenes/order-workflow-actions').then(mod => mod.OrderWorkflowActions), {
    ssr: false
});

import { type OrdenDB, type PerfilDB, type VehiculoDB, actualizarOrden, eliminarCita, obtenerChecklist, obtenerOrdenPorId } from '@/lib/storage-adapter';
import { generateOrderPDF } from '@/lib/pdf-generator';
import { useOrders, useOrdersCount, useDeleteOrder, useUpdateOrder, useInfiniteOrders, ORDERS_QUERY_KEY } from '@/hooks/use-orders';
import { useQueryClient } from '@tanstack/react-query';
import { useDebounce } from '@/hooks/use-debounce';
import { usePerfiles } from '@/hooks/use-perfiles';
import { useVehiculos } from '@/hooks/use-vehiculos';
import { useAuth } from '@/contexts/auth-context';
import { useAppointments, APPOINTMENTS_QUERY_KEY } from '@/hooks/use-appointments';
import { useFlusizeFeatures } from '@/hooks/useFlusizeFeatures';
import { normalizePlan, planHasModule } from '@/lib/plan-config';
import type { CitaDB } from '@/lib/supabase';
import { useRouter } from 'next/navigation';

import { BuscadorInventario, type CartItem } from '@/components/inventario/buscador-inventario';
import { BitacoraAvanceModal } from '@/components/ordenes/bitacora-avance-modal';
import { FijarPrecioModal } from '@/components/ordenes/fijar-precio-modal';
import { Card, CardContent, CardHeader, CardTitle } from '@/components/ui/card';
import { Button } from '@/components/ui/button';
import { Badge } from '@/components/ui/badge';
import { Input } from '@/components/ui/input';
import {
    Select,
    SelectContent,
    SelectItem,
    SelectTrigger,
    SelectValue,
} from '@/components/ui/select';
import {
    DropdownMenu,
    DropdownMenuContent,
    DropdownMenuItem,
    DropdownMenuLabel,
    DropdownMenuSeparator,
    DropdownMenuTrigger,
} from '@/components/ui/dropdown-menu';
import {
    Table,
    TableBody,
    TableCell,
    TableHead,
    TableHeader,
    TableRow,
} from '@/components/ui/table';
import {
    Dialog,
    DialogContent,
    DialogHeader,
    DialogTitle,
} from '@/components/ui/dialog';
// La definición dinámica ya está al principio del archivo
import {
    Plus,
    Search,
    Filter,
    MoreVertical,
    FileText,
    Calendar,
    Settings,
    ChevronDown,
    Download,
    Eye,
    Trash2,
    Edit,
    CheckCircle,
    X,
    User,
    Wrench,
    DollarSign,
    ClipboardCheck,
    Printer,
    ArrowUpDown,
    ArrowUp,
    ArrowDown,
    // Loader2 ya importado arriba
    ChevronRight,
    MessageCircle,
    Share2,
    Activity,
    History as HistoryIcon,
    Box as BoxIcon
} from 'lucide-react';
import { useToast } from "@/components/ui/use-toast";

import Link from 'next/link';

function ETAInput({ orderId, currentEta, onUpdateETA }: { orderId: string, currentEta: string | null, onUpdateETA: (id: string, eta: string) => void }) {
    const [val, setVal] = useState(currentEta ? new Date(currentEta).toISOString().slice(0, 16) : '');
    return (
        <div className="flex flex-col gap-1 w-[160px] flex-shrink-0">
            <label className="text-[10px] uppercase font-bold text-slate-400 tracking-wider">⏱️ Entrega Estimada</label>
            <input 
                type="datetime-local" 
                value={val}
                onChange={e => setVal(e.target.value)}
                onBlur={() => onUpdateETA(orderId, val)}
                className="bg-slate-800/80 border border-slate-700 text-slate-200 text-xs rounded-lg px-2 h-9 outline-none focus:border-blue-500 transition-colors w-full z-10 relative"
                onClick={e => e.stopPropagation()}
            />
        </div>
    );
}

// ─── Mobile Order Card (Accordion + Long Press) ─────────────────────────────
function MobileOrderCard({
    order,
    vehiculo,
    hasDebt,
    getStatusBadge,
    getCleanMotivo,
    canEditOrders,
    canDeleteOrders,
    deleteConfirm,
    setDeleteConfirm,
    handleDeleteOrder,
    deleteOrderPending,
    checklist,
    isLoadingChecklist,
    onOpenChecklist,
    onUpdateStatus,
    onOpenBitacora,
    onUpdateETA,
    onExpand,
    onPrintOrder,
    bitacoraEntries,
    isLoadingBitacora,
    repuestos,
    isLoadingRepuestos,
}: {
    order: any;
    vehiculo: any;
    hasDebt: (o: any) => boolean;
    getStatusBadge: (status: string, id?: string, interactive?: boolean) => React.ReactNode;
    getCleanMotivo: (desc: string) => string;
    canEditOrders: boolean;
    canDeleteOrders: boolean;
    deleteConfirm: string | null;
    setDeleteConfirm: (id: string | null) => void;
    handleDeleteOrder: (order: any) => void;
    deleteOrderPending: boolean;
    checklist: any;
    isLoadingChecklist: boolean;
    onOpenChecklist: (orderId: string, mode: 'checklist' | 'readonly_ingreso' | 'salida') => void;
    onUpdateStatus: (orderId: string, newStatus: string) => void;
    onOpenBitacora: (orderId: string) => void;
    onUpdateETA: (orderId: string, eta: string) => void;
    onExpand: (orderId: string) => void;
    onPrintOrder: (order: any) => void;
    bitacoraEntries?: any[];
    isLoadingBitacora?: boolean;
    repuestos?: any[];
    isLoadingRepuestos?: boolean;
}) {
    const router = useRouter();
    const [isExpanded, setIsExpanded] = useState(false);
    const pressTimer = useRef<ReturnType<typeof setTimeout> | null>(null);
    const didLongPress = useRef(false);

    const startLongPress = useCallback(() => {
        didLongPress.current = false;
        pressTimer.current = setTimeout(() => {
            didLongPress.current = true;
            router.push(`/admin/ordenes/clean?id=${order.id}`);
        }, 700);
    }, [order.id, router]);

    const cancelLongPress = useCallback(() => {
        if (pressTimer.current) {
            clearTimeout(pressTimer.current);
            pressTimer.current = null;
        }
    }, []);

    const handleTap = useCallback(() => {
        if (!didLongPress.current) {
            setIsExpanded(prev => {
                if (!prev) onExpand(String(order.id)); // trigger checklist fetch on expand
                return !prev;
            });
        }
        didLongPress.current = false;
    }, [order.id, onExpand]);

    return (
        <Card
            className={`bg-slate-700/30 border-slate-600/50 cursor-pointer select-none transition-all duration-200 active:scale-[0.99] ${hasDebt(order) ? 'border-l-4 border-l-red-500 bg-red-900/10' : ''}`}
            onMouseDown={startLongPress}
            onMouseUp={cancelLongPress}
            onMouseLeave={cancelLongPress}
            onTouchStart={startLongPress}
            onTouchEnd={cancelLongPress}
            onTouchMove={cancelLongPress}
            onClick={handleTap}
        >
            <CardContent className="p-4">
                {/* ── Summary Row (always visible) ── */}
                <div className="flex items-start gap-3">
                    <div className="w-14 h-10 bg-slate-600 rounded-lg flex items-center justify-center flex-shrink-0">
                        <span className="text-white font-mono font-bold text-xs">
                            {order.patente_vehiculo}
                        </span>
                    </div>
                    <div className="flex-1 min-w-0 overflow-hidden">
                        <div className="flex items-center gap-2 mb-1">
                            <p className="text-white font-medium truncate text-sm flex-1">
                                {vehiculo ? `${vehiculo.marca} ${vehiculo.modelo}` : order.patente_vehiculo}
                            </p>
                            {hasDebt(order) && <span className="text-red-400 text-xs flex-shrink-0">💳</span>}
                            {/* Expand indicator */}
                            <ChevronDown className={`w-4 h-4 text-slate-400 flex-shrink-0 transition-transform duration-300 ${isExpanded ? 'rotate-180' : ''}`} />
                        </div>
                        {order.cliente?.nombre_completo && (
                            <p className="text-xs text-blue-400 truncate">{order.cliente.nombre_completo}</p>
                        )}
                        {order.cliente?.telefono && (
                            <p className="text-xs text-slate-500 truncate">{order.cliente.telefono}</p>
                        )}
                        <p className="text-xs text-slate-500 truncate">
                            {new Date(order.fecha_ingreso).toLocaleDateString('es-CL', { day: '2-digit', month: '2-digit' })}{' '}
                            {new Date(order.fecha_ingreso).toLocaleTimeString('es-CL', { hour: '2-digit', minute: '2-digit' })}
                        </p>
                        <p className="text-xs text-slate-400 truncate mt-1">{getCleanMotivo(order.descripcion_ingreso)}</p>
                    </div>
                </div>

                {/* ── Accordion Detail (visible when expanded) ── */}
                <div className={`overflow-hidden transition-all duration-300 ease-in-out ${isExpanded ? 'max-h-[1600px] opacity-100 mt-3' : 'max-h-0 opacity-0'}`}>
                    <div className="pt-3 border-t border-slate-600/50 space-y-3 text-xs text-slate-300">
                        {order.descripcion_ingreso && (
                            <div>
                                <p className="text-slate-500 font-medium uppercase tracking-wider mb-1">Motivo completo</p>
                                <p className="text-slate-300 leading-relaxed">{order.descripcion_ingreso}</p>
                            </div>
                        )}
                        {order.precio_total > 0 && (
                            <div className="flex justify-between items-center bg-slate-800/60 rounded-lg px-3 py-2">
                                <span className="text-slate-400">Total:</span>
                                <span className="text-green-400 font-bold text-sm">${order.precio_total.toLocaleString('es-CL')}</span>
                            </div>
                        )}

                        {/* ── Workflow Actions (same as desktop) ── */}
                        <div
                            className="mt-4 w-full flex flex-col gap-2"
                            onClick={e => e.stopPropagation()}
                            onTouchStart={e => e.stopPropagation()}
                        >
                            <div className="flex justify-between items-end gap-2 w-full">
                                <p className="text-slate-500 font-medium uppercase tracking-wider text-[10px]">Flujo de Trabajo</p>
                                <ETAInput orderId={order.id} currentEta={order.eta_entrega || null} onUpdateETA={onUpdateETA} />
                            </div>
                            {isLoadingChecklist ? (
                                <div className="flex justify-center py-3">
                                    <Loader2 className="w-5 h-5 animate-spin text-blue-500" />
                                </div>
                            ) : (
                                <div className="w-full">
                                    <OrderWorkflowActions
                                        order={order}
                                        checklist={checklist}
                                        onOpenChecklist={onOpenChecklist}
                                        onUpdateStatus={onUpdateStatus}
                                        onOpenBitacora={onOpenBitacora}
                                    />
                                </div>
                            )}
                        </div>

                        {/* Repuestos y Materiales */}
                        <div className="space-y-3 mt-4 border-t border-slate-700/30 pt-4">
                            <h3 className="text-[10px] font-black text-slate-400 uppercase tracking-wider flex items-center gap-2">
                                <BoxIcon className="w-3.5 h-3.5" />
                                Materiales y Repuestos
                            </h3>
                            
                            {isLoadingRepuestos ? (
                                <div className="flex items-center gap-2 text-slate-500 text-[10px] py-1">
                                    <Loader2 className="w-3 h-3 animate-spin" /> Cargando...
                                </div>
                            ) : repuestos && repuestos.length > 0 ? (
                                <div className="space-y-2">
                                    {repuestos.map((rep: any) => (
                                        <div key={rep.id} className="bg-slate-800/40 rounded-lg p-2 flex justify-between items-center border border-slate-700/50">
                                            <div className="flex-1 min-w-0 pr-2">
                                                <div className="text-slate-200 font-medium truncate">{rep.producto?.nombre}</div>
                                                <div className="text-[9px] text-slate-500">{rep.cantidad} x ${rep.precio_unitario.toLocaleString('es-CL')}</div>
                                            </div>
                                            <div className="text-emerald-400 font-bold">${rep.subtotal.toLocaleString('es-CL')}</div>
                                        </div>
                                    ))}
                                    <div className="flex justify-between items-center px-1 pt-1">
                                        <span className="text-slate-500 text-[10px] font-bold uppercase">Total Materiales</span>
                                        <span className="text-emerald-400 font-black">${repuestos.reduce((acc, curr) => acc + curr.subtotal, 0).toLocaleString('es-CL')}</span>
                                    </div>
                                </div>
                            ) : (
                                <div className="text-slate-600 italic text-[10px] py-1">
                                    No hay materiales registrados.
                                </div>
                            )}
                        </div>

                        {/* Historial (Bitácora) */}
                        <div className="space-y-3 mt-4 border-t border-slate-700/30 pt-4">
                            <h3 className="text-[10px] font-black text-slate-400 uppercase tracking-wider flex items-center gap-2">
                                <HistoryIcon className="w-3.5 h-3.5" />
                                Historial Reciente (Bitácora)
                            </h3>

                            {isLoadingBitacora ? (
                                <div className="flex items-center gap-2 text-slate-500 text-[10px] py-1">
                                    <Loader2 className="w-3 h-3 animate-spin" /> Cargando...
                                </div>
                            ) : bitacoraEntries && bitacoraEntries.length > 0 ? (
                                <div className="space-y-3 relative before:absolute before:left-2 before:top-2 before:bottom-2 before:w-px before:bg-slate-700/50 pl-2">
                                    {bitacoraEntries.slice(0, 5).map((entry: any) => (
                                        <div key={entry.id} className="relative pl-6">
                                            <div className={`absolute left-[-13px] top-1 w-2 h-2 rounded-full border border-slate-900 ${
                                                entry.tipo === 'alerta' ? 'bg-orange-500' : 
                                                entry.tipo === 'repuesto' ? 'bg-emerald-500' : 
                                                entry.tipo === 'evidencia' ? 'bg-violet-500' : 'bg-blue-500'
                                            }`} />
                                            <div className="bg-slate-800/30 rounded-lg p-2 space-y-1">
                                                <div className="flex justify-between items-center">
                                                    <span className="text-[9px] text-slate-500">
                                                        {new Date(entry.created_at).toLocaleDateString('es-CL', { day: '2-digit', month: 'short' })}
                                                    </span>
                                                </div>
                                                <p className="text-[11px] text-slate-300 leading-snug">{entry.contenido}</p>
                                                {entry.fotos?.length > 0 && (
                                                    <div className="flex gap-1 overflow-x-auto pt-1">
                                                        {entry.fotos.map((f: string, i: number) => (
                                                            <img key={i} src={f} className="w-10 h-10 rounded object-cover" alt="Adv" />
                                                        ))}
                                                    </div>
                                                )}
                                            </div>
                                        </div>
                                    ))}
                                </div>
                            ) : (
                                <div className="text-slate-600 italic text-[10px] py-1">
                                    Sin avances registrados.
                                </div>
                            )}
                        </div>

                        {/* ── Quick Links (Tracking + Print) ── */}
                        <div
                            className="mt-4 mb-2 px-2"
                            onClick={e => e.stopPropagation()}
                            onTouchStart={e => e.stopPropagation()}
                        >
                            <p className="text-[11px] text-blue-400/90 bg-blue-900/20 p-2 rounded-lg border border-blue-800/30 leading-snug">
                                💡 <span className="font-semibold text-blue-300">Tip:</span> Comparte el link de tracking para que el cliente vea estos avances en tiempo real.
                            </p>
                        </div>
                        <div
                            className="grid grid-cols-2 gap-2 mt-2"
                            onClick={e => e.stopPropagation()}
                            onTouchStart={e => e.stopPropagation()}
                        >
                            <Link href={`/tracking/${order.id}`} target="_blank" onClick={e => e.stopPropagation()}>
                                <Button
                                    size="sm"
                                    variant="outline"
                                    className="w-full h-9 bg-white/10 border border-white/20 text-white hover:bg-white/20 text-xs rounded-lg"
                                    title="Ver Tracking Público"
                                >
                                    <Eye className="w-3.5 h-3.5 mr-1.5" />
                                    Tracking
                                </Button>
                            </Link>
                            {order.cliente?.telefono ? (
                                <Link
                                    href={`https://wa.me/${order.cliente.telefono.replace(/\D/g, '')}?text=${encodeURIComponent(`Hola ${order.cliente.nombre_completo || ''}, revisa el estado de tu vehículo aquí: https://app.flusize.com/tracking/${order.id}`)}`}
                                    target="_blank"
                                    onClick={e => e.stopPropagation()}
                                >
                                    <Button
                                        size="sm"
                                        variant="outline"
                                        className="w-full h-9 border-green-500/30 text-green-400 hover:bg-green-500/10 text-xs rounded-lg"
                                        title="Enviar estado al cliente"
                                    >
                                        <MessageCircle className="w-3.5 h-3.5 mr-1.5" />
                                        WhatsApp
                                    </Button>
                                </Link>
                            ) : (
                                <Button
                                    size="sm"
                                    variant="outline"
                                    className="w-full h-9 border-slate-600/50 text-slate-500 cursor-not-allowed text-xs rounded-lg flex gap-1.5"
                                    title="Cliente sin teléfono"
                                    onClick={(e) => e.stopPropagation()}
                                >
                                    <MessageCircle className="w-3.5 h-3.5 opacity-50" />
                                    WhatsApp
                                </Button>
                            )}
                            <Button
                                size="sm"
                                variant="outline"
                                className="w-full h-9 bg-white/10 border border-white/20 text-white hover:bg-white/20 text-xs rounded-lg col-span-2"
                                onClick={e => { e.stopPropagation(); onPrintOrder(order); }}
                            >
                                <Printer className="w-3.5 h-3.5 mr-1.5" />
                                Imprimir Orden
                            </Button>
                        </div>

                        <p className="text-slate-600 italic text-center text-[10px] pt-3 border-t border-slate-700/30">
                            Mantén pulsado 0.7s para edición avanzada
                        </p>
                    </div>
                </div>

                {/* ── Footer Actions ── */}
                <div className="mt-3 flex items-center justify-between gap-2 flex-wrap" onClick={e => e.stopPropagation()}>
                    <div className="flex-shrink-0">
                        {getStatusBadge(order.estado, order.id, true)}
                    </div>
                    <div className="flex items-center gap-1 flex-shrink-0">
                        {canEditOrders && (
                            <Link href={`/admin/ordenes/clean?id=${order.id}`} onClick={e => e.stopPropagation()}>
                                <Button size="sm" variant="ghost" className="text-blue-400 hover:text-blue-300 hover:bg-blue-500/10 h-8 px-2">
                                    <Edit className="w-3.5 h-3.5" />
                                </Button>
                            </Link>
                        )}
                        {canDeleteOrders && (
                            deleteConfirm === order.id ? (
                                <div className="flex gap-1">
                                    <Button
                                        size="sm"
                                        variant="ghost"
                                        className="text-red-400 hover:text-red-300 hover:bg-red-500/10 h-8 px-2"
                                        onClick={() => handleDeleteOrder(order)}
                                        disabled={deleteOrderPending}
                                    >✓</Button>
                                    <Button
                                        size="sm"
                                        variant="ghost"
                                        className="text-slate-400 hover:text-slate-300 h-8 px-2"
                                        onClick={() => setDeleteConfirm(null)}
                                    >✕</Button>
                                </div>
                            ) : (
                                <Button
                                    size="sm"
                                    variant="ghost"
                                    className="text-red-400 hover:text-red-300 hover:bg-red-500/10 h-8 px-2"
                                    onClick={() => setDeleteConfirm(order.id)}
                                >
                                    <Trash2 className="w-3.5 h-3.5" />
                                </Button>
                            )
                        )}
                    </div>
                </div>
            </CardContent>
        </Card>
    );
}
// ─────────────────────────────────────────────────────────────────────────────

export default function OrdenesPage() {

    const { toast } = useToast();
    const { user, hasPermission } = useAuth();
    const { tieneModulo } = useFlusizeFeatures();
    const planStr = normalizePlan(user?.plan);
    const hasAgenda = planHasModule(planStr, 'agenda');
    const router = useRouter();

    const [searchTerm, setSearchTerm] = useState('');
    const debouncedSearchTerm = useDebounce(searchTerm, 200);
    const [viewFilter, setViewFilter] = useState<string>('orders');
    const [statusFilter, setStatusFilter] = useState<string>('all');
    const [mechanicFilter, setMechanicFilter] = useState<string>('all');
    const [debtFilter, setDebtFilter] = useState<string>('all');
    const [dateRange, setDateRange] = useState<{ from: string; to: string }>({ from: '', to: '' });

    const restFilters = useMemo(() => ({
        status: statusFilter,
        mechanicId: mechanicFilter,
        dateRange,
        debt: debtFilter
    }), [statusFilter, mechanicFilter, dateRange, debtFilter]);

    // ─── PAGINACIÓN INFINITA (reemplaza descarga masiva)
    const {
        data: infiniteData,
        isLoading: isLoadingOrders,
        isFetchingNextPage,
        fetchNextPage,
        hasNextPage,
    } = useInfiniteOrders(30, debouncedSearchTerm, restFilters, user?.tallerId);

    const orders = useMemo(() => {
        return infiniteData?.pages.flatMap(page => page.orders) || [];
    }, [infiniteData]);

    const totalTableCount = infiniteData?.pages[0]?.count || 0;

    // Elemento observador para Infinite Scroll
    const observerTarget = useRef<HTMLDivElement>(null);

    useEffect(() => {
        const observer = new IntersectionObserver(
            entries => {
                if (entries[0].isIntersecting && hasNextPage && !isFetchingNextPage) {
                    fetchNextPage();
                }
            },
            { threshold: 0.1 }
        );

        if (observerTarget.current) {
            observer.observe(observerTarget.current);
        }

        return () => observer.disconnect();
    }, [hasNextPage, isFetchingNextPage, fetchNextPage]);

    const { data: appointments = [], isLoading: isLoadingAppointments } = useAppointments();
    const { data: perfiles = [], isLoading: isLoadingPerfiles } = usePerfiles();
    const { data: vehiculos = [], isLoading: isLoadingVehiculos } = useVehiculos();
    const deleteOrder = useDeleteOrder();
    const updateOrder = useUpdateOrder();
    const queryClient = useQueryClient();

    const [sortConfig, setSortConfig] = useState<{ key: keyof OrdenDB | 'precio_total' | 'fecha_ingreso', direction: 'asc' | 'desc' }>({ key: 'fecha_ingreso', direction: 'desc' });
    const [deleteConfirm, setDeleteConfirm] = useState<string | null>(null);

    // Checklist State
    const [checklists, setChecklists] = useState<Record<string, any>>({});
    const [loadingChecklists, setLoadingChecklists] = useState<Record<string, boolean>>({});

    // Repuestos State
    const [repuestosExp, setRepuestosExp] = useState<Record<string, any[]>>({});
    const [loadingRepuestos, setLoadingRepuestos] = useState<Record<string, boolean>>({});

    // Bitacora (Historial) State
    const [bitacoraExp, setBitacoraExp] = useState<Record<string, any[]>>({});
    const [loadingBitacora, setLoadingBitacora] = useState<Record<string, boolean>>({});

    // Checklist Dialog State
    const [checklistDialog, setChecklistDialog] = useState<{
        open: boolean;
        orderId: string | null;
        mode: 'checklist' | 'readonly_ingreso' | 'salida';
    }>({ open: false, orderId: null, mode: 'checklist' });

    // Bitacora Modal State
    const [isBitacoraModalOpen, setIsBitacoraModalOpen] = useState(false);
    const [bitacoraOrderId, setBitacoraOrderId] = useState<string | null>(null);

    // Fijar Precio Modal State
    const [isPrecioModalOpen, setIsPrecioModalOpen] = useState(false);
    const [precioOrder, setPrecioOrder] = useState<any>(null);

    const handleOpenBitacora = (orderId: string) => {
        setBitacoraOrderId(orderId);
        setIsBitacoraModalOpen(true);
    };

    const handleUpdateETA = async (orderId: string, eta: string) => {
        try {
            const { error } = await supabase.from('ordenes').update({ eta_entrega: eta || null }).eq('id', orderId);
            if (error) throw error;
            queryClient.invalidateQueries({ queryKey: ['orders'] });
            toast({ description: "ETA de entrega actualizada." });
        } catch (err) {
            console.error(err);
            toast({ description: "Error al actualizar la ETA.", variant: "destructive" });
        }
    };

    const fetchChecklist = async (orderId: string, force = false) => {
        if (!force && checklists[orderId]) return;

        setLoadingChecklists(prev => ({ ...prev, [orderId]: true }));
        try {
            const data = await obtenerChecklist(orderId);
            // Ensure data is not null before setting
            if (data) {
                setChecklists(prev => ({ ...prev, [orderId]: data }));
            }
        } catch (error) {
            console.error('Error fetching checklist:', error);
        } finally {
            setLoadingChecklists(prev => ({ ...prev, [orderId]: false }));
        }
    };

    const fetchRepuestos = async (orderId: string, force = false) => {
        if (!force && repuestosExp[orderId]) return;

        setLoadingRepuestos(prev => ({ ...prev, [orderId]: true }));
        try {
            const { data, error } = await supabase
                .from('orden_repuestos')
                .select(`
                    id,
                    cantidad,
                    precio_unitario,
                    subtotal,
                    producto:productos!orden_repuestos_producto_id_fkey(nombre, codigo)
                `)
                .eq('orden_id', orderId);
            
            // Si la tabla no existe todavía (PGRST205), se ignora silenciosamente
            if (error && error.code !== 'PGRST205' && error.code !== '42P01') throw error;
            setRepuestosExp(prev => ({ ...prev, [orderId]: data || [] }));
        } catch (error) {
            console.error('Error fetching repuestos:', error);
        } finally {
            setLoadingRepuestos(prev => ({ ...prev, [orderId]: false }));
        }
    };

    const fetchBitacora = async (orderId: string, force = false) => {
        if (!force && bitacoraExp[orderId]) return;

        setLoadingBitacora(prev => ({ ...prev, [orderId]: true }));
        try {
            const { data, error } = await supabase
                .from('bitacora_ordenes')
                .select('*')
                .eq('orden_id', orderId)
                .order('created_at', { ascending: false });
            
            if (error) throw error;
            setBitacoraExp(prev => ({ ...prev, [orderId]: data || [] }));
        } catch (error) {
            console.error('Error fetching bitacora:', error);
        } finally {
            setLoadingBitacora(prev => ({ ...prev, [orderId]: false }));
        }
    };

    const handleOpenChecklist = (orderId: string, mode: 'checklist' | 'readonly_ingreso' | 'salida') => {
        setChecklistDialog({ open: true, orderId: orderId, mode });
        fetchChecklist(orderId);
    };

    const handleChecklistClose = async () => {
        const orderId = checklistDialog.orderId;
        setChecklistDialog({ open: false, orderId: null, mode: 'checklist' });

        if (orderId) {
            // Optimización de Memoria (Fast Lane UX): Fetch solo de la orden afectada por ID
            try {
                const updatedOrder = await obtenerOrdenPorId(orderId);
                if (updatedOrder) {
                    // Actualizar TODAS las cachés reactivas (infinite, paginated, legacy) mediante coincidencia parcial de queryKey
                    queryClient.setQueriesData({ queryKey: ['orders'] }, (oldData: any) => {
                        if (!oldData) return oldData;
                        
                        // Formato 1: useInfiniteQuery (tiene pages)
                        if (oldData.pages) {
                            return {
                                ...oldData,
                                pages: oldData.pages.map((page: any) => ({
                                    ...page,
                                    orders: page.orders?.map((o: any) => String(o.id) === String(orderId) ? { ...o, ...updatedOrder } : o) || []
                                }))
                            };
                        }
                        
                        // Formato 2: Array directo (useOrders legacy, dashboard_orders)
                        if (Array.isArray(oldData)) {
                            return oldData.map((o: any) => String(o.id) === String(orderId) ? { ...o, ...updatedOrder } : o);
                        }
                        
                        // Formato 3: usePaginatedOrders ({ data: [], count: n })
                        if (oldData.data && Array.isArray(oldData.data)) {
                            return {
                                ...oldData,
                                data: oldData.data.map((o: any) => String(o.id) === String(orderId) ? { ...o, ...updatedOrder } : o)
                            };
                        }

                        return oldData;
                    });

                    // También para dashboard_orders si existe
                    queryClient.setQueriesData({ queryKey: ['dashboard_orders'] }, (oldData: any) => {
                        if (Array.isArray(oldData)) {
                            return oldData.map((o: any) => String(o.id) === String(orderId) ? { ...o, ...updatedOrder } : o);
                        }
                        return oldData;
                    });
                }
            } catch (err) {
                console.error("Error optimizando fetch por ID:", err);
            }

            // Ya no invalidamos los 1.601 registros de golpe
            // queryClient.invalidateQueries({ queryKey: ['orders'] });
            // queryClient.invalidateQueries({ queryKey: ['dashboard_orders'] });

            // Forzar actualización de router cache de Next.js
            router.refresh();

            setChecklists(prev => {
                const newState = { ...prev };
                delete newState[orderId];
                return newState;
            });
            fetchChecklist(orderId, true);
        }
    };

    const [expandedOrderId, setExpandedOrderId] = useState<string | null>(null);

    // Auto-fetch checklist and repuestos when order is expanded
    useEffect(() => {
        if (expandedOrderId !== null) {
            fetchChecklist(expandedOrderId);
            fetchRepuestos(expandedOrderId);
            fetchBitacora(expandedOrderId);
        }
    }, [expandedOrderId]);

    // AUTO-FILTRAR órdenes para mecánicos basado en permisos
    const canViewPrices = hasPermission('financials.view_totals');
    const canDeleteOrders = hasPermission('ordenes.eliminar');
    const canViewAllOrders = hasPermission('ordenes.ver_todas');
    const canEditOrders = hasPermission('ordenes.editar');
    const isLoading = isLoadingOrders;

    // Auto-filtrar órdenes si no puede ver todas
    useEffect(() => {
        if (!canViewAllOrders && user?.id) {
            setMechanicFilter(user.id);
        }
    }, [canViewAllOrders, user?.id]);

    // Memoizar mapas para búsquedas O(1) en lugar de O(n)
    const perfilesMap = useMemo(() => {
        const map = new Map<string, string>();
        perfiles.forEach(p => map.set(p.id, p.nombre_completo));
        return map;
    }, [perfiles]);

    const vehiculosMap = useMemo(() => {
        const map = new Map<string, VehiculoDB>();
        vehiculos.forEach(v => map.set(v.patente, v));
        return map;
    }, [vehiculos]);

    const getPerfilNombre = useCallback((id: string) => {
        return perfilesMap.get(id) || 'Sin asignar';
    }, [perfilesMap]);

    const hasDebt = useCallback((order: OrdenDB) => {
        // V3: Check simple 'debe' status or method - Soporta pagos mixtos (ej: "efectivo, debe")
        return order.metodo_pago?.includes('debe') || (order.estado === 'entregada' && !order.fecha_cierre);
    }, []);

    // Extraer el motivo limpio de la descripción
    const getCleanMotivo = useCallback((descripcion: string) => {
        if (!descripcion) return '-';

        // Buscar la sección de servicios
        const lines = descripcion.split('\n');
        const servicios: string[] = [];

        let inServicios = false;
        for (const line of lines) {
            if (line.trim() === 'Servicios:') {
                inServicios = true;
                continue;
            }

            if (inServicios && line.trim().startsWith('-')) {
                // Extraer solo el nombre del servicio, sin el precio
                // Formato: "- DPF ELECTRONICO: $50000" -> "DPF ELECTRONICO"
                const match = line.match(/-\s*([^:]+)/);
                if (match) {
                    servicios.push(match[1].trim());
                }
            }
        }

        // Si encontramos servicios, devolverlos unidos
        if (servicios.length > 0) {
            return servicios.join(', ');
        }

        // Fallback: devolver la primera línea no vacía
        const firstLine = lines.find(l => l.trim() !== '');
        return firstLine?.trim() || '-';
    }, []);

    const isToday = (date: string) => {
        const today = new Date();
        const orderDate = new Date(date);
        return orderDate.toDateString() === today.toDateString();
    };

    const isThisWeek = (date: string) => {
        const today = new Date();
        const orderDate = new Date(date);
        const weekAgo = new Date(today.getTime() - 7 * 24 * 60 * 60 * 1000);
        return orderDate >= weekAgo && orderDate <= today;
    };

    const isThisMonth = (date: string) => {
        const today = new Date();
        const orderDate = new Date(date);
        return orderDate.getMonth() === today.getMonth() && orderDate.getFullYear() === today.getFullYear();
    };

    // Helper to check if appointment is nearby (today or within 2 hours)
    const isAppointmentNearby = useCallback((appointmentDateTime: string) => {
        const now = new Date();
        const apptDate = new Date(appointmentDateTime);
        const diffMs = apptDate.getTime() - now.getTime();
        const diffHours = diffMs / (1000 * 60 * 60);

        // Nearby = today OR within next 2 hours
        const isToday = apptDate.toDateString() === now.toDateString();
        const isWithinTwoHours = diffHours >= 0 && diffHours <= 2;

        return isToday || isWithinTwoHours;
    }, []);

    // Convert appointment to order-like format for display
    const appointmentToOrderFormat = useCallback((appt: any): OrdenDB & { isAppointment: true } => {
        const a = appt as any;
        return {
            id: a.id,
            patente_vehiculo: a.patente_vehiculo || 'Sin patente',
            descripcion_ingreso: a.servicio_solicitado || a.titulo || 'Cita agendada',
            estado: 'agendada',
            creado_por: a.creado_por || '',
            asignado_a: null,
            fecha_ingreso: a.fecha || a.fecha_inicio,
            fecha_actualizacion: a.fecha || a.fecha_inicio,
            isAppointment: true,
            // Add other required fields with defaults
            detalle_trabajos: a.notas,
            vehiculo: a.vehiculos, // Pass nested vehicle data
            // Use nested client data from JOIN or fallback to legacy top-level
            cliente: a.clientes || {
                id: 'temp',
                nombre_completo: a.cliente_nombre || 'Sin Cliente',
                telefono: a.cliente_telefono
            },
            cliente_nombre: a.clientes?.nombre_completo || a.cliente_nombre || 'Sin Cliente',
            cliente_telefono: a.clientes?.telefono || a.cliente_telefono || '',
        } as any;
    }, []);

    // Con server-side pagination, el servidor ya filtró y ordenó por fecha.
    // Aquí solo mezclamos citas (si el usuario lo pide) y aplicamos sort de UI local sobre los ~30 registros.
    const filteredOrders = useMemo(() => {
        let itemsToFilter: (OrdenDB | (OrdenDB & { isAppointment: true }))[] = [];

        if (viewFilter === 'orders') {
            itemsToFilter = orders;
        } else if (viewFilter === 'appointments') {
            itemsToFilter = appointments.map(appointmentToOrderFormat);
        } else if (viewFilter === 'nearby') {
            const nearbyAppointments = appointments
                .filter(appt => isAppointmentNearby(appt.fecha_inicio))
                .map(appointmentToOrderFormat);
            itemsToFilter = [...orders, ...nearbyAppointments];
        } else if (viewFilter === 'all') {
            itemsToFilter = [...orders, ...appointments.map(appointmentToOrderFormat)];
        }

        // Filtrado ligero local: solo para citas y registros basura sin OT
        // Las órdenes reales ya vienen filtradas por el servidor (ILIKE)
        return itemsToFilter.filter(item => {
            if (!(item as any).isAppointment) {
                const clienteNombre = item.cliente?.nombre_completo || item.cliente_nombre;
                const isEmptyRecord =
                    (!item.patente_vehiculo || item.patente_vehiculo === 'S/P' || item.patente_vehiculo === 'NULO') &&
                    (!clienteNombre || clienteNombre === 'Sin Cliente' || clienteNombre === 'Desconocido');
                if (isEmptyRecord && !(item as any).numero_orden) return false;
                // Filtros adicionales de UI para citas integradas en modo !orders: estado, mecánico
                if (viewFilter === 'orders') return true;
            }

            // Citas: filtrar por estado, mecánico
            const matchesStatus = statusFilter === 'all' || item.estado === statusFilter;
            const matchesMechanic = mechanicFilter === 'all' || item.asignado_a === mechanicFilter;
            return matchesStatus && matchesMechanic;
        }).sort((a, b) => {
            // NULLS LAST: si le falta fecha o patente va al fondo
            const clienteA = a.cliente?.nombre_completo || a.cliente_nombre || '';
            const clienteB = b.cliente?.nombre_completo || b.cliente_nombre || '';
            const isNullA = (!a.fecha_ingreso) ||
                (!a.patente_vehiculo || a.patente_vehiculo === 'NULO' || a.patente_vehiculo === 'S/P') ||
                (!clienteA || clienteA === 'Sin Cliente' || clienteA === 'Desconocido');
            const isNullB = (!b.fecha_ingreso) ||
                (!b.patente_vehiculo || b.patente_vehiculo === 'NULO' || b.patente_vehiculo === 'S/P') ||
                (!clienteB || clienteB === 'Sin Cliente' || clienteB === 'Desconocido');

            if (isNullA && !isNullB) return 1;
            if (!isNullA && isNullB) return -1;

            const key = sortConfig.key;
            const direction = sortConfig.direction === 'asc' ? 1 : -1;
            let valA: any = (a as any)[key];
            let valB: any = (b as any)[key];

            if (key === 'fecha_ingreso') {
                valA = new Date(a.fecha_ingreso || 0).getTime();
                valB = new Date(b.fecha_ingreso || 0).getTime();
                if (valA === valB) {
                    const otA = parseInt(String((a as any).numero_orden).replace(/[^0-9]/g, '')) || 0;
                    const otB = parseInt(String((b as any).numero_orden).replace(/[^0-9]/g, '')) || 0;
                    return (otB - otA) * direction;
                }
            }

            if (valA < valB) return -1 * direction;
            if (valA > valB) return 1 * direction;
            return 0;
        });
    }, [orders, appointments, viewFilter, statusFilter, mechanicFilter, sortConfig, appointmentToOrderFormat, isAppointmentNearby]);


    const displayOrders = useMemo(() => {
        // En modo 'orders', usamos directamente los datos del infinite scroll
        if (viewFilter === 'orders') return orders;

        // En otros modos (combinados con citas), usamos el filteredOrders general
        return filteredOrders;
    }, [viewFilter, orders, filteredOrders]);

    const handleSort = (key: keyof OrdenDB | 'precio_total' | 'fecha_ingreso') => {
        setSortConfig(current => ({
            key,
            direction: current.key === key && current.direction === 'desc' ? 'asc' : 'desc'
        }));
    };

    const SortIcon = ({ column }: { column: string }) => {
        if (sortConfig.key !== column) return <ArrowUpDown className="w-3 h-3 ml-1 text-slate-500 opacity-50" />;
        return sortConfig.direction === 'asc'
            ? <ArrowUp className="w-3 h-3 ml-1 text-blue-400" />
            : <ArrowDown className="w-3 h-3 ml-1 text-blue-400" />;
    };

    const handleDeleteOrder = async (item: { id: string, isAppointment?: boolean }) => {
        try {
            if (item.isAppointment) {
                await eliminarCita(item.id);
                // Invalidar ambas queries por si acaso (las citas no son optimistas aún)
                queryClient.invalidateQueries({ queryKey: APPOINTMENTS_QUERY_KEY });
                queryClient.invalidateQueries({ queryKey: ORDERS_QUERY_KEY });
            } else {
                // Mutación optimista: La UI se actualiza de inmediato
                deleteOrder.mutate(item.id);
            }
            setDeleteConfirm(null);
        } catch (error) {
            console.error('Error al eliminar:', error);
            toast({
                title: "Error",
                description: "No se pudo eliminar el elemento",
                variant: "destructive"
            });
        }
    };

    const handleToggleStatus = useCallback(async (orderId: string, currentStatus: string) => {
        const newStatus = currentStatus === 'completada' ? 'pendiente' : 'completada';

        const updateData: any = { estado: newStatus };

        // Si se marca como completada, establecer fecha de salida y término
        if (newStatus === 'completada') {
            updateData.fecha_salida = new Date().toISOString();
            updateData.fecha_termino = new Date().toISOString();
        }
        // Si se revierte a pendiente, limpiar fechas
        else if (newStatus === 'pendiente') {
            updateData.fecha_salida = null;
            updateData.fecha_termino = null;
        }

        // Mutación optimista
        updateOrder.mutate({ id: orderId, updates: updateData });
    }, [updateOrder]);

    const getStatusBadge = (status: string, orderId?: string, interactive: boolean = false) => {
        const config: Record<string, { class: string; label: string; icon: string }> = {
            pendiente: { class: 'bg-amber-500/20 text-amber-400 border-amber-500/30', label: 'Pendiente', icon: '⏳' },
            en_progreso: { class: 'bg-blue-500/20 text-blue-400 border-blue-500/30', label: 'En Progreso', icon: '⚙️' },
            lista: { class: 'bg-emerald-500/20 text-emerald-400 border-emerald-500/30', label: 'Lista', icon: '✅' },
            completada: { class: 'bg-green-500/20 text-green-400 border-green-500/30', label: 'Completada', icon: '✓' },
            cancelada: { class: 'bg-slate-500/20 text-slate-400 border-slate-500/30', label: 'Cancelada', icon: '✖' },
            agendada: { class: 'bg-purple-500/20 text-purple-400 border-purple-500/30', label: 'Agendada', icon: '📅' },
        };
        const c = config[status] || config.pendiente;

        if (interactive && orderId) {
            return (
                <Badge
                    className={`${c.class} border cursor-pointer hover:opacity-80 transition-opacity`}
                    onClick={(e) => {
                        e.preventDefault();
                        e.stopPropagation();
                        handleToggleStatus(orderId, status);
                    }}
                >
                    {c.icon} {c.label}
                </Badge>
            );
        }

        return <Badge className={`${c.class} border`}>{c.icon} {c.label}</Badge>;
    };

    // Helper functions for data display
    const getClientInfo = (order: any) => {
        const client = order.cliente;
        return {
            nombre: client?.nombre_completo || order.cliente_nombre || 'Cliente S/R',
            telefono: client?.telefono || order.cliente_telefono || 'S/T',
            email: client?.email || order.cliente_email,
            rut: client?.rut_dni || order.cliente_rut
        };
    };

    const cleanDescription = (desc: string) => {
        if (!desc) return 'Sin descripción';
        // Remove "Motor: ..." prefix if present, but keep the rest
        // Matches "Motor: [text] - " or just "Motor: [text]"
        return desc.replace(/^Motor:.*?( - |$)/i, '').trim() || desc;
    };
    // -- HANDLERS --
    // NUEVO: Manejar Actualización de Estado Optimista
    const handleUpdateStatus = (orderId: string, newStatus: string) => {
        try {
            console.log(`Manually updating order ${orderId} to ${newStatus}`);

            const updates: any = { estado: newStatus };

            // Inyectar fecha_termino segun el estado (Micro-Fase 32)
            // "Terminado", "Finalizado" (completada) o "Listo para entrega" (lista)
            if (newStatus === 'completada' || newStatus === 'lista') {
                updates.fecha_termino = new Date().toISOString();
            }
            // Regresar a "En Proceso" o "Pendiente" limpia el timestamp
            else if (newStatus === 'en_progreso' || newStatus === 'pendiente') {
                updates.fecha_termino = null;
            }

            // Use optimistic update mutation
            updateOrder.mutate({ id: orderId, updates }, {
                onSuccess: () => {
                    toast({
                        title: "Estado actualizado",
                        description: `La orden ha pasado a estado: ${newStatus.replace('_', ' ').toUpperCase()}`,
                    });
                },
                onError: (error) => {
                    console.error("Failed to update status", error);
                    toast({
                        title: "Error",
                        description: "No se pudo actualizar el estado de la orden. Revisa la consola para más detalles.",
                        variant: "destructive",
                    });
                }
            });
        } catch (error) {
            console.error("Failed to update status", error);
            toast({
                title: "Error",
                description: "Ocurrió un error inesperado al actualizar el estado.",
                variant: "destructive",
            });
        }
    };

    const handlePrintOrder = async (order: OrdenDB | any) => {
        try {
            // Fetch checklist on demand
            const checklist = await obtenerChecklist(String(order.id));

            await generateOrderPDF({
                order,
                vehicle: order.vehiculos,
                checklist,
                companyInfo: {
                    name: "TALLER MECÁNICO",
                    address: "Av. Principal 123",
                    phone: "+56 9 1234 5678"
                }
            });
        } catch (error) {
            console.error('Error printing order:', error);
            alert('Error al generar el PDF');
        }
    };

    const handleExportPDF = () => {
        const printContent = displayOrders.map(order => {
            const vehiculo = order.vehiculo;
            return {
                patente: order.patente_vehiculo,
                vehiculo: vehiculo ? `${vehiculo.marca} ${vehiculo.modelo}` : '-',
                descripcion: order.descripcion_ingreso,
                creado_por: order.creado?.nombre_completo || getPerfilNombre(order.creado_por),
                asignado_a: order.asignado?.nombre_completo || (order.asignado_a ? getPerfilNombre(order.asignado_a) : '-'),
                estado: order.estado,
                precio: order.precio_total || 0
            };
        });

        const html = `
            <!DOCTYPE html>
            <html>
            <head>
                <meta charset="utf-8">
                <title>Órdenes de Trabajo</title>
                <style>
                    body { font-family: Arial, sans-serif; padding: 20px; }
                    .header { display: flex; align-items: center; gap: 20px; margin-bottom: 20px; }
                    .header img { height: 60px; }
                    .header h1 { color: #333; margin: 0; }
                    table { width: 100%; border-collapse: collapse; margin-top: 20px; }
                    th, td { border: 1px solid #ddd; padding: 8px; text-align: left; }
                    th { background-color: #0066FF; color: white; }
                    tr:nth-child(even) { background-color: #f2f2f2; }
                </style>
            </head>
            <body>
                <div class="header">
                    <img src="/images/logo-taller.png" alt="Logo" style="height: 120px;" />
                    <div>
                        <h1>Órdenes de Trabajo</h1>
                        <p>Total de órdenes: ${printContent.length}</p>
                    </div>
                </div>
                <table>
                    <thead>
                        <tr>
                            <th>Patente</th>
                            <th>Vehículo</th>
                            <th>Descripción</th>
                            <th>Creado por</th>
                            <th>Asignado a</th>
                            <th>Estado</th>
                            ${canViewPrices ? '<th>Precio</th>' : ''}
                        </tr>
                    </thead>
                    <tbody>
                        ${printContent.map(o => `
                            <tr>
                                <td>${o.patente}</td>
                                <td>${o.vehiculo}</td>
                                <td>${o.descripcion}</td>
                                <td>${o.creado_por}</td>
                                <td>${o.asignado_a}</td>
                                <td>${o.estado}</td>
                                ${canViewPrices ? `<td>$${o.precio.toLocaleString('es-CL')}</td>` : ''}
                            </tr>
                        `).join('')}
                    </tbody>
                </table>
            </body>
            </html>
        `;

        const printWindow = window.open('', '_blank');
        if (printWindow) {
            printWindow.document.write(html);
            printWindow.document.close();
            printWindow.focus();
            setTimeout(() => {
                printWindow.print();
            }, 250);
        }
    };

    if (isLoading) {
        return (
            <div className="flex items-center justify-center py-20">
                <Loader2 className="w-8 h-8 animate-spin text-blue-500" />
            </div>
        );
    }

    // Safety check
    console.log('Rendering orders page');

    return (
        <div className="space-y-6 px-4 md:px-0">
            {/* Header Section */}
            <div className="flex items-center gap-3">
                <div className="w-10 h-10 bg-gradient-to-br from-blue-500 to-blue-700 rounded-xl flex items-center justify-center">
                    <FileText className="w-5 h-5 text-white" />
                </div>
                <div>
                    <h1 className="text-lg md:text-2xl font-bold text-slate-900">Órdenes de Trabajo</h1>
                    <p className="text-xs md:text-sm text-slate-500">Gestión de órdenes del taller</p>
                </div>
            </div>

            {/* Filters */}
            <Card className="bg-white border-slate-200 shadow-sm overflow-hidden">
                <CardContent className="pt-6 px-3 sm:px-6">
                    <div className="flex flex-col gap-4">
                        <div className="relative">
                            <Search className="absolute left-3 top-1/2 -translate-y-1/2 w-4 h-4 text-slate-500" />
                            <Input
                                placeholder="Buscar OT, patente, cliente o marca..."
                                value={searchTerm}
                                onChange={(e) => setSearchTerm(e.target.value)}
                                className="pl-10 bg-white border-slate-200 text-slate-900 placeholder:text-slate-500 rounded-xl text-sm"
                                autoComplete="off"
                                style={{ color: '#1e293b' }}
                            />
                        </div>
                        {/* View Type Filter — solo visible si tiene módulo agenda */}
                        {hasAgenda && (
                        <div className="space-y-1.5">
                            <div className="flex items-center">
                                <label className="text-xs text-slate-600 font-medium px-1">Tipo de Vista</label>
                            </div>
                            <Select value={viewFilter} onValueChange={setViewFilter}>
                                <SelectTrigger className="bg-white border-slate-200 text-slate-900 rounded-xl text-sm h-10">
                                    <SelectValue placeholder="Solo Órdenes" />
                                </SelectTrigger>
                                <SelectContent className="bg-white border-slate-200">
                                    <SelectItem value="orders" className="text-slate-900">Solo Órdenes</SelectItem>
                                    <SelectItem value="appointments" className="text-slate-900">Solo Citas</SelectItem>
                                    <SelectItem value="nearby" className="text-slate-900">Órdenes + Citas Próximas</SelectItem>
                                    <SelectItem value="all" className="text-slate-900">Todo</SelectItem>
                                </SelectContent>
                            </Select>
                        </div>
                        )}
                        <div className="grid grid-cols-2 gap-2 sm:gap-3">
                            <div className="space-y-1.5">
                                <label className="text-xs text-slate-600 font-medium px-1">Estado</label>
                                <Select value={statusFilter} onValueChange={setStatusFilter}>
                                    <SelectTrigger className="bg-white border-slate-200 text-slate-900 rounded-xl text-xs sm:text-sm h-9">
                                        <SelectValue placeholder="Todos" />
                                    </SelectTrigger>
                                    <SelectContent className="bg-white border-slate-200">
                                        <SelectItem value="all" className="text-slate-900">Todos</SelectItem>
                                        <SelectItem value="pendiente" className="text-slate-900">⏳ Pendientes</SelectItem>
                                        <SelectItem value="completada" className="text-slate-900">✓ Completadas</SelectItem>
                                    </SelectContent>
                                </Select>
                            </div>
                            <div className="space-y-1.5">
                                <label className="text-xs text-slate-600 font-medium px-1">Mecánico</label>
                                <Select value={mechanicFilter} onValueChange={setMechanicFilter}>
                                    <SelectTrigger className="bg-white border-slate-200 text-slate-900 rounded-xl text-xs sm:text-sm h-9">
                                        <SelectValue placeholder="Todos" />
                                    </SelectTrigger>
                                    <SelectContent className="bg-white border-slate-200">
                                        <SelectItem value="all" className="text-slate-900">Todos</SelectItem>
                                        {perfiles.filter(p => p.rol === 'mecanico' || p.rol === 'taller_admin').map(perfil => (
                                            <SelectItem key={perfil.id} value={perfil.id} className="text-slate-900">
                                                {perfil.nombre_completo}
                                            </SelectItem>
                                        ))}
                                    </SelectContent>
                                </Select>
                            </div>
                            <div className="space-y-1.5">
                                <div className="flex items-center">
                                    <label className="text-xs text-slate-600 font-medium px-1">Deuda</label>
                                </div>
                                <Select value={debtFilter} onValueChange={setDebtFilter}>
                                    <SelectTrigger className="bg-white border-slate-200 text-slate-900 rounded-xl text-xs sm:text-sm h-9">
                                        <SelectValue placeholder="Todas" />
                                    </SelectTrigger>
                                    <SelectContent className="bg-white border-slate-200">
                                        <SelectItem value="all" className="text-slate-900">Todas</SelectItem>
                                        <SelectItem value="con_deuda" className="text-slate-900">Con Deuda</SelectItem>
                                        <SelectItem value="sin_deuda" className="text-slate-900">Sin Deuda</SelectItem>
                                    </SelectContent>
                                </Select>
                            </div>
                            <div className="space-y-1.5">
                                <label className="text-xs text-slate-400 font-medium px-1">Fecha</label>
                                <DropdownMenu>
                                    <DropdownMenuTrigger asChild>
                                        <Button variant="outline" className="bg-white border-slate-200 text-slate-900 rounded-xl text-xs sm:text-sm h-9 w-full justify-between font-normal hover:bg-slate-50 hover:text-slate-900">
                                            <span className="truncate">
                                                {dateRange.from ? (
                                                    dateRange.to ? `${dateRange.from} - ${dateRange.to}` : `Desde ${dateRange.from}`
                                                ) : 'Todas las fechas'}
                                            </span>
                                            <Calendar className="w-3.5 h-3.5 ml-2 opacity-50" />
                                        </Button>
                                    </DropdownMenuTrigger>
                                    <DropdownMenuContent className="w-auto p-4 bg-white border-slate-200" align="end">
                                        <DropdownMenuLabel className="text-slate-700 mb-2">Filtrar por Rango</DropdownMenuLabel>
                                        <div className="flex flex-col gap-3">
                                            <div className="grid grid-cols-2 gap-2">
                                                <div className="space-y-1">
                                                    <label className="text-xs text-slate-600">Desde</label>
                                                    <Input
                                                        type="date"
                                                        value={dateRange.from}
                                                        onChange={(e) => setDateRange(prev => ({ ...prev, from: e.target.value }))}
                                                        className="bg-white border-slate-200 h-8 text-xs text-slate-900"
                                                        style={{ color: '#1e293b' }}
                                                    />
                                                </div>
                                                <div className="space-y-1">
                                                    <label className="text-xs text-slate-600">Hasta</label>
                                                    <Input
                                                        type="date"
                                                        value={dateRange.to}
                                                        onChange={(e) => setDateRange(prev => ({ ...prev, to: e.target.value }))}
                                                        className="bg-white border-slate-200 h-8 text-xs text-slate-900"
                                                        style={{ color: '#1e293b' }}
                                                    />
                                                </div>
                                            </div>
                                            <div className="flex flex-wrap gap-2">
                                                <Button size="sm" variant="outline" className="text-xs border-slate-200 hover:bg-slate-100 text-slate-700 h-7" onClick={() => {
                                                    const today = new Date().toISOString().split('T')[0];
                                                    setDateRange({ from: today, to: today });
                                                }}>Hoy</Button>
                                                <Button size="sm" variant="outline" className="text-xs border-slate-200 hover:bg-slate-100 text-slate-700 h-7" onClick={() => {
                                                    const today = new Date();
                                                    const prev = new Date(today);
                                                    prev.setDate(prev.getDate() - 7);
                                                    setDateRange({ from: prev.toISOString().split('T')[0], to: today.toISOString().split('T')[0] });
                                                }}>7 Días</Button>
                                                <Button size="sm" variant="outline" className="text-xs border-slate-200 hover:bg-slate-100 text-slate-700 h-7" onClick={() => {
                                                    const today = new Date();
                                                    const firstDay = new Date(today.getFullYear(), today.getMonth(), 1);
                                                    setDateRange({ from: firstDay.toISOString().split('T')[0], to: today.toISOString().split('T')[0] });
                                                }}>Este Mes</Button>
                                            </div>
                                            {(dateRange.from || dateRange.to) && (
                                                <Button
                                                    size="sm"
                                                    variant="ghost"
                                                    className="text-xs text-red-400 hover:text-red-300 hover:bg-red-900/20 h-7 mt-1 w-full"
                                                    onClick={() => setDateRange({ from: '', to: '' })}
                                                >
                                                    <X className="w-3 h-3 mr-1" /> Limpiar Filtro
                                                </Button>
                                            )}
                                        </div>
                                    </DropdownMenuContent>
                                </DropdownMenu>
                            </div>
                        </div>
                        <div className="flex justify-end">
                            <Button
                                onClick={handleExportPDF}
                                className="bg-blue-600 hover:bg-blue-700 text-white rounded-xl w-full sm:w-auto text-sm h-9"
                                disabled={filteredOrders.length === 0}
                            >
                                <Download className="w-4 h-4 mr-2" />
                                Exportar PDF
                            </Button>
                        </div>
                    </div>
                </CardContent>
            </Card>

            {/* Orders Table/List */}
            <Card className="bg-white border-slate-200 shadow-sm">
                <CardHeader>
                    <CardTitle className="text-slate-900 flex justify-between items-center">
                        <span>{filteredOrders.length} orden{filteredOrders.length !== 1 ? 'es' : ''} mostradas</span>
                        <span className="text-sm text-slate-500 font-normal">Total: {totalTableCount}</span>
                    </CardTitle>
                </CardHeader>
                <CardContent>
                    {/* Desktop Table */}
                    <div className="hidden md:block overflow-x-auto">
                        <Table>
                            <TableHeader>
                                <TableRow className="border-slate-200 hover:bg-transparent">
                                    <TableHead className="text-slate-700 font-semibold cursor-pointer hover:text-blue-600" onClick={() => handleSort('patente_vehiculo')}>
                                        <div className="flex items-center">Patente <SortIcon column="patente_vehiculo" /></div>
                                    </TableHead>
                                    <TableHead className="text-slate-700 font-semibold">Vehículo</TableHead>
                                    <TableHead className="text-slate-700 font-semibold hidden xl:table-cell">Motivo</TableHead>
                                    <TableHead className="text-slate-700 font-semibold cursor-pointer hover:text-blue-600 hidden lg:table-cell" onClick={() => handleSort('asignado_a')}>
                                        <div className="flex items-center">Asignado <SortIcon column="asignado_a" /></div>
                                    </TableHead>
                                    {canViewPrices && (
                                        <TableHead className="text-slate-700 font-semibold cursor-pointer hover:text-blue-600" onClick={() => handleSort('precio_total')}>
                                            <div className="flex items-center">Total <SortIcon column="precio_total" /></div>
                                        </TableHead>
                                    )}
                                    <TableHead className="text-slate-700 font-semibold cursor-pointer hover:text-blue-600" onClick={() => handleSort('estado')}>
                                        <div className="flex items-center">Estado <SortIcon column="estado" /></div>
                                    </TableHead>
                                    <TableHead className="text-slate-700 w-[100px]"></TableHead>
                                </TableRow>
                            </TableHeader>
                            <TableBody>
                                {isLoadingOrders && (
                                    <>
                                        {[...Array(6)].map((_, i) => (
                                            <TableRow key={`skeleton-${i}`} className="border-slate-200">
                                                <TableCell><div className="h-4 bg-slate-200 rounded animate-pulse w-16"></div></TableCell>
                                                <TableCell><div className="h-4 bg-slate-200 rounded animate-pulse w-24"></div></TableCell>
                                                <TableCell className="hidden xl:table-cell"><div className="h-4 bg-slate-200 rounded animate-pulse w-32"></div></TableCell>
                                                <TableCell className="hidden lg:table-cell"><div className="h-4 bg-slate-200 rounded animate-pulse w-20"></div></TableCell>
                                                {canViewPrices && <TableCell><div className="h-4 bg-slate-200 rounded animate-pulse w-16"></div></TableCell>}
                                                <TableCell><div className="h-6 bg-slate-200 rounded-full animate-pulse w-20"></div></TableCell>
                                                <TableCell></TableCell>
                                            </TableRow>
                                        ))}
                                    </>
                                )}
                                {!isLoadingOrders && filteredOrders.length === 0 && debouncedSearchTerm && (
                                    <TableRow>
                                        <TableCell colSpan={canViewPrices ? 7 : 6} className="py-16 text-center">
                                            <div className="flex flex-col items-center gap-3 text-slate-500">
                                                <Search className="w-10 h-10 text-slate-300" />
                                                <p className="font-semibold text-slate-700">No se encontraron coincidencias</p>
                                                <p className="text-sm">No hay resultados para <strong className="text-slate-900">"{debouncedSearchTerm}"</strong> en {totalTableCount.toLocaleString('es-CL')} órdenes totales</p>
                                            </div>
                                        </TableCell>
                                    </TableRow>
                                )}
                                {!isLoadingOrders && displayOrders.map((order) => {

                                    const isExpanded = expandedOrderId === order.id;
                                    const vehiculo = order.vehiculos;
                                    const uniqueKey = (order as any).isAppointment ? `appt-${order.id}` : `order-${order.id}`;
                                    
                                    return (
                                        <Fragment key={uniqueKey}>
                                            <TableRow
                                                className={`border-slate-200 hover:bg-slate-50 cursor-pointer ${hasDebt(order) ? 'bg-red-50 border-l-4 border-l-red-500' : ''} ${isExpanded ? 'bg-slate-50' : ''}`}
                                                onClick={() => setExpandedOrderId(isExpanded ? null : order.id)}
                                            >
                                                <TableCell className="font-mono text-slate-900">
                                                    <div className="flex items-center gap-1.5">
                                                        <div className="font-bold text-sm">{order.patente_vehiculo}</div>
                                                        {hasDebt(order) && <span className="text-red-500 text-xs">💳</span>}
                                                    </div>

                                                    <div className="text-xs text-slate-700 font-medium truncate max-w-[80px]">
                                                        {order.cliente?.nombre_completo || order.cliente_nombre || 'Cliente S/R'}
                                                    </div>
                                                </TableCell>
                                                <TableCell className="text-slate-700">
                                                    <div className="text-sm truncate max-w-[100px]">
                                                        {vehiculo ? `${vehiculo.marca} ${vehiculo.modelo}` : '-'}
                                                    </div>
                                                </TableCell>
                                                <TableCell className="text-slate-700 hidden xl:table-cell" title={getCleanMotivo(order.descripcion_ingreso)}>
                                                    <div className="text-sm truncate max-w-[150px]">
                                                        {getCleanMotivo(order.descripcion_ingreso)}
                                                    </div>
                                                </TableCell>
                                                <TableCell className="text-slate-700 hidden lg:table-cell">
                                                    <div className="text-sm truncate max-w-[90px]">
                                                        {order.asignado ? order.asignado.nombre_completo : 'Sin asignar'}
                                                    </div>
                                                </TableCell>
                                                {canViewPrices && (
                                                    <TableCell className="text-slate-700">
                                                        <div className="text-sm font-semibold">
                                                            {order.precio_total ? (
                                                                <span className="text-emerald-600">
                                                                    {new Intl.NumberFormat('es-CL', { style: 'currency', currency: 'CLP' }).format(order.precio_total)}
                                                                </span>
                                                            ) : (
                                                                <Badge variant="outline" className="bg-slate-100 text-slate-400 hover:bg-slate-100 font-normal">Sin Valor</Badge>
                                                            )}
                                                        </div>
                                                    </TableCell>
                                                )}
                                                <TableCell>
                                                    <div className="flex items-center gap-1">
                                                        {getStatusBadge(order.estado, order.id, true)}
                                                    </div>
                                                </TableCell>
                                                <TableCell onClick={(e) => e.stopPropagation()}>
                                                    <div className="flex items-center gap-0.5">
                                                        {/* Expand button */}
                                                        <Button
                                                            size="sm"
                                                            variant="ghost"
                                                            className="text-slate-400 hover:text-slate-600 h-7 w-7 p-0"
                                                            onClick={(e) => {
                                                                e.stopPropagation();
                                                                const newExpandedId = isExpanded ? null : order.id;
                                                                setExpandedOrderId(newExpandedId);
                                                                if (newExpandedId) fetchChecklist(newExpandedId);
                                                            }}
                                                        >
                                                            <ChevronDown className={`w-3.5 h-3.5 transition-transform ${isExpanded ? 'rotate-180' : ''}`} />
                                                        </Button>

                                                        {/* WhatsApp / tracking link */}
                                                        {(order.cliente?.telefono || order.cliente_telefono) ? (
                                                            <Link
                                                                href={`https://wa.me/${(order.cliente?.telefono || order.cliente_telefono || '').replace(/\D/g, '')}?text=${encodeURIComponent(`Hola ${order.cliente?.nombre_completo || order.cliente_nombre || ''}, revisa el estado de tu vehículo aquí: https://app.flusize.com/tracking/${order.id}`)}`}
                                                                target="_blank"
                                                                onClick={e => e.stopPropagation()}
                                                            >
                                                                <Button size="sm" variant="ghost" className="text-green-500 hover:text-green-600 hover:bg-green-50 h-7 w-7 p-0" title="Enviar estado por WhatsApp">
                                                                    <MessageCircle className="w-3.5 h-3.5" />
                                                                </Button>
                                                            </Link>
                                                        ) : (
                                                            <Button size="sm" variant="ghost" className="text-slate-300 cursor-not-allowed h-7 w-7 p-0" title="Sin teléfono registrado" onClick={e => e.stopPropagation()} disabled>
                                                                <MessageCircle className="w-3.5 h-3.5 opacity-30" />
                                                            </Button>
                                                        )}

                                                        {/* Confirm appointment (only for appointments) */}
                                                        {(order as any).isAppointment && (
                                                            <Link href={`/recepcion?citaId=${order.id}`} onClick={(e) => e.stopPropagation()}>
                                                                <Button size="sm" variant="ghost" className="text-purple-500 hover:text-purple-600 h-7 w-7 p-0" title="Confirmar Cita">
                                                                    <CheckCircle className="w-3.5 h-3.5" />
                                                                </Button>
                                                            </Link>
                                                        )}

                                                        {/* More actions dropdown (Edit + Delete) */}
                                                        <DropdownMenu>
                                                            <DropdownMenuTrigger asChild>
                                                                <Button size="sm" variant="ghost" className="text-slate-400 hover:text-slate-600 h-7 w-7 p-0" onClick={e => e.stopPropagation()}>
                                                                    <MoreVertical className="w-3.5 h-3.5" />
                                                                </Button>
                                                            </DropdownMenuTrigger>
                                                            <DropdownMenuContent align="end" className="bg-white border-slate-200 shadow-lg">
                                                                <DropdownMenuItem asChild>
                                                                    <Link href={`/admin/ordenes/clean?id=${order.id}`} onClick={(e) => e.stopPropagation()} className="flex items-center gap-2 text-slate-700 cursor-pointer">
                                                                        <Edit className="w-3.5 h-3.5" />
                                                                        Editar Orden
                                                                    </Link>
                                                                </DropdownMenuItem>
                                                                <DropdownMenuItem
                                                                    className="flex items-center gap-2 text-emerald-600 focus:text-emerald-700 focus:bg-emerald-50 cursor-pointer"
                                                                    onClick={(e) => {
                                                                        e.stopPropagation();
                                                                        setPrecioOrder(order);
                                                                        setIsPrecioModalOpen(true);
                                                                    }}
                                                                >
                                                                    <CheckCircle className="w-3.5 h-3.5" />
                                                                    Finalizar y Cobrar
                                                                </DropdownMenuItem>
                                                                <DropdownMenuItem
                                                                    className="flex items-center gap-2 text-blue-600 focus:text-blue-700 focus:bg-blue-50 cursor-pointer"
                                                                    onClick={(e) => {
                                                                        e.stopPropagation();
                                                                        handleOpenBitacora(order.id);
                                                                    }}
                                                                >
                                                                    <FileText className="w-3.5 h-3.5" />
                                                                    Añadir Avance
                                                                </DropdownMenuItem>
                                                                {canDeleteOrders && (
                                                                    <>
                                                                        <DropdownMenuSeparator className="bg-slate-100" />
                                                                        {deleteConfirm === order.id ? (
                                                                            <div className="px-2 py-1.5 space-y-1">
                                                                                <p className="text-xs text-slate-500 font-medium">¿Confirmar eliminación?</p>
                                                                                <div className="flex gap-1">
                                                                                    <Button size="sm" variant="ghost" className="text-red-500 h-7 px-2 text-xs" onClick={(e) => { e.stopPropagation(); handleDeleteOrder(order as any); }} disabled={deleteOrder.isPending}>Sí</Button>
                                                                                    <Button size="sm" variant="ghost" className="text-slate-500 h-7 px-2 text-xs" onClick={(e) => { e.stopPropagation(); setDeleteConfirm(null); }}>No</Button>
                                                                                </div>
                                                                            </div>
                                                                        ) : (
                                                                            <DropdownMenuItem
                                                                                className="text-red-500 focus:text-red-600 focus:bg-red-50 cursor-pointer gap-2"
                                                                                onClick={(e) => { e.stopPropagation(); setDeleteConfirm(order.id); }}
                                                                            >
                                                                                <Trash2 className="w-3.5 h-3.5" />
                                                                                Eliminar
                                                                            </DropdownMenuItem>
                                                                        )}
                                                                    </>
                                                                )}
                                                            </DropdownMenuContent>
                                                        </DropdownMenu>
                                                    </div>
                                                </TableCell>
                                            </TableRow>
                                            {
                                                isExpanded && (
                                                    <TableRow key={`${order.id}-expanded`} className="border-slate-700">
                                                        <TableCell colSpan={canViewPrices ? 7 : 6} className="bg-slate-800/80 p-0">
                                                            <div className="p-6 space-y-4">
                                                                <div className="grid grid-cols-1 md:grid-cols-2 gap-4">
                                                                    {/* Información del Vehículo */}
                                                                    <div className="space-y-3">
                                                                        <h3 className="text-sm font-semibold text-slate-300 flex items-center gap-2">
                                                                            <Wrench className="w-4 h-4" />
                                                                            Información del Vehículo
                                                                        </h3>
                                                                        <div className="space-y-2 text-sm">
                                                                            <div className="flex justify-between">
                                                                                <span className="text-slate-400">Patente:</span>
                                                                                <span className="text-white font-mono font-bold">{order.patente_vehiculo}</span>
                                                                            </div>
                                                                            {vehiculo && (
                                                                                <>
                                                                                    <div className="flex justify-between">
                                                                                        <span className="text-slate-400">Marca:</span>
                                                                                        <span className="text-white">{vehiculo.marca}</span>
                                                                                    </div>
                                                                                    <div className="flex justify-between">
                                                                                        <span className="text-slate-400">Modelo:</span>
                                                                                        <span className="text-white">{vehiculo.modelo}</span>
                                                                                    </div>
                                                                                    <div className="flex justify-between">
                                                                                        <span className="text-slate-400">Año:</span>
                                                                                        <span className="text-white">{vehiculo.anio}</span>
                                                                                    </div>
                                                                                    {vehiculo.motor && (
                                                                                        <div className="flex justify-between">
                                                                                            <span className="text-slate-400">Motor:</span>
                                                                                            <span className="text-white">{vehiculo.motor}</span>
                                                                                        </div>
                                                                                    )}
                                                                                </>
                                                                            )}
                                                                        </div>
                                                                    </div>

                                                                    {/* Información del Cliente */}
                                                                    <div className="space-y-3">
                                                                        <h3 className="text-sm font-semibold text-slate-300 flex items-center gap-2">
                                                                            <User className="w-4 h-4" />
                                                                            Información del Cliente
                                                                        </h3>
                                                                        <div className="space-y-2 text-sm">
                                                                            {(() => {
                                                                                const info = getClientInfo(order);
                                                                                return (
                                                                                    <>
                                                                                        <div className="flex justify-between">
                                                                                            <span className="text-slate-400">Nombre:</span>
                                                                                            <span className="text-white font-medium">{info.nombre}</span>
                                                                                        </div>
                                                                                        <div className="flex justify-between">
                                                                                            <span className="text-slate-400">Teléfono:</span>
                                                                                            <span className="text-white">{info.telefono}</span>
                                                                                        </div>
                                                                                        {info.email && (
                                                                                            <div className="flex justify-between">
                                                                                                <span className="text-slate-400">Email:</span>
                                                                                                <span className="text-white">{info.email}</span>
                                                                                            </div>
                                                                                        )}
                                                                                        {info.rut && (
                                                                                            <div className="flex justify-between">
                                                                                                <span className="text-slate-400">RUT:</span>
                                                                                                <span className="text-white">{info.rut}</span>
                                                                                            </div>
                                                                                        )}
                                                                                    </>
                                                                                );
                                                                            })()}
                                                                        </div>
                                                                    </div>

                                                                </div>

                                                                {/* Información de la Orden */}
                                                                <div className="space-y-3">
                                                                    <h3 className="text-sm font-semibold text-slate-300 flex items-center gap-2">
                                                                        <Calendar className="w-4 h-4" />
                                                                        Detalles de la Orden
                                                                    </h3>
                                                                    <div className="space-y-2 text-sm">
                                                                        <div className="flex items-center gap-4">
                                                                            <span className="text-slate-400 min-w-[100px]">Fecha Ingreso:</span>
                                                                            <span className="text-white">
                                                                                {new Date(order.fecha_ingreso).toLocaleString('es-CL', {
                                                                                    day: '2-digit',
                                                                                    month: '2-digit',
                                                                                    year: 'numeric',
                                                                                    hour: '2-digit',
                                                                                    minute: '2-digit'
                                                                                })}
                                                                            </span>
                                                                        </div>
                                                                        {order.fecha_entrega && (
                                                                            <div className="flex items-center gap-4">
                                                                                <span className="text-slate-400 min-w-[100px]">Fecha Entrega:</span>
                                                                                <span className="text-green-400 font-semibold">
                                                                                    {new Date(order.fecha_entrega).toLocaleString('es-CL', {
                                                                                        day: '2-digit',
                                                                                        month: '2-digit',
                                                                                        year: 'numeric',
                                                                                        hour: '2-digit',
                                                                                        minute: '2-digit'
                                                                                    })}
                                                                                </span>
                                                                            </div>
                                                                        )}
                                                                        <div className="flex items-center gap-4">
                                                                            <span className="text-slate-400 min-w-[100px]">Creado por:</span>
                                                                            <span className="text-white">{getPerfilNombre(order.creado_por)}</span>
                                                                        </div>
                                                                        <div className="flex items-center gap-4">
                                                                            <span className="text-slate-400 min-w-[100px]">Asignado a:</span>
                                                                            <span className="text-white">{order.asignado_a ? getPerfilNombre(order.asignado_a) : '-'}</span>
                                                                        </div>
                                                                        <div className="flex items-center gap-4">
                                                                            <span className="text-slate-400 min-w-[100px]">Estado:</span>
                                                                            {getStatusBadge(order.estado, order.id, true)}
                                                                        </div>
                                                                    </div>
                                                                </div>

                                                                {/* Información de Pago */}
                                                                {canViewPrices && (
                                                                    <div className="space-y-3">
                                                                        <h3 className="text-sm font-semibold text-slate-300 flex items-center gap-2">
                                                                            <DollarSign className="w-4 h-4" />
                                                                            Información de Pago
                                                                        </h3>
                                                                        <div className="space-y-2 text-sm">
                                                                            {order.precio_total && (
                                                                                <div className="flex justify-between">
                                                                                    <span className="text-slate-400">Total:</span>
                                                                                    <span className="text-white font-semibold">${order.precio_total.toLocaleString('es-CL')}</span>
                                                                                </div>
                                                                            )}
                                                                            {order.metodo_pago && (
                                                                                <div className="flex justify-between">
                                                                                    <span className="text-slate-400">Método:</span>
                                                                                    <span className="text-white capitalize">{order.metodo_pago}</span>
                                                                                </div>
                                                                            )}
                                                                            {hasDebt(order) && (
                                                                                <div className="flex items-center gap-2 text-red-400 text-xs mt-2">
                                                                                    💳 Cliente tiene deuda pendiente
                                                                                </div>
                                                                            )}
                                                                        </div>
                                                                    </div>
                                                                )}
                                                            </div>

                                                            {/* Descripción Completa */}
                                                            <div className="space-y-2 mt-4">
                                                                <h3 className="text-sm font-semibold text-slate-300">Descripción del Trabajo</h3>
                                                                <div className="bg-slate-900/50 rounded-lg p-4 text-sm text-slate-300 whitespace-pre-wrap">
                                                                    {cleanDescription(order.descripcion_ingreso)}
                                                                </div>
                                                            </div>

                                                            {/* Tracking CTA Prominente */}
                                                            {(order.cliente?.telefono || order.cliente_telefono) && (
                                                                <div className="mt-6 bg-gradient-to-r from-emerald-900/40 to-slate-900/40 border border-emerald-500/20 rounded-xl p-5 shadow-lg shadow-emerald-900/10">
                                                                    <div className="flex flex-col sm:flex-row items-start sm:items-center justify-between gap-4">
                                                                        <div className="flex-1">
                                                                            <h3 className="text-emerald-400 font-black flex items-center gap-2 mb-1.5 text-base">
                                                                                <Share2 className="w-5 h-5" />
                                                                                Aumenta la Transparencia
                                                                            </h3>
                                                                            <p className="text-sm text-slate-300">
                                                                                <span className="font-semibold text-white">💡 Tip:</span> Enviar este enlace por WhatsApp <strong className="text-emerald-300">reduce en 80%</strong> las llamadas del cliente preguntando por el estado de su vehículo.
                                                                            </p>
                                                                        </div>
                                                                        <Link
                                                                            href={`https://wa.me/${(order.cliente?.telefono || order.cliente_telefono || '').replace(/\D/g, '')}?text=${encodeURIComponent(`Hola ${order.cliente?.nombre_completo || order.cliente_nombre || ''} 👋,\n\nPuedes revisar el estado de tu vehículo en tiempo real aquí:\n\n👉 https://app.flusize.com/tracking/${order.id}\n\n¡Saludos!`)}`}
                                                                            target="_blank"
                                                                            onClick={e => e.stopPropagation()}
                                                                            className="shrink-0 w-full sm:w-auto"
                                                                        >
                                                                            <Button className="w-full sm:w-auto bg-[#25D366] hover:bg-[#20bd5a] text-white font-bold h-12 px-6 shadow-xl shadow-[#25D366]/20 transition-all active:scale-95">
                                                                                <MessageCircle className="w-5 h-5 mr-2" />
                                                                                Compartir Tracking al Cliente
                                                                            </Button>
                                                                        </Link>
                                                                    </div>
                                                                </div>
                                                            )}

                                                            {/* Bitácora Section */}
                                                            <div className="mt-6 border-t border-slate-700/50 pt-6">
                                                                <div className="flex flex-col mb-5">
                                                                    <div className="flex justify-between items-center mb-4">
                                                                        <h3 className="text-base font-black text-white flex items-center gap-2 uppercase tracking-wide">
                                                                            <Activity className="w-5 h-5 text-blue-400" />
                                                                            Bitácora de Trabajo y Evidencias
                                                                        </h3>
                                                                        <div className="flex items-center gap-4">
                                                                            <ETAInput orderId={order.id} currentEta={order.eta_entrega || null} onUpdateETA={handleUpdateETA} />
                                                                            <div className="flex gap-2 self-end">
                                                                                <Button
                                                                                size="sm"
                                                                                variant="outline"
                                                                                className="h-8 border-slate-600 text-slate-300 hover:text-white hover:bg-slate-700"
                                                                                onClick={() => handlePrintOrder(order)}
                                                                            >
                                                                                <Printer className="w-3.5 h-3.5 mr-1.5" />
                                                                                Imprimir Orden
                                                                            </Button>
                                                                        </div>
                                                                    </div>
                                                                    </div>
                                                                    <p className="text-sm text-slate-400">Todo el registro de notas, fotos iniciales y avances queda aquí como línea de tiempo.</p>
                                                                </div>

                                                                {/* Acciones y Timeline Content */}
                                                                <div className="bg-slate-900/50 rounded-xl p-5 border border-slate-800 shadow-inner">
                                                                    {loadingChecklists[order.id] ? (
                                                                        <div className="flex justify-center py-6">
                                                                            <Loader2 className="w-6 h-6 animate-spin text-blue-500" />
                                                                        </div>
                                                                    ) : (
                                                                        <div className="flex flex-col gap-6">
                                                                            {/* Header Action Buttons (Zero Friction) */}
                                                                            <OrderWorkflowActions
                                                                                order={order as any}
                                                                                checklist={checklists[order.id]}
                                                                                onOpenChecklist={handleOpenChecklist}
                                                                                onUpdateStatus={handleUpdateStatus}
                                                                                onOpenBitacora={handleOpenBitacora}
                                                                            />
                                                                        </div>
                                                                    )}
                                                                </div>

                                                                {/* Repuestos y Materiales (NUEVO) */}
                                                                <div className="space-y-3">
                                                                    <h3 className="text-sm font-semibold text-slate-300 flex items-center gap-2">
                                                                        <BoxIcon className="w-4 h-4" />
                                                                        Repuestos y Materiales
                                                                    </h3>
                                                                    
                                                                    {loadingRepuestos[order.id] ? (
                                                                        <div className="flex items-center gap-2 text-slate-400 text-xs py-2">
                                                                            <Loader2 className="w-3 h-3 animate-spin" /> Cargando materiales...
                                                                        </div>
                                                                    ) : repuestosExp[order.id]?.length > 0 ? (
                                                                        <div className="bg-slate-900/30 border border-slate-700/50 rounded-lg overflow-hidden">
                                                                            <table className="w-full text-xs text-left">
                                                                                <thead>
                                                                                    <tr className="border-b border-slate-700/50 bg-slate-900/50">
                                                                                        <th className="px-3 py-2 text-slate-400 font-bold uppercase tracking-wider">Nombre</th>
                                                                                        <th className="px-3 py-2 text-slate-400 font-bold uppercase tracking-wider text-right">Cant.</th>
                                                                                        <th className="px-3 py-2 text-slate-400 font-bold uppercase tracking-wider text-right">Precio</th>
                                                                                        <th className="px-3 py-2 text-slate-400 font-bold uppercase tracking-wider text-right">Total</th>
                                                                                    </tr>
                                                                                </thead>
                                                                                <tbody className="divide-y divide-slate-700/30">
                                                                                    {repuestosExp[order.id].map((rep: any) => (
                                                                                        <tr key={rep.id} className="hover:bg-slate-700/20 transition-colors">
                                                                                            <td className="px-3 py-2 text-slate-200">
                                                                                                <div className="font-medium">{rep.producto?.nombre}</div>
                                                                                                {rep.producto?.codigo && <div className="text-[10px] text-slate-500 font-mono">{rep.producto.codigo}</div>}
                                                                                            </td>
                                                                                            <td className="px-3 py-2 text-slate-300 text-right font-mono">{rep.cantidad}</td>
                                                                                            <td className="px-3 py-2 text-slate-300 text-right">${rep.precio_unitario.toLocaleString('es-CL')}</td>
                                                                                            <td className="px-3 py-2 text-emerald-400 font-bold text-right">${rep.subtotal.toLocaleString('es-CL')}</td>
                                                                                        </tr>
                                                                                    ))}
                                                                                </tbody>
                                                                                <tfoot>
                                                                                    <tr className="bg-slate-900/50 border-t border-slate-700">
                                                                                        <td colSpan={3} className="px-3 py-2 text-slate-400 font-bold uppercase tracking-wider text-right">Total Materiales</td>
                                                                                        <td className="px-3 py-2 text-emerald-400 font-black text-right text-sm">
                                                                                            ${repuestosExp[order.id].reduce((acc: number, curr: any) => acc + curr.subtotal, 0).toLocaleString('es-CL')}
                                                                                        </td>
                                                                                    </tr>
                                                                                </tfoot>
                                                                            </table>
                                                                        </div>
                                                                    ) : (
                                                                        <div className="text-slate-500 text-xs italic py-2 px-3 bg-slate-900/20 rounded-lg border border-dashed border-slate-800">
                                                                            No se registraron repuestos en esta orden.
                                                                        </div>
                                                                    )}
                                                                </div>

                                                                {/* Historial de Avances (Bitácora) */}
                                                                <div className="space-y-3">
                                                                    <h3 className="text-sm font-semibold text-slate-300 flex items-center gap-2">
                                                                        <HistoryIcon className="w-4 h-4" />
                                                                        Historial de Avances
                                                                    </h3>

                                                                    {loadingBitacora[order.id] ? (
                                                                        <div className="flex items-center gap-2 text-slate-400 text-xs py-2">
                                                                            <Loader2 className="w-3 h-3 animate-spin" /> Cargando bitácora...
                                                                        </div>
                                                                    ) : bitacoraExp[order.id]?.length > 0 ? (
                                                                        <div className="space-y-3 relative before:absolute before:left-3 before:top-2 before:bottom-2 before:w-0.5 before:bg-slate-700/50">
                                                                            {bitacoraExp[order.id].map((entry: any) => (
                                                                                <div key={entry.id} className="relative pl-8">
                                                                                    <div className={`absolute left-1.5 top-1.5 w-3 h-3 rounded-full border-2 border-slate-900 ${
                                                                                        entry.tipo === 'alerta' ? 'bg-orange-500' : 
                                                                                        entry.tipo === 'repuesto' ? 'bg-emerald-500' : 
                                                                                        entry.tipo === 'evidencia' ? 'bg-violet-500' : 'bg-blue-500'
                                                                                    }`} />
                                                                                    <div className="bg-slate-800/40 border border-slate-700/30 rounded-xl p-3 space-y-2">
                                                                                        <div className="flex justify-between items-start gap-2">
                                                                                            <span className={`text-[10px] uppercase font-black px-1.5 py-0.5 rounded ${
                                                                                                entry.tipo === 'alerta' ? 'bg-orange-500/20 text-orange-400' : 
                                                                                                entry.tipo === 'repuesto' ? 'bg-emerald-500/20 text-emerald-400' : 
                                                                                                entry.tipo === 'evidencia' ? 'bg-violet-500/20 text-violet-400' : 'bg-blue-500/20 text-blue-400'
                                                                                            }`}>
                                                                                                {entry.tipo}
                                                                                            </span>
                                                                                            <span className="text-[10px] text-slate-500">
                                                                                                {new Date(entry.created_at).toLocaleString('es-CL', {
                                                                                                    day: '2-digit', month: 'short', hour: '2-digit', minute: '2-digit'
                                                                                                })}
                                                                                            </span>
                                                                                        </div>
                                                                                        {entry.contenido && <p className="text-xs text-slate-300">{entry.contenido}</p>}
                                                                                        
                                                                                        {entry.fotos?.length > 0 && (
                                                                                            <div className="flex gap-2 overflow-x-auto pb-1">
                                                                                                {entry.fotos.map((foto: string, idx: number) => (
                                                                                                    <img key={idx} src={foto} className="w-16 h-16 rounded-md object-cover border border-slate-700 shadow-sm" alt="Evidencia" />
                                                                                                ))}
                                                                                            </div>
                                                                                        )}

                                                                                        {entry.repuestos?.length > 0 && (
                                                                                            <div className="text-[10px] text-emerald-400 font-medium">
                                                                                                📦 {entry.repuestos.map((r: any) => {
                                                                                                    const subtotal = r.subtotal || (r.cantidad * r.precio_unitario) || 0;
                                                                                                    const precioFormat = new Intl.NumberFormat('es-CL', { style: 'currency', currency: 'CLP' }).format(subtotal);
                                                                                                    return `${r.cantidad}x ${r.nombre} (${precioFormat})`;
                                                                                                }).join(', ')}
                                                                                            </div>
                                                                                        )}
                                                                                    </div>
                                                                                </div>
                                                                            ))}
                                                                        </div>
                                                                    ) : (
                                                                        <div className="text-slate-500 text-xs italic py-2 px-3 bg-slate-900/20 rounded-lg border border-dashed border-slate-800">
                                                                            No hay registros en la bitácora aún.
                                                                        </div>
                                                                    )}
                                                                </div>
                                                            </div>
                                                        </TableCell>
                                                    </TableRow>
                                                )
                                            }
                                        </Fragment>
                                    );
                                })}
                            </TableBody>
                        </Table>

                        {/* Scroll Loading Indicator Desktop / Observer Target */}
                        <div ref={observerTarget} className="h-20 w-full flex items-center justify-center text-slate-400">
                            {(isFetchingNextPage || isLoadingOrders) ? (
                                <div className="flex items-center gap-2">
                                    <Loader2 className="w-5 h-5 animate-spin text-blue-500" />
                                    <span className="text-sm font-medium">Cargando órdenes...</span>
                                </div>
                            ) : hasNextPage ? (
                                <span className="text-xs opacity-30 italic">Desliza para cargar más</span>
                            ) : orders.length > 0 ? (
                                <span className="text-xs opacity-30 italic">Has llegado al final de las {totalTableCount} órdenes</span>
                            ) : null}
                        </div>
                    </div>

                    {/* Mobile List */}
                    <div className="md:hidden space-y-3">
                        {isLoadingOrders && (
                            <>
                                {[...Array(5)].map((_, i) => (
                                    <div key={`mob-skeleton-${i}`} className="h-[100px] bg-slate-700/20 border border-slate-600/30 rounded-xl animate-pulse"></div>
                                ))}
                            </>
                        )}

                        {!isLoadingOrders && displayOrders.map((order) => {
                            const vehiculo = order.vehiculo;
                            const uniqueKey = (order as any).isAppointment ? `appt-${order.id}` : `order-${order.id}`;
                            return (
                                <MobileOrderCard
                                    key={uniqueKey}
                                    order={order}
                                    vehiculo={vehiculo}
                                    hasDebt={hasDebt}
                                    getStatusBadge={getStatusBadge}
                                    getCleanMotivo={getCleanMotivo}
                                    canEditOrders={canEditOrders}
                                    canDeleteOrders={canDeleteOrders}
                                    deleteConfirm={deleteConfirm}
                                    setDeleteConfirm={setDeleteConfirm}
                                    handleDeleteOrder={handleDeleteOrder}
                                    deleteOrderPending={deleteOrder.isPending}
                                    checklist={checklists[order.id]}
                                    isLoadingChecklist={!!loadingChecklists[order.id]}
                                    onOpenChecklist={handleOpenChecklist}
                                    onUpdateStatus={handleUpdateStatus}
                                    onOpenBitacora={handleOpenBitacora}
                                    onUpdateETA={handleUpdateETA}
                                    onExpand={(id) => {
                                        fetchChecklist(id);
                                        fetchRepuestos(id);
                                        fetchBitacora(id);
                                    }}
                                    onPrintOrder={handlePrintOrder}
                                    bitacoraEntries={bitacoraExp[order.id]}
                                    isLoadingBitacora={loadingBitacora[order.id]}
                                    repuestos={repuestosExp[order.id]}
                                    isLoadingRepuestos={loadingRepuestos[order.id]}
                                />
                            );
                        })}

                        {/* Feedback de Carga Mobile */}
                        {isFetchingNextPage && (
                            <div className="flex flex-col gap-3 py-4">
                                {[...Array(2)].map((_, i) => (
                                    <div key={`mob-next-skeleton-${i}`} className="h-[100px] bg-slate-700/10 border border-slate-600/20 rounded-xl animate-pulse"></div>
                                ))}
                                <div className="flex justify-center">
                                    <Loader2 className="w-5 h-5 animate-spin text-blue-500" />
                                </div>
                            </div>
                        )}
                    </div>

                    {filteredOrders.length === 0 && !isLoadingOrders && (
                        <div className="text-center py-12">
                            <FileText className="w-12 h-12 mx-auto mb-3 text-slate-600" />
                            <p className="text-slate-400">No se encontraron órdenes</p>
                        </div>
                    )}
                </CardContent>
            </Card>

            {/* CHECKLIST MODAL */}
            <Dialog open={checklistDialog.open} onOpenChange={(open) => !open && handleChecklistClose()}>
                <DialogContent className="max-w-4xl bg-slate-950 border-slate-800 text-white p-0 overflow-hidden max-h-[90vh] flex flex-col">
                    <div className="p-6 overflow-y-auto flex-1">
                        <div className="mb-6 bg-white p-6 rounded-2xl shadow-sm border border-slate-200">
                            <h2 className="text-xl font-black text-slate-900 flex items-center gap-2 mb-2">
                                <ClipboardCheck className="w-6 h-6 text-blue-500" />
                                {checklistDialog.mode === 'salida' ? '🚗 Checklist de Salida' :
                                    checklistDialog.mode === 'readonly_ingreso' ? '👁️ Revisión de Ingreso' :
                                        '📋 Checklist de Vehículo'}
                            </h2>
                            <p className="text-slate-600 font-medium text-sm">
                                {checklistDialog.mode === 'salida'
                                    ? 'Completa el checklist de salida antes de entregar el vehículo al cliente.'
                                    : checklistDialog.mode === 'readonly_ingreso'
                                        ? 'Confirma el estado inicial del vehículo antes de comenzar.'
                                        : 'Gestiona el estado del vehículo.'}
                            </p>
                        </div>

                        {checklistDialog.orderId && (
                            <ChecklistForm
                                orderId={checklistDialog.orderId}
                                onClose={handleChecklistClose}
                                initialData={checklists[checklistDialog.orderId]}
                                mode={checklistDialog.mode}
                            />
                        )}
                    </div>
                </DialogContent>
            </Dialog>

            {/* BITACORA AVANCE MODAL */}
            {bitacoraOrderId && (
                <BitacoraAvanceModal
                    isOpen={isBitacoraModalOpen}
                    onClose={() => setIsBitacoraModalOpen(false)}
                    orderId={bitacoraOrderId}
                    onSaved={() => {
                        // Opcional: recargar datos o mostrar toast
                    }}
                />
            )}

            {/* FIJAR PRECIO MODAL */}
            {precioOrder && (
                <FijarPrecioModal
                    isOpen={isPrecioModalOpen}
                    onClose={() => {
                        setIsPrecioModalOpen(false);
                        setPrecioOrder(null);
                    }}
                    order={precioOrder}
                    onSaved={async () => {
                        // Optimización de Memoria: Recargar solo la orden afectada
                        try {
                            const updatedOrder = await obtenerOrdenPorId(precioOrder.id);
                            if (updatedOrder) {
                                queryClient.setQueriesData({ queryKey: ['orders'] }, (oldData: any) => {
                                    if (!oldData) return oldData;
                                    if (oldData.pages) {
                                        return {
                                            ...oldData,
                                            pages: oldData.pages.map((page: any) => ({
                                                ...page,
                                                orders: page.orders?.map((o: any) => String(o.id) === String(precioOrder.id) ? { ...o, ...updatedOrder } : o) || []
                                            }))
                                        };
                                    }
                                    return oldData;
                                });
                            }
                        } catch (err) {
                            console.error("Error actualizando cache tras cierre:", err);
                        }
                    }}
                />
            )}
        </div>
    );
}
