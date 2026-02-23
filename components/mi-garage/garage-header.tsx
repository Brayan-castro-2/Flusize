"use client"

import { Bell, Search, User } from "lucide-react"
import { Button } from "@/components/ui/button"

export function GarageHeader() {
    return (
        <header className="flex items-center justify-between px-4 py-4 md:px-6">
            <div>
                <p className="text-sm text-muted-foreground">Hola, bienvenido</p>
                <h1 className="text-xl font-bold text-foreground">Mi Perfil</h1>
            </div>
            <div className="flex items-center gap-2">
                <Button variant="ghost" size="icon" className="rounded-full text-muted-foreground hover:text-foreground hover:bg-secondary" aria-label="Buscar">
                    <Search className="h-5 w-5" />
                </Button>
                <Button variant="ghost" size="icon" className="relative rounded-full text-muted-foreground hover:text-foreground hover:bg-secondary" aria-label="Notificaciones">
                    <Bell className="h-5 w-5" />
                    <span className="absolute right-1.5 top-1.5 h-2 w-2 rounded-full bg-primary" />
                </Button>
                <Button variant="ghost" size="icon" className="rounded-full bg-secondary text-foreground hover:bg-secondary/80" aria-label="Perfil">
                    <User className="h-5 w-5" />
                </Button>
            </div>
        </header>
    )
}
