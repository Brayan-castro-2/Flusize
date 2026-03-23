'use client';

import { Button } from '@/components/ui/button';
import { Plus, CheckCircle, Play, ShieldCheck, CheckSquare } from 'lucide-react';

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
            <div className="flex flex-col items-center w-full sm:w-auto animate-in fade-in duration-300">
                <div className="bg-blue-50/50 border border-blue-500/20 p-4 rounded-xl mb-4 max-w-sm text-left flex gap-3 items-start shadow-sm">
                    <ShieldCheck className="w-5 h-5 text-blue-500 shrink-0 mt-0.5" />
                    <p className="text-sm text-blue-900 leading-relaxed">
                        <span className="font-bold text-blue-700 block mb-1">💡 Tip para el taller:</span>
                        Usa el checklist para subir fotos de cómo llegó el vehículo (rayones, luces rotas). Esto respalda tu trabajo y evita reclamos injustos del cliente.
                    </p>
                </div>
                <Button
                    onClick={(e) => {
                        e.stopPropagation();
                        onOpenChecklist(String(order.id), 'checklist');
                    }}
                    className="bg-slate-800 hover:bg-slate-700 text-slate-300 w-full"
                    disabled={isLoading}
                >
                    <Plus className="w-4 h-4 mr-2" />
                    Agregar Ítem
                </Button>
            </div>
        );
    }

    const isSalidaConfirmed = !!checklist.confirmado_salida_en;

    const isEnProceso = order.estado === 'en_proceso';
    const isPendiente = order.estado === 'pendiente';

    return (
        <div className="text-center space-y-2 w-full sm:w-auto">
            {isSalidaConfirmed && (
                <div className="flex items-center justify-center gap-2 text-emerald-400 text-xs font-semibold uppercase tracking-wider mb-2">
                    <CheckCircle className="w-4 h-4" />
                    Salida Revisada
                </div>
            )}

            {isPendiente && (
                <Button
                    onClick={(e) => {
                        e.stopPropagation();
                        onUpdateStatus(String(order.id), 'en_proceso');
                    }}
                    className="bg-indigo-600 hover:bg-indigo-500 text-white w-full sm:w-auto mb-2 animate-pulse"
                    disabled={isLoading}
                >
                    <Play className="w-4 h-4 mr-2" />
                    Empezar Reparación
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
                    <CheckCircle className="w-4 h-4 mr-2" />
                    Terminar Trabajo
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
                    <CheckSquare className="w-4 h-4 mr-2" />
                    Checklist Salida / Entrega
                </Button>
            )}
        </div>
    );
}
