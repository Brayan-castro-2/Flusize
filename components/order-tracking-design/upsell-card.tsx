"use client"

import { Button } from "@/components/ui/button"
import { Sparkles, ArrowRight } from "lucide-react"

export function UpsellCard() {
    return (
        <section className="px-4 py-2">
            <div className="relative overflow-hidden rounded-2xl border border-primary/20 bg-primary/5 p-5">
                <div className="absolute -right-6 -top-6 h-24 w-24 rounded-full bg-primary/10 blur-2xl" />
                <div className="absolute -bottom-4 -left-4 h-16 w-16 rounded-full bg-accent/10 blur-2xl" />
                <div className="relative">
                    <div className="flex items-center gap-2 mb-2">
                        <div className="flex h-8 w-8 items-center justify-center rounded-lg bg-primary/15">
                            <Sparkles className="h-4 w-4 text-primary" />
                        </div>
                        <span className="text-xs font-semibold uppercase tracking-wider text-primary">Recomendado</span>
                    </div>
                    <h3 className="text-base font-bold text-foreground leading-snug mt-3">No pierdas tu historial.</h3>
                    <p className="text-sm text-muted-foreground mt-1 leading-relaxed">
                        Crea tu cuenta Flusize para ver tus gastos, historial de reparaciones y recordatorios de mantenimiento.
                    </p>
                    <Button className="mt-4 h-11 w-full rounded-xl bg-primary text-primary-foreground hover:bg-primary/90 text-sm font-semibold">
                        Crear cuenta gratis <ArrowRight className="h-4 w-4" />
                    </Button>
                </div>
            </div>
        </section>
    )
}
