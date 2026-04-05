'use client';

import { createContext, useContext, useState, useEffect, ReactNode, useRef, useCallback } from 'react';
import { supabase } from '@/lib/supabase';
import { useRouter } from 'next/navigation';
import { TallerModulos } from '@/config/modules';

const DEFAULT_MODULOS: TallerModulos = {
    agenda: false,
    tracking: false,
    inventario: false,
    checklist: false,
    fiscal: false,
    flota: false,
    contratos: false,
};

const DEFAULT_PLAN = 'GRATIS';

const FOUNDER_EMAILS = ['flusize@gmail.com', 'brayan.castro.2@gmail.com'];

export interface AuthUser {
    id: string;
    email: string;
    name: string;
    role: 'cliente' | 'taller_admin' | 'mecanico' | 'superadmin' | 'admin' | 'flusize_admin' | 'vendedor';
    isActive: boolean;
    tallerId?: string;
    workshopName?: string;
    logoUrl?: string;
    modulos: TallerModulos;
    plan: string;
    permissions: Record<string, boolean>;
}

interface AuthContextType {
    user: AuthUser | null;
    isLoading: boolean;
    logout: () => Promise<void>;
    refetchUser: () => Promise<void>;
    hasPermission: (permission: string) => boolean;
}

const AuthContext = createContext<AuthContextType | undefined>(undefined);

/**
 * Construye un AuthUser básico directamente desde la sesión de Supabase,
 * SIN consultar la base de datos. Permite carga instantánea de la UI.
 */
function buildUserFromSession(authUser: any): AuthUser {
    const isFounder = authUser.email && FOUNDER_EMAILS.includes(authUser.email.toLowerCase());

    let role = authUser.user_metadata?.rol || (isFounder ? 'superadmin' : 'cliente');

    // Override conocido para SteelMonkey
    if (authUser.email === 'contacto@steelmonkey.cl') {
        role = 'superadmin';
    }

    return {
        id: authUser.id,
        email: authUser.email || '',
        name: authUser.user_metadata?.nombre_completo || authUser.email?.split('@')[0] || 'Usuario',
        role: role as any,
        isActive: true,
        tallerId: authUser.user_metadata?.taller_id,
        modulos: { ...DEFAULT_MODULOS },
        plan: DEFAULT_PLAN,
        permissions: {}, // Por defecto vacío, se llena en background
    };
}

