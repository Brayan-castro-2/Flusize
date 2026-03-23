'use client';

import { type ReactNode } from 'react';
import { useFlusizeFeatures, type FlusiizeModule } from '@/hooks/useFlusizeFeatures';

interface FeatureGuardProps {
    /** Nombre del módulo que debe estar activo para renderizar el children */
    moduleName: FlusiizeModule | string;
    /** Contenido a renderizar si el módulo está activo */
    children: ReactNode;
    /** Opcional: elemento a mostrar si el módulo NO está activo */
    fallback?: ReactNode;
}

/**
 * Componente guardián de módulos.
 * Renderiza `children` solo si el taller tiene el módulo activado.
 *
 * @example
 * <FeatureGuard moduleName="inventario">
 *   <InventarioPage />
 * </FeatureGuard>
 *
 * @example Con fallback
 * <FeatureGuard moduleName="analytics" fallback={<p>Módulo no disponible</p>}>
 *   <DashboardAnalytics />
 * </FeatureGuard>
 */
export default function FeatureGuard({ moduleName, children, fallback = null }: FeatureGuardProps) {
    const { tieneModulo, isLoading } = useFlusizeFeatures();

    // Mientras carga, no mostramos nada (evita flash de contenido)
    if (isLoading) return null;

    if (!tieneModulo(moduleName)) {
        return <>{fallback}</>;
    }

    return <>{children}</>;
}
