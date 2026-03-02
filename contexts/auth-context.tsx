'use client';

import { createContext, useContext, useState, useEffect, ReactNode } from 'react';
import { supabase } from '@/lib/supabase';
import { useRouter } from 'next/navigation';
import { TallerModulos, DEFAULT_MODULOS } from '@/config/modules';

export interface AuthUser {
    id: string;
    email: string;
    name: string;
    role: 'cliente' | 'taller_admin' | 'mecanico' | 'superadmin' | 'admin' | 'flusize_admin';
    isActive: boolean;
    tallerId?: string;
    modulos: TallerModulos;
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
        console.log('[AuthContext Debug] fetchAndSetUser started for id:', authUser.id);
        try {
            // Timeout de 5s para evitar spinner infinito si Supabase cuelga
            const timeoutPromise = new Promise<{ data: null; error: Error }>((resolve) =>
                setTimeout(() => resolve({ data: null, error: new Error('timeout') }), 5000)
            );
            const queryPromise = supabase
                .from('perfiles')
                .select('*')
                .eq('id', authUser.id)
                .maybeSingle();

            const { data: perfil, error } = await Promise.race([queryPromise, timeoutPromise]) as any;

            if (error?.message === 'timeout') {
                console.warn('[AuthContext Debug] perfil query timed out, proceeding with auth user data only');
            } else {
                console.log('[AuthContext Debug] perfil fetched:', perfil?.rol, 'error:', error);
            }

            // Determinar Rol
            const role = perfil?.rol ||
                authUser.user_metadata?.rol ||
                (error?.message === 'timeout' ? 'taller_admin' : 'cliente');

            // Cargar modulos_activos del taller (si tiene taller_id)
            let modulos: TallerModulos = { ...DEFAULT_MODULOS };
            if (perfil?.taller_id) {
                const { data: taller } = await supabase
                    .from('talleres')
                    .select('modulos_activos')
                    .eq('id', perfil.taller_id)
                    .maybeSingle();
                if (taller?.modulos_activos) {
                    modulos = { ...DEFAULT_MODULOS, ...taller.modulos_activos };
                }
            }

            const mappedUser: AuthUser = {
                id: authUser.id,
                email: authUser.email || '',
                name: perfil ? (perfil.nombre_completo || 'Usuario de Taller') : (authUser.user_metadata?.nombre_completo || 'Usuario'),
                role: role as any,
                isActive: perfil ? perfil.activo : true,
                tallerId: perfil ? perfil.taller_id : undefined,
                modulos,
            };

            console.log('[AuthContext Debug] mappedUser created:', mappedUser);
            setUser(mappedUser);
        } catch (error) {
            console.error('[AuthContext Debug] Error fetching role', error);
        } finally {
            console.log('[AuthContext Debug] fetchAndSetUser finally, setting isLoading false');
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
