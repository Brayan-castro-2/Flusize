'use client';

import { useState, useEffect } from 'react';
import { useRouter } from 'next/navigation';
import {
    AreaChart, Area, BarChart, Bar,
    XAxis, YAxis, CartesianGrid, Tooltip as RechartsTooltip, ResponsiveContainer, Legend,
    PieChart, Pie, Cell
} from 'recharts';
import {
    Download, AlertTriangle, Package, Search, X, TrendingUp, TrendingDown,
    DollarSign, ShoppingCart, BarChart2, Percent
} from 'lucide-react';
import jsPDF from 'jspdf';
import { toPng } from 'html-to-image';
import * as XLSX from 'xlsx';
import { toast } from 'sonner';
import { useAuth } from '@/contexts/auth-context';
import FeatureGuard from '@/components/FeatureGuard';
import { getInventoryStats } from './actions';

const COLORS = ['#3B82F6', '#10B981', '#F59E0B', '#EF4444', '#8B5CF6'];

const CLP = (n: number) =>
    new Intl.NumberFormat('es-CL', { style: 'currency', currency: 'CLP', maximumFractionDigits: 0 }).format(n);

export default function InventoryReportsPage() {
    return (
        <FeatureGuard
            moduleName="inventario"
            fallback={
                <div className="flex flex-col items-center justify-center p-12 text-center bg-white rounded-2xl border border-slate-100 shadow-sm mt-8">
                    <AlertTriangle className="w-8 h-8 text-blue-400 mb-4" />
                    <h2 className="text-xl font-bold text-slate-800 mb-2">Módulo Analítico de Inventario</h2>
                    <p className="text-slate-500 max-w-md">Este módulo requiere activación. Contacta a soporte.</p>
                </div>
            }
        >
            <ReportsContent />
        </FeatureGuard>
    );
}

