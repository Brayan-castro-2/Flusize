"use client"

import { Check, Wrench, ClipboardCheck, PackageCheck } from "lucide-react"

type StepStatus = "done" | "active" | "pending"
interface Step { label: string; description: string; status: StepStatus; icon: React.ReactNode; time?: string }

const steps: Step[] = [
    { label: "Recibido", description: "Tu vehículo fue ingresado al taller", status: "done", icon: <ClipboardCheck className="h-4 w-4" />, time: "Lun 10:30" },
    { label: "Diagnóstico", description: "Inspección completa realizada", status: "done", icon: <Check className="h-4 w-4" />, time: "Lun 14:15" },
    { label: "En Reparación", description: "El técnico está trabajando en tu auto", status: "active", icon: <Wrench className="h-4 w-4" /> },
    { label: "Listo para Retiro", description: "Te avisaremos cuando esté listo", status: "pending", icon: <PackageCheck className="h-4 w-4" /> },
]

function StepIndicator({ status, icon }: { status: StepStatus; icon: React.ReactNode }) {
    if (status === "done") return (
        <div className="relative z-10 flex h-9 w-9 items-center justify-center rounded-full bg-primary text-primary-foreground shadow-lg shadow-primary/25">
            <Check className="h-4 w-4" />
        </div>
    )
    if (status === "active") return (
        <div className="relative z-10 flex h-9 w-9 items-center justify-center">
            <div className="absolute inset-0 rounded-full bg-primary/20 animate-pulse" />
            <div className="absolute inset-0.5 rounded-full bg-primary/10 animate-ping" style={{ animationDuration: "2s" }} />
            <div className="relative flex h-9 w-9 items-center justify-center rounded-full bg-primary text-primary-foreground shadow-lg shadow-primary/40">{icon}</div>
        </div>
    )
    return <div className="relative z-10 flex h-9 w-9 items-center justify-center rounded-full border-2 border-border bg-card text-muted-foreground">{icon}</div>
}

export function StatusTimeline() {
    return (
        <section className="px-4 py-2" aria-label="Estado de la orden">
            <h2 className="text-sm font-semibold text-muted-foreground uppercase tracking-wider mb-5">Estado de tu orden</h2>
            <div className="relative">
                {steps.map((step, index) => {
                    const isLast = index === steps.length - 1
                    return (
                        <div key={step.label} className="relative flex gap-4 pb-8 last:pb-0">
                            {!isLast && (
                                <div className="absolute left-[17px] top-9 h-[calc(100%-1rem)] w-0.5" style={{ background: step.status === "done" ? "hsl(var(--primary))" : "hsl(var(--border))" }} />
                            )}
                            <StepIndicator status={step.status} icon={step.icon} />
                            <div className="flex-1 pt-1">
                                <div className="flex items-center justify-between">
                                    <h3 className={`text-sm font-semibold ${step.status === "active" ? "text-primary" : step.status === "done" ? "text-foreground" : "text-muted-foreground"}`}>
                                        {step.label}
                                    </h3>
                                    {step.time && <span className="text-xs text-muted-foreground">{step.time}</span>}
                                </div>
                                <p className={`mt-0.5 text-xs leading-relaxed ${step.status === "pending" ? "text-muted-foreground/60" : "text-muted-foreground"}`}>{step.description}</p>
                                {step.status === "active" && (
                                    <div className="mt-2 flex items-center gap-1.5">
                                        <div className="h-1.5 w-1.5 rounded-full bg-primary animate-pulse" />
                                        <span className="text-xs font-medium text-primary">En progreso</span>
                                    </div>
                                )}
                            </div>
                        </div>
                    )
                })}
            </div>
        </section>
    )
}
