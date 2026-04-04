'use client';

import { useRef, useState, useEffect, useCallback } from 'react';
import { supabase } from '@/lib/supabase';
import { X, Shield, RotateCcw, CheckCircle2, MapPin, Loader2, AlertTriangle } from 'lucide-react';
import { toast } from 'sonner';

// ─── Types ─────────────────────────────────────────────────────────────────────
interface ContratoData {
    orden_id: string;
    cliente_nombre: string;
    cliente_rut: string;
    vehiculo_patente: string;
    vehiculo_desc: string;      // "Toyota Corolla 2020 Motor 1.8"
    monto_total: number;
    fecha_contrato?: string;    // Por defecto hoy
    numero_contrato?: string;
}

interface ContratoModalProps {
    data: ContratoData;
    onClose: () => void;
    onFirmado?: (contratoId: string) => void;
}

// ─── Helpers ───────────────────────────────────────────────────────────────────
function cl(n: number) {
    return n.toLocaleString('es-CL', { style: 'currency', currency: 'CLP', maximumFractionDigits: 0 });
}

function fechaLarga(d?: string) {
    const date = d ? new Date(d) : new Date();
    return date.toLocaleDateString('es-CL', { day: 'numeric', month: 'long', year: 'numeric' });
}

// ─── SignaturePad ──────────────────────────────────────────────────────────────
function SignaturePad({ onSign }: { onSign: (dataUrl: string | null) => void }) {
    const canvasRef = useRef<HTMLCanvasElement>(null);
    const drawing = useRef(false);
    const hasDrawn = useRef(false);

    const getPos = (e: MouseEvent | TouchEvent, rect: DOMRect) => {
        if ('touches' in e) {
            return { x: e.touches[0].clientX - rect.left, y: e.touches[0].clientY - rect.top };
        }
        return { x: (e as MouseEvent).clientX - rect.left, y: (e as MouseEvent).clientY - rect.top };
    };

    useEffect(() => {
        const canvas = canvasRef.current;
        if (!canvas) return;
        const ctx = canvas.getContext('2d');
        if (!ctx) return;

        // DPR para pantallas retina
        const dpr = window.devicePixelRatio || 1;
        canvas.width = canvas.offsetWidth * dpr;
        canvas.height = canvas.offsetHeight * dpr;
        ctx.scale(dpr, dpr);
        ctx.strokeStyle = '#1e40af';
        ctx.lineWidth = 2.5;
        ctx.lineCap = 'round';
        ctx.lineJoin = 'round';

        const start = (e: MouseEvent | TouchEvent) => {
            e.preventDefault();
            const rect = canvas.getBoundingClientRect();
            const { x, y } = getPos(e, rect);
            ctx.beginPath();
            ctx.moveTo(x, y);
            drawing.current = true;
        };

        const draw = (e: MouseEvent | TouchEvent) => {
            if (!drawing.current) return;
            e.preventDefault();
            const rect = canvas.getBoundingClientRect();
            const { x, y } = getPos(e, rect);
            ctx.lineTo(x, y);
            ctx.stroke();
            hasDrawn.current = true;
        };

        const stop = () => {
            if (!drawing.current) return;
            drawing.current = false;
            if (hasDrawn.current) {
                onSign(canvas.toDataURL('image/png'));
            }
        };

        canvas.addEventListener('mousedown', start);
        canvas.addEventListener('mousemove', draw);
        canvas.addEventListener('mouseup', stop);
        canvas.addEventListener('mouseleave', stop);
        canvas.addEventListener('touchstart', start, { passive: false });
        canvas.addEventListener('touchmove', draw, { passive: false });
        canvas.addEventListener('touchend', stop);

        return () => {
            canvas.removeEventListener('mousedown', start);
            canvas.removeEventListener('mousemove', draw);
            canvas.removeEventListener('mouseup', stop);
            canvas.removeEventListener('mouseleave', stop);
            canvas.removeEventListener('touchstart', start);
            canvas.removeEventListener('touchmove', draw);
            canvas.removeEventListener('touchend', stop);
        };
    }, [onSign]);

    const clear = () => {
        const canvas = canvasRef.current;
        if (!canvas) return;
        const ctx = canvas.getContext('2d');
        if (!ctx) return;
        ctx.clearRect(0, 0, canvas.width, canvas.height);
        hasDrawn.current = false;
        onSign(null);
    };

    return (
        <div className="space-y-2">
            <div className="relative border-2 border-dashed border-blue-400/40 rounded-xl bg-white overflow-hidden" style={{ height: 140 }}>
                <canvas
                    ref={canvasRef}
                    className="w-full h-full touch-none cursor-crosshair"
                    style={{ display: 'block' }}
                />
                <p className="absolute bottom-2 left-0 right-0 text-center text-xs text-gray-300 pointer-events-none select-none">
                    Firme con su dedo o mouse aquí
                </p>
            </div>
            <button onClick={clear} className="flex items-center gap-1.5 text-xs text-slate-400 hover:text-white transition-colors">
                <RotateCcw className="w-3.5 h-3.5" /> Limpiar firma
            </button>
        </div>
    );
}

