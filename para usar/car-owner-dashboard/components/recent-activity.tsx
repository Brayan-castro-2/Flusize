"use client"

import { ChevronRight, Wrench, Fuel, Shield, Settings } from "lucide-react"
import { Card, CardContent, CardHeader, CardTitle } from "@/components/ui/card"

const activities = [
  {
    id: 1,
    icon: Wrench,
    title: "Cambio de Aceite",
    description: "Taller JR - Toyota Yaris",
    amount: "$45.000",
    date: "12 Feb 2026",
    color: "#3b82f6",
    bg: "rgba(59, 130, 246, 0.1)",
  },
  {
    id: 2,
    icon: Fuel,
    title: "Carga Copec",
    description: "Estación Av. Providencia",
    amount: "$20.000",
    date: "10 Feb 2026",
    color: "#22c55e",
    bg: "rgba(34, 197, 94, 0.1)",
  },
  {
    id: 3,
    icon: Shield,
    title: "Seguro Automotriz",
    description: "Pago mensual - HDI Seguros",
    amount: "$32.500",
    date: "05 Feb 2026",
    color: "#22d3ee",
    bg: "rgba(34, 211, 238, 0.1)",
  },
  {
    id: 4,
    icon: Settings,
    title: "Rotación de Neumáticos",
    description: "Taller JR - Mazda BT-50",
    amount: "$18.000",
    date: "01 Feb 2026",
    color: "#f59e0b",
    bg: "rgba(245, 158, 11, 0.1)",
  },
]

export function RecentActivity() {
  return (
    <section className="px-4 md:px-6" aria-labelledby="activity-title">
      <Card className="border-border bg-card">
        <CardHeader className="pb-3">
          <div className="flex items-center justify-between">
            <CardTitle className="text-lg font-semibold text-foreground" id="activity-title">
              Actividad Reciente
            </CardTitle>
            <button className="flex items-center gap-1 text-sm text-primary hover:text-primary/80 transition-colors">
              Ver todo
              <ChevronRight className="h-4 w-4" />
            </button>
          </div>
        </CardHeader>
        <CardContent className="p-0">
          <div className="divide-y divide-border">
            {activities.map((activity) => (
              <div
                key={activity.id}
                className="flex items-center gap-3 px-6 py-3.5 transition-colors hover:bg-secondary/50"
              >
                <div
                  className="flex h-10 w-10 flex-shrink-0 items-center justify-center rounded-lg"
                  style={{ backgroundColor: activity.bg }}
                >
                  <activity.icon className="h-5 w-5" style={{ color: activity.color }} />
                </div>
                <div className="flex-1 min-w-0">
                  <p className="text-sm font-medium text-foreground truncate">{activity.title}</p>
                  <p className="text-xs text-muted-foreground truncate">
                    {activity.description}
                  </p>
                </div>
                <div className="text-right flex-shrink-0">
                  <p className="text-sm font-semibold text-foreground">{activity.amount}</p>
                  <p className="text-xs text-muted-foreground">{activity.date}</p>
                </div>
              </div>
            ))}
          </div>
        </CardContent>
      </Card>
    </section>
  )
}
