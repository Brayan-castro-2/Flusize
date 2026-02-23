'use client';

import { createContext, useContext, useState, useEffect, ReactNode } from 'react';
import { useQueryClient } from '@tanstack/react-query';
import {
    loginConCredenciales,
    logout as logoutService,
    obtenerSesionActual,
    inicializarLocalStorage,
    type PerfilDB
} from '@/lib/storage-adapter';
import { ORDERS_QUERY_KEY } from '@/hooks/use-orders';
import { USERS_QUERY_KEY } from '@/hooks/use-users';
import { obtenerOrdenes, obtenerPerfiles } from '@/lib/storage-adapter';

// Usuario del contexto
export interface AuthUser {
    id: string;
    email: string;
    name: string;
    role: 'mecanico' | 'admin' | 'superadmin';
    isActive: boolean;
    tallerId?: string; // UUID del taller asignado
}

interface AuthContextType {
    user: AuthUser | null;
    isLoading: boolean;
    login: (email: string, password: string) => Promise<{ success: boolean; error?: string }>;
    logout: () => Promise<void>;
}

const AuthContext = createContext<AuthContextType | undefined>(undefined);

export function AuthProvider({ children }: { children: ReactNode }) {
    const [user, setUser] = useState<AuthUser | null>(null);
    const [isLoading, setIsLoading] = useState(true);
    const queryClient = useQueryClient();

    // Inicializar sesión al cargar
    useEffect(() => {
        const initSession = async () => {
            try {
                // Inicializar localStorage con datos por defecto
                inicializarLocalStorage();

                // Obtener sesión guardada
                const result = await obtenerSesionActual();

                if (result.user && result.perfil) {
                    const authUser: AuthUser = {
                        id: result.user.id,
                        email: result.user.email,
                        name: result.perfil.nombre_completo,
                        role: result.perfil.rol,
                        isActive: result.perfil.activo,
                        tallerId: result.perfil.taller_id,
                    };
                    setUser(authUser);
                    console.log('Sesión restaurada:', authUser.name);
                }
            } catch (error) {
                console.error('Error inicializando sesión:', error);
            } finally {
                setIsLoading(false);
            }
        };

        initSession();
    }, []);

    const login = async (email: string, password: string): Promise<{ success: boolean; error?: string }> => {
        try {
            console.log('Iniciando login para:', email);

            // Resolver alias cortos a emails completos (para credenciales demo)
            let emailResolved = email.trim();
            if (!emailResolved.includes('@')) {
                // Alias → email completo
                const aliasMap: Record<string, string> = {
                    'admin': 'admin@taller.demo',
                    'mecanico': 'mecanico@taller.demo',
                    'cliente': 'cliente@taller.demo',
                };
                emailResolved = aliasMap[emailResolved.toLowerCase()] || emailResolved;
            }

            // Usar el servicio de localStorage
            const result = await loginConCredenciales(emailResolved, password);

            if (result.error || !result.user || !result.perfil) {
                return { success: false, error: result.error || 'Error de autenticación' };
            }

            // Verificar si el usuario está activo
            if (!result.perfil.activo) {
                return { success: false, error: 'Usuario desactivado. Contacta al administrador.' };
            }

            // Convertir perfil a AuthUser
            const authUser: AuthUser = {
                id: result.user.id,
                email: result.user.email,
                name: result.perfil.nombre_completo,
                role: result.perfil.rol,
                isActive: result.perfil.activo,
                tallerId: result.perfil.taller_id,
            };

            setUser(authUser);
            console.log('Login completado:', authUser.name);

            // Prefetch de datos en background para navegación instantánea
            console.log('🚀 Precargando datos en background...');
            queryClient.prefetchQuery({
                queryKey: ORDERS_QUERY_KEY,
                queryFn: () => obtenerOrdenes(),
            });
            queryClient.prefetchQuery({
                queryKey: USERS_QUERY_KEY,
                queryFn: () => obtenerPerfiles(),
            });
            console.log('✅ Prefetch iniciado');

            return { success: true };
        } catch (error: any) {
            console.error('Excepción en login:', error);
            return { success: false, error: 'Error de conexión' };
        }
    };

    const logout = async () => {
        try {
            await logoutService();
            setUser(null);
            // Forzar recarga para limpiar estado
            window.location.href = '/login';
        } catch (e) {
            console.error('Error en logout:', e);
            setUser(null);
            window.location.href = '/login';
        }
    };

    return (
        <AuthContext.Provider value={{ user, isLoading, login, logout }}>
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
