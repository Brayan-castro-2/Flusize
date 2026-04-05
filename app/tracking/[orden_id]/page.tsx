'use client';

import { useEffect, useState, useRef } from 'react';
import { supabase } from '@/lib/supabase';
import { useParams, useRouter } from 'next/navigation';
import { useAuth } from '@/contexts/auth-context';
import { FirmaCanvas } from '@/components/contratos/firma-canvas';
import { ContratoDocumento } from '@/components/contratos/contrato-documento';
import type { ContratoData } from '@/components/contratos/contrato-documento';
import {
    Check,
    Wrench,
    Car,
    Camera,
    AlertCircle,
    MessageCircle,
    Navigation,
    MapPin,
    Phone,
    Clock,
    Sparkles,
    ArrowRight,
    ClipboardCheck,
    PackageCheck,
    ChevronLeft,
    Share2,
    FileText,
    ChevronRight,
    ClipboardList,
    Fuel,
    Zap,
    Activity,
    Cog,
    Settings
} from 'lucide-react';
import { sileo } from 'sileo';
import { Button } from '@/components/ui/button';
import { Badge } from '@/components/ui/badge';

// ─────────────────────────────────────────
// TYPES
// ─────────────────────────────────────────
type OrderStatus = 'pendiente' | 'en_proceso' | 'completada' | 'entregada' | 'cancelada';

interface TrackingData {
    id: string;
    numero_orden: string;
    estado: OrderStatus;
    descripcion_problema: string | null;
    descripcion_ingreso: string | null;
    fecha_ingreso: string;
    fotos_urls: string[];
    patente_vehiculo: string | null;
    vehiculo: {
        marca: string | null;
        modelo: string | null;
        patente: string;
        ano: number | null;
        motor?: string;
        potencia_hp?: string;
        torque_nm?: string;
        transmision?: string;
        traccion?: string;
        color?: string;
    } | null;
    detalles_vehiculo: string | null;
    taller: {
        nombre: string;
        telefono: string | null;
        direccion: string | null;
        latitud: number | null;
        longitud: number | null;
    } | null;
    checklistFotos: string[];
    revisado: boolean;
    tipo_orden?: string;
    eta_entrega?: string | null;
    repuestos?: {
        nombre: string;
        cantidad: number;
        precio_unitario: number;
        subtotal: number;
    }[];
}

// Contrato pendiente (para firma en tracking)
interface ContratoTracking {
    id: string;
    tipo: 'venta' | 'arriendo';
    estado: 'pendiente_firma' | 'firmado' | 'borrador';
    vehiculo_patente: string | null;
    vehiculo_marca: string | null;
    vehiculo_modelo: string | null;
    vehiculo_color: string | null;
    vehiculo_anio: string | null;
    vehiculo_motor: string | null;
    cliente_nombre: string | null;
    cliente_rut: string | null;
    cliente_domicilio: string | null;
    cliente_telefono: string | null;
    precio_total: number | null;
    pie_pagado: number | null;
    saldo_pendiente: number | null;
    precio_dia: number | null;
    fecha_salida: string | null;
    fecha_retorno: string | null;
    dias: number | null;
    firma_base64: string | null;
    vendedor_firma_base64: string | null;
    firmado_en: string | null;
}

// ─────────────────────────────────────────
// TIMELINE CONFIG
// ─────────────────────────────────────────
type StepStatus = "done" | "active" | "pending";
interface Step { label: string; description: string; status: StepStatus; icon: React.ReactNode; time?: string }

function getActiveStep(estado: OrderStatus, revisado: boolean): number {
    if (estado === 'entregada') return 4;
    if (estado === 'completada') return 3;
    if (estado === 'en_proceso') return 2;
    if (estado === 'pendiente' && revisado) return 1;
    return 0;
}

// ─────────────────────────────────────────
// DATA FETCHER
// ─────────────────────────────────────────
async function fetchTracking(id: string): Promise<TrackingData | null> {
    console.log('[Tracking Debug] fetchTracking started for id:', id);
    const { data: raw, error } = await supabase
        .from('ordenes')
        .select(`
      id, numero_orden, estado, descripcion_problema, descripcion_ingreso,
      fecha_ingreso, fotos_urls, patente_vehiculo, tipo_orden, eta_entrega,
      vehiculos:vehiculos!vehiculo_local_id ( marca, modelo, patente, ano ),
      talleres ( nombre, telefono, direccion, latitud, longitud )
    `)
        .eq('id', id)
        .single();

    console.log('[Tracking Debug] fetchTracking raw response:', !!raw, error);

    if (error || !raw) return null;

    const d = raw as any;
    const veh = Array.isArray(d.vehiculos) ? d.vehiculos[0] : d.vehiculos;
    const taller = Array.isArray(d.talleres) ? d.talleres[0] : d.talleres;

    const { data: checklist } = await supabase
        .from('listas_chequeo')
        .select('fotos, fotos_salida, revisado_por_mecanico_at')
        .eq('orden_id', id)
        .maybeSingle();

    console.log('[Tracking Debug] fetchTracking checklist:', !!checklist);

    const extractUrls = (obj: any): string[] => {
        if (!obj || typeof obj !== 'object') return [];
        return Object.values(obj).filter((v): v is string => typeof v === 'string' && v.startsWith('http'));
    };

    const checklistFotos = [
        ...extractUrls(checklist?.fotos),
        ...extractUrls(checklist?.fotos_salida),
    ];

    const { data: repData } = await supabase
        .from('orden_repuestos')
        .select(`
            cantidad, precio_unitario, subtotal,
            producto:productos!orden_repuestos_producto_id_fkey (nombre)
        `)
        .eq('orden_id', id);

    const repuestos = repData?.map((r: any) => ({
        nombre: r.producto?.nombre || 'Repuesto',
        cantidad: r.cantidad,
        precio_unitario: r.precio_unitario,
        subtotal: r.subtotal
    })) || [];

    const orderFotos: string[] = Array.isArray(d.fotos_urls) ? d.fotos_urls.filter(Boolean) : [];

    return {
        id: d.id,
        numero_orden: d.numero_orden || d.id.slice(0, 8).toUpperCase(),
        estado: d.estado || 'pendiente',
        descripcion_problema: d.descripcion_problema,
        descripcion_ingreso: d.descripcion_ingreso,
        fecha_ingreso: d.fecha_ingreso,
        fotos_urls: [...new Set([...orderFotos, ...checklistFotos])],
        patente_vehiculo: d.patente_vehiculo,
        detalles_vehiculo: d.detalles_vehiculo,
        vehiculo: veh ? {
            marca: veh.marca,
            modelo: veh.modelo,
            patente: veh.patente || d.patente_vehiculo || '—',
            ano: veh.ano,
        } : null,
        taller: taller ? {
            nombre: taller.nombre,
            telefono: taller.telefono,
            direccion: taller.direccion,
            latitud: taller.latitud,
            longitud: taller.longitud,
        } : null,
        checklistFotos,
        revisado: !!checklist?.revisado_por_mecanico_at,
        repuestos,
    };
}

