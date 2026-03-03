import { useQuery } from '@tanstack/react-query';
import { obtenerPerfiles } from '@/lib/storage-adapter';
import { useAuth } from '@/contexts/auth-context';

export const PERFILES_QUERY_KEY = ['perfiles'];

export function usePerfiles() {
    const { user } = useAuth();
    return useQuery({
        queryKey: [...PERFILES_QUERY_KEY, user?.tallerId || 'all'],
        queryFn: () => obtenerPerfiles(),
        staleTime: 10 * 60 * 1000, // 10 minutos - los perfiles cambian poco
        gcTime: 30 * 60 * 1000, // 30 minutos en caché
        refetchOnWindowFocus: false, // No refrescar automáticamente
    });
}
