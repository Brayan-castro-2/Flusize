'use client';

import React, { useState, useEffect, useCallback } from 'react';
import {
    Shield, Key, Tag, UserPlus, Trash2, Pencil, Loader2,
    ChevronDown, ChevronUp, ShieldAlert, X, Check, Users, AlertTriangle, Crown
} from 'lucide-react';
import { motion, AnimatePresence } from 'framer-motion';
import { toast } from 'sonner';
import { supabase } from '@/lib/supabase';
import { useAuth } from '@/contexts/auth-context';
import FeatureGuard from '@/components/FeatureGuard';

// ------- TYPES -------
interface Perfil {
    id: string;
    nombre_completo: string | null;
    email: string | null;
    rol_rbac: string | null;
    rol: string | null;
    creado_en: string | null;
    activo: boolean;
    taller_id?: string | null;
}

interface Rol {
    id: string;
    nombre: string;
    etiqueta: string;
    color: string;
    es_sistema: boolean;
}

interface PermisosData {
    // e.g. { 'MECANICO': { 'inventario.ver': true, 'inventario.crear': false } }
    permissions: Record<string, Record<string, boolean>>;
    // e.g. { 'inventario.ver': 'Ver Inventario', ... }
    labels: Record<string, string>;
    // e.g. { 'Inventario': ['inventario.ver', 'inventario.crear'] }
    categories: Record<string, string[]>;
}

// ------- CONSTANTS -------
// Permission definitions
const ALL_PERMISSIONS: Array<{ key: string; label: string; category: string }> = [
    // Inventario
    { key: 'inventario.ver',      label: 'Ver Inventario',               category: 'Inventario' },
    { key: 'inventario.crear',    label: 'Crear movimientos',             category: 'Inventario' },
    { key: 'inventario.eliminar', label: 'Eliminar movimientos',          category: 'Inventario' },
    // Usuarios
    { key: 'usuarios.ver',        label: 'Ver Usuarios del Taller',       category: 'Usuarios' },
    { key: 'usuarios.editar',     label: 'Editar Roles de Usuarios',      category: 'Usuarios' },
    // Clientes
    { key: 'clientes.ver',        label: 'Ver Clientes',                  category: 'Clientes' },
    { key: 'clientes.crear',      label: 'Agregar Clientes',              category: 'Clientes' },
    // Órdenes (granular)
    { key: 'ordenes.ver_propias', label: 'Ver órdenes propias',           category: 'Órdenes' },
    { key: 'ordenes.ver_todas',   label: 'Ver todas las órdenes',         category: 'Órdenes' },
    { key: 'ordenes.crear',       label: 'Crear Órdenes de Trabajo',      category: 'Órdenes' },
    { key: 'ordenes.editar',      label: 'Editar Órdenes',               category: 'Órdenes' },
    { key: 'ordenes.eliminar',    label: 'Eliminar Órdenes',             category: 'Órdenes' },
    // Dashboard y Analítica
    { key: 'dashboard.view',           label: 'Ver Dashboard General',                   category: 'Dashboard y Analítica' },
    { key: 'analytics.view_metrics',   label: 'Ver Analítica (Métricas de flujo)',       category: 'Dashboard y Analítica' },
    { key: 'financials.view_totals',   label: 'Ver Números y Totales de Ventas (Dinero)', category: 'Dashboard y Analítica' },
    // Reportes
    { key: 'reportes.ver',        label: 'Ver Reportes',                  category: 'Reportes' },
];

const ADMIN_ROLES = ['admin', 'superadmin', 'taller_admin', 'flusize_admin'];

function buildPermissionsData(roles: Rol[], rawPermisos: any[]): PermisosData {
    const labels: Record<string, string> = {};
    const categories: Record<string, string[]> = {};

    ALL_PERMISSIONS.forEach(p => {
        labels[p.key] = p.label;
        if (!categories[p.category]) categories[p.category] = [];
        if (!categories[p.category].includes(p.key)) categories[p.category].push(p.key);
    });

    const permissions: Record<string, Record<string, boolean>> = {};
    roles.forEach(r => {
        permissions[r.nombre] = {};
        ALL_PERMISSIONS.forEach(p => { permissions[r.nombre][p.key] = false; });
    });

    rawPermisos.forEach(p => {
        // En la BD la columna se llama 'rol' y almacena el nombre del rol en texto
        const rol = roles.find(r => r.nombre === p.rol);
        if (rol) {
            // En la BD la columna se llama 'permiso' y almacena la clave completa (ej: usuarios.ver)
            const key = p.permiso;
            permissions[rol.nombre] = permissions[rol.nombre] || {};
            permissions[rol.nombre][key] = p.concedido ?? false;
        } else if (p.rol && permissions[p.rol]) {
            // Porcelana: si el rol ya está mapeado directamente
            const key = p.permiso;
            permissions[p.rol][key] = p.concedido ?? false;
        }
    });

    return { permissions, labels, categories };
}

// Color badge helper
function getRoleBadgeClasses(color: string) {
    switch (color) {
        case 'purple': return 'bg-purple-50 text-purple-700 border-purple-200';
        case 'blue': return 'bg-blue-50 text-blue-700 border-blue-200';
        case 'emerald': return 'bg-emerald-50 text-emerald-700 border-emerald-200';
        case 'orange': return 'bg-orange-50 text-orange-700 border-orange-200';
        case 'red': return 'bg-red-50 text-red-700 border-red-200';
        case 'amber': return 'bg-amber-50 text-amber-700 border-amber-200';
        default: return 'bg-slate-100 text-slate-600 border-slate-200';
    }
}

