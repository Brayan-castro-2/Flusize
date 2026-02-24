'use client';
import dynamic from 'next/dynamic';

const FomoMapInnerWrapper = dynamic(() => import('./FomoMapInner'), {
    ssr: false,
    loading: () => <div className="w-full h-full bg-slate-800 animate-pulse flex items-center justify-center">
        <span className="text-slate-500 text-sm font-bold">Cargando mapa de red...</span>
    </div>
});

export default function FomoMap() {
    return (
        <div className="absolute inset-0 pointer-events-none z-0 rounded-[2rem] overflow-hidden opacity-60">
            <FomoMapInnerWrapper />
            {/* Fade edges into the dark container */}
            <div className="absolute inset-0 bg-gradient-to-t from-slate-900 via-transparent to-slate-900 z-10 pointer-events-none"></div>
            <div className="absolute inset-0 bg-gradient-to-r from-slate-800 via-transparent to-slate-800 z-10 pointer-events-none opacity-50"></div>
        </div>
    );
}
