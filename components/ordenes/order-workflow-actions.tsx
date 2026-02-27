'use client';

import { Button } from '@/components/ui/button';
import { Plus, CheckCircle, Play } from 'lucide-react';

interface OrderWorkflowActionsProps {
    order: {
        id: string | number;
        estado: string;
    };
    checklist: any;
    onOpenChecklist: (orderId: string, mode: 'checklist' | 'readonly_ingreso' | 'salida') => void;
    onUpdateStatus: (orderId: string, newStatus: string) => void;
    isLoading?: boolean;
}

export function OrderWorkflowActions({
    order,
    checklist,
    onOpenChecklist,
    onUpdateStatus,
    isLoading
}: OrderWorkflowActionsProps) {
    if (!order) return null;

    if (!checklist) {
        return (
            <Button
                onClick={(e) => {
                    e.stopPropagation();
                    onOpenChecklist(String(order.id), 'checklist');
                }}
                className="bg-slate-800 hover:bg-slate-700 text-slate-300 w-full sm:w-auto"
                disabled={isLoading}
            >
                <Plus className="w-4 h-4 mr-2" />
                Crear Checklist Ingreso
            </Button>
        );
    }

    const isReviewed = !!checklist.revisado_por_mecanico_at;
    const isSalidaConfirmed = !!checklist.confirmado_salida_en;

    if (isReviewed) {
        const isEnProceso = order.estado === 'en_proceso';
        const isPendiente = order.estado === 'pendiente';

        return (
            <div className="text-center space-y-2 w-full sm:w-auto">
                <div className="flex items-center justify-center gap-2 text-emerald-400 text-xs font-semibold uppercase tracking-wider mb-1">
                    <CheckCircle className="w-4 h-4" />
                    {isSalidaConfirmed ? 'Salida Revisada' : 'Ingreso Revisado'}
                </div>

                {isPendiente && (
                    <Button
                        onClick={(e) => {
                            e.stopPropagation();
                            onUpdateStatus(String(order.id), 'en_proceso');
                        }}
                        className="bg-indigo-600 hover:bg-indigo-500 text-white w-full sm:w-auto mb-2 animate-pulse"
                        disabled={isLoading}
                    >
                        🛠️ Empezar Reparación
                    </Button>
                )}

                {isEnProceso && (
                    <Button
                        onClick={(e) => {
                            e.stopPropagation();
                            onUpdateStatus(String(order.id), 'completada');
                        }}
                        className="bg-blue-600 hover:bg-blue-500 text-white w-full sm:w-auto mb-2"
                        disabled={isLoading}
                    >
                        🏁 Terminar Trabajo
                    </Button>
                )}

                {!isEnProceso && !isPendiente && (
                    <Button
                        onClick={(e) => {
                            e.stopPropagation();
                            onOpenChecklist(String(order.id), 'salida');
                        }}
                        className="bg-emerald-600 hover:bg-emerald-500 text-white w-full sm:w-auto"
                        disabled={isLoading}
                    >
                        ✅ Checklist Salida / Entrega
                    </Button>
                )}
            </div>
        );
    } else {
        return (
            <div className="text-center space-y-2 w-full sm:w-auto">
                <div className="text-xs text-orange-400 mb-1">
                    ⚠️ Confirmación Pendiente
                </div>
                <Button
                    onClick={(e) => {
                        e.stopPropagation();
                        onOpenChecklist(String(order.id), 'readonly_ingreso');
                    }}
                    className="bg-blue-600 hover:bg-blue-500 text-white w-full sm:w-auto animate-pulse"
                    disabled={isLoading}
                >
                    👁️ Ver Ingreso para Confirmar
                </Button>
            </div>
        );
    }
}
