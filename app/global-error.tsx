'use client';

import { useEffect } from 'react';
import { RefreshCw, AlertTriangle } from 'lucide-react';

export default function GlobalError({
    error,
    reset,
}: {
    error: Error & { digest?: string };
    reset: () => void;
}) {
    useEffect(() => {
        console.error('[GlobalError] Error capturado:', error);
    }, [error]);

    const isChunkError =
        error.message?.includes('Loading chunk') ||
        error.message?.includes('ChunkLoadError') ||
        error.message?.includes('Failed to fetch dynamically imported module');

    return (
        <html lang="es">
            <body style={{ margin: 0, background: '#0f172a', display: 'flex', alignItems: 'center', justifyContent: 'center', minHeight: '100vh', fontFamily: 'Inter, system-ui, sans-serif' }}>
                <div style={{ textAlign: 'center', color: '#f1f5f9', padding: '2rem', maxWidth: '400px' }}>
                    <div style={{ width: '64px', height: '64px', background: '#fef2f2', borderRadius: '50%', display: 'flex', alignItems: 'center', justifyContent: 'center', margin: '0 auto 1.5rem' }}>
                        <AlertTriangle style={{ width: '32px', height: '32px', color: '#ef4444' }} />
                    </div>
                    <h1 style={{ fontSize: '1.25rem', fontWeight: 700, marginBottom: '0.5rem', color: '#f1f5f9' }}>
                        {isChunkError ? 'Actualización disponible' : 'Algo salió mal'}
                    </h1>
                    <p style={{ fontSize: '0.875rem', color: '#94a3b8', marginBottom: '1.5rem' }}>
                        {isChunkError
                            ? 'Hay una nueva versión de Flusize disponible. Recarga para obtenerla.'
                            : 'Ocurrió un error inesperado. Por favor recarga la página. Si el problema persiste, contáctanos.'}
                    </p>
                    <button
                        onClick={isChunkError ? () => window.location.reload() : reset}
                        style={{
                            display: 'inline-flex', alignItems: 'center', gap: '0.5rem',
                            padding: '0.75rem 1.5rem', background: '#3b82f6', color: 'white',
                            border: 'none', borderRadius: '0.5rem', fontSize: '0.9rem',
                            fontWeight: 600, cursor: 'pointer', transition: 'background 0.2s'
                        }}
                        onMouseOver={e => (e.currentTarget.style.background = '#2563eb')}
                        onMouseOut={e => (e.currentTarget.style.background = '#3b82f6')}
                    >
                        <RefreshCw style={{ width: '16px', height: '16px' }} />
                        {isChunkError ? 'Actualizar ahora' : 'Reintentar'}
                    </button>
                </div>
            </body>
        </html>
    );
}
