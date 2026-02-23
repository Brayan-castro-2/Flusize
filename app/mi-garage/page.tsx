'use client';

import { useEffect, useState } from 'react';
import { supabase } from '@/lib/supabase';
import {
    Car,
    Clock,
    CheckCircle2,
    Wrench,
    AlertCircle,
    ChevronRight,
    MapPin,
    ArrowRight,
    User,
    ClipboardList,
    TrendingUp,
    Settings,
    Activity,
    Fuel,
    Zap,
    Gauge,
    Cog
} from 'lucide-react';
import Link from 'next/link';

// ──────────────────────────────────────────
// TYPES
// ──────────────────────────────────────────
interface VehiculoData {
    id: string;
    patente: string;
    marca: string | null;
    modelo: string | null;
    ano: number | null;
    color: string | null;
    kilometraje: number | null;
    motor: string | null;
    potencia_hp: number | null;
    torque_nm: number | null;
    transmision: string | null;
    traccion: string | null;
}

interface OrdenReciente {
    id: string;
    numero_orden: string;
    estado: string;
    fecha_ingreso: string;
    descripcion_problema: string | null;
    precio_total: number | null;
    taller_nombre: string | null;
}

interface GarageData {
    perfil: {
        id: string;
        nombre_completo: string | null;
        email: string;
    };
    cliente_id: string | null;
    vehiculos: VehiculoData[];
    ordenesRecientes: OrdenReciente[];
    inversionAnual: {
        total: number;
        mecanica: number;
        repuestos: number;
    };
}

// ──────────────────────────────────────────
// STATUS HELPERS
// ──────────────────────────────────────────
const ESTADO_UI: Record<string, { label: string; color: string; dot: string; Icon: any }> = {
    pendiente: { label: 'En espera', color: 'text-amber-600', dot: 'bg-amber-400', Icon: Clock },
    en_proceso: { label: 'En reparación', color: 'text-blue-600', dot: 'bg-blue-500', Icon: Wrench },
    completada: { label: 'Listo ✓', color: 'text-emerald-600', dot: 'bg-emerald-500', Icon: CheckCircle2 },
    entregada: { label: 'Entregado', color: 'text-slate-500', dot: 'bg-slate-400', Icon: CheckCircle2 },
    cancelada: { label: 'Cancelada', color: 'text-red-500', dot: 'bg-red-400', Icon: AlertCircle },
};

// ──────────────────────────────────────────
// DATA FETCHER (MOCKED FOR FINANCIAL REDESIGN)
// ──────────────────────────────────────────
async function fetchGarageData(userId: string): Promise<GarageData | null> {
    // 🚧 BYPASS TEMPORAL PARA REVISIÓN DE DISEÑO FINANCIERO 🚧
    return {
        perfil: {
            id: 'mock-id-123',
            nombre_completo: 'Demo Driver',
            email: 'demo@flusize.com',
        },
        cliente_id: 'mock-cliente-123',
        vehiculos: [
            {
                id: 'veh-1',
                patente: 'ABCD12',
                marca: 'Toyota',
                modelo: 'Yaris Sport',
                ano: 2018,
                color: 'Blanco',
                kilometraje: 45000,
                motor: '1.5L DOHC VVT-i',
                potencia_hp: 107,
                torque_nm: 140,
                transmision: 'Automática CVT',
                traccion: 'Delantera (FWD)',
            }
        ],
        ordenesRecientes: [
            {
                id: 'ord-1',
                numero_orden: '1042',
                estado: 'entregada',
                fecha_ingreso: new Date(Date.now() - 2 * 24 * 60 * 60 * 1000).toISOString(),
                descripcion_problema: 'Cambio de pastillas y discos de freno.',
                precio_total: 185000,
                taller_nombre: 'Frenos y Servicios Pro',
            },
            {
                id: 'ord-2',
                numero_orden: '1011',
                estado: 'entregada',
                fecha_ingreso: new Date(Date.now() - 45 * 24 * 60 * 60 * 1000).toISOString(),
                descripcion_problema: 'Mantenimiento preventivo 40.000km',
                precio_total: 210000,
                taller_nombre: 'Autoservicio Miguel',
            },
            {
                id: 'ord-3',
                numero_orden: '0984',
                estado: 'entregada',
                fecha_ingreso: new Date(Date.now() - 120 * 24 * 60 * 60 * 1000).toISOString(),
                descripcion_problema: 'Cambio de batería y revisión eléctrica',
                precio_total: 95000,
                taller_nombre: 'ElectroAuto Centro',
            }
        ],
        inversionAnual: {
            total: 490000,
            mecanica: 180000,
            repuestos: 310000
        }
    };
}

