"use client"

import { cn } from "@/lib/utils"
import {
    LayoutDashboard,
    Store,
    Car,
    Users,
    CreditCard,
    Settings,
    BarChart3,
    Bell,
    Shield,
    ChevronLeft,
    ChevronRight,
} from "lucide-react"
import { useState } from "react"
import { Button } from "@/components/ui/button"

const navItems = [
    { label: "Dashboard", icon: LayoutDashboard, active: true },
    { label: "Talleres", icon: Store },
    { label: "Vehículos", icon: Car },
    { label: "Usuarios", icon: Users },
    { label: "Facturación", icon: CreditCard },
    { label: "Reportes", icon: BarChart3 },
    { label: "Alertas", icon: Bell },
]

const bottomItems = [
    { label: "Seguridad", icon: Shield },
    { label: "Configuración", icon: Settings },
]

export function SuperAdminSidebar() {
    const [collapsed, setCollapsed] = useState(false)

    return (
        <aside
            className={cn(
                "flex h-screen flex-col border-r border-border bg-sidebar transition-all duration-300",
                collapsed ? "w-16" : "w-64"
            )}
        >
            {/* Logo */}
            <div className="flex h-16 items-center border-b border-border px-4">
                <div className="flex items-center gap-3">
                    <div className="flex h-8 w-8 shrink-0 items-center justify-center rounded-lg bg-primary">
                        <span className="text-sm font-bold text-primary-foreground">F</span>
                    </div>
                    {!collapsed && (
                        <div className="flex flex-col">
                            <span className="text-sm font-semibold text-foreground tracking-tight">Flusize</span>
                            <span className="text-[10px] font-medium text-muted-foreground uppercase tracking-widest">Super Admin</span>
                        </div>
                    )}
                </div>
            </div>

            {/* Nav Items */}
            <div className="flex-1 overflow-y-auto px-3 py-4">
                <nav className="flex flex-col gap-1">
                    {navItems.map((item) => (
                        <button
                            key={item.label}
                            className={cn(
                                "flex items-center gap-3 rounded-md px-3 py-2 text-sm font-medium transition-colors",
                                item.active
                                    ? "bg-primary/10 text-primary"
                                    : "text-muted-foreground hover:bg-secondary hover:text-foreground"
                            )}
                        >
                            <item.icon className="h-4 w-4 shrink-0" />
                            {!collapsed && <span>{item.label}</span>}
                        </button>
                    ))}
                </nav>
            </div>

            {/* Bottom Items */}
            <div className="border-t border-border px-3 py-3">
                <nav className="flex flex-col gap-1">
                    {bottomItems.map((item) => (
                        <button
                            key={item.label}
                            className="flex items-center gap-3 rounded-md px-3 py-2 text-sm font-medium text-muted-foreground transition-colors hover:bg-secondary hover:text-foreground"
                        >
                            <item.icon className="h-4 w-4 shrink-0" />
                            {!collapsed && <span>{item.label}</span>}
                        </button>
                    ))}
                </nav>

                <Button
                    variant="ghost"
                    size="sm"
                    className="mt-2 w-full justify-center text-muted-foreground"
                    onClick={() => setCollapsed(!collapsed)}
                >
                    {collapsed ? <ChevronRight className="h-4 w-4" /> : <ChevronLeft className="h-4 w-4" />}
                </Button>
            </div>
        </aside>
    )
}
