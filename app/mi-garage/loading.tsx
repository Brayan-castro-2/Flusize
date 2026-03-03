import { Loader2 } from "lucide-react";

export default function MiGarageLoading() {
    return (
        <div className="min-h-screen bg-slate-50 overflow-hidden font-sans pb-24 animate-pulse">
            {/* Header / Navbar Profile Area */}
            <header className="bg-white/80 backdrop-blur-xl border-b border-slate-200 sticky top-0 z-50 transition-all duration-300">
                <div className="max-w-md mx-auto px-4 h-16 flex items-center justify-between">
                    <div className="flex items-center gap-3">
                        <div className="w-10 h-10 rounded-full bg-slate-200 overflow-hidden border-2 border-white shadow-sm"></div>
                        <div className="flex flex-col">
                            <div className="h-4 w-24 bg-slate-200 rounded mb-1"></div>
                            <div className="h-3 w-32 bg-slate-100 rounded"></div>
                        </div>
                    </div>
                    <div className="w-10 h-10 rounded-full bg-slate-100 flex items-center justify-center"></div>
                </div>
            </header>

            <main className="max-w-md mx-auto px-4 pt-6 space-y-6">
                {/* Saludo y Botón Agregar */}
                <div className="flex justify-between items-end mb-6">
                    <div>
                        <div className="h-8 w-48 bg-slate-200 rounded-lg mb-2"></div>
                        <div className="h-4 w-64 bg-slate-100 rounded-lg"></div>
                    </div>
                </div>

                {/* Tarjetas de Vehículos Skeleton */}
                <div className="space-y-4 relative z-10">
                    {[1, 2].map((i) => (
                        <div key={i} className="bg-white rounded-3xl p-6 shadow-sm border border-slate-100 overflow-hidden relative">
                            <div className="flex justify-between items-start mb-6">
                                <div className="space-y-2">
                                    <div className="h-6 w-32 bg-slate-200 rounded-md"></div>
                                    <div className="h-4 w-20 bg-slate-100 rounded-md"></div>
                                </div>
                                <div className="h-4 w-24 bg-slate-200 rounded-full"></div>
                            </div>

                            <div className="grid grid-cols-2 gap-4 mt-6">
                                <div className="bg-slate-50 p-3 rounded-2xl border border-slate-100/50">
                                    <div className="h-4 w-16 bg-slate-200 rounded mb-1"></div>
                                    <div className="h-5 w-20 bg-slate-300 rounded"></div>
                                </div>
                                <div className="bg-slate-50 p-3 rounded-2xl border border-slate-100/50">
                                    <div className="h-4 w-16 bg-slate-200 rounded mb-1"></div>
                                    <div className="h-5 w-20 bg-slate-300 rounded"></div>
                                </div>
                            </div>
                        </div>
                    ))}
                </div>

                <div className="flex justify-center py-8">
                    <Loader2 className="w-6 h-6 text-slate-300 animate-spin" />
                </div>
            </main>
        </div>
    );
}
