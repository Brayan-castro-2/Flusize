export default function TrackingLayout({
    children,
}: {
    children: React.ReactNode;
}) {
    return (
        <div className="min-h-screen bg-slate-50 font-sans">
            {/* Minimal Header */}
            <header className="bg-white border-b border-slate-100 sticky top-0 z-50">
                <div className="max-w-md mx-auto px-6 py-4 flex items-center justify-center">
                    <div className="flex items-center gap-2">
                        <div className="w-8 h-8 rounded-lg bg-blue-600 flex items-center justify-center text-white font-bold text-lg">
                            F
                        </div>
                        <span className="font-bold text-lg text-slate-900 tracking-tight">FLUSIZE</span>
                    </div>
                </div>
            </header>

            {children}
        </div>
    );
}
