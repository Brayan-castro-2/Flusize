'use client';

import { forwardRef } from 'react';

interface ContratoVentaData {
    tipo: 'venta';
    numero: string;
    fecha: string;

    // Vendedor
    vendedor_nombre: string;
    vendedor_rut: string;
    vendedor_email: string;
    vendedor_fono: string;
    vendedor_ciudad: string;

    // Comprador
    comprador_nombre: string;
    comprador_rut: string;
    comprador_domicilio: string;
    comprador_telefono: string;

    // Vehículo
    vehiculo_marca: string;
    vehiculo_modelo: string;
    vehiculo_color: string;
    vehiculo_anio: string;
    vehiculo_motor: string;
    vehiculo_patente: string;

    // Financiero
    precio_total: number;
    pie_pagado: number;
    saldo_pendiente: number;

    // Firma
    firma_base64?: string | null;
}

interface ContratoArriendoData {
    tipo: 'arriendo';
    numero: string;
    fecha: string;

    vendedor_nombre: string;
    vendedor_rut: string;
    vendedor_email: string;
    vendedor_fono: string;
    vendedor_ciudad: string;

    comprador_nombre: string;
    comprador_rut: string;
    comprador_domicilio: string;
    comprador_telefono: string;

    vehiculo_marca: string;
    vehiculo_modelo: string;
    vehiculo_color: string;
    vehiculo_anio: string;
    vehiculo_patente: string;

    fecha_salida: string;
    fecha_retorno: string;
    precio_total: number;
    precio_dia: number;
    dias: number;

    firma_base64?: string | null;
}

type ContratoData = ContratoVentaData | ContratoArriendoData;

function cl(n: number) {
    return n.toLocaleString('es-CL', { style: 'currency', currency: 'CLP', maximumFractionDigits: 0 });
}

// ── Contrato Compraventa ───────────────────────────────────────────────────────

function PlantillaVenta({ d }: { d: ContratoVentaData }) {
    return (
        <>
            {/* CLÁUSULAS */}
            <div className="space-y-4 text-[11px] text-slate-800 leading-relaxed">
                <p>
                    <strong>PRIMERO.-</strong> Compraventa y Arriendo de Vehículos y Maquinaria{' '}
                    <strong>Rentmontt SpA.</strong>, vende al Sr./Sra.{' '}
                    <strong className="underline">{d.comprador_nombre}</strong> quien compra y acepta para sí un{' '}
                    <strong>{d.vehiculo_marca} {d.vehiculo_modelo}</strong>, Color{' '}
                    <strong>{d.vehiculo_color}</strong>, Año <strong>{d.vehiculo_anio}</strong>, Motor{' '}
                    <strong>{d.vehiculo_motor || 'N/A'}</strong>, Patente Única{' '}
                    <strong className="font-mono">{d.vehiculo_patente}</strong>.
                </p>

                <p>
                    <strong>SEGUNDO.-</strong> El precio de venta es la cantidad de{' '}
                    <strong>{cl(d.precio_total)}</strong> el cual es cancelado de la siguiente manera:{' '}
                    Pie <strong>{cl(d.pie_pagado)}</strong> — Saldo{' '}
                    <strong>{cl(d.saldo_pendiente)}</strong>. El saldo de precio queda representado en documentos
                    mercantiles a entera satisfacción del vendedor.
                </p>

                <p>
                    <strong>TERCERO.-</strong> El vendedor declara que el vehículo vendido no se encuentra afecto
                    a deudas de ninguna naturaleza con el Fisco ni con municipalidades u otros organismos públicos,
                    siendo de cargo del comprador los permisos de circulación, revisiones técnicas, y demás gastos
                    posteriores a la fecha de esta escritura.
                </p>

                <p>
                    <strong>CUARTO.-</strong> El comprador toma pleno conocimiento de que en el desistimiento del
                    presente contrato, facultará a la parte vendedora a cobrar una indemnización del{' '}
                    <strong>15%</strong> del valor de la operación, más todos los gastos administrativos en que
                    hubiere incurrido la empresa.
                </p>

                <p>
                    <strong>QUINTO.-</strong> Los gastos de transferencia serán de cargo del comprador.
                </p>

                <p>
                    <strong>SEXTO.-</strong> El comprador acepta el vehículo en el estado en que se encuentra,
                    declarando conocerlo y aceptarlo. No se otorga garantía por la venta de vehículos usados,
                    siendo de cargo total del comprador los desperfectos o vicios ocultos que se detecten con
                    posterioridad a la suscripción del presente contrato.
                </p>

                <p>
                    <strong>SÉPTIMO.-</strong> El comprador faculta expresamente a Rentmontt SpA. para disponer
                    total o parcialmente de los documentos de pago que garanticen el saldo de precio antes
                    señalado, así como para ceder, transferir, endosar o negociar dichos documentos a cualquier
                    institución financiera, banco o persona natural o jurídica, sin necesidad de notificación ni
                    autorización adicional.
                </p>

                <p>
                    <strong>OCTAVO.-</strong> Los precios de los vehículos nuevos están sujetos a variaciones sin
                    previo aviso por parte del proveedor. En caso de que el precio sufra alza entre la fecha de
                    compra y la entrega del vehículo, el comprador deberá pagar la diferencia correspondiente.
                </p>

                <p>
                    <strong>NOVENO.-</strong> Firman ambas partes en conformidad al presente Contrato, en la ciudad
                    de <strong>{d.vendedor_ciudad}</strong>, el día{' '}
                    <strong>{d.fecha}</strong>.
                </p>
            </div>
        </>
    );
}

