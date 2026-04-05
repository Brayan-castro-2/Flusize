'use client';

import { useState, useEffect } from 'react';
import Link from 'next/link';
import { usePathname, useRouter } from 'next/navigation';
import { useAuth } from '@/contexts/auth-context';
import { cn } from '@/lib/utils';
import { normalizePlan, planCanAccess } from '@/lib/plan-config';
import {
    ClipboardList,
    LayoutDashboard,
    Users,
    FileText,
    Calendar,
    X,
    Settings,
    Car,
    FileSignature,
} from 'lucide-react';
import { NewBadge } from '@/components/ui/new-badge';
import { FEATURE_FLAGS } from '@/config/modules';

interface NavItem {
    href: string;
    label: string;
    icon: React.ReactNode;
    permissions?: string[];
    roles?: ('taller_admin' | 'mecanico' | 'superadmin' | 'admin' | 'vendedor')[];
    showBadge?: boolean;
    module?: 'agenda' | 'tracking' | 'inventario' | 'checklist' | 'fiscal' | 'clientes' | 'cotizaciones' | 'analytics' | 'public_profile' | 'flota' | 'contratos';
}

const navItems: NavItem[] = [
    {
        href: '/recepcion',
        label: 'Recepción',
        icon: <ClipboardList className="w-5 h-5" />,
        // Recepción usualmente es abierta para mecánicos, pero si tienen acceso a órdenes la usan.
        roles: ['mecanico', 'vendedor', 'taller_admin', 'superadmin', 'admin'],
    },
    {
        href: '/admin',
        label: 'Dashboard',
        icon: <LayoutDashboard className="w-5 h-5" />,
        permissions: ['financials.view_totals'],
        roles: ['taller_admin', 'superadmin', 'admin'],
    },
    {
        href: '/admin/ordenes',
        label: 'Órdenes',
        icon: <FileText className="w-5 h-5" />,
        permissions: ['ordenes.ver_todas', 'ordenes.editar', 'ordenes.crear'],
        roles: ['taller_admin', 'superadmin', 'mecanico', 'vendedor', 'admin'],
    },
    {
        href: '/admin/agenda',
        label: 'Agenda',
        icon: <Calendar className="w-5 h-5" />,
        roles: ['taller_admin', 'vendedor', 'superadmin', 'admin'], // Agenda para adm y vend
        module: 'agenda',
    },
    {
        href: '/admin/usuarios',
        label: 'Usuarios',
        icon: <Users className="w-5 h-5" />,
        permissions: ['usuarios.ver', 'usuarios.crear', 'usuarios.editar', 'roles.crear'],
        roles: ['taller_admin', 'superadmin', 'admin'],
    },
    {
        href: '/admin/clientes',
        label: 'Gestión Clientes',
        icon: <Users className="w-5 h-5" />,
        permissions: ['clientes.ver', 'clientes.editar'],
        roles: ['taller_admin', 'vendedor', 'superadmin', 'admin'],
        showBadge: false,
    },
    {
        href: '/admin/inventario',
        label: 'Inventario',
        icon: <FileText className="w-5 h-5" />,
        permissions: ['inventario.ver'],
        roles: ['taller_admin', 'vendedor', 'mecanico', 'superadmin', 'admin'],
        showBadge: true,
        module: 'inventario',
    },
    {
        href: '/admin/perfil',
        label: 'Perfil Taller',
        icon: <Settings className="w-5 h-5" />,
        permissions: ['perfil.editar'],
        roles: ['superadmin', 'taller_admin'],
    },
    {
        href: '/admin/flota',
        label: 'Gestión de Flota',
        icon: <Car className="w-5 h-5" />,
        roles: ['taller_admin', 'vendedor', 'mecanico', 'superadmin', 'admin'],
        module: 'flota',
        showBadge: true,
    },
    {
        href: '/admin/contratos',
        label: 'Contratos Digitales',
        icon: <FileSignature className="w-5 h-5" />,
        roles: ['taller_admin', 'superadmin', 'admin'],
    },
];

