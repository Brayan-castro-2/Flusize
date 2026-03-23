'use client';
import { AuthProvider } from '@/contexts/auth-context';
import { QueryProvider } from '@/contexts/query-provider';
import { ChunkErrorHandler } from '@/components/resilience/chunk-error-handler';
import { ThemeProvider } from '@/components/theme-provider';

export function ClientProviders({ children }: { children: React.ReactNode }) {
    return (
        <ThemeProvider attribute="class" defaultTheme="dark" enableSystem disableTransitionOnChange>
            <QueryProvider>
                <ChunkErrorHandler />
                <AuthProvider>
                    {children}
                </AuthProvider>
            </QueryProvider>
        </ThemeProvider>
    );
}

