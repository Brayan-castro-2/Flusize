'use client';

import { useEffect, useRef, useCallback } from 'react';

const MAX_CHUNK_RETRIES = 3;
const CHUNK_RETRY_BASE_DELAY = 1000; // ms

// Detecta si un error de script/link es un ChunkLoadError
function isChunkError(event: ErrorEvent | Event): boolean {
    if (event instanceof ErrorEvent) {
        const msg = event.message || '';
        return (
            msg.includes('Loading chunk') ||
            msg.includes('ChunkLoadError') ||
            msg.includes('Failed to fetch dynamically imported module') ||
            msg.includes('Importing a module script failed') ||
            msg.includes('error loading dynamically imported module')
        );
    }
    // Fallback para errores de recursos (link/script tags)
    const target = (event as any).target;
    if (target?.tagName === 'SCRIPT' || target?.tagName === 'LINK') {
        return true;
    }
    return false;
}

export function ChunkErrorHandler() {
    const retryCount = useRef<Map<string, number>>(new Map());

    const retryLoadResource = useCallback((src: string, type: 'script' | 'link') => {
        const count = retryCount.current.get(src) || 0;

        if (count >= MAX_CHUNK_RETRIES) {
            console.error(`[ChunkErrorHandler] ${src} falló después de ${MAX_CHUNK_RETRIES} intentos. Recargando página.`);
            // Último recurso: recarga completa con cache-bust
            const url = new URL(window.location.href);
            url.searchParams.set('_cb', Date.now().toString());
            window.location.href = url.toString();
            return;
        }

        retryCount.current.set(src, count + 1);
        const delay = CHUNK_RETRY_BASE_DELAY * Math.pow(2, count); // backoff exponencial

        console.warn(`[ChunkErrorHandler] Reintentando chunk (${count + 1}/${MAX_CHUNK_RETRIES}): ${src} en ${delay}ms`);

        setTimeout(() => {
            if (type === 'script') {
                const script = document.createElement('script');
                script.src = src + '?retry=' + Date.now();
                script.defer = true;
                script.onerror = () => retryLoadResource(src, type);
                document.head.appendChild(script);
            } else {
                const link = document.createElement('link');
                link.rel = 'stylesheet';
                link.href = src + '?retry=' + Date.now();
                link.onerror = () => retryLoadResource(src, type);
                document.head.appendChild(link);
            }
        }, delay);
    }, []);

    useEffect(() => {
        // Listener para errores de carga de scripts/links
        const handleResourceError = (event: Event) => {
            if (!isChunkError(event)) return;

            const target = (event as any).target;
            if (!target) return;

            const src = target.src || target.href;
            if (!src) return;

            event.preventDefault();
            retryLoadResource(src, target.tagName === 'SCRIPT' ? 'script' : 'link');
        };

        // Listener para ChunkLoadError en window.onerror
        const handleWindowError = (event: ErrorEvent) => {
            if (!isChunkError(event)) return;
            console.warn('[ChunkErrorHandler] ChunkLoadError detectado:', event.message);
            // Para errores de import dinámico, la recarga es la mejor opción
            if (event.message?.includes('Failed to fetch dynamically imported module')) {
                const cached = sessionStorage.getItem('chunk_reload_count') || '0';
                const reloadCount = parseInt(cached);
                if (reloadCount < MAX_CHUNK_RETRIES) {
                    sessionStorage.setItem('chunk_reload_count', String(reloadCount + 1));
                    console.warn(`[ChunkErrorHandler] Recargando página por import dinámico fallido. Intento ${reloadCount + 1}`);
                    window.location.reload();
                } else {
                    sessionStorage.removeItem('chunk_reload_count');
                    console.error('[ChunkErrorHandler] Demasiados reloads. Abortando.');
                }
            }
        };

        // Limpiar el contador de reloads cuando la página carga exitosamente
        sessionStorage.removeItem('chunk_reload_count');

        window.addEventListener('error', handleResourceError, true); // capture phase
        window.addEventListener('error', handleWindowError as any);

        return () => {
            window.removeEventListener('error', handleResourceError, true);
            window.removeEventListener('error', handleWindowError as any);
        };
    }, [retryLoadResource]);

    // Este componente no renderiza nada visible
    return null;
}
