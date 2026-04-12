'use client';

import { useEffect, useState, useRef } from 'react';
import { supabase } from '@/lib/supabase';
import { useAuth } from '@/contexts/auth-context';
import {
    Shield, Clock, FileText, CheckCircle2, Search,
    MessageCircle, Eye, Loader2, X, Printer, PenTool, Settings, Eraser,
    Car, DollarSign, Filter, ChevronDown
} from 'lucide-react';
import { ContratoDocumento } from '@/components/contratos/contrato-documento';
import type { ContratoData } from '@/components/contratos/contrato-documento';
import { FirmaCanvas } from '@/components/contratos/firma-canvas';
import { MisDatosLegalesModal } from '@/components/contratos/mis-datos-legales-modal';
import { toast } from 'sonner';

interface Contrato {
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
    notas: string | null;
    firma_base64: string | null;
    vendedor_firma_base64: string | null;
    firmado_en: string | null;
    ip_cliente: string | null;
    orden_id: string | null;
    vehiculo_flota_id: string | null;
    creado_en: string;
    vendedor_nombre?: string | null;
    vendedor_rut?: string | null;
    actualizado_en?: string | null;
}

function formatCLP(n: number | null) {
    if (!n) return '$0';
    return n.toLocaleString('es-CL', { style: 'currency', currency: 'CLP', maximumFractionDigits: 0 });
}

// ── Modal PDF (viewer de contrato firmado) ────────────────────────────────────
function VerPdfModal({ contrato, onClose }: { contrato: Contrato; onClose: () => void }) {
    const printRef = useRef<HTMLDivElement>(null);
    const fechaHoy = new Date().toLocaleDateString('es-CL', { day: '2-digit', month: 'long', year: 'numeric' });

    const data: ContratoData = contrato.tipo === 'venta'
        ? {
            tipo: 'venta',
            numero: contrato.id.slice(-8).toUpperCase(),
            fecha: contrato.firmado_en
                ? new Date(contrato.firmado_en).toLocaleDateString('es-CL', { day: '2-digit', month: 'long', year: 'numeric' })
                : fechaHoy,
            vendedor_nombre: contrato.vendedor_nombre || 'Rentmontt SpA.',
            vendedor_rut: contrato.vendedor_rut || '77.294.859-K',
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
            firma_base64: contrato.firma_base64,
            vendedor_firma_base64: contrato.vendedor_firma_base64,
        }
        : {
            tipo: 'arriendo',
            numero: contrato.id.slice(-8).toUpperCase(),
            fecha: contrato.firmado_en
                ? new Date(contrato.firmado_en).toLocaleDateString('es-CL', { day: '2-digit', month: 'long', year: 'numeric' })
                : fechaHoy,
            vendedor_nombre: contrato.vendedor_nombre || 'Rentmontt SpA.',
            vendedor_rut: contrato.vendedor_rut || '77.294.859-K',
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
            fecha_salida: contrato.fecha_salida
                ? new Date(contrato.fecha_salida).toLocaleDateString('es-CL')
                : '',
            fecha_retorno: contrato.fecha_retorno
                ? new Date(contrato.fecha_retorno).toLocaleDateString('es-CL')
                : '',
            precio_total: contrato.precio_total || 0,
            precio_dia: contrato.precio_dia || 0,
            dias: contrato.dias || 0,
            firma_base64: contrato.firma_base64,
            vendedor_firma_base64: contrato.vendedor_firma_base64,
        };

    const handlePrint = () => {
        const win = window.open('', '_blank');
        if (!win || !printRef.current) return;
        win.document.write(`
            <html><head>
            <title>Contrato ${contrato.vehiculo_patente}</title>
            <style>
                body { margin: 0; font-family: Arial, sans-serif; }
                @page { size: A4; margin: 0; }
                @media print { body { margin: 0; } }
            </style>
            </head><body>
            ${printRef.current.outerHTML}
            </body></html>
        `);
        win.document.close();
        win.focus();
        setTimeout(() => { win.print(); win.close(); }, 500);
    };

    return (
        <div className="fixed inset-0 z-[60] flex items-center justify-center p-3 bg-black/80 backdrop-blur-sm"
            onClick={e => e.target === e.currentTarget && onClose()}>
            <div className="bg-white rounded-2xl w-full max-w-3xl max-h-[95vh] flex flex-col shadow-2xl overflow-hidden">
                <div className="flex items-center justify-between p-4 border-b bg-white border-slate-200 rounded-t-2xl">
                    <h3 className="font-bold text-slate-900 flex items-center gap-2">
                        <FileText className="w-5 h-5 text-blue-500" />
                        Vista Previa de Documento
                    </h3>
                    <div className="flex items-center gap-2">
                        <button onClick={handlePrint}
                            className="flex items-center gap-2 bg-blue-600 hover:bg-blue-700 text-white text-sm font-bold px-4 py-2 rounded-xl transition-colors">
                            <Printer className="w-4 h-4" /> Imprimir / PDF
                        </button>
                        <button onClick={onClose} className="p-2 text-slate-400 hover:text-slate-600 hover:bg-slate-100 rounded-xl">
                            <X className="w-4 h-4" />
                        </button>
                    </div>
                </div>
                <div className="overflow-y-auto flex-1 p-4 bg-slate-50 flex justify-center">
                    <div style={{ transform: 'scale(0.85)', transformOrigin: 'top center', marginBottom: '-10%' }}>
                        <ContratoDocumento ref={printRef} data={data} />
                    </div>
                </div>
            </div>
        </div>
    );
}

