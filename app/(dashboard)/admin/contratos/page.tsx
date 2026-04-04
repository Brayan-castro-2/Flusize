'use client';

import { useEffect, useState, useRef } from 'react';
import { supabase } from '@/lib/supabase';
import { useAuth } from '@/contexts/auth-context';
import {
    Shield, Clock, FileText, CheckCircle2, Search,
    MessageCircle, Eye, Loader2, X, Printer
} from 'lucide-react';
import { ContratoDocumento } from '@/components/contratos/contrato-documento';
import type { ContratoData } from '@/components/contratos/contrato-documento';

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
    firmado_en: string | null;
    ip_cliente: string | null;
    orden_id: string | null;
    vehiculo_flota_id: string | null;
    creado_en: string;
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
            firma_base64: contrato.firma_base64,
        }
        : {
            tipo: 'arriendo',
            numero: contrato.id.slice(-8).toUpperCase(),
            fecha: contrato.firmado_en
                ? new Date(contrato.firmado_en).toLocaleDateString('es-CL', { day: '2-digit', month: 'long', year: 'numeric' })
                : fechaHoy,
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
        setTimeout(() => { win.print(); win.close(); }, 400);
    };

    return (
        <div className="fixed inset-0 z-[60] flex items-center justify-center p-3 bg-black/80 backdrop-blur-sm"
            onClick={e => e.target === e.currentTarget && onClose()}>
            <div className="bg-white rounded-2xl w-full max-w-3xl max-h-[95vh] flex flex-col shadow-2xl overflow-hidden">
                <div className="flex items-center justify-between px-5 py-4 border-b border-slate-200 shrink-0">
                    <div className="flex items-center gap-2">
                        <FileText className="w-5 h-5 text-blue-600" />
                        <h2 className="font-black text-slate-900 text-lg">
                            Contrato {contrato.tipo === 'venta' ? 'Compraventa' : 'Arriendo'} — {contrato.vehiculo_patente}
                        </h2>
                    </div>
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
                <div className="overflow-y-auto flex-1 p-4 bg-slate-100 flex justify-center">
                    <div style={{ transform: 'scale(0.72)', transformOrigin: 'top center', marginBottom: '-28%' }}>
                        <ContratoDocumento ref={printRef} data={data} />
                    </div>
                </div>
            </div>
        </div>
    );
}

