'use client';

import { useState, useEffect } from 'react';
import { X, FileText, Car, User, DollarSign, Calendar, Loader2, ChevronDown } from 'lucide-react';
import { Button } from '@/components/ui/button';
import { supabase } from '@/lib/supabase';
import { useAuth } from '@/contexts/auth-context';
import { toast } from 'sonner';

interface NuevoContratoFormProps {
    isOpen: boolean;
    onClose: () => void;
    onSuccess: (contratoId: string) => void;
    vehiculo: {
        id: string;
        patente: string;
        marca: string;
        modelo: string;
        color: string | null;
        anio: number | null;
        vin: string | null;
        precio_objetivo: number;
        destino_unidad?: string | null;
        precio_arriendo_dia?: number | null;
        fecha_salida?: string | null;
        fecha_retorno?: string | null;
        cliente_nombre?: string;
        taller_id: string;
        orden_id: string | null;
    };
    contratoToEdit?: any; // Añadido para edición
}

export function NuevoContratoForm({ isOpen, onClose, onSuccess, vehiculo, contratoToEdit }: NuevoContratoFormProps) {
    const { user } = useAuth();

    const tipoInicial = contratoToEdit?.tipo || (vehiculo.destino_unidad === 'Arriendo' ? 'arriendo' : 'venta');
    const [tipo, setTipo] = useState<'venta' | 'arriendo'>(tipoInicial);

    // Datos cliente
    const [clienteNombre, setClienteNombre] = useState(contratoToEdit?.cliente_nombre || vehiculo.cliente_nombre || '');
    const [clienteRut, setClienteRut] = useState(contratoToEdit?.cliente_rut || '');
    const [clienteDomicilio, setClienteDomicilio] = useState(contratoToEdit?.cliente_domicilio || '');
    const [clienteTelefono, setClienteTelefono] = useState(contratoToEdit?.cliente_telefono || '');

    // Datos comerciales (venta)
    const [precioTotal, setPrecioTotal] = useState(contratoToEdit?.precio_total?.toString() || vehiculo.precio_objetivo?.toString() || '');
    const [piePagado, setPiePagado] = useState(contratoToEdit?.pie_pagado?.toString() || '');
    const [saldoPendiente, setSaldoPendiente] = useState(contratoToEdit?.saldo_pendiente?.toString() || '');

    // Datos comerciales (arriendo)
    const [fechaSalida, setFechaSalida] = useState(contratoToEdit?.fecha_salida?.slice(0, 10) || vehiculo.fecha_salida?.slice(0, 10) || '');
    const [fechaRetorno, setFechaRetorno] = useState(contratoToEdit?.fecha_retorno?.slice(0, 10) || vehiculo.fecha_retorno?.slice(0, 10) || '');
    const [precioDia, setPrecioDia] = useState(contratoToEdit?.precio_dia?.toString() || vehiculo.precio_arriendo_dia?.toString() || '');

    const [notas, setNotas] = useState(contratoToEdit?.notas || '');
    const [guardando, setGuardando] = useState(false);
    
    // Datos legales del vendedor/usuario
    const [vendedorLegal, setVendedorLegal] = useState<{ nombre: string; rut: string } | null>(null);

    useEffect(() => {
        if (user?.id) fetchVendedorLegal();
    }, [user?.id]);

    const fetchVendedorLegal = async () => {
        try {
            const { data } = await supabase
                .from('perfiles')
                .select('nombre_legal, rut_legal')
                .eq('id', user?.id)
                .single();
            if (data?.nombre_legal) {
                setVendedorLegal({
                    nombre: data.nombre_legal,
                    rut: data.rut_legal || ''
                });
            }
        } catch (e) {
            console.error('Error fetching legal data:', e);
        }
    };

    const dias = fechaSalida && fechaRetorno
        ? Math.max(1, Math.ceil((new Date(fechaRetorno).getTime() - new Date(fechaSalida).getTime()) / 86400000))
        : 0;

    const precioTotalArriendo = dias && precioDia ? dias * parseFloat(precioDia || '0') : parseFloat(precioTotal || '0');

    const handleSaldo = () => {
        const total = parseFloat(precioTotal || '0');
        const pie = parseFloat(piePagado || '0');
        setSaldoPendiente((total - pie).toString());
    };

    const guardar = async () => {
        // Validaciones dinámicas según tipo
        if (!clienteNombre.trim()) { toast.error('El nombre del cliente es obligatorio'); return; }
        
        const totalAValidar = tipo === 'arriendo' ? precioTotalArriendo : parseFloat(precioTotal || '0');
        if (!totalAValidar || totalAValidar <= 0) { 
            toast.error(tipo === 'arriendo' ? 'El cálculo de arriendo no puede ser 0. Revisa fechas y precio/día.' : 'El precio total de venta es obligatorio'); 
            return; 
        }
        
        if (tipo === 'arriendo' && (!fechaSalida || !fechaRetorno)) { toast.error('Las fechas de arriendo son obligatorias'); return; }

        if (!vendedorLegal?.nombre) {
            const proceed = confirm('⚠️ No has configurado tus "Datos Legales" en la sección de contratos. El documento se generará con datos genéricos de la empresa. ¿Deseas continuar?');
            if (!proceed) return;
        }

        setGuardando(true);
        try {
            // --- CRM Auto-Sync Logic ---
            if (clienteRut && clienteNombre) {
                const { data: existingCliente } = await supabase
                    .from('clientes')
                    .select('id')
                    .eq('rut_dni', clienteRut)
                    .eq('taller_id', vehiculo.taller_id)
                    .maybeSingle();

                if (!existingCliente) {
                    console.log('🔍 Cliente no encontrado en CRM, creando automáticamente...');
                    const { error: syncError } = await supabase.from('clientes').insert({
                        taller_id: vehiculo.taller_id,
                        nombre_completo: clienteNombre,
                        rut_dni: clienteRut,
                        telefono: clienteTelefono,
                        direccion: clienteDomicilio,
                        creado_en: new Date().toISOString()
                    });
                    
                    if (syncError) {
                        console.warn('⚠️ No se pudo sincronizar automáticamente con el CRM:', syncError.message);
                    } else {
                        toast.info('🆕 Nuevo cliente añadido al CRM automáticamente');
                    }
                }
            }

            let finalOrdenId = contratoToEdit?.orden_id || vehiculo.orden_id || null;
            
            // Generar una orden "dummy" si no existe, para que funcione el Tracking Link de forma obligigatoria
            if (!finalOrdenId) {
                const reqOrden = await supabase.from('ordenes').insert({
                    taller_id: vehiculo.taller_id,
                    patente_vehiculo: vehiculo.patente,
                    tipo_orden: tipo,
                    estado: 'en_proceso',
                    fecha_ingreso: new Date().toISOString(),
                    eta_entrega: tipo === 'arriendo' && fechaRetorno ? new Date(fechaRetorno).toISOString() : null,
                    precio_total: tipo === 'arriendo' ? precioTotalArriendo : parseFloat(precioTotal || '0'),
                    descripcion_problema: tipo === 'arriendo' ? `Arriendo: ${dias} días` : 'Venta de vehículo',
                    notas_publicas: 'Orden generada para firma de contrato'
                }).select('id').single();
                
                if (reqOrden.data?.id) finalOrdenId = reqOrden.data.id;
            }

            const payload: Record<string, any> = {
                tipo,
                estado: 'pendiente_firma',
                taller_id: vehiculo.taller_id,
                orden_id: finalOrdenId,
                vehiculo_flota_id: vehiculo.id,
                patente: vehiculo.patente,           // columna original NOT NULL
                vehiculo_patente: vehiculo.patente,
                vehiculo_marca: vehiculo.marca,
                vehiculo_modelo: vehiculo.modelo,
                vehiculo_color: vehiculo.color || '',
                vehiculo_anio: vehiculo.anio ? String(vehiculo.anio) : '',
                vehiculo_motor: vehiculo.vin || '',
                cliente_nombre: clienteNombre,
                cliente_rut: clienteRut,
                cliente_domicilio: clienteDomicilio,
                cliente_telefono: clienteTelefono,
                precio_total: tipo === 'arriendo' ? precioTotalArriendo : parseFloat(precioTotal),
                notas,
                creado_por: user?.name || user?.id || 'admin',
                vendedor_nombre: vendedorLegal?.nombre || null,
                vendedor_rut: vendedorLegal?.rut || null,
                creado_en: new Date().toISOString(),
                actualizado_en: new Date().toISOString(),
            };

            // Capturar firma del vendedor actual
            if (user?.id) {
                const { data: perfilInfo } = await supabase.from('perfiles').select('firma_base64').eq('id', user.id).single();
                if (perfilInfo?.firma_base64) {
                    payload.vendedor_firma_base64 = perfilInfo.firma_base64;
                }
            }

            if (tipo === 'venta') {
                payload.pie_pagado = parseFloat(piePagado || '0');
                payload.saldo_pendiente = parseFloat(saldoPendiente || '0');
            } else {
                payload.precio_dia = parseFloat(precioDia || '0');
                payload.fecha_salida = fechaSalida;
                payload.fecha_retorno = fechaRetorno;
                payload.dias = dias;
            }

            let insertedId = contratoToEdit?.id;

            if (contratoToEdit?.id) {
                // Update
                delete payload.creado_por; // No sobreescribir
                delete payload.creado_en; // No sobreescribir
                payload.actualizado_en = new Date().toISOString();
                const { error } = await supabase.from('contratos').update(payload).eq('id', contratoToEdit.id);
                if (error) throw error;
                toast.success('✅ Contrato actualizado');
            } else {
                // Insert
                const { data, error } = await supabase.from('contratos').insert(payload).select('id').single();
                if (error) throw error;
                insertedId = data.id;
                toast.success('✅ Contrato creado — listo para enviar al cliente');
            }

            // --- CRM / Flota Sync ---
            if (tipo === 'venta' && insertedId) {
                console.log('🔄 Sincronizando estado de venta en flota y vehículos...');
                // 1. Actualizar estado en Flota
                await supabase
                    .from('flota')
                    .update({ 
                        estado: 'Vendido',
                        // Opcional: Vincular cliente_id si lo tenemos
                    })
                    .eq('patente', vehiculo.patente)
                    .eq('taller_id', vehiculo.taller_id);

                // 2. Marcar como vendido en tabla CRM (Vehículos)
                await supabase
                    .from('vehiculos')
                    .update({ fue_vendido: true })
                    .eq('patente', vehiculo.patente)
                    .eq('taller_id', vehiculo.taller_id);
            }

            onSuccess(insertedId);
            onClose();
        } catch (err: any) {
            toast.error('Error al guardar contrato: ' + (err?.message || err));
            console.error(err);
        }
        setGuardando(false);
    };

    if (!isOpen) return null;

    return (
        <div className="fixed inset-0 z-[60] flex items-center justify-center p-3 bg-black/80 backdrop-blur-sm"
            onClick={e => e.target === e.currentTarget && onClose()}>
            <div className="bg-white rounded-2xl w-full max-w-lg max-h-[95vh] overflow-y-auto shadow-2xl flex flex-col">
                {/* Header */}
                <div className="flex items-center justify-between px-5 py-4 border-b border-slate-200 shrink-0">
                    <div className="flex items-center gap-2">
                        <div className="p-2 bg-blue-50 rounded-xl">
                            <FileText className="w-4 h-4 text-blue-600" />
                        </div>
                        <div>
                            <h2 className="font-black text-slate-900 text-base leading-tight">Nuevo Contrato</h2>
                            <p className="text-xs text-slate-500 font-mono">{vehiculo.patente} — {vehiculo.marca} {vehiculo.modelo}</p>
                        </div>
                    </div>
                    <button onClick={onClose} className="p-2 text-slate-400 hover:text-slate-700 hover:bg-slate-100 rounded-xl transition-colors">
                        <X className="w-4 h-4" />
                    </button>
                </div>

                <div className="p-5 space-y-5">
                    {/* Tipo */}
                    <div>
                        <label className="text-xs font-bold text-slate-500 uppercase tracking-widest mb-2 block">Tipo de Contrato</label>
                        <div className="grid grid-cols-2 gap-2">
                            {(['venta', 'arriendo'] as const).map(t => (
                                <button key={t} onClick={() => setTipo(t)}
                                    className={`py-2.5 rounded-xl font-bold text-sm capitalize border-2 transition-all ${tipo === t
                                        ? 'border-blue-600 bg-blue-600 text-white'
                                        : 'border-slate-200 text-slate-600 hover:border-blue-300'
                                    }`}>
                                    {t === 'venta' ? '🤝 Compraventa' : '🚗 Arriendo'}
                                </button>
                            ))}
                        </div>
                    </div>

                    {/* Vehículo (read-only) */}
                    <div className="bg-slate-50 rounded-xl p-4 border border-slate-200">
                        <p className="text-xs font-bold text-slate-500 uppercase tracking-widest mb-2 flex items-center gap-1.5">
                            <Car className="w-3.5 h-3.5" /> Vehículo
                        </p>
                        <div className="grid grid-cols-2 gap-2 text-sm text-slate-700">
                            <div><span className="text-slate-400 text-xs">Patente</span><p className="font-mono font-bold">{vehiculo.patente}</p></div>
                            <div><span className="text-slate-400 text-xs">Vehículo</span><p className="font-semibold">{vehiculo.marca} {vehiculo.modelo}</p></div>
                            <div><span className="text-slate-400 text-xs">Color</span><p>{vehiculo.color || '—'}</p></div>
                            <div><span className="text-slate-400 text-xs">Año</span><p>{vehiculo.anio || '—'}</p></div>
                        </div>
                    </div>

                    {/* Cliente */}
                    <div>
                        <p className="text-xs font-bold text-slate-500 uppercase tracking-widest mb-3 flex items-center gap-1.5">
                            <User className="w-3.5 h-3.5" /> Datos del Cliente
                        </p>
                        <div className="space-y-3">
                            <div>
                                <label className="text-xs font-semibold text-slate-600 mb-1 block">Nombre completo *</label>
                                <input value={clienteNombre} onChange={e => setClienteNombre(e.target.value)}
                                    placeholder="Ej: Juan Pérez González"
                                    className="w-full rounded-xl border border-slate-300 bg-slate-50 px-3 py-2.5 text-sm text-slate-900 placeholder:text-slate-400 focus:border-blue-500 focus:ring-1 focus:ring-blue-500 outline-none" />
                            </div>
                            <div className="grid grid-cols-2 gap-3">
                                <div>
                                    <label className="text-xs font-semibold text-slate-600 mb-1 block">RUT</label>
                                    <input value={clienteRut} onChange={e => setClienteRut(e.target.value)}
                                        placeholder="12.345.678-9"
                                        className="w-full rounded-xl border border-slate-300 bg-slate-50 px-3 py-2.5 text-sm text-slate-900 placeholder:text-slate-400 focus:border-blue-500 focus:ring-1 focus:ring-blue-500 outline-none" />
                                </div>
                                <div>
                                    <label className="text-xs font-semibold text-slate-600 mb-1 block">Teléfono</label>
                                    <input value={clienteTelefono} onChange={e => setClienteTelefono(e.target.value)}
                                        placeholder="+56 9 1234 5678"
                                        className="w-full rounded-xl border border-slate-300 bg-slate-50 px-3 py-2.5 text-sm text-slate-900 placeholder:text-slate-400 focus:border-blue-500 focus:ring-1 focus:ring-blue-500 outline-none" />
                                </div>
                            </div>
                            <div>
                                <label className="text-xs font-semibold text-slate-600 mb-1 block">Domicilio</label>
                                <input value={clienteDomicilio} onChange={e => setClienteDomicilio(e.target.value)}
                                    placeholder="Ej: Av. Los Álamos 123, Puerto Montt"
                                    className="w-full rounded-xl border border-slate-300 bg-slate-50 px-3 py-2.5 text-sm text-slate-900 placeholder:text-slate-400 focus:border-blue-500 focus:ring-1 focus:ring-blue-500 outline-none" />
                            </div>
                        </div>
                    </div>

                    {/* Variables comerciales */}
                    <div>
                        <p className="text-xs font-bold text-slate-500 uppercase tracking-widest mb-3 flex items-center gap-1.5">
                            <DollarSign className="w-3.5 h-3.5" /> {tipo === 'venta' ? 'Condiciones de Venta' : 'Condiciones de Arriendo'}
                        </p>

                        {tipo === 'venta' ? (
                            <div className="space-y-3">
                                <div>
                                    <label className="text-xs font-semibold text-slate-600 mb-1 block">Precio Total *</label>
                                    <input type="number" value={precioTotal} onChange={e => { setPrecioTotal(e.target.value); }}
                                        placeholder="Ej: 8500000"
                                        className="w-full rounded-xl border border-slate-300 bg-slate-50 px-3 py-2.5 text-sm text-slate-900 placeholder:text-slate-400 focus:border-blue-500 focus:ring-1 focus:ring-blue-500 outline-none" />
                                </div>
                                <div className="grid grid-cols-2 gap-3">
                                    <div>
                                        <label className="text-xs font-semibold text-slate-600 mb-1 block">Pie Pagado</label>
                                        <input type="number" value={piePagado} onChange={e => { setPiePagado(e.target.value); }}
                                            onBlur={handleSaldo}
                                            placeholder="Ej: 2000000"
                                            className="w-full rounded-xl border border-slate-300 bg-slate-50 px-3 py-2.5 text-sm text-slate-900 placeholder:text-slate-400 focus:border-blue-500 focus:ring-1 focus:ring-blue-500 outline-none" />
                                    </div>
                                    <div>
                                        <label className="text-xs font-semibold text-slate-600 mb-1 block">Saldo Pendiente</label>
                                        <input type="number" value={saldoPendiente} onChange={e => setSaldoPendiente(e.target.value)}
                                            placeholder="Auto-calculado"
                                            className="w-full rounded-xl border border-emerald-300 bg-emerald-50 px-3 py-2.5 text-sm text-slate-900 placeholder:text-slate-400 focus:border-emerald-500 focus:ring-1 focus:ring-emerald-500 outline-none" />
                                    </div>
                                </div>
                            </div>
                        ) : (
                            <div className="space-y-3">
                                <div className="grid grid-cols-2 gap-3">
                                    <div>
                                        <label className="text-xs font-semibold text-slate-600 mb-1 block flex items-center gap-1">
                                            <Calendar className="w-3 h-3" /> Fecha Salida *
                                        </label>
                                        <input type="date" value={fechaSalida} onChange={e => setFechaSalida(e.target.value)}
                                            className="w-full rounded-xl border border-slate-300 bg-slate-50 px-3 py-2.5 text-sm text-slate-900 focus:border-blue-500 focus:ring-1 focus:ring-blue-500 outline-none" />
                                    </div>
                                    <div>
                                        <label className="text-xs font-semibold text-slate-600 mb-1 block flex items-center gap-1">
                                            <Calendar className="w-3 h-3" /> Fecha Retorno *
                                        </label>
                                        <input type="date" value={fechaRetorno} onChange={e => setFechaRetorno(e.target.value)}
                                            className="w-full rounded-xl border border-slate-300 bg-slate-50 px-3 py-2.5 text-sm text-slate-900 focus:border-blue-500 focus:ring-1 focus:ring-blue-500 outline-none" />
                                    </div>
                                </div>
                                <div>
                                    <label className="text-xs font-semibold text-slate-600 mb-1 block">Precio por Día (CLP)</label>
                                    <input type="number" value={precioDia} onChange={e => setPrecioDia(e.target.value)}
                                        placeholder="Ej: 35000"
                                        className="w-full rounded-xl border border-slate-300 bg-slate-50 px-3 py-2.5 text-sm text-slate-900 placeholder:text-slate-400 focus:border-blue-500 focus:ring-1 focus:ring-blue-500 outline-none" />
                                </div>
                                {dias > 0 && (
                                    <div className="bg-blue-50 border border-blue-200 rounded-xl p-3 flex items-center justify-between">
                                        <span className="text-sm text-blue-700 font-medium">{dias} día(s)</span>
                                        <span className="font-black text-blue-800">
                                            {precioTotalArriendo.toLocaleString('es-CL', { style: 'currency', currency: 'CLP', maximumFractionDigits: 0 })}
                                        </span>
                                    </div>
                                )}
                            </div>
                        )}
                    </div>

                    {/* Notas */}
                    <div>
                        <label className="text-xs font-semibold text-slate-600 mb-1 block">Notas internas (opcional)</label>
                        <textarea value={notas} onChange={e => setNotas(e.target.value)} rows={2}
                            placeholder="Observaciones, condiciones especiales..."
                            className="w-full rounded-xl border border-slate-300 bg-slate-50 px-3 py-2.5 text-sm text-slate-900 placeholder:text-slate-400 focus:border-blue-500 focus:ring-1 focus:ring-blue-500 outline-none resize-none" />
                    </div>
                </div>

                {/* Footer */}
                <div className="px-5 pb-5 pt-2 border-t border-slate-100 mt-auto flex gap-3 shrink-0">
                    <Button variant="outline" onClick={onClose} className="flex-1 border-slate-300 text-slate-700 rounded-xl h-11">
                        Cancelar
                    </Button>
                    <Button onClick={guardar} disabled={guardando}
                        className="flex-2 bg-blue-600 hover:bg-blue-700 text-white rounded-xl h-11 px-6 font-bold">
                        {guardando
                            ? <><Loader2 className="w-4 h-4 mr-2 animate-spin" />Guardando...</>
                            : '📋 Crear Contrato Pendiente'
                        }
                    </Button>
                </div>
            </div>
        </div>
    );
}