// ─── Texto del Contrato ────────────────────────────────────────────────────────
function TextoContrato({ data }: { data: ContratoData }) {
    const fecha = fechaLarga(data.fecha_contrato);
    const monto = cl(data.monto_total);

    return (
        <div className="text-xs leading-relaxed text-slate-700 space-y-3 font-serif">
            <div className="text-center space-y-1 mb-4">
                <div className="flex items-center justify-center gap-3 mb-2">
                    <div className="text-center">
                        <p className="font-black text-slate-900 text-sm uppercase tracking-widest">RENT MONTT</p>
                        <p className="text-[10px] text-slate-500">Sociedad de Compraventa y Arriendo de Vehículos y Maquinaria Rentmontt spa</p>
                        <p className="text-[10px] text-slate-500">R.U.T: 77.294.859-K · Puerto Montt · +569 9265 7548</p>
                    </div>
                </div>
                <p className="font-black text-base text-slate-900 border-b-2 border-slate-900 pb-1 uppercase tracking-widest">
                    CONTRATO DE COMPRAVENTA
                </p>
                {data.numero_contrato && <p className="text-slate-500">N° {data.numero_contrato}</p>}
            </div>

            <p>En <strong>{fecha}</strong> se celebra el presente contrato entre la Sociedad de Compraventa y Arriendo de Vehículos y Maquinaria <strong>Rentmontt spa</strong>, R.U.T. 77.294.859-K, representada por el Sr. Óscar Olivares, con domicilio comercial en <strong>Puerto Montt</strong>, como vendedor y como comprador el/la Sr./Sra. <strong>{data.cliente_nombre || '___________'}</strong>, Cédula de Identidad N° <strong>{data.cliente_rut || '___________'}</strong>.</p>

            <p><strong>PRIMERO.-</strong> Compraventa y Arriendo de Vehículos y Maquinaria Rentmontt spa., vende al/a la Sr./Sra. <strong>{data.cliente_nombre}</strong> quien compra y acepta para sí un vehículo <strong>{data.vehiculo_desc}</strong>, Patente Única: <strong>{data.vehiculo_patente}</strong>.</p>

            <p><strong>SEGUNDO.-</strong> El precio de venta es la cantidad de <strong>{monto}</strong>, el cual es cancelado a convenir entre las partes.</p>

            <p><strong>TERCERO.-</strong> El vendedor declara que el vehículo vendido no se encuentra afecto a deudas y gravámenes o cualquier otro tipo de responsabilidad.</p>

            <p><strong>CUARTO.-</strong> El comprador toma pleno conocimiento y acepta en su totalidad la cláusula cuarta, que en el desistimiento del presente contrato, facultaría a la parte vendedora a cobrar una indemnización del 15% del valor de la operación, como así mismo COMPRAVENTA y ARRIENDO DE VEHÍCULOS Y MAQUINARIA RENTMONTT SPA. Cobrará un arrendamiento diario de los días ocupado por el comprador del vehículo, valor que este vigente en el mercado.</p>

            <p><strong>QUINTO.-</strong> Los gastos de transferencia serán de cargo del comprador.</p>

            <p><strong>SEXTO.-</strong> El comprador acepta el vehículo en el estado en que se encuentra, será obligación de la parte compradora revisarlo y probarlo, ya que si no lo hiciera será de su exclusiva responsabilidad. Cualquier detalle que se encuentre a posterior, no tendrá derecho a reclamo alguno. No se otorga garantía por la venta de vehículos usados, una vez estos abandonaron la sala de exposición y ventas.</p>

            <p><strong>SÉPTIMO.-</strong> El comprador faculta expresamente en este acto a la sociedad vendedora, para disponer total o parcialmente de los documentos de pago de dinero o instrumentos de crédito otorgados por él, pudiendo cubrir el saldo insoluto, intereses, gastos de cobranza, gastos notariales o todo gasto relacionado con la obtención y/o recuperación de los dineros adeudados por el Comprador a la sociedad Vendedora.</p>

            <p><strong>OCTAVO.-</strong> Los precios de los vehículos nuevos están sujetos a variaciones. De no estar cancelados en su totalidad, en caso de alza no se mantendrá el valor del contrato.</p>

            <p><strong>NOVENO.-</strong> Firman ambas partes en conformidad al presente Contrato de Compraventa sin tener reclamo alguno que formular ni ahora ni posterior.</p>
        </div>
    );
}

