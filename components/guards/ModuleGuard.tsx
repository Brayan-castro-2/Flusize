'use client';

import { useEffect, type ReactNode } from 'react';
import { useRouter } from 'next/navigation';
import { toast } from 'sonner';
import { useFlusizeFeatures, type FlusiizeModule } from '@/hooks/useFlusizeFeatures';
import { useAuth } from '@/contexts/auth-context';
import { normalizePlan, planHasModule } from '@/lib/plan-config';

interface ModuleGuardProps {
    /** Dot-notation module path, e.g. 'inventario' or 'clientes.mini_crm' */
    moduleName: FlusiizeModule | string;
    children: ReactNode;
    /** Where to redirect if the module is off. Defaults to '/admin' */
    redirectTo?: string;
    /** Toast message when the module is inactive. Pass false to suppress. */
    toastMessage?: string | false;
}

/**
 * Client-side route guard for feature-flagged modules.
 *
 * Renders `children` only when the current taller has the module active.
 * If the module is off (and loading is done), redirects to `redirectTo`
 * and fires an error toast.
 *
 * @example
 * // In /admin/inventario/page.tsx
 * export default function InventarioPage() {
 *   return (
 *     <ModuleGuard moduleName="inventario">
 *       <InventarioContent />
 *     </ModuleGuard>
 *   );
 * }
 */
export default function ModuleGuard({
    moduleName,
    children,
    redirectTo = '/admin',
    toastMessage,
}: ModuleGuardProps) {
    const { tieneModulo, isLoading: loadingFeatures } = useFlusizeFeatures();
    const { user, isLoading: loadingAuth } = useAuth();
    const router = useRouter();

    const planStr = normalizePlan(user?.plan);
    const hasModuleByPlan = planHasModule(planStr, moduleName as any);
    
    const isActive = hasModuleByPlan || tieneModulo(moduleName);
    const isLoading = loadingFeatures || loadingAuth;

    useEffect(() => {
        if (isLoading) return;
        if (!isActive) {
            const msg = toastMessage !== false
                ? (toastMessage ?? `El módulo "${moduleName}" no está contratado o está inactivo para este taller.`)
                : null;
            if (msg) toast.error(msg, { duration: 5000 });
            router.replace(redirectTo);
        }
    }, [isLoading, isActive, moduleName, redirectTo, toastMessage, router]);

    // While loading or redirecting, render nothing to avoid flash
    if (isLoading || !isActive) return null;

    return <>{children}</>;
}
