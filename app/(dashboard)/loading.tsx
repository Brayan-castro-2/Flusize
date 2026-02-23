import { Loader2 } from "lucide-react";

export default function DashboardLoading() {
    return (
        <div className="flex-1 overflow-auto h-[calc(100vh-5rem)] md:ml-64 p-4 md:p-8 bg-[#0a0f1c] flex items-center justify-center">
            <div className="flex flex-col items-center gap-4 text-slate-500">
                <Loader2 className="w-12 h-12 animate-spin text-blue-500" />
                <p className="text-sm font-medium animate-pulse">Cargando...</p>
            </div>
        </div>
    );
}
