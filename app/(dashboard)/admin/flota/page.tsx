'use client';

import { useState, useEffect, useCallback, useRef } from 'react';
import { supabase } from '@/lib/supabase';
import { useAuth } from '@/contexts/auth-context';
import ModuleGuard from '@/components/guards/ModuleGuard';
import {
    Car, Plus, TrendingUp, TrendingDown, DollarSign, 
    Package, X, ChevronDown, ChevronUp, Upload, Trash2,
    Wrench, Palette, FileText, ExternalLink, Camera,
    CircleDot, CheckCircle2, Clock, Tag, Edit3, Save,
    AlertTriangle, Link2, Search, CalendarDays, BarChart3,
    HandshakeIcon, ArrowLeft, Copy, RotateCcw, ShoppingCart,
    CheckSquare
} from 'lucide-react';
import { toast } from 'sonner';
import { Button } from '@/components/ui/button';
import { Input } from '@/components/ui/input';
import { Label } from '@/components/ui/label';
import { consultarPatenteGetAPI } from '@/lib/getapi-service';
import { BuscadorInventario, CartItem } from '@/components/inventario/buscador-inventario';
import { NuevoContratoForm } from '@/components/contratos/nuevo-contrato-form';
import { GenerarContratoModal } from '@/components/contratos/generar-contrato-modal';

// ─── Types ─────────────────────────────────────────────────────────────────────
interface VehiculoFlota {
    id: string;
    taller_id: string;
    patente: string;
    marca: string;
    modelo: string;
    anio: number | null;
    vin: string | null;
    color: string | null;
    estado: 'En Preparación' | 'Disponible' | 'Arrendado' | 'Vendido';
    precio_compra: number;
    precio_objetivo: number;
    fotos: string[];
    orden_id: string | null;
    notas: string | null;
    created_at: string;
    inversiones?: Inversion[];
    costo_repuestos_ordenes?: number;
    fecha_salida?: string | null;
    fecha_retorno?: string | null;
    cliente_id?: string | null;
    fotos_ingreso?: string[];
    fotos_reparacion?: string[];
    fotos_finalizado?: string[];
    cliente_nombre?: string;
    estado_ingreso?: string | null;
    destino_unidad?: string | null;
    precio_arriendo_dia?: number | null;
}

interface Inversion {
    id: string;
    vehiculo_id: string;
    concepto: string;
    monto: number;
    fecha: string;
    tipo: 'Mecánica' | 'Pintura' | 'Documentación' | 'Externa' | 'Otro';
    proveedor: string | null;
}

// ─── Helpers ───────────────────────────────────────────────────────────────────
const ESTADO_COLORS: Record<string, { bg: string; text: string; icon: typeof CircleDot }> = {
    'En Preparación': { bg: 'bg-amber-500/20 border-amber-500/40', text: 'text-amber-300', icon: Clock },
    'Disponible':     { bg: 'bg-emerald-500/20 border-emerald-500/40', text: 'text-emerald-300', icon: CheckCircle2 },
    'Arrendado':      { bg: 'bg-blue-500/20 border-blue-500/40', text: 'text-blue-300', icon: Car },
    'Vendido':        { bg: 'bg-slate-500/20 border-slate-500/40', text: 'text-slate-400', icon: Tag },
};

const TIPO_ICONS: Record<string, typeof Wrench> = {
    'Mecánica':      Wrench,
    'Pintura':       Palette,
    'Documentación': FileText,
    'Externa':       ExternalLink,
    'Otro':          Package,
};

function cl(n: number) {
    return n.toLocaleString('es-CL', { style: 'currency', currency: 'CLP', maximumFractionDigits: 0 });
}

// ─── StatCard ──────────────────────────────────────────────────────────────────
function StatCard({ label, value, icon: Icon, color }: { label: string; value: string | number; icon: any; color: string }) {
    return (
        <div className="bg-slate-800/60 rounded-2xl p-4 border border-slate-700/50 flex items-center gap-4">
            <div className={`p-3 rounded-xl ${color}`}>
                <Icon className="w-5 h-5" />
            </div>
            <div>
                <p className="text-xs text-slate-400 font-medium uppercase tracking-wider">{label}</p>
                <p className="text-xl font-black text-white mt-0.5">{value}</p>
            </div>
        </div>
    );
}

// ─── VehiculoCard ──────────────────────────────────────────────────────────────
function VehiculoCard({ v, onSelect }: { v: VehiculoFlota; onSelect: () => void }) {
    const totalInvertido = (v.inversiones || []).reduce((s, i) => s + i.monto, 0);
    const costoRepuestos = v.costo_repuestos_ordenes || 0;
    const costoReal = v.precio_compra + totalInvertido + costoRepuestos;
    const margen = v.precio_objetivo - costoReal;
    const margenPct = costoReal > 0 ? ((margen / costoReal) * 100).toFixed(1) : '0';
    const estado = ESTADO_COLORS[v.estado] || ESTADO_COLORS['En Preparación'];
    const EstadoIcon = estado.icon;

    return (
        <div
            onClick={onSelect}
            className={`group relative bg-gradient-to-br from-slate-800 to-slate-900 rounded-2xl border ${v.estado === 'Arrendado' ? 'border-blue-500/80 shadow-lg shadow-blue-500/20' : 'border-slate-700/50 hover:border-cyan-500/50'} overflow-hidden cursor-pointer hover:shadow-lg hover:shadow-cyan-500/10 transition-all duration-300`}
        >
            {/* Photo or placeholder */}
            <div className="relative h-44 bg-slate-700/50 overflow-hidden">
                {v.fotos && v.fotos.length > 0 ? (
                    <img src={v.fotos[0]} alt={`${v.marca} ${v.modelo}`} className="w-full h-full object-cover group-hover:scale-105 transition-transform duration-500" />
                ) : (
                    <div className="w-full h-full flex items-center justify-center">
                        <Car className="w-16 h-16 text-slate-600" />
                    </div>
                )}
                {/* Estado badge */}
                <div className={`absolute top-3 right-3 flex items-center gap-1.5 px-2.5 py-1 rounded-full border text-xs font-bold ${estado.bg} ${estado.text}`}>
                    <EstadoIcon className="w-3 h-3" />
                    {v.estado}
                </div>
                {/* Overlay Arrendatario */}
                {v.estado === 'Arrendado' && v.cliente_nombre && (
                    <div className="absolute bottom-0 left-0 right-0 bg-blue-900/80 backdrop-blur-sm p-2 flex items-center justify-between text-xs border-t border-blue-500/50">
                        <span className="text-blue-200 font-bold truncate pr-3">{v.cliente_nombre}</span>
                        {v.fecha_retorno && <span className="text-blue-300 whitespace-nowrap block">Hasta {new Date(v.fecha_retorno).toLocaleDateString('es-CL', {day:'2-digit', month:'short'})}</span>}
                    </div>
                )}
            </div>

            {/* Info */}
            <div className="p-4 space-y-3">
                <div>
                    <p className="font-mono font-black text-white text-xl tracking-widest">{v.patente}</p>
                    <p className="text-slate-300 font-semibold">{v.marca} {v.modelo} {v.anio ? `(${v.anio})` : ''}</p>
                    {v.color && <p className="text-slate-500 text-sm">{v.color}</p>}
                </div>

                {/* Financiero */}
                <div className="bg-slate-900/60 rounded-xl p-3 border border-slate-800 space-y-1.5">
                    <div className="flex justify-between text-xs">
                        <span className="text-slate-500">Capital Compra+Invd.</span>
                        <span className="text-slate-300 font-mono">{cl(costoReal)}</span>
                    </div>
                    {v.destino_unidad === 'Arriendo' ? (
                        <div className="flex justify-between text-xs items-center">
                            <span className="text-slate-500">Precio Arriendo Día</span>
                            <span className="text-cyan-400 font-mono flex items-center gap-1.5 bg-cyan-900/30 px-2 py-0.5 rounded-md border border-cyan-500/20">
                                <CalendarDays className="w-3.5 h-3.5" /> 
                                {cl(v.precio_arriendo_dia || 0)}
                            </span>
                        </div>
                    ) : (
                        <>
                            <div className="flex justify-between text-xs">
                                <span className="text-slate-500">Precio Objetivo</span>
                                <span className="text-slate-300 font-mono">{cl(v.precio_objetivo)}</span>
                            </div>
                            <div className="flex justify-between text-sm border-t border-slate-700/50 pt-1.5 mt-1">
                                <span className="text-slate-400 font-bold">Ganancia Est.</span>
                                <div className="flex items-center gap-1">
                                    {margen >= 0 ? <TrendingUp className="w-3.5 h-3.5 text-emerald-400" /> : <TrendingDown className="w-3.5 h-3.5 text-red-400" />}
                                    <span className={`font-black font-mono ${margen >= 0 ? 'text-emerald-400' : 'text-red-400'}`}>
                                        {cl(margen)} ({margenPct}%)
                                    </span>
                                </div>
                            </div>
                        </>
                    )}
                </div>

                {(v.inversiones?.length ?? 0) > 0 && (
                    <p className="text-xs text-slate-500">{v.inversiones!.length} inversión(es) registrada(s)</p>
                )}

                {/* Botón Bitácora Visual */}
                <div className="pt-2 border-t border-slate-700/50 mt-2">
                    <button onClick={(e) => { e.stopPropagation(); onSelect(); }} className="w-full flex items-center justify-center gap-2 py-2 bg-slate-800/80 hover:bg-slate-700/80 border border-slate-700 rounded-xl text-slate-300 transition-colors text-sm font-semibold">
                        <Camera className="w-4 h-4 text-cyan-400" /> Ver Bitácora Visual
                    </button>
                </div>
            </div>
        </div>
    );
}

