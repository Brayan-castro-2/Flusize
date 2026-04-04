'use client';

import { Button } from '@/components/ui/button';
import { Play, CheckCircle, Camera, CheckSquare, Plus } from 'lucide-react';

interface OrderWorkflowActionsProps {
    order: {
        id: string | number;
        estado: string;
    };
    checklist: any;
    onOpenChecklist: (orderId: string, mode: 'checklist' | 'readonly_ingreso' | 'salida') => void;
    onUpdateStatus: (orderId: string, newStatus: string) => void;
    onOpenBitacora?: (orderId: string) => void;
    isLoading?: boolean;
}

export function OrderWorkflowActions({
    order,
    checklist,
    onOpenChecklist,
    onUpdateStatus,
    onOpenBitacora,
    isLoading
}: OrderWorkflowActionsProps) {
    if (!order) return null;

    const isSalidaConfirmed = checklist && !!checklist.confirmado_salida_en;
    const isEnProceso = order.estado === 'en_proceso';
    const isPendiente = order.estado === 'pendiente';
    const isCompletada = order.estado === 'completada';

    return (
        <div className="w-full flex flex-wrap gap-2 items-center">
            {/* 1. Primary: Estado de Proceso */}
            {isPendiente && (
                <Button
                    onClick={(e) => {
                        e.stopPropagation();
                        onUpdateStatus(String(order.id), 'en_proceso');
                    }}
                    className="bg-blue-600 hover:bg-blue-500 text-white sm:w-auto md:px-6 shadow-md shadow-blue-600/20 h-12 text-base font-bold animate-in zoom-in duration-300"
                    disabled={isLoading}
                >
                    <Play className="w-5 h-5 mr-2 fill-current" />
                    Empezar Reparación
                </Button>
            )}

            {isEnProceso && (
                <Button
                    onClick={(e) => {
                        e.stopPropagation();
                        onUpdateStatus(String(order.id), 'completada');
                    }}
                    className="bg-emerald-600 hover:bg-emerald-500 text-white sm:w-auto md:px-5 h-12 text-base font-bold shadow-md shadow-emerald-600/20"
                    disabled={isLoading}
                >
                    <CheckCircle className="w-5 h-5 mr-2" />
                    Terminar Trabajo
                </Button>
            )}

            {/* 2. Checklist de Ingreso */}
            {!isSalidaConfirmed && (
                <Button
                    onClick={(e) => {
                        e.stopPropagation();
                        onOpenChecklist(String(order.id), 'checklist');
                    }}
                    variant="outline"
                    className="border-slate-300 bg-white dark:bg-slate-800 dark:border-slate-700 hover:bg-slate-50 dark:hover:bg-slate-700 text-slate-700 dark:text-slate-200 sm:w-auto h-12 font-semibold"
                    disabled={isLoading}
                >
                    <CheckSquare className="w-5 h-5 mr-2 text-slate-500" />
                    Checklist Ingreso
                </Button>
            )}

            {/* 3. Añadir Avance a la Bitácora */}
            {(isPendiente || isEnProceso || isCompletada) && onOpenBitacora && (
                <Button
                    onClick={(e) => {
                        e.stopPropagation();
                        onOpenBitacora(String(order.id));
                    }}
                    variant="outline"
                    className="border-violet-300 bg-violet-50 dark:bg-violet-950/20 dark:border-violet-700 hover:bg-violet-100 text-violet-700 dark:text-violet-300 sm:w-auto h-12 font-semibold"
                    disabled={isLoading}
                >
                    <Plus className="w-5 h-5 mr-2" />
                    Añadir Avance
                </Button>
            )}

            {/* Checklist Final */}
            {(!isEnProceso && !isPendiente && !isSalidaConfirmed) && (
                <Button
                    onClick={(e) => {
                        e.stopPropagation();
                        onOpenChecklist(String(order.id), 'salida');
                    }}
                    className="bg-emerald-600 hover:bg-emerald-500 text-white sm:w-auto h-12 font-semibold"
                    disabled={isLoading}
                >
                    <CheckSquare className="w-5 h-5 mr-2" />
                    Checklist Final Entrega
                </Button>
            )}

            {isSalidaConfirmed && (
                <div className="flex items-center gap-2 text-emerald-600 text-sm font-bold uppercase tracking-wider bg-emerald-50 dark:bg-emerald-400/10 px-4 py-3 rounded-xl border border-emerald-200 dark:border-emerald-400/20">
                    <CheckCircle className="w-5 h-5" />
                    Salida Confirmada
                </div>
            )}
        </div>
    );
}


