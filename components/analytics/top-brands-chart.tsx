'use client';

import { useMemo } from 'react';
import { BarChart, Bar, XAxis, YAxis, CartesianGrid, Tooltip, ResponsiveContainer, Cell } from 'recharts';
import { OrdenDB } from '@/lib/storage-adapter';
import { Car } from 'lucide-react';
import { Card } from '@/components/ui/card';

interface TopBrandsChartProps {
    orders: OrdenDB[];
    contracts?: any[]; // Contratos firmados opcionales (Rent-A-Car)
}

const BAR_COLOR = '#3b82f6';
const OTHERS_COLOR = '#94a3b8';

export function TopBrandsChart({ orders, contracts = [] }: TopBrandsChartProps) {
    const chartData = useMemo(() => {
        // Acumulador: marca -> ingresos totales (en vez de conteo)
        const brandRevenue: Record<string, number> = {};

        // 1. Órdenes completadas/entregadas → sumar precio_total por marca
        orders.forEach(order => {
            if (order.estado !== 'completada' && order.estado !== 'entregada') return;
            let brand = order.vehiculos?.marca;
            if (!brand || brand.trim() === '-' || brand.trim() === '' || brand.toUpperCase() === 'S/P' || brand.toUpperCase() === 'SIN REGISTRO') return;
            brand = brand.trim().toUpperCase();
            const price = typeof order.precio_total === 'number'
                ? order.precio_total
                : parseInt(String(order.precio_total || 0).replace(/\D/g, ''), 10) || 0;
            brandRevenue[brand] = (brandRevenue[brand] || 0) + price;
        });

        // 2. Contratos firmados → sumar precio_total por marca del vehículo (optional chaining)
        (contracts || []).forEach(c => {
            if (c?.estado !== 'firmado') return;
            const marcaRaw = c?.vehiculo_marca || c?.datos_comerciales?.vehiculo?.split(' ')?.[0] || '';
            if (!marcaRaw || marcaRaw.trim() === '') return;
            const brand = marcaRaw.trim().toUpperCase();
            const price = Number(c?.precio_total) || 0;
            if (price <= 0) return;
            brandRevenue[brand] = (brandRevenue[brand] || 0) + price;
        });

        // Convertir a array y ordenar por ingresos descendente
        const sorted = Object.entries(brandRevenue)
            .map(([name, totalCLP]) => ({ name, totalCLP }))
            .sort((a, b) => b.totalCLP - a.totalCLP);

        const TOP_LIMIT = 10;
        const top = sorted.slice(0, TOP_LIMIT);
        const others = sorted.slice(TOP_LIMIT);

        if (others.length > 0) {
            const othersTotal = others.reduce((sum, i) => sum + i.totalCLP, 0);
            top.push({ name: 'OTROS', totalCLP: othersTotal });
        }

        // Revertir para que el más grande quede arriba en gráfico horizontal
        return top.reverse();
    }, [orders, contracts]);

    const totalRevenue = chartData.reduce((sum, item) => sum + item.totalCLP, 0);
    const formatCLP = (v: number) => new Intl.NumberFormat('es-CL', { style: 'currency', currency: 'CLP', maximumFractionDigits: 0 }).format(v);

    return (
        <Card className="bg-white dark:bg-gray-800 border-slate-200 dark:border-gray-700 p-6 shadow-sm w-full">
            <div className="mb-6">
                <h3 className="text-lg font-semibold text-slate-900 dark:text-gray-100 flex items-center gap-2">
                    <Car className="w-5 h-5 text-blue-600 dark:text-blue-400" />
                    Top Marcas — Ingresos Generados
                </h3>
                <p className="text-sm text-slate-500 dark:text-gray-400 mt-1">
                    Total: <span className="font-bold text-slate-900 dark:text-gray-200">{formatCLP(totalRevenue)}</span>
                    <span className="ml-2 text-xs text-blue-500">(Órdenes + Contratos)</span>
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
