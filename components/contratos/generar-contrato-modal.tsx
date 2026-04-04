'use client';

import { useRef, useState, useCallback } from 'react';
import { X, Download, Loader2, FileText } from 'lucide-react';
import { Button } from '@/components/ui/button';
import { ContratoDocumento, ContratoData } from './contrato-documento';
import { FirmaCanvas } from './firma-canvas';
import { useAuth } from '@/contexts/auth-context';

interface GenerarContratoModalProps {
    isOpen: boolean;
    onClose: () => void;
    /** Datos de la orden/contrato a generar */
    contrato: {
        id: string;
        tipo_orden: 'venta' | 'arriendo';
        precio_total: number;
        pie_pagado?: number;
        saldo_pendiente?: number;
        fecha_salida?: string;
        fecha_retorno?: string;
        precio_dia?: number;
        dias?: number;
        cliente_nombre?: string;
        cliente_rut?: string;
        cliente_domicilio?: string;
        cliente_telefono?: string;
        vehiculo_marca?: string;
        vehiculo_modelo?: string;
        vehiculo_color?: string;
        vehiculo_anio?: string;
        vehiculo_motor?: string;
        vehiculo_patente?: string;
        datos_comerciales?: Record<string, any>;
    };
}

export function GenerarContratoModal({ isOpen, onClose, contrato }: GenerarContratoModalProps) {
    const { user } = useAuth();
    const contratoRef = useRef<HTMLDivElement>(null);
    const [firma, setFirma] = useState<string | null>(null);
    const [generando, setGenerando] = useState(false);

    const dc = contrato.datos_comerciales || {};

    const fechaHoy = new Date().toLocaleDateString('es-CL', {
        day: '2-digit', month: 'long', year: 'numeric'
    });

    // Resolver datos del vehículo desde múltiples fuentes
    const vMarca = contrato.vehiculo_marca || dc.vehiculo?.split(' ')[0] || '';
    const vModelo = contrato.vehiculo_modelo || dc.vehiculo?.split(' ').slice(1).join(' ') || '';
    const vPatente = contrato.vehiculo_patente || dc.patente || '';
    const vColor = contrato.vehiculo_color || dc.color || '';
    const vAnio = contrato.vehiculo_anio || dc.anio || '';
    const vMotor = contrato.vehiculo_motor || dc.motor || '';

    const cNombre = contrato.cliente_nombre || dc.cliente_nombre || '';
    const cRut = contrato.cliente_rut || dc.cliente_rut || '';
    const cDomicilio = contrato.cliente_domicilio || dc.cliente_domicilio || '';
    const cTelefono = contrato.cliente_telefono || dc.cliente_telefono || '';

    const precioTotal = contrato.precio_total || dc.precio_total || 0;
    const piePagado = contrato.pie_pagado ?? dc.pie_pagado ?? precioTotal;
    const saldoPendiente = contrato.saldo_pendiente ?? dc.saldo_pendiente ?? 0;

    const fechaSalida = contrato.fecha_salida ? new Date(contrato.fecha_salida).toLocaleDateString('es-CL') : dc.fecha_salida || '';
    const fechaRetorno = contrato.fecha_retorno ? new Date(contrato.fecha_retorno).toLocaleDateString('es-CL') : dc.fecha_retorno || '';
    const precioDia = contrato.precio_dia ?? dc.precio_dia ?? 0;
    const dias = contrato.dias ?? dc.dias ?? 0;

    const contratoData: ContratoData = contrato.tipo_orden === 'venta'
        ? {
            tipo: 'venta',
            numero: contrato.id.slice(-8).toUpperCase(),
            fecha: fechaHoy,
            vendedor_nombre: user?.workshopName || 'Rentmontt SpA.',
            vendedor_rut: '77.294.859-K',
            vendedor_email: 'olivares@rentmontt.cl',
            vendedor_fono: '+569 9265 7540',
            vendedor_ciudad: 'Puerto Montt',
            comprador_nombre: cNombre,
            comprador_rut: cRut,
            comprador_domicilio: cDomicilio,
            comprador_telefono: cTelefono,
            vehiculo_marca: vMarca,
            vehiculo_modelo: vModelo,
            vehiculo_color: vColor,
            vehiculo_anio: vAnio,
            vehiculo_motor: vMotor,
            vehiculo_patente: vPatente,
            precio_total: precioTotal,
            pie_pagado: piePagado,
            saldo_pendiente: saldoPendiente,
            firma_base64: firma,
        }
        : {
            tipo: 'arriendo',
            numero: contrato.id.slice(-8).toUpperCase(),
            fecha: fechaHoy,
            vendedor_nombre: user?.workshopName || 'Rentmontt SpA.',
            vendedor_rut: '77.294.859-K',
            vendedor_email: 'olivares@rentmontt.cl',
            vendedor_fono: '+569 9265 7540',
            vendedor_ciudad: 'Puerto Montt',
            comprador_nombre: cNombre,
            comprador_rut: cRut,
            comprador_domicilio: cDomicilio,
            comprador_telefono: cTelefono,
            vehiculo_marca: vMarca,
            vehiculo_modelo: vModelo,
            vehiculo_color: vColor,
            vehiculo_anio: vAnio,
            vehiculo_patente: vPatente,
            fecha_salida: fechaSalida,
            fecha_retorno: fechaRetorno,
            precio_total: precioTotal,
            precio_dia: precioDia,
            dias: dias,
            firma_base64: firma,
        };

    const descargarPDF = useCallback(async () => {
        if (!contratoRef.current) return;
        setGenerando(true);
        try {
            const html2canvas = (await import('html2canvas')).default;
            const jsPDF = (await import('jspdf')).default;

            const canvas = await html2canvas(contratoRef.current, {
                scale: 2,
                useCORS: true,
                backgroundColor: '#ffffff',
                logging: false,
            });

            const imgData = canvas.toDataURL('image/jpeg', 0.92);
            const pdf = new jsPDF('p', 'mm', 'a4');
            const pdfW = pdf.internal.pageSize.getWidth();
            const pdfH = pdf.internal.pageSize.getHeight();
            const ratio = canvas.width / canvas.height;
            const imgW = pdfW;
            const imgH = imgW / ratio;

            let y = 0;
            let heightLeft = imgH;

            pdf.addImage(imgData, 'JPEG', 0, 0, imgW, imgH);
            heightLeft -= pdfH;

            while (heightLeft > 0) {
                y -= pdfH;
                pdf.addPage();
                pdf.addImage(imgData, 'JPEG', 0, y, imgW, imgH);
                heightLeft -= pdfH;
            }

            const tipoLabel = contrato.tipo_orden === 'venta' ? 'Compraventa' : 'Arriendo';
            pdf.save(`Contrato_${tipoLabel}_${vPatente || contrato.id.slice(-6)}_${new Date().toISOString().slice(0, 10)}.pdf`);
        } catch (err) {
            console.error('Error generando PDF:', err);
        }
        setGenerando(false);
    }, [contratoRef, contrato, vPatente, firma]);

    if (!isOpen) return null;

    return (
        <div className="fixed inset-0 z-[55] flex items-center justify-center p-2 sm:p-4 bg-black/80 backdrop-blur-sm"
            onClick={e => e.target === e.currentTarget && onClose()}>
            <div className="bg-white rounded-2xl w-full max-w-3xl max-h-[95vh] flex flex-col shadow-2xl overflow-hidden">
                {/* Header */}
                <div className="flex items-center justify-between px-5 py-4 border-b border-slate-200 shrink-0">
                    <div className="flex items-center gap-2">
                        <FileText className="w-5 h-5 text-blue-600" />
                        <h2 className="font-black text-slate-900 text-lg">
                            {contrato.tipo_orden === 'venta' ? 'Contrato de Compraventa' : 'Contrato de Arriendo'}
                        </h2>
                    </div>
                    <div className="flex items-center gap-2">
                        <Button
                            onClick={descargarPDF}
                            disabled={generando}
                            className="bg-blue-600 hover:bg-blue-700 text-white h-9 px-4 text-sm font-bold"
                        >
                            {generando
                                ? <><Loader2 className="w-4 h-4 mr-2 animate-spin" /> Generando...</>
                                : <><Download className="w-4 h-4 mr-2" /> Descargar PDF</>
                            }
                        </Button>
                        <button onClick={onClose} className="p-2 text-slate-400 hover:text-slate-600 hover:bg-slate-100 rounded-xl">
                            <X className="w-5 h-5" />
                        </button>
                    </div>
                </div>

                {/* Content scrollable */}
                <div className="overflow-y-auto flex-1">
                    {/* Vista previa del documento (escala reducida para la pantalla) */}
                    <div className="p-4 bg-slate-100 flex justify-center">
                        <div style={{ transform: 'scale(0.72)', transformOrigin: 'top center', marginBottom: '-28%' }}>
                            <ContratoDocumento ref={contratoRef} data={contratoData} />
                        </div>
                    </div>

                    {/* Firma */}
                    <div className="p-5 border-t border-slate-200 bg-white">
                        <FirmaCanvas onFirmaChange={setFirma} label={contrato.tipo_orden === 'venta' ? 'COMPRADOR' : 'ARRENDATARIO'} />
                        {firma && (
                            <p className="mt-2 text-xs text-emerald-600 font-semibold flex items-center gap-1">
                                ✅ Firma capturada — se incluirá en el PDF al descargar
                            </p>
                        )}
                    </div>
                </div>
            </div>
        </div>
    );
}
