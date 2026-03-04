'use client';

import { useMemo } from 'react';
import { BarChart, Bar, XAxis, YAxis, CartesianGrid, Tooltip, ResponsiveContainer, Cell } from 'recharts';
import { OrdenDB } from '@/lib/storage-adapter';
import { Car } from 'lucide-react';
import { Card } from '@/components/ui/card';

interface TopBrandsChartProps {
    orders: OrdenDB[];
}

// Sleek blue shade for the bars
const BAR_COLOR = '#3b82f6';
const OTHERS_COLOR = '#94a3b8';

export function TopBrandsChart({ orders }: TopBrandsChartProps) {
    const chartData = useMemo(() => {
        const brandCounts = orders.reduce((acc, order) => {
            let brand = order.vehiculos?.marca;
            if (!brand || brand.trim() === '-' || brand.trim() === '' || brand.toUpperCase() === 'S/P' || brand.toUpperCase() === 'SIN REGISTRO') {
                return acc; // Skip unassigned or empty
            }
            brand = brand.trim().toUpperCase();

            acc[brand] = (acc[brand] || 0) + 1;
            return acc;
        }, {} as Record<string, number>);

        // Convert to array and sort by count descending
        let sortedBrands = Object.entries(brandCounts)
            .map(([name, cantidad]) => ({ name, cantidad }))
            .sort((a, b) => b.cantidad - a.cantidad);

        // Group into top 10 and "Otros"
        const TOP_LIMIT = 10;
        const topBrands = sortedBrands.slice(0, TOP_LIMIT);
        const otherBrands = sortedBrands.slice(TOP_LIMIT);

        if (otherBrands.length > 0) {
            const othersCount = otherBrands.reduce((sum, item) => sum + item.cantidad, 0);
            topBrands.push({ name: 'OTROS', cantidad: othersCount });
        }

        // Recharts vertical bar chart displays from bottom to top by default, 
        // to show largest at the top we either reverse the data array or set layout props.
        // We'll reverse it so index 0 (which renders at bottom) is the smallest.
        return topBrands.reverse();
    }, [orders]);

    const total = chartData.reduce((sum, item) => sum + item.cantidad, 0);

    return (
        <Card className="bg-white dark:bg-gray-800 border-slate-200 dark:border-gray-700 p-6 shadow-sm w-full">
            <div className="mb-6">
                <h3 className="text-lg font-semibold text-slate-900 dark:text-gray-100 flex items-center gap-2">
                    <Car className="w-5 h-5 text-blue-600 dark:text-blue-400" />
                    Top Marcas Atendidas
                </h3>
                <p className="text-sm text-slate-500 dark:text-gray-400 mt-1">
                    Historial valuado: <span className="font-bold text-slate-900 dark:text-gray-200">{total}</span> vehículos
                </p>
            </div>

            {chartData.length > 0 ? (
                <div style={{ height: 400, width: '100%' }}>
                    <ResponsiveContainer width="100%" height="100%">
                        <BarChart
                            layout="vertical"
                            data={chartData}
                            margin={{ top: 5, right: 30, left: 40, bottom: 5 }}
                        >
                            <CartesianGrid strokeDasharray="3 3" horizontal={true} vertical={false} stroke="#e2e8f0" />
                            <XAxis type="number" hide />
                            <YAxis
                                type="category"
                                dataKey="name"
                                axisLine={false}
                                tickLine={false}
                                tick={{ fill: '#64748b', fontSize: 12, fontWeight: 500 }}
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
                                itemStyle={{ color: '#0f172a', fontWeight: 'bold' }}
                                labelStyle={{ color: '#64748b', marginBottom: '4px' }}
                            />
                            <Bar
                                dataKey="cantidad"
                                name="Órdenes"
                                radius={[0, 4, 4, 0]}
                                barSize={24}
                            >
                                {chartData.map((entry, index) => (
                                    <Cell key={`cell-${index}`} fill={entry.name === 'OTROS' ? OTHERS_COLOR : BAR_COLOR} />
                                ))}
                            </Bar>
                        </BarChart>
                    </ResponsiveContainer>
                </div>
            ) : (
                <div className="h-[400px] flex items-center justify-center text-slate-400">
                    No hay datos de marcas para mostrar
                </div>
            )}
        </Card>
    );
}
