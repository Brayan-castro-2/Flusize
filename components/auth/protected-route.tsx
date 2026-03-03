'use client';

import { useEffect, useState } from 'react';
import { useRouter } from 'next/navigation';
import { useAuth } from '@/contexts/auth-context';
import { UserRole } from '@/lib/types';
import { Loader2 } from 'lucide-react';

interface ProtectedRouteProps {
    children: React.ReactNode;
    allowedRoles?: ('mecanico' | 'taller_admin' | 'admin' | 'superadmin')[];
    requirePaidPlan?: boolean;
}

export function ProtectedRoute({ children, allowedRoles, requirePaidPlan }: ProtectedRouteProps) {
    const { user, isLoading } = useAuth();
    const router = useRouter();
    const [showContent, setShowContent] = useState(false);

    useEffect(() => {
        const checkAuth = async () => {
            if (!isLoading) {
                if (!user) {
                    await fetch('/api/auth/logout', { method: 'POST' }).catch(() => { });
                    router.push('/login');
                    return;
                }

                const currentPath = window.location.pathname;
                const isPremiumRoute = currentPath.startsWith('/admin') &&
                    !currentPath.startsWith('/admin/perfil') &&
                    currentPath !== '/admin/perfil';

                // FASE 75: Bloqueo de Plan Gratis en rutas premium
                const userPlan = (user?.plan || 'GRATIS').toUpperCase();

                if (userPlan === 'GRATIS' && isPremiumRoute) {
                    console.log('🚫 ProtectedRoute FASE 75: Bloqueo Plan Gratis en', currentPath);
                    if (requirePaidPlan) {
                        router.push('/admin/perfil');
                        return;
                    }
                    // Bloqueo preventivo en FASE 75 para rutas premium si no hay plan
                    return;
                }

                if (allowedRoles && !allowedRoles.includes(user.role as any)) {
                    if (user.role === 'mecanico') {
                        router.push('/recepcion');
                    } else {
                        router.push('/admin');
                    }
                } else {
                    setShowContent(true);
                }
            }
        };
        checkAuth();
    }, [user, isLoading, allowedRoles, router]);

    // Mostrar loading mientras se verifica la sesión
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