// ─── Modal Principal ───────────────────────────────────────────────────────────
export default function ContratoModal({ data, onClose, onFirmado }: ContratoModalProps) {
    const [firma, setFirma] = useState<string | null>(null);
    const [firmando, setFirmando] = useState(false);
    const [firmado, setFirmado] = useState(false);
    const [geoStatus, setGeoStatus] = useState<'idle' | 'loading' | 'ok' | 'denied'>('idle');
    const [geo, setGeo] = useState<{ lat: number; lng: number } | null>(null);

    // Solicitar geolocalización al montar
    useEffect(() => {
        if (!navigator.geolocation) { setGeoStatus('denied'); return; }
        setGeoStatus('loading');
        navigator.geolocation.getCurrentPosition(
            (pos) => { setGeo({ lat: pos.coords.latitude, lng: pos.coords.longitude }); setGeoStatus('ok'); },
            () => setGeoStatus('denied'),
            { timeout: 8000 }
        );
    }, []);

    const handleFirmar = async () => {
        if (!firma) { toast.error('Por favor firma el contrato antes de continuar'); return; }
        setFirmando(true);

        try {
            // Obtener IP pública
            let ip = '';
            try {
                const ipRes = await fetch('https://api.ipify.org?format=json');
                const ipData = await ipRes.json();
                ip = ipData.ip || '';
            } catch { ip = 'desconocida'; }

            // Generar hash de verificación simple
            const raw = `${data.orden_id}-${Date.now()}-${firma.slice(-20)}`;
            const hashBuffer = await crypto.subtle.digest('SHA-256', new TextEncoder().encode(raw));
            const hashHex = Array.from(new Uint8Array(hashBuffer)).map(b => b.toString(16).padStart(2, '0')).join('');

            const { data: inserted, error } = await supabase.from('contratos_firmados').insert({
                orden_id: data.orden_id,
                cliente_nombre: data.cliente_nombre,
                cliente_rut: data.cliente_rut,
                vehiculo_patente: data.vehiculo_patente,
                vehiculo_desc: data.vehiculo_desc,
                monto_total: data.monto_total,
                firma_base64: firma,
                ip_cliente: ip,
                geolat: geo?.lat || null,
                geolng: geo?.lng || null,
                hash_verificacion: hashHex,
                numero_contrato: data.numero_contrato || null,
                firmado_en: new Date().toISOString(),
            }).select('id').single();

            if (error) throw error;

            setFirmado(true);
            toast.success('¡Contrato firmado exitosamente! ✅');
            onFirmado?.(inserted.id);
        } catch (e: any) {
            toast.error('Error al guardar el contrato: ' + (e?.message || ''));
        } finally {
            setFirmando(false);
        }
    };

    if (firmado) {
        return (
            <div className="fixed inset-0 z-50 flex items-center justify-center p-4 bg-black/80 backdrop-blur-sm">
                <div className="bg-slate-900 border border-emerald-500/50 rounded-3xl p-8 text-center max-w-sm w-full shadow-2xl shadow-emerald-500/10">
                    <div className="w-20 h-20 bg-emerald-500/20 border-2 border-emerald-500 rounded-full flex items-center justify-center mx-auto mb-4">
                        <CheckCircle2 className="w-10 h-10 text-emerald-400" />
                    </div>
                    <h2 className="text-2xl font-black text-white mb-2">¡Contrato Firmado!</h2>
                    <p className="text-slate-400 text-sm mb-6">La firma digital ha sido registrada con validación de fecha, hora, IP y geolocalización.</p>
                    <div className="bg-slate-800 rounded-xl p-3 text-xs text-slate-400 text-left space-y-1 mb-6">
                        <div className="flex items-center gap-2"><Shield className="w-3.5 h-3.5 text-emerald-400" /><span>Timestamp: {new Date().toLocaleString('es-CL')}</span></div>
                        {geo && <div className="flex items-center gap-2"><MapPin className="w-3.5 h-3.5 text-blue-400" /><span>Geolocalizado: {geo.lat.toFixed(4)}, {geo.lng.toFixed(4)}</span></div>}
                    </div>
                    <button onClick={onClose} className="w-full h-11 bg-emerald-600 hover:bg-emerald-500 text-white font-bold rounded-xl transition-colors">
                        Cerrar
                    </button>
                </div>
            </div>
        );
    }

    return (
        <div className="fixed inset-0 z-50 flex items-end sm:items-center justify-center p-0 sm:p-4 bg-black/80 backdrop-blur-sm" onClick={e => e.target === e.currentTarget && onClose()}>
            <div className="bg-slate-900 border border-slate-700 rounded-t-3xl sm:rounded-3xl w-full sm:max-w-2xl max-h-[95vh] flex flex-col shadow-2xl">
                {/* Cabecera */}
                <div className="sticky top-0 bg-slate-900/95 backdrop-blur-sm border-b border-slate-800 p-5 flex items-center justify-between z-10 shrink-0">
                    <div className="flex items-center gap-3">
                        <div className="p-2 bg-blue-500/20 rounded-xl border border-blue-500/30">
                            <Shield className="w-5 h-5 text-blue-400" />
                        </div>
                        <div>
                            <h2 className="font-black text-white text-lg">Contrato de Compraventa</h2>
                            <p className="text-xs text-slate-400">RentMontt · Firma Electrónica Simple</p>
                        </div>
                    </div>
                    <button onClick={onClose} className="p-2 rounded-xl bg-slate-800 text-slate-400 hover:text-white"><X className="w-4 h-4" /></button>
                </div>

                {/* Texto del contrato */}
                <div className="overflow-y-auto flex-1 p-5">
                    <div className="bg-white rounded-2xl p-5 shadow-sm border border-slate-200">
                        <TextoContrato data={data} />
                    </div>
                </div>

                {/* Sección de firma */}
                <div className="border-t border-slate-800 p-5 space-y-4 bg-slate-900 shrink-0">
                    <div className="flex items-center justify-between">
                        <p className="text-sm font-bold text-white">Firma del Comprador</p>
                        <div className="flex items-center gap-1.5 text-xs">
                            {geoStatus === 'loading' && <><Loader2 className="w-3 h-3 animate-spin text-slate-400" /><span className="text-slate-400">Obteniendo ubicación...</span></>}
                            {geoStatus === 'ok' && <><MapPin className="w-3 h-3 text-emerald-400" /><span className="text-emerald-400">Ubicación capturada</span></>}
                            {geoStatus === 'denied' && <><AlertTriangle className="w-3 h-3 text-amber-400" /><span className="text-amber-400">Sin ubicación</span></>}
                        </div>
                    </div>

                    <SignaturePad onSign={setFirma} />

                    <div className="bg-slate-800/50 rounded-xl p-3 flex items-start gap-2 text-xs text-slate-400">
                        <Shield className="w-4 h-4 text-blue-400 shrink-0 mt-0.5" />
                        <p>Al firmar, acepta el contrato en su totalidad. Se registrará su firma junto a fecha/hora exacta, dirección IP y geolocalización como evidencia legal.</p>
                    </div>

                    <button
                        onClick={handleFirmar}
                        disabled={!firma || firmando}
                        className={`w-full h-12 rounded-xl font-black text-base transition-all ${
                            firma && !firmando
                                ? 'bg-gradient-to-r from-blue-600 to-blue-700 hover:from-blue-500 hover:to-blue-600 text-white shadow-lg shadow-blue-500/30'
                                : 'bg-slate-800 text-slate-500 cursor-not-allowed'
                        }`}
                    >
                        {firmando ? (
                            <span className="flex items-center justify-center gap-2"><Loader2 className="w-4 h-4 animate-spin" /> Guardando firma...</span>
                        ) : firma ? (
                            '✍️ Confirmar y Firmar Contrato'
                        ) : (
                            'Firme arriba para continuar'
                        )}
                    </button>
                </div>
            </div>
        </div>
    );
}
