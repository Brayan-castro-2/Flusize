'use client';

import { useMemo, useState } from 'react';
import { OrdenDB } from '@/lib/storage-adapter';
import { DollarSign, AlertTriangle, ChevronDown, ChevronRight, Edit, Calendar } from 'lucide-react';
import { Card } from '@/components/ui/card';
import { NewBadge } from '@/components/ui/new-badge';
import { FEATURE_FLAGS } from '@/config/modules';
import Link from 'next/link';
import { Button } from '@/components/ui/button';
import {
    Collapsible,
    CollapsibleContent,
    CollapsibleTrigger,
} from '@/components/ui/collapsible';

interface DebtSummaryCardProps {
    orders: OrdenDB[];
}

function formatCurrency(value: number): string {
    return `$${value.toLocaleString('es-CL')}`;
}

function formatDate(dateString: string): string {
    const date = new Date(dateString);
    return date.toLocaleDateString('es-CL', { day: '2-digit', month: '2-digit', year: 'numeric' });
}

export function DebtSummaryCard({ orders }: DebtSummaryCardProps) {
    const [isOpen, setIsOpen] = useState(false);

    const debtData = useMemo(() => {
        const ordersWithDebt = orders.filter(order => {
            // V3 Logic: metodo_pago string - Soporta pagos parciales (ej: "efectivo, debe")
            return order.metodo_pago?.includes('debe');
        }).map(order => {
            // New logic: Sum only the amounts marked as 'debe' in the metodos_pago array
            let calculatedDebt = 0;
            if (order.metodos_pago && Array.isArray(order.metodos_pago)) {
                calculatedDebt = order.metodos_pago
                    .filter(mp => mp.metodo === 'debe')
                    .reduce((sum, mp) => sum + (mp.monto || 0), 0);
            } else {
                // Legacy fallback: Use total price if metodo_pago string mentions 'debe'
                calculatedDebt = order.precio_total || 0;
            }

            return {
                ...order,
                debtAmount: calculatedDebt,
            };
        }).sort((a, b) => b.debtAmount - a.debtAmount);

        const totalDebt = ordersWithDebt.reduce((sum, order) => sum + order.debtAmount, 0);

        return {
            totalDebt,
            debtCount: ordersWithDebt.length,
            orders: ordersWithDebt,
        };
    }, [orders]);

    return (
        <Collapsible open={isOpen} onOpenChange={setIsOpen}>
            <Card className="bg-white border-red-200 shadow-sm relative overflow-hidden">
                {/* Background decoration */}
                <div className="absolute top-0 right-0 w-32 h-32 bg-red-500/5 rounded-full -translate-y-1/2 translate-x-1/2" />

                <CollapsibleTrigger className="w-full p-6 text-left">
                    <div className="relative">
                        <div className="flex items-center justify-between mb-4">
                            <h3 className="text-lg font-semibold text-slate-900 flex items-center gap-2">
                                <AlertTriangle className="w-5 h-5 text-red-500" />
                                Total por Cobrar
                                {FEATURE_FLAGS.showNewBadges && <NewBadge />}
                            </h3>
                            <div className="flex items-center gap-2">
                                {debtData.debtCount > 0 && (
                                    <span className="text-xs text-slate-500">
                                        Click para {isOpen ? 'ocultar' : 'ver'} detalles
                                    </span>
                                )}
                                {isOpen ? (
                                    <ChevronDown className="w-5 h-5 text-slate-400" />
                                ) : (
                                    <ChevronRight className="w-5 h-5 text-slate-400" />
                                )}
                            </div>
                        </div>

                        <div className="space-y-4">
                            {/* Total Amount */}
                            <div>
                                <div className="text-4xl font-bold text-red-600 mb-1">
                                    {formatCurrency(debtData.totalDebt)}
                                </div>
                                <p className="text-sm text-slate-500">
                                    En {debtData.debtCount} {debtData.debtCount === 1 ? 'orden' : 'órdenes'}
                                </p>
                            </div>

                            {/* Warning Message */}
                            {debtData.totalDebt > 0 && (
                                <div className="bg-red-50 border border-red-100 rounded-lg p-3">
                                    <div className="flex items-start gap-2">
                                        <DollarSign className="w-4 h-4 text-red-500 mt-0.5 flex-shrink-0" />
                                        <p className="text-xs text-red-700">
                                            Utilice esta información para gestionar la deuda de sus clientes.
                                        </p>
                                    </div>
                                </div>
                            )}

                            {debtData.totalDebt === 0 && (
                                <div className="bg-green-500/10 border border-green-500/30 rounded-lg p-3">
                                    <p className="text-xs text-green-200 text-center">
                                        ✓ No hay deudas pendientes
                                    </p>
                                </div>
                            )}
                        </div>
                    </div>
                </CollapsibleTrigger>

                <CollapsibleContent>
                    <div className="px-6 pb-6 pt-2">
                        <div className="border-t border-red-100 pt-4">
                            <h4 className="text-sm font-semibold text-slate-900 mb-3">Órdenes con Deuda</h4>

                            <div className="space-y-2 max-h-96 overflow-y-auto">
                                {debtData.orders.map((order) => {
                                    const clientName = (order as any).cliente?.nombre_completo || order.cliente_nombre || 'Cliente S/R';
                                    const vehicleInfo = (order as any).vehiculos ? `${(order as any).vehiculos.marca} ${(order as any).vehiculos.modelo}` : 'Vehículo S/R';

                                    return (
                                        <div
                                            key={order.id}
                                            className="bg-white border border-slate-200 rounded-lg p-3 hover:bg-slate-50 transition-colors"
                                        >
                                            <div className="flex items-start justify-between gap-3">
                                                <div className="flex-1 min-w-0">
                                                    <div className="flex items-center flex-wrap gap-2 mb-1">
                                                        <span className="text-sm font-bold text-slate-900 truncate">
                                                            {clientName}
                                                        </span>
                                                        <span className="px-2 py-0.5 bg-slate-100 text-slate-600 rounded text-[10px] font-mono border border-slate-200">
                                                            {order.patente_vehiculo}
                                                        </span>
                                                        <span className={`px-2 py-0.5 rounded text-[10px] font-medium border ${order.estado === 'completada' ? 'bg-green-50 text-green-600 border-green-100' :
                                                            order.estado === 'pendiente' ? 'bg-amber-50 text-amber-600 border-amber-100' :
                                                                'bg-blue-50 text-blue-600 border-blue-100'
                                                            }`}>
                                                            {String(order.estado).toUpperCase()}
                                                        </span>
                                                    </div>

                                                    <p className="text-xs text-slate-500 mb-2 italic">
                                                        {vehicleInfo}
                                                    </p>

                                                    <div className="flex items-center gap-3 text-[11px] text-slate-400">
                                                        <div className="flex items-center gap-1">
                                                            <Calendar className="w-3 h-3" />
                                                            {formatDate(order.fecha_ingreso)}
                                                        </div>
                                                        <span>•</span>
                                                        <div className="flex items-center gap-1">
                                                            <span className="font-bold text-red-500 text-sm">
                                                                {formatCurrency(order.debtAmount)}
                                                            </span>
                                                        </div>
                                                    </div>
                                                </div>

                                                <div className="flex flex-col gap-2">
                                                    <Link href={`/admin/ordenes/clean?id=${order.id}`} prefetch>
                                                        <Button
                                                            size="sm"
                                                            variant="outline"
                                                            className="h-8 border-red-200 text-red-600 hover:bg-red-50 flex-shrink-0 w-full"
                                                        >
                                                            <Edit className="w-3 h-3 mr-1" />
                                                            Gestionar
                                                        </Button>
                                                    </Link>
                                                </div>
                                            </div>
                                        </div>
                                    );
                                })}
                            </div>
                        </div>
                    </div>
                </CollapsibleContent>
            </Card>
        </Collapsible>
    );
}