// ------- MAIN PAGE -------
export default function UsuariosPage() {
    return (
        <FeatureGuard
            moduleName="inventario"
            fallback={
                <div className="flex flex-col items-center justify-center p-12 text-center bg-white rounded-2xl border border-slate-100 shadow-sm mt-8">
                    <AlertTriangle className="w-10 h-10 text-amber-400 mb-4" />
                    <h2 className="text-xl font-bold text-slate-800 mb-2">Gestión de Usuarios y Roles</h2>
                    <p className="text-slate-500 max-w-md">Este módulo requiere activación. Contacta a soporte.</p>
                </div>
            }
        >
            <UsuariosContent />
        </FeatureGuard>
    );
}

function UsuariosContent() {
    const { user, hasPermission } = useAuth();

    const [perfiles, setPerfiles] = useState<Perfil[]>([]);
    const [roles, setRoles] = useState<Rol[]>([]);
    const [permissionsData, setPermissionsData] = useState<PermisosData | null>(null);
    const [loading, setLoading] = useState(true);
    const [permLoading, setPermLoading] = useState(false);
    const [updatingPerm, setUpdatingPerm] = useState<string | null>(null);

    const [showRolesManager, setShowRolesManager] = useState(false);
    const [showRolePanel, setShowRolePanel] = useState(false);
    const [showDeleted, setShowDeleted] = useState(false);

    const [deleteModal, setDeleteModal] = useState({ isOpen: false, userId: '' });
    const [roleDeleteModal, setRoleDeleteModal] = useState({ isOpen: false, roleId: '' });

    const [createUserModalOpen, setCreateUserModalOpen] = useState(false);
    const [newUserForm, setNewUserForm] = useState({
        nombreCompleto: '',
        email: '',
        password: '',
        rol: '',
    });
    const [isCreatingUser, setIsCreatingUser] = useState(false);

    const [newRole, setNewRole] = useState({ nombre: '', etiqueta: '', color: 'blue' });
    const [savingRole, setSavingRole] = useState(false);
    const [editRoleMode, setEditRoleMode] = useState<Record<string, string>>({}); // userId → new role name

    const isAdmin = hasPermission('usuarios.editar');
    const canCreateUser = hasPermission('usuarios.crear') || user?.role === 'superadmin';
    const canEditRoles = hasPermission('usuarios.editar') || user?.role === 'superadmin';
    const canViewMatrix = hasPermission('roles.crear') || hasPermission('usuarios.editar') || user?.role === 'superadmin';
    const isSuperAdmin = user?.role === 'superadmin';

    // ─── FETCH ─────────────────────────────────────────────────────────────────
    const fetchPerfiles = useCallback(async () => {
        if (!user?.tallerId) return;
        setLoading(true);
        try {
            let query = supabase
                .from('perfiles')
                .select('id, nombre_completo, email, rol_rbac, rol, activo, creado_en, taller_id')
                .eq('taller_id', user.tallerId)
                .order('creado_en', { ascending: false });

            if (!showDeleted) {
                query = query.eq('activo', true);
            }

            const { data, error } = await query;
            if (error) throw error;
            setPerfiles(data || []);
        } catch (err: any) {
            toast.error('Error al cargar usuarios: ' + err.message);
        } finally {
            setLoading(false);
        }
    }, [user?.tallerId, showDeleted]);

    const fetchRoles = useCallback(async () => {
        try {
            const { data, error } = await supabase
                .from('roles')
                .select('*')
                .order('es_sistema', { ascending: false });
            if (error) throw error;

            const filtered = (data || []).filter((r: Rol) =>
                isSuperAdmin ? true : r.nombre.toLowerCase() !== 'superadmin'
            );

            // Sort roles reflecting fixed hierarchy
            const roleOrder = ['superadmin', 'flusize_admin', 'taller_admin', 'admin', 'mecanico', 'vendedor'];
            filtered.sort((a, b) => {
                const idxA = roleOrder.indexOf(a.nombre.toLowerCase());
                const idxB = roleOrder.indexOf(b.nombre.toLowerCase());
                const posA = idxA === -1 ? 999 : idxA;
                const posB = idxB === -1 ? 999 : idxB;
                return posA - posB;
            });

            setRoles(filtered);
            return filtered as Rol[];
        } catch (err: any) {
            toast.error('Error al cargar roles: ' + err.message);
            return [];
        }
    }, [isSuperAdmin]);

    const fetchPermissions = useCallback(async (currentRoles?: Rol[]) => {
        const resolvedRoles = currentRoles || roles;
        if (!resolvedRoles.length) return;
        
        setPermLoading(true);
        try {
            const { data: rawPermisos, error } = await supabase
                .from('permisos_rol')
                .select('*');
            if (error) throw error;
            setPermissionsData(buildPermissionsData(resolvedRoles, rawPermisos || []));
        } catch (err: any) {
            toast.error('Error al cargar permisos: ' + err.message);
        } finally {
            setPermLoading(false);
        }
    }, [roles.length]); // Only change if the NUMBER of roles changes, or remove entirely if using argument


    useEffect(() => {
        if (!user?.tallerId) return;
        
        const init = async () => {
            const loadedRoles = await fetchRoles();
            await fetchPerfiles();
            if (isAdmin && loadedRoles.length > 0) {
                await fetchPermissions(loadedRoles);
            }
        };
        
        init();
        // Removed fetchRoles, fetchPerfiles, fetchPermissions from dependencies to avoid loops
        // They are memoized via useCallback but we only want to run this once or when workshop context changes.
    }, [user?.tallerId, showDeleted, isAdmin]);


    // ─── HANDLERS ──────────────────────────────────────────────────────────────
    const handleAddRole = async (e: React.FormEvent) => {
        e.preventDefault();
        setSavingRole(true);
        try {
            const { error } = await supabase.from('roles').insert({
                nombre: newRole.nombre.trim().toLowerCase(),
                etiqueta: newRole.etiqueta.trim(),
                color: newRole.color,
                es_sistema: false,
            });
            if (error) throw error;
            toast.success(`Rol "${newRole.etiqueta}" creado`);
            setNewRole({ nombre: '', etiqueta: '', color: 'blue' });
            await fetchRoles();
        } catch (err: any) {
            toast.error('Error al crear rol: ' + err.message);
        } finally {
            setSavingRole(false);
        }
    };

    const handleDeleteRole = async (roleId: string) => {
        try {
            const { error } = await supabase
                .from('roles')
                .delete()
                .eq('id', roleId);
            if (error) throw error;
            toast.success('Rol eliminado');
            setRoleDeleteModal({ isOpen: false, roleId: '' });
            await fetchRoles();
        } catch (err: any) {
            toast.error('Error al eliminar rol: ' + err.message);
        }
    };

    const handleUpdateUserRole = async (perfilId: string, nuevoRol: string) => {
        try {
            const { error } = await supabase
                .from('perfiles')
                .update({ rol_rbac: nuevoRol })
                .eq('id', perfilId)
                .eq('taller_id', user!.tallerId!);
            if (error) throw error;
            toast.success('Rol actualizado');
            setEditRoleMode(prev => { const n = { ...prev }; delete n[perfilId]; return n; });
            await fetchPerfiles();
        } catch (err: any) {
            toast.error('Error al actualizar rol: ' + err.message);
        }
    };

    const handleSoftDeleteUser = async () => {
        if (!deleteModal.userId) return;
        try {
            const { error } = await supabase
                .from('perfiles')
                .update({ activo: false }) // desactivar lógico
                .eq('id', deleteModal.userId)
                .eq('taller_id', user!.tallerId!);
            if (error) throw error;
            toast.success('Usuario desactivado');
            setDeleteModal({ isOpen: false, userId: '' });
            await fetchPerfiles();
        } catch (err: any) {
            toast.error('Error al desactivar usuario: ' + err.message);
        }
    };

    const handleCreateUser = async (e: React.FormEvent) => {
        e.preventDefault();
        setIsCreatingUser(true);
        try {
            const response = await fetch('/api/usuarios/crear', {
                method: 'POST',
                headers: {
                    'Content-Type': 'application/json',
                    'Authorization': `Bearer ${(await supabase.auth.getSession()).data.session?.access_token}`,
                },
                body: JSON.stringify({
                    nombreCompleto: newUserForm.nombreCompleto.trim(),
                    email: newUserForm.email.trim(),
                    password: newUserForm.password,
                    rol: newUserForm.rol,
                    tallerId: user!.tallerId!,
                }),
            });
            const data = await response.json();
            if (!response.ok) {
                throw new Error(data.error || 'Error al crear usuario');
            }
            toast.success(data.message || 'Usuario creado correctamente');
            setCreateUserModalOpen(false);
            setNewUserForm({ nombreCompleto: '', email: '', password: '', rol: '' });
            await fetchPerfiles();
        } catch (err: any) {
            toast.error(err.message);
        } finally {
            setIsCreatingUser(false);
        }
    };

    const handleTogglePermission = async (rolNombre: string, permKey: string, currentValue: boolean) => {
        const rol = roles.find(r => r.nombre === rolNombre);
        if (!rol) return;

        const key = `${rolNombre}-${permKey}`;
        setUpdatingPerm(key);

        try {
            const { error } = await supabase
                .from('permisos_rol')
                .upsert({
                    rol: rolNombre,
                    permiso: permKey,
                    concedido: !currentValue,
                }, {
                    onConflict: 'rol,permiso',
                    ignoreDuplicates: false,
                });

            if (error) throw error;

            // Optimistic UI update
            setPermissionsData(prev => {
                if (!prev) return prev;
                return {
                    ...prev,
                    permissions: {
                        ...prev.permissions,
                        [rolNombre]: {
                            ...prev.permissions[rolNombre],
                            [permKey]: !currentValue,
                        },
                    },
                };
            });
            toast.success('Permiso actualizado');
        } catch (err: any) {
            toast.error('Error al actualizar permiso: ' + err.message);
        } finally {
            setUpdatingPerm(null);
        }
    };

    // ─── RENDER HELPERS ────────────────────────────────────────────────────────
    const getRoleBadge = (rolNombre: string | null) => {
        const rol = roles.find(r => r.nombre === rolNombre);
        const etiqueta = rol?.etiqueta || rolNombre || '—';
        const classes = getRoleBadgeClasses(rol?.color || 'gray');
        const isOwner = rolNombre?.toUpperCase() === 'TALLER_ADMIN';
        
        return (
            <span className={`inline-flex items-center gap-1.5 rounded-lg px-2.5 py-1 text-xs font-bold border ${classes} ${isOwner ? 'ring-1 ring-amber-400 shadow-sm' : ''}`}>
                {isOwner && <Crown className="h-3.5 w-3.5 text-amber-500" />}
                {rolNombre === 'ADMIN' && <Shield className="h-3 w-3" />}
                {etiqueta}
            </span>
        );
    };

    // ─── RENDER ────────────────────────────────────────────────────────────────
    if (!user) return null;

    return (
        <div className="max-w-5xl mx-auto space-y-6 pb-16 pt-6 px-4 sm:px-0">

            {/* Header */}
            <div className="flex flex-col sm:flex-row sm:items-center sm:justify-between gap-4">
                <div>
                    <h2 className="text-2xl font-black bg-clip-text text-transparent bg-gradient-to-r from-slate-800 to-slate-600">
                        Usuarios y Control de Acceso
                    </h2>
                    <p className="text-slate-500 text-sm mt-1">Gestiona los miembros del taller y sus permisos de acceso.</p>
                </div>
                {isAdmin && (
                    <button
                        onClick={() => setShowDeleted(v => !v)}
                        className={`flex items-center gap-2 rounded-xl border px-4 py-2 text-xs font-bold transition-colors ${showDeleted
                            ? 'bg-red-50 border-red-200 text-red-600'
                            : 'border-slate-200 bg-white text-slate-500 hover:bg-slate-50'
                            }`}
                    >
                        <Trash2 className="h-3 w-3" />
                        {showDeleted ? 'Ocultar desactivados' : 'Ver desactivados'}
                    </button>
                )}
            </div>

            {/* ── Role Manager Panel (Admin Only) ── */}
            {isAdmin && (
                <div className="rounded-2xl border border-slate-200 bg-white overflow-hidden shadow-sm">
                    <button
                        onClick={() => setShowRolesManager(v => !v)}
                        className="w-full flex items-center justify-between p-5 hover:bg-slate-50 transition-colors"
                    >
                        <div className="flex items-center gap-3">
                            <div className="w-9 h-9 bg-blue-50 text-blue-600 rounded-xl flex items-center justify-center">
                                <Tag className="h-5 w-5" />
                            </div>
                            <div className="text-left">
                                <h3 className="text-base font-bold text-slate-800">Gestión de Roles</h3>
                                <p className="text-xs text-slate-500">Crea y administra los roles disponibles en el taller.</p>
                            </div>
                        </div>
                        {showRolesManager
                            ? <ChevronUp className="h-5 w-5 text-slate-400" />
                            : <ChevronDown className="h-5 w-5 text-slate-400" />}
                    </button>

                    <AnimatePresence initial={false}>
                        {showRolesManager && (
                            <motion.div
                                key="roles-panel"
                                initial={{ height: 0, opacity: 0 }}
                                animate={{ height: 'auto', opacity: 1 }}
                                exit={{ height: 0, opacity: 0 }}
                                transition={{ duration: 0.2 }}
                                className="overflow-hidden border-t border-slate-100"
                            >
                                <div className="p-6 grid md:grid-cols-2 gap-8 bg-slate-50">
                                    {/* Create Role */}
                                    <div>
                                        <h4 className="text-sm font-bold text-slate-700 mb-4">Crear Nuevo Rol</h4>
                                        <form onSubmit={handleAddRole} className="space-y-3 bg-white rounded-2xl border border-slate-200 p-5 shadow-sm">
                                            <div>
                                                <label className="block text-xs font-bold text-slate-500 uppercase tracking-wider mb-1.5">Código único (ej. JEFE_TALLER)</label>
                                                <input
                                                    required
                                                    placeholder="JEFE_TALLER"
                                                    value={newRole.nombre}
                                                    onChange={e => setNewRole({ ...newRole, nombre: e.target.value.toUpperCase().replace(/\s/g, '_') })}
                                                    className="w-full px-4 py-2.5 rounded-xl border border-slate-200 bg-slate-50 text-sm font-mono font-bold text-slate-800 focus:ring-2 focus:ring-blue-500 focus:border-transparent outline-none"
                                                />
                                            </div>
                                            <div>
                                                <label className="block text-xs font-bold text-slate-500 uppercase tracking-wider mb-1.5">Nombre visible</label>
                                                <input
                                                    required
                                                    placeholder="Jefe de Taller"
                                                    value={newRole.etiqueta}
                                                    onChange={e => setNewRole({ ...newRole, etiqueta: e.target.value })}
                                                    className="w-full px-4 py-2.5 rounded-xl border border-slate-200 bg-slate-50 text-sm font-medium text-slate-800 focus:ring-2 focus:ring-blue-500 focus:border-transparent outline-none"
                                                />
                                            </div>
                                            <div>
                                                <label className="block text-xs font-bold text-slate-500 uppercase tracking-wider mb-1.5">Color</label>
                                                <select
                                                    value={newRole.color}
                                                    onChange={e => setNewRole({ ...newRole, color: e.target.value })}
                                                    className="w-full px-4 py-2.5 rounded-xl border border-slate-200 bg-slate-50 text-sm font-semibold text-slate-700 focus:ring-2 focus:ring-blue-500 focus:border-transparent outline-none"
                                                >
                                                    <option value="gray">Gris</option>
                                                    <option value="blue">Azul</option>
                                                    <option value="purple">Morado</option>
                                                    <option value="emerald">Verde</option>
                                                    <option value="orange">Naranja</option>
                                                    <option value="red">Rojo</option>
                                                    <option value="amber">Ámbar</option>
                                                </select>
                                            </div>
                                            <button
                                                type="submit"
                                                disabled={savingRole}
                                                className="w-full flex items-center justify-center gap-2 bg-blue-600 hover:bg-blue-700 text-white rounded-xl py-2.5 text-sm font-bold transition-colors disabled:opacity-60"
                                            >
                                                {savingRole ? <Loader2 className="h-4 w-4 animate-spin" /> : <Tag className="h-4 w-4" />}
                                                Crear Rol
                                            </button>
                                        </form>
                                    </div>

                                    {/* Roles list */}
                                    <div>
                                        <h4 className="text-sm font-bold text-slate-700 mb-4">Roles Actuales ({roles.length})</h4>
                                        <div className="space-y-2">
                                            {roles.map(rol => (
                                                <div key={rol.id} className="flex items-center justify-between p-3 bg-white rounded-xl border border-slate-200 shadow-sm">
                                                    <div className="flex items-center gap-3">
                                                        {getRoleBadge(rol.nombre)}
                                                        <span className="text-[11px] font-mono text-slate-400">{rol.nombre}</span>
                                                    </div>
                                                    {rol.es_sistema
                                                        ? <span className="text-[10px] bg-slate-100 text-slate-400 font-bold uppercase tracking-wide px-2 py-1 rounded-lg">Sistema</span>
                                                        : <button
                                                            onClick={() => setRoleDeleteModal({ isOpen: true, roleId: rol.id })}
                                                            className="p-1.5 text-slate-400 hover:text-red-500 hover:bg-red-50 rounded-lg transition-colors"
                                                        >
                                                            <Trash2 className="h-3.5 w-3.5" />
                                                        </button>
                                                    }
                                                </div>
                                            ))}
                                        </div>
                                    </div>
                                </div>
                            </motion.div>
                        )}
                    </AnimatePresence>
                </div>
            )}

            {/* ── Permissions Matrix Panel (Admin Only) ── */}
            {canViewMatrix && (
                <div className="rounded-2xl border border-slate-200 bg-white overflow-hidden shadow-sm">
                    <button
                        onClick={() => { setShowRolePanel(v => !v); if (!showRolePanel && !permissionsData) fetchPermissions(); }}
                        className="w-full flex items-center justify-between p-5 hover:bg-slate-50 transition-colors"
                    >
                        <div className="flex items-center gap-3">
                            <div className="w-9 h-9 bg-purple-50 text-purple-600 rounded-xl flex items-center justify-center">
                                <Key className="h-5 w-5" />
                            </div>
                            <div className="text-left">
                                <h3 className="text-base font-bold text-slate-800">Matriz de Permisos</h3>
                                <p className="text-xs text-slate-500">Define qué puede hacer cada rol dentro del sistema.</p>
                            </div>
                        </div>
                        {showRolePanel
                            ? <ChevronUp className="h-5 w-5 text-slate-400" />
                            : <ChevronDown className="h-5 w-5 text-slate-400" />}
                    </button>

                    <AnimatePresence initial={false}>
                        {showRolePanel && (
                            <motion.div
                                key="perms-panel"
                                initial={{ height: 0, opacity: 0 }}
                                animate={{ height: 'auto', opacity: 1 }}
                                exit={{ height: 0, opacity: 0 }}
                                transition={{ duration: 0.2 }}
                                className="overflow-hidden border-t border-slate-100"
                            >
                                <div className="p-4">
                                    {permLoading ? (
                                        <div className="flex items-center justify-center py-12 gap-3">
                                            <Loader2 className="h-5 w-5 animate-spin text-slate-400" />
                                            <span className="text-slate-400 text-sm font-medium">Cargando permisos...</span>
                                        </div>
                                    ) : permissionsData ? (
                                        <div className="overflow-x-auto">
                                            <table className="w-full text-sm">
                                                <thead>
                                                    <tr>
                                                        <th className="pb-4 pr-4 text-left text-xs font-bold text-slate-400 uppercase tracking-wider min-w-[180px]">
                                                            Permiso
                                                        </th>
                                                        {roles.map(rol => (
                                                            <th key={rol.id} className="pb-4 px-4 text-center">
                                                                {getRoleBadge(rol.nombre)}
                                                            </th>
                                                        ))}
                                                    </tr>
                                                </thead>
                                                <tbody>
                                                    {Object.entries(permissionsData.categories).map(([category, permKeys]) => (
                                                        <React.Fragment key={category}>
                                                            <tr>
                                                                <td
                                                                    colSpan={roles.length + 1}
                                                                    className="py-3 px-3 bg-slate-50 text-[10px] font-black uppercase tracking-widest text-slate-500 rounded-xl"
                                                                >
                                                                    {category}
                                                                </td>
                                                            </tr>
                                                            {permKeys.map(permKey => (
                                                                <tr key={permKey} className="hover:bg-slate-50 transition-colors">
                                                                    <td className="py-3 pr-4 pl-3 text-slate-700 font-medium text-xs border-r border-slate-100">
                                                                        {permissionsData.labels[permKey]}
                                                                    </td>
                                                                    {roles.map(rol => {
                                                                        const granted = permissionsData.permissions[rol.nombre]?.[permKey] ?? false;
                                                                        const isUpdating = updatingPerm === `${rol.nombre}-${permKey}`;
                                                                        const isProtected = rol.es_sistema && (rol.nombre === 'ADMIN' || rol.nombre === 'SUPERADMIN');

                                                                        return (
                                                                            <td key={rol.id} className="py-3 px-4 text-center">
                                                                                <button
                                                                                    onClick={() => !isProtected && handleTogglePermission(rol.nombre, permKey, granted)}
                                                                                    disabled={isUpdating || isProtected}
                                                                                    title={isProtected ? 'Protegido por sistema' : granted ? 'Revocar permiso' : 'Conceder permiso'}
                                                                                    className={`relative inline-flex h-5 w-9 items-center rounded-full transition-colors focus:outline-none
                                                                                        ${granted ? 'bg-emerald-500' : 'bg-slate-200'}
                                                                                        ${isProtected ? 'opacity-40 cursor-not-allowed' : 'cursor-pointer hover:opacity-80'}
                                                                                    `}
                                                                                >
                                                                                    {isUpdating
                                                                                        ? <Loader2 className="h-3 w-3 animate-spin text-white mx-auto" />
                                                                                        : <span className={`inline-block h-3.5 w-3.5 transform rounded-full bg-white shadow transition-transform ${granted ? 'translate-x-4' : 'translate-x-0.5'}`} />
                                                                                    }
                                                                                </button>
                                                                            </td>
                                                                        );
                                                                    })}
                                                                </tr>
                                                            ))}
                                                        </React.Fragment>
                                                    ))}
                                                </tbody>
                                            </table>
                                        </div>
                                    ) : (
                                        <div className="text-center py-8 text-slate-400 text-sm font-medium">
                                            Error al cargar los permisos. Intenta reabrir este panel.
                                        </div>
                                    )}
                                </div>
                            </motion.div>
                        )}
                    </AnimatePresence>
                </div>
            )}

            {/* ── Users Table ── */}
            <div className="rounded-2xl border border-slate-200 bg-white overflow-hidden shadow-sm">
                <div className="flex items-center justify-between p-5 border-b border-slate-100">
                    <div className="flex items-center gap-3">
                        <div className="w-9 h-9 bg-slate-100 text-slate-600 rounded-xl flex items-center justify-center">
                            <Users className="h-5 w-5" />
                        </div>
                        <div>
                            <h3 className="text-base font-bold text-slate-800">Miembros del Taller</h3>
                            <p className="text-xs text-slate-500">{perfiles.length} usuario{perfiles.length !== 1 ? 's' : ''} registrado{perfiles.length !== 1 ? 's' : ''}</p>
                        </div>
                    </div>
                    {canCreateUser && (
                        <button
                            onClick={() => setCreateUserModalOpen(true)}
                            className="flex items-center gap-2 rounded-xl bg-blue-600 px-4 py-2 text-sm font-bold text-white hover:bg-blue-700 transition-colors shadow-sm"
                        >
                            <UserPlus className="h-4 w-4" />
                            Añadir Miembro
                        </button>
                    )}
                </div>

                {loading ? (
                    <div className="flex items-center justify-center py-16 gap-3">
                        <div className="w-8 h-8 border-4 border-slate-100 border-t-blue-500 rounded-full animate-spin" />
                    </div>
                ) : (
                    <div className="overflow-x-auto">
                        <table className="w-full text-sm text-left">
                            <thead className="bg-slate-50 text-[11px] uppercase text-slate-400 border-b border-slate-100 font-bold tracking-wider">
                                <tr>
                                    <th className="px-6 py-4">Usuario</th>
                                    <th className="px-6 py-4">Rol en el sistema</th>
                                    <th className="px-6 py-4">Registrado</th>
                                    {canEditRoles && <th className="px-6 py-4 text-center">Acciones</th>}
                                </tr>
                            </thead>
                            <tbody className="divide-y divide-slate-100">
                                {perfiles.length === 0 && (
                                    <tr>
                                        <td colSpan={4} className="px-6 py-12 text-center text-slate-400 font-medium">
                                            No se encontraron usuarios para este taller.
                                        </td>
                                    </tr>
                                )}
                                {perfiles.map(perfil => (
                                    <tr
                                        key={perfil.id}
                                        className={`hover:bg-slate-50 transition-colors ${!perfil.activo ? 'bg-red-50/50' : ''}`}
                                    >
                                        <td className="px-6 py-4">
                                            <div className={`font-bold text-slate-800 ${!perfil.activo ? 'opacity-50 line-through' : ''}`}>
                                                {perfil.nombre_completo || '(Sin nombre)'}
                                            </div>
                                            <div className="text-xs text-slate-400 font-medium mt-0.5">{perfil.email}</div>
                                            {!perfil.activo && (
                                                <span className="mt-1 inline-flex items-center rounded-lg bg-red-100 text-red-600 px-2 py-0.5 text-[10px] font-bold border border-red-200 uppercase tracking-wide">
                                                    Desactivado
                                                </span>
                                            )}
                                        </td>
                                        <td className="px-6 py-4">
                                            {/* If admin is editing this user's role inline */}
                                            {editRoleMode[perfil.id] !== undefined ? (
                                                <div className="flex items-center gap-2">
                                                    <select
                                                        value={editRoleMode[perfil.id]}
                                                        onChange={e => setEditRoleMode(prev => ({ ...prev, [perfil.id]: e.target.value }))}
                                                        className="rounded-xl border border-slate-200 bg-slate-50 text-xs font-bold text-slate-700 px-3 py-1.5 focus:ring-2 focus:ring-blue-500 outline-none"
                                                    >
                                                        <option value="">Sin rol</option>
                                                        {roles.map(r => (
                                                            <option key={r.id} value={r.nombre}>{r.etiqueta}</option>
                                                        ))}
                                                    </select>
                                                    <button
                                                        onClick={() => handleUpdateUserRole(perfil.id, editRoleMode[perfil.id])}
                                                        className="p-1.5 bg-emerald-50 text-emerald-600 hover:bg-emerald-100 rounded-lg transition-colors"
                                                        title="Guardar"
                                                    >
                                                        <Check className="h-3.5 w-3.5" />
                                                    </button>
                                                    <button
                                                        onClick={() => setEditRoleMode(prev => { const n = { ...prev }; delete n[perfil.id]; return n; })}
                                                        className="p-1.5 bg-slate-100 text-slate-500 hover:bg-slate-200 rounded-lg transition-colors"
                                                        title="Cancelar"
                                                    >
                                                        <X className="h-3.5 w-3.5" />
                                                    </button>
                                                </div>
                                            ) : (
                                                getRoleBadge(perfil.rol_rbac || perfil.rol?.toUpperCase() || null)
                                            )}
                                        </td>
                                        <td className="px-6 py-4 text-slate-400 text-xs font-medium">
                                            {perfil.creado_en ? new Date(perfil.creado_en).toLocaleDateString('es-CL') : '—'}
                                        </td>
                                        {canEditRoles && (
                                            <td className="px-6 py-4">
                                                <div className="flex items-center justify-center gap-2">
                                                    {perfil.activo && (
                                                        <>
                                                            <button
                                                                onClick={() => setEditRoleMode(prev => ({ ...prev, [perfil.id]: perfil.rol_rbac ?? perfil.rol?.toUpperCase() ?? '' }))}
                                                                className="p-2 rounded-xl text-slate-400 hover:text-blue-600 hover:bg-blue-50 transition-colors"
                                                                title="Editar rol"
                                                            >
                                                                <Pencil className="h-4 w-4" />
                                                            </button>
                                                            <button
                                                                onClick={() => setDeleteModal({ isOpen: true, userId: perfil.id })}
                                                                className="p-2 rounded-xl text-slate-400 hover:text-red-600 hover:bg-red-50 transition-colors"
                                                                title="Desactivar usuario"
                                                            >
                                                                <Trash2 className="h-4 w-4" />
                                                            </button>
                                                        </>
                                                    )}
                                                </div>
                                            </td>
                                        )}
                                    </tr>
                                ))}
                            </tbody>
                        </table>
                    </div>
                )}
            </div>

            {/* ── Delete Confirm Modal ── */}
            <AnimatePresence>
                {deleteModal.isOpen && (
                    <motion.div
                        key="delete-backdrop"
                        initial={{ opacity: 0 }}
                        animate={{ opacity: 1 }}
                        exit={{ opacity: 0 }}
                        className="fixed inset-0 z-[100] flex items-center justify-center bg-slate-900/60 backdrop-blur-sm p-4"
                    >
                        <motion.div
                            initial={{ scale: 0.95, opacity: 0 }}
                            animate={{ scale: 1, opacity: 1 }}
                            exit={{ scale: 0.95, opacity: 0 }}
                            className="w-full max-sm bg-white rounded-2xl shadow-2xl border border-slate-100 p-6 text-center"
                        >
                            <div className="w-14 h-14 bg-red-50 rounded-2xl flex items-center justify-center mx-auto mb-4">
                                <ShieldAlert className="h-7 w-7 text-red-500" />
                            </div>
                            <h3 className="text-lg font-black text-slate-800 mb-2">¿Desactivar Usuario?</h3>
                            <p className="text-slate-500 text-sm mb-6">El usuario perderá acceso al sistema. Este cambio es reversible desde la base de datos.</p>
                            <div className="flex gap-3">
                                <button
                                    onClick={() => setDeleteModal({ isOpen: false, userId: '' })}
                                    className="flex-1 rounded-xl border border-slate-200 bg-slate-50 px-4 py-2.5 text-sm font-bold text-slate-600 hover:bg-slate-100 transition-colors"
                                >
                                    Cancelar
                                </button>
                                <button
                                    onClick={handleSoftDeleteUser}
                                    className="flex-1 rounded-xl bg-red-600 hover:bg-red-700 px-4 py-2.5 text-sm font-bold text-white transition-colors"
                                >
                                    Sí, desactivar
                                </button>
                            </div>
                        </motion.div>
                    </motion.div>
                )}
            </AnimatePresence>

            {/* ── Role Delete Modal ── */}
            <AnimatePresence>
                {roleDeleteModal.isOpen && (
                    <motion.div
                        key="role-delete-backdrop"
                        initial={{ opacity: 0 }}
                        animate={{ opacity: 1 }}
                        exit={{ opacity: 0 }}
                        className="fixed inset-0 z-[100] flex items-center justify-center bg-slate-900/60 backdrop-blur-sm p-4"
                    >
                        <motion.div
                            initial={{ scale: 0.95, opacity: 0 }}
                            animate={{ scale: 1, opacity: 1 }}
                            exit={{ scale: 0.95, opacity: 0 }}
                            className="w-full max-sm bg-white rounded-2xl shadow-2xl border border-slate-100 p-6 text-center"
                        >
                            <div className="w-14 h-14 bg-amber-50 rounded-2xl flex items-center justify-center mx-auto mb-4">
                                <Trash2 className="h-7 w-7 text-amber-500" />
                            </div>
                            <h3 className="text-lg font-black text-slate-800 mb-2">¿Eliminar Rol?</h3>
                            <p className="text-slate-500 text-sm mb-6">Si este rol está asignado a usuarios, deberás reasignarlo manualmente. Esta acción es irreversible.</p>
                            <div className="flex gap-3">
                                <button
                                    onClick={() => setRoleDeleteModal({ isOpen: false, roleId: '' })}
                                    className="flex-1 rounded-xl border border-slate-200 bg-slate-50 px-4 py-2.5 text-sm font-bold text-slate-600 hover:bg-slate-100 transition-colors"
                                >
                                    Cancelar
                                </button>
                                <button
                                    onClick={() => handleDeleteRole(roleDeleteModal.roleId)}
                                    className="flex-1 rounded-xl bg-amber-600 hover:bg-amber-700 px-4 py-2.5 text-sm font-bold text-white transition-colors"
                                >
                                    Eliminar Rol
                                </button>
                            </div>
                        </motion.div>
                    </motion.div>
                )}
            </AnimatePresence>

            {/* ── Create User Modal ── */}
            <AnimatePresence>
                {createUserModalOpen && (
                    <motion.div
                        key="create-user-backdrop"
                        initial={{ opacity: 0 }}
                        animate={{ opacity: 1 }}
                        exit={{ opacity: 0 }}
                        className="fixed inset-0 z-[100] flex items-center justify-center bg-slate-900/60 backdrop-blur-sm p-4"
                    >
                        <motion.div
                            initial={{ scale: 0.95, opacity: 0 }}
                            animate={{ scale: 1, opacity: 1 }}
                            exit={{ scale: 0.95, opacity: 0 }}
                            className="w-full max-w-md bg-white rounded-2xl shadow-2xl border border-slate-100 overflow-hidden"
                        >
                            <div className="flex items-center justify-between p-5 border-b border-slate-100 bg-slate-50/50">
                                <div className="flex items-center gap-3">
                                    <div className="w-10 h-10 bg-blue-50 rounded-xl flex items-center justify-center text-blue-600">
                                        <UserPlus className="h-5 w-5" />
                                    </div>
                                    <div>
                                        <h3 className="text-lg font-black text-slate-800">Nuevo Miembro</h3>
                                        <p className="text-xs font-medium text-slate-500">Agrega a alguien a tu equipo</p>
                                    </div>
                                </div>
                                <button
                                    onClick={() => setCreateUserModalOpen(false)}
                                    className="p-2 text-slate-400 hover:text-slate-600 hover:bg-slate-100 rounded-xl transition-colors"
                                >
                                    <X className="h-5 w-5" />
                                </button>
                            </div>

                            <form onSubmit={handleCreateUser} className="p-6 space-y-4">
                                <div>
                                    <label className="block text-xs font-bold text-slate-500 uppercase tracking-wider mb-1.5">Nombre Completo</label>
                                    <input
                                        required
                                        placeholder="Ej. Juan Pérez"
                                        value={newUserForm.nombreCompleto}
                                        onChange={e => setNewUserForm({ ...newUserForm, nombreCompleto: e.target.value })}
                                        className="w-full px-4 py-3 rounded-xl border border-slate-200 bg-white text-slate-900 placeholder:text-slate-400 text-sm font-medium focus:ring-2 focus:ring-blue-500 focus:border-transparent outline-none transition-all"
                                        style={{ color: '#1e293b' }}
                                    />
                                </div>

                                <div>
                                    <label className="block text-xs font-bold text-slate-500 uppercase tracking-wider mb-1.5">Correo Electrónico</label>
                                    <input
                                        required
                                        type="email"
                                        placeholder="juan@taller.com"
                                        value={newUserForm.email}
                                        onChange={e => setNewUserForm({ ...newUserForm, email: e.target.value })}
                                        className="w-full px-4 py-3 rounded-xl border border-slate-200 bg-white text-slate-900 placeholder:text-slate-400 text-sm font-medium focus:ring-2 focus:ring-blue-500 focus:border-transparent outline-none transition-all"
                                        style={{ color: '#1e293b' }}
                                    />
                                </div>

                                <div>
                                    <label className="block text-xs font-bold text-slate-500 uppercase tracking-wider mb-1.5">Contraseña Temporal</label>
                                    <input
                                        required
                                        type="password"
                                        placeholder="Min. 6 caracteres"
                                        minLength={6}
                                        value={newUserForm.password}
                                        onChange={e => setNewUserForm({ ...newUserForm, password: e.target.value })}
                                        className="w-full px-4 py-3 rounded-xl border border-slate-200 bg-white text-slate-900 placeholder:text-slate-400 text-sm font-medium focus:ring-2 focus:ring-blue-500 focus:border-transparent outline-none transition-all"
                                        style={{ color: '#1e293b' }}
                                    />
                                </div>

                                <div>
                                    <label className="block text-xs font-bold text-slate-500 uppercase tracking-wider mb-1.5">Rol en el Sistema</label>
                                    <select
                                        required
                                        value={newUserForm.rol}
                                        onChange={e => setNewUserForm({ ...newUserForm, rol: e.target.value })}
                                        className="w-full px-4 py-3 rounded-xl border border-slate-200 bg-white text-sm font-bold text-slate-700 focus:ring-2 focus:ring-blue-500 focus:border-transparent outline-none transition-all appearance-none"
                                        style={{ color: '#334155' }}
                                    >
                                        <option value="" disabled style={{ color: '#334155' }}>Selecciona un rol</option>
                                        {roles
                                            .filter(r => !['flusize_admin', 'superadmin'].includes(r.nombre.toLowerCase()))
                                            .map(r => (
                                                <option key={r.id} value={r.nombre} style={{ color: '#334155' }}>{r.etiqueta}</option>
                                            ))
                                        }
                                    </select>
                                </div>

                                <div className="pt-4 border-t border-slate-100 flex gap-3">
                                    <button
                                        type="button"
                                        onClick={() => setCreateUserModalOpen(false)}
                                        className="flex-1 py-3 px-4 rounded-xl font-bold text-slate-600 bg-slate-100 hover:bg-slate-200 transition-colors"
                                    >
                                        Cancelar
                                    </button>
                                    <button
                                        type="submit"
                                        disabled={isCreatingUser || !newUserForm.rol || newUserForm.password.length < 6}
                                        className="flex-1 py-3 px-4 rounded-xl font-bold text-white bg-blue-600 hover:bg-blue-700 transition-colors flex items-center justify-center gap-2 disabled:opacity-50"
                                    >
                                        {isCreatingUser ? <Loader2 className="w-5 h-5 animate-spin" /> : <UserPlus className="w-5 h-5" />}
                                        Crear Usuario
                                    </button>
                                </div>
                            </form>
                        </motion.div>
                    </motion.div>
                )}
            </AnimatePresence>
        </div>
    );
}
