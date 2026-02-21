'use client';

import { useEffect, useState } from 'react';
import { supabase } from '@/lib/supabase';
import { useParams } from 'next/navigation';
import {
    CheckCircle2,
    Clock,
    Wrench,
    Car,
    Camera,
    MessageSquare,
    AlertCircle,
    MapPin,
    Phone
} from 'lucide-react';
import { Button } from '@/components/ui/button';
import { Card, CardContent } from '@/components/ui/card';
import { cn } from '@/lib/utils';
import Image from 'next/image';

// --- TYPES ---
type OrderStatus = 'pendiente' | 'en_proceso' | 'completada' | 'entregada' | 'debe' | 'cancelada';

interface OrderData {
    id: string;
    numero_orden: string;
    estado: OrderStatus;
    descripcion_ingreso: string;
    fecha_ingreso: string;
    fecha_entrega: string | null;
    vehiculo: {
        marca: string;
        modelo: string;
        patente: string;
        anio: string;
        color: string;
    };
    taller: {
        nombre: string;
        direccion: string;
        telefono: string;
        logo_url: string | null;
    };
    evidencias: {
        url: string;
        tipo: 'foto' | 'video';
        comentario: string | null;
    }[];
    isReviewed?: boolean;
}

// --- COMPONENTS ---

const StatusTimeline = ({ currentStatus, isReviewed }: { currentStatus: OrderStatus, isReviewed?: boolean }) => {
    // Logic to map DB status to display steps
    // Statuses based on standard flow

    const steps = [
        { id: 'pendiente', label: 'Recibido', icon: Car, date: null },
        { id: 'diagnostico', label: 'Revisión', icon: Wrench, date: null }, // Intermediate visual step
        { id: 'en_proceso', label: 'Reparación', icon: Wrench, date: null },
        { id: 'completada', label: 'Listo', icon: CheckCircle2, date: null },
    ];

    // Determine active index based on currentStatus
    let activeIndex = 0;

    // Logic for steps
    if (currentStatus === 'en_proceso') activeIndex = 2;
    if (currentStatus === 'completada' || currentStatus === 'debe') activeIndex = 3;
    if (currentStatus === 'entregada') activeIndex = 4; // All steps completed

    // Special case: Reviewed but still Pending (Waiting for repair start)
    const isWaitingRequests = currentStatus === 'pendiente' && isReviewed;
    if (isWaitingRequests) {
        activeIndex = 2; // Advance to Repair step visually
    }

    return (
        <div className="relative py-4 pl-2">
            {/* Connecting Line */}
            <div className="absolute left-[29px] top-6 bottom-6 w-0.5 bg-slate-200" />

            <div className="space-y-8 relative">
                {steps.map((step, index) => {
                    const isActive = index === activeIndex;
                    const isCompleted = index < activeIndex;

                    // Custom styling for Waiting state
                    const isWaitingStep = isWaitingRequests && index === 2;

                    return (
                        <div key={step.id} className="flex items-start gap-4 relative z-10 group">
                            <div className={cn(
                                "w-14 h-14 rounded-full flex items-center justify-center shrink-0 border-[3px] transition-all duration-500 bg-white",
                                // Waiting state -> Orange/slate? Or just Blue but different text?
                                // Let's use clean Slate/Orange to indicate paused
                                isWaitingStep ? "border-amber-400 text-amber-500 shadow-xl shadow-amber-500/20" :
                                    isActive ? "border-blue-600 text-blue-600 shadow-xl shadow-blue-500/20 scale-110" :
                                        isCompleted ? "border-green-500 text-green-500" :
                                            "border-slate-100 text-slate-300"
                            )}>
                                <step.icon className={cn("w-6 h-6", (isActive && !isWaitingStep) && "animate-pulse")} />
                            </div>
                            <div className={cn(
                                "pt-3 transition-all duration-300",
                                isActive || isCompleted ? "opacity-100" : "opacity-50"
                            )}>
                                <h3 className={cn("font-bold text-lg leading-none mb-1",
                                    isWaitingStep ? "text-slate-900" :
                                        isActive ? "text-slate-900" : isCompleted ? "text-slate-700" : "text-slate-400")}>
                                    {step.label}
                                </h3>
                                {isActive && (
                                    <p className={cn("text-sm font-medium", isWaitingStep ? "text-amber-500" : "text-blue-600")}>
                                        {isWaitingStep ? 'En espera de inicio' :
                                            index === 3 ? 'Listo para retiro' : 'En progreso actual'}
                                    </p>
                                )}
                                {isCompleted && (
                                    <p className="text-xs text-slate-400 font-medium uppercase tracking-wide">
                                        Completado
                                    </p>
                                )}
                            </div>
                        </div>
                    );
                })}
            </div>
        </div>
    );
};

