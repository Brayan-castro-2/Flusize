'use client';

import { useTransition, useState, useEffect } from 'react';
import Link from 'next/link';
import { usePathname, useRouter } from 'next/navigation';
import { useAuth } from '@/contexts/auth-context';
import { cn } from '@/lib/utils';
import {
    ClipboardList,
    LayoutDashboard,
    Users,
    FileText,
    Calendar,
    X,
    Settings,
} from 'lucide-react';
import { NewBadge } from '@/components/ui/new-badge';
import { FEATURE_FLAGS } from '@/config/modules';

interface NavItem {
    href: string;
    label: string;
    icon: React.ReactNode;
    roles: ('taller_admin' | 'mecanico' | 'superadmin' | 'admin')[];
    showBadge?: boolean;
    /** Si está definido, el item solo se muestra si ese módulo está activo en el taller */
    module?: 'agenda' | 'tracking' | 'inventario' | 'checklist' | 'fiscal';
}

const navItems: NavItem[] = [
    {
        href: '/recepcion',
        label: 'Recepción',
        icon: <ClipboardList className="w-5 h-5" />,
        roles: ['mecanico', 'taller_admin', 'superadmin', 'admin'],
    },
    {
        href: '/admin',
        label: 'Dashboard',
        icon: <LayoutDashboard className="w-5 h-5" />,
        // FASE 27: Solo el superadmin (Dueño del taller) puede ver las métricas financieras
        roles: ['superadmin'],
    },
    {
        href: '/admin/ordenes',
        label: 'Órdenes',
        icon: <FileText className="w-5 h-5" />,
        roles: ['taller_admin', 'superadmin', 'mecanico', 'admin'],
    },
    {
        href: '/admin/agenda',
        label: 'Agenda',
        icon: <Calendar className="w-5 h-5" />,
        roles: ['taller_admin', 'superadmin', 'admin'],
        showBadge: true,
        module: 'agenda',
    },
    {
        href: '/admin/usuarios',
        label: 'Usuarios',
        icon: <Users className="w-5 h-5" />,
        roles: ['taller_admin', 'superadmin', 'admin'],
    },
    {
        href: '/admin/clientes',
        label: 'Gestión Clientes',
        icon: <Users className="w-5 h-5" />,
        roles: ['taller_admin', 'superadmin', 'admin'],
        showBadge: false,
    },
    {
        href: '/admin/perfil',
        label: 'Perfil Taller',
        icon: <Settings className="w-5 h-5" />,
        roles: ['superadmin', 'taller_admin'],
    },
];

export function Sidebar() {
    const { user, isLoading } = useAuth();
    const pathname = usePathname();
    const router = useRouter();
    const [isPending, startTransition] = useTransition();
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

    const filteredItems = navItems.filter(item => {
        if (!user) return false;

        // 1. FASE 75: Bloqueo de Plan Gratis
        // Si el plan es Gratis, solo puede ver Perfil Taller
        if (user.plan === 'Gratis' && item.href !== '/admin/perfil' && item.href !== '/recepcion') {
            // Permitimos recepción solo si tiene permisos legacy, pero el prompt dice 
            // "Perfil del Taller sea el único accesible por defecto para el estado Gratis"
            // Por seguridad, bloqueamos todo excepto Perfil Taller.
            if (item.href !== '/admin/perfil') return false;
        }

        // 2. Verificar rol
        if (!item.roles.includes(user.role as any)) return false;

        // 3. Verificar módulo activo en el taller (si aplica)
        if (item.module && user.modulos) {
            return user.modulos[item.module] === true;
        }
        return true;
    });

    const handleNavigation = (e: React.MouseEvent<HTMLAnchorElement>, href: string) => {
        e.preventDefault();
        setDrawerOpen(false);
        startTransition(() => {
            router.push(href);
        });
    };

    return (
        <>
            {/* ── Desktop Sidebar ─────────────────────────────────── */}
            <aside className="hidden md:flex fixed left-0 top-20 bottom-0 w-64 bg-white border-r border-gray-200 flex-col shadow-lg z-40">
                {isPending && (
                    <div className="absolute top-0 left-0 right-0 h-1 bg-blue-100 overflow-hidden">
                        <div className="h-full bg-blue-600 animate-[loading_1s_ease-in-out_infinite]"></div>
                    </div>
                )}
                <nav className="flex-1 p-4 space-y-1">
                    {isLoading ? (
                        // Skeletons de Carga
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
                                    onClick={(e) => handleNavigation(e, item.href)}
                                    className={cn(
                                        "flex items-center gap-3 px-4 py-3 rounded-xl transition-all duration-150",
                                        isActive
                                            ? "bg-gradient-to-r from-cyan-500 to-blue-600 text-white shadow-lg shadow-blue-500/30"
                                            : "text-gray-600 hover:bg-blue-50 hover:text-blue-600",
                                        isPending && "opacity-70 pointer-events-none"
                                    )}
                                >
                                    {item.icon}
                                    <span className="font-medium">{item.label}</span>
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
                        <img src="/logo_flusize.png" alt="Flusize" className="w-8 h-8 object-contain bg-white rounded-lg p-1" />
                        <span className="font-extrabold text-xl tracking-wide text-white">FLUSIZE</span>
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
                        <p className="text-xs text-gray-400 capitalize">{user.role}</p>
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
                                    onClick={(e) => handleNavigation(e, item.href)}
                                    className={cn(
                                        "flex items-center gap-4 px-4 py-3.5 rounded-xl transition-all duration-150",
                                        isActive
                                            ? "bg-gradient-to-r from-cyan-500 to-blue-600 text-white shadow-lg shadow-blue-500/30"
                                            : "text-gray-400 hover:bg-white/10 hover:text-white",
                                        isPending && "opacity-70 pointer-events-none"
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
