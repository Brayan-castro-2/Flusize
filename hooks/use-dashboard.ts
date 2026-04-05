import { useQuery } from '@tanstack/react-query';
import { obtenerOrdenesLight, obtenerContratosRecent, type OrdenDB } from '@/lib/storage-adapter';
import { useAuth } from '@/contexts/auth-context';

export const DASHBOARD_ORDERS_KEY = ['dashboard_orders'];
export const DASHBOARD_CONTRATOS_KEY = ['dashboard_contratos'];

export function useDashboardOrders() {
    const { user } = useAuth();

    // Si es mecánico, pasar su ID para que solo vea sus órdenes asignadas
    const mecanicoId = user?.role === 'mecanico' ? user.id : undefined;

    return useQuery<OrdenDB[]>({
        queryKey: [...DASHBOARD_ORDERS_KEY, user?.tallerId || 'all', mecanicoId ?? 'all'],
        queryFn: () => obtenerOrdenesLight(mecanicoId),
        staleTime: 0,
        gcTime: 2 * 60 * 1000, // 2 minutos en caché
        refetchOnWindowFocus: true,
        refetchOnReconnect: true,
        refetchOnMount: true,
        refetchInterval: 15000, // Auto-actualizar cada 15 segundos
        refetchIntervalInBackground: true,
        enabled: !!user, // Solo ejecutar si hay un usuario autenticado
    });
}

export function useDashboardContracts() {
    const { user } = useAuth();

    return useQuery<any[]>({
        queryKey: [...DASHBOARD_CONTRATOS_KEY, user?.tallerId || 'all'],
        queryFn: () => obtenerContratosRecent(100), // Fetch up to 100 recent signed contracts
        staleTime: 0,
        gcTime: 5 * 60 * 1000,
        refetchOnWindowFocus: true,
        refetchInterval: 60000, // Refresh every minute
        enabled: !!user,
    });
}