const EvidenceGallery = ({ evidencias }: { evidencias: OrderData['evidencias'] }) => {
    if (evidencias.length === 0) {
        return (
            <div className="text-center py-12 px-6 bg-slate-50 rounded-3xl border border-dashed border-slate-200">
                <div className="w-16 h-16 bg-white rounded-full flex items-center justify-center mx-auto mb-4 shadow-sm text-slate-300">
                    <Camera className="w-8 h-8" />
                </div>
                <h3 className="text-slate-900 font-semibold mb-1">Sin evidencias aún</h3>
                <p className="text-slate-500 text-sm">Tu mecánico aún no carga evidencia. Cuando lo haga, aparecerá aquí.</p>
            </div>
        );
    }

    return (
        <div className="grid grid-cols-2 gap-3">
            {evidencias.map((ev, idx) => (
                <div key={idx} className="aspect-square relative rounded-2xl overflow-hidden bg-slate-100 group shadow-sm cursor-pointer">
                    <Image
                        src={ev.url}
                        alt="Evidencia"
                        fill
                        className="object-cover transition-transform duration-500 group-hover:scale-110"
                    />
                    {ev.comentario && (
                        <div className="absolute bottom-0 left-0 right-0 bg-black/60 p-2 backdrop-blur-sm">
                            <p className="text-xs text-white truncate">{ev.comentario}</p>
                        </div>
                    )}
                </div>
            ))}
        </div>
    );
};

// --- MAIN PAGE ---

