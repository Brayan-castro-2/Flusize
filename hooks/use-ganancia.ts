import { useQuery } from '@tanstack/react-query';
import { obtenerGananciaHistorica } from '@/lib/storage-adapter';
import { useAuth } from '@/contexts/auth-context';

export function useGananciaHistorica() {
    const { user } = useAuth();

    return useQuery<number>({
        queryKey: ['ganancia_historica', user?.tallerId || 'all'],
        queryFn: () => {
            if (!user?.tallerId) return Promise.resolve(0);
            return obtenerGananciaHistorica(user.tallerId);
        },
        staleTime: 5 * 60 * 1000, // caché por 5 minutos
        gcTime: 30 * 60 * 1000,
        refetchOnWindowFocus: true,
        enabled: !!user, // Solo si el usuario está autenticado
    });
}
