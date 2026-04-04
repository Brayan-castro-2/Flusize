/**
 * plan-config.ts
 * Fuente de verdad única para la nomenclatura comercial de planes de Flusize.
 * 
 * Plan Digital  → Sólo presencia (Perfil + Agenda)
 * Plan Pro      → Operación estándar (+ Recepción, Órdenes, Usuarios, Dashboard)
 * Plan Premium  → Métricas e Inventario (+ Inventario, Gestión Clientes)
 * Plan Size     → Enterprise a medida (+ Flota, Contratos Digitales)
 */

export type PlanId = 'Gratis' | 'Digital' | 'Pro' | 'Premium' | 'Size';

/** Normaliza cualquier string de plan a su PlanId canónico */
export function normalizePlan(raw: string | null | undefined): PlanId {
    const s = (raw || '').trim();
    if (/gratis/i.test(s))   return 'Gratis';
    if (/digital/i.test(s))  return 'Digital';
    if (/pro/i.test(s))      return 'Pro';
    if (/premium/i.test(s))  return 'Premium';
    if (/size/i.test(s))     return 'Size';
    return 'Gratis'; // Fallback al más restrictivo
}

/** Rutas permitidas por plan (TODO lo que no está en la lista → redirige a /admin/perfil) */
export const PLAN_ALLOWED_ROUTES: Record<PlanId, string[]> = {
    Gratis:  ['/admin/perfil', '/admin/agenda', '/admin/citas'],
    Digital: ['/admin/perfil', '/admin/agenda', '/admin/citas'],
    Pro:     ['/admin/perfil', '/admin/agenda', '/recepcion', '/admin/ordenes', '/admin/usuarios', '/admin', '/admin/citas'],
    Premium: ['/admin/perfil', '/admin/agenda', '/recepcion', '/admin/ordenes', '/admin/usuarios', '/admin', '/admin/citas', '/admin/clientes', '/admin/inventario'],
    Size:    ['/admin/perfil', '/admin/agenda', '/recepcion', '/admin/ordenes', '/admin/usuarios', '/admin', '/admin/citas', '/admin/clientes', '/admin/inventario', '/admin/flota', '/admin/contratos'],
};

/**
 * Devuelve true si el plan puede acceder a la ruta dada.
 * Considera la jerarquía: Size > Premium > Pro > Digital = Gratis
 */
export function planCanAccess(plan: PlanId, pathname: string): boolean {
    const allowedPrefixes = PLAN_ALLOWED_ROUTES[plan];
    return allowedPrefixes.some(prefix => {
        // En Pro, /admin es un caso especial. Debe referirse SOLO al dashboard home, NO a todas sus subrutas wildcard.
        if (prefix === '/admin') return pathname === '/admin' || pathname === '/admin/';
        
        return pathname === prefix || pathname.startsWith(prefix + '/') || pathname.startsWith(prefix + '?');
    });
}

/** Módulos UI que cada plan expone (para Sidebar y componentes internos) */
export const PLAN_MODULES: Record<PlanId, string[]> = {
    Gratis:  ['perfil', 'agenda'],
    Digital: ['perfil', 'agenda'],
    Pro:     ['perfil', 'agenda', 'recepcion', 'ordenes', 'usuarios', 'dashboard', 'citas'],
    Premium: ['perfil', 'agenda', 'recepcion', 'ordenes', 'usuarios', 'dashboard', 'citas', 'inventario', 'clientes'],
    Size:    ['perfil', 'agenda', 'recepcion', 'ordenes', 'usuarios', 'dashboard', 'citas', 'inventario', 'clientes', 'flota', 'contratos'],
};

/** Helper para saber si el plan incluye un módulo específico */
export function planHasModule(plan: PlanId, module: string): boolean {
    return PLAN_MODULES[plan].includes(module);
}