// ─── Helpers comerciales ────────────────────────────────────────────────────────
function calcDias(salida: string, retorno: string): number {
    if (!salida || !retorno) return 0;
    const diff = new Date(retorno).getTime() - new Date(salida).getTime();
    return Math.max(1, Math.ceil(diff / (1000 * 60 * 60 * 24)));
}

type TabId = 'financiero' | 'taller' | 'comercial';

// ─── Modal Detalle ─────────────────────────────────────────────────────────────
function DetalleModal({ v, onClose, onUpdate }: { v: VehiculoFlota; onClose: () => void; onUpdate: () => void }) {
    const { user } = useAuth();
    const [activeTab, setActiveTab] = useState<TabId>('financiero');

    // ── Inversiones ──────────────────────────────────────────────────────────
    const [inversiones, setInversiones] = useState<Inversion[]>(v.inversiones || []);
    const [addingInv, setAddingInv] = useState(false);
    const [savingInv, setSavingInv] = useState(false);
    const [newInv, setNewInv] = useState({ concepto: '', monto: '', tipo: 'Mecánica' as Inversion['tipo'], fecha: new Date().toISOString().split('T')[0], proveedor: '' });

    // ── Fotos ─────────────────────────────────────────────────────────────────
    const [fotosIngreso, setFotosIngreso] = useState<string[]>(v.fotos_ingreso || []);
    const [fotosReparacion, setFotosReparacion] = useState<string[]>(v.fotos_reparacion || []);
    const [fotosFinalizado, setFotosFinalizado] = useState<string[]>(v.fotos_finalizado || []);
    const fileRef = useRef<HTMLInputElement>(null);
    const [etapaDestinoFoto, setEtapaDestinoFoto] = useState<'ingreso' | 'reparacion' | 'finalizado' | null>(null);
    const [uploadingFoto, setUploadingFoto] = useState(false);

    // ── Clientes ──────────────────────────────────────────────────────────────
    const [clientes, setClientes] = useState<any[]>([]);
    const [busquedaCliente, setBusquedaCliente] = useState('');

    // ── Gestión Comercial ─────────────────────────────────────────────────────
    const [modalComercial, setModalComercial] = useState<'arriendo' | 'venta' | null>(null);
    const [formArriendo, setFormArriendo] = useState({
        clienteId: v.cliente_id || '',
        fechaSalida: new Date().toISOString().split('T')[0],
        fechaRetorno: '',
        precioDia: String(v.precio_arriendo_dia || ''),
    });
    const [formVenta, setFormVenta] = useState({
        clienteId: '',
        precioVenta: String(v.precio_objetivo || ''),
    });
    const [procesando, setProcesando] = useState(false);
    const [trackingLink, setTrackingLink] = useState<string | null>(null);
    const [trackingOrdenId, setTrackingOrdenId] = useState<string | null>(null);
    const [showNuevoContrato, setShowNuevoContrato] = useState(false);
    const [showGenerarContrato, setShowGenerarContrato] = useState(false);

    useEffect(() => {
        const fetchClientes = async () => {
            if (!user?.tallerId) return;
            const { data } = await supabase.from('clientes').select('id, nombre_completo, rut_dni').eq('taller_id', user.tallerId).order('nombre_completo');
            if (data) setClientes(data);
        };
        fetchClientes();
    }, [user?.tallerId]);

    const totalInvertido = inversiones.reduce((s, i) => s + i.monto, 0);
    const costoRepuestos = v.costo_repuestos_ordenes || 0;
    const costoReal = v.precio_compra + totalInvertido + costoRepuestos;
    const margen = v.precio_objetivo - costoReal;

    const clientesFiltrados = clientes.filter(c => !busquedaCliente || c.nombre_completo.toLowerCase().includes(busquedaCliente.toLowerCase()) || (c.rut_dni || '').includes(busquedaCliente));

    // ── Handlers inversiones ──────────────────────────────────────────────────
    const handleAddInversion = async () => {
        if (!newInv.concepto || !newInv.monto) { toast.error('Completa concepto y monto'); return; }
        setSavingInv(true);
        const { data, error } = await supabase.from('flota_inversiones').insert({
            vehiculo_id: v.id,
            concepto: newInv.concepto,
            monto: Number(newInv.monto.replace(/\./g, '').replace(',', '.')),
            tipo: newInv.tipo,
            fecha: newInv.fecha,
            proveedor: newInv.proveedor || null,
        }).select().single();
        if (error) { toast.error('Error al guardar la inversión'); }
        else {
            setInversiones(prev => [...prev, data as Inversion]);
            setNewInv({ concepto: '', monto: '', tipo: 'Mecánica', fecha: new Date().toISOString().split('T')[0], proveedor: '' });
            setAddingInv(false);
            toast.success('Inversión registrada ✅');
            onUpdate();
        }
        setSavingInv(false);
    };

    const handleDeleteInversion = async (id: string) => {
        await supabase.from('flota_inversiones').delete().eq('id', id);
        setInversiones(prev => prev.filter(i => i.id !== id));
        onUpdate();
    };

    // ── Handler BuscadorInventario ────────────────────────────────────────────
    const handleRepuestosAsignados = async (items: CartItem[]) => {
        if (!items.length) return;
        // Find newly added items (that don't exist yet as inversiones from productos)
        // We trust the BuscadorInventario manages its own cart; here we handle "Confirmar"
    };

    const handleConfirmarRepuestos = async (items: CartItem[]) => {
        if (!items.length) { toast.error('No hay repuestos seleccionados'); return; }
        setSavingInv(true);
        try {
            for (const item of items) {
                const monto = item.precio_venta * item.cantidad;
                // 1. Descuenta stock
                await supabase.from('productos').update({ stock_actual: item.stock_actual - item.cantidad }).eq('id', item.id);
                // 2. Crear inversión en flota
                await supabase.from('flota_inversiones').insert({
                    vehiculo_id: v.id,
                    concepto: `[Repuesto] ${item.nombre} ×${item.cantidad}`,
                    monto,
                    tipo: 'Mecánica',
                    fecha: new Date().toISOString().split('T')[0],
                    proveedor: 'Inventario interno',
                });
            }
            // Reload inversiones
            const { data: newInvs } = await supabase.from('flota_inversiones').select('*').eq('vehiculo_id', v.id).order('fecha');
            if (newInvs) setInversiones(newInvs as Inversion[]);
            toast.success(`${items.length} repuesto(s) asignados al vehículo ✅`);
            onUpdate();
        } catch (e) {
            toast.error('Error asignando repuestos');
        }
        setSavingInv(false);
    };

    // ── Handler fotos ─────────────────────────────────────────────────────────
    const handleUploadFoto = async (e: React.ChangeEvent<HTMLInputElement>) => {
        const file = e.target.files?.[0];
        if (!file || !user?.tallerId || !etapaDestinoFoto) return;
        setUploadingFoto(true);
        const ext = file.name.split('.').pop();
        const path = `${user.tallerId}/${v.id}/${etapaDestinoFoto}/${Date.now()}.${ext}`;
        const { error: upErr } = await supabase.storage.from('flota-fotos').upload(path, file, { upsert: true });
        if (upErr) { toast.error('Error subiendo foto'); setUploadingFoto(false); return; }
        const { data: urlData } = supabase.storage.from('flota-fotos').getPublicUrl(path);
        let newFotosArray: string[] = [];
        let col = 'fotos_ingreso';
        if (etapaDestinoFoto === 'ingreso') { newFotosArray = [...fotosIngreso, urlData.publicUrl]; col = 'fotos_ingreso'; setFotosIngreso(newFotosArray); }
        else if (etapaDestinoFoto === 'reparacion') { newFotosArray = [...fotosReparacion, urlData.publicUrl]; col = 'fotos_reparacion'; setFotosReparacion(newFotosArray); }
        else if (etapaDestinoFoto === 'finalizado') { newFotosArray = [...fotosFinalizado, urlData.publicUrl]; col = 'fotos_finalizado'; setFotosFinalizado(newFotosArray); }
        await supabase.from('flota').update({ [col]: newFotosArray }).eq('id', v.id);
        toast.success(`Foto añadida ✅`);
        setUploadingFoto(false);
        setEtapaDestinoFoto(null);
        onUpdate();
    };

    const handleDeleteFoto = async (url: string, etapa: 'ingreso' | 'reparacion' | 'finalizado') => {
        let arr: string[] = []; let col = '';
        if (etapa === 'ingreso') { arr = fotosIngreso.filter(f => f !== url); col = 'fotos_ingreso'; setFotosIngreso(arr); }
        if (etapa === 'reparacion') { arr = fotosReparacion.filter(f => f !== url); col = 'fotos_reparacion'; setFotosReparacion(arr); }
        if (etapa === 'finalizado') { arr = fotosFinalizado.filter(f => f !== url); col = 'fotos_finalizado'; setFotosFinalizado(arr); }
        await supabase.from('flota').update({ [col]: arr }).eq('id', v.id);
        onUpdate();
    };

    // ── ACCIÓN TRIPLE: Iniciar Arriendo ───────────────────────────────────────
    const handleIniciarArriendo = async () => {
        const { clienteId, fechaSalida, fechaRetorno, precioDia } = formArriendo;
        if (!clienteId || !fechaSalida || !fechaRetorno || !precioDia) {
            toast.error('Completa todos los campos del arriendo');
            return;
        }
        setProcesando(true);
        try {
            const dias = calcDias(fechaSalida, fechaRetorno);
            const precioTotal = dias * Number(precioDia.replace(/\./g, ''));
            const cliente = clientes.find(c => c.id === clienteId);

            // 1. UPDATE flota
            await supabase.from('flota').update({
                estado: 'Arrendado',
                cliente_id: clienteId,
                fecha_salida: fechaSalida,
                fecha_retorno: fechaRetorno,
            }).eq('id', v.id);

            // 2. INSERT orden (tipo_orden = 'arriendo')
            const { data: ordenData, error: ordenErr } = await supabase.from('ordenes').insert({
                taller_id: user!.tallerId,
                cliente_id: clienteId,
                patente_vehiculo: v.patente,
                tipo_orden: 'arriendo',
                estado: 'en_proceso',
                fecha_ingreso: new Date(fechaSalida).toISOString(),
                eta_entrega: new Date(fechaRetorno).toISOString(),
                precio_total: precioTotal,
                descripcion_problema: `Arriendo de vehículo ${v.patente} — ${dias} días`,
                notas_publicas: `Arriendo: ${new Date(fechaSalida).toLocaleDateString('es-CL')} hasta ${new Date(fechaRetorno).toLocaleDateString('es-CL')}`,
            }).select('id').single();

            if (ordenErr || !ordenData) throw new Error('No se pudo crear la orden de arriendo');

            const ordenId = ordenData.id;

            // 3. INSERT contrato
            await supabase.from('contratos').insert({
                orden_id: ordenId,
                taller_id: user!.tallerId,
                cliente_id: clienteId,
                patente: v.patente,
                estado: 'pendiente_firma',
                tipo: 'arriendo',
                datos_comerciales: {
                    fecha_salida: fechaSalida,
                    fecha_retorno: fechaRetorno,
                    precio_dia: Number(precioDia.replace(/\./g, '')),
                    precio_total: precioTotal,
                    dias,
                    vehiculo: `${v.marca} ${v.modelo} ${v.anio || ''}`.trim(),
                    cliente_nombre: cliente?.nombre_completo || '',
                },
                texto_legal: `CONTRATO DE ARRIENDO DE VEHÍCULO\n\nVehículo: ${v.marca} ${v.modelo} ${v.anio || ''} — Patente: ${v.patente}\nArrendatario: ${cliente?.nombre_completo || clienteId}\nFecha Salida: ${new Date(fechaSalida).toLocaleDateString('es-CL')}\nFecha Retorno: ${new Date(fechaRetorno).toLocaleDateString('es-CL')}\nDuración: ${dias} día(s)\nPrecio por Día: ${cl(Number(precioDia.replace(/\./g, '')))}\nMonto Total: ${cl(precioTotal)}\n\nEl arrendatario se compromete a devolver el vehículo en las mismas condiciones en que fue entregado.`,
            });

            const link = `${window.location.origin}/tracking/${ordenId}`;
            setTrackingLink(link);
            setTrackingOrdenId(ordenId);
            setModalComercial(null);
            toast.success(`🚗 Arriendo iniciado! Contrato pendiente de firma.`);
            onUpdate();
        } catch (e: any) {
            toast.error(e.message || 'Error al iniciar arriendo');
        }
        setProcesando(false);
    };

    // ── ACCIÓN TRIPLE: Registrar Venta ────────────────────────────────────────
    const handleRegistrarVenta = async () => {
        const { clienteId, precioVenta } = formVenta;
        if (!precioVenta) { toast.error('Ingresa el precio de venta'); return; }
        setProcesando(true);
        try {
            const precio = Number(precioVenta.replace(/\./g, ''));
            const cliente = clientes.find(c => c.id === clienteId);

            // 1. UPDATE flota
            await supabase.from('flota').update({
                estado: 'Vendido',
                ...(clienteId ? { cliente_id: clienteId } : {}),
            }).eq('id', v.id);

            // 2. INSERT orden
            const { data: ordenData, error: ordenErr } = await supabase.from('ordenes').insert({
                taller_id: user!.tallerId,
                ...(clienteId ? { cliente_id: clienteId } : {}),
                patente_vehiculo: v.patente,
                tipo_orden: 'venta',
                estado: 'completada',
                fecha_ingreso: new Date().toISOString(),
                precio_total: precio,
                descripcion_problema: `Venta de vehículo ${v.patente}`,
            }).select('id').single();

            if (ordenErr || !ordenData) throw new Error('No se pudo crear la orden de venta');

            // 3. INSERT contrato
            await supabase.from('contratos').insert({
                orden_id: ordenData.id,
                taller_id: user!.tallerId,
                ...(clienteId ? { cliente_id: clienteId } : {}),
                patente: v.patente,
                estado: 'pendiente_firma',
                tipo: 'venta',
                datos_comerciales: {
                    precio_venta: precio,
                    vehiculo: `${v.marca} ${v.modelo} ${v.anio || ''}`.trim(),
                    cliente_nombre: cliente?.nombre_completo || '',
                },
                texto_legal: `CONTRATO DE COMPRAVENTA DE VEHÍCULO\n\nVehículo: ${v.marca} ${v.modelo} ${v.anio || ''} — Patente: ${v.patente}\nCompradortr: ${cliente?.nombre_completo || 'No especificado'}\nPrecio de Venta: ${cl(precio)}\nFecha: ${new Date().toLocaleDateString('es-CL')}\n\nEl vendedor garantiza que el vehículo se encuentra libre de gravámenes y con toda su documentación al día.`,
            });

            setModalComercial(null);
            toast.success(`💰 Venta registrada! Contrato pendiente de firma.`);
            onUpdate();
        } catch (e: any) {
            toast.error(e.message || 'Error al registrar venta');
        }
        setProcesando(false);
    };

    // ── Handler Devolución ────────────────────────────────────────────────────
    const handleRegistrarDevolucion = async (nuevoEstado: 'Disponible' | 'En Preparación') => {
        setProcesando(true);
        const { error } = await supabase.from('flota').update({
            estado: nuevoEstado,
            cliente_id: null,
            fecha_salida: null,
            fecha_retorno: null,
        }).eq('id', v.id);
        if (!error) {
            toast.success(`🔙 Devolución registrada. Vehículo ahora ${nuevoEstado}.`);
            onUpdate();
            onClose();
        } else {
            toast.error('Error al registrar devolución');
        }
        setProcesando(false);
    };

    // ────────────────────────────────────────────────────────────────────────────
    // RENDER TABS
    // ────────────────────────────────────────────────────────────────────────────
    const tabs: { id: TabId; label: string; icon: any }[] = [
        { id: 'financiero', label: 'Financiero', icon: BarChart3 },
        { id: 'taller', label: 'Taller', icon: Wrench },
        { id: 'comercial', label: 'Comercial', icon: HandshakeIcon },
    ];

    return (
        <div className="fixed inset-0 z-50 flex items-end sm:items-center justify-center p-0 sm:p-4 bg-black/70 backdrop-blur-sm" onClick={e => e.target === e.currentTarget && onClose()}>
            <div className="bg-slate-900 border border-slate-700 rounded-t-3xl sm:rounded-3xl w-full sm:max-w-2xl max-h-[95vh] flex flex-col shadow-2xl">
                {/* Header */}
                <div className="bg-slate-900/95 backdrop-blur-sm border-b border-slate-800 p-5 flex items-start justify-between shrink-0">
                    <div>
                        <p className="font-mono font-black text-2xl text-white tracking-widest">{v.patente}</p>
                        <p className="text-slate-400">{v.marca} {v.modelo} {v.anio ? `• ${v.anio}` : ''}</p>
                    </div>
                    <div className="flex items-center gap-2">
                        <div className={`flex items-center gap-1.5 px-2.5 py-1 rounded-full border text-xs font-bold ${ESTADO_COLORS[v.estado]?.bg} ${ESTADO_COLORS[v.estado]?.text}`}>
                            <CircleDot className="w-3 h-3" /> {v.estado}
                        </div>
                        <button onClick={onClose} className="p-2 rounded-xl bg-slate-800 text-slate-400 hover:text-white hover:bg-slate-700 transition-colors">
                            <X className="w-5 h-5" />
                        </button>
                    </div>
                </div>

                {/* Tab Bar */}
                <div className="flex border-b border-slate-800 shrink-0">
                    {tabs.map(tab => {
                        const Icon = tab.icon;
                        return (
                            <button key={tab.id} onClick={() => setActiveTab(tab.id)}
                                className={`flex-1 flex items-center justify-center gap-2 py-3 text-sm font-bold transition-all border-b-2 ${activeTab === tab.id ? 'border-cyan-500 text-cyan-400 bg-cyan-500/5' : 'border-transparent text-slate-500 hover:text-slate-300'}`}>
                                <Icon className="w-4 h-4" />
                                {tab.label}
                            </button>
                        );
                    })}
                </div>

                {/* Tab Content */}
                <div className="overflow-y-auto flex-1 scrollbar-thin scrollbar-thumb-slate-700">

                    {/* ──────────── TAB: FINANCIERO ──────────── */}
                    {activeTab === 'financiero' && (
                        <div className="p-5 space-y-5">
                            {/* Resumen Financiero */}
                            <div className="bg-gradient-to-br from-slate-800 to-slate-900 rounded-2xl p-4 border border-slate-700/50 space-y-3">
                                <h3 className="text-xs font-bold text-slate-400 uppercase tracking-widest">Resumen Financiero</h3>
                                <div className="grid grid-cols-2 gap-3">
                                    <div className="bg-slate-900/50 rounded-xl p-3">
                                        <p className="text-xs text-slate-500">Precio Compra</p>
                                        <p className="text-lg font-black text-white font-mono">{cl(v.precio_compra)}</p>
                                    </div>
                                    <div className="bg-slate-900/50 rounded-xl p-3">
                                        <p className="text-xs text-slate-500">Inversiones</p>
                                        <p className="text-lg font-black text-amber-400 font-mono">+{cl(totalInvertido)}</p>
                                    </div>
                                    <div className="bg-slate-900/50 rounded-xl p-3">
                                        <p className="text-xs text-slate-500">Repuestos (Órdenes)</p>
                                        <p className="text-lg font-black text-orange-400 font-mono">+{cl(costoRepuestos)}</p>
                                    </div>
                                    <div className="bg-slate-900/50 rounded-xl p-3">
                                        <p className="text-xs text-slate-500">Costo Real Total</p>
                                        <p className="text-lg font-black text-white font-mono">{cl(costoReal)}</p>
                                    </div>
                                    <div className="bg-slate-900/50 rounded-xl p-3 col-span-2">
                                        <p className="text-xs text-slate-500">{v.destino_unidad === 'Arriendo' ? 'Precio por Día' : 'Precio Objetivo Venta'}</p>
                                        <p className="text-lg font-black text-cyan-400 font-mono">
                                            {v.destino_unidad === 'Arriendo' ? `${cl(v.precio_arriendo_dia || 0)}/día` : cl(v.precio_objetivo)}
                                        </p>
                                    </div>
                                </div>
                                {v.destino_unidad !== 'Arriendo' && (
                                    <div className={`rounded-xl p-3 flex items-center justify-between ${margen >= 0 ? 'bg-emerald-500/10 border border-emerald-500/20' : 'bg-red-500/10 border border-red-500/20'}`}>
                                        <div className="flex items-center gap-2">
                                            {margen >= 0 ? <TrendingUp className="w-4 h-4 text-emerald-400" /> : <TrendingDown className="w-4 h-4 text-red-400" />}
                                            <span className="font-bold text-sm text-slate-200">Margen de Ganancia</span>
                                        </div>
                                        <span className={`font-black text-lg font-mono ${margen >= 0 ? 'text-emerald-400' : 'text-red-400'}`}>
                                            {margen >= 0 ? '+' : ''}{cl(margen)}
                                        </span>
                                    </div>
                                )}
                            </div>

                            {/* Vínculo a Orden */}
                            {v.orden_id && (
                                <a href={`/admin/ordenes?id=${v.orden_id}`} target="_blank" rel="noopener noreferrer"
                                    className="flex items-center gap-3 p-3 bg-blue-500/10 border border-blue-500/20 rounded-xl text-blue-300 hover:bg-blue-500/20 transition-colors">
                                    <Link2 className="w-4 h-4 shrink-0" />
                                    <span className="text-sm font-medium">Ver Orden de Trabajo vinculada</span>
                                    <ExternalLink className="w-3.5 h-3.5 ml-auto" />
                                </a>
                            )}

                            {/* Link de Tracking generado */}
                            {trackingLink && (
                                <div className="p-4 bg-emerald-500/10 border border-emerald-500/30 rounded-2xl space-y-3">
                                    <p className="text-xs font-bold text-emerald-400 uppercase tracking-widest">🔗 Link de Tracking Generado</p>
                                    <p className="text-xs text-slate-300 break-all font-mono">{trackingLink}</p>
                                    <div className="flex gap-2 flex-wrap">
                                        <button onClick={() => { navigator.clipboard.writeText(trackingLink); toast.success('Link copiado!'); }}
                                            className="flex items-center gap-2 text-xs text-emerald-400 font-bold hover:text-emerald-300 transition-colors bg-emerald-500/10 px-3 py-1.5 rounded-lg border border-emerald-500/20">
                                            <Copy className="w-3.5 h-3.5" /> Copiar link
                                        </button>
                                    </div>
                                </div>
                            )}

                            {/* Botón Generar Contrato — abre formulario de variables primero */}
                            {(v.estado === 'Disponible' || v.estado === 'Arrendado' || v.estado === 'Vendido') && (
                                <button onClick={() => setShowNuevoContrato(true)}
                                    className="w-full flex items-center justify-center gap-2 py-2.5 bg-blue-600/20 hover:bg-blue-600/30 border border-blue-500/30 rounded-xl text-blue-300 font-semibold text-sm transition-colors">
                                    <FileText className="w-4 h-4" /> 📋 Crear Contrato Digital
                                </button>
                            )}

                            {/* Formulario Nuevo Contrato */}
                            {showNuevoContrato && (
                                <NuevoContratoForm
                                    isOpen={showNuevoContrato}
                                    onClose={() => setShowNuevoContrato(false)}
                                    onSuccess={(contratoId) => {
                                        setShowNuevoContrato(false);
                                        toast.info('Contrato creado — ve a Contratos Digitales para enviar por WhatsApp');
                                    }}
                                    vehiculo={v}
                                />
                            )}

                            {/* Timeline Inversiones */}
                            <div>
                                <div className="flex items-center justify-between mb-3">
                                    <h3 className="text-xs font-bold text-slate-400 uppercase tracking-widest">Timeline de Inversiones</h3>
                                    <button onClick={() => { setAddingInv(true); setActiveTab('taller'); }}
                                        className="flex items-center gap-1.5 text-xs font-bold text-cyan-400 hover:text-cyan-300 bg-cyan-500/10 px-3 py-1.5 rounded-lg border border-cyan-500/20">
                                        <Plus className="w-3.5 h-3.5" /> Nueva
                                    </button>
                                </div>
                                {inversiones.length === 0 ? (
                                    <div className="text-center py-6 text-slate-600">
                                        <Wrench className="w-7 h-7 mx-auto mb-2 opacity-40" />
                                        <p className="text-sm">Sin inversiones — ve a la pestaña Taller para añadir</p>
                                    </div>
                                ) : (
                                    <div className="relative ml-2">
                                        <div className="absolute left-2.5 top-0 bottom-0 w-px bg-gradient-to-b from-cyan-500/50 to-transparent" />
                                        <div className="space-y-3">
                                            {inversiones.sort((a, b) => new Date(a.fecha).getTime() - new Date(b.fecha).getTime()).map(inv => {
                                                const TipoIcon = TIPO_ICONS[inv.tipo] || Package;
                                                return (
                                                    <div key={inv.id} className="flex gap-4 group">
                                                        <div className="w-5 h-5 shrink-0 bg-slate-700 rounded-full border-2 border-cyan-500/50 flex items-center justify-center mt-2.5 z-10">
                                                            <div className="w-1.5 h-1.5 rounded-full bg-cyan-400" />
                                                        </div>
                                                        <div className="flex-1 bg-slate-800/50 rounded-xl border border-slate-700/50 p-3 hover:border-slate-600 transition-colors">
                                                            <div className="flex items-start justify-between">
                                                                <div className="flex items-center gap-2">
                                                                    <TipoIcon className="w-4 h-4 text-slate-400 shrink-0" />
                                                                    <div>
                                                                        <p className="text-sm font-bold text-white">{inv.concepto}</p>
                                                                        <div className="flex items-center gap-2 text-xs text-slate-500 mt-0.5">
                                                                            <span>{inv.tipo}</span>
                                                                            {inv.proveedor && <><span>•</span><span>{inv.proveedor}</span></>}
                                                                            <span>•</span>
                                                                            <span>{new Date(inv.fecha).toLocaleDateString('es-CL')}</span>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                                <div className="flex items-center gap-2">
                                                                    <span className="font-black text-amber-400 font-mono text-sm">{cl(inv.monto)}</span>
                                                                    <button onClick={() => handleDeleteInversion(inv.id)}
                                                                        className="opacity-0 group-hover:opacity-100 p-1 rounded text-red-400 hover:bg-red-500/10 transition-all">
                                                                        <Trash2 className="w-3.5 h-3.5" />
                                                                    </button>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                );
                                            })}
                                        </div>
                                    </div>
                                )}
                            </div>
                        </div>
                    )}

                    {/* ──────────── TAB: TALLER INTERNO ──────────── */}
                    {activeTab === 'taller' && (
                        <div className="p-5 space-y-5">
                            {/* BuscadorInventario */}
                            <div className="space-y-3">
                                <div className="flex items-center justify-between">
                                    <h3 className="text-xs font-bold text-slate-400 uppercase tracking-widest">
                                        <ShoppingCart className="w-3.5 h-3.5 inline mr-1.5" />
                                        Asignar Repuestos del Inventario
                                    </h3>
                                </div>
                                <div className="bg-slate-800/40 rounded-2xl border border-slate-700/50 p-4">
                                    <InventarioPicker vehiculoId={v.id} onConfirmar={handleConfirmarRepuestos} saving={savingInv} />
                                </div>
                            </div>

                            {/* Separador */}
                            <div className="flex items-center gap-3">
                                <div className="flex-1 h-px bg-slate-700" />
                                <span className="text-xs text-slate-500 font-semibold">o agrega gasto manual</span>
                                <div className="flex-1 h-px bg-slate-700" />
                            </div>

                            {/* Inversión manual */}
                            <div>
                                <div className="flex items-center justify-between mb-3">
                                    <h3 className="text-xs font-bold text-slate-400 uppercase tracking-widest">Mano de Obra / Gasto Externo</h3>
                                    {!addingInv && (
                                        <button onClick={() => setAddingInv(true)}
                                            className="flex items-center gap-1.5 text-xs font-bold text-cyan-400 hover:text-cyan-300 bg-cyan-500/10 px-3 py-1.5 rounded-lg border border-cyan-500/20 hover:border-cyan-400/40 transition-colors">
                                            <Plus className="w-3.5 h-3.5" /> Añadir gasto
                                        </button>
                                    )}
                                </div>

                                {addingInv && (
                                    <div className="bg-slate-800 border border-slate-700 rounded-2xl p-4 space-y-3">
                                        <div className="grid grid-cols-2 gap-3">
                                            <div className="col-span-2 space-y-1">
                                                <Label className="text-slate-400 text-xs">Concepto *</Label>
                                                <Input value={newInv.concepto} onChange={e => setNewInv(p => ({ ...p, concepto: e.target.value }))}
                                                    placeholder="Ej: Mano de obra alineación" className="bg-slate-900 border-slate-700 text-white" />
                                            </div>
                                            <div className="space-y-1">
                                                <Label className="text-slate-400 text-xs">Monto ($) *</Label>
                                                <Input value={newInv.monto} onChange={e => setNewInv(p => ({ ...p, monto: e.target.value }))}
                                                    placeholder="50000" className="bg-slate-900 border-slate-700 text-white" />
                                            </div>
                                            <div className="space-y-1">
                                                <Label className="text-slate-400 text-xs">Tipo</Label>
                                                <select value={newInv.tipo} onChange={e => setNewInv(p => ({ ...p, tipo: e.target.value as Inversion['tipo'] }))}
                                                    className="w-full h-10 bg-slate-900 border border-slate-700 text-white rounded-md px-3 text-sm">
                                                    {['Mecánica', 'Pintura', 'Documentación', 'Externa', 'Otro'].map(t => (
                                                        <option key={t} value={t}>{t}</option>
                                                    ))}
                                                </select>
                                            </div>
                                            <div className="space-y-1">
                                                <Label className="text-slate-400 text-xs">Fecha</Label>
                                                <Input type="date" value={newInv.fecha} onChange={e => setNewInv(p => ({ ...p, fecha: e.target.value }))}
                                                    className="bg-slate-900 border-slate-700 text-white" />
                                            </div>
                                            <div className="space-y-1">
                                                <Label className="text-slate-400 text-xs">Proveedor</Label>
                                                <Input value={newInv.proveedor} onChange={e => setNewInv(p => ({ ...p, proveedor: e.target.value }))}
                                                    placeholder="Taller externo" className="bg-slate-900 border-slate-700 text-white" />
                                            </div>
                                        </div>
                                        <div className="flex gap-2 pt-1">
                                            <Button onClick={handleAddInversion} disabled={savingInv} className="flex-1 bg-emerald-600 hover:bg-emerald-500 text-white h-9 rounded-xl font-bold">
                                                {savingInv ? 'Guardando...' : '✅ Guardar Gasto'}
                                            </Button>
                                            <Button onClick={() => setAddingInv(false)} variant="ghost" className="text-slate-400 h-9 rounded-xl">Cancelar</Button>
                                        </div>
                                    </div>
                                )}
                            </div>

                            {/* Fotos */}
                            <div>
                                <h3 className="text-xs font-bold text-slate-400 uppercase tracking-widest mb-3">Trazabilidad de Fotos</h3>
                                <input ref={fileRef} type="file" accept="image/*" className="hidden" onChange={handleUploadFoto} />
                                <div className="space-y-3">
                                    {[
                                        { titulo: 'Ingreso', etapa: 'ingreso' as const, arr: fotosIngreso },
                                        { titulo: 'Reparación / Proceso', etapa: 'reparacion' as const, arr: fotosReparacion },
                                        { titulo: 'Finalizado', etapa: 'finalizado' as const, arr: fotosFinalizado },
                                    ].map(({ titulo, etapa, arr }) => (
                                        <div key={etapa} className="bg-slate-800/30 border border-slate-700/50 rounded-xl p-3">
                                            <div className="flex items-center justify-between mb-2">
                                                <p className="text-sm font-bold text-slate-300">{titulo}</p>
                                                <button onClick={() => { setEtapaDestinoFoto(etapa); fileRef.current?.click(); }} disabled={uploadingFoto && etapaDestinoFoto === etapa}
                                                    className="text-xs flex items-center gap-1 text-cyan-400 hover:text-cyan-300 transition-colors bg-cyan-500/10 px-2 py-1 rounded-md">
                                                    {uploadingFoto && etapaDestinoFoto === etapa ? 'Subiendo...' : <><Plus className="w-3 h-3" /> Añadir</>}
                                                </button>
                                            </div>
                                            {arr.length === 0 ? (
                                                <p className="text-xs text-slate-500 italic py-1">Sin fotos</p>
                                            ) : (
                                                <div className="flex gap-2 overflow-x-auto pb-1">
                                                    {arr.map((url, i) => (
                                                        <div key={i} className="relative w-20 h-20 shrink-0 rounded-lg overflow-hidden group">
                                                            <img src={url} alt="" className="w-full h-full object-cover" />
                                                            <button onClick={() => handleDeleteFoto(url, etapa)}
                                                                className="absolute top-1 right-1 opacity-0 group-hover:opacity-100 w-5 h-5 bg-red-500 rounded-full flex items-center justify-center transition-opacity shadow">
                                                                <X className="w-3 h-3 text-white" />
                                                            </button>
                                                        </div>
                                                    ))}
                                                </div>
                                            )}
                                        </div>
                                    ))}
                                </div>
                            </div>
                        </div>
                    )}

                    {/* ──────────── TAB: GESTIÓN COMERCIAL ──────────── */}
                    {activeTab === 'comercial' && (
                        <div className="p-5 space-y-5">

                            {/* Estado Arrendado: ver info + devolución */}
                            {v.estado === 'Arrendado' && (
                                <div className="space-y-4">
                                    <div className="bg-blue-500/10 border border-blue-500/30 rounded-2xl p-5 space-y-3">
                                        <div className="flex items-center gap-2 mb-2">
                                            <div className="w-2 h-2 bg-blue-400 rounded-full animate-pulse" />
                                            <span className="text-sm font-bold text-blue-300 uppercase tracking-widest">Arriendo en Curso</span>
                                        </div>
                                        {v.cliente_nombre && (
                                            <div>
                                                <p className="text-xs text-slate-500">Cliente</p>
                                                <p className="font-bold text-white text-lg">{v.cliente_nombre}</p>
                                            </div>
                                        )}
                                        <div className="grid grid-cols-2 gap-3">
                                            <div className="bg-slate-900/50 rounded-xl p-3">
                                                <p className="text-xs text-slate-500">Fecha Salida</p>
                                                <p className="font-bold text-slate-200">{v.fecha_salida ? new Date(v.fecha_salida).toLocaleDateString('es-CL') : '—'}</p>
                                            </div>
                                            <div className="bg-slate-900/50 rounded-xl p-3">
                                                <p className="text-xs text-slate-500">Retorno Esperado</p>
                                                <p className="font-bold text-slate-200">{v.fecha_retorno ? new Date(v.fecha_retorno).toLocaleDateString('es-CL') : '—'}</p>
                                            </div>
                                        </div>
                                        {v.fecha_salida && v.fecha_retorno && (
                                            <div className="bg-slate-900/50 rounded-xl p-3">
                                                <p className="text-xs text-slate-500">Duración del arriendo</p>
                                                <p className="font-bold text-cyan-400">{calcDias(v.fecha_salida, v.fecha_retorno)} días • {cl((v.precio_arriendo_dia || 0) * calcDias(v.fecha_salida, v.fecha_retorno))}</p>
                                            </div>
                                        )}
                                    </div>

                                    <div className="grid grid-cols-2 gap-3">
                                        <Button onClick={() => handleRegistrarDevolucion('Disponible')} disabled={procesando}
                                            className="h-12 bg-emerald-600 hover:bg-emerald-500 text-white font-bold rounded-xl">
                                            <CheckCircle2 className="w-4 h-4 mr-2" />
                                            {procesando ? '...' : 'Devuelto OK'}
                                        </Button>
                                        <Button onClick={() => handleRegistrarDevolucion('En Preparación')} disabled={procesando}
                                            className="h-12 bg-amber-600 hover:bg-amber-500 text-white font-bold rounded-xl">
                                            <Wrench className="w-4 h-4 mr-2" />
                                            {procesando ? '...' : 'Requiere Prep.'}
                                        </Button>
                                    </div>
                                </div>
                            )}

                            {/* Estado Disponible: botones de acción */}
                            {v.estado === 'Disponible' && !modalComercial && (
                                <div className="space-y-4">
                                    <p className="text-xs text-slate-400 font-semibold uppercase tracking-widest">Acciones Comerciales</p>
                                    <div className="grid grid-cols-1 gap-3">
                                        <button onClick={() => setModalComercial('arriendo')}
                                            className="flex items-center gap-4 p-5 bg-blue-500/10 border border-blue-500/30 hover:border-blue-400/60 rounded-2xl text-left transition-all group">
                                            <div className="w-12 h-12 bg-blue-500/20 rounded-xl flex items-center justify-center shrink-0 group-hover:bg-blue-500/30 transition-colors">
                                                <CalendarDays className="w-6 h-6 text-blue-400" />
                                            </div>
                                            <div>
                                                <p className="font-bold text-white text-base">🤝 Iniciar Arriendo</p>
                                                <p className="text-sm text-slate-400">Asigna cliente, fechas y genera contrato + tracking</p>
                                            </div>
                                        </button>
                                        <button onClick={() => setModalComercial('venta')}
                                            className="flex items-center gap-4 p-5 bg-emerald-500/10 border border-emerald-500/30 hover:border-emerald-400/60 rounded-2xl text-left transition-all group">
                                            <div className="w-12 h-12 bg-emerald-500/20 rounded-xl flex items-center justify-center shrink-0 group-hover:bg-emerald-500/30 transition-colors">
                                                <DollarSign className="w-6 h-6 text-emerald-400" />
                                            </div>
                                            <div>
                                                <p className="font-bold text-white text-base">💰 Registrar Venta</p>
                                                <p className="text-sm text-slate-400">Cierra la operación y genera contrato de compraventa</p>
                                            </div>
                                        </button>
                                    </div>
                                </div>
                            )}

                            {/* Formulario Arriendo */}
                            {modalComercial === 'arriendo' && (
                                <div className="space-y-4">
                                    <div className="flex items-center gap-2">
                                        <button onClick={() => setModalComercial(null)} className="p-1.5 rounded-lg bg-slate-800 text-slate-400 hover:text-white">
                                            <ArrowLeft className="w-4 h-4" />
                                        </button>
                                        <h3 className="font-bold text-white">Iniciar Arriendo</h3>
                                    </div>

                                    <div className="space-y-3">
                                        <div className="space-y-1">
                                            <Label className="text-slate-400 text-xs">Buscar Cliente *</Label>
                                            <Input value={busquedaCliente} onChange={e => setBusquedaCliente(e.target.value)}
                                                placeholder="Nombre o RUT..." className="bg-slate-900 border-slate-700 text-white" />
                                        </div>
                                        {busquedaCliente && (
                                            <div className="bg-slate-800 border border-slate-700 rounded-xl overflow-hidden max-h-40 overflow-y-auto">
                                                {clientesFiltrados.slice(0, 6).map(c => (
                                                    <button key={c.id} onClick={() => { setFormArriendo(p => ({ ...p, clienteId: c.id })); setBusquedaCliente(c.nombre_completo); }}
                                                        className={`w-full text-left px-4 py-2.5 text-sm hover:bg-slate-700 transition-colors ${formArriendo.clienteId === c.id ? 'bg-cyan-500/20 text-cyan-300' : 'text-slate-300'}`}>
                                                        <span className="font-semibold">{c.nombre_completo}</span>
                                                        {c.rut_dni && <span className="ml-2 text-xs text-slate-500">{c.rut_dni}</span>}
                                                    </button>
                                                ))}
                                                {clientesFiltrados.length === 0 && <p className="px-4 py-3 text-xs text-slate-500">Sin resultados</p>}
                                            </div>
                                        )}
                                        {formArriendo.clienteId && !busquedaCliente.length && (
                                            <p className="text-xs text-emerald-400">✅ Cliente seleccionado</p>
                                        )}

                                        <div className="grid grid-cols-2 gap-3">
                                            <div className="space-y-1">
                                                <Label className="text-slate-400 text-xs">Fecha Salida *</Label>
                                                <Input type="date" value={formArriendo.fechaSalida} onChange={e => setFormArriendo(p => ({ ...p, fechaSalida: e.target.value }))}
                                                    className="bg-slate-900 border-slate-700 text-white" />
                                            </div>
                                            <div className="space-y-1">
                                                <Label className="text-slate-400 text-xs">Fecha Retorno *</Label>
                                                <Input type="date" value={formArriendo.fechaRetorno} onChange={e => setFormArriendo(p => ({ ...p, fechaRetorno: e.target.value }))}
                                                    className="bg-slate-900 border-slate-700 text-white" />
                                            </div>
                                        </div>
                                        <div className="space-y-1">
                                            <Label className="text-slate-400 text-xs">Precio por Día ($) *</Label>
                                            <Input value={formArriendo.precioDia} onChange={e => setFormArriendo(p => ({ ...p, precioDia: e.target.value }))}
                                                placeholder="40000" className="bg-slate-900 border-slate-700 text-white" />
                                        </div>

                                        {formArriendo.fechaSalida && formArriendo.fechaRetorno && formArriendo.precioDia && (
                                            <div className="bg-cyan-500/10 border border-cyan-500/30 rounded-xl p-3">
                                                <p className="text-xs text-slate-400">Resumen del Arriendo</p>
                                                <p className="text-white font-bold">
                                                    {calcDias(formArriendo.fechaSalida, formArriendo.fechaRetorno)} días × {cl(Number(formArriendo.precioDia.replace(/\./g, '')))} = {' '}
                                                    <span className="text-cyan-400">{cl(calcDias(formArriendo.fechaSalida, formArriendo.fechaRetorno) * Number(formArriendo.precioDia.replace(/\./g, '')))}</span>
                                                </p>
                                            </div>
                                        )}

                                        <Button onClick={handleIniciarArriendo} disabled={procesando}
                                            className="w-full h-12 bg-gradient-to-r from-blue-600 to-cyan-600 hover:from-blue-500 hover:to-cyan-500 text-white font-black rounded-xl">
                                            {procesando ? 'Procesando...' : '🤝 Confirmar Arriendo + Generar Contrato'}
                                        </Button>
                                    </div>
                                </div>
                            )}

                            {/* Formulario Venta */}
                            {modalComercial === 'venta' && (
                                <div className="space-y-4">
                                    <div className="flex items-center gap-2">
                                        <button onClick={() => setModalComercial(null)} className="p-1.5 rounded-lg bg-slate-800 text-slate-400 hover:text-white">
                                            <ArrowLeft className="w-4 h-4" />
                                        </button>
                                        <h3 className="font-bold text-white">Registrar Venta</h3>
                                    </div>

                                    <div className="space-y-3">
                                        <div className="space-y-1">
                                            <Label className="text-slate-400 text-xs">Buscar Cliente (Opcional)</Label>
                                            <Input value={busquedaCliente} onChange={e => setBusquedaCliente(e.target.value)}
                                                placeholder="Nombre o RUT..." className="bg-slate-900 border-slate-700 text-white" />
                                            {busquedaCliente && (
                                                <div className="bg-slate-800 border border-slate-700 rounded-xl overflow-hidden max-h-36 overflow-y-auto mt-1">
                                                    {clientesFiltrados.slice(0, 5).map(c => (
                                                        <button key={c.id} onClick={() => { setFormVenta(p => ({ ...p, clienteId: c.id })); setBusquedaCliente(c.nombre_completo); }}
                                                            className={`w-full text-left px-4 py-2 text-sm hover:bg-slate-700 transition-colors ${formVenta.clienteId === c.id ? 'bg-emerald-500/20 text-emerald-300' : 'text-slate-300'}`}>
                                                            {c.nombre_completo}
                                                        </button>
                                                    ))}
                                                </div>
                                            )}
                                        </div>
                                        <div className="space-y-1">
                                            <Label className="text-slate-400 text-xs">Precio de Venta ($) *</Label>
                                            <Input value={formVenta.precioVenta} onChange={e => setFormVenta(p => ({ ...p, precioVenta: e.target.value }))}
                                                className="bg-slate-900 border-slate-700 text-white text-lg font-bold" />
                                        </div>
                                        <div className="bg-slate-800 rounded-xl p-3 space-y-1">
                                            <div className="flex justify-between text-xs text-slate-400">
                                                <span>Costo real</span><span className="font-mono">{cl(costoReal)}</span>
                                            </div>
                                            <div className="flex justify-between text-sm font-bold">
                                                <span className="text-slate-200">Ganancia</span>
                                                <span className={`font-mono ${(Number(formVenta.precioVenta.replace(/\./g,'')) - costoReal) >= 0 ? 'text-emerald-400' : 'text-red-400'}`}>
                                                    {cl(Number(formVenta.precioVenta.replace(/\./g,'')) - costoReal)}
                                                </span>
                                            </div>
                                        </div>
                                        <Button onClick={handleRegistrarVenta} disabled={procesando}
                                            className="w-full h-12 bg-gradient-to-r from-emerald-600 to-green-600 hover:from-emerald-500 hover:to-green-500 text-white font-black rounded-xl">
                                            {procesando ? 'Procesando...' : '💰 Confirmar Venta + Generar Contrato'}
                                        </Button>
                                    </div>
                                </div>
                            )}

                            {/* Estado no accionable */}
                            {(v.estado === 'En Preparación' || v.estado === 'Vendido') && !modalComercial && (
                                <div className="text-center py-10 text-slate-500">
                                    {v.estado === 'Vendido' ? (
                                        <>
                                            <Tag className="w-10 h-10 mx-auto mb-2 opacity-40" />
                                            <p className="font-semibold">Vehículo vendido</p>
                                            <p className="text-sm mt-1">Esta unidad ya fue cerrada comercialmente</p>
                                        </>
                                    ) : (
                                        <>
                                            <Wrench className="w-10 h-10 mx-auto mb-2 opacity-40" />
                                            <p className="font-semibold">En Preparación</p>
                                            <p className="text-sm mt-1">Arregla el vehículo y cambia el estado a "Disponible" para habilitarlo comercialmente</p>
                                        </>
                                    )}
                                </div>
                            )}
                        </div>
                    )}
                </div>
            </div>
        </div>
    );
}