export default function OrderTrackingPage() {
    const params = useParams();
    const id = params?.orden_id as string; // Check path param name in nextjs folder structure

    const [order, setOrder] = useState<OrderData | null>(null);
    const [loading, setLoading] = useState(true);
    const [error, setError] = useState<string | null>(null);

    useEffect(() => {
        async function fetchOrder() {
            if (!id) return;
            try {
                // 1. Fetch Order with Relations (Simplified)
                let query = supabase
                    .from('ordenes')
                    .select(`
                        *,
                        vehiculos (
                            marca, modelo, patente, ano, color, motor
                        ),
                        talleres (
                            nombre, direccion, telefono, logo_url
                        )
                    `)
                    .eq('id', id)
                    .single();

                let { data: rawOrderData, error: orderError } = await query;
                const orderData = rawOrderData as any;

                // Fallback attempt is likely not needed if the first one is correct, 
                // but if we keep it, let's make it consistent.
                if (orderError) {
                    console.warn("Query failed, trying simpler query...", orderError);
                    // Retry without inner selects if relations fail? 
                    // Or just try to get the order itself.
                    const retryQuery = supabase
                        .from('ordenes')
                        .select('*')
                        .eq('id', id)
                        .single();

                    const retryResult = await retryQuery;
                    if (retryResult.error) {
                        throw retryResult.error;
                    }
                    // orderData = retryResult.data; // This would mismatch types if not cast
                    // We will handle specific fallbacks in mapping
                }

                if (!orderData) throw new Error('Orden no encontrada');

                // Map results to expected structure
                // Supabase returns arrays for relations sometimes if not one-to-one is detected perfectly
                const order = {
                    ...orderData,
                    vehiculo: Array.isArray(orderData.vehiculos) ? orderData.vehiculos[0] : orderData.vehiculos,
                    taller: Array.isArray(orderData.talleres) ? orderData.talleres[0] : orderData.talleres,
                    // evidencias: orderData.evidencias || []
                };

                // Map to UI Structure
                const mappedOrder: OrderData = {
                    id: orderData.id,
                    numero_orden: orderData.numero_orden || orderData.id.slice(0, 6),
                    estado: orderData.estado,
                    descripcion_ingreso: orderData.descripcion_ingreso,
                    fecha_ingreso: orderData.fecha_ingreso,
                    fecha_entrega: orderData.fecha_entrega,
                    vehiculo: {
                        marca: orderData.vehiculo?.marca || 'Marca',
                        modelo: orderData.vehiculo?.modelo || 'Modelo',
                        patente: orderData.vehiculo?.patente || 'Patente',
                        anio: orderData.vehiculo?.ano?.toString() || orderData.vehiculos?.anio?.toString() || '-',
                        color: orderData.vehiculo?.color || '-'
                    },
                    taller: {
                        nombre: orderData.taller?.nombre || 'Taller Mecánico',
                        direccion: orderData.taller?.direccion || '-',
                        telefono: orderData.taller?.telefono || '',
                        logo_url: orderData.taller?.logo_url
                    },
                    evidencias: orderData.evidencias?.map((e: any) => ({
                        url: e.url_foto || e.url, // Handle both potential field names
                        tipo: e.tipo || 'foto',
                        comentario: e.comentario
                    })) || []
                };

                // Merge legacy fotos_urls if evidencias table empty
                if (mappedOrder.evidencias.length === 0 && orderData.fotos_urls && Array.isArray(orderData.fotos_urls)) {
                    mappedOrder.evidencias = orderData.fotos_urls.map((url: string) => ({ url, tipo: 'foto', comentario: null }));
                }

                // 2. Fetch Checklist Status (for intermediate state)
                const { data: checklistData } = await supabase
                    .from('listas_chequeo')
                    .select('revisado_por_mecanico_at')
                    .eq('orden_id', id)
                    .maybeSingle();

                const isReviewed = !!checklistData?.revisado_por_mecanico_at;

                setOrder({ ...mappedOrder, isReviewed });
            } catch (err: any) {
                console.error(err);
                setError(err.message || 'Error cargando datos');
            } finally {
                setLoading(false);
            }
        }

        fetchOrder();
    }, [id]);

    if (loading) {
        return (
            <div className="min-h-[60vh] flex items-center justify-center">
                <div className="flex flex-col items-center gap-4">
                    <div className="w-12 h-12 border-4 border-blue-600 border-t-transparent rounded-full animate-spin" />
                    <p className="text-slate-400 font-medium animate-pulse">Cargando tu vehículo...</p>
                </div>
            </div>
        );
    }

    if (error || !order) {
        return (
            <div className="min-h-[80vh] flex flex-col items-center justify-center p-6 text-center">
                <div className="w-20 h-20 bg-red-50 rounded-full flex items-center justify-center mb-6 text-red-500 shadow-sm border border-red-100">
                    <AlertCircle className="w-10 h-10" />
                </div>
                <h1 className="text-2xl font-bold text-slate-900 mb-2">No encontramos esa orden</h1>
                <p className="text-slate-500 max-w-xs mx-auto">
                    El enlace podría estar expirado o el vehículo ya fue retirado.
                </p>
                <Button className="mt-8 bg-slate-900 text-white rounded-xl" onClick={() => window.location.reload()}>
                    Intentar nuevamente
                </Button>
            </div>
        );
    }

    return (
        <div className="pb-32">

            {/* Workshop Info Bar */}
            <div className="bg-white px-6 py-4 border-b border-slate-100">
                <h1 className="font-bold text-xl text-slate-900 leading-tight">{order.taller.nombre}</h1>
                <div className="flex items-center gap-4 mt-2 text-sm text-slate-500">
                    {order.taller.direccion !== '-' && (
                        <div className="flex items-center gap-1">
                            <MapPin className="w-3.5 h-3.5" />
                            <span className="truncate max-w-[150px]">{order.taller.direccion}</span>
                        </div>
                    )}
                </div>
            </div>

            <main className="max-w-md mx-auto p-6 space-y-8">

                {/* Hero / Vehicle Card */}
                <div className="relative pt-4">
                    <div className="absolute top-0 right-0 -mr-6 -mt-6 opacity-5">
                        <Car className="w-48 h-48" />
                    </div>

                    <div className="relative z-10">
                        <p className="text-slate-500 text-sm font-medium uppercase tracking-wider mb-1">Vehículo en Taller</p>
                        <h2 className="text-4xl font-extrabold text-slate-900 tracking-tight leading-none mb-2">
                            {order.vehiculo.marca} {order.vehiculo.modelo}
                        </h2>
                        <div className="inline-flex items-center px-3 py-1 bg-slate-100 rounded-lg text-slate-600 font-mono font-bold text-sm border border-slate-200">
                            {order.vehiculo.patente}
                        </div>
                    </div>
                </div>

                {/* Timeline */}
                <section>
                    <div className="flex items-center justify-between mb-6">
                        <h3 className="text-slate-900 font-bold text-lg flex items-center gap-2">
                            Estado del servicio
                        </h3>
                        {order.estado === 'completada' && (
                            <span className="inline-flex items-center px-2.5 py-0.5 rounded-full text-xs font-medium bg-green-100 text-green-800">
                                Listo para retiro
                            </span>
                        )}
                    </div>

                    <StatusTimeline currentStatus={order.estado} isReviewed={order.isReviewed} />
                </section>

                {/* Evidence */}
                <section>
                    <div className="flex items-center justify-between mb-4">
                        <h3 className="text-slate-900 font-bold text-lg flex items-center gap-2">
                            Galería de trabajo
                        </h3>
                        <span className="text-xs text-slate-400 font-medium">
                            {order.evidencias.length} fotos
                        </span>
                    </div>
                    <EvidenceGallery evidencias={order.evidencias} />
                </section>

                {/* Details Card */}
                <Card className="rounded-3xl border-slate-100 shadow-xl shadow-slate-200/50 bg-white overflow-hidden">
                    <div className="bg-slate-50 px-6 py-4 border-b border-slate-100">
                        <h3 className="font-bold text-slate-900 flex items-center gap-2">
                            <MessageSquare className="w-4 h-4 text-slate-400" />
                            Detalles del Ingreso
                        </h3>
                    </div>
                    <CardContent className="p-6 space-y-4">
                        <div>
                            <p className="text-xs text-slate-400 uppercase font-bold tracking-wider mb-1">Motivo / Problema</p>
                            <p className="text-slate-700 leading-relaxed font-medium">{order.descripcion_ingreso}</p>
                        </div>
                        <div className="grid grid-cols-2 gap-4 pt-2">
                            <div>
                                <p className="text-xs text-slate-400 uppercase font-bold tracking-wider mb-1">Ingreso</p>
                                <p className="text-slate-900 font-mono text-sm">{new Date(order.fecha_ingreso).toLocaleDateString()}</p>
                            </div>
                            <div>
                                <p className="text-xs text-slate-400 uppercase font-bold tracking-wider mb-1">Orden #</p>
                                <p className="text-slate-900 font-mono text-sm">#{order.numero_orden}</p>
                            </div>
                        </div>
                    </CardContent>
                </Card>

                {/* Spacing for FAB */}
                <div className="h-12" />
            </main>

            {/* Floating Action Button / Bottom Bar */}
            <div className="fixed bottom-0 left-0 right-0 p-4 bg-white/90 backdrop-blur-xl border-t border-slate-200 safe-area-inset-bottom z-40 transition-transform duration-500 translate-y-0">
                <div className="max-w-md mx-auto flex flex-col gap-3">
                    <Button className="w-full rounded-2xl h-14 text-lg font-bold bg-blue-600 hover:bg-blue-700 shadow-lg shadow-blue-500/30 active:scale-[0.98] transition-all">
                        Crear cuenta para ver historial
                    </Button>

                    {order.taller.telefono && (
                        <Button
                            variant="ghost"
                            className="w-full h-10 text-slate-500 hover:text-green-600 hover:bg-green-50 rounded-xl"
                            onClick={() => window.open(`https://wa.me/${order.taller.telefono}`, '_blank')}
                        >
                            <Phone className="w-4 h-4 mr-2" />
                            Contactar al Taller
                        </Button >
                    )
                    }
                </div >
            </div >
        </div >
    );
}