export function Sidebar() {
    const { user, isLoading, hasPermission } = useAuth();
    const pathname = usePathname();
    const router = useRouter();
    const [drawerOpen, setDrawerOpen] = useState(false);

    // Listen for toggle events dispatched by the Header hamburger button
    useEffect(() => {
        const handler = () => setDrawerOpen(prev => !prev);
        window.addEventListener('toggle-mobile-nav', handler);
        return () => window.removeEventListener('toggle-mobile-nav', handler);
    }, []);

    // Close drawer on route change
    useEffect(() => {
        setDrawerOpen(false);
    }, [pathname]);

    if (!user && !isLoading) return null;

    // ── CONFIGURACIÓN DE MENÚS DINÁMICOS ───────────────────────────
    
    // Módulos base
    const itemRecepcion = navItems.find(i => i.href === '/recepcion')!;
    const itemDashboard = navItems.find(i => i.href === '/admin')!;
    const itemOrdenes = navItems.find(i => i.href === '/admin/ordenes')!;
    const itemAgenda = navItems.find(i => i.href === '/admin/agenda')!;
    const itemClientes = navItems.find(i => i.href === '/admin/clientes')!;
    const itemInventario = navItems.find(i => i.href === '/admin/inventario')!;
    const itemPerfil = navItems.find(i => i.href === '/admin/perfil')!;
    const itemFlota = navItems.find(i => i.href === '/admin/flota')!;
    const itemContratos = navItems.find(i => i.href === '/admin/contratos')!;
    const itemUsuarios = navItems.find(i => i.href === '/admin/usuarios')!;

    // Perfil Clásico: Enfoque en Taller
    const menuClasico = [
        itemRecepcion,
        itemOrdenes,
        itemDashboard,
        itemAgenda,
        itemClientes,
        itemInventario,
        itemPerfil
    ];

    // Perfil Corporativo: Enfoque en Flota (RentMontt)
    const menuCorporativo = [
        itemFlota,
        itemContratos,
        itemInventario,
        itemDashboard,
        itemClientes,
        itemUsuarios,
        itemRecepcion,
        itemOrdenes,
        itemAgenda,
        itemPerfil
    ];

    const currentMenu = user?.modulos?.flota ? menuCorporativo : menuClasico;

    const filteredItems = currentMenu.filter(item => {
        if (!user || !item) return false;

        // 1. Verificar rol/permisos (RBAC con fallback legacy)
        let hasAccess = false;
        if (item.permissions && item.permissions.length > 0) {
            hasAccess = item.permissions.some(perm => hasPermission(perm));
            if (!hasAccess && item.roles && item.roles.includes(user.role as any)) {
                hasAccess = true;
            }
        } else if (item.roles && item.roles.includes(user.role as any)) {
            hasAccess = true;
        }

        if (!hasAccess) return false;

        // 2. Verificar Módulos A La Carta (GodMode) / Plan Comercial
        if (item.module) {
            const isModuleActive = (user.modulos as any)?.[item.module];
            if (isModuleActive === false) return false;
            if (isModuleActive === true) return true;
        }

        // 3. Fallback: Plan Comercial
        const planStr = normalizePlan(user.plan);
        if (!planCanAccess(planStr, item.href)) return false;

        return true;
    });

    return (
        <>
            {/* ── Desktop Sidebar ─────────────────────────────────── */}
            <aside className="hidden md:flex fixed left-0 top-20 bottom-0 w-64 bg-white border-r border-gray-200 flex-col shadow-lg z-40">
                <nav className="flex-1 p-4 space-y-1 overflow-y-auto custom-scrollbar">
                    {isLoading ? (
                        Array.from({ length: 6 }).map((_, i) => (
                            <div key={i} className="flex items-center gap-3 px-4 py-3 rounded-xl animate-pulse">
                                <div className="w-5 h-5 bg-gray-200 rounded-md" />
                                <div className="h-4 bg-gray-200 rounded-md w-32" />
                            </div>
                        ))
                    ) : (
                        filteredItems.map((item) => {
                            const isActive = pathname === item.href ||
                                (item.href !== '/admin' && item.href !== '/recepcion' && pathname.startsWith(item.href));

                            return (
                                <Link
                                    key={item.href}
                                    href={item.href}
                                    onClick={() => setDrawerOpen(false)}
                                    className={cn(
                                        "flex items-center gap-3 px-4 py-3 rounded-xl transition-all duration-150",
                                        isActive
                                            ? "bg-gradient-to-r from-cyan-500 to-blue-600 text-white shadow-lg shadow-blue-500/30"
                                            : "text-gray-600 hover:bg-blue-50 hover:text-blue-600"
                                    )}
                                >
                                    {item.icon}
                                    <span className="font-medium">{item.label}</span>
                                    {item.showBadge && <NewBadge />}
                                </Link>
                            );
                        })
                    )}
                </nav>

                {/* Footer */}
                <div className="p-4 border-t border-gray-200">
                    <div className="px-4 py-3 rounded-xl bg-gradient-to-br from-blue-50 to-cyan-50 border border-blue-100">
                        <p className="text-xs text-gray-500 uppercase tracking-wider">Versión</p>
                        <p className="text-sm text-gray-700 font-medium">2.0</p>
                    </div>
                </div>
            </aside>

            {/* ── Mobile Drawer ────────────────────────────────────── */}
            {/* Overlay backdrop */}
            <div
                className={cn(
                    "md:hidden fixed inset-0 z-[60] bg-black/60 backdrop-blur-sm transition-opacity duration-300",
                    drawerOpen ? "opacity-100 pointer-events-auto" : "opacity-0 pointer-events-none"
                )}
                onClick={() => setDrawerOpen(false)}
                aria-hidden="true"
            />

            {/* Drawer panel */}
            <div
                className={cn(
                    "md:hidden fixed top-0 left-0 bottom-0 z-[70] w-72 bg-[#0a0a0a] border-r border-[#222] shadow-2xl flex flex-col transition-transform duration-300 ease-in-out",
                    drawerOpen ? "translate-x-0" : "-translate-x-full"
                )}
            >
                {/* Drawer header */}
                <div className="flex items-center justify-between px-5 py-5 border-b border-[#222]">
                    <div className="flex items-center gap-2">
                        <img src="/logo-celular.png" alt="Flusize" className="w-10 h-auto object-contain" />
                    </div>
                    <button
                        onClick={() => setDrawerOpen(false)}
                        className="w-9 h-9 flex items-center justify-center rounded-full bg-white/10 text-white hover:bg-white/20 transition-colors"
                        aria-label="Cerrar menú"
                    >
                        <X className="w-5 h-5" />
                    </button>
                </div>

                {/* User info */}
                {user && (
                    <div className="px-5 py-4 border-b border-[#222]">
                        <p className="text-sm font-semibold text-white">{user.name}</p>
                        <p className={cn(
                            "text-[10px] font-black uppercase tracking-widest mt-0.5",
                            (user.role === 'admin' || user.role === 'taller_admin' || user.role === 'superadmin') ? "text-emerald-400" :
                            user.role === 'vendedor' ? "text-amber-500" : "text-blue-400"
                        )}>
                            {user.role}
                        </p>
                    </div>
                )}

                {/* Nav links */}
                <nav className="flex-1 p-4 space-y-1 overflow-y-auto">
                    {isLoading ? (
                        Array.from({ length: 6 }).map((_, i) => (
                            <div key={i} className="flex items-center gap-4 px-4 py-3.5 rounded-xl animate-pulse">
                                <div className="w-5 h-5 bg-white/10 rounded-md" />
                                <div className="h-4 bg-white/10 rounded-md w-32" />
                            </div>
                        ))
                    ) : (
                        filteredItems.map((item) => {
                            const isActive = pathname === item.href ||
                                (item.href !== '/admin' && item.href !== '/recepcion' && pathname.startsWith(item.href));

                            return (
                                <Link
                                    key={item.href}
                                    href={item.href}
                                    onClick={() => setDrawerOpen(false)}
                                    className={cn(
                                        "flex items-center gap-4 px-4 py-3.5 rounded-xl transition-all duration-150",
                                        isActive
                                            ? "bg-gradient-to-r from-cyan-500 to-blue-600 text-white shadow-lg shadow-blue-500/30"
                                            : "text-gray-400 hover:bg-white/10 hover:text-white"
                                    )}
                                >
                                    {item.icon}
                                    <span className="font-medium text-sm">{item.label}</span>
                                    {item.showBadge && <NewBadge />}
                                </Link>
                            );
                        })
                    )}
                </nav>

                {/* Drawer footer */}
                <div className="p-4 border-t border-[#222]">
                    <p className="text-xs text-gray-600 text-center">Flusize v2.0</p>
                </div>
            </div>
        </>
    );
}
