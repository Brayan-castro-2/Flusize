import { useQuery, useQueryClient, useMutation, useInfiniteQuery } from '@tanstack/react-query';
import { obtenerOrdenes, eliminarOrden, actualizarOrden, obtenerOrdenesCount, obtenerOrdenesPaginadas } from '@/lib/storage-adapter';
import { OrdenDB } from '@/lib/supabase';
import type { OrderRestFilters } from '@/lib/supabase-service';

export const ORDERS_QUERY_KEY = ['orders'];

// Hook para scroll infinito (Obsoleto post-refactor Paginado)
export function useInfiniteOrders(tallerId?: string) {
    return useInfiniteQuery({
        queryKey: ['orders', 'infinite', tallerId],
        queryFn: async ({ pageParam = 0 }) => {
            const limit = 20;
            const orders = await obtenerOrdenes(limit, pageParam, tallerId);
            return {
                orders,
                nextCursor: orders.length === limit ? pageParam + limit : undefined,
            };
        },
        enabled: !!tallerId,
        initialPageParam: 0,
        getNextPageParam: (lastPage) => lastPage.nextCursor,
        staleTime: 5 * 60 * 1000,
        gcTime: 15 * 60 * 1000,
        placeholderData: (previousData) => previousData,
    });
}

// NUEVO: Hook para Paginación Server-Side y Filtrado
export function usePaginatedOrders(
    page: number,
    pageSize: number,
    searchTerm: string,
    filters: OrderRestFilters,
    tallerId?: string
) {
    return useQuery({
        queryKey: ['orders', 'paginated', page, pageSize, searchTerm, filters, tallerId],
        queryFn: async () => {
            return await obtenerOrdenesPaginadas(page, pageSize, searchTerm, filters, tallerId);
        },
        enabled: !!tallerId,
        staleTime: 0, // 0 para forzar obtención fresca siempre (evitamos el bug de 1446)
        gcTime: 1 * 60 * 1000,
        refetchOnWindowFocus: true,
        placeholderData: (previousData) => previousData, // Transición suave Skeleton
    });
}

// Hook para obtener el total de órdenes
export function useOrdersCount(tallerId?: string) {
    return useQuery({
        queryKey: ['orders', 'count', tallerId],
        queryFn: () => obtenerOrdenesCount(tallerId),
        enabled: !!tallerId,
        staleTime: 30 * 1000,
    });
}

export function useOrders() {
    // Mantener compatibilidad con uso anterior, pero ahora trae todo (sin limit)
    // O podríamos hacer que use useInfiniteOrders internamente si quisiéramos migrar todo
    return useQuery({
        queryKey: ORDERS_QUERY_KEY,
        queryFn: () => obtenerOrdenes(), // Explicitly call with no args to get all (or default)
        staleTime: 5 * 60 * 1000,
        gcTime: 15 * 60 * 1000,
        refetchOnWindowFocus: true,
        refetchOnReconnect: true,
        refetchOnMount: false,
        refetchInterval: 30000, // Reduced aggressive background fetching
        refetchIntervalInBackground: true,
    });
}

export function usePrefetchOrders() {
    const queryClient = useQueryClient();

    return () => {
        queryClient.prefetchQuery({
            queryKey: ORDERS_QUERY_KEY,
            queryFn: () => obtenerOrdenes(),
        });
    };
}

export function useInvalidateOrders() {
    const queryClient = useQueryClient();

    return () => {
        queryClient.invalidateQueries({ queryKey: ORDERS_QUERY_KEY });
    };
}