// ─────────────────────────────────────────
// SUB-COMPONENTS (Light Mode versions based on Design)
// ─────────────────────────────────────────

function TrackingHeader({ data, onBack }: { data: TrackingData, onBack: () => void }) {
    const veh = data.vehiculo;
    const nombreVehiculo = veh?.marca && veh?.modelo ? `${veh.marca} ${veh.modelo} ${veh.ano || ''}`.trim() : 'Vehículo';
    const patente = veh?.patente || data.patente_vehiculo || '—';
    
    const kmMatch = data.detalles_vehiculo?.match(/\[KM:\s*([^\]]+)\]/);
    const kilometrajeIngreso = kmMatch ? kmMatch[1] : null;

    return (
        <header className="relative px-4 pb-6 pt-6">
            <div className="flex items-center justify-between mb-8">
                <button
                    onClick={onBack}
                    className="flex h-9 w-9 items-center justify-center rounded-full bg-slate-100 text-slate-500 transition-colors hover:bg-slate-200"
                    aria-label="Volver"
                >
                    <ChevronLeft className="h-5 w-5" />
                </button>
                <div className="flex items-center gap-1.5">
                    <div className="h-6 w-6 rounded-md bg-blue-600 flex items-center justify-center">
                        <span className="text-[10px] font-bold text-white tracking-tight">F</span>
                    </div>
                    <span className="text-sm font-bold text-slate-800 tracking-tight">flusize</span>
                </div>
                <button className="flex h-9 w-9 items-center justify-center rounded-full bg-slate-100 text-slate-500 transition-colors hover:bg-slate-200" aria-label="Compartir">
                    <Share2 className="h-4 w-4" />
                </button>
            </div>

            <div className="flex items-start gap-4">
                <div className="flex h-14 w-14 shrink-0 items-center justify-center rounded-2xl bg-blue-50 text-blue-600 border border-blue-100/50">
                    <Car className="h-7 w-7" />
                </div>
                <div className="flex-1 min-w-0">
                    <h1 className="text-xl font-bold text-slate-800 leading-tight">{nombreVehiculo}</h1>
                    <div className="mt-2 flex flex-wrap items-center gap-2">
                        <Badge className="bg-slate-100 text-slate-600 border-transparent font-mono text-xs tracking-wider px-3 py-1 hover:bg-slate-100 shadow-sm">
                            {patente}
                        </Badge>
                        <Badge className="bg-blue-50 text-blue-700 border-transparent text-xs px-3 py-1 hover:bg-blue-50 shadow-sm">
                            Orden #{data.numero_orden}
                        </Badge>
                        {kilometrajeIngreso && (
                            <Badge className="bg-emerald-50 text-emerald-700 border-emerald-200 text-xs px-3 py-1 shadow-sm">
                                {kilometrajeIngreso}
                            </Badge>
                        )}
                    </div>
                </div>
            </div>
        </header>
    );
}

function StatusTimeline({ data }: { data: TrackingData }) {
    const activeIdx = getActiveStep(data.estado, data.revisado);

    const stepConfigs = [
        { label: "Recibido", description: "Tu vehículo fue ingresado al taller", icon: <ClipboardCheck className="h-4 w-4" /> },
        { label: "Diagnóstico", description: "Inspección completa realizada", icon: <Check className="h-4 w-4" /> },
        { label: "En Reparación", description: "El técnico está trabajando en tu auto", icon: <Wrench className="h-4 w-4" /> },
        { label: "Listo para Retiro", description: "Te avisaremos cuando esté listo", icon: <PackageCheck className="h-4 w-4" /> },
    ];

    const steps: Step[] = stepConfigs.map((cfg, idx) => ({
        ...cfg,
        status: idx < activeIdx ? "done" : idx === activeIdx ? "active" : "pending",
    }));

    const StepIndicator = ({ status, icon }: { status: StepStatus; icon: React.ReactNode }) => {
        if (status === "done") return (
            <div className="relative z-10 flex h-9 w-9 items-center justify-center rounded-full bg-blue-600 text-white shadow-lg shadow-blue-200">
                <Check className="h-4 w-4" />
            </div>
        )
        if (status === "active") return (
            <div className="relative z-10 flex h-9 w-9 items-center justify-center">
                <div className="absolute inset-0 rounded-full bg-blue-500/20 animate-pulse-ring" />
                <div className="absolute inset-0.5 rounded-full bg-blue-400/10 animate-ping" style={{ animationDuration: "2s" }} />
                <div className="relative flex h-9 w-9 items-center justify-center rounded-full bg-blue-600 text-white shadow-xl shadow-blue-300">{icon}</div>
            </div>
        )
        return <div className="relative z-10 flex h-9 w-9 items-center justify-center rounded-full border-2 border-slate-200 bg-white text-slate-400">{icon}</div>
    }

    return (
        <section className="px-5 py-4" aria-label="Estado de la orden">
            <h2 className="text-xs font-bold text-slate-400 uppercase tracking-widest mb-6">Estado de tu orden</h2>
            <div className="relative">
                {steps.map((step, index) => {
                    const isLast = index === steps.length - 1
                    return (
                        <div key={step.label} className="relative flex gap-4 pb-8 last:pb-0">
                            {!isLast && (
                                <div
                                    className="absolute left-[17px] top-9 h-[calc(100%-1rem)] w-[2px]"
                                    style={{ background: step.status === "done" ? "#2563eb" : "#e2e8f0" }} // blue-600 or slate-200
                                />
                            )}
                            <StepIndicator status={step.status} icon={step.icon} />
                            <div className="flex-1 pt-1">
                                <div className="flex items-center justify-between">
                                    <h3 className={`text-sm font-bold ${step.status === "active" ? "text-blue-700" : step.status === "done" ? "text-slate-800" : "text-slate-400"}`}>
                                        {step.label}
                                    </h3>
                                    {step.status === "done" && index === 0 && <span className="text-[10px] font-medium text-slate-400">
                                        {new Date(data.fecha_ingreso).toLocaleTimeString('es-CL', { hour: '2-digit', minute: '2-digit' })}
                                    </span>}
                                </div>
                                <p className={`mt-0.5 text-xs leading-relaxed ${step.status === "pending" ? "text-slate-400" : "text-slate-500"}`}>
                                    {step.description}
                                </p>
                                {step.status === "active" && (
                                    <div className="mt-2 flex items-center gap-1.5">
                                        <div className="h-1.5 w-1.5 rounded-full bg-blue-600 animate-pulse" />
                                        <span className="text-[11px] font-bold text-blue-600 uppercase tracking-wider">En progreso</span>
                                    </div>
                                )}
                            </div>
                        </div>
                    )
                })}
            </div>
        </section>
    )
}

