'use client';

import { QueryClient, QueryClientProvider } from '@tanstack/react-query';
import { useState } from 'react';

const QUERY_TIMEOUT_MS = 5_000; // 5 segundos

// Wrapper que agrega timeout a cualquier función fetchera
function withQueryTimeout<T>(fn: () => Promise<T>): () => Promise<T> {
    return () => {
        const controller = new AbortController();
        const timeoutId = setTimeout(() => {
            controller.abort(new Error('Query timeout después de 5 segundos'));
        }, QUERY_TIMEOUT_MS);

        return fn().finally(() => clearTimeout(timeoutId));
    };
}

export function QueryProvider({ children }: { children: React.ReactNode }) {
    const [queryClient] = useState(
        () =>
            new QueryClient({
                defaultOptions: {
                    queries: {
                        staleTime: 5 * 60 * 1000,       // 5 min - datos cacheados
                        gcTime: 30 * 60 * 1000,          // 30 min - persistencia GC
                        refetchOnWindowFocus: false,
                        refetchOnMount: false,
                        refetchOnReconnect: true,         // Re-fetch al reconectar red
                        retry: (failureCount, error: any) => {
                            // No reintentar en errores 4xx (auth, not found, etc.)
                            if (error?.status >= 400 && error?.status < 500) return false;
                            // No reintentar en AbortError manual del usuario
                            if (error?.name === 'AbortError' && error?.message?.includes('manual')) return false;
                            return failureCount < 3; // Máximo 3 reintentos
                        },
                        retryDelay: (attemptIndex) =>
                            Math.min(1000 * Math.pow(2, attemptIndex), 10_000), // Backoff exponencial: 1s, 2s, 4s, max 10s
                    },
                    mutations: {
                        retry: 1,
                        retryDelay: 1000,
                    },
                },
            })
    );

    return <QueryClientProvider client={queryClient}>{children}</QueryClientProvider>;
}

export { withQueryTimeout };
