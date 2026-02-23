import { Card } from "@/components/ui/card";
import { Loader2 } from "lucide-react";

export default function OrdenesLoading() {
    return (
        <div className="space-y-6 animate-pulse">
            <div className="flex flex-col md:flex-row md:items-center justify-between gap-4">
                <div className="space-y-2">
                    <div className="h-8 w-48 bg-slate-800 rounded-lg"></div>
                    <div className="h-4 w-64 bg-slate-800/50 rounded-lg"></div>
                </div>
                <div className="h-10 w-full md:w-32 bg-slate-800 rounded-lg"></div>
            </div>

            <Card className="bg-slate-900/50 border-slate-800 p-4">
                <div className="h-10 w-full bg-slate-800 rounded-lg"></div>
            </Card>

            <div className="space-y-4">
                {[1, 2, 3, 4, 5].map((i) => (
                    <div key={i} className="h-24 w-full bg-slate-900/50 border border-slate-800 rounded-xl"></div>
                ))}
            </div>

            <div className="flex items-center justify-center p-12">
                <Loader2 className="w-8 h-8 text-blue-500/30 animate-spin" />
            </div>
        </div>
    );
}
