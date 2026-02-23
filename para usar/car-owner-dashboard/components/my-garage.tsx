"use client"

import { useState } from "react"
import { Car, ChevronRight, Fuel, Gauge, Calendar } from "lucide-react"
import { Badge } from "@/components/ui/badge"

const cars = [
  {
    id: 1,
    marca: "Toyota",
    modelo: "Yaris",
    anio: 2021,
    patente: "KKXZ-42",
    km: "38.200 km",
    combustible: 72,
    proximaRevision: "Mar 2026",
    color: "#3b82f6",
    estado: "Al día",
  },
  {
    id: 2,
    marca: "Mazda",
    modelo: "BT-50",
    anio: 2019,
    patente: "GRWL-18",
    km: "95.600 km",
    combustible: 45,
    proximaRevision: "Abr 2026",
    color: "#22d3ee",
    estado: "Revisión pronto",
  },
]

export function MyGarage() {
  const [activeId, setActiveId] = useState(1)

  return (
    <section className="px-4 md:px-6" aria-labelledby="garage-title">
      <div className="flex items-center justify-between mb-4">
        <h2 id="garage-title" className="text-lg font-semibold text-foreground">
          Mi Garage
        </h2>
        <button className="flex items-center gap-1 text-sm text-primary hover:text-primary/80 transition-colors">
          Ver todos
          <ChevronRight className="h-4 w-4" />
        </button>
      </div>
      <div className="flex gap-4 overflow-x-auto pb-2 scrollbar-hide snap-x snap-mandatory">
        {cars.map((car) => (
          <button
            key={car.id}
            onClick={() => setActiveId(car.id)}
            className={`flex-shrink-0 w-72 md:w-80 rounded-xl border p-4 transition-all snap-start text-left ${
              activeId === car.id
                ? "border-primary/50 bg-primary/5 shadow-lg shadow-primary/5"
                : "border-border bg-card hover:border-primary/30"
            }`}
          >
            <div className="flex items-start justify-between mb-3">
              <div>
                <p className="text-base font-semibold text-foreground">
                  {car.marca} {car.modelo}
                </p>
                <p className="text-sm text-muted-foreground">{car.anio}</p>
              </div>
              <Badge
                className={
                  car.estado === "Al día"
                    ? "bg-emerald-500/10 text-emerald-400 border-emerald-500/20 hover:bg-emerald-500/10"
                    : "bg-amber-500/10 text-amber-400 border-amber-500/20 hover:bg-amber-500/10"
                }
              >
                {car.estado}
              </Badge>
            </div>

            <div
              className="flex items-center justify-center rounded-lg p-4 mb-3"
              style={{ backgroundColor: `${car.color}10` }}
            >
              <Car className="h-10 w-10" style={{ color: car.color }} />
            </div>

            <div className="flex items-center justify-between text-xs text-muted-foreground">
              <div className="flex items-center gap-1">
                <Gauge className="h-3.5 w-3.5" />
                <span>{car.km}</span>
              </div>
              <div className="flex items-center gap-1">
                <Fuel className="h-3.5 w-3.5" />
                <span>{car.combustible}%</span>
              </div>
              <div className="flex items-center gap-1">
                <Calendar className="h-3.5 w-3.5" />
                <span>{car.proximaRevision}</span>
              </div>
            </div>

            <div className="mt-3">
              <div className="flex items-center justify-between text-xs mb-1">
                <span className="text-muted-foreground">Combustible</span>
                <span className="text-foreground font-medium">{car.combustible}%</span>
              </div>
              <div className="h-1.5 rounded-full bg-secondary overflow-hidden">
                <div
                  className="h-full rounded-full transition-all"
                  style={{
                    width: `${car.combustible}%`,
                    backgroundColor: car.combustible > 50 ? "#22c55e" : "#f59e0b",
                  }}
                />
              </div>
            </div>

            <p className="mt-3 text-xs font-mono text-muted-foreground tracking-wider">
              {car.patente}
            </p>
          </button>
        ))}
      </div>
    </section>
  )
}
