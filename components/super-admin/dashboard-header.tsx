import { Button } from "@/components/ui/button"
import { Avatar, AvatarFallback } from "@/components/ui/avatar"
import { Badge } from "@/components/ui/badge"
import { Bell, Download } from "lucide-react"

export function SuperAdminHeader() {
    return (
        <header className="flex items-center justify-between border-b border-border bg-card/50 px-6 py-3">
            <div className="flex flex-col gap-0.5">
                <h1 className="text-lg font-semibold text-foreground tracking-tight">Panel de Control</h1>
                <p className="text-xs text-muted-foreground">Vista general del ecosistema Flusize</p>
            </div>
            <div className="flex items-center gap-3">
                <Button variant="outline" size="sm" className="h-8 gap-2 border-border text-xs text-muted-foreground hover:text-foreground">
                    <Download className="h-3.5 w-3.5" />
                    Exportar
                </Button>
                <div className="relative">
                    <Button variant="ghost" size="icon" className="h-8 w-8 text-muted-foreground hover:text-foreground">
                        <Bell className="h-4 w-4" />
                    </Button>
                    <Badge className="absolute -right-1 -top-1 flex h-4 w-4 items-center justify-center border-0 bg-destructive p-0 text-[10px] text-destructive-foreground">
                        3
                    </Badge>
                </div>
                <div className="flex items-center gap-2 rounded-md border border-border px-2 py-1">
                    <Avatar className="h-6 w-6">
                        <AvatarFallback className="bg-primary text-[10px] font-semibold text-primary-foreground">SA</AvatarFallback>
                    </Avatar>
                    <span className="text-xs font-medium text-foreground">Super Admin</span>
                </div>
            </div>
        </header>
    )
}
