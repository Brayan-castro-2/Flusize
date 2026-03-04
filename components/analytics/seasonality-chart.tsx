'use client';

import { useMemo } from 'react';
import { BarChart, Bar, XAxis, YAxis, CartesianGrid, Tooltip, ResponsiveContainer, Cell } from 'recharts';
import { OrdenDB } from '@/lib/storage-adapter';
import { CalendarDays } from 'lucide-react';
import { Card } from '@/components/ui/card';

interface SeasonalityChartProps {
    orders: OrdenDB[];
}

const MONTHS = [
    'Ene', 'Feb', 'Mar', 'Abr', 'May', 'Jun',
    'Jul', 'Ago', 'Sep', 'Oct', 'Nov', 'Dic'
];

const PRIMARY_COLOR = '#0066FF';
const HOVER_COLOR = '#3b82f6';

export function SeasonalityChart({ orders }: SeasonalityChartProps) {
    const chartData = useMemo(() => {
        // Inicializar arreglo de 12 meses en 0
        const monthlyData = MONTHS.map(month => ({
            name: month,
            totalCLP: 0,
            ordersCount: 0
        }));

        // Filtrar y sumar las ordenes pagadas / completadas
        const validOrders = orders.filter(
            o => (o.estado === 'completada' || o.estado === 'entregada')
        );

        validOrders.forEach(order => {
            if (!order.fecha_ingreso) return;

            const date = new Date(order.fecha_ingreso);
            if (isNaN(date.getTime())) return;

            const monthIndex = date.getMonth(); // 0 a 11

            const precioStr = String(order.precio_total || 0).replace(/\D/g, '');
            const price = parseInt(precioStr, 10) || 0;

            if (price > 0 && monthIndex >= 0 && monthIndex < 12) {
                monthlyData[monthIndex].totalCLP += price;
                monthlyData[monthIndex].ordersCount += 1;
            }
        });

        return monthlyData;
    }, [orders]);

    const totalRevenue = chartData.reduce((sum, item) => sum + item.totalCLP, 0);

    const formatCLP = (value: number) => {
        return new Intl.NumberFormat('es-CL', { style: 'currency', currency: 'CLP' }).format(value);
    };

    return (
        <Card className="col-span-1 lg:col-span-2 bg-white dark:bg-gray-800 border-slate-200 dark:border-gray-700 p-6 shadow-sm w-full">
            <div className="mb-6">
                <h3 className="text-lg font-semibold text-slate-900 dark:text-gray-100 flex items-center gap-2">
                    <CalendarDays className="w-5 h-5 text-blue-600 dark:text-blue-400" />
                    Estacionalidad (Histórico por Mes)
                </h3>
                <p className="text-sm text-slate-500 dark:text-gray-400 mt-1">
                    Ingreso Acumulado Global: <span className="font-bold text-slate-900 dark:text-gray-200">{formatCLP(totalRevenue)}</span>
                </p>
            </div>

            <div style={{ height: 400, width: '100%' }}>
                <ResponsiveContainer width="100%" height="100%">
                    <BarChart
                        data={chartData}
                        margin={{ top: 10, right: 10, left: 10, bottom: 5 }}
                    >
                        <CartesianGrid strokeDasharray="3 3" vertical={false} stroke="#e2e8f0" />
                        <XAxis
                            dataKey="name"
                            axisLine={false}
                            tickLine={false}
                            tick={{ fill: '#64748b', fontSize: 13, fontWeight: 500 }}
                            dy={10}
                        />
                        <YAxis
                            hide
                            type="number"
                        />
                        <Tooltip
                            cursor={{ fill: 'rgba(59, 130, 246, 0.05)' }}
                            contentStyle={{
                                backgroundColor: '#ffffff',
                                border: '1px solid #e2e8f0',
                                borderRadius: '8px',
                                color: '#0f172a',
                                boxShadow: '0 4px 6px -1px rgb(0 0 0 / 0.1)',
                            }}
                            formatter={(value: number | string | Array<number | string> | undefined) => [formatCLP(Number(value) || 0), 'Ingresos']}
                            labelFormatter={(label) => `Mes: ${label}`}
                            itemStyle={{ color: '#0f172a', fontWeight: 'bold' }}
                            labelStyle={{ color: '#64748b', marginBottom: '4px' }}
                        />
                        <Bar
                            dataKey="totalCLP"
                            name="Ingresos"
                            radius={[4, 4, 0, 0]}
                            barSize={32}
                            fill={PRIMARY_COLOR}
                        >
                            {
                                chartData.map((entry, index) => (
                                    <Cell key={`cell-${index}`} fill={PRIMARY_COLOR} />
                                ))
                            }
                        </Bar>
                    </BarChart>
                </ResponsiveContainer>
            </div>
        </Card>
    );
}
