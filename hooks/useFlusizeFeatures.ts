import { useEffect, useState } from 'react';
import { useAuth } from '@/contexts/auth-context';
import { supabase } from '@/lib/supabase';

// ──────────────────────────────────────────────────────────────
// Types
// ──────────────────────────────────────────────────────────────

/** Nested JSON shape stored in talleres.modulos_activos (JSONB) */
export type ModulosJson = Record<string, Record<string, boolean>>;

/** All known top-level module keys (for autocomplete convenience) */
export type FlusiizeModule =
    | 'recepcion'
    | 'ordenes'
    | 'checklist'
    | 'inventario'
    | 'cotizaciones'
    | 'agenda'
    | 'clientes'
    | 'analytics'
    | 'public_profile'
    | 'tracking'
    | 'flota'
    | 'contratos'
    | string; // allow arbitrary sub-features

// ──────────────────────────────────────────────────────────────
// Default flags (plan básico, all talleres start here)
// ──────────────────────────────────────────────────────────────

export const DEFAULT_MODULES_JSON: ModulosJson = {
    recepcion:      { activo: true  },
    ordenes:        { activo: true  },
    checklist:      { activo: true  },
    inventario:     { activo: true  },
    cotizaciones:   { activo: false },
    agenda:         { activo: false },
    clientes:       { activo: true, mini_crm: false },
    analytics:      { activo: false },
    public_profile: { activo: false },
    tracking:       { activo: false },
    flota:          { activo: false },
    contratos:      { activo: false },
};

/** Full-access JSON given to superadmins */
const ALL_ON_JSON: ModulosJson = Object.fromEntries(
    Object.keys(DEFAULT_MODULES_JSON).map(mod => [
        mod,
        Object.fromEntries(
            Object.keys(DEFAULT_MODULES_JSON[mod]).map(key => [key, true])
        ),
    ])
);

// ──────────────────────────────────────────────────────────────
// Hook
// ──────────────────────────────────────────────────────────────

interface UseFlusizeFeaturesResult {
    /** Raw JSON object — useful for the Superadmin panel */
    modulosJson: ModulosJson;
    /**
     * Resolve a feature flag by dot-notation path.
     *
     * Examples:
     *   tieneModulo('inventario')        → checks inventario.activo
     *   tieneModulo('clientes.mini_crm') → checks clientes.activo && clientes.mini_crm
     */
    tieneModulo: (path: string) => boolean;
    isLoading: boolean;
}

/**
 * Hook that exposes the active feature flags for the current taller.
 *
 * @example
 * const { tieneModulo } = useFlusizeFeatures();
 * if (tieneModulo('clientes.mini_crm')) { ... }
 */
export function useFlusizeFeatures(): UseFlusizeFeaturesResult {
    const { user, isLoading: authLoading } = useAuth();
    const [modulosJson, setModulosJson] = useState<ModulosJson>(DEFAULT_MODULES_JSON);
    const [isLoading, setIsLoading] = useState(true);

    useEffect(() => {
        async function fetchModulos() {
            if (authLoading) return;

            // flusize_admin → unrestricted access
            if (!user || !user.tallerId || ['flusize_admin'].includes(user.role)) {
                setModulosJson(ALL_ON_JSON);
                setIsLoading(false);
                return;
            }

            try {
                const { data, error } = await supabase
                    .from('talleres')
                    .select('modulos_activos')
                    .eq('id', user.tallerId)
                    .single();

                if (error || !data || !data.modulos_activos) {
                    console.warn('[useFlusizeFeatures] Could not load flags, using defaults:', error?.message);
                    setModulosJson(DEFAULT_MODULES_JSON);
                } else {
                    // Merge with defaults so new sub-features don't break existing talleres
                    const merged: ModulosJson = { ...DEFAULT_MODULES_JSON };
                    const raw = data.modulos_activos as ModulosJson;
                    for (const mod in raw) {
                        merged[mod] = { ...(DEFAULT_MODULES_JSON[mod] || {}), ...raw[mod] };
                    }
                    setModulosJson(merged);
                }
            } catch (e) {
                console.error('[useFlusizeFeatures] Unexpected error:', e);
                setModulosJson(DEFAULT_MODULES_JSON);
            } finally {
                setIsLoading(false);
            }
        }

        fetchModulos();
    }, [user, authLoading]);

    /**
     * Resolve a dot-notation feature path.
     * - 'inventario'        → modulosJson.inventario.activo
     * - 'clientes.mini_crm' → modulosJson.clientes.activo && modulosJson.clientes.mini_crm
     */
    const tieneModulo = (path: string): boolean => {
        const parts = path.split('.');
        const mod = parts[0];
        const sub = parts[1];

        const modObj = modulosJson[mod];
        if (!modObj) return false;

        // Parent must be active for any child flag to resolve true
        if (!modObj.activo) return false;

        // If only the module was requested (no sub-feature), return true
        if (!sub) return true;

        // Check the specific sub-feature
        return modObj[sub] === true;
    };

    return { modulosJson, tieneModulo, isLoading };
}