function LiveActionCard({ fotos, onOpenFotos, onOpenDetails }: { fotos: string[], onOpenFotos: () => void, onOpenDetails: () => void }) {
    // Use actual data length
    const photoCount = fotos.length;

    return (
        <section className="px-4 py-2">
            <div className="rounded-2xl border border-slate-100 bg-white p-5 shadow-sm">
                <div className="flex items-center gap-3 mb-5">
                    <div className="flex h-11 w-11 items-center justify-center rounded-xl bg-blue-50 text-blue-600">
                        <ClipboardList className="h-5 w-5" />
                    </div>
                    <div>
                        <h3 className="text-sm font-bold text-slate-800">Checklist e Inspección</h3>
                        <p className="text-xs text-slate-500 mt-0.5">Avances fotográficos y diagnóstico</p>
                    </div>
                </div>
                <div className="flex gap-3">
                    <Button
                        onClick={onOpenFotos}
                        className="flex-1 h-11 rounded-xl bg-blue-600 text-white hover:bg-blue-700 text-sm font-bold shadow-sm shadow-blue-200"
                    >
                        <Camera className="h-4 w-4 mr-2" /> Ver Fotos ({photoCount})
                    </Button>
                    <Button
                        onClick={onOpenDetails}
                        variant="outline"
                        className="flex-1 h-11 rounded-xl border-slate-200 bg-slate-50 text-slate-700 hover:bg-slate-100 text-sm font-bold"
                    >
                        <FileText className="h-4 w-4 mr-2" /> Detalle <ChevronRight className="h-3.5 w-3.5 text-slate-400 ml-1" />
                    </Button>
                </div>
            </div>
        </section>
    )
}

function UpsellCard({ trackingId, isLoggedIn, userName }: { trackingId: string, isLoggedIn: boolean, userName: string | null }) {
    if (isLoggedIn) {
        return (
            <section className="px-4 py-2">
                <div className="relative overflow-hidden bg-gradient-to-br from-blue-50 to-cyan-50 border border-blue-100 rounded-2xl p-5 shadow-sm">
                    <div className="absolute -right-6 -top-6 w-24 h-24 bg-blue-100/50 rounded-full" />
                    <div className="absolute -left-4 -bottom-4 w-16 h-16 bg-cyan-100/50 rounded-full" />

                    <div className="relative z-10 flex items-center gap-2 mb-2">
                        <Sparkles className="h-4 w-4 text-blue-600" />
                        <h3 className="text-[10px] font-bold text-blue-600 uppercase tracking-widest">Cuenta Activa</h3>
                    </div>
                    <div className="relative z-10">
                        <h4 className="text-base font-bold text-slate-800 mb-1">¡Hola{userName ? ` ${userName}` : ''}! 👋</h4>
                        <p className="text-[13px] text-slate-600 leading-relaxed mb-4">
                            Estás viendo el estado de un vehículo guardado en tu cuenta de Flusize.
                        </p>
                        <a href="/mi-garage" className="inline-flex h-11 w-full items-center justify-center rounded-xl bg-blue-600 text-sm font-bold text-white transition-colors hover:bg-blue-700 shadow-sm shadow-blue-200">
                            Volver a Mi Garage <ChevronRight className="ml-1.5 h-4 w-4" />
                        </a>
                    </div>
                </div>
            </section>
        );
    }

    return (
        <section className="px-4 py-2">
            <div className="relative overflow-hidden bg-gradient-to-br from-blue-50 to-cyan-50 border border-blue-100 rounded-2xl p-5 shadow-sm">
                <div className="absolute -right-6 -top-6 w-24 h-24 bg-blue-100/50 rounded-full" />
                <div className="absolute -left-4 -bottom-4 w-16 h-16 bg-cyan-100/50 rounded-full" />

                <div className="relative z-10 flex items-center gap-2 mb-2">
                    <Sparkles className="h-4 w-4 text-blue-600" />
                    <h3 className="text-[10px] font-bold text-blue-600 uppercase tracking-widest">Recomendado</h3>
                </div>
                <div className="relative z-10">
                    <h4 className="text-base font-bold text-slate-800 mb-1">No pierdas tu historial.</h4>
                    <p className="text-[13px] text-slate-600 leading-relaxed mb-4">
                        Crea tu cuenta gratis en Flusize para ver tus gastos, historial de reparaciones y recordatorios de mantenimiento en un solo lugar.
                    </p>

                    <a href={`/login?claim_id=${trackingId}`} className="mb-2 inline-flex h-11 w-full items-center justify-center rounded-xl bg-white border border-slate-200 text-sm font-bold text-slate-700 transition-colors hover:bg-slate-50 shadow-sm">
                        <svg className="w-5 h-5 mr-2.5" viewBox="0 0 24 24">
                            <path d="M22.56 12.25c0-.78-.07-1.53-.2-2.25H12v4.26h5.92c-.26 1.37-1.04 2.53-2.21 3.31v2.77h3.57c2.08-1.92 3.28-4.74 3.28-8.09z" fill="#4285F4" />
                            <path d="M12 23c2.97 0 5.46-.98 7.28-2.66l-3.57-2.77c-.98.66-2.23 1.06-3.71 1.06-2.86 0-5.29-1.93-6.16-4.53H2.18v2.84C3.99 20.53 7.7 23 12 23z" fill="#34A853" />
                            <path d="M5.84 14.09c-.22-.66-.35-1.36-.35-2.09s.13-1.43.35-2.09V7.07H2.18C1.43 8.55 1 10.22 1 12s.43 3.45 1.18 4.93l2.85-2.22.81-.62z" fill="#FBBC05" />
                            <path d="M12 5.38c1.62 0 3.06.56 4.21 1.64l3.15-3.15C17.45 2.09 14.97 1 12 1 7.7 1 3.99 3.47 2.18 7.07l3.66 2.84c.87-2.6 3.3-4.53 6.16-4.53z" fill="#EA4335" />
                        </svg>
                        Registrarse con Google
                    </a>

                    <a href={`/login?claim_id=${trackingId}`} className="inline-flex h-11 w-full items-center justify-center rounded-xl bg-blue-600 text-sm font-bold text-white transition-colors hover:bg-blue-700 shadow-sm shadow-blue-200">
                        Usar correo electrónico <ArrowRight className="ml-1.5 h-4 w-4" />
                    </a>
                </div>
            </div>
        </section>
    )
}

