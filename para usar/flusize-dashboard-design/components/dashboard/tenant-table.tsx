"use client"

import { Card, CardContent, CardHeader, CardTitle, CardDescription } from "@/components/ui/card"
import { Badge } from "@/components/ui/badge"
import { Button } from "@/components/ui/button"
import {
  Table,
  TableBody,
  TableCell,
  TableHead,
  TableHeader,
  TableRow,
} from "@/components/ui/table"
import { Avatar, AvatarFallback } from "@/components/ui/avatar"
import { LogIn, Ban, MoreHorizontal, Search } from "lucide-react"
import { cn } from "@/lib/utils"

interface Tenant {
  id: string
  name: string
  initials: string
  plan: "Partner" | "Pro" | "Enterprise"
  status: "Activo" | "Moroso" | "Trial"
  lastActivity: string
  revenue: string
  vehicles: number
}

const tenants: Tenant[] = [
  {
    id: "1",
    name: "Electromecanica JR",
    initials: "EJ",
    plan: "Enterprise",
    status: "Activo",
    lastActivity: "2 min",
    revenue: "$12.4K",
    vehicles: 186,
  },
  {
    id: "2",
    name: "Taller Automotriz Sur",
    initials: "TA",
    plan: "Pro",
    status: "Activo",
    lastActivity: "15 min",
    revenue: "$8.2K",
    vehicles: 124,
  },
  {
    id: "3",
    name: "Mecanica Express Stgo",
    initials: "ME",
    plan: "Partner",
    status: "Trial",
    lastActivity: "1 hr",
    revenue: "$1.1K",
    vehicles: 32,
  },
  {
    id: "4",
    name: "AutoFix Puerto Montt",
    initials: "AF",
    plan: "Pro",
    status: "Moroso",
    lastActivity: "3 dias",
    revenue: "$5.6K",
    vehicles: 78,
  },
  {
    id: "5",
    name: "Servicio Integral Los Andes",
    initials: "SI",
    plan: "Enterprise",
    status: "Activo",
    lastActivity: "8 min",
    revenue: "$15.8K",
    vehicles: 210,
  },
  {
    id: "6",
    name: "Taller Don Pedro",
    initials: "TD",
    plan: "Partner",
    status: "Activo",
    lastActivity: "45 min",
    revenue: "$3.2K",
    vehicles: 45,
  },
]

const planStyles: Record<string, string> = {
  Enterprise: "bg-primary/10 text-primary border-0",
  Pro: "bg-accent/10 text-accent border-0",
  Partner: "bg-secondary text-muted-foreground border-0",
}

const statusStyles: Record<string, string> = {
  Activo: "bg-emerald-500/10 text-emerald-400 border-0",
  Moroso: "bg-red-500/10 text-red-400 border-0",
  Trial: "bg-amber-500/10 text-amber-400 border-0",
}

export function TenantTable() {
  return (
    <Card className="border-border bg-card">
      <CardHeader className="pb-3">
        <div className="flex items-center justify-between">
          <div>
            <CardTitle className="text-base font-semibold text-foreground">
              Gestion de Talleres
            </CardTitle>
            <CardDescription className="text-xs text-muted-foreground">
              {tenants.length} talleres registrados en la plataforma
            </CardDescription>
          </div>
          <div className="flex items-center gap-2">
            <div className="relative">
              <Search className="absolute left-2.5 top-1/2 h-3.5 w-3.5 -translate-y-1/2 text-muted-foreground" />
              <input
                type="text"
                placeholder="Buscar taller..."
                className="h-8 w-48 rounded-md border border-border bg-background pl-8 pr-3 text-xs text-foreground placeholder:text-muted-foreground focus:outline-none focus:ring-1 focus:ring-ring"
              />
            </div>
          </div>
        </div>
      </CardHeader>
      <CardContent className="px-0 pb-0">
        <Table>
          <TableHeader>
            <TableRow className="border-border hover:bg-transparent">
              <TableHead className="text-xs font-medium uppercase tracking-wider text-muted-foreground">
                Taller
              </TableHead>
              <TableHead className="text-xs font-medium uppercase tracking-wider text-muted-foreground">
                Plan
              </TableHead>
              <TableHead className="text-xs font-medium uppercase tracking-wider text-muted-foreground">
                Estado
              </TableHead>
              <TableHead className="text-xs font-medium uppercase tracking-wider text-muted-foreground">
                Ingresos
              </TableHead>
              <TableHead className="text-xs font-medium uppercase tracking-wider text-muted-foreground">
                Vehiculos
              </TableHead>
              <TableHead className="text-xs font-medium uppercase tracking-wider text-muted-foreground">
                Ultima Actividad
              </TableHead>
              <TableHead className="text-right text-xs font-medium uppercase tracking-wider text-muted-foreground">
                Acciones
              </TableHead>
            </TableRow>
          </TableHeader>
          <TableBody>
            {tenants.map((tenant) => (
              <TableRow key={tenant.id} className="border-border">
                <TableCell>
                  <div className="flex items-center gap-3">
                    <Avatar className="h-8 w-8">
                      <AvatarFallback className="bg-secondary text-xs font-medium text-foreground">
                        {tenant.initials}
                      </AvatarFallback>
                    </Avatar>
                    <span className="text-sm font-medium text-foreground">
                      {tenant.name}
                    </span>
                  </div>
                </TableCell>
                <TableCell>
                  <Badge className={cn("text-[11px]", planStyles[tenant.plan])}>
                    {tenant.plan}
                  </Badge>
                </TableCell>
                <TableCell>
                  <Badge className={cn("text-[11px]", statusStyles[tenant.status])}>
                    {tenant.status}
                  </Badge>
                </TableCell>
                <TableCell>
                  <span className="text-sm font-medium font-mono text-foreground">
                    {tenant.revenue}
                  </span>
                </TableCell>
                <TableCell>
                  <span className="text-sm text-muted-foreground">
                    {tenant.vehicles}
                  </span>
                </TableCell>
                <TableCell>
                  <span className="text-sm text-muted-foreground">
                    {tenant.lastActivity}
                  </span>
                </TableCell>
                <TableCell className="text-right">
                  <div className="flex items-center justify-end gap-1">
                    <Button
                      variant="ghost"
                      size="sm"
                      className="h-7 gap-1.5 px-2 text-xs text-primary hover:bg-primary/10 hover:text-primary"
                    >
                      <LogIn className="h-3 w-3" />
                      <span className="hidden lg:inline">Ingresar</span>
                    </Button>
                    <Button
                      variant="ghost"
                      size="sm"
                      className="h-7 gap-1.5 px-2 text-xs text-muted-foreground hover:bg-destructive/10 hover:text-destructive"
                    >
                      <Ban className="h-3 w-3" />
                      <span className="hidden lg:inline">Suspender</span>
                    </Button>
                    <Button
                      variant="ghost"
                      size="icon"
                      className="h-7 w-7 text-muted-foreground"
                    >
                      <MoreHorizontal className="h-3.5 w-3.5" />
                    </Button>
                  </div>
                </TableCell>
              </TableRow>
            ))}
          </TableBody>
        </Table>
      </CardContent>
    </Card>
  )
}
