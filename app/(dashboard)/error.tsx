'use client';

import { useEffect } from 'react';
import { RefreshCw, AlertCircle, WifiOff } from 'lucide-react';

export default function DashboardError({
    error,
    reset,
}: {
    error: Error & { digest?: string };
    reset: () => void;
}) {
    useEffect(() => {
        console.error('[DashboardError]', error);
    }, [error]);

    const isTimeout = error.message?.includes('timeout') || error.name === 'AbortError';
    const isNetwork =
        error.message?.includes('network') ||
        error.message?.includes('Failed to fetch') ||
        error.message?.includes('net::');

    return (
        <div className="flex flex-col items-center justify-center min-h-[60vh] p-8 text-center">
            <div className="mb-5 w-16 h-16 rounded-full flex items-center justify-center"
                style={{ background: 'rgba(239,68,68,0.1)' }}>
                {isNetwork
                    ? <WifiOff className="w-8 h-8 text-red-500" />
                    : <AlertCircle className="w-8 h-8 text-red-500" />
                }
            </div>

            <h2 className="text-xl font-bold text-gray-800 dark:text-gray-200 mb-2">
                {isTimeout ? 'Tiempo de espera agotado' :
                    isNetwork ? 'Sin conexión al servidor' :
                        'Error al cargar la vista'}
            </h2>

            <p className="text-sm text-gray-500 dark:text-gray-400 mb-6 max-w-sm leading-relaxed">
                {isTimeout
                    ? 'La respuesta del servidor tardó más de 5 segundos. Verifica tu conexión e intenta de nuevo.'
                    : isNetwork
                        ? 'No se pudo conectar. Revisa tu internet o intenta en unos segundos.'
                        : 'Ocurrió un error inesperado. Puedes intentar de nuevo sin perder tu sesión.'}
            </p>

            <div className="flex gap-3">
                <button
                    onClick={reset}
                    className="flex items-center gap-2 px-5 py-2.5 bg-blue-600 hover:bg-blue-700 text-white rounded-lg font-medium transition-all duration-200 shadow-sm hover:shadow-md text-sm"
                >
                    <RefreshCw className="w-4 h-4" />
                    Reintentar
                </button>
                <button
                    onClick={() => window.location.href = '/admin'}
                    className="flex items-center gap-2 px-5 py-2.5 border border-gray-300 dark:border-gray-600 hover:bg-gray-50 dark:hover:bg-gray-800 text-gray-700 dark:text-gray-300 rounded-lg font-medium transition-all duration-200 text-sm"
                >
                    Ir al inicio
                </button>
            </div>

            {process.env.NODE_ENV === 'development' && (
                <details className="mt-6 text-left max-w-lg w-full">
                    <summary className="text-xs text-gray-400 cursor-pointer hover:text-gray-600">
                        Detalles del error (solo visible en desarrollo)
                    </summary>
                    <pre className="mt-2 p-3 bg-gray-100 dark:bg-gray-900 rounded text-xs text-red-500 overflow-auto max-h-40">
                        {error.message}
                        {error.stack ? '\n\n' + error.stack : ''}
                    </pre>
                </details>
            )}
        </div>
    );
}