function WorkshopFooter({ taller, numeroOrden }: { taller: TrackingData['taller'], numeroOrden: string }) {
    if (!taller) return null;

    const phone = taller.telefono?.replace(/\D/g, '') || '';
    const waMsg = encodeURIComponent(`Hola, consulto por la orden #${numeroOrden}`);
    const waLink = phone ? `https://wa.me/${phone}?text=${waMsg}` : null;

    const lat = taller.latitud;
    const lng = taller.longitud;

    // Waze fallback a dirección si no hay lat/lng
    const wazeLink = (lat && lng)
        ? `https://waze.com/ul?ll=${lat},${lng}&navigate=yes`
        : taller.direccion ? `https://waze.com/ul?q=${encodeURIComponent(taller.direccion)}` : null;

    // Maps fallback a dirección si no hay lat/lng
    const mapsLink = (lat && lng)
        ? `https://www.google.com/maps/search/?api=1&query=${lat},${lng}`
        : taller.direccion ? `https://www.google.com/maps/search/?api=1&query=${encodeURIComponent(taller.direccion)}` : null;

    const uberLink = taller.direccion ? `https://m.uber.com/ul/?action=setPickup&pickup=my_location&dropoff[formatted_address]=${encodeURIComponent(taller.direccion)}` : null;

    const initial = taller.nombre.substring(0, 2).toUpperCase();

    const copiarDireccion = () => {
        if (taller.direccion) {
            navigator.clipboard.writeText(taller.direccion);
            sileo.success({
                title: "Dirección Copiada",
                description: "La dirección del taller está en tu portapapeles.",
            });
        }
    };

    return (
        <footer className="px-4 pt-2 pb-8">
            <div className="rounded-2xl border border-slate-100 bg-white p-5 shadow-sm">
                <div className="flex items-center gap-4 mb-5">
                    <div className="flex h-12 w-12 items-center justify-center rounded-xl bg-slate-50 text-slate-800 font-bold text-sm">
                        {initial}
                    </div>
                    <div className="flex-1 min-w-0">
                        <h3 className="text-sm font-bold text-slate-800 tracking-tight">{taller.nombre}</h3>
                        {taller.direccion && (
                            <button
                                onClick={copiarDireccion}
                                className="flex items-center gap-1.5 mt-1 cursor-pointer hover:bg-slate-50 p-1 -ml-1 rounded transition-colors group border-none bg-transparent outline-none w-full text-left"
                                title="Copiar dirección"
                            >
                                <MapPin className="h-3.5 w-3.5 shrink-0 text-slate-400 group-hover:text-blue-500 transition-colors" />
                                <span className="text-[13px] text-slate-500 truncate group-hover:text-slate-700">{taller.direccion}</span>
                            </button>
                        )}
                    </div>
                </div>
                {taller.telefono && (
                    <div className="flex items-center gap-2 mb-5 px-1 bg-slate-50 p-2 rounded-lg border border-slate-100">
                        <Phone className="h-3.5 w-3.5 text-slate-500" />
                        <span className="text-xs font-semibold text-slate-700">{taller.telefono}</span>
                        <span className="text-xs text-slate-300 mx-1">|</span>
                        <span className="text-xs text-slate-500">Contactar para consultas</span>
                    </div>
                )}

                <h4 className="text-[11px] font-bold text-slate-400 uppercase tracking-widest mb-3">Acciones rápidas</h4>
                <div className="grid grid-cols-2 gap-3">
                    {waLink ? (
                        <Button className="h-11 rounded-[14px] text-[13px] font-bold shadow-none bg-emerald-50 text-emerald-600 hover:bg-emerald-100 border-none" asChild>
                            <a href={waLink} target="_blank" rel="noopener noreferrer">
                                <MessageCircle className="h-4 w-4 mr-1.5" /> WhatsApp
                            </a>
                        </Button>
                    ) : (
                        <Button disabled className="h-11 rounded-[14px] text-[13px] font-bold bg-[#f8f9fa] text-slate-300 border-none shadow-none">
                            Sin WhatsApp
                        </Button>
                    )}

                    {uberLink ? (
                        <Button className="h-11 rounded-[14px] text-[13px] font-bold bg-black text-white hover:bg-slate-900 border-none shadow-none" asChild>
                            <a href={uberLink} target="_blank" rel="noopener noreferrer">
                                <Car className="h-4 w-4 mr-1.5" /> Pedir Uber
                            </a>
                        </Button>
                    ) : (
                        <div />
                    )}

                    {wazeLink && (
                        <Button className="h-11 rounded-[14px] text-[13px] font-bold bg-[#3bd7fd] hover:bg-[#2bc7ed] text-black border-none shadow-none" asChild>
                            <a href={wazeLink} target="_blank" rel="noopener noreferrer">
                                <Navigation className="h-4 w-4 mr-1.5" /> Waze
                            </a>
                        </Button>
                    )}

                    {mapsLink && (
                        <Button className="h-11 rounded-[14px] text-[13px] font-bold bg-white text-blue-600 border border-blue-200 hover:bg-blue-50 shadow-none" asChild>
                            <a href={mapsLink} target="_blank" rel="noopener noreferrer">
                                <MapPin className="h-4 w-4 mr-1.5" /> Maps
                            </a>
                        </Button>
                    )}
                </div>
            </div>
            <p className="text-center text-[11px] text-slate-400 mt-6">
                Seguimiento potenciado por <span className="font-bold text-slate-500 tracking-tight">flusize</span>
            </p>
        </footer>
    )
}

// ─────────────────────────────────────────
// EXTRA: Simple Photo Gallery Modal & Details Modal
// ─────────────────────────────────────────
function PhotoLightbox({ fotos, activeIdx, onClose, onNext, onPrev }: { fotos: string[], activeIdx: number, onClose: () => void, onNext: () => void, onPrev: () => void }) {
    return (
        <div className="fixed inset-0 z-50 bg-slate-900/95 backdrop-blur-sm flex flex-col items-center justify-center">
            <div className="absolute top-4 right-4 text-white p-2" onClick={onClose}><AlertCircle className="rotate-45" /></div>
            <div className="relative w-full max-w-lg aspect-square p-4">
                {fotos[activeIdx] && (
                    <img src={fotos[activeIdx]} className="w-full h-full object-contain rounded-lg" alt="Evidencia" />
                )}
            </div>
            <div className="flex gap-4 mt-6">
                <Button variant="outline" className="bg-white text-slate-800" onClick={onPrev} disabled={activeIdx <= 0}>Anterior</Button>
                <span className="text-white font-mono flex items-center">{activeIdx + 1} / {fotos.length}</span>
                <Button variant="outline" className="bg-white text-slate-800" onClick={onNext} disabled={activeIdx >= fotos.length - 1}>Siguiente</Button>
            </div>
            <Button variant="ghost" className="mt-4 text-white" onClick={onClose}>Cerrar Galería</Button>
        </div>
    )
}

