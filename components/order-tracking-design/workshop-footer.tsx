"use client"

import { MapPin, MessageCircle, Navigation, Phone } from "lucide-react"
import { Button } from "@/components/ui/button"

export function WorkshopFooter() {
    return (
        <footer className="px-4 pt-2 pb-8">
            <div className="rounded-2xl border border-border bg-card p-4">
                <div className="flex items-center gap-3 mb-4">
                    <div className="flex h-11 w-11 items-center justify-center rounded-xl bg-secondary text-foreground font-bold text-sm">JR</div>
                    <div className="flex-1 min-w-0">
                        <h3 className="text-sm font-semibold text-foreground">Electromecanica JR</h3>
                        <p className="text-xs text-muted-foreground flex items-center gap-1 mt-0.5">
                            <MapPin className="h-3 w-3 shrink-0" />
                            <span className="truncate">Av. San Martin 1250, Puerto Montt</span>
                        </p>
                    </div>
                </div>
                <div className="flex items-center gap-2 mb-4 px-1">
                    <Phone className="h-3.5 w-3.5 text-muted-foreground" />
                    <span className="text-xs text-muted-foreground">+56 9 1234 5678</span>
                    <span className="text-xs text-muted-foreground/40 mx-1">|</span>
                    <span className="text-xs text-muted-foreground">Lun-Sab 8:00-18:00</span>
                </div>
                <div className="flex gap-3">
                    <Button className="flex-1 h-12 rounded-xl text-sm font-semibold" style={{ backgroundColor: "#25D366", color: "#ffffff" }} asChild>
                        <a href="https://wa.me/56912345678?text=Hola%2C%20consulto%20por%20la%20orden%20%231042" target="_blank" rel="noopener noreferrer">
                            <MessageCircle className="h-4 w-4" /> WhatsApp
                        </a>
                    </Button>
                    <Button className="flex-1 h-12 rounded-xl text-sm font-semibold" style={{ backgroundColor: "#33CCFF", color: "#000000" }} asChild>
                        <a href="https://waze.com/ul?ll=-33.0,-71.0&navigate=yes" target="_blank" rel="noopener noreferrer">
                            <Navigation className="h-4 w-4" /> Ir con Waze
                        </a>
                    </Button>
                </div>
            </div>
            <p className="text-center text-xs text-muted-foreground/50 mt-6">
                Seguimiento potenciado por <span className="font-semibold text-muted-foreground/70">flusize</span>
            </p>
        </footer>
    )
}
