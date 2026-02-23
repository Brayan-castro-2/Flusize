"use client"

import { Camera, ChevronRight, ClipboardList, FileText } from "lucide-react"
import { Button } from "@/components/ui/button"

export function LiveActionCard() {
  return (
    <section className="px-4 py-2">
      <div className="rounded-2xl border border-border bg-card p-4">
        <div className="flex items-center gap-3 mb-4">
          <div className="flex h-10 w-10 items-center justify-center rounded-xl bg-accent/10 text-accent">
            <ClipboardList className="h-5 w-5" />
          </div>
          <div>
            <h3 className="text-sm font-semibold text-foreground">Checklist de Ingreso</h3>
            <p className="text-xs text-muted-foreground">Se registraron 12 puntos de inspeccion</p>
          </div>
        </div>

        <div className="flex gap-3">
          <Button
            className="flex-1 h-11 rounded-xl bg-primary text-primary-foreground hover:bg-primary/90 text-sm font-medium"
          >
            <Camera className="h-4 w-4" />
            Ver Fotos
          </Button>
          <Button
            variant="outline"
            className="flex-1 h-11 rounded-xl border-border bg-secondary text-foreground hover:bg-secondary/80 text-sm font-medium"
          >
            <FileText className="h-4 w-4" />
            Detalle
            <ChevronRight className="h-3.5 w-3.5 text-muted-foreground" />
          </Button>
        </div>
      </div>
    </section>
  )
}
