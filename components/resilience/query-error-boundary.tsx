'use client';

import React from 'react';
import { useQueryClient } from '@tanstack/react-query';
import { RefreshCw, WifiOff, AlertCircle } from 'lucide-react';

interface QueryErrorFallbackProps {
    error: Error;
    resetError: () => void;
    queryKey?: string[];
}

export function QueryErrorFallback({ error, resetError, queryKey }: QueryErrorFallbackProps) {
    const queryClient = useQueryClient();

    const handleRetry = () => {
        if (queryKey) {
            queryClient.invalidateQueries({ queryKey });
        }
        resetError();
    };

    const isTimeout = error.message?.toLowerCase().includes('timeout') ||
        error.message?.toLowerCase().includes('aborted') ||
        error.name === 'AbortError';

    const isNetwork = error.message?.toLowerCase().includes('network') ||
        error.message?.toLowerCase().includes('failed to fetch') ||
        error.message?.toLowerCase().includes('net::');

    return (
        <div className="flex flex-col items-center justify-center min-h-[200px] p-8 text-center">
            <div className="mb-4 p-4 rounded-full bg-red-50 dark:bg-red-900/20">
                {isNetwork ? (
                    <WifiOff className="w-8 h-8 text-red-500" />
                ) : (
                    <AlertCircle className="w-8 h-8 text-red-500" />
                )}
            </div>
            <h3 className="text-lg font-semibold text-gray-800 dark:text-gray-200 mb-2">
                {isTimeout ? 'Tiempo de respuesta agotado' :
                    isNetwork ? 'Sin conexión' :
                        'Error al cargar datos'}
            </h3>
            <p className="text-sm text-gray-500 dark:text-gray-400 mb-6 max-w-xs">
                {isTimeout
                    ? 'La respuesta tardó demasiado. Verifica tu conexión e intenta de nuevo.'
                    : isNetwork
                        ? 'No se pudo conectar al servidor. Revisa tu internet.'
                        : 'Ocurrió un error inesperado. Por favor intenta de nuevo.'}
            </p>
            <button
                onClick={handleRetry}
                className="flex items-center gap-2 px-5 py-2.5 bg-blue-600 hover:bg-blue-700 text-white rounded-lg font-medium transition-colors duration-200 shadow-sm hover:shadow-md"
            >
                <RefreshCw className="w-4 h-4" />
                Reintentar
            </button>
        </div>
    );
}

// Hook para wrapping de fetches con timeout
export function withTimeout<T>(promise: Promise<T>, ms: number = 5000): Promise<T> {
    const controller = new AbortController();
    const timeoutId = setTimeout(() => controller.abort(), ms);

    return promise.finally(() => clearTimeout(timeoutId));
}

// Componente Error Boundary para React
interface ErrorBoundaryState {
    hasError: boolean;
    error: Error | null;
}

interface ErrorBoundaryProps {
    children: React.ReactNode;
    fallback?: React.ReactNode;
    queryKey?: string[];
    onError?: (error: Error) => void;
}

export class QueryErrorBoundary extends React.Component<ErrorBoundaryProps, ErrorBoundaryState> {
    constructor(props: ErrorBoundaryProps) {
        super(props);
        this.state = { hasError: false, error: null };
    }

    static getDerivedStateFromError(error: Error): ErrorBoundaryState {
        return { hasError: true, error };
    }

    componentDidCatch(error: Error, info: React.ErrorInfo) {
        console.error('[QueryErrorBoundary] Error capturado:', error, info);
        this.props.onError?.(error);
    }

    resetError = () => {
        this.setState({ hasError: false, error: null });
    };

    render() {
        if (this.state.hasError && this.state.error) {
            if (this.props.fallback) return this.props.fallback;
            return (
                <QueryErrorFallbackWrapper
                    error={this.state.error}
                    resetError={this.resetError}
                    queryKey={this.props.queryKey}
                />
            );
        }
        return this.props.children;
    }
}

// Wrapper funcional para acceder a useQueryClient dentro del error boundary
function QueryErrorFallbackWrapper({ error, resetError, queryKey }: QueryErrorFallbackProps) {
    return (
        <QueryErrorFallback error={error} resetError={resetError} queryKey={queryKey} />
    );
}
