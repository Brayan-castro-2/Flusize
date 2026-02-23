import { Card } from "@/components/ui/card";
import { Loader2 } from "lucide-react";

export default function ClientesLoading() {
    return (
        <div className="space-y-6 animate-pulse">
            <div className="flex flex-col md:flex-row md:items-center justify-between gap-4">
                <div className="space-y-2">
                    <div className="h-8 w-48 bg-slate-800 rounded-lg"></div>
                    <div className="h-4 w-64 bg-slate-800/50 rounded-lg"></div>
                </div>
                <div className="h-10 w-full md:w-32 bg-slate-800 rounded-lg"></div>
            </div>

            <div className="grid grid-cols-1 md:grid-cols-3 gap-4">
                {[1, 2, 3].map((i) => (
                    <Card key={i} className="bg-slate-900/60 border-slate-800 p-4 h-24 flex items-center gap-4">
                        <div className="w-12 h-12 rounded-full bg-slate-800"></div>
                        <div className="space-y-2 flex-1">
                            <div className="h-3 w-24 bg-slate-800 rounded"></div>
                            <div className="h-8 w-16 bg-slate-800 rounded"></div>
                        </div>
                    </Card>
                ))}
            </div>

            <Card className="bg-slate-900/50 border-slate-800 p-4">
                <div className="h-10 w-full bg-slate-800 rounded-lg"></div>
            </Card>

            <div className="h-64 w-full bg-slate-900/50 border border-slate-800 rounded-xl flex items-center justify-center">
                <Loader2 className="w-8 h-8 text-blue-500/30 animate-spin" />
            </div>
        </div>
    );
}
