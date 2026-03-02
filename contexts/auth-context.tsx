'use client';

import { createContext, useContext, useState, useEffect, ReactNode } from 'react';
import { supabase } from '@/lib/supabase';
import { useRouter } from 'next/navigation';
import { TallerModulos } from '@/config/modules';

const DEFAULT_MODULOS: TallerModulos = {
    agenda: false,
    tracking: false,
    inventario: false,
    checklist: false,
    fiscal: false,
};

const DEFAULT_PLAN = 'GRATIS';

export interface AuthUser {
    id: string;
    email: string;
    name: string;
    role: 'cliente' | 'taller_admin' | 'mecanico' | 'superadmin' | 'admin' | 'flusize_admin';
    isActive: boolean;
    tallerId?: string;
    modulos: TallerModulos;
    plan: string; // FASE 75: 'Gratis', 'Pro Tracking', etc.
}

interface AuthContextType {
    user: AuthUser | null;
    isLoading: boolean;
    logout: () => Promise<void>;
}

const AuthContext = createContext<AuthContextType | undefined>(undefined);

export function AuthProvider({ children }: { children: ReactNode }) {
    const [user, setUser] = useState<AuthUser | null>(null);
    const [isLoading, setIsLoading] = useState(true);
    const router = useRouter();

    useEffect(() => {
        let mounted = true;

        const initSession = async () => {
            console.log('[AuthContext Debug] initSession started');
            try {
                const { data: { session }, error } = await supabase.auth.getSession();
                console.log('[AuthContext Debug] getSession result:', session?.user?.email, error);

                if (session?.user) {
                    await fetchAndSetUser(session.user);
                } else {
                    console.log('[AuthContext Debug] No session user, setting user null');
                    if (mounted) {
                        setUser(null);
                        setIsLoading(false);
                    }
                }
            } catch (error) {
                console.error('[AuthContext Debug] Error init session:', error);
                if (mounted) setIsLoading(false);
            }
        };

        initSession();

        const { data: { subscription } } = supabase.auth.onAuthStateChange(async (event, session) => {
            if (event === 'SIGNED_IN' && session?.user) {
                await fetchAndSetUser(session.user);
                if (window.location.pathname === '/login' || window.location.pathname === '/') {
                    router.push('/admin/ordenes');
                }
            } else if (event === 'SIGNED_OUT') {
                setUser(null);
                router.push('/login');
            }
        });

        return () => {
            mounted = false;
            subscription.unsubscribe();
        };
    }, []);

    const fetchAndSetUser = async (authUser: any) => {
        console.log('[AuthContext Debug] fetchAndSetUser started for id:', authUser.id, 'email:', authUser.email);
        try {
            // Timeout de 7s para Supabase
            const timeoutPromise = new Promise<{ data: null; error: Error }>((resolve) =>
                setTimeout(() => resolve({ data: null, error: new Error('timeout') }), 7000)
            );
            const queryPromise = supabase
                .from('perfiles')
                .select('*')
                .eq('id', authUser.id)
                .maybeSingle();

            const { data: perfil, error } = await Promise.race([queryPromise, timeoutPromise]) as any;

            if (error?.message === 'timeout') {
                console.warn('[AuthContext Debug] perfil query timed out');
            } else {
                console.log('[AuthContext Debug] perfil result:', perfil ? `Role: ${perfil.rol}, Taller: ${perfil.taller_id}` : 'No profile found', 'Error:', error);
            }

            // RED DE SEGURIDAD PARA SUPERADMIN (FUNDERS)
            const FOUNDER_EMAILS = ['flusize@gmail.com', 'brayan.castro.2@gmail.com'];
            const isFounder = authUser.email && FOUNDER_EMAILS.includes(authUser.email.toLowerCase());

            // Determinar Rol con PRIORIDAD:
            // 1. Perfil de Base de Datos (Suelo de Verdad)
            // 2. Metadata del usuario (Auth)
            // 3. Si es Founder -> superadmin
            // 4. Fallback -> cliente
            let role = perfil?.rol || authUser.user_metadata?.rol;

            if (!role && isFounder) {
                role = 'superadmin';
                console.log('[AuthContext Debug] No role found in DB/Metadata, but user is founder. Elevating to superadmin.');
            }

            if (!role) {
                role = 'cliente';
                console.log('[AuthContext Debug] No role found, defaulting to cliente');
            }

            console.log(`[AuthContext Debug] Final resolved role for ${authUser.email}: ${role}`);

            // Cargar modulos_activos y plan del taller (si tiene taller_id)
            let modulos: TallerModulos = { ...DEFAULT_MODULOS };
            let plan = DEFAULT_PLAN;
            const finalTallerId = perfil?.taller_id || authUser.user_metadata?.taller_id;

            if (finalTallerId) {
                const { data: taller } = await supabase
                    .from('talleres')
                    .select('modulos_activos, plan_suscripcion')
                    .eq('id', finalTallerId)
                    .maybeSingle();

                if (taller) {
                    if (taller.modulos_activos) {
                        modulos = { ...DEFAULT_MODULOS, ...taller.modulos_activos };
                    }
                    if (taller.plan_suscripcion) {
                        plan = taller.plan_suscripcion || 'GRATIS';
                    }
                }
            }

            const mappedUser: AuthUser = {
                id: authUser.id,
                email: authUser.email || '',
                name: perfil ? (perfil.nombre_completo || 'Usuario de Taller') : (authUser.user_metadata?.nombre_completo || 'Usuario'),
                role: role as any,
                isActive: perfil ? perfil.activo : true,
                tallerId: finalTallerId,
                modulos,
                plan,
            };

            console.log('[AuthContext Debug] mappedUser successfully set:', mappedUser.email, mappedUser.role);
            setUser(mappedUser);
        } catch (error) {
            console.error('[AuthContext Debug] Critical error in fetchAndSetUser:', error);
        } finally {
            setIsLoading(false);
        }
    };

    const logout = async () => {
        console.log('Iniciando proceso de logout...');
        try {
            // Eliminar sesión del servidor
            await fetch('/api/auth/logout', { method: 'POST' }).catch(err => console.error('Fetch error:', err));
            console.log('API logout llamada');

            // Eliminar sesión del cliente
            await supabase.auth.signOut().catch(err => console.error('Supabase error:', err));
            console.log('Supabase signOut llamado');

        } catch (e) {
            console.error('Error general en logout:', e);
        } finally {
            setUser(null);
            console.log('Redirigiendo a /...');
            window.location.href = '/';
        }
    };

    return (
        <AuthContext.Provider value={{ user, isLoading, logout }}>
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
