'use server';

import { supabase } from '@/lib/supabase';

export async function getInventoryStats(tallerId: string) {
    try {
        if (!tallerId) throw new Error("Taller ID is required");

        // 1. Fetch all products
        const { data: qProducts, error: errProducts } = await supabase
            .from('productos')
            .select('codigo, nombre, stock_actual, stock_minimo, precio_venta, precio_compra, porcentaje_iva')
            .eq('taller_id', tallerId);

        if (errProducts) throw errProducts;
        const products = qProducts || [];

        // 2. Fetch all movements (not soft-deleted)
        const { data: qMovements, error: errMovements } = await supabase
            .from('movimientos_inventario')
            .select('codigo_producto, cantidad, tipo_movimiento, fecha, anio, mes')
            .eq('taller_id', tallerId)
            .is('eliminado_en', null);

        if (errMovements) throw errMovements;
        const movements = qMovements || [];

        // ── Basic KPIs ─────────────────────────────────────────────────────────
        const totalStock = products.reduce((acc, p) => acc + (p.stock_actual || 0), 0);
        const uniqueMaterialsWithMovements = new Set(movements.map(m => m.codigo_producto)).size;

        const totalSalidas = movements
            .filter(m => m.tipo_movimiento === 'SALIDA')
            .reduce((acc, m) => acc + (m.cantidad || 0), 0);

        let turnoverRate = "0.0";
        if (totalStock > 0) {
            turnoverRate = ((totalSalidas / totalStock) * 100).toFixed(1);
        } else if (totalSalidas > 0) {
            turnoverRate = "100.0";
        }

        const entriesCount = movements.filter(m => m.tipo_movimiento === 'ENTRADA').length;
        const exitsCount = movements.filter(m => m.tipo_movimiento === 'SALIDA').length;
        const adjustmentsCount = movements.filter(m => m.tipo_movimiento === 'AJUSTE').length;

        const statusCounts = [
            { name: 'Entradas', value: entriesCount },
            { name: 'Salidas', value: exitsCount },
            { name: 'Ajustes', value: adjustmentsCount }
        ].filter(s => s.value > 0);

        // ── Dead / Low Stock ────────────────────────────────────────────────────
        const ninetyDaysAgo = new Date();
        ninetyDaysAgo.setDate(ninetyDaysAgo.getDate() - 90);

        const deadStockItems = products
            .filter(p => p.stock_actual > 0)
            .map(p => {
                const productMovements = movements.filter(m => m.codigo_producto === p.codigo);
                if (productMovements.length === 0) return { ...p, lastActivity: null };
                const latest = productMovements.sort((a, b) => new Date(b.fecha).getTime() - new Date(a.fecha).getTime())[0];
                return { ...p, lastActivity: new Date(latest.fecha) };
            })
            .filter(p => !p.lastActivity || p.lastActivity < ninetyDaysAgo)
            .map(p => ({
                id: p.codigo, materialReference: p.codigo,
                company: p.nombre || 'Sin nombre',
                stockCount: p.stock_actual, lastActivity: p.lastActivity || new Date(0)
            }));

        const deadStockCount = deadStockItems.length;

        const lowStockItems = products
            .filter(p => p.stock_actual <= (p.stock_minimo || 0))
            .map(p => ({
                id: p.codigo, materialReference: p.codigo,
                company: p.nombre || 'Sin nombre',
                stockCount: p.stock_actual, limit: p.stock_minimo || 0
            }));

        const lowStockCount = lowStockItems.length;

        // ── Top Materials ────────────────────────────────────────────────────────
        const movementCountsByProduct = movements.reduce((acc, m) => {
            acc[m.codigo_producto] = (acc[m.codigo_producto] || 0) + 1;
            return acc;
        }, {} as Record<string, number>);

        const topMaterials = Object.entries(movementCountsByProduct)
            .sort(([, a], [, b]) => b - a)
            .slice(0, 5)
            .map(([codigo, count]) => {
                const product = products.find(p => p.codigo === codigo);
                return {
                    reference: codigo,
                    name: product?.nombre || 'Desconocido',
                    transactionCount: count,
                    totalStock: product?.stock_actual || 0
                };
            });

        // ── FINANCIAL KPIs ───────────────────────────────────────────────────────
        // Build a product map for fast price lookups
        const productMap: Record<string, { precio_venta: number | null; precio_compra: number | null }> = {};
        products.forEach(p => {
            productMap[p.codigo] = { precio_venta: p.precio_venta, precio_compra: p.precio_compra };
        });

        // Gasto total: sum(cantidad_entrada * precio_compra) for ENTRADAS where precio_compra is known
        let gastoTotal = 0;
        movements
            .filter(m => m.tipo_movimiento === 'ENTRADA')
            .forEach(m => {
                const costo = productMap[m.codigo_producto]?.precio_compra;
                if (costo != null) gastoTotal += (m.cantidad || 0) * costo;
            });

        // Ingresos generados: sum(cantidad_salida * precio_venta) for SALIDAS where precio_venta is known
        let ingresosGenerados = 0;
        movements
            .filter(m => m.tipo_movimiento === 'SALIDA')
            .forEach(m => {
                const pvp = productMap[m.codigo_producto]?.precio_venta;
                if (pvp != null) ingresosGenerados += (m.cantidad || 0) * pvp;
            });

        // Proyección: valor total del stock actual a precio de venta
        let proyeccionVentas = 0;
        products.forEach(p => {
            if (p.precio_venta != null && p.stock_actual > 0) {
                proyeccionVentas += p.stock_actual * p.precio_venta;
            }
        });

        // Ganancia bruta estimada (ingresos - gastos)
        const gananciaBruta = ingresosGenerados - gastoTotal;

        // Margen promedio
        const margenPorc = gastoTotal > 0
            ? ((gananciaBruta / gastoTotal) * 100).toFixed(1)
            : "0.0";

        // ── MONTHLY FINANCIAL BREAKDOWN (last 6 months) ──────────────────────────
        const sixMonthsAgo = new Date();
        sixMonthsAgo.setMonth(sixMonthsAgo.getMonth() - 5);
        sixMonthsAgo.setDate(1);

        // month-key => { name, gasto, ingresos, ganancia, transacciones }
        const monthlyMap: Record<string, {
            name: string; label: string; sortKey: string;
            gasto: number; ingresos: number; ganancia: number; transacciones: number;
        }> = {};

        // Initialize last 6 months to guarantee all slots present even if empty
        for (let i = 5; i >= 0; i--) {
            const d = new Date();
            d.setMonth(d.getMonth() - i);
            d.setDate(1);
            const key = `${d.getFullYear()}-${String(d.getMonth() + 1).padStart(2, '0')}`;
            const label = d.toLocaleString('es-ES', { month: 'short' }).replace('.', '');
            monthlyMap[key] = { name: label, label: `${label} ${d.getFullYear()}`, sortKey: key, gasto: 0, ingresos: 0, ganancia: 0, transacciones: 0 };
        }

        movements.forEach(m => {
            const date = new Date(m.fecha);
            if (date < sixMonthsAgo) return;
            const key = `${date.getFullYear()}-${String(date.getMonth() + 1).padStart(2, '0')}`;
            if (!monthlyMap[key]) return;

            monthlyMap[key].transacciones += 1;

            const prod = productMap[m.codigo_producto];
            if (m.tipo_movimiento === 'ENTRADA' && prod?.precio_compra != null) {
                const g = (m.cantidad || 0) * prod.precio_compra;
                monthlyMap[key].gasto += g;
            }
            if (m.tipo_movimiento === 'SALIDA' && prod?.precio_venta != null) {
                const ing = (m.cantidad || 0) * prod.precio_venta;
                monthlyMap[key].ingresos += ing;
            }
        });

        // Calculate monthly ganancia
        const monthlyFinancial = Object.values(monthlyMap)
            .sort((a, b) => a.sortKey.localeCompare(b.sortKey))
            .map(m => ({ ...m, ganancia: m.ingresos - m.gasto }));

        // Monthly activity for chart (kept for backward compat)
        const monthlyActivity = monthlyFinancial.map(m => ({
            name: m.name, entry: m.transacciones
        }));

        return {
            // Standard KPIs
            statusCounts, totalStock, uniqueMaterialCount: uniqueMaterialsWithMovements,
            turnoverRate, deadStockCount, deadStockItems, lowStockCount, lowStockItems,
            allLowStockItems: lowStockItems, topMaterials, monthlyActivity,
            // Financial KPIs
            gastoTotal, ingresosGenerados, proyeccionVentas, gananciaBruta,
            margenPorc, monthlyFinancial,
        };

    } catch (error: any) {
        console.error("Error calculating inventory stats:", error);
        throw new Error("Failed to calculate inventory stats: " + error.message);
    }
}
