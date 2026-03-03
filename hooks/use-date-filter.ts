import { useState, useMemo } from 'react';
import type { DateFilter } from '@/components/filters/date-range-filter';

export function useDateFilter(allOrders: any[]) {
    const [dateFilter, setDateFilter] = useState<DateFilter | null>(null);

    const filteredOrders = useMemo(() => {
        if (!dateFilter || !dateFilter.startDate || !dateFilter.endDate) return allOrders;

        return allOrders.filter(order => {
            // Normalizar fecha de la orden (priorizando fecha_ingreso que es la del negocio)
            const dateStr = order.fecha_ingreso || order.created_at || order.creado_en;
            if (!dateStr) return false;

            const orderDate = new Date(dateStr);
            orderDate.setHours(0, 0, 0, 0);

            const start = new Date(dateFilter.startDate!);
            start.setHours(0, 0, 0, 0);

            const end = new Date(dateFilter.endDate!);
            end.setHours(23, 59, 59, 999);

            return orderDate >= start && orderDate <= end;
        });
    }, [allOrders, dateFilter]);

    return { dateFilter, setDateFilter, filteredOrders };
}
