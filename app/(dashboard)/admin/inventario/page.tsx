'use client';

import { useRouter } from 'next/navigation';
import { useState, useEffect, useRef } from 'react';
import { Download, Plus, Search, Filter, RefreshCw, ChevronDown, Trash2, Minus, AlertTriangle, MapPin, Settings, ShieldAlert, BarChart2, Package, X, FileText } from 'lucide-react';
import { motion } from 'framer-motion';
import { toast } from 'sonner';
import { useAuth } from '@/contexts/auth-context';
import { supabase } from '@/lib/supabase';
import FeatureGuard from '@/components/FeatureGuard';
import ModuleGuard from '@/components/guards/ModuleGuard';

import AddItemModal from '@/components/inventario/add-item-modal';
import * as XLSX from 'xlsx';
import jsPDF from 'jspdf';
import { toPng } from 'html-to-image';

// --- INLINE STUBS FOR MISSING COMPONENTS TO AVOID ERRORS ---
function QCModal(props: any) { return null; }
// function DeleteConfirmModal(props: any) { return null; } // Removed stub
import DeleteConfirmModal from '@/components/inventario/delete-confirm-modal';

function MaterialSettingsModal(props: any) { return null; }
function DateRangePicker(props: any) { return <div className="hidden">DateRangePicker</div>; }
// -----------------------------------------------------------


interface Material {
    codigo: string;
    stock_actual: number;
    stock_minimo: number;
    clase_abc?: string | null;
    ubicacion_por_defecto?: string | null;
    unidad_medida?: string;
    descripcion?: string | null;
    nombre?: string | null;
    categoria?: string | null;
}

interface InventoryMovement {
    id: string;
    anio: number;
    mes: number;
    semana: number;
    fecha: string;
    nro_guia_despacho?: string;
    codigo_producto: string;
    cantidad: number;
    tipo_movimiento: string;
    nota?: string;
    ubicacion?: string;
    productos?: Material | null;
    eliminado_en?: string | null;
}

export default function InventoryPage() {
    const { hasPermission, isLoading } = useAuth();
    
    if (isLoading) return null;
    
    if (!hasPermission('inventario.ver')) {
        return (
            <div className="flex flex-col items-center justify-center p-12 text-center bg-white rounded-2xl border border-slate-100 shadow-sm mt-8">
                <div className="w-16 h-16 bg-red-50 text-red-600 rounded-2xl flex items-center justify-center mb-4">
                    <ShieldAlert className="w-8 h-8" />
                </div>
                <h2 className="text-xl font-bold text-slate-800 mb-2">Acceso Denegado</h2>
                <p className="text-slate-500 max-w-md">No tienes permisos para ver el inventario. Contacta al administrador del taller.</p>
            </div>
        );
    }

    return (
        <ModuleGuard moduleName="inventario" toastMessage="El módulo de Inventario no está activado para este taller.">
            <InventoryContent />
        </ModuleGuard>
    );
}

