"use client"

import { PieChart, Pie, Cell, ResponsiveContainer } from "recharts"
import { Card, CardContent, CardHeader, CardTitle } from "@/components/ui/card"
import { TrendingUp } from "lucide-react"

const data = [
    { name: "Mecánica", value: 280000, color: "#3b82f6" },
    { name: "Repuestos", value: 185000, color: "#22d3ee" },
    { name: "Bencina", value: 420000, color: "#22c55e" },
]

const total = data.reduce((acc, item) => acc + item.value, 0)

function formatCLP(amount: number) {
    return `$${amount.toLocaleString("es-CL")}`
}

export function FinancialSummary() {
    return (
        <section className="px-4 md:px-6">
            <Card className="border-border bg-card">
                <CardHeader className="pb-2">
                    <div className="flex items-center justify-between">
                        <div>
                            <p className="text-xs font-medium uppercase tracking-wider text-muted-foreground">Inversión Total 2026</p>
                            <CardTitle className="text-2xl font-bold text-foreground mt-1">{formatCLP(total)}</CardTitle>
                        </div>
                        <div className="flex items-center gap-1 rounded-full bg-emerald-500/10 px-2.5 py-1">
                            <TrendingUp className="h-3.5 w-3.5 text-emerald-400" />
                            <span className="text-xs font-medium text-emerald-400">-12%</span>
                        </div>
                    </div>
                    <p className="text-xs text-muted-foreground mt-0.5">vs. mismo periodo 2025</p>
                </CardHeader>
                <CardContent>
                    <div className="flex items-center gap-6">
                        <div className="relative h-36 w-36 flex-shrink-0">
                            <ResponsiveContainer width="100%" height="100%">
                                <PieChart>
                                    <Pie data={data} cx="50%" cy="50%" innerRadius={40} outerRadius={65} paddingAngle={3} dataKey="value" strokeWidth={0}>
                                        {data.map((entry, index) => (
                                            <Cell key={`cell-${index}`} fill={entry.color} />
                                        ))}
                                    </Pie>
                                </PieChart>
                            </ResponsiveContainer>
                            <div className="absolute inset-0 flex items-center justify-center">
                                <div className="text-center">
                                    <p className="text-xs text-muted-foreground">Total</p>
                                    <p className="text-sm font-bold text-foreground">{formatCLP(total)}</p>
                                </div>
                            </div>
                        </div>
                        <div className="flex flex-col gap-3 flex-1">
                            {data.map((item) => (
                                <div key={item.name} className="flex items-center justify-between">
                                    <div className="flex items-center gap-2">
                                        <div className="h-3 w-3 rounded-full" style={{ backgroundColor: item.color }} />
                                        <span className="text-sm text-muted-foreground">{item.name}</span>
                                    </div>
                                    <div className="text-right">
                                        <p className="text-sm font-semibold text-foreground">{formatCLP(item.value)}</p>
                                        <p className="text-xs text-muted-foreground">{Math.round((item.value / total) * 100)}%</p>
                                    </div>
                                </div>
                            ))}
                        </div>
                    </div>
                </CardContent>
            </Card>
        </section>
    )
}