export function useDeleteOrder() {
    const queryClient = useQueryClient();

    return useMutation({
        mutationFn: (orderId: string) => eliminarOrden(orderId),
        onMutate: async (orderId) => {
            // Cancelar cualquier refetch saliente
            await queryClient.cancelQueries({ queryKey: ['orders'] });
            await queryClient.cancelQueries({ queryKey: ['dashboard_orders'] });

            // Snapshot del estado previo
            const previousOrders = queryClient.getQueryData<OrdenDB[]>(['orders']);
            const previousDashboard = queryClient.getQueryData<OrdenDB[]>(['dashboard_orders']);
            const previousInfinite = queryClient.getQueryData<any>(['orders', 'infinite']);

            // Actualizar caché de manera optimista
            // 1. Lista simple
            queryClient.setQueryData<OrdenDB[]>(['orders'], (old) =>
                old?.filter(o => o.id !== orderId)
            );

            // 2. Dashboard
            queryClient.setQueryData<OrdenDB[]>(['dashboard_orders'], (old) =>
                old?.filter(o => o.id !== orderId)
            );

            // 3. Infinite Scroll (Pages)
            queryClient.setQueryData<any>(['orders', 'infinite'], (old: any) => {
                if (!old) return old;
                return {
                    ...old,
                    pages: old.pages.map((page: any) => ({
                        ...page,
                        orders: page.orders.filter((o: any) => o.id !== orderId)
                    }))
                };
            });

            return { previousOrders, previousDashboard, previousInfinite };
        },
        onError: (err, orderId, context) => {
            // Rollback si falla
            if (context?.previousOrders) queryClient.setQueryData(['orders'], context.previousOrders);
            if (context?.previousDashboard) queryClient.setQueryData(['dashboard_orders'], context.previousDashboard);
            if (context?.previousInfinite) queryClient.setQueryData(['orders', 'infinite'], context.previousInfinite);
        },
        onSettled: () => {
            // Sincronizar con el servidor
            queryClient.invalidateQueries({ queryKey: ['orders'] });
            queryClient.invalidateQueries({ queryKey: ['dashboard_orders'] });
        },
    });
}

export function useUpdateOrder() {
    const queryClient = useQueryClient();

    return useMutation({
        mutationFn: ({ id, updates }: { id: string; updates: Partial<Omit<OrdenDB, 'id' | 'fecha_ingreso'>> }) =>
            actualizarOrden(id, updates),
        onMutate: async ({ id, updates }) => {
            await queryClient.cancelQueries({ queryKey: ['orders'] });
            await queryClient.cancelQueries({ queryKey: ['dashboard_orders'] });

            const previousOrders = queryClient.getQueryData<OrdenDB[]>(['orders']);
            const previousDashboard = queryClient.getQueryData<OrdenDB[]>(['dashboard_orders']);
            const previousInfinite = queryClient.getQueryData<any>(['orders', 'infinite']);

            const updateItem = (old: OrdenDB[] | undefined) =>
                old?.map(o => o.id === id ? { ...o, ...updates } : o);

            // Actualizar caché de inmediato
            queryClient.setQueryData<OrdenDB[]>(['orders'], updateItem);
            queryClient.setQueryData<OrdenDB[]>(['dashboard_orders'], updateItem);

            // Actualizar Infinite Scroll
            queryClient.setQueryData<any>(['orders', 'infinite'], (old: any) => {
                if (!old) return old;
                return {
                    ...old,
                    pages: old.pages.map((page: any) => ({
                        ...page,
                        orders: page.orders.map((o: any) => o.id === id ? { ...o, ...updates } : o)
                    }))
                };
            });

            return { previousOrders, previousDashboard, previousInfinite };
        },
        onError: (err, variables, context) => {
            if (context?.previousOrders) queryClient.setQueryData(['orders'], context.previousOrders);
            if (context?.previousDashboard) queryClient.setQueryData(['dashboard_orders'], context.previousDashboard);
            if (context?.previousInfinite) queryClient.setQueryData(['orders', 'infinite'], context.previousInfinite);
        },
        onSettled: () => {
            queryClient.invalidateQueries({ queryKey: ['orders'] });
            queryClient.invalidateQueries({ queryKey: ['dashboard_orders'] });
        },
    });
}
