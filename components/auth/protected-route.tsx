'use client';

import { useEffect, useState } from 'react';
import { useRouter, usePathname } from 'next/navigation';
import { useAuth } from '@/contexts/auth-context';
import { Loader2 } from 'lucide-react';
import { sileo } from 'sileo';

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

            // MATRIZ ESTRICTA DE PERMISOS POR PLAN
            const userPlan = (user?.plan || 'DIGITAL').toUpperCase();
            const isAdminRole = ['superadmin', 'admin', 'flusize_admin'].includes(user.role);

            if (!isAdminRole) {
                const isPlanDigital = userPlan === 'GRATIS' || userPlan === 'DIGITAL';
                const isPlanPro = userPlan === 'PRO';

                if (isPlanDigital) {
                    const permitidasDigital = ['/admin/perfil', '/recepcion', '/admin/ordenes'];
                    const isAllowed = permitidasDigital.some(p => pathname === p || pathname.startsWith(p + '/'));
                    
                    if (pathname.startsWith('/admin') && !isAllowed) {
                        console.log('🚫 ProtectedRoute: Bloqueo Plan Digital en', pathname);
                        // Upsell removed as per request
                    }
                }

                if (isPlanPro) {
                    const bloqueadasPro = ['/admin/inventario', '/admin/reportes'];
                    const isBlocked = bloqueadasPro.some(p => pathname === p || pathname.startsWith(p + '/'));
                    
                    if (isBlocked) {
                        console.log('🚫 ProtectedRoute: Bloqueo Plan Pro en', pathname);
                        // Upsell removed as per request
                    }
                }
            }

            // Verificación de Roles
            if (allowedRoles && !allowedRoles.includes(user.role as any)) {
                console.log(`🚫 ProtectedRoute: Rol ${user.role} no autorizado para ${pathname}`);
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

    const [showRecoveryButton, setShowRecoveryButton] = useState(false);

    useEffect(() => {
        // Temporizador de seguridad: si después de 15s sigue cargando, ofrecer reintento
        const timer = setTimeout(() => {
            if (isLoading || !showContent) {
                setShowRecoveryButton(true);
            }
        }, 15000);

        return () => clearTimeout(timer);
    }, [isLoading, showContent]);

    // Mostrar loading mientras se verifica la sesión o si se decidió ocultar contenido para redirigir
    if (isLoading || !showContent) {
        return (
            <div className="min-h-screen flex items-center justify-center bg-[#121212]">
                <div className="flex flex-col items-center gap-6 px-6 text-center">
                    <div className="flex flex-col items-center gap-3">
                        <Loader2 className="w-8 h-8 animate-spin text-[#0066FF]" />
                        <span className="text-gray-400 text-sm">Cargando aplicación...</span>
                    </div>

                    {showRecoveryButton && (
                        <div className="flex flex-col items-center gap-4 animate-in fade-in slide-in-from-bottom-4 duration-500">
                            <p className="text-sm text-gray-500 max-w-xs">
                                La conexión está tomando más tiempo de lo habitual.
                            </p>
                            <div className="flex flex-col gap-2 w-full">
                                <button
                                    onClick={() => window.location.reload()}
                                    className="px-6 py-2 bg-[#0066FF] hover:bg-[#0052cc] text-white rounded-xl text-sm font-medium transition-all"
                                >
                                    Reintentar Carga
                                </button>
                                <button
                                    onClick={() => router.push('/login')}
                                    className="px-6 py-2 bg-white/5 hover:bg-white/10 text-gray-300 rounded-xl text-sm font-medium transition-all"
                                >
                                    Ir al Login
                                </button>
                            </div>
                        </div>
                    )}
                </div>
            </div>
        );
    }

    return <>{children}</>;
}
