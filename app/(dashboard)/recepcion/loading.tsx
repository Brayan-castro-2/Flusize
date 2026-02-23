import { Card, CardHeader, CardTitle, CardContent } from "@/components/ui/card";
import { Loader2 } from "lucide-react";

export default function RecepcionLoading() {
    return (
        <div className="max-w-4xl mx-auto space-y-6 animate-pulse p-4">
            <div className="text-center space-y-2 mb-8">
                <div className="h-8 w-48 bg-slate-800 rounded-lg mx-auto"></div>
                <div className="h-4 w-64 bg-slate-800/50 rounded-lg mx-auto"></div>
            </div>

            <div className="grid grid-cols-1 md:grid-cols-2 gap-6">
                {/* Vehículo Skeleton */}
                <Card className="bg-slate-900 border-slate-800">
                    <CardHeader>
                        <CardTitle className="h-6 w-48 bg-slate-800 rounded"></CardTitle>
                    </CardHeader>
                    <CardContent className="space-y-4">
                        <div className="space-y-2">
                            <div className="h-4 w-24 bg-slate-800 rounded"></div>
                            <div className="h-10 w-full bg-slate-800/50 rounded-xl"></div>
                        </div>
                        <div className="h-10 w-full bg-slate-800/50 rounded-xl"></div>
                        <div className="h-10 w-full bg-slate-800/50 rounded-xl"></div>
                    </CardContent>
                </Card>

                {/* Cliente Skeleton */}
                <Card className="bg-slate-900 border-slate-800">
                    <CardHeader>
                        <CardTitle className="h-6 w-48 bg-slate-800 rounded"></CardTitle>
                    </CardHeader>
                    <CardContent className="space-y-4">
                        <div className="space-y-2">
                            <div className="h-4 w-24 bg-slate-800 rounded"></div>
                            <div className="h-10 w-full bg-slate-800/50 rounded-xl"></div>
                        </div>
                        <div className="h-10 w-full bg-slate-800/50 rounded-xl"></div>
                        <div className="h-10 w-full bg-slate-800/50 rounded-xl"></div>
                    </CardContent>
                </Card>
            </div>

            <div className="flex items-center justify-center p-8">
                <Loader2 className="w-8 h-8 text-blue-500/30 animate-spin" />
            </div>
        </div>
    );
}
