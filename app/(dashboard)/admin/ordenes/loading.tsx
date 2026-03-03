import { Card } from "@/components/ui/card";
import { Loader2 } from "lucide-react";

export default function OrdenesLoading() {
    return (
        <div className="space-y-6 animate-pulse w-full">
            <div className="flex flex-col md:flex-row md:items-center justify-between gap-4">
                <div className="space-y-2">
                    <div className="h-8 w-48 bg-gray-200 rounded-lg"></div>
                    <div className="h-4 w-64 bg-gray-100 rounded-lg"></div>
                </div>
                <div className="h-10 w-full md:w-32 bg-gray-200 rounded-lg"></div>
            </div>

            <Card className="bg-white border-gray-200 p-4 shadow-sm">
                <div className="h-10 w-full bg-gray-100 rounded-lg"></div>
            </Card>

            <div className="space-y-4">
                {[1, 2, 3, 4, 5].map((i) => (
                    <div key={i} className="h-24 w-full bg-white border border-gray-200 rounded-xl shadow-sm flex items-center p-4">
                        <div className="h-12 w-12 bg-gray-100 rounded-full mr-4"></div>
                        <div className="space-y-2 flex-1">
                            <div className="h-4 w-1/4 bg-gray-200 rounded"></div>
                            <div className="h-3 w-1/3 bg-gray-100 rounded"></div>
                        </div>
                        <div className="h-8 w-16 bg-gray-100 rounded-lg"></div>
                    </div>
                ))}
            </div>

            <div className="flex items-center justify-center p-12">
                <Loader2 className="w-8 h-8 text-blue-500/30 animate-spin" />
            </div>
        </div>
    );
}
