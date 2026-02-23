import { LayoutDashboard, Store, Car, Settings, LogOut } from 'lucide-react';
import Link from 'next/link';

export default function SuperAdminLayout({ children }: { children: React.ReactNode }) {
    return (
        <div className="flex h-screen bg-slate-50 overflow-hidden">
            {/* ── SIDEBAR (Light Mode) ── */}
            <aside className="w-64 bg-white border-r border-slate-100 flex flex-col hidden md:flex shrink-0">

                {/* Logo */}
                <div className="h-16 flex items-center px-6 border-b border-slate-100">
                    <div className="flex items-center gap-2.5">
                        <div className="w-8 h-8 rounded-xl bg-blue-600 flex items-center justify-center">
                            <span className="text-white font-black text-sm leading-none">F</span>
                        </div>
                        <div>
                            <span className="font-extrabold text-lg tracking-tight text-slate-800 leading-none block">Flusize</span>
                            <span className="text-[9px] font-bold text-blue-600 uppercase tracking-widest leading-none block mt-0.5">Super Admin</span>
                        </div>
                    </div>
                </div>

                {/* Navigation */}
                <div className="flex-1 py-6 px-4 space-y-1 overflow-y-auto">
                    <p className="px-3 text-xs font-bold text-slate-400 uppercase tracking-widest mb-3">Menú principal</p>

                    <Link href="/super-admin" className="flex items-center gap-3 px-3 py-2.5 rounded-xl bg-blue-50 text-blue-700 font-semibold transition-colors">
                        <LayoutDashboard className="w-5 h-5" />
                        Dashboard
                    </Link>

                    <button disabled className="w-full flex items-center gap-3 px-3 py-2.5 rounded-xl text-slate-400 font-semibold cursor-not-allowed opacity-60">
                        <Store className="w-5 h-5" />
                        Talleres
                    </button>

                    <button disabled className="w-full flex items-center gap-3 px-3 py-2.5 rounded-xl text-slate-400 font-semibold cursor-not-allowed opacity-60">
                        <Car className="w-5 h-5" />
                        Vehículos
                    </button>
                </div>

                {/* Footer */}
                <div className="p-4 border-t border-slate-100 space-y-1">
                    <button disabled className="w-full flex items-center gap-3 px-3 py-2.5 rounded-xl text-slate-400 font-semibold cursor-not-allowed opacity-60">
                        <Settings className="w-5 h-5" />
                        Ajustes
                    </button>
                    <Link href="/login" className="flex items-center gap-3 px-3 py-2.5 rounded-xl text-red-600 font-semibold hover:bg-red-50 transition-colors">
                        <LogOut className="w-5 h-5" />
                        Cerrar Sesión
                    </Link>
                </div>
            </aside>

            {/* ── MAIN CONTENT ── */}
            <div className="flex-1 flex flex-col overflow-hidden w-full">
                {/* Mobile Header */}
                <header className="md:hidden h-16 bg-white border-b border-slate-100 flex items-center px-4 shrink-0">
                    <div className="flex items-center gap-2">
                        <div className="w-8 h-8 rounded-xl bg-blue-600 flex items-center justify-center">
                            <span className="text-white font-black text-sm">F</span>
                        </div>
                        <span className="font-bold text-slate-800">Flusize Admin</span>
                    </div>
                </header>

                {/* Inner Content scrollable */}
                <main className="flex-1 overflow-y-auto">
                    {children}
                </main>
            </div>
        </div>
    );
}
