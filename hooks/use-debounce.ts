import { useState, useEffect } from 'react';

/**
 * Hook para retrasar la actualización de un valor (debounce).
 * Útil para evitar excesivas validaciones o llamadas API al tipear.
 * 
 * @param value Valor a retrasar
 * @param delay Tiempo de espera en milisegundos (por defecto 300)
 */
export function useDebounce<T>(value: T, delay: number = 300): T {
    const [debouncedValue, setDebouncedValue] = useState<T>(value);

    useEffect(() => {
        // Configuramos un temporizador para actualizar el debounced value
        // después del delay especificado
        const timer = setTimeout(() => {
            setDebouncedValue(value);
        }, delay);

        // Si el valor cambia (el usuario presiona otra tecla), 
        // el efecto se limpia y el timer se reinicia.
        return () => {
            clearTimeout(timer);
        };
    }, [value, delay]);

    return debouncedValue;
}
