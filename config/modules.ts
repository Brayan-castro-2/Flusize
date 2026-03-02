/**
 * Feature Flags Configuration
 * Global dev-time feature flags (not per-taller).
 * Per-taller module control is handled via the `modulos_activos` JSONB column in the DB.
 */

export const FEATURE_FLAGS = {
  // Analytics module with charts and advanced metrics
  showAnalytics: true,

  // Appointment scheduling module (global fallback before DB loads)
  showAgenda: true,

  // Debt alert system in reception
  showDebtAlert: true,

  // Show visit history when searching for a vehicle
  showHistoryInReception: true,

  // Welcome banner for version 2.0
  showWelcomeBanner: true,

  // "NUEVO" badges on new features
  showNewBadges: true,
} as const;

export type FeatureFlags = typeof FEATURE_FLAGS;

// ── Módulos por Taller (SaaS Modular) ────────────────────────────────────────

export interface TallerModulos {
  agenda: boolean;
  tracking: boolean;
  inventario: boolean;
  checklist: boolean;
  fiscal: boolean;
}

export const DEFAULT_MODULOS: TallerModulos = {
  agenda: true,
  tracking: true,
  inventario: false,
  checklist: false,
  fiscal: false,
};

export const MODULOS_INFO: Array<{
  key: keyof TallerModulos;
  label: string;
  emoji: string;
  descripcion: string;
}> = [
    { key: 'agenda', label: 'Módulo de Agenda', emoji: '📅', descripcion: 'Citas y calendario de atención' },
    { key: 'tracking', label: 'Portal Tracking (Mi Garaje)', emoji: '📱', descripcion: 'App de seguimiento para clientes' },
    { key: 'inventario', label: 'Control de Inventario', emoji: '📦', descripcion: 'Gestión de repuestos y stock' },
    { key: 'checklist', label: 'Checklist de Ingreso', emoji: '✅', descripcion: 'Formulario de inspección al ingreso' },
    { key: 'fiscal', label: 'Módulo Fiscal (IVA/Boletas)', emoji: '🧾', descripcion: 'Emisión de boletas y documentos fiscales' },
  ];