// ── Contrato Arriendo ─────────────────────────────────────────────────────────

function PlantillaArriendo({ d }: { d: ContratoArriendoData }) {
    return (
        <>
            <div className="space-y-4 text-[11px] text-slate-800 leading-relaxed">
                <p>
                    En <strong>{d.vendedor_ciudad}</strong>, a <strong>{d.fecha}</strong>,{' '}
                    <strong>Rentmontt SpA.</strong> (en adelante el «Arrendador»), representado legalmente por su
                    Gerente, RUT <strong>77.294.859-K</strong>, da en arriendo al Sr./Sra.{' '}
                    <strong className="underline">{d.comprador_nombre}</strong>, RUT{' '}
                    <strong>{d.comprador_rut}</strong>, domiciliado en{' '}
                    <strong>{d.comprador_domicilio || '___________________________'}</strong>, teléfono{' '}
                    <strong>{d.comprador_telefono || '_______________'}</strong> (en adelante el «Arrendatario»),
                    el vehículo <strong>{d.vehiculo_marca} {d.vehiculo_modelo}</strong>, Patente{' '}
                    <strong className="font-mono">{d.vehiculo_patente}</strong>, Color{' '}
                    <strong>{d.vehiculo_color}</strong>.
                </p>

                <p>
                    <strong>PRIMERO.-</strong> El plazo del arriendo será desde el{' '}
                    <strong>{d.fecha_salida}</strong> hasta el <strong>{d.fecha_retorno}</strong>, por un total
                    de <strong>{d.dias} día(s)</strong>.
                </p>

                <p>
                    <strong>SEGUNDO.-</strong> El valor total del arriendo es de{' '}
                    <strong>{cl(d.precio_total)}</strong> (equivalente a {cl(d.precio_dia)} por día), pagadero
                    en su totalidad al momento de la firma del presente contrato o según acuerdo entre las partes.
                </p>

                <p>
                    <strong>TERCERO.-</strong> El vehículo debe ser devuelto en las mismas condiciones en que fue
                    entregado, sin daños adicionales a los registrados al inicio del arriendo. El arrendatario
                    asume responsabilidad total por cualquier daño, multa de tránsito o infracción generada durante
                    el período de arriendo.
                </p>

                <p>
                    <strong>CUARTO.-</strong> Queda expresamente prohibido al arrendatario subarrendar el
                    vehículo, utilizarlo para transporte remunerado de pasajeros, o conducirlo fuera del territorio
                    nacional sin autorización escrita del arrendador.
                </p>

                <p>
                    <strong>QUINTO.-</strong> El arrendatario declara conocer el estado actual del vehículo y
                    haberlo recibido en condiciones satisfactorias para el uso al que se destina. Cualquier
                    desperfecto mecánico o accidente deberá ser comunicado de inmediato al arrendador.
                </p>

                <p>
                    <strong>SEXTO.-</strong> En caso de atraso en la devolución del vehículo, el arrendatario
                    pagará un recargo equivalente a {cl(d.precio_dia)} por cada día adicional de retraso, sin
                    perjuicio de las acciones legales que pudieran corresponder.
                </p>

                <p>
                    <strong>SÉPTIMO.-</strong> Firman ambas partes en conformidad al presente Contrato de
                    Arrendamiento, en la ciudad de <strong>{d.vendedor_ciudad}</strong>, el día{' '}
                    <strong>{d.fecha}</strong>.
                </p>
            </div>
        </>
    );
}

// ── Componente Principal ───────────────────────────────────────────────────────