function ReportsContent() {
    const router = useRouter();
    const { user } = useAuth();

    const [loading, setLoading] = useState(true);
    const [data, setData] = useState<any>(null);
    const [selectedMetric, setSelectedMetric] = useState<'lowStock' | 'deadStock' | null>(null);

    const period = new Date().toLocaleString('es-ES', { month: 'long', year: 'numeric' });

    useEffect(() => {
        if (!user?.tallerId) return;
        const load = async () => {
            try {
                setLoading(true);
                const stats = await getInventoryStats(user.tallerId ?? '');
                setData(stats);
            } catch (err) {
                toast.error("Error al cargar los KPIs de inventario");
            } finally {
                setLoading(false);
            }
        };
        load();
    }, [user?.tallerId]);

    const handleDownloadPDF = async () => {
        const el = document.getElementById('pdf-report-template');
        if (!el || !data) { toast.error("Renta PDF no disponible."); return; }
        toast.info("Generando PDF...");
        try {
            el.style.cssText = `position:fixed;left:0;top:0;z-index:9999;width:800px;min-height:1130px;background:#fff;color:#1f2937;font-family:system-ui,-apple-system,sans-serif;padding:48px;box-sizing:border-box;`;
            await new Promise(r => setTimeout(r, 500));
            const dataUrl = await toPng(el, { backgroundColor: '#ffffff', pixelRatio: 2, width: 800, height: 1130 });
            el.style.cssText = `position:absolute;left:-9999px;top:0;`;
            const pdf = new jsPDF('p', 'mm', 'a4');
            pdf.addImage(dataUrl, 'PNG', 0, 0, pdf.internal.pageSize.getWidth(), pdf.internal.pageSize.getHeight());
            pdf.save(`KPI-Inventario-${period.replace(/\s/g, '-')}.pdf`);
            toast.success('PDF descargado');
        } catch (e: any) {
            toast.error("Error al generar PDF: " + e.message);
        }
    };

    const handleExportExcel = () => {
        if (!data) return;
        const wb = XLSX.utils.book_new();
        // Financial summary
        const finSheet = [
            ['Métrica Financiera', 'Valor'],
            ['Gasto Total en Compras', data.gastoTotal],
            ['Ingresos Generados (Ventas)', data.ingresosGenerados],
            ['Ganancia Bruta', data.gananciaBruta],
            ['Margen Bruto (%)', `${data.margenPorc}%`],
            ['Proyección de Ventas (Stock actual)', data.proyeccionVentas],
        ];
        XLSX.utils.book_append_sheet(wb, XLSX.utils.aoa_to_sheet(finSheet), 'Financiero');
        // KPIs
        const kpiSheet = [
            ['KPI', 'Valor'],
            ['Total Materiales', data.uniqueMaterialCount],
            ['Stock Neto Total', data.totalStock],
            ['Tasa de Rotación (%)', `${data.turnoverRate}%`],
            ['Stock Muerto', data.deadStockCount],
            ['Stock Crítico', data.lowStockCount],
        ];
        XLSX.utils.book_append_sheet(wb, XLSX.utils.aoa_to_sheet(kpiSheet), 'KPIs');
        // Monthly
        if (data.monthlyFinancial?.length) {
            const monthSheet = [
                ['Mes', 'Gasto', 'Ingresos', 'Ganancia', 'Transacciones'],
                ...data.monthlyFinancial.map((m: any) => [m.label, m.gasto, m.ingresos, m.ganancia, m.transacciones])
            ];
            XLSX.utils.book_append_sheet(wb, XLSX.utils.aoa_to_sheet(monthSheet), 'Mensual');
        }
        XLSX.writeFile(wb, `Reporte-Inventario-${period.replace(/\s/g, '-')}.xlsx`);
    };

    if (loading || !data) {
        return (
            <div className="flex items-center justify-center p-20 text-slate-400">
                <div className="flex flex-col items-center">
                    <div className="w-10 h-10 border-4 border-slate-200 border-t-blue-500 rounded-full animate-spin mb-4" />
                    Cargando analíticas...
                </div>
            </div>
        );
    }

    const hasFinancialData = data.gastoTotal > 0 || data.ingresosGenerados > 0 || data.proyeccionVentas > 0;

    return (
        <div className="space-y-6 max-w-7xl mx-auto pb-12 pt-6 px-4 sm:px-0 text-slate-800">

            {/* ── Header ── */}
            <div className="flex flex-col md:flex-row md:items-center md:justify-between gap-4">
                <div>
                    <h2 className="text-2xl font-black bg-clip-text text-transparent bg-gradient-to-r from-slate-800 to-slate-600">
                        Reportes de Inventario
                    </h2>
                    <p className="text-slate-500 text-sm mt-1">KPIs financieros, alertas críticas y distribución de movimientos.</p>
                </div>
                <div className="flex gap-3">
                    <button onClick={handleDownloadPDF} className="flex items-center gap-2 rounded-xl border border-slate-200 bg-white px-4 py-2 text-sm font-semibold text-slate-700 hover:bg-slate-50 transition-colors shadow-sm">
                        <Download className="h-4 w-4" />PDF
                    </button>
                    <button onClick={handleExportExcel} className="flex items-center gap-2 rounded-xl bg-emerald-600 px-4 py-2 text-sm font-bold text-white hover:bg-emerald-700 transition-colors shadow-sm">
                        Excel
                    </button>
                </div>
            </div>

            {/* ── FINANCIAL DASHBOARD ── */}
            {!hasFinancialData && (
                <div className="rounded-2xl border border-blue-100 bg-blue-50 p-4 text-sm text-blue-700 font-medium flex items-center gap-2">
                    <DollarSign className="w-4 h-4 shrink-0" />
                    Agrega <strong>precio de venta y compra</strong> a los productos para ver el análisis financiero completo.
                </div>
            )}

            {/* Financial KPI Cards */}
            <div className="grid gap-4 sm:grid-cols-2 lg:grid-cols-4">
                {/* Gasto Total */}
                <div className="rounded-2xl border border-slate-200 bg-white p-5 shadow-sm">
                    <div className="flex items-center justify-between mb-3">
                        <div className="w-9 h-9 bg-red-50 text-red-500 rounded-xl flex items-center justify-center">
                            <ShoppingCart className="w-5 h-5" />
                        </div>
                        <span className="text-[10px] font-black uppercase tracking-widest text-slate-400">Gasto Total</span>
                    </div>
                    <div className="text-2xl font-black text-slate-800">{CLP(data.gastoTotal)}</div>
                    <div className="text-xs text-slate-500 font-medium mt-1">Total invertido en compras</div>
                </div>

                {/* Ingresos */}
                <div className="rounded-2xl border border-slate-200 bg-white p-5 shadow-sm">
                    <div className="flex items-center justify-between mb-3">
                        <div className="w-9 h-9 bg-emerald-50 text-emerald-600 rounded-xl flex items-center justify-center">
                            <TrendingUp className="w-5 h-5" />
                        </div>
                        <span className="text-[10px] font-black uppercase tracking-widest text-slate-400">Ingresos</span>
                    </div>
                    <div className="text-2xl font-black text-slate-800">{CLP(data.ingresosGenerados)}</div>
                    <div className="text-xs text-slate-500 font-medium mt-1">Generados por salidas de stock</div>
                </div>

                {/* Ganancia Bruta */}
                <div className={`rounded-2xl border p-5 shadow-sm ${data.gananciaBruta >= 0 ? 'bg-emerald-50 border-emerald-200' : 'bg-red-50 border-red-200'}`}>
                    <div className="flex items-center justify-between mb-3">
                        <div className={`w-9 h-9 rounded-xl flex items-center justify-center ${data.gananciaBruta >= 0 ? 'bg-emerald-100 text-emerald-700' : 'bg-red-100 text-red-600'}`}>
                            <Percent className="w-5 h-5" />
                        </div>
                        <span className="text-[10px] font-black uppercase tracking-widest text-slate-400">Ganancia Bruta</span>
                    </div>
                    <div className={`text-2xl font-black ${data.gananciaBruta >= 0 ? 'text-emerald-700' : 'text-red-600'}`}>
                        {CLP(data.gananciaBruta)}
                    </div>
                    <div className={`text-xs font-bold mt-1 ${data.gananciaBruta >= 0 ? 'text-emerald-600' : 'text-red-500'}`}>
                        Margen: {data.margenPorc}%
                    </div>
                </div>

                {/* Proyección */}
                <div className="rounded-2xl border border-slate-200 bg-white p-5 shadow-sm">
                    <div className="flex items-center justify-between mb-3">
                        <div className="w-9 h-9 bg-blue-50 text-blue-600 rounded-xl flex items-center justify-center">
                            <BarChart2 className="w-5 h-5" />
                        </div>
                        <span className="text-[10px] font-black uppercase tracking-widest text-slate-400">Proyección</span>
                    </div>
                    <div className="text-2xl font-black text-slate-800">{CLP(data.proyeccionVentas)}</div>
                    <div className="text-xs text-slate-500 font-medium mt-1">Valor del stock actual a PVP</div>
                </div>
            </div>

            {/* ── MONTHLY FINANCIAL CHART ── */}
            <div className="rounded-2xl border border-slate-200 bg-white p-6 shadow-sm">
                <div className="flex items-center justify-between mb-5">
                    <div>
                        <h3 className="text-base font-bold text-slate-800">Evolución Financiera Mensual</h3>
                        <p className="text-xs text-slate-500 mt-0.5">Gasto vs. Ingresos vs. Ganancia — últimos 6 meses</p>
                    </div>
                </div>
                {data.monthlyFinancial?.some((m: any) => m.gasto > 0 || m.ingresos > 0) ? (
                    <ResponsiveContainer width="100%" height={280}>
                        <BarChart data={data.monthlyFinancial} margin={{ top: 5, right: 16, left: 16, bottom: 5 }}>
                            <CartesianGrid strokeDasharray="3 3" stroke="#f1f5f9" />
                            <XAxis dataKey="name" tick={{ fontSize: 12, fill: '#94a3b8', fontWeight: 600 }} axisLine={false} tickLine={false} />
                            <YAxis tickFormatter={(v) => `$${(v / 1000).toFixed(0)}k`} tick={{ fontSize: 11, fill: '#94a3b8' }} axisLine={false} tickLine={false} />
                            <RechartsTooltip
                                formatter={(value: number | undefined, name: string) => {
                                    const labels: Record<string, string> = { gasto: 'Gasto', ingresos: 'Ingresos', ganancia: 'Ganancia' };
                                    return [value != null ? CLP(value) : '-', labels[name] ?? name];
                                }}
                                contentStyle={{ borderRadius: '12px', border: 'none', boxShadow: '0 10px 25px -5px rgba(0,0,0,0.1)' }}
                                cursor={{ fill: '#f8fafc' }}
                            />
                            <Legend formatter={(v) => ({ gasto: 'Gasto en Compras', ingresos: 'Ingresos x Ventas', ganancia: 'Ganancia Bruta' }[v] || v)} />
                            <Bar dataKey="gasto" fill="#fca5a5" radius={[6, 6, 0, 0]} maxBarSize={40} />
                            <Bar dataKey="ingresos" fill="#6ee7b7" radius={[6, 6, 0, 0]} maxBarSize={40} />
                            <Bar dataKey="ganancia" fill="#93c5fd" radius={[6, 6, 0, 0]} maxBarSize={40} />
                        </BarChart>
                    </ResponsiveContainer>
                ) : (
                    <div className="flex flex-col items-center justify-center h-48 text-slate-400">
                        <BarChart2 className="w-10 h-10 mb-2 opacity-30" />
                        <p className="text-sm font-medium">Los datos financieros aparecerán aquí cuando los productos tengan precios asignados.</p>
                    </div>
                )}
            </div>

            {/* ── Inventory KPI Cards ── */}
            <div className="grid gap-4 md:grid-cols-4">
                <div className="rounded-2xl border border-slate-200 bg-white p-5 text-center shadow-sm">
                    <div className="text-[11px] uppercase text-slate-400 font-bold tracking-wider">Total Materiales</div>
                    <div className="text-3xl font-black text-blue-600 mt-2">{data.uniqueMaterialCount?.toLocaleString()}</div>
                    <div className="text-xs text-slate-500 mt-1 font-medium">Referencias únicas</div>
                </div>
                <div className="rounded-2xl border border-slate-200 bg-white p-5 text-center shadow-sm">
                    <div className="text-[11px] uppercase text-slate-400 font-bold tracking-wider">Rotación Stock</div>
                    <div className="text-3xl font-black text-emerald-600 mt-2">{data.turnoverRate}%</div>
                    <div className="text-xs text-emerald-600/70 mt-1 font-medium">Salidas vs Saldo</div>
                </div>
                <div
                    onClick={() => setSelectedMetric('deadStock')}
                    className="rounded-2xl border border-slate-200 bg-white p-5 text-center shadow-sm cursor-pointer hover:bg-slate-50 transition-colors relative group"
                >
                    <div className="absolute top-3 right-3 opacity-0 group-hover:opacity-100 transition-opacity">
                        <Search className="h-4 w-4 text-slate-400" />
                    </div>
                    <div className="text-[11px] uppercase text-slate-400 font-bold tracking-wider">Stock Muerto</div>
                    <div className={`text-3xl font-black mt-2 ${data.deadStockCount > 0 ? 'text-red-500' : 'text-slate-400'}`}>{data.deadStockCount}</div>
                    <div className="text-xs text-slate-500 mt-1 font-medium">&gt; 90 días inactivo</div>
                </div>
                <div
                    onClick={() => setSelectedMetric('lowStock')}
                    className="rounded-2xl border border-slate-200 bg-white p-5 text-center shadow-sm cursor-pointer hover:bg-slate-50 transition-colors relative group"
                >
                    <div className="absolute top-3 right-3 opacity-0 group-hover:opacity-100 transition-opacity">
                        <Search className="h-4 w-4 text-slate-400" />
                    </div>
                    <div className="text-[11px] uppercase text-slate-400 font-bold tracking-wider">Estado Crítico</div>
                    <div className={`text-3xl font-black mt-2 ${data.lowStockCount > 0 ? 'text-amber-500' : 'text-slate-400'}`}>{data.lowStockCount}</div>
                    <div className="text-xs text-slate-500 mt-1 font-medium">Bajo mínimo sugerido</div>
                </div>
            </div>

            {/* Drill-down modal */}
            {selectedMetric && (
                <div className="fixed inset-0 z-[100] flex items-center justify-center bg-slate-900/60 backdrop-blur-sm p-4">
                    <div className="w-full max-w-2xl bg-white rounded-2xl shadow-xl border border-slate-200 flex flex-col max-h-[80vh]">
                        <div className="flex items-center justify-between p-5 border-b border-slate-100">
                            <h3 className="text-lg font-bold flex items-center gap-2">
                                {selectedMetric === 'lowStock'
                                    ? <><AlertTriangle className="h-5 w-5 text-amber-500" /><span className="text-amber-600">Stock Crítico</span></>
                                    : <><Package className="h-5 w-5 text-red-500" /><span className="text-red-600">Stock Sin Rotación (90+ Días)</span></>}
                            </h3>
                            <button onClick={() => setSelectedMetric(null)} className="p-2 hover:bg-slate-100 text-slate-500 rounded-xl transition-colors">
                                <X className="h-5 w-5" />
                            </button>
                        </div>
                        <div className="p-4 overflow-y-auto flex-1">
                            {selectedMetric === 'lowStock' ? (
                                <div className="space-y-3">
                                    {(data.allLowStockItems || []).map((item: any) => (
                                        <div key={item.id} onClick={() => router.push(`/admin/inventario?search=${encodeURIComponent(item.materialReference)}`)} className="flex items-center justify-between p-4 rounded-xl bg-amber-50 border border-amber-100 hover:bg-amber-100 transition-colors cursor-pointer">
                                            <div>
                                                <div className="font-bold text-slate-800 text-sm">{item.materialReference}</div>
                                                <div className="text-[11px] font-semibold text-amber-600">{item.company}</div>
                                            </div>
                                            <div className="text-right">
                                                <div className="font-black text-amber-600 text-lg">{item.stockCount}</div>
                                                <div className="text-[10px] font-bold text-amber-500/70 uppercase tracking-wide">Mínimo: {item.limit}</div>
                                            </div>
                                        </div>
                                    ))}
                                    {!data.allLowStockItems?.length && <div className="text-center py-12 text-slate-400 font-medium">Todo está sano y por encima del nivel mínimo.</div>}
                                </div>
                            ) : (
                                <div className="space-y-3">
                                    {(data.deadStockItems || []).map((item: any) => (
                                        <div key={item.id} onClick={() => router.push(`/admin/inventario?search=${encodeURIComponent(item.materialReference)}`)} className="flex items-center justify-between p-4 rounded-xl bg-red-50 border border-red-100 hover:bg-red-100 transition-colors cursor-pointer">
                                            <div>
                                                <div className="font-bold text-slate-800 text-sm">{item.materialReference}</div>
                                                <div className="text-[11px] font-semibold text-red-600">{item.company}</div>
                                            </div>
                                            <div className="text-right">
                                                <div className="font-black text-red-600 text-lg">{item.stockCount}</div>
                                                <div className="text-[10px] font-bold text-red-500/70 uppercase tracking-wide">
                                                    Últ. Mov: {item.lastActivity?.getFullYear?.() === 1970 ? "Nunca" : new Date(item.lastActivity).toLocaleDateString('es-ES')}
                                                </div>
                                            </div>
                                        </div>
                                    ))}
                                    {!data.deadStockItems?.length && <div className="text-center py-12 text-slate-400 font-medium">Buena rotación. No hay artículos atascados.</div>}
                                </div>
                            )}
                        </div>
                        <div className="p-4 border-t border-slate-100 bg-slate-50 rounded-b-2xl text-[11px] font-bold text-center text-slate-400 tracking-wider uppercase">
                            Total {selectedMetric === 'lowStock' ? (data.allLowStockItems?.length || 0) : (data.deadStockItems?.length || 0)} registros
                        </div>
                    </div>
                </div>
            )}

            {/* ── Bottom: Pie + Top 5 ── */}
            <div className="grid gap-6 md:grid-cols-2">
                <div className="rounded-2xl border border-slate-200 bg-white p-6 shadow-sm flex flex-col">
                    <h3 className="mb-4 text-base font-bold text-slate-800">Distribución de Transacciones</h3>
                    <div className="h-[240px]">
                        <ResponsiveContainer width="100%" height="100%">
                            <PieChart>
                                <Pie data={data.statusCounts} cx="50%" cy="50%" innerRadius={65} outerRadius={95} paddingAngle={5} dataKey="value">
                                    {data.statusCounts.map((entry: any, index: number) => (
                                        <Cell key={`cell-${index}`} fill={COLORS[index % COLORS.length]} strokeWidth={0} />
                                    ))}
                                </Pie>
                                <RechartsTooltip contentStyle={{ borderRadius: '12px', border: 'none', boxShadow: '0 10px 25px -5px rgba(0,0,0,0.1)' }} />
                                <Legend />
                            </PieChart>
                        </ResponsiveContainer>
                    </div>
                </div>

                <div className="rounded-2xl border border-slate-200 bg-white p-6 shadow-sm flex flex-col">
                    <div className="flex items-center gap-3 mb-4">
                        <Package className="h-5 w-5 text-blue-500" />
                        <h3 className="text-base font-bold text-slate-800">Top 5: Los más utilizados</h3>
                    </div>
                    {data.topMaterials?.length > 0 ? (
                        <div className="space-y-3">
                            {data.topMaterials.map((material: any, index: number) => (
                                <div key={material.reference} className="flex items-center justify-between p-3 rounded-xl bg-slate-50 border border-slate-100">
                                    <div className="flex items-center gap-3">
                                        <div className="w-7 h-7 rounded-lg bg-blue-100 flex items-center justify-center text-[11px] font-black text-blue-600">{index + 1}</div>
                                        <div>
                                            <div className="text-slate-800 font-bold text-sm leading-tight">{material.reference}</div>
                                            <div className="text-slate-500 text-[11px] font-medium">{material.name}</div>
                                        </div>
                                    </div>
                                    <div className="text-right">
                                        <div className="text-blue-600 font-black">{material.transactionCount} <span className="text-[10px] text-blue-600/60 uppercase">Op</span></div>
                                        <div className="text-[10px] text-slate-400 font-bold uppercase tracking-wide">Stock: {material.totalStock.toLocaleString()}</div>
                                    </div>
                                </div>
                            ))}
                        </div>
                    ) : (
                        <div className="flex flex-col items-center justify-center flex-grow py-8 text-slate-400">
                            <Package className="h-8 w-8 mb-2 opacity-30" />
                            <span className="text-sm font-medium text-center">Aún no hay transacciones registradas.</span>
                        </div>
                    )}
                </div>
            </div>

            {/* Hidden PDF template */}
            <div id="pdf-report-template" style={{ position: 'absolute', left: '-9999px', top: 0, width: '800px', minHeight: '1130px', backgroundColor: '#ffffff', color: '#1f2937', fontFamily: 'system-ui,-apple-system,sans-serif', padding: '48px', boxSizing: 'border-box' }}>
                <div style={{ borderBottom: '3px solid #2563eb', paddingBottom: '20px', marginBottom: '28px' }}>
                    <h1 style={{ margin: 0, fontSize: '22px', fontWeight: 'bold', color: '#111827' }}>Flusize Reports — Inventario</h1>
                    <p style={{ margin: 0, fontSize: '12px', color: '#6b7280' }}>{new Date().toLocaleDateString('es-ES', { day: 'numeric', month: 'long', year: 'numeric' })}</p>
                </div>
                <div style={{ display: 'grid', gridTemplateColumns: 'repeat(4,1fr)', gap: '12px', marginBottom: '24px' }}>
                    <div style={{ background: '#fef2f2', border: '1px solid #fecaca', borderRadius: '10px', padding: '14px', textAlign: 'center' }}>
                        <div style={{ fontSize: '10px', color: '#991b1b', fontWeight: 'bold' }}>GASTO TOTAL</div>
                        <div style={{ fontSize: '18px', fontWeight: 'bold', color: '#dc2626' }}>{CLP(data.gastoTotal)}</div>
                    </div>
                    <div style={{ background: '#ecfdf5', border: '1px solid #a7f3d0', borderRadius: '10px', padding: '14px', textAlign: 'center' }}>
                        <div style={{ fontSize: '10px', color: '#065f46', fontWeight: 'bold' }}>INGRESOS</div>
                        <div style={{ fontSize: '18px', fontWeight: 'bold', color: '#059669' }}>{CLP(data.ingresosGenerados)}</div>
                    </div>
                    <div style={{ background: '#eff6ff', border: '1px solid #bfdbfe', borderRadius: '10px', padding: '14px', textAlign: 'center' }}>
                        <div style={{ fontSize: '10px', color: '#1e40af', fontWeight: 'bold' }}>GANANCIA BRUTA</div>
                        <div style={{ fontSize: '18px', fontWeight: 'bold', color: '#1d4ed8' }}>{CLP(data.gananciaBruta)}</div>
                    </div>
                    <div style={{ background: '#f0fdf4', border: '1px solid #bbf7d0', borderRadius: '10px', padding: '14px', textAlign: 'center' }}>
                        <div style={{ fontSize: '10px', color: '#166534', fontWeight: 'bold' }}>PROYECCIÓN</div>
                        <div style={{ fontSize: '18px', fontWeight: 'bold', color: '#15803d' }}>{CLP(data.proyeccionVentas)}</div>
                    </div>
                </div>
                <div style={{ display: 'grid', gridTemplateColumns: 'repeat(4,1fr)', gap: '12px' }}>
                    <div style={{ background: '#eff6ff', border: '1px solid #bfdbfe', borderRadius: '8px', padding: '14px', textAlign: 'center' }}>
                        <div style={{ fontSize: '10px', color: '#1e40af', fontWeight: 'bold' }}>MATERIALES</div>
                        <div style={{ fontSize: '24px', fontWeight: 'bold', color: '#1d4ed8' }}>{data.uniqueMaterialCount}</div>
                    </div>
                    <div style={{ background: '#ecfdf5', border: '1px solid #a7f3d0', borderRadius: '8px', padding: '14px', textAlign: 'center' }}>
                        <div style={{ fontSize: '10px', color: '#065f46', fontWeight: 'bold' }}>ROTACIÓN</div>
                        <div style={{ fontSize: '24px', fontWeight: 'bold', color: '#059669' }}>{data.turnoverRate}%</div>
                    </div>
                    <div style={{ background: '#fef2f2', border: '1px solid #fecaca', borderRadius: '8px', padding: '14px', textAlign: 'center' }}>
                        <div style={{ fontSize: '10px', color: '#991b1b', fontWeight: 'bold' }}>STOCK MUERTO</div>
                        <div style={{ fontSize: '24px', fontWeight: 'bold', color: '#dc2626' }}>{data.deadStockCount}</div>
                    </div>
                    <div style={{ background: '#fffbeb', border: '1px solid #fcd34d', borderRadius: '8px', padding: '14px', textAlign: 'center' }}>
                        <div style={{ fontSize: '10px', color: '#92400e', fontWeight: 'bold' }}>STOCK CRÍTICO</div>
                        <div style={{ fontSize: '24px', fontWeight: 'bold', color: '#d97706' }}>{data.lowStockCount}</div>
                    </div>
                </div>
            </div>
        </div>
    );
}
