'use client';
import { AuthProvider } from '@/contexts/auth-context';
import { QueryProvider } from '@/contexts/query-provider';
import { ChunkErrorHandler } from '@/components/resilience/chunk-error-handler';

export function ClientProviders({ children }: { children: React.ReactNode }) {
    return (
        <QueryProvider>
            <ChunkErrorHandler />
            <AuthProvider>
                {children}
            </AuthProvider>
        </QueryProvider>
    );
}
