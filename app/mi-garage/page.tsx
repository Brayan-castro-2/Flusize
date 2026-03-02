'use client';

import { useEffect, useState } from 'react';
import { supabase } from '@/lib/supabase';
import {
    Car,
    Clock,
    CheckCircle2,
    Wrench,
    AlertCircle,
    ChevronLeft,
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
    Cog,
    LogOut,
    Bell,
    Plus,
    X,
    Loader2
} from 'lucide-react';
import { sileo } from 'sileo';
import Link from 'next/link';
import { useRouter } from 'next/navigation';
import { useAuth } from '@/contexts/auth-context';
import {
    DropdownMenu,
    DropdownMenuContent,
    DropdownMenuItem,
    DropdownMenuLabel,
    DropdownMenuSeparator,
    DropdownMenuTrigger,
} from '@/components/ui/dropdown-menu';
import { motion, AnimatePresence, useMotionValue, useTransform, animate } from 'framer-motion';

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
    potencia_hp: number | null | string;
    torque_nm: number | null | string;
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
    const { data: perfil } = await supabase.from('perfiles').select('id, nombre_completo, email').eq('id', userId).maybeSingle();

    const perfilSeguro = perfil || {
        id: userId,
        nombre_completo: 'Usuario Flusize',
        email: ''
    };

    let orQuery = `perfil_global_id.eq.${userId}`;
    if (perfilSeguro.email) {
        orQuery += `,email.eq.${perfilSeguro.email}`;
    }

    const { data: clientesVinculados, error: cliError } = await supabase
        .from('clientes')
        .select('id')
        .or(orQuery);

    if (cliError) throw cliError;

    const clienteIds = clientesVinculados?.map(c => c.id) || [];

    if (clienteIds.length === 0) {
        return {
            perfil: perfilSeguro,
            cliente_id: userId,
            vehiculos: [],
            ordenesRecientes: [],
            inversionAnual: { total: 0, mecanica: 0, repuestos: 0 }
        };
    }

    const { data: vehiculos, error: vehError } = await supabase
        .from('vehiculos')
        .select('id, patente, marca, modelo, ano, color, kilometraje, motor, potencia_hp, torque_nm, transmision, traccion')
        .in('cliente_id', clienteIds);
    if (vehError) throw vehError;

    const { data: ordenes, error: ordError } = await supabase
        .from('ordenes')
        .select(`
            id, 
            numero_orden, 
            estado, 
            fecha_ingreso, 
            descripcion_problema, 
            precio_total, 
            taller_id,
            talleres:taller_id (nombre)
        `)
        .in('cliente_id', clienteIds)
        .order('fecha_ingreso', { ascending: false });

    if (ordError) throw ordError;

    let total = 0;
    ordenes?.forEach(o => {
        if (o.estado === 'completada' || o.estado === 'entregada') {
            total += Number(o.precio_total || 0);
        }
    });

    const ordenesMapeadas = ordenes?.map(o => {
        let tallerNombre = 'Taller Aliado';
        if (o.talleres) {
            tallerNombre = Array.isArray(o.talleres) ? o.talleres[0]?.nombre : (o.talleres as any).nombre;
        }
        return {
            id: o.id,
            numero_orden: o.numero_orden,
            estado: o.estado,
            fecha_ingreso: o.fecha_ingreso,
            descripcion_problema: o.descripcion_problema,
            precio_total: o.precio_total,
            taller_nombre: tallerNombre
        };
    }) || [];

    return {
        perfil: perfilSeguro,
        cliente_id: clienteIds.length > 0 ? clienteIds[0] : null,
        vehiculos: vehiculos || [],
        ordenesRecientes: ordenesMapeadas,
        inversionAnual: {
            total,
            mecanica: Math.round(total * 0.7),
            repuestos: Math.round(total * 0.3)
        }
    };
}

