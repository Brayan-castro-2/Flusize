"use client"

import { Fuel, Truck, Wrench, FileText } from "lucide-react"

const actions = [
  {
    icon: Fuel,
    label: "Cargar Bencina",
    color: "#22c55e",
    bg: "rgba(34, 197, 94, 0.1)",
  },
  {
    icon: Truck,
    label: "Pedir Grúa",
    color: "#f59e0b",
    bg: "rgba(245, 158, 11, 0.1)",
  },
  {
    icon: Wrench,
    label: "Agendar Taller",
    color: "#3b82f6",
    bg: "rgba(59, 130, 246, 0.1)",
  },
  {
    icon: FileText,
    label: "Mis Documentos",
    color: "#22d3ee",
    bg: "rgba(34, 211, 238, 0.1)",
  },
]

export function QuickActions() {
  return (
    <section className="px-4 md:px-6" aria-labelledby="quick-actions-title">
      <h2 id="quick-actions-title" className="text-lg font-semibold text-foreground mb-4">
        Acciones Rápidas
      </h2>
      <div className="grid grid-cols-2 gap-3 md:grid-cols-4">
        {actions.map((action) => (
          <button
            key={action.label}
            className="group flex flex-col items-center gap-3 rounded-xl border border-border bg-card p-5 transition-all hover:border-primary/30 hover:shadow-lg hover:shadow-primary/5 active:scale-[0.97]"
          >
            <div
              className="flex h-12 w-12 items-center justify-center rounded-xl transition-transform group-hover:scale-110"
              style={{ backgroundColor: action.bg }}
            >
              <action.icon className="h-6 w-6" style={{ color: action.color }} />
            </div>
            <span className="text-sm font-medium text-foreground text-center leading-tight">
              {action.label}
            </span>
          </button>
        ))}
      </div>
    </section>
  )
}