// ──────────────────────────────────────────
// SUB-COMPONENTS
// ──────────────────────────────────────────
const Spinner = () => (
    <div className="w-8 h-8 border-[3px] border-blue-100 border-t-blue-600 rounded-full animate-spin" />
);

function VehicleCard({ v }: { v: VehiculoData }) {
    return (
        <div className="bg-white rounded-[20px] shadow-sm border border-slate-100 p-5 flex flex-col gap-4">
            <div className="flex items-center gap-4">
                <div className="w-14 h-14 rounded-[14px] bg-slate-50 border border-slate-100 flex items-center justify-center shrink-0">
                    <Car className="w-7 h-7 text-slate-700" />
                </div>
                <div className="flex-1 min-w-0">
                    <p className="text-[10px] text-slate-400 font-bold uppercase tracking-widest mb-0.5">Automóvil Activo</p>
                    <h3 className="text-lg font-bold text-slate-800 leading-tight truncate">
                        {v.marca && v.modelo ? `${v.marca} ${v.modelo}` : 'Vehículo'}
                        {v.ano && <span className="text-slate-400 font-normal"> {v.ano}</span>}
                    </h3>
                    <div className="flex items-center gap-2 mt-1.5">
                        <span className="font-mono text-xs font-bold bg-slate-100 text-slate-700 px-2 py-0.5 rounded-md tracking-widest">
                            {v.patente}
                        </span>
                        <span className="text-xs text-slate-400 font-medium flex items-center">
                            • {v.kilometraje?.toLocaleString('es-CL')} km
                        </span>
                    </div>
                </div>
            </div>

            <div className="bg-slate-50 p-3.5 rounded-[14px]">
                <div className="flex justify-between items-center mb-1.5">
                    <span className="text-xs font-semibold text-slate-500 flex items-center"><Activity className="w-3.5 h-3.5 mr-1" /> Salud del Motor</span>
                    <span className="text-xs font-bold text-emerald-600">85% — Buena</span>
                </div>
                <div className="h-1.5 bg-slate-200 rounded-full overflow-hidden">
                    <div className="h-full bg-emerald-500 rounded-full" style={{ width: '85%' }} />
                </div>
            </div>
        </div>
    );
}

function TechnicalGrid({ v }: { v: VehiculoData }) {
    const specs = [
        { label: 'Motor', value: v.motor || 'N/A', icon: Fuel },
        { label: 'Potencia', value: v.potencia_hp ? `${v.potencia_hp} HP` : 'N/A', icon: Zap },
        { label: 'Torque', value: v.torque_nm ? `${v.torque_nm} Nm` : 'N/A', icon: Activity },
        { label: 'Transmisión', value: v.transmision || 'N/A', icon: Cog },
        { label: 'Tracción', value: v.traccion || 'N/A', icon: Car },
        { label: 'Color', value: v.color || 'N/A', icon: Settings },
    ];

    return (
        <div className="grid grid-cols-2 gap-3">
            {specs.map((spec, i) => {
                const Icon = spec.icon;
                return (
                    <div key={i} className="bg-white border border-slate-100 rounded-[16px] p-3.5 flex items-start gap-3 shadow-sm">
                        <div className="w-8 h-8 rounded-lg bg-cyan-50 flex items-center justify-center shrink-0">
                            <Icon className="w-4 h-4 text-cyan-600" />
                        </div>
                        <div className="min-w-0">
                            <p className="text-[10px] uppercase tracking-widest font-bold text-slate-400 mb-0.5">{spec.label}</p>
                            <p className="text-xs font-bold text-slate-700 truncate">{spec.value}</p>
                        </div>
                    </div>
                );
            })}
        </div>
    );
}

