'use client';

import { useTransition } from 'react';
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
    Database
} from 'lucide-react';
import { NewBadge } from '@/components/ui/new-badge';
import { FEATURE_FLAGS } from '@/config/modules';

interface NavItem {
    href: string;
    label: string;
    icon: React.ReactNode;
    roles: ('taller_admin' | 'mecanico' | 'superadmin' | 'admin')[];
    showBadge?: boolean;
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
        roles: ['taller_admin', 'superadmin', 'admin'],
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
];

export function Sidebar() {
    const { user } = useAuth();
    const pathname = usePathname();
    const router = useRouter(); // Import needed
    const [isPending, startTransition] = useTransition(); // Import needed

    if (!user) return null;

    const filteredItems = navItems.filter(item => item.roles.includes(user.role as any));

    const handleNavigation = (e: React.MouseEvent<HTMLAnchorElement>, href: string) => {
        e.preventDefault();
        startTransition(() => {
            router.push(href);
        });
    };

    return (
        <>
            {/* Desktop Sidebar */}
            <aside className="hidden md:flex fixed left-0 top-20 bottom-0 w-64 bg-white border-r border-gray-200 flex-col shadow-lg z-40">
                {isPending && (
                    <div className="absolute top-0 left-0 right-0 h-1 bg-blue-100 overflow-hidden">
                        <div className="h-full bg-blue-600 animate-[loading_1s_ease-in-out_infinite]"></div>
                    </div>
                )}
                <nav className="flex-1 p-4 space-y-1">
                    {filteredItems.map((item) => {
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
                    })}
                </nav>

                {/* Footer */}
                <div className="p-4 border-t border-gray-200">
                    <div className="px-4 py-3 rounded-xl bg-gradient-to-br from-blue-50 to-cyan-50 border border-blue-100">
                        <p className="text-xs text-gray-500 uppercase tracking-wider">Versión</p>
                        <p className="text-sm text-gray-700 font-medium">2.0</p>
                    </div>
                </div>
            </aside>

            {/* Mobile Bottom Navigation - Para admin y superadmin */}
            {(user.role === 'taller_admin' || user.role === 'superadmin' || user.role === 'admin') && (
                <nav className="md:hidden fixed bottom-0 left-0 right-0 z-50 bg-[#0a0a0a]/95 backdrop-blur-lg border-t border-[#333333] safe-area-inset-bottom overflow-x-hidden">
                    {isPending && (
                        <div className="absolute top-0 left-0 right-0 h-[2px] bg-gray-800 overflow-hidden">
                            <div className="h-full bg-blue-500 animate-[loading_1s_ease-in-out_infinite]"></div>
                        </div>
                    )}
                    <div className="flex items-center justify-around py-2 px-1 w-full">
                        {filteredItems.map((item) => {
                            const isActive = pathname === item.href ||
                                (item.href !== '/admin' && item.href !== '/recepcion' && pathname.startsWith(item.href));

                            return (
                                <Link
                                    key={item.href}
                                    href={item.href}
                                    onClick={(e) => handleNavigation(e, item.href)}
                                    className={cn(
                                        "flex flex-col items-center justify-center py-1.5 px-1 rounded-xl transition-all duration-150 flex-1 max-w-[80px] touch-target",
                                        isActive
                                            ? "bg-[#0066FF] text-white shadow-lg shadow-[#0066FF]/30"
                                            : "text-gray-500 hover:text-gray-300 active:scale-95",
                                        isPending && "opacity-70 pointer-events-none"
                                    )}
                                >
                                    {item.icon}
                                    <span className={cn(
                                        "text-[9px] font-medium mt-0.5 hidden sm:block truncate w-full text-center",
                                        isActive ? "opacity-100" : "opacity-70"
                                    )}>
                                        {item.label}
                                    </span>
                                </Link>
                            );
                        })}
                    </div>
                </nav>
            )}
        </>
    );
}