// ── Fila de contrato ─────────────────────────────────────────────────────────
function ContratoRow({ contrato, onVerPdf }: { contrato: Contrato; onVerPdf: () => void }) {
    const esVenta = contrato.tipo === 'venta';
    const esFirmado = contrato.estado === 'firmado';

    const trackingUrl = contrato.orden_id
        ? `${typeof window !== 'undefined' ? window.location.origin : ''}/tracking/${contrato.orden_id}`
        : null;

    const whatsappMsg = contrato.cliente_telefono && trackingUrl
        ? `https://api.whatsapp.com/send?phone=${contrato.cliente_telefono.replace(/[^0-9]/g, '')}&text=${encodeURIComponent(
            `Hola ${contrato.cliente_nombre || ''}! 👋 Te enviamos el link para revisar y firmar tu contrato de ${esVenta ? 'compraventa' : 'arriendo'} del vehículo ${contrato.vehiculo_patente}.\n\n` +
            `👉 ${trackingUrl}\n\n` +
            `Al abrir el link, podrás ver el contrato y firmarlo digitalmente desde tu celular. Cualquier duda, escríbenos.\n\n_Rentmontt SpA._`
        )}`
        : null;

    return (
        <div className={`bg-slate-800/60 border rounded-2xl p-4 transition-all ${esFirmado ? 'border-emerald-500/30' : 'border-amber-500/30'}`}>
            <div className="flex items-start justify-between gap-3">
                <div className="flex items-center gap-3 min-w-0">
                    <div className={`p-2 rounded-xl border shrink-0 ${esFirmado ? 'bg-emerald-500/20 border-emerald-500/30' : 'bg-amber-500/20 border-amber-500/30'}`}>
                        {esFirmado ? <CheckCircle2 className="w-4 h-4 text-emerald-400" /> : <Clock className="w-4 h-4 text-amber-400" />}
                    </div>
                    <div className="min-w-0">
                        <p className="font-bold text-white truncate">{contrato.cliente_nombre || 'Cliente'}</p>
                        <p className="text-sm text-slate-400">
                            <span className="font-mono text-slate-300 mr-2">{contrato.vehiculo_patente}</span>
                            {contrato.vehiculo_marca} {contrato.vehiculo_modelo}
                            <span className={`ml-2 px-1.5 py-0.5 rounded text-[10px] font-bold uppercase ${esVenta ? 'bg-blue-500/20 text-blue-300' : 'bg-purple-500/20 text-purple-300'}`}>
                                {contrato.tipo}
                            </span>
                        </p>
                    </div>
                </div>
                <div className="shrink-0 text-right">
                    <p className="font-black text-emerald-400 text-sm">{formatCLP(contrato.precio_total)}</p>
                    <p className="text-[10px] text-slate-500 mt-0.5">
                        {esFirmado && contrato.firmado_en
                            ? `Firmado ${new Date(contrato.firmado_en).toLocaleDateString('es-CL')}`
                            : `Creado ${new Date(contrato.creado_en).toLocaleDateString('es-CL')}`
                        }
                    </p>
                </div>
            </div>

            {/* Acciones */}
            <div className="flex gap-2 mt-3 pt-3 border-t border-slate-700/50">
                {!esFirmado && whatsappMsg && (
                    <a href={whatsappMsg} target="_blank" rel="noopener noreferrer"
                        className="flex-1 flex items-center justify-center gap-2 bg-green-600/20 hover:bg-green-600/30 border border-green-500/30 rounded-xl py-2 text-green-400 font-bold text-xs transition-colors">
                        <MessageCircle className="w-3.5 h-3.5" />
                        📲 Enviar por WhatsApp
                    </a>
                )}
                {!esFirmado && !whatsappMsg && (
                    <p className="flex-1 text-xs text-slate-500 text-center py-2 italic">Sin teléfono para WhatsApp</p>
                )}
                <button onClick={onVerPdf}
                    className="flex items-center justify-center gap-2 bg-slate-700/60 hover:bg-slate-700 border border-slate-600/50 rounded-xl py-2 px-4 text-slate-300 font-bold text-xs transition-colors">
                    <Eye className="w-3.5 h-3.5" />
                    {esFirmado ? 'Ver / Imprimir PDF' : 'Vista previa'}
                </button>
            </div>

            {esFirmado && contrato.firma_base64 && (
                <div className="mt-2 flex items-center gap-2 text-xs text-emerald-400">
                    <CheckCircle2 className="w-3.5 h-3.5" />
                    Firma digital capturada · {contrato.ip_cliente && <span className="text-slate-500">IP: {contrato.ip_cliente}</span>}
                </div>
            )}
        </div>
    );
}

