import { Card, CardHeader, CardTitle, CardContent } from "@/components/ui/card";
import { Loader2 } from "lucide-react";

export default function AdminDashboardLoading() {
    return (
        <div className="space-y-6 animate-pulse">
            <div>
                <div className="h-8 w-64 bg-slate-800 rounded-lg mb-2"></div>
                <div className="h-4 w-96 bg-slate-800/50 rounded-lg"></div>
            </div>

            <div className="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-4 gap-4">
                {[1, 2, 3, 4].map((i) => (
                    <Card key={i} className="bg-slate-900 border-slate-800">
                        <CardHeader className="flex flex-row items-center justify-between space-y-0 pb-2">
                            <div className="h-4 w-24 bg-slate-800 rounded"></div>
                            <div className="h-4 w-4 bg-slate-800 rounded-full"></div>
                        </CardHeader>
                        <CardContent>
                            <div className="h-8 w-16 bg-slate-800 rounded mb-2"></div>
                            <div className="h-3 w-32 bg-slate-800/50 rounded"></div>
                        </CardContent>
                    </Card>
                ))}
            </div>

            <div className="grid grid-cols-1 lg:grid-cols-2 gap-6">
                <Card className="bg-slate-900 border-slate-800 h-96 flex items-center justify-center">
                    <Loader2 className="w-8 h-8 text-blue-500/30 animate-spin" />
                </Card>
                <Card className="bg-slate-900 border-slate-800 h-96 flex items-center justify-center">
                    <Loader2 className="w-8 h-8 text-blue-500/30 animate-spin" />
                </Card>
            </div>
        </div>
    );
}