// ── Fila de contrato (tarjeta card existente para vista móvil) ─────────────────
function ContratoRow({ contrato, onVerPdf, onDelete, onEdit }: { contrato: Contrato; onVerPdf: () => void; onDelete: (id: string) => void; onEdit: (contrato: Contrato) => void }) {
    const esVenta = contrato.tipo === 'venta';
    const esFirmado = contrato.estado === 'firmado';

    const trackingUrl = contrato.orden_id
        ? `${typeof window !== 'undefined' ? window.location.origin : ''}/tracking/${contrato.orden_id}`
        : null;

    const mensajeWspStr = trackingUrl ? `Hola ${contrato.cliente_nombre || ''}! 👋 Te enviamos el link para revisar y firmar tu contrato de ${esVenta ? 'compraventa' : 'arriendo'} del vehículo ${contrato.vehiculo_patente}.\n\n👉 ${trackingUrl}\n\nAl abrir el link, podrás ver el contrato y firmarlo digitalmente desde tu celular. Cualquier duda, escríbenos.\n\n_Rentmontt SpA._` : '';

    const whatsappMsg = contrato.cliente_telefono && trackingUrl
        ? `https://api.whatsapp.com/send?phone=${contrato.cliente_telefono.replace(/[^0-9]/g, '')}&text=${encodeURIComponent(mensajeWspStr)}`
        : null;

    const copiarLink = () => {
        if (!trackingUrl) return;
        navigator.clipboard.writeText(trackingUrl);
        toast.info('Link de firma copiado al portapapeles');
    };

    return (
        <div className={`bg-white border rounded-2xl p-4 transition-all relative group shadow-sm hover:shadow-md ${esFirmado ? 'border-emerald-500/30' : 'border-slate-200'}`}>
            <div className="absolute top-4 right-4 flex gap-1 opacity-0 group-hover:opacity-100 transition-all">
                {!esFirmado && (
                    <button onClick={() => onEdit(contrato)} title="Editar contrato"
                        className="p-1.5 rounded-lg hover:bg-blue-50 hover:text-blue-600 text-slate-400 transition-all">
                        <PenTool className="w-4 h-4" />
                    </button>
                )}
                <button onClick={() => onDelete(contrato.id)} title="Eliminar contrato"
                    className="p-1.5 rounded-lg hover:bg-red-50 hover:text-red-600 text-slate-400 transition-all">
                    <X className="w-4 h-4" />
                </button>
            </div>

            <div className="flex items-start justify-between gap-3 pr-8">
                <div className="flex items-center gap-3 min-w-0">
                    <div className={`p-2 rounded-xl border shrink-0 ${esFirmado ? 'bg-emerald-50 border-emerald-100' : 'bg-amber-50 border-amber-100'}`}>
                        {esFirmado ? <CheckCircle2 className="w-4 h-4 text-emerald-600" /> : <Clock className="w-4 h-4 text-amber-600" />}
                    </div>
                    <div className="min-w-0">
                        <p className="font-bold text-slate-900 truncate">{contrato.cliente_nombre || 'Cliente'}</p>
                        <div className="flex items-center gap-2 mt-0.5">
                            <span className="font-mono text-xs font-bold text-slate-500 bg-slate-100 px-1.5 py-0.5 rounded italic">{contrato.vehiculo_patente}</span>
                            <p className="text-sm text-slate-600 truncate underline decoration-slate-300">
                                {contrato.vehiculo_marca} {contrato.vehiculo_modelo}
                            </p>
                            <span className={`px-1.5 py-0.5 rounded text-[10px] font-bold uppercase ${esVenta ? 'bg-blue-100 text-blue-700' : 'bg-purple-100 text-purple-700'}`}>
                                {contrato.tipo}
                            </span>
                        </div>
                    </div>
                </div>
                <div className="shrink-0 text-right">
                    <p className="font-black text-slate-900 text-sm tracking-tight">{formatCLP(contrato.precio_total)}</p>
                    <p className="text-[10px] text-slate-500 mt-0.5 font-medium">
                        {esFirmado && contrato.firmado_en
                            ? `Firmado ${new Date(contrato.firmado_en).toLocaleDateString('es-CL')}`
                            : `Creado ${new Date(contrato.creado_en).toLocaleDateString('es-CL')}`
                        }
                    </p>
                </div>
            </div>

            {/* Acciones */}
            <div className="flex flex-wrap gap-2 mt-3 pt-3 border-t border-slate-100">
                {!esFirmado && trackingUrl && (
                    <>
                        <a href={whatsappMsg || `https://api.whatsapp.com/send?text=${encodeURIComponent(mensajeWspStr)}`} target="_blank" rel="noopener noreferrer"
                            className="flex-1 flex items-center justify-center gap-2 bg-emerald-50 hover:bg-emerald-100 border border-emerald-200 rounded-xl py-2 px-3 text-emerald-700 font-bold text-xs transition-colors shadow-sm active:translate-y-0.5">
                            <MessageCircle className="w-3.5 h-3.5" />
                            {whatsappMsg ? 'WhatsApp' : 'Vía WhatsApp'}
                        </a>
                        <button onClick={copiarLink}
                            className="flex items-center justify-center gap-2 bg-blue-50 hover:bg-blue-100 border border-blue-200 rounded-xl py-2 px-3 text-blue-700 font-bold text-xs transition-colors shadow-sm active:translate-y-0.5">
                            Copiar Link
                        </button>
                    </>
                )}
                {!esFirmado && !trackingUrl && (
                    <p className="flex-1 text-xs px-3 py-2 bg-red-50 text-red-600 rounded-xl border border-red-100 text-center italic">
                        Contrato inválido (sin link) — Elimina y vuelve a crear
                    </p>
                )}
                <button onClick={onVerPdf}
                    className="flex-1 flex items-center justify-center gap-2 bg-slate-50 hover:bg-slate-100 border border-slate-200 rounded-xl py-2 px-4 text-slate-700 font-bold text-xs transition-colors shadow-sm active:translate-y-0.5">
                    <Eye className="w-3.5 h-3.5" />
                    {esFirmado ? 'Ver / Imprimir PDF' : 'Vista previa'}
                </button>
            </div>

        </div>
    );
}