function DetailsModal({ data, onClose }: { data: TrackingData, onClose: () => void }) {
    const desc = data.descripcion_problema || data.descripcion_ingreso;

    return (
        <div className="fixed inset-0 z-50 bg-slate-900/40 backdrop-blur-sm flex items-center justify-center p-4" onClick={onClose}>
            <div className="bg-white rounded-2xl shadow-xl w-full max-w-md overflow-hidden relative" onClick={e => e.stopPropagation()}>
                <div className="p-5 border-b border-slate-100 flex items-center justify-between bg-slate-50">
                    <div className="flex items-center gap-3">
                        <div className="w-10 h-10 rounded-xl bg-blue-100 text-blue-600 flex items-center justify-center">
                            <ClipboardList className="w-5 h-5" />
                        </div>
                        <div>
                            <h3 className="font-bold text-slate-800">Detalles de la Orden</h3>
                            <p className="text-xs text-slate-500">Orden #{data.numero_orden}</p>
                        </div>
                    </div>
                    <button onClick={onClose} className="w-8 h-8 flex items-center justify-center rounded-full bg-slate-200 text-slate-500 hover:bg-slate-300">
                        <AlertCircle className="rotate-45 w-5 h-5" />
                    </button>
                </div>

                <div className="p-5 space-y-4">
                    {desc ? (
                        <div className="bg-slate-50 rounded-xl p-4 border border-slate-100">
                            <p className="text-xs font-bold text-slate-400 uppercase tracking-widest mb-2">Motivo del Ingreso</p>
                            <p className="text-sm text-slate-700 leading-relaxed">{desc}</p>
                        </div>
                    ) : (
                        <div className="bg-slate-50 rounded-xl p-4 border border-slate-100 text-center">
                            <p className="text-sm text-slate-500">No hay una descripción registrada.</p>
                        </div>
                    )}

                    <div className="grid grid-cols-2 gap-3">
                        <div className="bg-slate-50 rounded-xl p-3 border border-slate-100">
                            <p className="text-xs font-bold text-slate-400 uppercase mb-1">Fecha Ingreso</p>
                            <p className="text-sm font-bold text-slate-800">
                                {new Date(data.fecha_ingreso).toLocaleDateString('es-CL', { day: '2-digit', month: 'short', year: 'numeric' })}
                            </p>
                        </div>
                        <div className="bg-slate-50 rounded-xl p-3 border border-slate-100">
                            <p className="text-xs font-bold text-slate-400 uppercase mb-1">Patente</p>
                            <p className="text-sm font-bold text-slate-800 font-mono">
                                {data.vehiculo?.patente || data.patente_vehiculo || '—'}
                            </p>
                        </div>
                    </div>

                    {/* Repuestos / Materiales */}
                    {data.repuestos && data.repuestos.length > 0 && (
                        <div className="mt-4">
                            <p className="text-xs font-bold text-slate-400 uppercase tracking-widest mb-3">Materiales Utilizados</p>
                            <div className="space-y-2">
                                {data.repuestos.map((item, idx) => (
                                    <div key={idx} className="flex items-center justify-between bg-slate-50 p-2.5 rounded-xl border border-slate-100">
                                        <div className="flex items-center gap-3">
                                            <div className="w-7 h-7 bg-blue-50 rounded-lg flex items-center justify-center shrink-0">
                                                <PackageCheck className="w-3.5 h-3.5 text-blue-600" />
                                            </div>
                                            <div className="min-w-0">
                                                <p className="text-xs font-bold text-slate-700 truncate leading-none mb-1.5">{item.nombre}</p>
                                                <p className="text-[10px] uppercase font-bold text-slate-500 leading-none">Cant: {item.cantidad}</p>
                                            </div>
                                        </div>
                                    </div>
                                ))}
                            </div>
                        </div>
                    )}

                    {/* Ficha Técnica GetAPI */}
                    {data.vehiculo && (
                        <div className="mt-4">
                            <p className="text-xs font-bold text-slate-400 uppercase tracking-widest mb-3">Ficha Técnica</p>
                            <div className="grid grid-cols-2 gap-2">
                                <div className="flex items-center gap-2 bg-slate-50 p-2.5 rounded-xl border border-slate-100">
                                    <div className="w-7 h-7 bg-cyan-50 rounded-lg flex items-center justify-center shrink-0">
                                        <Fuel className="w-3.5 h-3.5 text-cyan-600" />
                                    </div>
                                    <div className="min-w-0">
                                        <p className="text-[10px] uppercase font-bold text-slate-400 leading-none mb-1">Motor</p>
                                        <p className="text-xs font-bold text-slate-700 truncate leading-none">{data.vehiculo.motor || 'N/A'}</p>
                                    </div>
                                </div>
                                <div className="flex items-center gap-2 bg-slate-50 p-2.5 rounded-xl border border-slate-100">
                                    <div className="w-7 h-7 bg-cyan-50 rounded-lg flex items-center justify-center shrink-0">
                                        <Zap className="w-3.5 h-3.5 text-cyan-600" />
                                    </div>
                                    <div className="min-w-0">
                                        <p className="text-[10px] uppercase font-bold text-slate-400 leading-none mb-1">Potencia</p>
                                        <p className="text-xs font-bold text-slate-700 truncate leading-none">{data.vehiculo.potencia_hp ? `${data.vehiculo.potencia_hp} HP` : 'N/A'}</p>
                                    </div>
                                </div>
                                <div className="flex items-center gap-2 bg-slate-50 p-2.5 rounded-xl border border-slate-100">
                                    <div className="w-7 h-7 bg-cyan-50 rounded-lg flex items-center justify-center shrink-0">
                                        <Activity className="w-3.5 h-3.5 text-cyan-600" />
                                    </div>
                                    <div className="min-w-0">
                                        <p className="text-[10px] uppercase font-bold text-slate-400 leading-none mb-1">Torque</p>
                                        <p className="text-xs font-bold text-slate-700 truncate leading-none">{data.vehiculo.torque_nm ? `${data.vehiculo.torque_nm} Nm` : 'N/A'}</p>
                                    </div>
                                </div>
                                <div className="flex items-center gap-2 bg-slate-50 p-2.5 rounded-xl border border-slate-100">
                                    <div className="w-7 h-7 bg-cyan-50 rounded-lg flex items-center justify-center shrink-0">
                                        <Cog className="w-3.5 h-3.5 text-cyan-600" />
                                    </div>
                                    <div className="min-w-0">
                                        <p className="text-[10px] uppercase font-bold text-slate-400 leading-none mb-1">Transmisión</p>
                                        <p className="text-xs font-bold text-slate-700 truncate leading-none">{data.vehiculo.transmision || 'N/A'}</p>
                                    </div>
                                </div>
                                <div className="flex items-center gap-2 bg-slate-50 p-2.5 rounded-xl border border-slate-100">
                                    <div className="w-7 h-7 bg-cyan-50 rounded-lg flex items-center justify-center shrink-0">
                                        <Car className="w-3.5 h-3.5 text-cyan-600" />
                                    </div>
                                    <div className="min-w-0">
                                        <p className="text-[10px] uppercase font-bold text-slate-400 leading-none mb-1">Tracción</p>
                                        <p className="text-xs font-bold text-slate-700 truncate leading-none">{data.vehiculo.traccion || 'N/A'}</p>
                                    </div>
                                </div>
                                <div className="flex items-center gap-2 bg-slate-50 p-2.5 rounded-xl border border-slate-100">
                                    <div className="w-7 h-7 bg-cyan-50 rounded-lg flex items-center justify-center shrink-0">
                                        <Settings className="w-3.5 h-3.5 text-cyan-600" />
                                    </div>
                                    <div className="min-w-0">
                                        <p className="text-[10px] uppercase font-bold text-slate-400 leading-none mb-1">Color</p>
                                        <p className="text-xs font-bold text-slate-700 truncate leading-none">{data.vehiculo.color || 'N/A'}</p>
                                    </div>
                                </div>
                            </div>
                        </div>
                    )}
                </div>
            </div>
        </div>
    );
}

const SkeletonItem = ({ className }: { className?: string }) => (
    <div className={`animate-pulse bg-slate-200 rounded-xl ${className}`} />
);