function InversionChart({ data }: { data: GarageData['inversionAnual'] }) {
    const radius = 38;
    const circumference = 2 * Math.PI * radius;
    const mecanicaPct = data.total > 0 ? data.mecanica / data.total : 0;
    const repuestosPct = data.total > 0 ? data.repuestos / data.total : 0;

    const strokeMecanica = mecanicaPct * circumference;
    const strokeRepuestos = repuestosPct * circumference;

    return (
        <div className="bg-white rounded-[24px] shadow-sm border border-slate-100 p-6 flex flex-col items-center">
            <h3 className="text-xs font-bold text-slate-400 uppercase tracking-widest w-full text-center flex items-center justify-center gap-1.5 mb-2">
                <TrendingUp className="w-4 h-4" /> Inversión Anual Total
            </h3>

            <p className="text-[28px] font-black text-slate-800 tracking-tight mb-8">
                ${data.total.toLocaleString('es-CL')}
            </p>

            <div className="relative w-36 h-36 flex items-center justify-center mb-6">
                <svg className="w-full h-full transform -rotate-90">
                    <circle cx="72" cy="72" r={radius} stroke="#f1f5f9" strokeWidth="12" fill="none" />
                    {data.total > 0 && (
                        <>
                            {/* Repuestos - Cyan */}
                            <circle cx="72" cy="72" r={radius} stroke="#06b6d4" strokeWidth="12" fill="none"
                                strokeDasharray={`${strokeRepuestos} ${circumference}`}
                                strokeDashoffset={0}
                                strokeLinecap="round"
                            />
                            {/* Mecánica - Blue */}
                            <circle cx="72" cy="72" r={radius} stroke="#2563eb" strokeWidth="12" fill="none"
                                strokeDasharray={`${strokeMecanica} ${circumference}`}
                                strokeDashoffset={`-${strokeRepuestos}`}
                                strokeLinecap="round"
                            />
                        </>
                    )}
                </svg>
                <div className="absolute inset-0 flex flex-col items-center justify-center">
                    <Car className="w-6 h-6 text-slate-300" />
                </div>
            </div>

            <div className="flex items-center justify-center gap-6 w-full px-2">
                <div className="flex items-center gap-2">
                    <div className="w-3 h-3 rounded-full bg-blue-600" />
                    <div className="flex flex-col">
                        <span className="text-[10px] font-bold text-slate-400 uppercase tracking-wider">Mano de Obra</span>
                        <span className="text-sm font-bold text-slate-700">${data.mecanica.toLocaleString('es-CL')}</span>
                    </div>
                </div>
                <div className="flex items-center gap-2">
                    <div className="w-3 h-3 rounded-full bg-cyan-500" />
                    <div className="flex flex-col">
                        <span className="text-[10px] font-bold text-slate-400 uppercase tracking-wider">Repuestos</span>
                        <span className="text-sm font-bold text-slate-700">${data.repuestos.toLocaleString('es-CL')}</span>
                    </div>
                </div>
            </div>
        </div>
    );
}

