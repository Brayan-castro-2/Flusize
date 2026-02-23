"use client"

import { Card, CardContent, CardHeader, CardTitle } from "@/components/ui/card"
import { Badge } from "@/components/ui/badge"
import { Cpu, Zap, Gauge, Droplets, Weight, Cog } from "lucide-react"

const specs = [
  {
    icon: Cpu,
    label: "Motor",
    value: "1.5L DOHC",
    detail: "4 Cilindros en línea",
  },
  {
    icon: Zap,
    label: "Potencia",
    value: "107 HP",
    detail: "6.000 RPM",
  },
  {
    icon: Gauge,
    label: "Torque",
    value: "140 Nm",
    detail: "4.200 RPM",
  },
  {
    icon: Cog,
    label: "Transmisión",
    value: "CVT",
    detail: "Automática",
  },
  {
    icon: Droplets,
    label: "Rendimiento",
    value: "18.2 km/L",
    detail: "Mixto ciudad/ruta",
  },
  {
    icon: Weight,
    label: "Peso",
    value: "1.070 kg",
    detail: "Peso en vacío",
  },
]

export function VehicleTechSpecs() {
  return (
    <section className="px-4 md:px-6" aria-labelledby="tech-specs-title">
      <Card className="border-border bg-card overflow-hidden">
        <CardHeader className="pb-3">
          <div className="flex items-center justify-between">
            <div>
              <CardTitle className="text-lg font-semibold text-foreground" id="tech-specs-title">
                Ficha Técnica
              </CardTitle>
              <p className="text-xs text-muted-foreground mt-0.5">Toyota Yaris 2021</p>
            </div>
            <Badge className="bg-primary/10 text-primary border-primary/20 hover:bg-primary/10 font-mono text-xs">
              VIN: JTDKN3DU5M1234567
            </Badge>
          </div>
        </CardHeader>
        <CardContent>
          <div className="grid grid-cols-2 gap-3 md:grid-cols-3">
            {specs.map((spec) => (
              <div
                key={spec.label}
                className="group rounded-lg border border-border bg-secondary/30 p-3 transition-colors hover:border-primary/30"
              >
                <div className="flex items-center gap-2 mb-2">
                  <div className="flex h-7 w-7 items-center justify-center rounded-md bg-primary/10">
                    <spec.icon className="h-3.5 w-3.5 text-primary" />
                  </div>
                  <span className="text-xs text-muted-foreground">{spec.label}</span>
                </div>
                <p className="text-base font-bold text-foreground font-mono">{spec.value}</p>
                <p className="text-xs text-muted-foreground mt-0.5">{spec.detail}</p>
              </div>
            ))}
          </div>

          <div className="mt-4 rounded-lg border border-border bg-secondary/30 p-3">
            <div className="flex items-center justify-between mb-2">
              <span className="text-xs font-medium text-muted-foreground uppercase tracking-wider">
                Salud del Motor
              </span>
              <span className="text-xs font-bold text-emerald-400">Excelente</span>
            </div>
            <div className="flex gap-1">
              {Array.from({ length: 10 }).map((_, i) => (
                <div
                  key={i}
                  className={`h-2 flex-1 rounded-full ${
                    i < 8 ? "bg-emerald-500" : "bg-secondary"
                  }`}
                />
              ))}
            </div>
            <div className="flex items-center justify-between mt-2 text-xs text-muted-foreground">
              <span>Último diagnóstico: 12 Feb 2026</span>
              <span className="font-mono font-medium text-foreground">80/100</span>
            </div>
          </div>
        </CardContent>
      </Card>
    </section>
  )
}