const SkeletonTracking = () => (
    <div className="max-w-md mx-auto relative pb-10 space-y-6">
        <header className="px-4 pt-6 space-y-4">
            <div className="flex justify-between items-center">
                <SkeletonItem className="h-9 w-9 rounded-full" />
                <SkeletonItem className="h-6 w-24" />
                <SkeletonItem className="h-9 w-9 rounded-full" />
            </div>
            <div className="flex gap-4">
                <SkeletonItem className="h-14 w-14 rounded-2xl" />
                <div className="flex-1 space-y-2">
                    <SkeletonItem className="h-6 w-3/4" />
                    <div className="flex gap-2">
                        <SkeletonItem className="h-4 w-16" />
                        <SkeletonItem className="h-4 w-24" />
                    </div>
                </div>
            </div>
        </header>
        <div className="px-5 space-y-6">
            <SkeletonItem className="h-4 w-32" />
            <div className="space-y-8">
                {[1, 2, 3, 4].map(idx => (
                    <div key={idx} className="flex gap-4">
                        <SkeletonItem className="h-9 w-9 rounded-full" />
                        <div className="flex-1 space-y-2">
                            <SkeletonItem className="h-5 w-32" />
                            <SkeletonItem className="h-4 w-full" />
                        </div>
                    </div>
                ))}
            </div>
        </div>
        <div className="px-4">
            <SkeletonItem className="h-32 w-full rounded-2xl" />
        </div>
    </div>
);

// ─────────────────────────────────────────
// CONTRATO FIRMA SECTION (CLIENTE REMOTO)
// ─────────────────────────────────────────
function ContratoFirmaSection({ contrato, ordenId, onFirmado }: {
    contrato: ContratoTracking;
    ordenId: string;
    onFirmado: () => void;
}) {
    const [firma, setFirma] = useState<string | null>(null);
    const [guardando, setGuardando] = useState(false);
    const [verContrato, setVerContrato] = useState(false);

    const fechaHoy = new Date().toLocaleDateString('es-CL', { day: '2-digit', month: 'long', year: 'numeric' });

    const contratoData: ContratoData = contrato.tipo === 'venta'
        ? {
            tipo: 'venta',
            numero: contrato.id.slice(-8).toUpperCase(),
            fecha: fechaHoy,
            vendedor_nombre: 'Rentmontt SpA.',
            vendedor_rut: '77.294.859-K',
            vendedor_email: 'olivares@rentmontt.cl',
            vendedor_fono: '+569 9265 7540',
            vendedor_ciudad: 'Puerto Montt',
            comprador_nombre: contrato.cliente_nombre || '',
            comprador_rut: contrato.cliente_rut || '',
            comprador_domicilio: contrato.cliente_domicilio || '',
            comprador_telefono: contrato.cliente_telefono || '',
            vehiculo_marca: contrato.vehiculo_marca || '',
            vehiculo_modelo: contrato.vehiculo_modelo || '',
            vehiculo_color: contrato.vehiculo_color || '',
            vehiculo_anio: contrato.vehiculo_anio || '',
            vehiculo_motor: contrato.vehiculo_motor || '',
            vehiculo_patente: contrato.vehiculo_patente || '',
            precio_total: contrato.precio_total || 0,
            pie_pagado: contrato.pie_pagado || 0,
            saldo_pendiente: contrato.saldo_pendiente || 0,
            firma_base64: firma,
            vendedor_firma_base64: contrato.vendedor_firma_base64,
        }
        : {
            tipo: 'arriendo',
            numero: contrato.id.slice(-8).toUpperCase(),
            fecha: fechaHoy,
            vendedor_nombre: 'Rentmontt SpA.',
            vendedor_rut: '77.294.859-K',
            vendedor_email: 'olivares@rentmontt.cl',
            vendedor_fono: '+569 9265 7540',
            vendedor_ciudad: 'Puerto Montt',
            comprador_nombre: contrato.cliente_nombre || '',
            comprador_rut: contrato.cliente_rut || '',
            comprador_domicilio: contrato.cliente_domicilio || '',
            comprador_telefono: contrato.cliente_telefono || '',
            vehiculo_marca: contrato.vehiculo_marca || '',
            vehiculo_modelo: contrato.vehiculo_modelo || '',
            vehiculo_color: contrato.vehiculo_color || '',
            vehiculo_anio: contrato.vehiculo_anio || '',
            vehiculo_patente: contrato.vehiculo_patente || '',
            fecha_salida: contrato.fecha_salida ? new Date(contrato.fecha_salida).toLocaleDateString('es-CL') : '',
            fecha_retorno: contrato.fecha_retorno ? new Date(contrato.fecha_retorno).toLocaleDateString('es-CL') : '',
            precio_total: contrato.precio_total || 0,
            precio_dia: contrato.precio_dia || 0,
            dias: contrato.dias || 0,
            firma_base64: firma,
            vendedor_firma_base64: contrato.vendedor_firma_base64,
        };

    const handleFirmar = async () => {
        if (!firma) { alert('Por favor, realiza tu firma antes de confirmar.'); return; }
        setGuardando(true);
        try {
            const ip = await fetch('https://api.ipify.org?format=json')
                .then(r => r.json()).then(r => r.ip).catch(() => null);

            const { error } = await supabase.from('contratos').update({
                firma_base64: firma,
                estado: 'firmado',
                firmado_en: new Date().toISOString(),
                ip_cliente: ip,
                actualizado_en: new Date().toISOString(),
            }).eq('id', contrato.id);

            if (error) throw error;

            // ACTUALIZAR ESTADO DEL VEHICULO EN FLOTA AL FIRMAR CONTRATO
            if (contrato.vehiculo_patente) {
                const nuevoEstado = contrato.tipo === 'venta' ? 'Vendido' : 'Arrendado';
                await supabase.from('flota').update({
                    estado: nuevoEstado,
                    updated_at: new Date().toISOString()
                }).eq('patente', contrato.vehiculo_patente);
            }

            onFirmado();
        } catch (err: any) {
            alert('Error al guardar la firma: ' + (err?.message || 'Intenta de nuevo.'));
        }
        setGuardando(false);
    };

    return (
        <div className="px-4 py-3">
            <div className="bg-white border-2 border-blue-100 rounded-3xl shadow-sm overflow-hidden">
                <div className="bg-blue-600 px-5 py-3 flex items-center gap-2">
                    <FileText className="w-4 h-4 text-white" />
                    <span className="text-white font-bold text-sm">
                        Contrato de {contrato.tipo === 'venta' ? 'Compraventa' : 'Arriendo'} — Pendiente de Firma
                    </span>
                </div>
                <div className="p-5 space-y-4">
                    <p className="text-sm text-slate-600">
                        <strong>{contrato.vehiculo_marca} {contrato.vehiculo_modelo} ({contrato.vehiculo_patente})</strong><br />
                        Revisa el contrato y luego firma abajo para confirmar el {contrato.tipo === 'venta' ? 'acuerdo de compra' : 'arriendo'}.
                    </p>

                    <button onClick={() => setVerContrato(!verContrato)}
                        className="w-full flex items-center justify-center gap-2 py-2.5 border-2 border-blue-200 rounded-xl text-blue-700 font-bold text-sm hover:bg-blue-50 transition-colors">
                        <FileText className="w-4 h-4" />
                        {verContrato ? 'Ocultar contrato' : '📄 Ver contrato completo'}
                    </button>

                    {verContrato && (
                        <div className="overflow-auto rounded-xl border border-slate-200 bg-slate-50 max-h-80">
                            <div style={{ transform: 'scale(0.5)', transformOrigin: 'top left', width: '397px', height: '560px', overflow: 'hidden' }}>
                                <ContratoDocumento data={contratoData} />
                            </div>
                        </div>
                    )}

                    <FirmaCanvas
                        onFirmaChange={setFirma}
                        label={contrato.tipo === 'venta' ? 'COMPRADOR' : 'ARRENDATARIO'}
                    />

                    <button onClick={handleFirmar} disabled={!firma || guardando}
                        className="w-full py-4 bg-emerald-600 hover:bg-emerald-700 disabled:bg-slate-300 disabled:cursor-not-allowed text-white font-black rounded-2xl text-base shadow-sm transition-all">
                        {guardando ? '⏳ Guardando firma...' : firma ? '✅ Confirmar y Firmar Contrato' : 'Dibuja tu firma arriba para firmar'}
                    </button>

                    <p className="text-[10px] text-slate-400 text-center leading-relaxed">
                        Al confirmar, tu firma digital queda registrada con fecha, hora e IP. Tiene validez legal equivalente a una firma física bajo la Ley 19.799.
                    </p>
                </div>
            </div>
        </div>
    );
}

