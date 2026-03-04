'use client';

import { useMemo } from 'react';
import { BarChart, Bar, XAxis, YAxis, CartesianGrid, Tooltip, ResponsiveContainer, Cell } from 'recharts';
import { OrdenDB } from '@/lib/storage-adapter';
import { Wrench } from 'lucide-react';
import { Card } from '@/components/ui/card';

interface TopServicesChartProps {
    orders: OrdenDB[];
}

// Sleek orange shade for the bars
const BAR_COLOR = '#FF4D00';
const OTHERS_COLOR = '#94a3b8';

const SERVICE_CATEGORIES = [
    { key: 'Reprogramaciones', keywords: ['REPRO', 'REPROGRAMACION', 'CHIP', 'STAGE'] },
    { key: 'Sistemas de Escape', keywords: ['ESCAPE', 'SILENCIADOR', 'RESONADOR', 'LINEA', 'MUFFLER', 'COLAS', 'AXLE'] },
    { key: 'Downpipes & Headers', keywords: ['DOWNPIPE', 'HEADER', 'MULTIPLE'] },
    { key: 'Válvulas Cut-Out', keywords: ['CUT-OUT', 'CUT OUT', 'CUTOUT', 'VALVULA'] },
    { key: 'Mantenciones', keywords: ['MANTENCION', 'ACEITE', 'FILTRO', 'BUJIAS', 'FRENOS', 'PASTILLAS'] },
];

export function TopServicesChart({ orders }: TopServicesChartProps) {
    const chartData = useMemo(() => {
        // Solo considerar ordenes con plata recaudada y completadas/entregadas
        const validOrders = orders.filter(
            o => (o.estado === 'completada' || o.estado === 'entregada') && (typeof o.precio_total === 'number' || typeof o.precio_total === 'string')
        );

        const categoryRevenue: Record<string, number> = {};

        validOrders.forEach(order => {
            const desc = (order.descripcion_ingreso || '').toUpperCase() + ' ' + (order.detalle_trabajos || '').toUpperCase();
            const precioStr = String(order.precio_total || 0).replace(/\D/g, '');
            const price = parseInt(precioStr, 10) || 0;

            if (price <= 0) return;

            let matchedCategory = 'Otros Servicios';

            // Match description to predefined categories
            for (const cat of SERVICE_CATEGORIES) {
                if (cat.keywords.some(kw => desc.includes(kw))) {
                    matchedCategory = cat.key;
                    break;
                }
            }

            categoryRevenue[matchedCategory] = (categoryRevenue[matchedCategory] || 0) + price;
        });

        // Convert to array and sort by revenue descending
        let sortedCategories = Object.entries(categoryRevenue)
            .map(([name, totalCLP]) => ({ name, totalCLP }))
            .sort((a, b) => b.totalCLP - a.totalCLP);

        // Group into top 5 and "Otros Servicios" (if "Otros Servicios" isn't already there naturally or needs merging)
        const TOP_LIMIT = 5;
        const topCats = sortedCategories.filter(c => c.name !== 'Otros Servicios').slice(0, TOP_LIMIT);

        let othersTotal = sortedCategories
            .filter(c => c.name === 'Otros Servicios' || !topCats.find(t => t.name === c.name))
            .reduce((sum, item) => sum + item.totalCLP, 0);

        if (othersTotal > 0) {
            topCats.push({ name: 'OTROS SERVICIOS', totalCLP: othersTotal });
        }

        // Recharts vertical bar chart displays from bottom to top by default, 
        // to show largest at the top we reverse the array
        return topCats.reverse();
    }, [orders]);

    const totalRevenue = chartData.reduce((sum, item) => sum + item.totalCLP, 0);

    const formatCLP = (value: number) => {
        return new Intl.NumberFormat('es-CL', { style: 'currency', currency: 'CLP' }).format(value);
    };

    return (
        <Card className="bg-white dark:bg-gray-800 border-slate-200 dark:border-gray-700 p-6 shadow-sm w-full">
            <div className="mb-6">
                <h3 className="text-lg font-semibold text-slate-900 dark:text-gray-100 flex items-center gap-2">
                    <Wrench className="w-5 h-5 text-[#FF4D00]" />
                    Rentabilidad por Servicio
                </h3>
                <p className="text-sm text-slate-500 dark:text-gray-400 mt-1">
                    Ingresos clasificados: <span className="font-bold text-slate-900 dark:text-gray-200">{formatCLP(totalRevenue)}</span>
                </p>
            </div>

            {chartData.length > 0 ? (
                <div style={{ height: 400, width: '100%' }}>
                    <ResponsiveContainer width="100%" height="100%">
                        <BarChart
                            layout="vertical"
                            data={chartData}
                            margin={{ top: 5, right: 30, left: 60, bottom: 5 }}
                        >
                            <CartesianGrid strokeDasharray="3 3" horizontal={true} vertical={false} stroke="#e2e8f0" />
                            <XAxis
                                type="number"
                                hide
                            />
                            <YAxis
                                type="category"
                                dataKey="name"
                                axisLine={false}
                                tickLine={false}
                                tick={{ fill: '#64748b', fontSize: 11, fontWeight: 500 }}
                            />
                            <Tooltip
                                cursor={{ fill: 'transparent' }}
                                contentStyle={{
                                    backgroundColor: '#ffffff',
                                    border: '1px solid #e2e8f0',
                                    borderRadius: '8px',
                                    color: '#0f172a',
                                    boxShadow: '0 4px 6px -1px rgb(0 0 0 / 0.1)',
                                }}
                                formatter={(value: number | string | Array<number | string> | undefined) => [formatCLP(Number(value) || 0), 'Ingresos']}
                                itemStyle={{ color: '#0f172a', fontWeight: 'bold' }}
                                labelStyle={{ color: '#64748b', marginBottom: '4px' }}
                            />
                            <Bar
                                dataKey="totalCLP"
                                name="Ingresos"
                                radius={[0, 4, 4, 0]}
                                barSize={24}
                            >
                                {chartData.map((entry, index) => (
                                    <Cell key={`cell-${index}`} fill={entry.name === 'OTROS SERVICIOS' ? OTHERS_COLOR : BAR_COLOR} />
                                ))}
                            </Bar>
                        </BarChart>
                    </ResponsiveContainer>
                </div>
            ) : (
                <div className="h-[400px] flex items-center justify-center text-slate-400">
                    No hay ingresos consolidados aún
                </div>
            )}
        </Card>
    );
}
