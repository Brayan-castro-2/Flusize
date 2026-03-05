export default function DashboardLoading() {
    return (
        <div className="flex-1 overflow-auto h-[calc(100vh-5rem)] md:ml-64 p-4 md:p-8 bg-[#f8fafc] dark:bg-[#0a0f1c]">
            {/* Skeleton rows — no fondo negro, no bloqueo */}
            <div className="space-y-4 animate-pulse">
                {/* Header skeleton */}
                <div className="h-8 w-48 rounded-lg bg-slate-200 dark:bg-slate-700/50" />
                <div className="grid grid-cols-1 sm:grid-cols-2 lg:grid-cols-4 gap-4">
                    {[...Array(4)].map((_, i) => (
                        <div key={i} className="h-28 rounded-xl bg-slate-200 dark:bg-slate-700/50" />
                    ))}
                </div>
                {/* Table skeleton */}
                <div className="rounded-xl bg-white dark:bg-slate-800/50 overflow-hidden shadow-sm">
                    <div className="h-10 bg-slate-100 dark:bg-slate-700/30 border-b dark:border-slate-700" />
                    {[...Array(8)].map((_, i) => (
                        <div key={i} className="h-14 border-b dark:border-slate-700/50 flex items-center px-4 gap-4">
                            <div className="h-4 w-20 rounded bg-slate-200 dark:bg-slate-700/50" />
                            <div className="h-4 w-32 rounded bg-slate-200 dark:bg-slate-700/50" />
                            <div className="h-4 w-24 rounded bg-slate-200 dark:bg-slate-700/50 ml-auto" />
                        </div>
                    ))}
                </div>
            </div>
        </div>
    );
}
