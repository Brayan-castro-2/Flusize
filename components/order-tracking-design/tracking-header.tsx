import { Badge } from "@/components/ui/badge"
import { Car, ChevronLeft, Share2 } from "lucide-react"

export function TrackingHeader() {
    return (
        <header className="relative px-4 pb-6 pt-4">
            <div className="flex items-center justify-between mb-6">
                <button className="flex h-9 w-9 items-center justify-center rounded-full bg-secondary text-muted-foreground transition-colors hover:bg-secondary/80" aria-label="Volver">
                    <ChevronLeft className="h-5 w-5" />
                </button>
                <div className="flex items-center gap-1.5">
                    <div className="h-6 w-6 rounded-md bg-primary flex items-center justify-center">
                        <span className="text-[10px] font-bold text-primary-foreground tracking-tight">F</span>
                    </div>
                    <span className="text-sm font-semibold text-foreground tracking-tight">flusize</span>
                </div>
                <button className="flex h-9 w-9 items-center justify-center rounded-full bg-secondary text-muted-foreground transition-colors hover:bg-secondary/80" aria-label="Compartir">
                    <Share2 className="h-4 w-4" />
                </button>
            </div>
            <div className="flex items-start gap-4">
                <div className="flex h-14 w-14 shrink-0 items-center justify-center rounded-2xl bg-primary/10 text-primary">
                    <Car className="h-7 w-7" />
                </div>
                <div className="flex-1 min-w-0">
                    <h1 className="text-xl font-bold text-foreground leading-tight">Toyota Yaris 2018</h1>
                    <div className="mt-2 flex items-center gap-2">
                        <Badge className="bg-secondary text-muted-foreground border-border font-mono text-xs tracking-wider px-3 py-1">AB 123 CD</Badge>
                        <Badge className="bg-primary/10 text-primary border-transparent text-xs px-3 py-1">Orden #1042</Badge>
                    </div>
                </div>
            </div>
        </header>
    )
}
