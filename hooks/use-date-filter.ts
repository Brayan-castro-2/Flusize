import { useState, useMemo } from 'react';
import type { DateFilter } from '@/components/filters/date-range-filter';

export function useDateFilter(allOrders: any[]) {
    const [dateFilter, setDateFilter] = useState<DateFilter | null>(null);

    const filteredOrders = useMemo(() => {
        if (!dateFilter || !dateFilter.startDate || !dateFilter.endDate) return allOrders;

        return allOrders.filter(order => {
            // Asegurarse de usar la fecha de ingreso de la base de datos
            const orderDate = new Date(order.fecha_ingreso || order.created_at);
            return orderDate >= dateFilter.startDate! && orderDate <= dateFilter.endDate!;
        });
    }, [allOrders, dateFilter]);

    return { dateFilter, setDateFilter, filteredOrders };
}