export const ContratoDocumento = forwardRef<HTMLDivElement, { data: ContratoData }>(
    ({ data: d }, ref) => {
        const esVenta = d.tipo === 'venta';
        const titulo = esVenta
            ? `CONTRATO DE COMPRAVENTA N° ${d.numero}`
            : `CONTRATO DE ARRENDAMIENTO DE VEHÍCULO N° ${d.numero}`;

        return (
            <div
                ref={ref}
                id="contrato-pdf"
                className="bg-white text-slate-900 font-sans"
                style={{
                    width: '794px',
                    minHeight: '1123px',
                    padding: '48px 56px',
                    boxSizing: 'border-box',
                    fontFamily: 'Arial, Helvetica, sans-serif',
                }}
            >
                {/* ── ENCABEZADO ────────────────────────────────────────── */}
                <div className="flex items-start justify-between border-b-2 border-slate-800 pb-4 mb-6">
                    <div>
                        <h1 className="text-lg font-black text-slate-900 uppercase tracking-tight">
                            RentMontt
                        </h1>
                        <p className="text-[10px] text-slate-500 mt-0.5">Rentmontt SpA.</p>
                        <p className="text-[10px] text-slate-500">RUT: 77.294.859-K</p>
                    </div>
                    <div className="text-right">
                        <p className="text-[10px] text-slate-500">{d.vendedor_email}</p>
                        <p className="text-[10px] text-slate-500">+569 9265 7540</p>
                        <p className="text-[10px] text-slate-500">Puerto Montt, Chile</p>
                    </div>
                </div>

                {/* ── TÍTULO ────────────────────────────────────────────── */}
                <div className="text-center mb-6">
                    <h2 className="text-[13px] font-black text-slate-900 uppercase tracking-wide">
                        {titulo}
                    </h2>
                    <p className="text-[10px] text-slate-500 mt-1">Fecha: {d.fecha}</p>
                </div>

                {/* ── PARTES ────────────────────────────────────────────── */}
                <div className="grid grid-cols-2 gap-4 mb-6 text-[10px]">
                    <div className="border border-slate-200 rounded-lg p-3">
                        <p className="font-black text-slate-700 uppercase text-[9px] tracking-widest mb-1.5">
                            {esVenta ? 'VENDEDOR' : 'ARRENDADOR'}
                        </p>
                        <p className="font-bold">{d.vendedor_nombre}</p>
                        <p className="text-slate-500">RUT: {d.vendedor_rut}</p>
                        <p className="text-slate-500">{d.vendedor_ciudad}</p>
                        <p className="text-slate-500">{d.vendedor_fono}</p>
                    </div>
                    <div className="border border-slate-200 rounded-lg p-3">
                        <p className="font-black text-slate-700 uppercase text-[9px] tracking-widest mb-1.5">
                            {esVenta ? 'COMPRADOR' : 'ARRENDATARIO'}
                        </p>
                        <p className="font-bold">{d.comprador_nombre}</p>
                        <p className="text-slate-500">RUT: {d.comprador_rut || '_______________'}</p>
                        <p className="text-slate-500">{d.comprador_domicilio || 'Domicilio: _______________'}</p>
                        <p className="text-slate-500">{d.comprador_telefono || 'Tel: _______________'}</p>
                    </div>
                </div>

                {/* ── CUERPO CONDICIONAL ────────────────────────────────── */}
                {esVenta
                    ? <PlantillaVenta d={d as ContratoVentaData} />
                    : <PlantillaArriendo d={d as ContratoArriendoData} />
                }

                {/* ── FIRMAS ────────────────────────────────────────────── */}
                <div className="mt-10 grid grid-cols-2 gap-8">
                    {/* Vendedor/Arrendador */}
                    <div className="text-center space-y-1">
                        <div className="h-16 border-b border-slate-400 mb-1" />
                        <p className="text-[10px] font-bold text-slate-700 uppercase">
                            {esVenta ? 'VENDEDOR' : 'ARRENDADOR'}
                        </p>
                        <p className="text-[9px] text-slate-500">{d.vendedor_nombre}</p>
                        <p className="text-[9px] text-slate-500">RUT: {d.vendedor_rut}</p>
                    </div>
                    {/* Comprador/Arrendatario */}
                    <div className="text-center space-y-1">
                        {d.firma_base64 ? (
                            <div className="h-16 flex items-end justify-center mb-1 border-b border-slate-400">
                                {/* eslint-disable-next-line @next/next/no-img-element */}
                                <img
                                    src={d.firma_base64}
                                    alt="Firma"
                                    className="max-h-14 max-w-full object-contain"
                                />
                            </div>
                        ) : (
                            <div className="h-16 border-b border-slate-400 mb-1" />
                        )}
                        <p className="text-[10px] font-bold text-slate-700 uppercase">
                            {esVenta ? 'COMPRADOR' : 'ARRENDATARIO'}
                        </p>
                        <p className="text-[9px] text-slate-500">{d.comprador_nombre}</p>
                        <p className="text-[9px] text-slate-500">RUT: {d.comprador_rut || '_______________'}</p>
                    </div>
                </div>

                {/* ── PIE DE PÁGINA ─────────────────────────────────────── */}
                <div className="mt-8 pt-3 border-t border-slate-200 text-[9px] text-slate-400 text-center">
                    Documento generado electrónicamente por Flusize — Rentmontt SpA. — RUT 77.294.859-K — Puerto Montt
                </div>
            </div>
        );
    }
);

ContratoDocumento.displayName = 'ContratoDocumento';

export type { ContratoData, ContratoVentaData, ContratoArriendoData };
