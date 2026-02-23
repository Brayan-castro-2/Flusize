"use client"

import { Card, CardContent, CardHeader, CardTitle, CardDescription } from "@/components/ui/card"
import { Badge } from "@/components/ui/badge"
import {
    AreaChart,
    Area,
    XAxis,
    YAxis,
    CartesianGrid,
    Tooltip,
    ResponsiveContainer,
} from "recharts"
import { TrendingUp } from "lucide-react"

const data = [
    { month: "Sep", talleres: 8, ordenes: 320 },
    { month: "Oct", talleres: 12, ordenes: 580 },
    { month: "Nov", talleres: 18, ordenes: 920 },
    { month: "Dic", talleres: 24, ordenes: 1450 },
    { month: "Ene", talleres: 33, ordenes: 2100 },
    { month: "Feb", talleres: 42, ordenes: 3200 },
]

function CustomTooltip({ active, payload, label }: { active?: boolean; payload?: Array<{ value: number; dataKey: string }>; label?: string }) {
    if (active && payload && payload.length) {
        return (
            <div className="rounded-lg border border-border bg-card px-3 py-2 shadow-lg">
                <p className="text-xs font-medium text-foreground">{label}</p>
                {payload.map((entry) => (
                    <p key={entry.dataKey} className="text-xs text-muted-foreground">
                        {entry.dataKey === "talleres" ? "Talleres" : "Órdenes"}:{" "}
                        <span className="font-medium text-foreground">{entry.value.toLocaleString()}</span>
                    </p>
                ))}
            </div>
        )
    }
    return null
}

export function GrowthChart() {
    return (
        <Card className="border-border bg-card">
            <CardHeader className="pb-2">
                <div className="flex items-center justify-between">
                    <div>
                        <CardTitle className="text-base font-semibold text-foreground">Crecimiento de Talleres</CardTitle>
                        <CardDescription className="text-xs text-muted-foreground">Crecimiento exponencial en los últimos 6 meses</CardDescription>
                    </div>
                    <Badge className="gap-1 border-0 bg-emerald-500/10 px-2 py-1 text-xs font-medium text-emerald-400">
                        <TrendingUp className="h-3 w-3" />
                        +425%
                    </Badge>
                </div>
            </CardHeader>
            <CardContent className="pt-2">
                <div className="h-[300px] w-full">
                    <ResponsiveContainer width="100%" height="100%">
                        <AreaChart data={data} margin={{ top: 10, right: 10, left: -10, bottom: 0 }}>
                            <defs>
                                <linearGradient id="greenGradient" x1="0" y1="0" x2="0" y2="1">
                                    <stop offset="5%" stopColor="hsl(142, 71%, 45%)" stopOpacity={0.3} />
                                    <stop offset="95%" stopColor="hsl(142, 71%, 45%)" stopOpacity={0} />
                                </linearGradient>
                                <linearGradient id="blueGradient" x1="0" y1="0" x2="0" y2="1">
                                    <stop offset="5%" stopColor="hsl(217, 91%, 60%)" stopOpacity={0.2} />
                                    <stop offset="95%" stopColor="hsl(217, 91%, 60%)" stopOpacity={0} />
                                </linearGradient>
                            </defs>
                            <CartesianGrid strokeDasharray="3 3" stroke="hsl(217, 33%, 17%)" vertical={false} />
                            <XAxis dataKey="month" axisLine={false} tickLine={false} tick={{ fill: "hsl(215, 20%, 55%)", fontSize: 12 }} />
                            <YAxis axisLine={false} tickLine={false} tick={{ fill: "hsl(215, 20%, 55%)", fontSize: 12 }} />
                            <Tooltip content={<CustomTooltip />} />
                            <Area type="monotone" dataKey="ordenes" stroke="hsl(217, 91%, 60%)" strokeWidth={2} fill="url(#blueGradient)" dot={false} />
                            <Area type="monotone" dataKey="talleres" stroke="hsl(142, 71%, 45%)" strokeWidth={2} fill="url(#greenGradient)" dot={false} />
                        </AreaChart>
                    </ResponsiveContainer>
                </div>
                <div className="mt-3 flex items-center gap-6">
                    <div className="flex items-center gap-2">
                        <div className="h-2 w-2 rounded-full bg-emerald-500" />
                        <span className="text-xs text-muted-foreground">Talleres</span>
                    </div>
                    <div className="flex items-center gap-2">
                        <div className="h-2 w-2 rounded-full bg-primary" />
                        <span className="text-xs text-muted-foreground">Órdenes Procesadas</span>
                    </div>
                </div>
            </CardContent>
        </Card>
    )
}
