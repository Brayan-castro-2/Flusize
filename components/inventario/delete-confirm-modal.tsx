'use client';

import { X, AlertTriangle, Trash2, Loader2 } from 'lucide-react';
import { motion, AnimatePresence } from 'framer-motion';
import { useEffect } from 'react';

interface DeleteConfirmModalProps {
    isOpen: boolean;
    onClose: () => void;
    onConfirm: () => void;
    title?: string;
    description?: string;
    isDeleting?: boolean;
}

export default function DeleteConfirmModal({
    isOpen,
    onClose,
    onConfirm,
    title = "¿Eliminar este registro?",
    description = "Esta acción marcará el movimiento como eliminado. No se borrará permanentemente de la base de datos, pero afectará la visualización del inventario.",
    isDeleting = false
}: DeleteConfirmModalProps) {
    
    // Close on escape key
    useEffect(() => {
        const handleEscape = (e: KeyboardEvent) => {
            if (e.key === 'Escape' && isOpen && !isDeleting) onClose();
        };
        window.addEventListener('keydown', handleEscape);
        return () => window.removeEventListener('keydown', handleEscape);
    }, [isOpen, isDeleting, onClose]);

    return (
        <AnimatePresence>
            {isOpen && (
                <>
                    {/* Backdrop */}
                    <motion.div
                        initial={{ opacity: 0 }}
                        animate={{ opacity: 1 }}
                        exit={{ opacity: 0 }}
                        onClick={() => !isDeleting && onClose()}
                        className="fixed inset-0 z-[100] bg-slate-900/60 backdrop-blur-sm"
                    />
                    
                    {/* Modal */}
                    <div className="fixed inset-0 z-[101] flex items-center justify-center p-4 pointer-events-none">
                        <motion.div
                            initial={{ opacity: 0, scale: 0.95, y: 20 }}
                            animate={{ opacity: 1, scale: 1, y: 0 }}
                            exit={{ opacity: 0, scale: 0.95, y: 20 }}
                            className="w-full max-w-md bg-white rounded-2xl shadow-2xl border border-slate-100 pointer-events-auto overflow-hidden"
                        >
                            <div className="p-6">
                                <div className="flex items-start gap-4">
                                    <div className="flex-shrink-0 w-12 h-12 rounded-2xl bg-red-50 flex items-center justify-center text-red-600">
                                        <AlertTriangle className="w-6 h-6" />
                                    </div>
                                    <div className="flex-1">
                                        <h3 className="text-lg font-black text-slate-800 mb-1">
                                            {title}
                                        </h3>
                                        <p className="text-sm text-slate-500 leading-relaxed font-medium">
                                            {description}
                                        </p>
                                    </div>
                                    <button 
                                        onClick={() => !isDeleting && onClose()}
                                        className="text-slate-400 hover:text-slate-600 transition-colors p-1"
                                    >
                                        <X className="w-5 h-5" />
                                    </button>
                                </div>

                                <div className="mt-8 flex gap-3">
                                    <button
                                        onClick={() => !isDeleting && onClose()}
                                        disabled={isDeleting}
                                        className="flex-1 px-4 py-3 rounded-xl border border-slate-200 text-sm font-bold text-slate-600 hover:bg-slate-50 transition-all disabled:opacity-50"
                                    >
                                        Cancelar
                                    </button>
                                    <button
                                        onClick={onConfirm}
                                        disabled={isDeleting}
                                        className="flex-1 px-4 py-3 rounded-xl bg-red-600 text-white text-sm font-black hover:bg-red-700 shadow-lg shadow-red-200 transition-all flex items-center justify-center gap-2 disabled:opacity-70"
                                    >
                                        {isDeleting ? (
                                            <>
                                                <Loader2 className="w-4 h-4 animate-spin" />
                                                Eliminando...
                                            </>
                                        ) : (
                                            <>
                                                <Trash2 className="w-4 h-4" />
                                                Eliminar
                                            </>
                                        )}
                                    </button>
                                </div>
                            </div>
                        </motion.div>
                    </div>
                </>
            )}
        </AnimatePresence>
    );
}