function InventoryContent() {
    const [loading, setLoading] = useState(true);
    const [items, setItems] = useState<InventoryMovement[]>([]);

    // Filters & Pagination State
    const [searchTerm, setSearchTerm] = useState("");
    const [statusFilter, setStatusFilter] = useState<'ALL' | 'ENTRADA' | 'SALIDA' | 'AJUSTE'>('ALL');
    const [abcFilter, setAbcFilter] = useState<string>('ALL');
    const [stockStatusFilter, setStockStatusFilter] = useState<'ALL' | 'CRITICAL' | 'NORMAL'>('ALL');
    
    // UI State
    const [isModalOpen, setIsModalOpen] = useState(false);
    const [modalMode, setModalMode] = useState<'ENTRADA' | 'SALIDA'>('ENTRADA');
    
    const [statusDropdownOpen, setStatusDropdownOpen] = useState(false);
    const [abcDropdownOpen, setAbcDropdownOpen] = useState(false);
    const [stockStatusDropdownOpen, setStockStatusDropdownOpen] = useState(false);

    const { user, hasPermission } = useAuth();
    const [canDelete, setCanDelete] = useState(false);
    const [deleteModal, setDeleteModal] = useState({ isOpen: false, itemId: null as string | null });
    const [showDeleted, setShowDeleted] = useState(false);

    const [showTour, setShowTour] = useState(false);

    useEffect(() => {
        const tourSeen = localStorage.getItem('flusize_inventory_tour_seen');
        if (!tourSeen) {
            setShowTour(true);
        }
    }, []);

    const dismissTour = () => {
        localStorage.setItem('flusize_inventory_tour_seen', 'true');
        setShowTour(false);
    };

    const [qcModal, setQcModal] = useState({ isOpen: false, item: null as InventoryMovement | null });
    const [isSettingsModalOpen, setIsSettingsModalOpen] = useState(false);

    const [modalInitialData, setModalInitialData] = useState<any>(null);

    const router = useRouter();

    const statusDropdownRef = useRef<HTMLDivElement>(null);
    const abcDropdownRef = useRef<HTMLDivElement>(null);
    const stockStatusDropdownRef = useRef<HTMLDivElement>(null);

    useEffect(() => {
        function handleClickOutside(event: MouseEvent) {
            if (statusDropdownRef.current && !statusDropdownRef.current.contains(event.target as Node)) {
                setStatusDropdownOpen(false);
            }
            if (abcDropdownRef.current && !abcDropdownRef.current.contains(event.target as Node)) {
                setAbcDropdownOpen(false);
            }
            if (stockStatusDropdownRef.current && !stockStatusDropdownRef.current.contains(event.target as Node)) {
                setStockStatusDropdownOpen(false);
            }
        }
        document.addEventListener("mousedown", handleClickOutside);
        return () => document.removeEventListener("mousedown", handleClickOutside);
    }, []);

    const fetchItems = async () => {
        if (!user?.tallerId) return;
        setLoading(true);
        try {
            let query = supabase
                .from('movimientos_inventario')
                .select(`*, productos!inner(*)`)
                .eq('taller_id', user.tallerId)
                .order('fecha', { ascending: false });

            if (!showDeleted) {
                query = query.is('eliminado_en', null);
            }
            if (statusFilter !== 'ALL') {
                query = query.eq('tipo_movimiento', statusFilter);
            }
            if (abcFilter !== 'ALL') {
                query = query.eq('productos.clase_abc', abcFilter);
            }

            const { data, error } = await query;
            if (error) throw error;
            
            // Client-side filtering for searchTerm and stockStatus since Supabase inner join filtering can be tricky
            let filteredData = data || [];
            if (searchTerm) {
                const lowerTerm = searchTerm.toLowerCase();
                filteredData = filteredData.filter(item => 
                    item.codigo_producto.toLowerCase().includes(lowerTerm) ||
                    item.productos?.nombre?.toLowerCase().includes(lowerTerm) ||
                    item.productos?.descripcion?.toLowerCase().includes(lowerTerm)
                );
            }
            if (stockStatusFilter === 'CRITICAL') {
                filteredData = filteredData.filter(item => (item.productos?.stock_actual || 0) <= (item.productos?.stock_minimo || 0));
            } else if (stockStatusFilter === 'NORMAL') {
                filteredData = filteredData.filter(item => (item.productos?.stock_actual || 0) > (item.productos?.stock_minimo || 0));
            }

            setItems(filteredData);
        } catch (error) {
            console.error("Failed to fetch inventory", error);
            toast.error("Error al cargar inventario");
        } finally {
            setLoading(false);
        }
    };

    useEffect(() => {
        if (user?.tallerId) {
            fetchItems();
            setCanDelete(hasPermission('inventario.eliminar'));
        }
    }, [user?.tallerId, statusFilter, abcFilter, stockStatusFilter, showDeleted, searchTerm, hasPermission]);

    const handleConfirmDelete = async () => {
        if (!deleteModal.itemId || !user?.tallerId) return;
        try {
            const { error } = await supabase
                .from('movimientos_inventario')
                .update({ 
                    eliminado_en: new Date().toISOString(),
                    modificado_por: user.id 
                })
                .eq('id', deleteModal.itemId)
                .eq('taller_id', user.tallerId);
            
            if (error) throw error;
            toast.success("Movimiento eliminado correctamente");
            setDeleteModal({ isOpen: false, itemId: null });
            fetchItems();
        } catch (error) {
            console.error(error);
            toast.error("Error al eliminar el registro");
        }
    };

    const handleExportExcel = () => {
        if (items.length === 0) {
            toast.error("No hay datos para exportar");
            return;
        }

        const wb = XLSX.utils.book_new();
        const wsData = [
            ['Fecha', 'Código SKU', 'Producto', 'Categoría', 'Stock Actual', 'Uni.', 'Cambio', 'Tipo', 'Doc/Guía', 'Nota'],
            ...items.map(item => [
                new Date(item.fecha).toLocaleDateString("es-CL"),
                item.codigo_producto,
                item.productos?.nombre || '',
                item.productos?.categoria || '',
                item.productos?.stock_actual || 0,
                item.productos?.unidad_medida || 'Unidad',
                item.cantidad,
                item.tipo_movimiento,
                item.nro_guia_despacho || '',
                item.nota || ''
            ])
        ];
        const ws = XLSX.utils.aoa_to_sheet(wsData);
        XLSX.utils.book_append_sheet(wb, ws, 'Movimientos');
        XLSX.writeFile(wb, `Flusize-Inventario-${new Date().toISOString().split('T')[0]}.xlsx`);
        toast.success("Excel descargado correctamente");
    };

    const handleExportPDF = async () => {
        const el = document.getElementById('inventory-table-container');
        if (!el || items.length === 0) {
            toast.error("No se puede generar el PDF en este momento");
            return;
        }

        toast.info("Generando PDF...");
        try {
            // Create a temporary container for a clean PDF view
            const printClone = el.cloneNode(true) as HTMLElement;
            // Remove action columns and buttons from clone
            const actionElements = printClone.querySelectorAll('th:last-child, td:last-child, button');
            actionElements.forEach(e => e.remove());

            document.body.appendChild(printClone);
            printClone.style.cssText = `position:fixed;left:0;top:0;z-index:9999;width:1000px;background:#fff;padding:40px;border:1px solid #eee;`;
            
            // Add a header to the PDF
            const pdfHeader = document.createElement('div');
            pdfHeader.innerHTML = `
                <h1 style="font-size: 24px; font-weight: bold; margin-bottom: 8px;">Reporte de Inventario - Flusize</h1>
                <p style="font-size: 14px; color: #666; margin-bottom: 24px;">Fecha de emisión: ${new Date().toLocaleString('es-CL')}</p>
            `;
            printClone.insertBefore(pdfHeader, printClone.firstChild);

            await new Promise(r => setTimeout(r, 500));
            const dataUrl = await toPng(printClone, { backgroundColor: '#ffffff', pixelRatio: 2 });
            
            document.body.removeChild(printClone);

            const pdf = new jsPDF('p', 'mm', 'a4');
            const imgWidth = 190;
            const imgHeight = (printClone.offsetHeight * imgWidth) / printClone.offsetWidth;
            
            pdf.addImage(dataUrl, 'PNG', 10, 10, imgWidth, Math.min(imgHeight, 280));
            pdf.save(`Flusize-Inventario-${new Date().toISOString().split('T')[0]}.pdf`);
            toast.success("PDF generado");
        } catch (e: any) {
            console.error(e);
            toast.error("Error al generar PDF");
        }
    };

    const getStatusColor = (status: string) => {
        switch (status) {
            case 'ENTRADA': return 'bg-emerald-500/10 text-emerald-600 border border-emerald-500/20';
            case 'SALIDA': return 'bg-red-500/10 text-red-600 border border-red-500/20';
            case 'AJUSTE': return 'bg-amber-500/10 text-amber-600 border border-amber-500/20';
            default: return 'bg-slate-500/10 text-slate-600 border border-slate-500/20';
        }
    };

    const getAbcColor = (cls?: string) => {
        if (!cls) return 'hidden';
        switch (cls) {
            case 'A': return 'bg-gradient-to-r from-red-500 to-rose-600 text-white shadow-sm shadow-red-200';
            case 'B': return 'bg-gradient-to-r from-amber-400 to-orange-500 text-white shadow-sm shadow-amber-200';
            case 'C': return 'bg-gradient-to-r from-emerald-400 to-teal-500 text-white shadow-sm shadow-emerald-200';
            default: return 'bg-slate-100 text-slate-600 border border-slate-200';
        }
    };

    return (
        <div className="space-y-6 max-w-7xl mx-auto pb-12 pt-6">
            <AddItemModal
                isOpen={isModalOpen}
                onClose={() => setIsModalOpen(false)}
                onSuccess={fetchItems}
                mode={modalMode}
                initialData={modalInitialData}
            />

            {/* Header Section */}
            <div className="flex flex-col gap-4 md:flex-row md:items-center md:justify-between px-4 sm:px-0">
                <div>
                    <h2 className="text-2xl font-bold bg-clip-text text-transparent bg-gradient-to-r from-slate-800 to-slate-600">Inventario y Stock</h2>
                    <p className="text-slate-500 text-sm mt-1">Gestiona el catálogo de productos y controla entradas, salidas y ajustes.</p>
                </div>
                <div className="flex gap-3 flex-wrap md:flex-nowrap">
                    <button
                        onClick={() => router.push('/admin/inventario/reportes')}
                        className="relative flex items-center gap-2 rounded-xl border border-blue-200 bg-blue-50 px-4 py-2 text-sm font-bold text-blue-700 hover:bg-blue-100 transition-colors shadow-sm"
                    >
                        <BarChart2 className="h-4 w-4" />
                        Reportes
                        {showTour && (
                            <span className="absolute -top-1 -right-1 flex h-3 w-3">
                                <span className="animate-ping absolute inline-flex h-full w-full rounded-full bg-blue-400 opacity-75"></span>
                                <span className="relative inline-flex rounded-full h-3 w-3 bg-blue-500"></span>
                            </span>
                        )}
                    </button>
                    <div className="flex bg-slate-100 p-1 rounded-xl border border-slate-200">
                        <button
                            onClick={handleExportExcel}
                            className="flex items-center gap-2 rounded-lg px-3 py-1.5 text-xs font-bold text-slate-700 hover:bg-white transition-all"
                            title="Exportar a Excel"
                        >
                            <Download className="h-3.5 w-3.5 text-emerald-600" />
                            Excel
                        </button>
                        <div className="w-px h-4 bg-slate-300 self-center mx-1"></div>
                        <button
                            onClick={handleExportPDF}
                            className="flex items-center gap-2 rounded-lg px-3 py-1.5 text-xs font-bold text-slate-700 hover:bg-white transition-all"
                            title="Generar PDF"
                        >
                            <FileText className="h-3.5 w-3.5 text-red-500" />
                            PDF
                        </button>
                    </div>
                    
                    <div className="relative">
                        <button
                            onClick={() => { setModalMode('ENTRADA'); setIsModalOpen(true); }}
                            className="flex items-center gap-2 rounded-xl bg-emerald-600 px-4 py-2 text-sm font-bold text-white hover:bg-emerald-700 transition-colors shadow-sm"
                        >
                            <Plus className="h-4 w-4" />
                            Entrada
                        </button>

                        {showTour && (
                            <div className="absolute right-0 top-full mt-3 w-64 md:w-72 z-50 animate-in fade-in slide-in-from-top-2 duration-300">
                                {/* Flecha */}
                                <div className="absolute -top-2 right-6 w-4 h-4 bg-slate-800 rotate-45 border-l border-t border-slate-700 hidden md:block"></div>
                                {/* Contenedor */}
                                <div className="relative bg-slate-800 text-white p-4 rounded-xl shadow-2xl border border-slate-700 pointer-events-auto">
                                    <div className="flex items-start gap-3">
                                        <div className="bg-emerald-500/20 text-emerald-400 p-2 rounded-lg shrink-0 mt-0.5">
                                            <Package className="w-5 h-5" />
                                        </div>
                                        <div>
                                            <h4 className="font-bold text-sm mb-1 text-white">¡Bienvenido al Inventario!</h4>
                                            <p className="text-xs text-slate-300 mb-3 leading-relaxed">
                                                Comienza registrando las entradas de repuestos y materiales para armar tu catálogo.
                                            </p>
                                            <button 
                                                onClick={dismissTour}
                                                className="bg-emerald-500 hover:bg-emerald-600 text-white font-bold text-xs py-2 px-3 rounded-lg w-full transition-colors flex items-center justify-center gap-1 shadow-sm shadow-emerald-900"
                                            >
                                                ¡Entendido!
                                            </button>
                                        </div>
                                    </div>
                                    <button onClick={dismissTour} className="absolute top-2 right-2 p-1 text-slate-400 hover:text-white rounded-md hover:bg-slate-700 transition-colors">
                                        <X className="w-4 h-4" />
                                    </button>
                                </div>
                            </div>
                        )}
                    </div>

                    <button
                        onClick={() => { setModalMode('SALIDA'); setIsModalOpen(true); }}
                        className="flex items-center gap-2 rounded-xl bg-red-600 px-4 py-2 text-sm font-bold text-white hover:bg-red-700 transition-colors shadow-sm"
                    >
                        <Minus className="h-4 w-4" />
                        Salida
                    </button>
                </div>
            </div>

            {/* Filters Bar */}
            <div className="rounded-2xl border border-slate-200 bg-white p-4 shadow-sm mx-4 sm:mx-0">
                <div className="flex flex-col md:flex-row flex-wrap items-stretch md:items-center gap-4">
                    <div className="relative w-full md:flex-1 md:min-w-[200px]">
                        <Search className="absolute left-3 top-1/2 h-4 w-4 -translate-y-1/2 text-slate-400" />
                        <input
                            type="text"
                            value={searchTerm}
                            onChange={(e) => setSearchTerm(e.target.value)}
                            placeholder="Buscar por código original, SKU o nombre..."
                            className="w-full rounded-xl border border-slate-200 bg-slate-50 py-2.5 pl-10 pr-4 text-sm text-slate-800 placeholder-slate-400 focus:border-blue-500 focus:outline-none focus:ring-2 focus:ring-blue-500/20 transition-all font-medium"
                        />
                    </div>

                    <div className="relative" ref={abcDropdownRef}>
                        <button
                            onClick={() => setAbcDropdownOpen(!abcDropdownOpen)}
                            className={`flex justify-between items-center w-full md:w-auto min-w-[140px] gap-2 rounded-xl border px-4 py-2.5 text-sm font-semibold transition-colors ${abcFilter !== 'ALL'
                                ? 'bg-blue-50 border-blue-200 text-blue-700'
                                : 'border-slate-200 bg-white text-slate-700 hover:bg-slate-50'
                                }`}
                        >
                            <span className="flex items-center gap-2"><Filter className="h-4 w-4 text-slate-400" /> ABC: {abcFilter === 'ALL' ? 'Todos' : abcFilter}</span>
                            <ChevronDown className={`h-4 w-4 opacity-50 transition-transform ${abcDropdownOpen ? 'rotate-180' : ''}`} />
                        </button>

                        {abcDropdownOpen && (
                            <div className="absolute top-full left-0 mt-2 w-full md:w-40 rounded-xl border border-slate-100 bg-white shadow-xl z-20 py-1.5 overflow-hidden">
                                {['ALL', 'A', 'B', 'C'].map((cls) => (
                                    <button
                                        key={cls}
                                        onClick={() => { setAbcFilter(cls); setAbcDropdownOpen(false); }}
                                        className="w-full text-left px-4 py-2.5 text-sm font-medium hover:bg-slate-50 text-slate-700 flex items-center justify-between"
                                    >
                                        {cls === 'ALL' ? 'Todos' : `Clase ${cls}`}
                                        {abcFilter === cls && <div className="h-2 w-2 rounded-full bg-blue-600" />}
                                    </button>
                                ))}
                            </div>
                        )}
                    </div>

                    <div className="relative" ref={stockStatusDropdownRef}>
                        <button
                            onClick={() => setStockStatusDropdownOpen(!stockStatusDropdownOpen)}
                            className={`flex justify-between items-center w-full md:w-auto min-w-[150px] gap-2 rounded-xl border px-4 py-2.5 text-sm font-semibold transition-colors ${stockStatusFilter !== 'ALL'
                                ? stockStatusFilter === 'CRITICAL' ? 'bg-red-50 border-red-200 text-red-700' : 'bg-emerald-50 border-emerald-200 text-emerald-700'
                                : 'border-slate-200 bg-white text-slate-700 hover:bg-slate-50'
                                }`}
                        >
                            <span className="flex items-center gap-2"><AlertTriangle className="h-4 w-4 text-slate-400" /> Stok: {stockStatusFilter === 'ALL' ? 'Todos' : stockStatusFilter === 'CRITICAL' ? 'Kritik' : 'Normal'}</span>
                            <ChevronDown className={`h-4 w-4 opacity-50 transition-transform ${stockStatusDropdownOpen ? 'rotate-180' : ''}`} />
                        </button>

                        {stockStatusDropdownOpen && (
                            <div className="absolute top-full left-0 mt-2 w-full md:w-48 rounded-xl border border-slate-100 bg-white shadow-xl z-20 py-1.5 overflow-hidden">
                                <button
                                    onClick={() => { setStockStatusFilter('ALL'); setStockStatusDropdownOpen(false); }}
                                    className="w-full text-left px-4 py-2.5 text-sm font-medium hover:bg-slate-50 text-slate-700 flex items-center justify-between"
                                >
                                    Todos
                                    {stockStatusFilter === 'ALL' && <div className="h-2 w-2 rounded-full bg-blue-600" />}
                                </button>
                                <button
                                    onClick={() => { setStockStatusFilter('CRITICAL'); setStockStatusDropdownOpen(false); }}
                                    className="w-full text-left px-4 py-2.5 text-sm font-medium hover:bg-red-50 text-red-700 flex items-center justify-between"
                                >
                                    Stock Crítico
                                    {stockStatusFilter === 'CRITICAL' && <div className="h-2 w-2 rounded-full bg-red-600" />}
                                </button>
                                <button
                                    onClick={() => { setStockStatusFilter('NORMAL'); setStockStatusDropdownOpen(false); }}
                                    className="w-full text-left px-4 py-2.5 text-sm font-medium hover:bg-emerald-50 text-emerald-700 flex items-center justify-between"
                                >
                                    Stock Sano
                                    {stockStatusFilter === 'NORMAL' && <div className="h-2 w-2 rounded-full bg-emerald-600" />}
                                </button>
                            </div>
                        )}
                    </div>

                    <div className="relative" ref={statusDropdownRef}>
                        <button
                            onClick={() => setStatusDropdownOpen(!statusDropdownOpen)}
                            className={`flex justify-between items-center w-full md:w-auto min-w-[150px] gap-2 rounded-xl border px-4 py-2.5 text-sm font-semibold transition-colors ${statusFilter !== 'ALL'
                                ? 'bg-purple-50 border-purple-200 text-purple-700'
                                : 'border-slate-200 bg-white text-slate-700 hover:bg-slate-50'
                                }`}
                        >
                            <span className="flex items-center gap-2"><Filter className="h-4 w-4 text-slate-400" /> Mov: {statusFilter === 'ALL' ? 'Todos' : statusFilter}</span>
                            <ChevronDown className={`h-4 w-4 opacity-50 transition-transform ${statusDropdownOpen ? 'rotate-180' : ''}`} />
                        </button>

                        {statusDropdownOpen && (
                            <div className="absolute top-full left-0 mt-2 w-full md:w-48 rounded-xl border border-slate-100 bg-white shadow-xl z-20 py-1.5 overflow-hidden">
                                {['ALL', 'ENTRADA', 'SALIDA', 'AJUSTE'].map(s => (
                                    <button
                                        key={s}
                                        onClick={() => { setStatusFilter(s as any); setStatusDropdownOpen(false); }}
                                        className={`w-full text-left px-4 py-2.5 text-sm font-medium hover:bg-slate-50 flex items-center justify-between ${
                                            s === 'ENTRADA' ? 'text-emerald-700' : s === 'SALIDA' ? 'text-red-700' : s === 'AJUSTE' ? 'text-amber-700' : 'text-slate-700'
                                        }`}
                                    >
                                        {s === 'ALL' ? 'Todos' : s}
                                        {statusFilter === s && <div className={`h-2 w-2 rounded-full bg-current`} />}
                                    </button>
                                ))}
                            </div>
                        )}
                    </div>

                    <button
                        onClick={() => {
                            setSearchTerm('');
                            setStatusFilter('ALL');
                            setAbcFilter('ALL');
                            setStockStatusFilter('ALL');
                        }}
                        className="flex items-center justify-center gap-2 rounded-xl border border-slate-200 bg-slate-50 px-4 py-2.5 text-sm font-semibold text-slate-600 hover:bg-slate-100 transition-colors w-full md:w-auto"
                    >
                        <RefreshCw className="h-4 w-4" />
                        Limpiar
                    </button>
                </div>
            </div>

            {/* Data Table */}
            <div id="inventory-table-container" className="rounded-2xl border border-slate-200 bg-white overflow-hidden shadow-sm mx-4 sm:mx-0">
                <div className="overflow-x-auto">
                    <table className="w-full text-left text-sm">
                        <thead className="bg-slate-50 text-[11px] uppercase text-slate-500 border-b border-slate-200 font-bold tracking-wider">
                            <tr>
                                <th className="px-6 py-4">Fecha</th>
                                <th className="px-6 py-4">Producto</th>
                                <th className="px-6 py-4 text-right">Stock Actual</th>
                                <th className="px-6 py-4 text-right">Cambio</th>
                                <th className="px-6 py-4">Movimiento</th>
                                <th className="px-6 py-4">Nota</th>
                                <th className="px-6 py-4 text-center">Acciones</th>
                            </tr>
                        </thead>
                        <tbody className="divide-y divide-slate-100">
                            {items.length === 0 && !loading && (
                                <tr>
                                    <td colSpan={7} className="px-6 py-12 text-center text-slate-500">
                                        No se encontraron registros de inventario.
                                    </td>
                                </tr>
                            )}
                            {items.map((item) => {
                                const material = item.productos;
                                const isLowStock = material && material.stock_actual <= material.stock_minimo;
                                const abcClass = material?.clase_abc;

                                return (
                                    <motion.tr
                                        key={item.id}
                                        initial={{ opacity: 0 }}
                                        animate={{ opacity: 1 }}
                                        className={`hover:bg-slate-50 transition-colors group ${showDeleted || item.eliminado_en ? 'opacity-50 bg-slate-50 border-l-2 border-l-slate-300' : ''}`}
                                    >
                                        <td className="px-6 py-4 whitespace-nowrap">
                                            <div className="font-medium text-slate-800">{new Date(item.fecha).toLocaleDateString("es-CL")}</div>
                                            <div className="text-slate-400 text-xs">{item.anio} • Sem {item.semana}</div>
                                        </td>
                                        <td className="px-6 py-4">
                                            <div className="flex items-center gap-2">
                                                <span className="font-mono font-bold text-slate-800 text-sm">
                                                    {item.codigo_producto}
                                                </span>
                                                {abcClass && (
                                                    <span className={`px-2 py-0.5 text-[10px] font-black rounded-md ${getAbcColor(abcClass)}`} title={`Clase ABC: ${abcClass}`}>
                                                        {abcClass}
                                                    </span>
                                                )}
                                            </div>
                                            {material?.nombre && <div className="text-xs text-slate-600 font-semibold mt-1 max-w-[200px] truncate">{material.nombre}</div>}
                                            {material?.descripcion && <div className="text-[11px] text-slate-400 mt-0.5 max-w-[200px] truncate">{material.descripcion}</div>}
                                        </td>
                                        <td className="px-6 py-4 text-right">
                                            <div className="flex items-center justify-end gap-2">
                                                {isLowStock && (
                                                    <div className="flex items-center gap-1 text-red-600 bg-red-50/80 px-1.5 py-0.5 rounded-md text-[10px] font-bold animate-pulse" title={`Kritik Stok! (Limit: ${material?.stock_minimo})`}>
                                                        <AlertTriangle className="h-3 w-3" />
                                                        CRÍTICO
                                                    </div>
                                                )}
                                                <span className={`font-black text-lg ${isLowStock ? 'text-red-600' : 'text-slate-800'}`}>
                                                    {material?.stock_actual.toLocaleString() || 0}
                                                </span>
                                                <span className="text-[11px] font-semibold text-slate-400">{material?.unidad_medida || 'Unidad'}</span>
                                            </div>
                                        </td>
                                        <td className="px-6 py-4 text-right">
                                            <span className={`font-bold text-base ${item.tipo_movimiento === 'ENTRADA' ? 'text-emerald-600' : item.tipo_movimiento === 'SALIDA' ? 'text-red-600' : 'text-amber-600'}`}>
                                                {item.tipo_movimiento === 'SALIDA' ? '-' : '+'}{item.cantidad}
                                            </span>
                                        </td>
                                        <td className="px-6 py-4">
                                            <span className={`inline-flex items-center rounded-lg px-2.5 py-1 text-xs font-bold ${getStatusColor(item.tipo_movimiento)}`}>
                                                {item.tipo_movimiento}
                                            </span>
                                        </td>
                                        <td className="px-6 py-4 text-slate-500 text-xs max-w-[200px] truncate">
                                            {item.nota || '-'}
                                        </td>
                                        <td className="px-6 py-4 text-center">
                                            {!item.eliminado_en && canDelete && (
                                                <button
                                                    onClick={(e) => {
                                                        e.stopPropagation();
                                                        setDeleteModal({ isOpen: true, itemId: item.id });
                                                    }}
                                                    className="p-2 rounded-xl hover:bg-red-50 text-red-400 hover:text-red-600 transition-colors"
                                                    title="Eliminar movimiento (Soft Delete)"
                                                >
                                                    <Trash2 className="h-4 w-4" />
                                                </button>
                                            )}
                                            {item.eliminado_en && (
                                                <span className="text-[10px] font-bold text-slate-400 uppercase">Eliminado</span>
                                            )}
                                        </td>
                                    </motion.tr>
                                );
                            })}
                        </tbody>
                    </table>
                </div>
            </div>

            {/* Modals Stubs or real ones goes here */}
            <DeleteConfirmModal
                isOpen={deleteModal.isOpen}
                onClose={() => setDeleteModal({ isOpen: false, itemId: null })}
                onConfirm={handleConfirmDelete}
            />

            <AddItemModal isOpen={isModalOpen} onClose={() => setIsModalOpen(false)} onSuccess={fetchItems} mode={modalMode} initialData={modalInitialData} />
            <QCModal isOpen={qcModal.isOpen} onClose={() => setQcModal({ isOpen: false, item: null })} onSuccess={fetchItems} item={qcModal.item} />
        </div>
    );
}
