'use client';

import { OrdenDB, VehiculoDB, PerfilDB } from '@/lib/local-storage-service';
import { Button } from '@/components/ui/button';
import { Download, MessageCircle, Mail, Printer } from 'lucide-react';
import { useRef, useState, useEffect } from 'react';
import { supabase } from '@/lib/supabase';

interface BoletaFacturaProps {
    orden: OrdenDB;
    vehiculo?: VehiculoDB;
    mecanico?: PerfilDB;
}

export function BoletaFactura({ orden, vehiculo, mecanico }: BoletaFacturaProps) {
    const boletaRef = useRef<HTMLDivElement | null>(null);
    const [tallerInfo, setTallerInfo] = useState<{ nombre: string; logo_url?: string } | null>(null);

    useEffect(() => {
        const fetchTaller = async () => {
            const tallerId = (orden as any).taller_id;
            if (tallerId) {
                const { data } = await supabase
                    .from('talleres')
                    .select('nombre, logo_url')
                    .eq('id', tallerId)
                    .single();
                if (data) setTallerInfo(data);
            }
        };
        fetchTaller();
    }, [orden]);

    const handlePrint = () => {
        window.print();
    };

    const handleDownloadPdf = async () => {
        const el = boletaRef.current;
        if (!el) return;

        const [{ default: html2canvas }, { jsPDF }] = await Promise.all([
            import('html2canvas'),
            import('jspdf'),
        ]);

        const canvas = await html2canvas(el, {
            scale: 2,
            backgroundColor: '#ffffff',
            useCORS: true // Importante para cargar el logo de Supabase Storage
        });

        const imgData = canvas.toDataURL('image/png');
        const pdf = new jsPDF({
            orientation: 'p',
            unit: 'px',
            format: [canvas.width, canvas.height],
        });

        pdf.addImage(imgData, 'PNG', 0, 0, canvas.width, canvas.height);
        pdf.save(`boleta-${orden.id}.pdf`);
    };

    const handleWhatsApp = () => {
        const phone = (orden.cliente_telefono || '').replace(/\D/g, '');
        if (!phone) {
            alert('El cliente no tiene teléfono registrado.');
            return;
        }

        const total = orden.precio_total ? `$${orden.precio_total.toLocaleString('es-CL')}` : 'Por definir';
        const vehiculoStr = vehiculo ? `${vehiculo.marca} ${vehiculo.modelo}` : orden.patente_vehiculo;

        const text = `Hola ${orden.cliente_nombre || 'Cliente'},\n\nSu vehículo *${vehiculoStr}* (Patente: ${orden.patente_vehiculo}) está listo.\n\n*Total a pagar: ${total}*\n\nGracias por confiar en nuestro servicio.`;
        const url = `https://wa.me/${phone}?text=${encodeURIComponent(text)}`;
        window.open(url, '_blank');
    };

    const handleEmail = async () => {
        alert('Funcionalidad de envío por email próximamente');
    };

    const formatCurrency = (amount: number) => {
        return new Intl.NumberFormat('es-CL', {
            style: 'currency',
            currency: 'CLP'
        }).format(amount);
    };

    const total = orden.precio_total || 0;
    const neto = Math.round(total / 1.19);
    const iva = total - neto;

    return (
        <div className="space-y-4">
            {/* Botones de acción - No se imprimen */}
            <div className="flex gap-3 print:hidden">
                <Button
                    onClick={handlePrint}
                    className="bg-[#0066FF] hover:bg-[#0052CC] text-white"
                >
                    <Printer className="w-4 h-4 mr-2" />
                    Imprimir
                </Button>
                <Button
                    onClick={handleDownloadPdf}
                    variant="outline"
                    className="border-[#333333] text-gray-300 hover:bg-[#242424]"
                >
                    <Download className="w-4 h-4 mr-2" />
                    Descargar PDF
                </Button>
                <Button
                    onClick={handleWhatsApp}
                    className="bg-[#25D366] hover:bg-[#128C7E] text-white"
                >
                    <MessageCircle className="w-4 h-4 mr-2" />
                    WhatsApp
                </Button>
                <Button
                    onClick={handleEmail}
                    variant="outline"
                    className="border-[#333333] text-gray-300 hover:bg-[#242424]"
                >
                    <Mail className="w-4 h-4 mr-2" />
                    Enviar por Email
                </Button>
            </div>

            <div ref={boletaRef} className="bg-white text-black p-8 rounded-lg print:shadow-none print:p-0">
                <div className="border-b-2 border-black pb-4 mb-6">
                    <div className="flex justify-between items-start">
                        <div className="flex items-center gap-4">
                            {tallerInfo?.logo_url ? (
                                <img
                                    src={tallerInfo.logo_url}
                                    alt={tallerInfo.nombre}
                                    className="w-48 h-auto object-contain"
                                />
                            ) : (
                                <div className="w-48 h-20 bg-gray-100 flex items-center justify-center text-gray-400 text-xs">
                                    Logo Taller
                                </div>
                            )}
                        </div>
                        <div className="text-right">
                            <h2 className="text-xl font-bold uppercase tracking-wider">{tallerInfo?.nombre || 'TALLER MECÁNICO'}</h2>
                            <p className="text-xs text-slate-500 font-medium mt-1">SERVICIO AUTOMOTRIZ INTEGRAL</p>
                        </div>
                    </div>
                </div>

                <div className="mb-6">
                    <div className="flex justify-between items-end mb-4">
                        <div>
                            <h3 className="font-bold text-lg">DATOS DEL CLIENTE</h3>
                        </div>
                        <div className="text-right">
                            <p className="text-sm font-bold">ORDEN DE TRABAJO</p>
                            <p className="text-lg font-bold text-blue-600">OT #{orden.numero_orden || orden.id.toString().slice(-4).toUpperCase()}</p>
                        </div>
                    </div>
                    <div className="grid grid-cols-2 gap-4 border p-4 rounded-lg bg-gray-50/50">
                        <div>
                            <p className="text-xs text-gray-500 uppercase font-bold">Nombre Cliente</p>
                            <p className="font-semibold text-sm">{orden.cliente_nombre || 'No especificado'}</p>
                        </div>
                        <div>
                            <p className="text-xs text-gray-500 uppercase font-bold">Teléfono</p>
                            <p className="font-semibold text-sm">{orden.cliente_telefono || 'No especificado'}</p>
                        </div>
                    </div>
                </div>

                {/* Datos del Vehículo */}
                <div className="mb-6">
                    <h3 className="font-bold text-lg mb-2">DATOS DEL VEHÍCULO</h3>
                    <div className="grid grid-cols-4 gap-4 border p-4 rounded-lg">
                        <div>
                            <p className="text-xs text-gray-500 uppercase font-bold">Patente</p>
                            <p className="font-bold font-mono text-sm bg-yellow-100 px-2 rounded inline-block border border-yellow-400">{orden.patente_vehiculo}</p>
                        </div>
                        {vehiculo && (
                            <>
                                <div className="col-span-1">
                                    <p className="text-xs text-gray-500 uppercase font-bold">Marca/Modelo</p>
                                    <p className="font-semibold text-sm uppercase">{vehiculo.marca} {vehiculo.modelo}</p>
                                </div>
                                <div>
                                    <p className="text-xs text-gray-500 uppercase font-bold">Año</p>
                                    <p className="font-semibold text-sm">{vehiculo.anio}</p>
                                </div>
                                <div>
                                    <p className="text-xs text-gray-500 uppercase font-bold">Color</p>
                                    <p className="font-semibold text-sm uppercase">{vehiculo.color}</p>
                                </div>
                            </>
                        )}
                    </div>
                </div>

                {/* Detalle de Trabajos */}
                <div className="mb-6">
                    <h3 className="font-bold text-lg mb-2">DETALLE DE TRABAJOS REALIZADOS</h3>
                    <div className="border rounded-lg overflow-hidden">
                        <div className="bg-gray-100 p-3 border-b">
                            <p className="text-xs font-bold uppercase text-gray-600">Descripción del Servicio</p>
                        </div>
                        <div className="p-4 bg-white min-h-[100px] whitespace-pre-wrap text-sm">
                            {orden.detalle_trabajos || orden.descripcion_ingreso || 'Sin detalles especificados'}
                        </div>
                    </div>
                </div>

                {/* Totals Section */}
                <div className="grid grid-cols-2 gap-8">
                    <div>
                        {mecanico && (
                            <div className="mb-4">
                                <p className="text-xs text-gray-500 uppercase font-bold">Mecánico Responsable</p>
                                <p className="font-semibold text-sm">{mecanico.nombre_completo}</p>
                            </div>
                        )}
                        {orden.metodos_pago && orden.metodos_pago.length > 0 && (
                            <div>
                                <p className="text-xs text-gray-500 uppercase font-bold mb-2">Formas de Pago</p>
                                <div className="text-xs space-y-1">
                                    {orden.metodos_pago.map((mp, idx) => (
                                        <div key={idx} className="flex justify-between border-b border-gray-100 pb-1">
                                            <span className="capitalize">{mp.metodo}</span>
                                            <span className="font-bold">{formatCurrency(mp.monto)}</span>
                                        </div>
                                    ))}
                                </div>
                            </div>
                        )}
                    </div>

                    <div className="space-y-2">
                        <div className="flex justify-between text-sm py-1 border-b">
                            <span className="text-gray-600">Valor Neto:</span>
                            <span className="font-medium">{formatCurrency(neto)}</span>
                        </div>
                        <div className="flex justify-between text-sm py-1 border-b">
                            <span className="text-gray-600">IVA (19%):</span>
                            <span className="font-medium">{formatCurrency(iva)}</span>
                        </div>
                        <div className="flex justify-between items-center pt-2">
                            <span className="text-lg font-bold">TOTAL:</span>
                            <span className="text-2xl font-black text-[#0066FF]">{formatCurrency(total)}</span>
                        </div>
                    </div>
                </div>

                {/* Disclaimer Legal y Firma */}
                <div className="mt-8 pt-6 border-t border-gray-200">
                    <div className="bg-slate-50 p-4 rounded-lg mb-8">
                        <p className="text-[10px] leading-relaxed text-slate-600 font-medium text-justify uppercase">
                            REPROGRAMACIONES DE ECU ÚNICO REQUISITO BENCINA 97 OCTANOS PERMANENTE EN BENCINEROS.
                            SE RECOMIENDA NO SOBRE EXIGIR EL VEHÍCULO EN ALTAS TEMPERATURAS AMBIENTALES.
                            ÚNICA GARANTÍA EN PUERTO OBD2 Y ECU (BROCHES O TORNILOS EN CASO DE DESMONTAJE)
                            STEEL MONKEY NO SE HACE RESPONSABLE DEBIDO A FACTORES EXTERNOS QUE PUEDEN LLEVAR A UN INCIDENTE.
                        </p>
                    </div>

                    <div className="flex justify-end mt-12">
                        <div className="w-64 text-center">
                            <div className="border-t-2 border-black mb-2"></div>
                            <p className="text-xs font-bold uppercase tracking-wider">Firma del Cliente</p>
                        </div>
                    </div>
                </div>

                {/* Footer */}
                <div className="mt-8 pt-4 border-t border-dashed border-gray-300 text-center">
                    <p className="text-[10px] text-gray-400 uppercase tracking-widest">Documento generado vía Flusize SaaS</p>
                </div>
            </div>
        </div>
    );
}