function EmptyGarageState({ onAddClick }: { onAddClick: () => void }) {
    return (
        <div className="flex flex-col items-center justify-center py-12 px-4 text-center">
            <div className="w-20 h-20 bg-blue-50 rounded-2xl flex items-center justify-center mb-6 border border-blue-100/50 shadow-sm">
                <Car className="w-10 h-10 text-blue-500" />
            </div>
            <h2 className="text-xl font-bold text-slate-800 tracking-tight mb-2">Bienvenido a tu Garage</h2>
            <p className="text-slate-500 text-sm max-w-xs mx-auto mb-8 leading-relaxed">
                Aún no tienes vehículos ni servicios registrados. Tu historial aparecerá aquí automáticamente cuando visites uno de nuestros talleres asociados.
            </p>
            <div className="flex flex-col w-full gap-3">
                <button
                    onClick={onAddClick}
                    className="inline-flex items-center justify-center h-12 w-full rounded-xl bg-blue-600 text-white font-bold text-sm shadow-sm shadow-blue-200 hover:bg-blue-700 transition-all hover:scale-[1.02] active:scale-[0.98]"
                >
                    ➕ Agregar mi primer vehículo
                </button>
                <Link href="/onboarding" className="text-slate-400 text-xs font-bold hover:text-slate-600 transition-colors py-2 underline decoration-slate-200 underline-offset-4">
                    ¿Tienes historial previo? Buscar datos <ArrowRight className="w-3 h-3 ml-1 inline" />
                </Link>
            </div>
        </div>
    );
}