// ── Fila de tabla detallada ────────────────────────────────────────────────────
function ContratoTableRow({ contrato, onVerPdf, onDelete, onEdit }: { contrato: Contrato; onVerPdf: () => void; onDelete: (id: string) => void; onEdit: (contrato: Contrato) => void }) {
    const esVenta = contrato.tipo === 'venta';
    const esFirmado = contrato.estado === 'firmado';

    return (
        <tr className="border-b border-slate-100 hover:bg-slate-50 transition-colors group">
            {/* Cliente */}
            <td className="px-4 py-3">
                <p className="font-semibold text-slate-900 text-sm">{contrato.cliente_nombre || '—'}</p>
                <p className="text-xs text-slate-400">{contrato.cliente_rut || ''}</p>
            </td>

            {/* Vehículo */}
            <td className="px-4 py-3">
                <span className="font-mono text-xs font-black text-slate-700 bg-slate-100 px-2 py-0.5 rounded">
                    {contrato.vehiculo_patente || '—'}
                </span>
                <p className="text-xs text-slate-500 mt-0.5">{contrato.vehiculo_marca} {contrato.vehiculo_modelo}</p>
            </td>

            {/* Tipo */}
            <td className="px-4 py-3">
                <span className={`px-2.5 py-1 rounded-lg text-xs font-black uppercase tracking-wide ${
                    esVenta ? 'bg-blue-100 text-blue-700' : 'bg-violet-100 text-violet-700'
                }`}>
                    {esVenta ? '🤝 Venta' : '🏠 Arriendo'}
                </span>
            </td>

            {/* Monto */}
            <td className="px-4 py-3 text-right">
                <p className="font-black text-slate-900 text-sm">{formatCLP(contrato.precio_total)}</p>
            </td>

            {/* Estado */}
            <td className="px-4 py-3">
                <span className={`flex items-center gap-1.5 px-2.5 py-1 rounded-lg text-xs font-bold w-fit ${
                    esFirmado ? 'bg-emerald-100 text-emerald-700' : 'bg-amber-100 text-amber-700'
                }`}>
                    {esFirmado ? <CheckCircle2 className="w-3 h-3" /> : <Clock className="w-3 h-3" />}
                    {esFirmado ? 'Firmado' : 'Pendiente'}
                </span>
                <p className="text-[10px] text-slate-400 mt-0.5 ml-0.5">
                    {esFirmado && contrato.firmado_en
                        ? new Date(contrato.firmado_en).toLocaleDateString('es-CL')
                        : new Date(contrato.creado_en).toLocaleDateString('es-CL')}
                </p>
            </td>

            {/* Acciones */}
            <td className="px-4 py-3">
                <button
                    onClick={onVerPdf}
                    className="flex items-center gap-1.5 bg-slate-100 hover:bg-blue-100 hover:text-blue-700 text-slate-600 text-xs font-bold px-3 py-1.5 rounded-lg transition-colors"
                >
                    <Eye className="w-3.5 h-3.5" />
                    Ver PDF
                </button>
            </td>
        </tr>
    );
}