// ── Página principal ──────────────────────────────────────────────────────────
function ContratosContent() {
    const { user } = useAuth();
    const [contratos, setContratos] = useState<Contrato[]>([]);
    const [loading, setLoading] = useState(true);
    const [search, setSearch] = useState('');
    const [tab, setTab] = useState<'pendiente_firma' | 'firmado'>('pendiente_firma');
    const [verPdf, setVerPdf] = useState<Contrato | null>(null);

    useEffect(() => {
        const fetchContratos = async () => {
            setLoading(true);
            const { data } = await supabase
                .from('contratos')
                .select('*')
                .order('creado_en', { ascending: false });
            setContratos((data as Contrato[]) || []);
            setLoading(false);
        };
        fetchContratos();
    }, []);

    const filtrados = contratos.filter(c => {
        if (c.estado !== tab) return false;
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

    return (
        <div className="space-y-6">
            {/* Header */}
            <div className="flex items-start justify-between">
                <div>
                    <h1 className="text-2xl md:text-3xl font-black text-white flex items-center gap-3">
                        <div className="p-2.5 bg-blue-500/20 rounded-xl border border-blue-500/30">
                            <Shield className="w-6 h-6 text-blue-400" />
                        </div>
                        Contratos Digitales
                    </h1>
                    <p className="text-slate-400 mt-1 text-sm">Gestión de contratos de venta y arriendo — firma remota por cliente</p>
                </div>
            </div>

            {/* Tabs */}
            <div className="flex gap-2">
                <button onClick={() => setTab('pendiente_firma')}
                    className={`flex items-center gap-2 px-4 py-2 rounded-xl font-bold text-sm transition-all ${tab === 'pendiente_firma'
                        ? 'bg-amber-500/20 border border-amber-500/40 text-amber-300'
                        : 'bg-slate-800/40 border border-slate-700/50 text-slate-400 hover:text-slate-200'
                    }`}>
                    <Clock className="w-4 h-4" />
                    Pendiente de Firma
                    {pendienteCount > 0 && (
                        <span className="bg-amber-500 text-white text-xs font-black px-1.5 py-0.5 rounded-full">{pendienteCount}</span>
                    )}
                </button>
                <button onClick={() => setTab('firmado')}
                    className={`flex items-center gap-2 px-4 py-2 rounded-xl font-bold text-sm transition-all ${tab === 'firmado'
                        ? 'bg-emerald-500/20 border border-emerald-500/40 text-emerald-300'
                        : 'bg-slate-800/40 border border-slate-700/50 text-slate-400 hover:text-slate-200'
                    }`}>
                    <CheckCircle2 className="w-4 h-4" />
                    Firmados
                    {firmadoCount > 0 && (
                        <span className="bg-emerald-500 text-white text-xs font-black px-1.5 py-0.5 rounded-full">{firmadoCount}</span>
                    )}
                </button>
            </div>

            {/* Buscador */}
            <div className="relative">
                <Search className="absolute left-3.5 top-1/2 -translate-y-1/2 w-4 h-4 text-slate-400" />
                <input value={search} onChange={e => setSearch(e.target.value)}
                    placeholder="Buscar por cliente, patente o RUT..."
                    className="w-full h-11 pl-10 pr-4 bg-slate-800 border border-slate-700 text-white rounded-xl text-sm focus:outline-none focus:ring-1 focus:ring-blue-500" />
            </div>

            {/* Lista */}
            {loading ? (
                <div className="space-y-3">
                    {[1, 2, 3].map(i => <div key={i} className="h-24 bg-slate-800/40 rounded-2xl animate-pulse" />)}
                </div>
            ) : filtrados.length === 0 ? (
                <div className="text-center py-16 text-slate-500">
                    <FileText className="w-12 h-12 mx-auto mb-3 opacity-30" />
                    <p className="text-lg font-semibold text-slate-400">
                        {tab === 'pendiente_firma' ? 'No hay contratos pendientes' : 'No hay contratos firmados aún'}
                    </p>
                    <p className="text-sm mt-1">
                        {tab === 'pendiente_firma'
                            ? 'Crea un contrato desde Gestión de Flota → botón "Crear Contrato Digital"'
                            : 'Los contratos firmados por el cliente aparecerán aquí'
                        }
                    </p>
                </div>
            ) : (
                <div className="space-y-3">
                    {filtrados.map(c => (
                        <ContratoRow key={c.id} contrato={c} onVerPdf={() => setVerPdf(c)} />
                    ))}
                </div>
            )}

            {/* Modal Ver PDF */}
            {verPdf && <VerPdfModal contrato={verPdf} onClose={() => setVerPdf(null)} />}
        </div>
    );
}

export default function ContratosPage() {
    return <ContratosContent />;
}