function ModalAgregarVehiculo({ isOpen, onClose, onSuccess, userId, userEmail, userName }: {
    isOpen: boolean;
    onClose: () => void;
    onSuccess: () => void;
    userId: string;
    userEmail: string;
    userName: string;
}) {
    const [loading, setLoading] = useState(false);
    const [searching, setSearching] = useState(false);
    const [patente, setPatente] = useState('');
    const [marca, setMarca] = useState('');
    const [modelo, setModelo] = useState('');
    const [ano, setAno] = useState(new Date().getFullYear().toString());
    const [motor, setMotor] = useState('');
    const [color, setColor] = useState('');
    const [potencia, setPotencia] = useState('');
    const [torque, setTorque] = useState('');
    const [transmision, setTransmision] = useState('');
    const [traccion, setTraccion] = useState('');
    const [discovered, setDiscovered] = useState(false);

    // Búsqueda automática cuando la patente tiene 6 caracteres
    useEffect(() => {
        const cleanPatente = patente.toUpperCase().replace(/[^A-Z0-9]/g, '');
        if (cleanPatente.length === 6 && !discovered) {
            handleSearch(cleanPatente);
        }
    }, [patente]);

    const handleSearch = async (targetPatente: string) => {
        setSearching(true);
        try {
            const res = await fetch(`/api/vehiculo?patente=${targetPatente}`);
            if (res.ok) {
                const apiResponse = await res.json();
                if (apiResponse.success && apiResponse.data) {
                    const techData = apiResponse.data;
                    setMarca(techData.model?.brand?.name || '');
                    setModelo(techData.model?.name || '');
                    setAno(techData.year ? String(techData.year) : ano);
                    setMotor(techData.engine || '');
                    setColor(techData.color || '');
                    setPotencia(techData.powerHp ? String(techData.powerHp) : '');
                    setTorque(techData.torqueNm ? String(techData.torqueNm) : '');
                    setTransmision(techData.transmission || '');
                    setTraccion(techData.traction || '');
                    setDiscovered(true);

                    sileo.success({
                        title: "¡Vehículo Identificado!",
                        description: `Hemos encontrado tu ${techData.model?.brand?.name}.`,
                    });
                }
            }
        } catch (e) {
            console.error('Error in smart discovery:', e);
        } finally {
            setSearching(false);
        }
    };

    if (!isOpen) return null;

    const handleSubmit = async (e: React.FormEvent) => {
        e.preventDefault();
        setLoading(true);
        try {
            // 1. Obtener o crear Cliente
            let finalClienteId = null;
            const { data: existingClients } = await supabase
                .from('clientes')
                .select('id')
                .eq('perfil_global_id', userId);

            if (existingClients && existingClients.length > 0) {
                finalClienteId = existingClients[0].id;
            } else {
                const { data: newClient, error: clientErr } = await supabase
                    .from('clientes')
                    .insert([{
                        perfil_global_id: userId,
                        nombre_completo: userName || 'Usuario Flusize',
                        email: userEmail,
                        tipo: 'persona'
                    }])
                    .select()
                    .single();

                if (clientErr) throw clientErr;
                finalClienteId = newClient.id;
            }

            // 2. Insertar Vehículo
            const { error: vehErr } = await supabase
                .from('vehiculos')
                .insert([{
                    cliente_id: finalClienteId,
                    patente: patente.toUpperCase().replace(/[^A-Z0-9]/g, ''),
                    marca: marca,
                    modelo: modelo,
                    ano: parseInt(ano),
                    motor: motor,
                    color: color,
                    potencia_hp: potencia,
                    torque_nm: torque,
                    transmision: transmision,
                    traccion: traccion
                }]);

            if (vehErr) throw vehErr;

            sileo.success({
                title: "¡Vehículo agregado!",
                description: `El ${marca} ${modelo} ya está en tu garage.`,
            });
            onSuccess();
            onClose();
        } catch (error) {
            console.error("Error agregando vehículo:", error);
            sileo.error({
                title: "Error",
                description: "No pudimos guardar el vehículo. Inténtalo de nuevo.",
            });
        } finally {
            setLoading(false);
        }
    };

    return (
        <AnimatePresence>
            <div className="fixed inset-0 z-50 flex items-center justify-center p-4">
                <motion.div
                    initial={{ opacity: 0 }}
                    animate={{ opacity: 1 }}
                    exit={{ opacity: 0 }}
                    onClick={onClose}
                    className="absolute inset-0 bg-slate-900/60 backdrop-blur-sm"
                />
                <motion.div
                    initial={{ opacity: 0, scale: 0.95, y: 20 }}
                    animate={{ opacity: 1, scale: 1, y: 0 }}
                    exit={{ opacity: 0, scale: 0.95, y: 20 }}
                    className="relative bg-white w-full max-w-sm rounded-[28px] shadow-2xl overflow-hidden"
                >
                    <div className="p-6">
                        <div className="flex items-center justify-between mb-6">
                            <h3 className="text-xl font-black text-slate-800 tracking-tight">Nuevo Vehículo</h3>
                            <button onClick={onClose} className="w-8 h-8 rounded-full bg-slate-50 flex items-center justify-center text-slate-400 hover:bg-slate-100 transition-colors">
                                <X className="w-4 h-4" />
                            </button>
                        </div>

                        <form onSubmit={handleSubmit} className="space-y-4">
                            <div>
                                <label className="text-[10px] font-bold text-slate-400 uppercase tracking-widest ml-1 mb-1.5 block">Patente</label>
                                <div className="relative">
                                    <input
                                        required
                                        placeholder="ABCD12"
                                        value={patente}
                                        onChange={(e) => {
                                            setPatente(e.target.value.toUpperCase());
                                            if (discovered) setDiscovered(false);
                                        }}
                                        className="w-full h-12 bg-slate-50 border border-slate-100 rounded-xl px-4 font-mono text-lg font-bold tracking-widest focus:ring-2 focus:ring-blue-500/20 outline-none transition-all uppercase"
                                    />
                                    {searching && (
                                        <div className="absolute right-3 top-1/2 -translate-y-1/2">
                                            <Loader2 className="w-5 h-5 animate-spin text-blue-500" />
                                        </div>
                                    )}
                                </div>
                            </div>

                            <AnimatePresence mode="wait">
                                {discovered && (
                                    <motion.div
                                        initial={{ opacity: 0, y: -10 }}
                                        animate={{ opacity: 1, y: 0 }}
                                        className="bg-emerald-50 border border-emerald-100/50 rounded-xl p-3 flex items-center gap-3"
                                    >
                                        <div className="w-8 h-8 rounded-full bg-emerald-500 flex items-center justify-center shrink-0">
                                            <CheckCircle2 className="w-4 h-4 text-white" />
                                        </div>
                                        <div>
                                            <p className="text-[10px] font-black text-emerald-800 uppercase tracking-widest">¡Datos Encontrados!</p>
                                            <p className="text-[10px] text-emerald-600 font-medium">Motor {motor} • {potencia} HP • {transmision}</p>
                                        </div>
                                    </motion.div>
                                )}
                            </AnimatePresence>

                            <div className="grid grid-cols-2 gap-4">
                                <div>
                                    <label className="text-[10px] font-bold text-slate-400 uppercase tracking-widest ml-1 mb-1.5 block">Marca</label>
                                    <input
                                        required
                                        placeholder="Ej: Toyota"
                                        value={marca}
                                        onChange={(e) => setMarca(e.target.value)}
                                        className="w-full h-12 bg-slate-50 border border-slate-100 rounded-xl px-4 text-sm font-bold focus:ring-2 focus:ring-blue-500/20 outline-none transition-all"
                                    />
                                </div>
                                <div>
                                    <label className="text-[10px] font-bold text-slate-400 uppercase tracking-widest ml-1 mb-1.5 block">Modelo</label>
                                    <input
                                        required
                                        placeholder="Ej: Yaris"
                                        value={modelo}
                                        onChange={(e) => setModelo(e.target.value)}
                                        className="w-full h-12 bg-slate-50 border border-slate-100 rounded-xl px-4 text-sm font-bold focus:ring-2 focus:ring-blue-500/20 outline-none transition-all"
                                    />
                                </div>
                            </div>

                            <div>
                                <label className="text-[10px] font-bold text-slate-400 uppercase tracking-widest ml-1 mb-1.5 block">Año</label>
                                <input
                                    required
                                    type="number"
                                    min="1900"
                                    max={new Date().getFullYear() + 1}
                                    value={ano}
                                    onChange={(e) => setAno(e.target.value)}
                                    className="w-full h-12 bg-slate-50 border border-slate-100 rounded-xl px-4 text-sm font-bold focus:ring-2 focus:ring-blue-500/20 outline-none transition-all"
                                />
                            </div>

                            <button
                                disabled={loading}
                                type="submit"
                                className="w-full h-12 bg-blue-600 text-white rounded-xl font-bold text-sm shadow-lg shadow-blue-200 hover:bg-blue-700 transition-all active:scale-[0.98] disabled:opacity-50 disabled:scale-100 flex items-center justify-center gap-2 mt-4"
                            >
                                {loading ? <Loader2 className="w-5 h-5 animate-spin" /> : "Guardar Vehículo"}
                            </button>
                        </form>
                    </div>
                </motion.div>
            </div>
        </AnimatePresence>
    );
}

