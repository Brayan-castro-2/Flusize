"use client"

import { Card, CardContent, CardHeader, CardTitle } from "@/components/ui/card"
import { ScrollArea } from "@/components/ui/scroll-area"
import {
  UserPlus,
  FileText,
  AlertTriangle,
  CreditCard,
  Car,
  Store,
  CheckCircle2,
} from "lucide-react"
import { cn } from "@/lib/utils"

interface ActivityItem {
  id: string
  type: "user" | "invoice" | "alert" | "payment" | "vehicle" | "workshop" | "order"
  message: string
  time: string
  location?: string
}

const activities: ActivityItem[] = [
  {
    id: "1",
    type: "user",
    message: "Nuevo usuario registrado",
    time: "Hace 2 min",
    location: "Puerto Montt",
  },
  {
    id: "2",
    type: "invoice",
    message: "Electromecanica JR emitio una factura por $245.000",
    time: "Hace 5 min",
  },
  {
    id: "3",
    type: "alert",
    message: "AutoFix Puerto Montt no ha ingresado en 7 dias",
    time: "Hace 12 min",
  },
  {
    id: "4",
    type: "payment",
    message: "Pago de suscripcion recibido de Taller Automotriz Sur",
    time: "Hace 18 min",
  },
  {
    id: "5",
    type: "vehicle",
    message: "Nuevo vehiculo registrado: Toyota Hilux 2022",
    time: "Hace 25 min",
  },
  {
    id: "6",
    type: "order",
    message: "Orden #4521 completada en Mecanica Express",
    time: "Hace 32 min",
  },
  {
    id: "7",
    type: "workshop",
    message: "Taller Don Pedro actualizo su plan a Pro",
    time: "Hace 45 min",
  },
  {
    id: "8",
    type: "user",
    message: "Nuevo usuario registrado",
    time: "Hace 1 hr",
    location: "Santiago",
  },
  {
    id: "9",
    type: "invoice",
    message: "Servicio Integral Los Andes emitio una factura por $580.000",
    time: "Hace 1 hr",
  },
  {
    id: "10",
    type: "payment",
    message: "Pago de suscripcion recibido de Electromecanica JR",
    time: "Hace 2 hr",
  },
]

const iconMap: Record<string, { icon: React.ElementType; className: string }> = {
  user: { icon: UserPlus, className: "bg-primary/10 text-primary" },
  invoice: { icon: FileText, className: "bg-accent/10 text-accent" },
  alert: { icon: AlertTriangle, className: "bg-amber-500/10 text-amber-400" },
  payment: { icon: CreditCard, className: "bg-emerald-500/10 text-emerald-400" },
  vehicle: { icon: Car, className: "bg-primary/10 text-primary" },
  workshop: { icon: Store, className: "bg-accent/10 text-accent" },
  order: { icon: CheckCircle2, className: "bg-emerald-500/10 text-emerald-400" },
}

export function ActivityFeed() {
  return (
    <Card className="border-border bg-card">
      <CardHeader className="pb-3">
        <div className="flex items-center justify-between">
          <CardTitle className="text-base font-semibold text-foreground">
            Actividad en Tiempo Real
          </CardTitle>
          <div className="flex items-center gap-1.5">
            <span className="relative flex h-2 w-2">
              <span className="absolute inline-flex h-full w-full animate-ping rounded-full bg-emerald-400 opacity-75" />
              <span className="relative inline-flex h-2 w-2 rounded-full bg-emerald-500" />
            </span>
            <span className="text-xs text-emerald-400">En vivo</span>
          </div>
        </div>
      </CardHeader>
      <CardContent className="px-0 pb-0">
        <ScrollArea className="h-[400px]">
          <div className="flex flex-col">
            {activities.map((activity, index) => {
              const { icon: Icon, className: iconClassName } = iconMap[activity.type]
              return (
                <div
                  key={activity.id}
                  className={cn(
                    "flex items-start gap-3 px-6 py-3 transition-colors hover:bg-secondary/50",
                    index !== activities.length - 1 && "border-b border-border/50"
                  )}
                >
                  <div
                    className={cn(
                      "mt-0.5 flex h-7 w-7 shrink-0 items-center justify-center rounded-full",
                      iconClassName
                    )}
                  >
                    <Icon className="h-3.5 w-3.5" />
                  </div>
                  <div className="flex min-w-0 flex-1 flex-col gap-0.5">
                    <p className="text-sm text-foreground leading-snug">
                      {activity.message}
                      {activity.location && (
                        <span className="text-muted-foreground">
                          {" "}en {activity.location}
                        </span>
                      )}
                    </p>
                    <span className="text-[11px] text-muted-foreground">
                      {activity.time}
                    </span>
                  </div>
                </div>
              )
            })}
          </div>
        </ScrollArea>
      </CardContent>
    </Card>
  )
}