// ─── InventarioPicker interno para la pestaña Taller ───────────────────────────
function InventarioPicker({ vehiculoId, onConfirmar, saving }: { vehiculoId: string; onConfirmar: (items: CartItem[]) => Promise<void>; saving: boolean }) {
    const [cartItems, setCartItems] = useState<CartItem[]>([]);
    const [confirming, setConfirming] = useState(false);

    const handleConfirmar = async () => {
        if (!cartItems.length) { return; }
        setConfirming(true);
        await onConfirmar(cartItems);
        setCartItems([]);
        setConfirming(false);
    };

    return (
        <div className="space-y-3">
            <BuscadorInventario onChange={setCartItems} initialItems={[]} />
            {cartItems.length > 0 && (
                <Button onClick={handleConfirmar} disabled={saving || confirming}
                    className="w-full h-10 bg-gradient-to-r from-cyan-600 to-blue-600 hover:from-cyan-500 hover:to-blue-500 text-white font-bold rounded-xl">
                    <CheckSquare className="w-4 h-4 mr-2" />
                    {saving || confirming ? 'Asignando...' : `Asignar ${cartItems.length} repuesto(s) al vehículo`}
                </Button>
            )}
        </div>
    );
}


// ─── Modal Nueva Unidad ────────────────────────────────────────────────────────
function NuevaUnidadModal({ tallerIdProp, onClose, onCreated }: { tallerIdProp: string; onClose: () => void; onCreated: () => void }) {
    const [form, setForm] = useState({ 
        patente: '', marca: '', modelo: '', anio: '', color: '', vin: '', 
        precio_compra: '', precio_objetivo: '', notas: '',
        estado_ingreso: '', destino_unidad: 'Venta', precio_arriendo_dia: ''
    });
    const [saving, setSaving] = useState(false);
    const [estadoBusqueda, setEstadoBusqueda] = useState('');

    const handleBuscarPatente = async () => {
        const p = form.patente.toUpperCase().trim();
        if (!p) { toast.error("Ingresa una patente primero"); return; }
        setEstadoBusqueda('Buscando...');
        try {
            const vehiculoAPI = await consultarPatenteGetAPI(p);
            if (vehiculoAPI) {
                setForm(prev => ({
                    ...prev,
                    marca: vehiculoAPI.marca || prev.marca,
                    modelo: vehiculoAPI.modelo || prev.modelo,
                    anio: vehiculoAPI.anio ? String(vehiculoAPI.anio) : prev.anio,
                    vin: vehiculoAPI.vin || prev.vin,
                    color: vehiculoAPI.color || prev.color
                }));
                setEstadoBusqueda('✅ Datos encontrados');
                toast.success('Vehículo autocompletado');
            } else {
                setEstadoBusqueda('⚠️ No encontrado. Llena manual.');
            }
        } catch (e) {
            setEstadoBusqueda('❌ Error al buscar');
        }
    };

    const handleSave = async () => {
        if (!form.patente || !form.marca || !form.modelo) { toast.error('Patente, marca y modelo son obligatorios'); return; }
        setSaving(true);
        const { error } = await supabase.from('flota').insert({
            taller_id: tallerIdProp,
            patente: form.patente.toUpperCase(),
            marca: form.marca,
            modelo: form.modelo,
            anio: form.anio ? Number(form.anio) : null,
            color: form.color || null,
            vin: form.vin || null,
            precio_compra: Number(form.precio_compra.replace(/\./g, '')) || 0,
            precio_objetivo: Number(form.precio_objetivo.replace(/\./g, '')) || 0,
            notas: form.notas || null,
            estado_ingreso: form.estado_ingreso || null,
            destino_unidad: form.destino_unidad || 'Venta',
            precio_arriendo_dia: form.destino_unidad === 'Arriendo' ? (Number(form.precio_arriendo_dia.replace(/\./g, '')) || null) : null
        });
        if (error) toast.error('Error al crear unidad: ' + error.message);
        else { toast.success('Unidad añadida a la flota ✅'); onCreated(); onClose(); }
        setSaving(false);
    };

    const field = (key: keyof typeof form, label: string, placeholder = '') => (
        <div className="space-y-1">
            <Label className="text-slate-400 text-xs">{label}</Label>
            <Input value={form[key]} onChange={e => setForm(p => ({ ...p, [key]: e.target.value }))}
                placeholder={placeholder} className="bg-slate-900 border-slate-700 text-white" />
        </div>
    );

    return (
        <div className="fixed inset-0 z-50 flex items-end sm:items-center justify-center p-0 sm:p-4 bg-black/70 backdrop-blur-sm" onClick={e => e.target === e.currentTarget && onClose()}>
            <div className="bg-slate-900 border border-slate-700 rounded-t-3xl sm:rounded-3xl w-full sm:max-w-lg shadow-2xl">
                <div className="border-b border-slate-800 p-5 flex items-center justify-between">
                    <h2 className="text-lg font-black text-white">Nueva Unidad de Flota</h2>
                    <button onClick={onClose} className="p-2 rounded-xl bg-slate-800 text-slate-400 hover:text-white"><X className="w-5 h-5" /></button>
                </div>
                <div className="p-5 space-y-4 max-h-[75vh] overflow-y-auto scrollbar-thin scrollbar-thumb-slate-700">
                    <div className="space-y-1">
                        <Label className="text-slate-400 text-xs">Patente *</Label>
                        <div className="flex gap-2">
                            <Input value={form.patente} onChange={e => setForm(p => ({ ...p, patente: e.target.value }))}
                                placeholder="AA-BB-11" className="bg-slate-900 border-slate-700 text-white uppercase" />
                            <Button onClick={handleBuscarPatente} type="button" variant="outline" className="shrink-0 bg-slate-800 border-slate-700 hover:bg-slate-700">
                                <Search className="w-4 h-4 mr-2" /> Buscar Auto
                            </Button>
                        </div>
                        {estadoBusqueda && <p className="text-xs text-cyan-400 mt-1">{estadoBusqueda}</p>}
                    </div>
                
                    <div className="grid grid-cols-2 gap-3">
                        {field('marca', 'Marca *', 'Toyota')}
                        {field('modelo', 'Modelo *', 'Corolla')}
                        {field('anio', 'Año', '2020')}
                        {field('color', 'Color', 'Blanco')}
                        {field('vin', 'VIN / Chasis', '')}
                        {field('precio_compra', 'Precio Compra ($)', '5000000')}
                    </div>

                    <div className="space-y-2 mt-4 pt-4 border-t border-slate-800">
                        <Label className="text-slate-400 text-xs 1font-bold tracking-widest uppercase">Diagnóstico y Destino</Label>
                        
                        <div className="space-y-1 mb-2">
                            <Label className="text-slate-400 text-xs">Estado de Ingreso / Daños Identificados</Label>
                            <Input value={form.estado_ingreso} onChange={e => setForm(p => ({ ...p, estado_ingreso: e.target.value }))}
                                placeholder="Ej: Choque frontal leve, requiere pintura" className="bg-slate-900 border-slate-700 text-white" />
                        </div>
                        
                        <div className="grid grid-cols-2 gap-3 mb-2">
                            <div className="space-y-1">
                                <Label className="text-slate-400 text-xs">Destino de la Unidad</Label>
                                <select value={form.destino_unidad} onChange={e => setForm(p => ({ ...p, destino_unidad: e.target.value }))}
                                    className="w-full h-10 bg-slate-900 border border-slate-700 text-white rounded-md px-3 text-sm focus:outline-none focus:ring-1 focus:ring-cyan-500">
                                    <option value="Venta">Venta</option>
                                    <option value="Arriendo">Arriendo</option>
                                    <option value="Desarmaduría">Desarmaduría</option>
                                </select>
                            </div>

                            {form.destino_unidad === 'Arriendo' ? (
                                field('precio_arriendo_dia', 'Precio Arriendo por Día ($)', '40000')
                            ) : form.destino_unidad === 'Venta' ? (
                                field('precio_objetivo', 'Precio Objetivo ($)', '7000000')
                            ) : (
                                <div className="space-y-1">
                                    <Label className="text-slate-500 text-xs">Precio Objetivo ($)</Label>
                                    <Input disabled placeholder="N/A para Desarmaduría" className="bg-slate-900 border-slate-800 text-slate-500 opacity-50" />
                                </div>
                            )}
                        </div>

                        <div className="space-y-1">
                            <Label className="text-slate-400 text-xs">Notas internas (Opcional)</Label>
                            <textarea value={form.notas} onChange={e => setForm(p => ({ ...p, notas: e.target.value }))}
                                placeholder="Observaciones del vehículo..." rows={2}
                                className="w-full bg-slate-900 border border-slate-700 text-white text-sm rounded-md px-3 py-2 resize-none focus:outline-none focus:ring-1 focus:ring-cyan-500" />
                        </div>
                    </div>
                    <Button onClick={handleSave} disabled={saving} className="w-full h-12 bg-gradient-to-r from-cyan-600 to-blue-600 hover:from-cyan-500 hover:to-blue-500 text-white font-black rounded-xl text-base">
                        {saving ? 'Creando...' : '🚗 Añadir a la Flota'}
                    </Button>
                </div>
            </div>
        </div>
    );
}

