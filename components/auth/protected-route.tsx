'use client';

import { useEffect, useState } from 'react';
import { useRouter, usePathname } from 'next/navigation';
import { useAuth } from '@/contexts/auth-context';
import { Loader2 } from 'lucide-react';

interface ProtectedRouteProps {
    children: React.ReactNode;
    allowedRoles?: ('mecanico' | 'taller_admin' | 'admin' | 'superadmin' | 'flusize_admin')[];
    requirePaidPlan?: boolean;
}

export function ProtectedRoute({ children, allowedRoles, requirePaidPlan }: ProtectedRouteProps) {
    const { user, isLoading } = useAuth();
    const router = useRouter();
    const pathname = usePathname();
    const [showContent, setShowContent] = useState(false);

    useEffect(() => {
        const checkAuth = async () => {
            // Mientras esté cargando el auth, mantenemos showContent en false
            if (isLoading) return;

            // Logs de depuración silenciosos para diagnosticar en producción
            console.log(`[ProtectedRoute] Check: ${pathname}, Role: ${user?.role}, Plan: ${user?.plan}`);

            if (!user) {
                console.log('[ProtectedRoute] Sesión no encontrada, redirigiendo...');
                setShowContent(false);
                router.push('/login');
                return;
            }

            const currentPath = pathname;
            const isPremiumRoute = currentPath.startsWith('/admin') &&
                !currentPath.startsWith('/admin/perfil') &&
                currentPath !== '/admin/perfil';

            // FASE 75: Bloqueo de Plan Gratis en rutas premium
            const userPlan = (user?.plan || 'GRATIS').toUpperCase();

            // Permitir que admins globales y superadmins omitan este bloqueo para mantenimiento
            const isAdminRole = ['superadmin', 'admin', 'flusize_admin'].includes(user.role);

            if (userPlan === 'GRATIS' && isPremiumRoute && !isAdminRole) {
                console.log('🚫 ProtectedRoute: Bloqueo Plan Gratis en', currentPath);
                setShowContent(false);
                // Si la ruta requiere plan o es el dashboard general, redirigir a perfil
                router.push('/admin/perfil');
                return;
            }

            // Verificación de Roles
            if (allowedRoles && !allowedRoles.includes(user.role as any)) {
                console.log(`🚫 ProtectedRoute: Rol ${user.role} no autorizado para ${currentPath}`);
                setShowContent(false);
                if (user.role === 'mecanico') {
                    router.push('/recepcion');
                } else {
                    router.push('/admin');
                }
                return;
            }

            // Si llegamos aquí, el usuario está autorizado
            setShowContent(true);
        };

        checkAuth();
    }, [user, isLoading, allowedRoles, pathname, router, requirePaidPlan]);

    // Mostrar loading mientras se verifica la sesión o si se decidió ocultar contenido para redirigir
    if (isLoading || !showContent) {
        return (
            <div className="min-h-screen flex items-center justify-center bg-[#121212]">
                <div className="flex flex-col items-center gap-3">
                    <Loader2 className="w-8 h-8 animate-spin text-[#0066FF]" />
                    <span className="text-gray-400 text-sm">Cargando...</span>
                </div>
            </div>
        );
    }

    return <>{children}</>;
}