// ──────────────────────────────────────────
// SUB-COMPONENTS
// ──────────────────────────────────────────
const SkeletonItem = ({ className }: { className?: string }) => (
    <div className={`animate-pulse bg-slate-200 rounded-xl ${className}`} />
);

const SkeletonGarage = () => (
    <div className="min-h-screen bg-[#f8fafc]">
        {/* Header simple style placeholder */}
        <div className="bg-white h-16 border-b border-slate-100 flex items-center px-4 justify-between">
            <div className="w-10 h-10 rounded-full bg-slate-200/20 animate-pulse" />
            <div className="flex gap-2">
                <div className="w-10 h-10 rounded-full bg-slate-200/20 animate-pulse" />
                <div className="w-10 h-10 rounded-full bg-slate-200/20 animate-pulse" />
            </div>
        </div>

        <div className="max-w-md mx-auto px-4 py-8 space-y-8">
            {/* Gráfico de Inversión Placeholder */}
            <div className="flex flex-col items-center space-y-4">
                <div className="w-48 h-48 rounded-full bg-slate-200/10 animate-pulse border border-slate-200/5"></div>
                <div className="h-6 w-48 bg-slate-200/10 rounded-lg animate-pulse"></div>
            </div>

            {/* Tarjeta de Vehículo Placeholder */}
            <div className="space-y-4 pt-4">
                <div className="h-4 w-24 bg-slate-200/10 rounded-full animate-pulse ml-1"></div>
                <div className="h-24 bg-slate-200/10 rounded-xl w-full animate-pulse shadow-sm"></div>
            </div>

            {/* Ficha Técnica / Grid Placeholder */}
            <div className="grid grid-cols-2 gap-3 mt-8">
                {[1, 2, 3, 4].map(i => (
                    <div key={i} className="h-20 bg-slate-200/10 rounded-xl w-full animate-pulse"></div>
                ))}
            </div>

            {/* Movimientos Recientes Placeholder */}
            <div className="space-y-3 pt-6">
                <div className="h-4 w-32 bg-slate-200/10 rounded-full animate-pulse ml-1 mb-4"></div>
                {[1, 2, 3, 4, 5].map(i => (
                    <div key={i} className="h-16 bg-slate-200/10 rounded-xl w-full animate-pulse"></div>
                ))}
            </div>
        </div>
    </div>
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
    const count = useMotionValue(0);
    const rounded = useTransform(count, (latest) => Math.round(latest).toLocaleString('es-CL'));

    const radius = 38;
    const circumference = 2 * Math.PI * radius;
    const mecanicaPct = data.total > 0 ? data.mecanica / data.total : 0;
    const repuestosPct = data.total > 0 ? data.repuestos / data.total : 0;

    const strokeMecanica = mecanicaPct * circumference;
    const strokeRepuestos = repuestosPct * circumference;

    useEffect(() => {
        const controls = animate(count, data.total, {
            duration: 1.5,
            ease: "easeOut",
        });
        return controls.stop;
    }, [data.total]);

    return (
        <motion.div
            className="bg-white rounded-[24px] shadow-sm border border-slate-100 p-6 flex flex-col items-center"
        >
            <h3 className="text-xs font-bold text-slate-400 uppercase tracking-widest w-full text-center flex items-center justify-center gap-1.5 mb-2">
                <TrendingUp className="w-4 h-4" /> Inversión Anual Total
            </h3>

            <div className="text-[28px] font-black text-slate-800 tracking-tight mb-8 tabular-nums flex items-center">
                <span>$</span>
                <motion.span>{rounded}</motion.span>
            </div>

            <div className="relative w-36 h-36 flex items-center justify-center mb-6">
                <svg className="w-full h-full transform -rotate-90">
                    <circle cx="72" cy="72" r={radius} stroke="#f1f5f9" strokeWidth="12" fill="none" />
                    {data.total > 0 && (
                        <>
                            {/* Repuestos - Cyan */}
                            <motion.circle
                                cx="72" cy="72" r={radius} stroke="#06b6d4" strokeWidth="12" fill="none"
                                initial={{ strokeDasharray: `0 ${circumference}` }}
                                animate={{ strokeDasharray: `${strokeRepuestos} ${circumference}` }}
                                transition={{ duration: 1.5, ease: "easeOut", delay: 0.4 }}
                                strokeDashoffset={0}
                                strokeLinecap="round"
                            />
                            {/* Mecánica - Blue */}
                            <motion.circle
                                cx="72" cy="72" r={radius} stroke="#2563eb" strokeWidth="12" fill="none"
                                initial={{ strokeDasharray: `0 ${circumference}`, strokeDashoffset: 0 }}
                                animate={{
                                    strokeDasharray: `${strokeMecanica} ${circumference}`,
                                    strokeDashoffset: `-${strokeRepuestos}`
                                }}
                                transition={{ duration: 1.5, ease: "easeOut", delay: 0.4 }}
                                strokeLinecap="round"
                            />
                        </>
                    )}
                </svg>
                <motion.div
                    initial={{ opacity: 0 }}
                    animate={{ opacity: 1 }}
                    transition={{ delay: 1 }}
                    className="absolute inset-0 flex flex-col items-center justify-center"
                >
                    <Car className="w-6 h-6 text-slate-300" />
                </motion.div>
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
        </motion.div>
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
    const { user, logout, isLoading: isLoadingAuth } = useAuth();
    const [data, setData] = useState<GarageData | null>(null);
    const [loading, setLoading] = useState(true);
    const [notifEstado, setNotifEstado] = useState<string | null>(null);
    const [showAddModal, setShowAddModal] = useState(false);
    const router = useRouter();

    async function loadData() {
        if (!user) return;
        try {
            setLoading(true);
            const d = await fetchGarageData(user.id);
            setData(d);
        } catch (error) {
            console.error("🔥 Error CRÍTICO cargando Mi Garage:", error);
            setData({
                perfil: { id: user.id, nombre_completo: user.name || 'Usuario', email: user.email || '' },
                cliente_id: user.id,
                vehiculos: [],
                ordenesRecientes: [],
                inversionAnual: { total: 0, mecanica: 0, repuestos: 0 }
            });
        } finally {
            setLoading(false);
        }
    }

    // Dynamically fetch GetAPI technical specs
    useEffect(() => {
        if (!data || data.vehiculos.length === 0) return;

        let isMounted = true;
        const fetchSpecs = async () => {
            const updatedVehicles = [...data.vehiculos];
            let hasChanges = false;

            for (let i = 0; i < updatedVehicles.length; i++) {
                const v = updatedVehicles[i];
                if (!v.motor && v.patente) {
                    try {
                        const res = await fetch(`/api/vehiculo?patente=${v.patente}`);
                        if (res.ok) {
                            const apiResponse = await res.json();
                            if (apiResponse.success && apiResponse.data) {
                                const techData = apiResponse.data;
                                updatedVehicles[i] = {
                                    ...v,
                                    motor: techData.engine,
                                    color: techData.color,
                                    transmision: techData.transmission,
                                    traccion: techData.traction || '2WD',
                                    marca: techData.model?.brand?.name || v.marca,
                                    modelo: techData.model?.name || v.modelo,
                                    potencia_hp: techData.powerHp ? String(techData.powerHp) : v.potencia_hp,
                                    torque_nm: techData.torqueNm ? String(techData.torqueNm) : v.torque_nm,
                                };
                                hasChanges = true;
                            }
                        }
                    } catch (e) {
                        console.error('Error fetching GetAPI for plate', v.patente, e);
                    }
                }
            }

            if (isMounted && hasChanges) {
                setData(prev => prev ? { ...prev, vehiculos: updatedVehicles } : prev);
            }
        };

        fetchSpecs();

        return () => { isMounted = false; };
    }, [data?.vehiculos.length]);

    useEffect(() => {
        // Si aún está cargando la sesión, no hacemos nada todavía
        if (isLoadingAuth) return;

        // Si terminó de cargar y NO hay usuario, apagamos el loader
        if (!user) {
            setLoading(false);
            return;
        }

        let isMounted = true;

        loadData();

        return () => { isMounted = false; };
    }, [user?.id, isLoadingAuth]);

    // ──────────────────────────────────────────
    // NOTIFICACIONES EN TIEMPO REAL
    // ──────────────────────────────────────────
    useEffect(() => {
        if (!user) return;

        console.log("🔔 Suscribiendo a actualizaciones de órdenes para el usuario:", user.id);

        const channel = supabase
            .channel('ordenes-tracker')
            .on(
                'postgres_changes',
                {
                    event: 'UPDATE',
                    schema: 'public',
                    table: 'ordenes',
                },
                (payload) => {
                    console.log('🔄 Update recibido en realtime:', payload);
                    if (payload.new.cliente_id === user.id) {
                        sileo.success({
                            title: 'Estado de Orden',
                            description: `Actualizado a: ${payload.new.estado.replace('_', ' ')}`,
                            position: "top-center"
                        });
                        setNotifEstado(payload.new.estado);
                    }
                }
            )
            .subscribe();

        return () => {
            supabase.removeChannel(channel);
        };
    }, [user?.id]);

    if (loading || (isLoadingAuth && !user)) return <SkeletonGarage />;

    const vehiculos = data?.vehiculos || [];
    const ordenesRecientes = data?.ordenesRecientes || [];
    const inversionAnual = data?.inversionAnual || { total: 0, mecanica: 0, repuestos: 0 };
    const vActivo = vehiculos.length > 0 ? vehiculos[0] : null;

    return (
        <div className="min-h-screen bg-[#f8fafc] pb-10">
            {/* ── HEADER FINANCIERO ── */}
            <motion.header
                initial={{ y: -20, opacity: 0 }}
                animate={{ y: 0, opacity: 1 }}
                transition={{ duration: 0.4 }}
                className="bg-white border-b border-slate-100 shadow-sm sticky top-0 z-30"
            >
                <div className="max-w-md mx-auto px-4 py-3 flex items-center justify-between">
                    <div className="flex items-center gap-3">
                        <Link href="/conductores/mapa" className="w-9 h-9 border border-slate-200 rounded-full bg-slate-50 flex items-center justify-center hover:bg-slate-100 transition-colors shadow-sm active:scale-95 shrink-0">
                            <ChevronLeft className="w-5 h-5 text-slate-600" />
                        </Link>
                        <div className="w-9 h-9 rounded-full bg-gradient-to-tr from-cyan-500 to-blue-600 flex items-center justify-center shadow-md shrink-0">
                            <span className="text-white font-black text-sm">F</span>
                        </div>
                        <div className="flex flex-col justify-center">
                            <p className="text-[9px] text-slate-400 font-black uppercase tracking-widest leading-none mb-0.5">Mi Garage</p>
                            <p className="text-sm font-black text-slate-800 leading-none">Tu Vehículo</p>
                        </div>
                    </div>

                    {/* CONTROLES DERECHOS (CAMPANITA + PERFIL) */}
                    <div className="flex items-center gap-2">
                        {/* BOTÓN AGREGAR VEHÍCULO RÁPIDO */}
                        {vehiculos.length > 0 && (
                            <button
                                onClick={() => setShowAddModal(true)}
                                title="Agregar vehículo"
                                className="w-9 h-9 rounded-full bg-blue-50 flex items-center justify-center border border-blue-100 hover:bg-blue-100 transition-colors shadow-sm active:scale-90"
                            >
                                <Plus className="w-5 h-5 text-blue-600" />
                            </button>
                        )}

                        {/* CAMPANITA NOTIFICACIONES */}
                        <DropdownMenu>
                            <DropdownMenuTrigger asChild>
                                <button className="w-9 h-9 rounded-full bg-slate-50 flex items-center justify-center border border-slate-200 hover:bg-slate-100 transition-colors outline-none relative focus:ring-2 focus:ring-[#0066FF]/50 shadow-sm">
                                    <Bell className="w-4 h-4 text-slate-600" />
                                    {notifEstado && (
                                        <span className="absolute top-0 right-0 w-2.5 h-2.5 bg-red-500 border-2 border-slate-50 rounded-full animate-pulse"></span>
                                    )}
                                </button>
                            </DropdownMenuTrigger>
                            <DropdownMenuContent align="end" className="w-64 p-2 rounded-2xl shadow-xl border-slate-100">
                                <DropdownMenuLabel className="font-bold text-[10px] uppercase tracking-widest text-slate-400 mb-2 inline-flex items-center gap-1.5 px-2">
                                    <Bell className="w-3 h-3" />
                                    Notificaciones
                                </DropdownMenuLabel>
                                {notifEstado ? (
                                    <div className="p-3 bg-gradient-to-tr from-blue-50 to-cyan-50 rounded-xl border border-blue-100 mb-1">
                                        <p className="text-[11px] text-blue-800/70 font-bold uppercase tracking-wide mb-1">Tu orden activa está:</p>
                                        <div className="flex items-center gap-2">
                                            <div className="w-2 h-2 rounded-full bg-blue-500 animate-pulse"></div>
                                            <p className="text-sm font-black text-blue-700 uppercase tracking-tight">{notifEstado.replace('_', ' ')}</p>
                                        </div>
                                    </div>
                                ) : (
                                    <div className="py-6 px-4 flex flex-col items-center text-center">
                                        <div className="w-8 h-8 rounded-full bg-slate-50 flex items-center justify-center mb-2">
                                            <CheckCircle2 className="w-4 h-4 text-slate-300" />
                                        </div>
                                        <p className="text-xs font-semibold text-slate-500">Estás al día</p>
                                        <p className="text-[10px] font-medium text-slate-400 mt-0.5">No hay actualizaciones recientes.</p>
                                    </div>
                                )}
                            </DropdownMenuContent>
                        </DropdownMenu>

                        {/* PERFIL */}
                        <DropdownMenu>
                            <DropdownMenuTrigger asChild>
                                <button className="w-9 h-9 rounded-full bg-slate-100 flex items-center justify-center border border-slate-200 hover:bg-slate-200 transition-colors outline-none focus:ring-2 focus:ring-[#0066FF]/50 shadow-sm shrink-0">
                                    <User className="w-4 h-4 text-slate-600" />
                                </button>
                            </DropdownMenuTrigger>
                            <DropdownMenuContent align="end" className="w-56 rounded-2xl shadow-xl border-slate-100 p-1">
                                <DropdownMenuLabel className="font-normal">
                                    <div className="flex flex-col space-y-1">
                                        <p className="text-sm font-medium leading-none text-slate-800">{user?.name || 'Cliente'}</p>
                                        <p className="text-xs leading-none text-slate-500">{user?.email}</p>
                                    </div>
                                </DropdownMenuLabel>
                                <DropdownMenuSeparator />
                                <DropdownMenuItem className="text-red-600 focus:bg-red-50 focus:text-red-700 cursor-pointer" onClick={(e) => {
                                    e.preventDefault();
                                    console.log('Boton cerrar sesion clickeado!');
                                    logout();
                                }}>
                                    <LogOut className="mr-2 h-4 w-4" />
                                    <span>Cerrar sesión</span>
                                </DropdownMenuItem>
                            </DropdownMenuContent>
                        </DropdownMenu>
                    </div>
                </div>
            </motion.header>

            <main className="max-w-md mx-auto px-4 py-6 space-y-6">

                {vehiculos.length === 0 && ordenesRecientes.length === 0 ? (
                    <EmptyGarageState onAddClick={() => setShowAddModal(true)} />
                ) : (
                    <>
                        {/* ── INVERSIÓN TOTAL ── */}
                        <motion.div
                            initial="hidden"
                            animate="visible"
                            variants={{
                                hidden: { opacity: 0, y: 30 },
                                visible: {
                                    opacity: 1,
                                    y: 0,
                                    transition: {
                                        duration: 0.6,
                                        staggerChildren: 0.12,
                                        ease: "easeOut"
                                    }
                                }
                            }}
                            className="space-y-6"
                        >
                            {/* ── INVERSIÓN TOTAL ── */}
                            <motion.section
                                variants={{
                                    hidden: { opacity: 0, y: 20 },
                                    visible: { opacity: 1, y: 0, transition: { duration: 0.5 } }
                                }}
                            >
                                <InversionChart data={inversionAnual} />
                            </motion.section>

                            {/* ── VEHÍCULOS (HORIZONTAL CARD) ── */}
                            {vActivo && (
                                <motion.section
                                    variants={{
                                        hidden: { opacity: 0, y: 20 },
                                        visible: { opacity: 1, y: 0, transition: { duration: 0.5 } }
                                    }}
                                >
                                    <h2 className="text-xs font-bold text-slate-400 uppercase tracking-widest mb-3 ml-1">Mi Vehículo</h2>
                                    <VehicleCard v={vActivo} />
                                </motion.section>
                            )}

                            {/* ── FICHA TÉCNICA (GRID) ── */}
                            {vActivo && (
                                <motion.section
                                    variants={{
                                        hidden: { opacity: 0, y: 20 },
                                        visible: { opacity: 1, y: 0, transition: { duration: 0.5 } }
                                    }}
                                >
                                    <div className="flex items-center justify-between mb-3 ml-1">
                                        <h2 className="text-xs font-bold text-slate-400 uppercase tracking-widest">Ficha Técnica</h2>
                                    </div>
                                    <TechnicalGrid v={vActivo} />
                                </motion.section>
                            )}

                            {/* ── HISTORIAL "BANCARIO" ── */}
                            {ordenesRecientes.length > 0 && (
                                <motion.section
                                    variants={{
                                        hidden: { opacity: 0, y: 20 },
                                        visible: { opacity: 1, y: 0, transition: { duration: 0.5 } }
                                    }}
                                >
                                    <h2 className="text-xs font-bold text-slate-400 uppercase tracking-widest mb-3 ml-1">Movimientos Recientes</h2>
                                    <div className="bg-white rounded-[20px] shadow-sm border border-slate-100 p-4">
                                        {ordenesRecientes.map(o => <BankActivityItem key={o.id} orden={o} />)}
                                    </div>
                                </motion.section>
                            )}
                        </motion.div>
                    </>
                )}

            </main>

            <ModalAgregarVehiculo
                isOpen={showAddModal}
                onClose={() => setShowAddModal(false)}
                onSuccess={loadData}
                userId={user?.id || ''}
                userEmail={user?.email || ''}
                userName={user?.name || ''}
            />
        </div>
    );
}