// ─── Main Page ─────────────────────────────────────────────────────────────────
function FlotaContent() {
    const { user } = useAuth();
    const [vehiculos, setVehiculos] = useState<VehiculoFlota[]>([]);
    const [loading, setLoading] = useState(true);
    const [selected, setSelected] = useState<VehiculoFlota | null>(null);
    const [showNew, setShowNew] = useState(false);
    const [filtroEstado, setFiltroEstado] = useState<string>('todos');

    const loadFlota = useCallback(async () => {
        if (!user?.tallerId) return;
        setLoading(true);
        const { data, error } = await supabase
            .from('flota')
            .select('*, inversiones:flota_inversiones(*)')
            .eq('taller_id', user.tallerId)
            .order('created_at', { ascending: false });

        if (!error && data) {
            // Cargar clientes mapeados
            const { data: dbClientes } = await supabase.from('clientes').select('id, nombre_completo').eq('taller_id', user.tallerId);
            const clientsDict: Record<string, string> = {};
            if (dbClientes) dbClientes.forEach(c => clientsDict[c.id.toString()] = c.nombre_completo);

            // Obtener repuestos de órdenes de estos vehículos
            const patentes = data.map(v => v.patente);
            
            // Buscar ordenes de estas patentes
            const { data: ordenesData } = await supabase
                .from('ordenes')
                .select('id, patente_vehiculo')
                .in('patente_vehiculo', patentes)
                .eq('taller_id', user.tallerId);
                
            let ordenesMontoRepuestos: Record<string, number> = {};
            
            if (ordenesData && ordenesData.length > 0) {
                const ordenesIds = ordenesData.map(o => o.id);
                const { data: repuestosData } = await supabase
                    .from('orden_repuestos')
                    .select('orden_id, monto_total')
                    .in('orden_id', ordenesIds);
                    
                if (repuestosData) {
                    repuestosData.forEach(rep => {
                        const orden = ordenesData.find(o => o.id === rep.orden_id);
                        if (orden && orden.patente_vehiculo) {
                            if (!ordenesMontoRepuestos[orden.patente_vehiculo]) {
                                ordenesMontoRepuestos[orden.patente_vehiculo] = 0;
                            }
                            ordenesMontoRepuestos[orden.patente_vehiculo] += (rep.monto_total || 0);
                        }
                    });
                }
            }
            
            const vehiculosEnriquecidos = (data as VehiculoFlota[]).map(v => {
                return {
                    ...v,
                    costo_repuestos_ordenes: ordenesMontoRepuestos[v.patente] || 0,
                    cliente_nombre: v.cliente_id ? clientsDict[v.cliente_id.toString()] : undefined
                };
            });
            setVehiculos(vehiculosEnriquecidos);
        } else {
            setVehiculos([]);
        }
        setLoading(false);
    }, [user?.tallerId]);

    useEffect(() => { loadFlota(); }, [loadFlota]);

    const vehiculosFiltrados = filtroEstado === 'todos'
        ? vehiculos
        : vehiculos.filter(v => v.estado === filtroEstado);

    const stats = {
        total: vehiculos.length,
        disponibles: vehiculos.filter(v => v.estado === 'Disponible').length,
        enPrep: vehiculos.filter(v => v.estado === 'En Preparación').length,
        totalInvertido: vehiculos.reduce((s, v) => s + v.precio_compra + (v.costo_repuestos_ordenes || 0) + (v.inversiones || []).reduce((si, i) => si + i.monto, 0), 0),
    };

    return (
        <div className="space-y-6">
            {/* Header */}
            <div className="flex items-start justify-between">
                <div>
                    <h1 className="text-2xl md:text-3xl font-black text-slate-800 flex items-center gap-3">
                        <div className="p-2.5 bg-cyan-500/20 rounded-xl border border-cyan-500/30">
                            <Car className="w-6 h-6 text-cyan-600" />
                        </div>
                        Gestión de Flota
                    </h1>
                    <p className="text-slate-800 mt-1 text-sm font-semibold">Ciclo de vida de cada unidad: adquisición → inversión → disponible</p>
                </div>
                <Button onClick={() => setShowNew(true)}
                    className="bg-gradient-to-r from-cyan-600 to-blue-600 hover:from-cyan-500 hover:to-blue-500 text-white font-bold rounded-xl shadow-lg shadow-cyan-500/20 h-10 px-4">
                    <Plus className="w-4 h-4 mr-1.5" /> Nueva Unidad
                </Button>
            </div>

            {/* Stats */}
            <div className="grid grid-cols-2 md:grid-cols-4 gap-3">
                <StatCard label="Total Unidades" value={stats.total} icon={Car} color="bg-cyan-500/20 text-cyan-400" />
                <StatCard label="Disponibles" value={stats.disponibles} icon={CheckCircle2} color="bg-emerald-500/20 text-emerald-400" />
                <StatCard label="En Preparación" value={stats.enPrep} icon={Clock} color="bg-amber-500/20 text-amber-400" />
                <StatCard label="Capital Invertido" value={stats.totalInvertido.toLocaleString('es-CL', { style: 'currency', currency: 'CLP', maximumFractionDigits: 0 })} icon={DollarSign} color="bg-purple-500/20 text-purple-400" />
            </div>

            {/* Filtros */}
            <div className="flex gap-2 flex-wrap">
                {['todos', 'En Preparación', 'Disponible', 'Arrendado', 'Vendido'].map(f => (
                    <button key={f} onClick={() => setFiltroEstado(f)}
                        className={`px-4 py-1.5 rounded-full text-sm font-semibold border transition-all ${filtroEstado === f
                            ? 'bg-cyan-500/20 border-cyan-500/50 text-cyan-300'
                            : 'border-slate-700 text-slate-400 hover:border-slate-500 hover:text-slate-300'}`}>
                        {f.charAt(0).toUpperCase() + f.slice(1)}
                    </button>
                ))}
            </div>

            {/* Grid */}
            {loading ? (
                <div className="grid grid-cols-1 sm:grid-cols-2 lg:grid-cols-3 gap-4">
                    {[1, 2, 3].map(i => (
                        <div key={i} className="h-72 bg-slate-800/40 rounded-2xl animate-pulse border border-slate-700/30" />
                    ))}
                </div>
            ) : vehiculosFiltrados.length === 0 ? (
                <div className="flex flex-col items-center justify-center py-20 text-slate-600">
                    <Car className="w-14 h-14 mb-3 opacity-30" />
                    <p className="text-lg font-semibold">
                        {filtroEstado === 'todos' ? 'No hay unidades en la flota' : `Sin unidades con estado "${filtroEstado}"`}
                    </p>
                    {filtroEstado === 'todos' && (
                        <Button onClick={() => setShowNew(true)} className="mt-4 bg-cyan-600 hover:bg-cyan-500 text-white rounded-xl">
                            <Plus className="w-4 h-4 mr-1.5" /> Añadir primera unidad
                        </Button>
                    )}
                </div>
            ) : (
                <div className="grid grid-cols-1 sm:grid-cols-2 lg:grid-cols-3 gap-4">
                    {vehiculosFiltrados.map(v => (
                        <VehiculoCard key={v.id} v={v} onSelect={async () => {
                            await loadFlota();
                            setSelected(v);
                        }} />
                    ))}
                </div>
            )}

            {/* Modales */}
            {showNew && user?.tallerId && (
                <NuevaUnidadModal
                    tallerIdProp={user.tallerId}
                    onClose={() => setShowNew(false)}
                    onCreated={loadFlota}
                />
            )}
            {selected && (
                <DetalleModal
                    v={selected}
                    onClose={() => setSelected(null)}
                    onUpdate={loadFlota}
                />
            )}
        </div>
    );
}

export default function FlotaPage() {
    return (
        <ModuleGuard moduleName="flota" toastMessage="El módulo Gestión de Flota no está activo para este taller.">
            <FlotaContent />
        </ModuleGuard>
    );
}