// ─────────────────────────────────────────
// RENTAL ACTIVE CARD (PORTAL ARRENDATARIO)
// ─────────────────────────────────────────
function RentalActiveCard({ data, waLink }: { data: TrackingData, waLink: string | null }) {
    return (
        <div className="px-5 py-4">
            <div className="bg-white rounded-3xl border border-slate-100 shadow-sm overflow-hidden mt-2">
                <div className="relative h-48 bg-slate-100">
                    {data.fotos_urls && data.fotos_urls.length > 0 ? (
                        <img src={data.fotos_urls[0]} alt="Vehículo" className="w-full h-full object-cover" />
                    ) : (
                        <div className="w-full h-full flex flex-col items-center justify-center text-slate-400">
                            <Car className="w-12 h-12 mb-2 opacity-50" />
                            <span className="text-xs font-semibold">Sin foto de entrega</span>
                        </div>
                    )}
                    <div className="absolute top-4 right-4 bg-black/60 backdrop-blur-md px-3 py-1.5 rounded-full border border-white/10 text-white flex items-center gap-2 text-xs font-bold shadow-xl">
                        <div className="w-2 h-2 bg-emerald-400 rounded-full animate-pulse" />
                        {data.tipo_orden === 'arriendo' ? 'Arriendo en Curso' : 'Venta Concretada'}
                    </div>
                </div>
                
                <div className="p-5">
                    <div className="flex items-center justify-between mb-4">
                        <div>
                            <p className="font-mono font-black text-2xl text-slate-800 tracking-tight">{data.vehiculo?.patente || data.patente_vehiculo}</p>
                            <p className="text-sm font-medium text-slate-500">{data.vehiculo?.marca} {data.vehiculo?.modelo}</p>
                        </div>
                    </div>
                    
                    {data.tipo_orden === 'arriendo' && (
                        <div className="bg-slate-50 rounded-2xl p-4 border border-slate-100 flex items-center justify-between mt-2">
                            <div>
                                <p className="text-[10px] uppercase font-bold tracking-widest text-slate-400 mb-1">Fecha Salida</p>
                                <p className="text-sm font-bold text-slate-700">{data.fecha_ingreso ? new Date(data.fecha_ingreso).toLocaleDateString('es-CL') : 'N/A'}</p>
                            </div>
                            <div className="w-px h-8 bg-slate-200" />
                            <div className="text-right">
                                <p className="text-[10px] uppercase font-bold tracking-widest text-slate-400 mb-1">Retorno Esperado</p>
                                <p className="text-sm font-bold text-slate-700">{data.eta_entrega ? new Date(data.eta_entrega).toLocaleDateString('es-CL') : 'Sin fecha'}</p>
                            </div>
                        </div>
                    )}

                    {data.tipo_orden === 'arriendo' && waLink && (
                        <a href={waLink} target="_blank" rel="noopener noreferrer" className="mt-4 flex items-center justify-center w-full gap-2 py-3.5 bg-red-50 text-red-600 rounded-xl font-bold border border-red-100 hover:bg-red-100 transition-colors shadow-sm">
                            <AlertCircle className="w-5 h-5" />
                            Asistencia en Ruta (SOS)
                        </a>
                    )}
                </div>
            </div>
        </div>
    );
}

