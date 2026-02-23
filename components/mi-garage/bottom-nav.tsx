"use client"

import { useState } from "react"
import { Home, Car, BarChart3, Settings } from "lucide-react"

const navItems = [
    { icon: Home, label: "Inicio", id: "home" },
    { icon: Car, label: "Vehículos", id: "vehicles" },
    { icon: BarChart3, label: "Gastos", id: "expenses" },
    { icon: Settings, label: "Ajustes", id: "settings" },
]

export function BottomNav() {
    const [active, setActive] = useState("home")
    return (
        <nav className="fixed bottom-0 left-0 right-0 z-50 border-t border-border bg-card/80 backdrop-blur-xl md:hidden" aria-label="Navegación principal">
            <div className="flex items-center justify-around px-2 py-2">
                {navItems.map((item) => (
                    <button key={item.id} onClick={() => setActive(item.id)}
                        className={`relative flex flex-col items-center gap-0.5 rounded-lg px-3 py-1.5 transition-colors ${active === item.id ? "text-primary" : "text-muted-foreground hover:text-foreground"}`}
                        aria-label={item.label} aria-current={active === item.id ? "page" : undefined}
                    >
                        <item.icon className="h-5 w-5" />
                        <span className="text-[10px] font-medium">{item.label}</span>
                        {active === item.id && <span className="absolute -top-px left-1/2 h-0.5 w-6 -translate-x-1/2 rounded-full bg-primary" />}
                    </button>
                ))}
            </div>
        </nav>
    )
}