function BankActivityItem({ orden }: { orden: OrdenReciente }) {
    const isCompleted = orden.estado === 'completada' || orden.estado === 'entregada';
    const ui = ESTADO_UI[orden.estado] || ESTADO_UI['pendiente'];
    const StatIcon = ui.Icon;

    return (
        <Link href={`/tracking/${orden.id}`} className="block">
            <div className="flex items-center gap-4 py-3.5 border-b border-slate-50 last:border-0 hover:bg-slate-50 active:bg-slate-100 transition-colors px-2 -mx-2 rounded-xl group">
                <div className="w-10 h-10 rounded-full bg-slate-50 border border-slate-100 flex items-center justify-center shrink-0">
                    <Wrench className="w-4 h-4 text-slate-600" />
                </div>
                <div className="flex-1 min-w-0">
                    <p className="text-sm font-bold text-slate-800 truncate">
                        {orden.taller_nombre || 'Servicio Automotriz'}
                    </p>
                    <div className="flex items-center text-xs text-slate-400 mt-0.5 space-x-1.5">
                        <span>{new Date(orden.fecha_ingreso).toLocaleDateString('es-CL', { day: '2-digit', month: 'short' })}</span>
                        <span>•</span>
                        <span className="truncate">{orden.descripcion_problema || `Orden #${orden.numero_orden}`}</span>
                    </div>
                </div>
                <div className="flex flex-col items-end shrink-0 pl-2">
                    <p className="text-sm font-black text-slate-800 whitespace-nowrap">
                        {orden.precio_total ? `-$${orden.precio_total.toLocaleString('es-CL')}` : '—'}
                    </p>
                    {!isCompleted && (
                        <p className={`text-[10px] font-bold px-1.5 py-0.5 rounded-sm mt-0.5 bg-amber-50 text-amber-600`}>
                            En progreso
                        </p>
                    )}
                </div>
            </div>
        </Link>
    );
}

// ──────────────────────────────────────────
// PAGE
// ──────────────────────────────────────────
export default function MiGaragePage() {
    const [data, setData] = useState<GarageData | null>(null);
    const [loading, setLoading] = useState(true);

    useEffect(() => {
        (async () => {
            const d = await fetchGarageData('mock-user-id');
            setData(d);
            setLoading(false);
        })();
    }, []);

    if (loading || !data) return (
        <div className="min-h-screen bg-[#f8fafc] flex items-center justify-center">
            <Spinner />
        </div>
    );

    const { vehiculos, ordenesRecientes, inversionAnual } = data;
    const vActivo = vehiculos[0];

    return (
        <div className="min-h-screen bg-[#f8fafc] pb-10">
            {/* ── HEADER FINANCIERO ── */}
            <header className="bg-white border-b border-slate-100 shadow-sm sticky top-0 z-30">
                <div className="max-w-md mx-auto px-4 py-3 flex items-center justify-between">
                    <div className="flex items-center gap-2.5">
                        <div className="w-8 h-8 rounded-full bg-slate-900 flex items-center justify-center shadow-md">
                            <span className="text-white font-black text-sm">F</span>
                        </div>
                        <div>
                            <p className="text-[10px] text-slate-400 font-bold uppercase tracking-widest leading-none">Mi Garage</p>
                            <p className="text-sm font-bold text-slate-800 leading-tight">Resumen Financiero</p>
                        </div>
                    </div>
                    <div className="w-9 h-9 rounded-full bg-slate-100 flex items-center justify-center border border-slate-200">
                        <User className="w-4 h-4 text-slate-600" />
                    </div>
                </div>
            </header>

            <main className="max-w-md mx-auto px-4 py-6 space-y-6">

                {/* ── INVERSIÓN TOTAL ── */}
                <section>
                    <InversionChart data={inversionAnual} />
                </section>

                {/* ── VEHÍCULOS (HORIZONTAL CARD) ── */}
                {vActivo && (
                    <section>
                        <h2 className="text-xs font-bold text-slate-400 uppercase tracking-widest mb-3 ml-1">Mi Vehículo</h2>
                        <VehicleCard v={vActivo} />
                    </section>
                )}

                {/* ── FICHA TÉCNICA (GRID) ── */}
                {vActivo && (
                    <section>
                        <div className="flex items-center justify-between mb-3 ml-1">
                            <h2 className="text-xs font-bold text-slate-400 uppercase tracking-widest">Ficha Técnica</h2>
                        </div>
                        <TechnicalGrid v={vActivo} />
                    </section>
                )}

                {/* ── HISTORIAL "BANCARIO" ── */}
                {ordenesRecientes.length > 0 && (
                    <section>
                        <h2 className="text-xs font-bold text-slate-400 uppercase tracking-widest mb-3 ml-1">Movimientos Recientes</h2>
                        <div className="bg-white rounded-[20px] shadow-sm border border-slate-100 p-4">
                            {ordenesRecientes.map(o => <BankActivityItem key={o.id} orden={o} />)}
                        </div>
                    </section>
                )}

            </main>
        </div>
    );
}