// ─────────────────────────────────────────
// PAGE
// ─────────────────────────────────────────
export default function TrackingPage() {
    const params = useParams();
    const router = useRouter();
    const { user, isLoading: isLoadingAuth } = useAuth();
    const id = params?.orden_id as string;

    const [data, setData] = useState<TrackingData | null>(null);
    const [loading, setLoading] = useState(true);
    const [error, setError] = useState<string | null>(null);

    // Modals state
    const [galleryOpen, setGalleryOpen] = useState(false);
    const [photoIdx, setPhotoIdx] = useState(0);
    const [detailsOpen, setDetailsOpen] = useState(false);
    const [contrato, setContrato] = useState<ContratoTracking | null>(null);
    const [firmaGuardada, setFirmaGuardada] = useState(false);
    const [firmaActual, setFirmaActual] = useState<string | null>(null);

    const channelRef = useRef<ReturnType<typeof supabase.channel> | null>(null);

    const load = async () => {
        if (!id) {
            setLoading(false);
            return;
        }
        try {
            const d = await fetchTracking(id);
            if (!d) throw new Error('Orden no encontrada');
            setData(d);
        } catch (e: any) {
            setError(e.message);
        } finally {
            setLoading(false);
        }
    };

    useEffect(() => {
        if (isLoadingAuth) return;
        load();

        // Buscar contrato pendiente de firma para esta orden
        const fetchContrato = async () => {
            if (!id) return;
            // Paso 1: buscar por orden_id
            const { data: ct1 } = await supabase
                .from('contratos')
                .select('*')
                .eq('orden_id', id)
                .eq('estado', 'pendiente_firma')
                .maybeSingle();

            if (ct1) { setContrato(ct1 as ContratoTracking); return; }

            // Paso 2: fallback — buscar por patente si la orden está vinculada a un vehículo
            const { data: ordenData } = await supabase
                .from('ordenes')
                .select('patente_vehiculo')
                .eq('id', id)
                .maybeSingle();

            if (!ordenData?.patente_vehiculo) return;

            const { data: ct2 } = await supabase
                .from('contratos')
                .select('*')
                .eq('vehiculo_patente', ordenData.patente_vehiculo)
                .eq('estado', 'pendiente_firma')
                .order('creado_en', { ascending: false })
                .limit(1)
                .maybeSingle();

            if (ct2) {
                setContrato(ct2 as ContratoTracking);
                // Vincular el contrato a esta orden para que el lookup sea directo la próxima vez
                await supabase.from('contratos').update({ orden_id: id }).eq('id', ct2.id);
            }
        };
        fetchContrato();
    }, [id, isLoadingAuth]);

    // Dynamically fetch GetAPI technical specs for vehicle
    useEffect(() => {
        if (!data || !data.vehiculo || data.vehiculo.motor || !data.vehiculo.patente) return;

        let isMounted = true;
        const fetchSpecs = async () => {
            try {
                const res = await fetch(`/api/vehiculo?patente=${data.vehiculo!.patente}`);
                if (res.ok) {
                    const apiResponse = await res.json();
                    if (apiResponse.success && apiResponse.data && isMounted) {
                        const techData = apiResponse.data;
                        setData(prev => prev ? {
                            ...prev,
                            vehiculo: {
                                ...prev.vehiculo!,
                                motor: techData.engine,
                                color: techData.color,
                                transmision: techData.transmission,
                                traccion: techData.traction || '2WD',
                                marca: techData.model?.brand?.name || prev.vehiculo!.marca,
                                modelo: techData.model?.name || prev.vehiculo!.modelo,
                                potencia_hp: techData.powerHp ? String(techData.powerHp) : undefined,
                                torque_nm: techData.torqueNm ? String(techData.torqueNm) : undefined,
                            }
                        } : prev);
                    }
                }
            } catch (e) {
                console.error('Error fetching GetAPI', e);
            }
        };

        fetchSpecs();

        return () => { isMounted = false; };
    }, [data?.vehiculo?.patente, data?.vehiculo?.motor]);

    useEffect(() => {
        if (!id) return;
        const refresh = async () => { await load(); };
        const ch = supabase
            .channel(`tracking-${id}`)
            .on('postgres_changes', { event: '*', schema: 'public', table: 'ordenes', filter: `id=eq.${id}` }, refresh)
            .on('postgres_changes', { event: '*', schema: 'public', table: 'listas_chequeo', filter: `orden_id=eq.${id}` }, refresh)
            .subscribe();
        channelRef.current = ch;
        return () => { ch.unsubscribe(); };
    }, [id]);

    if (isLoadingAuth || (loading && !error)) {
        return (
            <div className="min-h-screen bg-slate-50 text-slate-900">
                <SkeletonTracking />
            </div>
        );
    }

    if (error || !data) {
        return (
            <div className="min-h-screen bg-slate-50 flex flex-col items-center justify-center p-4">
                <div className="bg-white p-8 rounded-2xl shadow-sm border border-slate-100 max-w-md w-full text-center">
                    <div className="w-16 h-16 bg-red-50 rounded-full flex items-center justify-center mx-auto mb-4">
                        <AlertCircle className="w-8 h-8 text-red-500" />
                    </div>
                    <h1 className="text-xl font-bold text-slate-900 mb-2">Orden no encontrada</h1>
                    <p className="text-slate-500 mb-6">{error || 'El enlace es inválido o la orden ya no está disponible.'}</p>
                    <Button onClick={() => router.push('/')} variant="outline" className="w-full">
                        Volver al Inicio
                    </Button>
                </div>
            </div>
        );
    }
    const phone = data.taller?.telefono?.replace(/\D/g, '') || '';
    const waMsg = encodeURIComponent(data.tipo_orden === 'arriendo'
        ? `SOS Arriendo: Asistencia en ruta, patente ${data.vehiculo?.patente || data.patente_vehiculo}`
        : `Hola, consulto por la orden #${data.numero_orden}`);
    const waLink = phone ? `https://wa.me/${phone}?text=${waMsg}` : null;
    const isModoFirma = !!contrato && !firmaGuardada;

    return (
        <div className="min-h-screen bg-slate-50">
            <div className="max-w-md mx-auto relative pb-10">

                <TrackingHeader data={data} onBack={() => window.history.back()} />

                {isModoFirma && (
                    <div className="px-4 pt-2 pb-4 text-center">
                        <div className="bg-blue-600/5 border border-blue-600/20 rounded-3xl p-6 shadow-sm">
                            <div className="w-14 h-14 bg-blue-600/10 rounded-2xl flex items-center justify-center mx-auto mb-4">
                                <FileText className="w-7 h-7 text-blue-600" />
                            </div>
                            <h2 className="text-xl font-black text-slate-800 tracking-tight mb-2">Firma de Contrato</h2>
                            <p className="text-sm text-slate-600 leading-relaxed">
                                Por favor, revisa el documento y realiza tu firma digital para finalizar el proceso de {contrato.tipo === 'venta' ? 'compra' : 'arriendo'}.
                            </p>
                        </div>
                    </div>
                )}

                {!isModoFirma && (
                    <>
                        {data.tipo_orden === 'arriendo' || data.tipo_orden === 'venta' ? (
                            <RentalActiveCard data={data} waLink={waLink} />
                        ) : (
                            <>
                                <div className="py-2">
                                    <StatusTimeline data={data} />
                                </div>

                                <div className="h-px bg-slate-200 mx-5" role="separator" />

                                <div className="pt-6 pb-2">
                                    <LiveActionCard
                                        fotos={data.fotos_urls}
                                        onOpenFotos={() => {
                                            if (data.fotos_urls.length > 0) {
                                                setPhotoIdx(0);
                                                setGalleryOpen(true);
                                            } else {
                                                alert("Aún no se han subido fotos de inspección.");
                                            }
                                        }}
                                        onOpenDetails={() => setDetailsOpen(true)}
                                    />
                                </div>
                            </>
                        )}

                        <div className="py-2">
                            <UpsellCard
                                trackingId={data.id}
                                isLoggedIn={!!user}
                                userName={(user as any)?.user_metadata?.nombre || (user as any)?.user_metadata?.name || null}
                            />
                        </div>
                    </>
                )}

                {/* ZONA DE FIRMA DEL CONTRATO */}
                {contrato && !firmaGuardada && (
                    <ContratoFirmaSection
                        contrato={contrato}
                        ordenId={id}
                        onFirmado={() => setFirmaGuardada(true)}
                    />
                )}
                {firmaGuardada && (
                    <div className="px-4 py-3">
                        <div className="bg-emerald-50 border border-emerald-200 rounded-2xl p-4 text-center">
                            <p className="text-emerald-700 font-bold text-sm">✅ Contrato firmado exitosamente</p>
                            <p className="text-emerald-600 text-xs mt-1">Tu firma digital ha sido registrada. Recibirás una copia por WhatsApp.</p>
                        </div>
                    </div>
                )}

                <div className="pt-4">
                    <WorkshopFooter taller={data.taller} numeroOrden={data.numero_orden} />
                </div>

            </div>

            {galleryOpen && (
                <PhotoLightbox
                    fotos={data.fotos_urls}
                    activeIdx={photoIdx}
                    onClose={() => setGalleryOpen(false)}
                    onNext={() => setPhotoIdx(p => p + 1)}
                    onPrev={() => setPhotoIdx(p => p - 1)}
                />
            )}

            {detailsOpen && (
                <DetailsModal data={data} onClose={() => setDetailsOpen(false)} />
            )}
        </div>
    );
}
