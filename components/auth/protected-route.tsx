'use client';

import { useEffect, useState } from 'react';
import { useRouter } from 'next/navigation';
import { useAuth } from '@/contexts/auth-context';
import { UserRole } from '@/lib/types';
import { Loader2 } from 'lucide-react';

interface ProtectedRouteProps {
    children: React.ReactNode;
    allowedRoles?: ('mecanico' | 'taller_admin' | 'admin' | 'superadmin')[];
}

export function ProtectedRoute({ children, allowedRoles }: ProtectedRouteProps) {
    const { user, isLoading } = useAuth();
    const router = useRouter();
    const [showContent, setShowContent] = useState(false);

    useEffect(() => {
        const checkAuth = async () => {
            console.log('[ProtectedRoute Debug] Effect triggered. isLoading:', isLoading, 'user:', user?.email, 'role:', user?.role, 'allowedRoles:', allowedRoles);
            if (!isLoading) {
                if (!user) {
                    console.log('[ProtectedRoute Debug] No user, clearing cookies and redirecting to /login');
                    // Ensure the server cookie is also cleared so middleware doesn't redirect us back
                    await fetch('/api/auth/logout', { method: 'POST' }).catch(() => { });
                    router.push('/login');
                } else if (allowedRoles && !allowedRoles.includes(user.role as any)) {
                    console.log('[ProtectedRoute Debug] User role not allowed, redirecting from', window.location.pathname);
                    if (user.role === 'mecanico') {
                        router.push('/recepcion');
                    } else {
                        router.push('/admin');
                    }
                } else {
                    console.log('[ProtectedRoute Debug] User valid, showing content.');
                    // Usuario válido, mostrar contenido inmediatamente
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