// ── Página principal ──────────────────────────────────────────────────────────
function ContratosContent() {
    const { user } = useAuth();
    const [contratos, setContratos] = useState<Contrato[]>([]);
    const [loading, setLoading] = useState(true);
    const [search, setSearch] = useState('');
    const [tab, setTab] = useState<'pendiente_firma' | 'firmado'>('pendiente_firma');
    const [tipoFiltro, setTipoFiltro] = useState<'todos' | 'venta' | 'arriendo'>('todos');
    const [verPdf, setVerPdf] = useState<Contrato | null>(null);
    const [contratoToEdit, setContratoToEdit] = useState<Contrato | null>(null);
    const [vista, setVista] = useState<'tarjetas' | 'tabla'>('tarjetas');
    
    // Firma admin estado
    const [openFirmaPanel, setOpenFirmaPanel] = useState(false);
    const [openLegalData, setOpenLegalData] = useState(false);
    const [firmaActual, setFirmaActual] = useState<string | null>(null);
    const [guardandoFirma, setGuardandoFirma] = useState(false);

    const loadContratos = async () => {
        if (!user?.tallerId) return;
        setLoading(true);
        const { data } = await supabase
            .from('contratos')
            .select('*')
            .eq('taller_id', user.tallerId)
            .order('creado_en', { ascending: false });
        setContratos((data as Contrato[]) || []);
        setLoading(false);
    };

    useEffect(() => {
        loadContratos();
    }, [user?.tallerId]);

    const handleDelete = async (id: string) => {
        if (!confirm('¿Estás seguro de que deseas eliminar este contrato? Esta acción no se puede deshacer.')) return;
        
        try {
            const { error } = await supabase.from('contratos').delete().eq('id', id);
            if (error) throw error;
            setContratos(prev => prev.filter(c => c.id !== id));
            toast.success('Contrato eliminado');
        } catch (e: any) {
            toast.error('Error al eliminar: ' + e.message);
        }
    };

    const handleSaveMiFirma = async (base64: string | null) => {
        if (!user || !base64) return;
        setGuardandoFirma(true);
        try {
            // 1. Guardar en perfil
            const { error } = await supabase.from('perfiles').update({ firma_base64: base64 }).eq('id', user.id);
            if (error) throw error;

            // 2. Propagar a todos los contratos pendientes del mismo taller
            if (user.tallerId) {
                await supabase
                    .from('contratos')
                    .update({ vendedor_firma_base64: base64, actualizado_en: new Date().toISOString() })
                    .eq('taller_id', user.tallerId)
                    .eq('estado', 'pendiente_firma');
            }

            toast.success('¡Firma guardada! Los contratos pendientes han sido actualizados.');
            setOpenFirmaPanel(false);
            await loadContratos(); // Refrescar lista
        } catch (e: any) {
            toast.error('Error al guardar firma: ' + e.message);
        } finally {
            setGuardandoFirma(false);
        }
    };

    const filtrados = contratos.filter(c => {
        if (c.estado !== tab) return false;
        if (tipoFiltro !== 'todos' && c.tipo !== tipoFiltro) return false;
        const q = search.toLowerCase();
        if (!q) return true;
        return (
            c.cliente_nombre?.toLowerCase().includes(q) ||
            c.vehiculo_patente?.toLowerCase().includes(q) ||
            c.cliente_rut?.toLowerCase().includes(q)
        );
    });

    const pendienteCount = contratos.filter(c => c.estado === 'pendiente_firma').length;
    const firmadoCount = contratos.filter(c => c.estado === 'firmado').length;
    const ventasCount = contratos.filter(c => c.estado === 'firmado' && c.tipo === 'venta').length;
    const arriendosCount = contratos.filter(c => c.estado === 'firmado' && c.tipo === 'arriendo').length;

    return (
        <div className="space-y-6 relative">
            {/* Header */}
            <div className="flex flex-col md:flex-row md:items-start justify-between gap-4">
                <div>
                    <h1 className="text-2xl md:text-3xl font-black text-slate-900 flex items-center gap-3">
                        <div className="p-2.5 bg-blue-50 rounded-xl border border-blue-100 shadow-sm">
                            <Shield className="w-6 h-6 text-blue-600" />
                        </div>
                        Contratos Digitales
                    </h1>
                    <p className="text-slate-500 mt-1.5 text-sm font-medium">Gestión de contratos de venta y arriendo — firma remota por cliente</p>
                    <div className="flex flex-wrap items-center gap-3 mt-4">
                        <button
                            onClick={() => setOpenLegalData(true)}
                            className="flex items-center gap-2 bg-white hover:bg-slate-50 text-slate-700 text-sm font-bold px-4 py-2.5 rounded-xl border border-slate-200 transition-all active:scale-95 shadow-sm"
                        >
                            <Settings className="w-4 h-4 text-slate-500" />
                            ⚙️ Mis Datos Legales
                        </button>
                        <button
                            onClick={() => setOpenFirmaPanel(true)}
                            className="flex items-center gap-2 bg-white hover:bg-slate-50 text-slate-700 text-sm font-bold px-4 py-2.5 rounded-xl border border-slate-200 transition-all active:scale-95 shadow-sm"
                        >
                            <PenTool className="w-4 h-4 text-blue-500" />
                            Mi Firma (RentMontt)
                        </button>
                    </div>
                </div>

                {/* Resumen rápido firmados */}
                <div className="flex flex-wrap gap-2 shrink-0">
                    <div className="bg-emerald-50 border border-emerald-100 rounded-2xl px-4 py-3 text-center min-w-[90px]">
                        <p className="text-2xl font-black text-emerald-600">{ventasCount}</p>
                        <p className="text-xs text-emerald-600 font-semibold">Ventas</p>
                    </div>
                    <div className="bg-violet-50 border border-violet-100 rounded-2xl px-4 py-3 text-center min-w-[90px]">
                        <p className="text-2xl font-black text-violet-600">{arriendosCount}</p>
                        <p className="text-xs text-violet-600 font-semibold">Arriendos</p>
                    </div>
                </div>
            </div>

            {/* Tabs */}
            <div className="flex gap-2 p-1 bg-slate-100 rounded-2xl w-fit border border-slate-200">
                <button onClick={() => setTab('pendiente_firma')}
                    className={`flex items-center gap-2 px-4 py-2.5 rounded-xl font-bold text-sm transition-all ${tab === 'pendiente_firma'
                        ? 'bg-white shadow-sm text-amber-600'
                        : 'text-slate-500 hover:text-slate-700 hover:bg-white/50'
                    }`}>
                    <Clock className="w-4 h-4" />
                    Pendiente de Firma
                    {pendienteCount > 0 && (
                        <span className="bg-amber-500 text-white text-[10px] font-black px-1.5 py-0.5 rounded-full">{pendienteCount}</span>
                    )}
                </button>
                <button onClick={() => setTab('firmado')}
                    className={`flex items-center gap-2 px-4 py-2.5 rounded-xl font-bold text-sm transition-all ${tab === 'firmado'
                        ? 'bg-white shadow-sm text-emerald-600'
                        : 'text-slate-500 hover:text-slate-700 hover:bg-white/50'
                    }`}>
                    <CheckCircle2 className="w-4 h-4" />
                    Firmados
                    {firmadoCount > 0 && (
                        <span className="bg-emerald-500 text-white text-[10px] font-black px-1.5 py-0.5 rounded-full">{firmadoCount}</span>
                    )}
                </button>
            </div>

            {/* Buscador + Filtros */}
            <div className="flex flex-col sm:flex-row gap-3">
                {/* Buscador */}
                <div className="relative group flex-1">
                    <Search className="absolute left-4 top-1/2 -translate-y-1/2 w-4 h-4 text-slate-400 group-focus-within:text-blue-500 transition-colors" />
                    <input value={search} onChange={e => setSearch(e.target.value)}
                        placeholder="Buscar por cliente, patente o RUT..."
                        className="w-full h-12 pl-11 pr-4 bg-white border border-slate-200 text-slate-900 rounded-2xl text-sm shadow-sm focus:outline-none focus:ring-2 focus:ring-blue-500/20 focus:border-blue-500 transition-all placeholder:text-slate-400 font-medium" />
                </div>

                {/* Filtro por tipo */}
                <div className="relative">
                    <Filter className="absolute left-4 top-1/2 -translate-y-1/2 w-4 h-4 text-slate-400 pointer-events-none" />
                    <select
                        value={tipoFiltro}
                        onChange={e => setTipoFiltro(e.target.value as typeof tipoFiltro)}
                        className="h-12 pl-10 pr-8 bg-white border border-slate-200 text-slate-900 rounded-2xl text-sm shadow-sm focus:outline-none focus:ring-2 focus:ring-blue-500/20 focus:border-blue-500 cursor-pointer font-medium appearance-none"
                        style={{ backgroundColor: '#ffffff', color: '#1e293b' }}
                    >
                        <option value="todos" style={{ color: '#1e293b' }}>Todos los tipos</option>
                        <option value="venta" style={{ color: '#1e293b' }}>🤝 Solo Ventas</option>
                        <option value="arriendo" style={{ color: '#1e293b' }}>🏠 Solo Arriendos</option>
                    </select>
                    <ChevronDown className="absolute right-3 top-1/2 -translate-y-1/2 w-4 h-4 text-slate-400 pointer-events-none" />
                </div>

                {/* Toggle vista (solo en firmados cuando hay datos) */}
                {tab === 'firmado' && firmadoCount > 0 && (
                    <div className="flex bg-slate-100 border border-slate-200 rounded-xl p-1 gap-1">
                        <button
                            onClick={() => setVista('tarjetas')}
                            className={`px-3 py-1.5 rounded-lg text-xs font-bold transition-colors ${vista === 'tarjetas' ? 'bg-white shadow-sm text-slate-800' : 'text-slate-500 hover:text-slate-700'}`}
                        >
                            Tarjetas
                        </button>
                        <button
                            onClick={() => setVista('tabla')}
                            className={`px-3 py-1.5 rounded-lg text-xs font-bold transition-colors ${vista === 'tabla' ? 'bg-white shadow-sm text-slate-800' : 'text-slate-500 hover:text-slate-700'}`}
                        >
                            Tabla
                        </button>
                    </div>
                )}
            </div>

            {/* Lista / Tabla */}
            {loading ? (
                <div className="space-y-3">
                    {[1, 2, 3].map(i => <div key={i} className="h-24 bg-white rounded-2xl border border-slate-100 animate-pulse" />)}
                </div>
            ) : filtrados.length === 0 ? (
                <div className="text-center py-16 text-slate-500">
                    <FileText className="w-12 h-12 mx-auto mb-3 opacity-30" />
                    <p className="text-lg font-semibold text-slate-400">
                        {tab === 'pendiente_firma' ? 'No hay contratos pendientes' : 'No hay contratos firmados aún'}
                    </p>
                    <p className="text-sm mt-1">
                        {tipoFiltro !== 'todos' ? `Sin contratos de tipo "${tipoFiltro}" con ese criterio` :
                            tab === 'pendiente_firma'
                            ? 'Crea un contrato desde Gestión de Flota → botón "Crear Contrato Digital"'
                            : 'Los contratos firmados por el cliente aparecerán aquí'
                        }
                    </p>
                </div>
            ) : vista === 'tabla' && tab === 'firmado' ? (
                /* ─── VISTA TABLA ─── */
                <div className="bg-white rounded-2xl border border-slate-200 shadow-sm overflow-hidden">
                    <div className="overflow-x-auto">
                        <table className="w-full text-left">
                            <thead>
                                <tr className="bg-slate-50 border-b border-slate-200">
                                    <th className="px-4 py-3 text-xs font-black text-slate-500 uppercase tracking-wider">Cliente</th>
                                    <th className="px-4 py-3 text-xs font-black text-slate-500 uppercase tracking-wider">Vehículo</th>
                                    <th className="px-4 py-3 text-xs font-black text-slate-500 uppercase tracking-wider">Tipo</th>
                                    <th className="px-4 py-3 text-xs font-black text-slate-500 uppercase tracking-wider text-right">Monto</th>
                                    <th className="px-4 py-3 text-xs font-black text-slate-500 uppercase tracking-wider">Estado</th>
                                    <th className="px-4 py-3 text-xs font-black text-slate-500 uppercase tracking-wider">Acciones</th>
                                </tr>
                            </thead>
                            <tbody>
                                {filtrados.map(c => (
                                    <ContratoTableRow
                                        key={c.id}
                                        contrato={c}
                                        onVerPdf={() => setVerPdf(c)}
                                        onDelete={handleDelete}
                                        onEdit={setContratoToEdit}
                                    />
                                ))}
                            </tbody>
                        </table>
                    </div>
                    <div className="px-4 py-2 border-t border-slate-100 text-xs text-slate-400 font-medium">
                        {filtrados.length} contrato{filtrados.length !== 1 ? 's' : ''}
                        {tipoFiltro !== 'todos' ? ` de tipo "${tipoFiltro}"` : ''}
                    </div>
                </div>
            ) : (
                /* ─── VISTA TARJETAS ─── */
                <div className="space-y-3">
                    {filtrados.map(c => (
                        <ContratoRow key={c.id} contrato={c} onVerPdf={() => setVerPdf(c)} onDelete={handleDelete} onEdit={setContratoToEdit} />
                    ))}
                </div>
            )}

            {/* Modal Ver PDF */}
            {verPdf && <VerPdfModal contrato={verPdf} onClose={() => setVerPdf(null)} />}

            {/* Modal Mi Firma Admin */}
            {openFirmaPanel && (
                <div className="fixed inset-0 z-[60] flex items-center justify-center p-4 bg-black/80 backdrop-blur-sm"
                    onClick={e => e.target === e.currentTarget && setOpenFirmaPanel(false)}>
                    <div className="bg-white rounded-2xl w-full max-w-md shadow-2xl flex flex-col p-6 space-y-4">
                        <div className="flex items-center justify-between">
                            <h3 className="font-black text-slate-900 text-lg flex items-center gap-2">
                                <PenTool className="w-5 h-5 text-blue-500" />
                                Configurar Mi Firma
                            </h3>
                            <button onClick={() => setOpenFirmaPanel(false)} className="p-2 hover:bg-slate-100 rounded-xl">
                                <X className="w-4 h-4" />
                            </button>
                        </div>
                        <div className="bg-amber-50 border border-amber-100 text-amber-700 p-4 rounded-xl text-sm flex gap-2">
                            <Shield className="w-4 h-4 shrink-0 text-amber-500" />
                            <p>Esta firma aparecerá como "Vendedor/Representante" en todos los contratos que generes.</p>
                        </div>
                        <div className="bg-slate-50 rounded-xl p-4 border border-slate-200">
                            <FirmaCanvas onFirmaChange={setFirmaActual} label="REPRESENTANTE (YO)" />
                        </div>
                        <div className="flex gap-3 pt-2">
                            <button onClick={() => setOpenFirmaPanel(false)} 
                                className="flex-1 px-4 py-2.5 border border-slate-200 rounded-xl font-bold text-slate-600 hover:bg-slate-50 transition-all">
                                Cancelar
                            </button>
                            <button 
                                onClick={() => handleSaveMiFirma(firmaActual)}
                                disabled={!firmaActual || guardandoFirma}
                                className="flex-2 px-6 py-2.5 bg-blue-600 hover:bg-blue-700 text-white rounded-xl font-bold shadow-lg shadow-blue-200 disabled:opacity-50 transition-all flex items-center justify-center gap-2">
                                {guardandoFirma ? <Loader2 className="w-4 h-4 animate-spin" /> : 'Guardar Firma'}
                            </button>
                        </div>
                    </div>
                </div>
            )}

            {/* Modal Datos Legales */}
            <MisDatosLegalesModal
                isOpen={openLegalData}
                onClose={() => setOpenLegalData(false)}
            />
        </div>
    );
}

export default function ContratosPage() {
    return <ContratosContent />;
}
