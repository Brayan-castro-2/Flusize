import { useInfiniteQuery } from '@tanstack/react-query';
import { obtenerClientesPaginados, PaginatedResult } from '@/lib/supabase-service';
import type { ClienteWithStats } from '@/lib/storage-adapter';

export const CLIENTES_QUERY_KEY = ['clientes'];

export function useInfiniteClientes(searchTerm: string = '', pageSize: number = 20) {
    return useInfiniteQuery<PaginatedResult<ClienteWithStats>>({
        queryKey: [...CLIENTES_QUERY_KEY, searchTerm, pageSize],
        queryFn: ({ pageParam = 1 }) =>
            obtenerClientesPaginados(pageParam as number, pageSize, searchTerm),
        getNextPageParam: (lastPage, allPages) => {
            const currentTotal = allPages.length * pageSize;
            return currentTotal < lastPage.count ? allPages.length + 1 : undefined;
        },
        initialPageParam: 1,
        staleTime: 1000 * 60 * 5, // 5 minutos
    });
}