export function AuthProvider({ children }: { children: ReactNode }) {
    const [user, setUser] = useState<AuthUser | null>(null);
    const [isLoading, setIsLoading] = useState(true);
    const router = useRouter();
    const enrichmentAbortRef = useRef<AbortController | null>(null);

    /**
     * Enriquece el usuario con datos de base de datos (rol, taller, plan)
     * en segundo plano. Nunca bloquea la UI.
     */
    const enrichUserInBackground = useCallback(async (authUser: any) => {
        // Cancelar enriquecimiento anterior si aún corría
        if (enrichmentAbortRef.current) {
            enrichmentAbortRef.current.abort();
        }
        const abortController = new AbortController();
        enrichmentAbortRef.current = abortController;

        try {
            // Consulta con timeout estricto de 8s
            const profilePromise = supabase
                .from('perfiles')
                .select('*')
                .eq('id', authUser.id)
                .maybeSingle();

            const timeoutPromise = new Promise<{ data: null; error: Error }>((resolve) =>
                setTimeout(() => resolve({ data: null, error: new Error('timeout') }), 8000)
            );

            const { data: perfil, error } = await Promise.race([profilePromise, timeoutPromise]) as any;

            if (abortController.signal.aborted) return;

            if (error?.message === 'timeout') {
                console.warn('[AuthContext] DB enrichment timed out - using session data');
                return;
            }

            let finalRole = perfil?.rol || user?.role || 'cliente';
            const isFounder = authUser.email && FOUNDER_EMAILS.includes(authUser.email.toLowerCase());
            if (!perfil && isFounder) finalRole = 'superadmin';
            if (authUser.email === 'contacto@steelmonkey.cl') finalRole = 'superadmin';

            let finalTallerId = perfil?.taller_id || authUser.user_metadata?.taller_id;
            if (authUser.email === 'contacto@steelmonkey.cl') {
                finalTallerId = 'e55ce6be-7b8c-4a1a-b333-666333666333';
            }

            let modulos: TallerModulos = { ...DEFAULT_MODULOS };
            let plan = DEFAULT_PLAN;
            let workshopName = '';
            let logoUrl = '';

            if (finalTallerId && !abortController.signal.aborted) {
                const tallerPromise = supabase
                    .from('talleres')
                    .select('nombre, logo_url, modulos_activos, plan_suscripcion')
                    .eq('id', finalTallerId)
                    .maybeSingle();

                const tallerTimeout = new Promise<{ data: null; error: Error }>((resolve) =>
                    setTimeout(() => resolve({ data: null, error: new Error('timeout') }), 6000)
                );

                const { data: taller } = await Promise.race([tallerPromise, tallerTimeout]) as any;

                if (!abortController.signal.aborted && taller) {
                    if (taller.modulos_activos) modulos = { ...DEFAULT_MODULOS, ...taller.modulos_activos };
                    if (taller.plan_suscripcion) plan = taller.plan_suscripcion;
                    if (taller.nombre) workshopName = taller.nombre;
                    if (taller.logo_url) logoUrl = taller.logo_url;
                }
            }

            // Consultar permisos RBAC
            let userPermissions: Record<string, boolean> = {};
            if (!abortController.signal.aborted && finalRole) {
                const { data: rawPermisos } = await supabase
                    .from('permisos_rol')
                    .select('permiso, concedido')
                    .eq('rol', finalRole);

                if (rawPermisos) {
                    rawPermisos.forEach(p => {
                        if (p.permiso) {
                            userPermissions[p.permiso] = p.concedido ?? false;
                        }
                    });
                }
            }

            if (abortController.signal.aborted) return;

            const finalUserObj = {
                id: authUser.id,
                email: authUser.email || '',
                name: perfil?.nombre_completo || authUser.user_metadata?.nombre_completo || authUser.email?.split('@')[0] || 'Usuario',
                role: finalRole as any,
                isActive: perfil?.activo ?? true,
                tallerId: finalTallerId,
                workshopName,
                logoUrl,
                modulos,
                plan,
                permissions: userPermissions,
            };

            // Actualizar usuario con datos completos (sin afectar isLoading)
            setUser(finalUserObj);

            // Redirección inteligente post-login basada en el Plan Real
            if (typeof window !== 'undefined' && (window.location.pathname === '/login' || window.location.pathname === '/')) {
                const userPlanStr = (plan || 'DIGITAL').toUpperCase();
                const isPremiumOrPro = userPlanStr === 'PRO' || userPlanStr === 'PREMIUM' || userPlanStr === 'SIZE';
                const esAdmin = ['superadmin', 'admin', 'flusize_admin'].includes(finalRole);
                
                if (isPremiumOrPro || esAdmin) {
                    router.push('/admin'); // Plan de pago o Admins globales van al Dashboard Operativo
                } else {
                    router.push('/recepcion'); // Plan Gratis/Digital va a Recepción o Perfil publico
                }
            }

        } catch (e) {
            if (!abortController.signal.aborted) {
                console.warn('[AuthContext] Background enrichment error:', e);
            }
        }
    }, []);

    useEffect(() => {
        let mounted = true;

        const initSession = async () => {
            try {
                const { data: { session } } = await supabase.auth.getSession();

                if (!mounted) return;

                if (session?.user) {
                    // PASO 1: Carga INMEDIATA desde datos de sesión (0ms de espera)
                    setUser(prev => {
                        const basic = buildUserFromSession(session.user);
                        // Si ya tenemos el mismo usuario enriquecido, no lo "degradamos" a basic
                        if (prev?.id === session.user.id) return prev;
                        return basic;
                    });
                    setIsLoading(false); // ← UI visible de inmediato

                    // PASO 2: Enriquecer con datos de DB en segundo plano
                    enrichUserInBackground(session.user);
                } else {

                    setUser(null);
                    setIsLoading(false);
                }
            } catch (e) {
                console.error('[AuthContext] initSession error:', e);
                if (mounted) setIsLoading(false);
            }
        };

        initSession();

        const { data: { subscription } } = supabase.auth.onAuthStateChange(async (event, session) => {
            if (!mounted) return;

            if (event === 'SIGNED_IN' && session?.user) {
                setUser(prev => {
                    const basic = buildUserFromSession(session.user);
                    if (prev?.id === session.user.id) return prev;
                    return basic;
                });
                setIsLoading(false);
                enrichUserInBackground(session.user);

                // La redirección ahora es manejada exclusivamente por enrichUserInBackground 
                // para garantizar que exista el registro real del plan de pago.
            } else if (event === 'SIGNED_OUT') {
                setUser(null);
                setIsLoading(false);
                router.push('/login');
            } else if (event === 'TOKEN_REFRESHED' && session?.user) {
                // Token refrescado silenciosamente, solo enriquecer sin bloquear
                enrichUserInBackground(session.user);
            }
        });

        return () => {
            mounted = false;
            subscription.unsubscribe();
            if (enrichmentAbortRef.current) {
                enrichmentAbortRef.current.abort();
            }
        };
    }, [enrichUserInBackground]);

    const logout = async () => {
        try {
            await fetch('/api/auth/logout', { method: 'POST' }).catch(() => { });
            await supabase.auth.signOut().catch(() => { });
        } finally {
            setUser(null);
            window.location.href = '/';
        }
    };

    const refetchUser = async () => {
        const { data: { session } } = await supabase.auth.getSession();
        if (session?.user) {
            setUser(prev => {
                const basic = buildUserFromSession(session.user);
                if (prev?.id === session.user.id) return prev;
                return basic;
            });
            enrichUserInBackground(session.user);
        }
    };


    const hasPermission = useCallback((permission: string) => {
        // Los admins globales o dueños tienen todo activo por diseño inicial 
        // a menos que sus permisos se bloqueen. Pero superadmin/admin tienen all.
        if (user?.role === 'superadmin' || user?.role === 'admin' || user?.role === 'flusize_admin') return true;
        // Si no hay perfil mapeado aún o no trae permisos, asumimos false provisionalmente
        if (!user?.permissions) return false;
        
        return !!user.permissions[permission];
    }, [user]);

    return (
        <AuthContext.Provider value={{ user, isLoading, logout, refetchUser, hasPermission }}>
            {children}
        </AuthContext.Provider>
    );
}

export function useAuth() {
    const context = useContext(AuthContext);
    if (context === undefined) {
        throw new Error('useAuth debe usarse dentro de AuthProvider');
    }
    return context;
}
