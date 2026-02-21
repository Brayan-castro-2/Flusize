'use client';

import { useEffect, useState } from 'react';
import { supabase } from '@/lib/supabase';
import { useParams } from 'next/navigation';
import { notFound } from 'next/navigation';
import {
    CheckCircle2,
    Circle,
    Clock,
    Wrench,
    Car,
    Camera,
    MessageSquare,
    Phone,
    MapPin,
    AlertCircle
} from 'lucide-react';
import { Button } from '@/components/ui/button';
import { Card, CardContent } from '@/components/ui/card';
import { cn } from '@/lib/utils';
import Image from 'next/image';

// --- TYPES ---
type OrderStatus = 'pendiente' | 'en_proceso' | 'completada' | 'entregada';

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
}

// --- MOCK DATA FOR PREVIEW (Fallback) ---
// const MOCK_ORDER: OrderData = { ... }; 

// --- COMPONENTS ---

const StatusTimeline = ({ currentStatus }: { currentStatus: OrderStatus }) => {
    // Logic to map DB status to display steps
    // Statuses: pendiente -> Recibido, en_proceso -> En Reparación, completada -> Listo

    const steps = [
        { id: 'pendiente', label: 'Recibido', icon: Car },
        { id: 'diagnostico', label: 'Revisión', icon: Wrench }, // Intermediate visual step
        { id: 'en_proceso', label: 'Reparación', icon: Wrench },
        { id: 'completada', label: 'Listo', icon: CheckCircle2 },
    ];

    // Determine active index based on currentStatus
    let activeIndex = 0;
    if (currentStatus === 'en_proceso') activeIndex = 2;
    if (currentStatus === 'completada' || currentStatus === 'entregada') activeIndex = 3;

    return (
        <div className="relative py-4">
            {/* Connecting Line */}
            <div className="absolute left-6 top-4 bottom-4 w-0.5 bg-slate-200" />

            <div className="space-y-8 relative">
                {steps.map((step, index) => {
                    const isActive = index === activeIndex;
                    const isCompleted = index < activeIndex;
                    const isFuture = index > activeIndex;

                    return (
                        <div key={step.id} className="flex items-start gap-4 relative z-10">
                            <div className={cn(
                                "w-12 h-12 rounded-full flex items-center justify-center shrink-0 border-4 transition-all duration-500",
                                isActive ? "bg-blue-600 border-blue-100 text-white shadow-lg shadow-blue-500/30 scale-110" :
                                    isCompleted ? "bg-green-500 border-green-100 text-white" :
                                        "bg-white border-slate-100 text-slate-300"
                            )}>
                                <step.icon className="w-5 h-5" />
                            </div>
                            <div className={cn(
                                "pt-2 transition-all duration-300",
                                isActive ? "opacity-100 translate-x-0" : "opacity-60"
                            )}>
                                <h3 className={cn("font-bold text-lg", isActive ? "text-slate-900" : "text-slate-500")}>
                                    {step.label}
                                </h3>
                                {isActive && (
                                    <p className="text-sm text-blue-600 font-medium animate-pulse">
                                        En progreso actual...
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

const Header = ({ tallerName, logoUrl }: { tallerName: string, logoUrl?: string | null }) => (
    <header className="bg-white border-b border-slate-100 sticky top-0 z-50/safe-area-inset-top">
        <div className="max-w-md mx-auto px-6 py-4 flex items-center justify-between">
            <div className="flex items-center gap-3">
                <div className="w-10 h-10 bg-slate-100 rounded-xl flex items-center justify-center overflow-hidden">
                    {/* Placeholder Logo if null */}
                    <span className="text-xl">🔧</span>
                </div>
                <div>
                    <p className="text-xs text-slate-500 uppercase tracking-wider font-semibold">Tu auto está en</p>
                    <h1 className="font-bold text-slate-900 leading-tight">{tallerName}</h1>
                </div>
            </div>
        </div>
    </header>
);

const EvidenceGallery = ({ evidencias }: { evidencias: OrderData['evidencias'] }) => {
    if (evidencias.length === 0) {
        return (
            <div className="text-center py-12 px-6 bg-slate-50 rounded-3xl border border-dashed border-slate-200">
                <div className="w-16 h-16 bg-white rounded-full flex items-center justify-center mx-auto mb-4 shadow-sm text-slate-300">
                    <Camera className="w-8 h-8" />
                </div>
                <h3 className="text-slate-900 font-semibold mb-1">Sin evidencias aún</h3>
                <p className="text-slate-500 text-sm">El mecánico subirá fotos del progreso pronto.</p>
            </div>
        );
    }

    return (
        <div className="grid grid-cols-2 gap-3">
            {evidencias.map((ev, idx) => (
                <div key={idx} className="aspect-square relative rounded-2xl overflow-hidden bg-slate-100 group">
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

export default function OrderPublicPage() {
    const params = useParams();
    const id = params?.id as string;

    const [order, setOrder] = useState<OrderData | null>(null);
    const [loading, setLoading] = useState(true);
    const [error, setError] = useState<string | null>(null);

    useEffect(() => {
        async function fetchOrder() {
            if (!id) return;
            try {
                // 1. Fetch Order with Relations (NO HINTS!)
                const { data: orderData, error: orderError } = await supabase
                    .from('ordenes')
                    .select('*, vehiculos(*), talleres:taller_id(*)')
                    .eq('id', id)
                    .single();

                if (orderError) throw orderError;
                if (!orderData) throw new Error('Orden no encontrada');

                // 2. Fetch Evidence (If separated table exists, else use fotos_urls)
                // Assuming 'evidencia_orden' table as per prompt, OR 'fotos_urls' array in order
                // Let's check if 'fotos_urls' is used in V3 (yes usually)
                // But prompt said "Tabla evidencia_orden". I'll try to fetch that too.

                let evidencias: any[] = [];
                // Check if `evidencia_orden` exists or just use `fotos_urls`
                if (orderData.fotos_urls && Array.isArray(orderData.fotos_urls)) {
                    evidencias = orderData.fotos_urls.map((url: string) => ({ url, tipo: 'foto', comentario: null }));
                }

                // If specialized table exists (check prompt: "Tabla evidencia_orden: Tiene url_foto...")
                const { data: evData } = await supabase
                    .from('evidencia_orden')
                    .select('*')
                    .eq('orden_id', id);

                if (evData && evData.length > 0) {
                    evidencias = [...evidencias, ...evData.map(e => ({
                        url: e.url_foto,
                        tipo: 'foto',
                        comentario: e.comentario
                    }))];
                }

                // Map to UI Structure
                const mappedOrder: OrderData = {
                    id: orderData.id,
                    numero_orden: orderData.numero_orden || orderData.id.slice(0, 6),
                    estado: orderData.estado,
                    descripcion_ingreso: orderData.descripcion_ingreso,
                    fecha_ingreso: orderData.fecha_ingreso,
                    fecha_entrega: orderData.fecha_entrega,
                    vehiculo: {
                        marca: orderData.vehiculos?.marca || 'Marca',
                        modelo: orderData.vehiculos?.modelo || 'Modelo',
                        patente: orderData.vehiculos?.patente || 'Patente',
                        anio: orderData.vehiculos?.ano?.toString() || orderData.vehiculos?.anio?.toString() || '-',
                        color: orderData.vehiculos?.color || '-'
                    },
                    taller: {
                        nombre: orderData.talleres?.nombre || 'Taller Mecánico',
                        direccion: orderData.talleres?.direccion || '-',
                        telefono: orderData.talleres?.telefono || '-',
                        logo_url: orderData.talleres?.logo_url
                    },
                    evidencias
                };

                setOrder(mappedOrder);
            } catch (err: any) {
                console.error(err);
                setError(err.message === 'Orden no encontrada' ? '404' : 'Error cargando datos');
            } finally {
                setLoading(false);
            }
        }

        fetchOrder();
    }, [id]);

    if (loading) {
        return (
            <div className="min-h-screen bg-slate-50 flex items-center justify-center">
                <div className="w-8 h-8 border-4 border-blue-600 border-t-transparent rounded-full animate-spin" />
            </div>
        );
    }

    if (error === '404' || !order) {
        return (
            <div className="min-h-screen bg-slate-50 flex flex-col items-center justify-center p-6 text-center">
                <div className="w-16 h-16 bg-red-100 rounded-full flex items-center justify-center mb-4 text-red-500">
                    <AlertCircle className="w-8 h-8" />
                </div>
                <h1 className="text-2xl font-bold text-slate-900">Orden no encontrada</h1>
                <p className="text-slate-500 mt-2">El enlace podría estar expirado o ser incorrecto.</p>
            </div>
        );
    }

    return (
        <div className="min-h-screen bg-slate-50 pb-24">
            <Header tallerName={order.taller.nombre} logoUrl={order.taller.logo_url} />

            <main className="max-w-md mx-auto p-6 space-y-8">

                {/* Vehicle Card */}
                <Card className="border-0 shadow-xl shadow-blue-500/5 overflow-hidden rounded-3xl bg-white">
                    <div className="bg-gradient-to-r from-blue-600 to-cyan-500 p-6 text-white relative overflow-hidden">
                        <div className="relative z-10">
                            <p className="text-blue-100 font-medium mb-1">Vehículo en servicio</p>
                            <h2 className="text-3xl font-bold">{order.vehiculo.marca} {order.vehiculo.modelo}</h2>
                            <p className="opacity-80 mt-1 font-mono tracking-wider bg-white/10 w-fit px-2 py-0.5 rounded text-sm">
                                {order.vehiculo.patente}
                            </p>
                        </div>
                        <Car className="absolute -bottom-4 -right-4 w-32 h-32 text-white/10 rotate-12" />
                    </div>
                </Card>

                {/* Timeline */}
                <section>
                    <h3 className="text-slate-900 font-bold text-lg mb-4 flex items-center gap-2">
                        <Clock className="w-5 h-5 text-blue-600" />
                        Estado actual
                    </h3>
                    <div className="bg-white rounded-3xl p-6 shadow-sm border border-slate-100">
                        <StatusTimeline currentStatus={order.estado} />
                    </div>
                </section>

                {/* Evidence */}
                <section>
                    <h3 className="text-slate-900 font-bold text-lg mb-4 flex items-center gap-2">
                        <Camera className="w-5 h-5 text-green-600" />
                        Evidencias y Fotos
                    </h3>
                    <EvidenceGallery evidencias={order.evidencias} />
                </section>

                {/* Details */}
                <section>
                    <Card className="rounded-3xl border-slate-100 shadow-sm">
                        <CardContent className="p-6 space-y-4">
                            <h3 className="font-bold text-slate-900">Detalles del Ingreso</h3>
                            <div>
                                <p className="text-xs text-slate-400 uppercase font-bold">Motivo</p>
                                <p className="text-slate-700">{order.descripcion_ingreso}</p>
                            </div>
                            <div>
                                <p className="text-xs text-slate-400 uppercase font-bold">Fecha Ingreso</p>
                                <p className="text-slate-700">{new Date(order.fecha_ingreso).toLocaleDateString()}</p>
                            </div>
                        </CardContent>
                    </Card>
                </section>
            </main>

            {/* Sticky CTA */}
            <div className="fixed bottom-0 left-0 right-0 p-4 bg-white/80 backdrop-blur-md border-t border-slate-200 safe-area-inset-bottom z-40">
                <div className="max-w-md mx-auto flex gap-3">
                    <Button className="flex-1 rounded-xl h-12 text-base font-semibold bg-blue-600 hover:bg-blue-700 shadow-lg shadow-blue-500/20 gap-2">
                        🔔 Recibir Alertas
                    </Button>
                    {order.taller.telefono && (
                        <Button variant="outline" size="icon" className="h-12 w-12 rounded-xl border-slate-200" onClick={() => window.open(`https://wa.me/${order.taller.telefono}`, '_blank')}>
                            <MessageSquare className="w-5 h-5 text-green-600" />
                        </Button>
                    )}
                </div>
            </div>
        </div>
    );
}
