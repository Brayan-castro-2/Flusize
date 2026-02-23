import { Card, CardContent } from "@/components/ui/card"
import { Badge } from "@/components/ui/badge"
import {
  DollarSign,
  TrendingUp,
  Store,
  Car,
  ArrowUpRight,
  ArrowDownRight,
} from "lucide-react"
import { cn } from "@/lib/utils"

interface MetricCardProps {
  title: string
  value: string
  change: string
  changeType: "positive" | "negative"
  icon: React.ElementType
  description: string
}

function MetricCard({ title, value, change, changeType, icon: Icon, description }: MetricCardProps) {
  const isPositive = changeType === "positive"

  return (
    <Card className="border-border bg-card">
      <CardContent className="p-5">
        <div className="flex items-start justify-between">
          <div className="flex flex-col gap-1">
            <span className="text-xs font-medium uppercase tracking-wider text-muted-foreground">
              {title}
            </span>
            <span className="text-2xl font-semibold tracking-tight text-foreground">
              {value}
            </span>
          </div>
          <div className="flex h-9 w-9 items-center justify-center rounded-lg bg-primary/10">
            <Icon className="h-4 w-4 text-primary" />
          </div>
        </div>
        <div className="mt-3 flex items-center gap-2">
          <Badge
            className={cn(
              "gap-1 border-0 px-1.5 py-0.5 text-[11px] font-medium",
              isPositive
                ? "bg-emerald-500/10 text-emerald-400"
                : "bg-red-500/10 text-red-400"
            )}
          >
            {isPositive ? (
              <ArrowUpRight className="h-3 w-3" />
            ) : (
              <ArrowDownRight className="h-3 w-3" />
            )}
            {change}
          </Badge>
          <span className="text-xs text-muted-foreground">{description}</span>
        </div>
      </CardContent>
    </Card>
  )
}

const metrics: MetricCardProps[] = [
  {
    title: "GMV (Flujo Total)",
    value: "$124.5M",
    change: "+18.2%",
    changeType: "positive",
    icon: DollarSign,
    description: "vs. mes anterior",
  },
  {
    title: "MRR (Ingresos SaaS)",
    value: "$4.2M",
    change: "+24.5%",
    changeType: "positive",
    icon: TrendingUp,
    description: "vs. mes anterior",
  },
  {
    title: "Talleres Activos",
    value: "42",
    change: "+12%",
    changeType: "positive",
    icon: Store,
    description: "vs. mes anterior",
  },
  {
    title: "Vehiculos Totales",
    value: "1,250",
    change: "+8.3%",
    changeType: "positive",
    icon: Car,
    description: "en la red",
  },
]

export function MetricCards() {
  return (
    <div className="grid grid-cols-1 gap-4 sm:grid-cols-2 lg:grid-cols-4">
      {metrics.map((metric) => (
        <MetricCard key={metric.title} {...metric} />
      ))}
    </div>
  )
}
