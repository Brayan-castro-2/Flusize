'use client';
import { useState } from 'react';
import { Card, CardContent } from '@/components/ui/card';
import { Button } from '@/components/ui/button';
import { Calendar, X, DollarSign, FileText } from 'lucide-react';

export interface DateFilter {
    year?: number;
    month?: number;
    startDate?: Date;
    endDate?: Date;
}

interface DateRangeFilterProps {
    onFilterChange: (filter: DateFilter | null) => void;
    totalOrders: number;
    totalRevenue: number;
}

const MONTHS = [
    { value: 1, label: 'Enero' }, { value: 2, label: 'Febrero' }, { value: 3, label: 'Marzo' },
    { value: 4, label: 'Abril' }, { value: 5, label: 'Mayo' }, { value: 6, label: 'Junio' },
    { value: 7, label: 'Julio' }, { value: 8, label: 'Agosto' }, { value: 9, label: 'Septiembre' },
    { value: 10, label: 'Octubre' }, { value: 11, label: 'Noviembre' }, { value: 12, label: 'Diciembre' },
];

export function DateRangeFilter({ onFilterChange, totalOrders, totalRevenue }: DateRangeFilterProps) {
    const currentYear = new Date().getFullYear();
    const [selectedYear, setSelectedYear] = useState<number>(currentYear);
    const [selectedMonth, setSelectedMonth] = useState<number | null>(null);

    const handleApplyFilter = () => {
        if (!selectedYear) return;
        const filter: DateFilter = { year: selectedYear, month: selectedMonth || undefined };

        if (selectedMonth) {
            filter.startDate = new Date(selectedYear, selectedMonth - 1, 1);
            filter.endDate = new Date(selectedYear, selectedMonth, 0, 23, 59, 59);
        } else {
            filter.startDate = new Date(selectedYear, 0, 1);
            filter.endDate = new Date(selectedYear, 11, 31, 23, 59, 59);
        }
        onFilterChange(filter);
    };

    const handleClearFilter = () => {
        setSelectedYear(currentYear);
        setSelectedMonth(null);
        onFilterChange(null);
    };

    const years = Array.from({ length: 10 }, (_, i) => currentYear - i);

    return (
        <Card className="bg-white border-gray-200 mb-6 shadow-sm">
            <CardContent className="p-4 space-y-4">
                <div className="flex items-center gap-2">
                    <Calendar className="w-5 h-5 text-[#0066FF]" />
                    <h3 className="text-gray-800 font-semibold">Filtrar por Fecha</h3>
                </div>
                <div className="grid grid-cols-1 sm:grid-cols-2 gap-3">
                    <div>
                        <label className="text-xs text-gray-500 mb-1 block">Año</label>
                        <select
                            value={selectedYear}
                            onChange={(e) => setSelectedYear(Number(e.target.value))}
                            className="w-full bg-gray-50 border border-gray-200 rounded-lg px-3 py-2 text-gray-800 outline-none focus:ring-2 focus:ring-[#0066FF]/20 transition-all"
                        >
                            {years.map(year => <option key={year} value={year}>{year}</option>)}
                        </select>
                    </div>
                    <div>
                        <label className="text-xs text-gray-500 mb-1 block">Mes (Opcional)</label>
                        <select
                            value={selectedMonth || ''}
                            onChange={(e) => setSelectedMonth(e.target.value ? Number(e.target.value) : null)}
                            className="w-full bg-gray-50 border border-gray-200 rounded-lg px-3 py-2 text-gray-800 outline-none focus:ring-2 focus:ring-[#0066FF]/20 transition-all"
                        >
                            <option value="">Todos los meses</option>
                            {MONTHS.map(month => <option key={month.value} value={month.value}>{month.label}</option>)}
                        </select>
                    </div>
                </div>
                <div className="flex gap-2">
                    <Button onClick={handleApplyFilter} className="flex-1 bg-[#0066FF] text-white hover:bg-[#0052CC] transition-colors shadow-sm">
                        Aplicar Filtro
                    </Button>
                    <Button onClick={handleClearFilter} variant="outline" className="border-gray-200 text-gray-600 hover:bg-gray-50">
                        <X className="w-4 h-4" />
                    </Button>
                </div>
                <div className="pt-3 border-t border-gray-100 flex items-center justify-between text-sm">
                    <div className="flex items-center gap-1.5 text-gray-600">
                        <FileText className="w-4 h-4 text-[#0066FF]" />
                        <span>Órdenes: <span className="font-semibold text-gray-800">{totalOrders}</span></span>
                    </div>
                    <div className="flex items-center gap-1.5 text-green-600">
                        <DollarSign className="w-4 h-4" />
                        <span>Ingresos: <span className="font-semibold text-green-700">${totalRevenue.toLocaleString()}</span></span>
                    </div>
                </div>
            </CardContent>
        </Card>
    );
}
