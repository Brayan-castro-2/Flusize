import { Suspense } from 'react';
import { redirect } from 'next/navigation';

export default function ValidandoSesionPage() {
    return (
        <div className="min-h-screen bg-slate-50 flex flex-col items-center justify-center p-6">
            <div className="w-16 h-16 border-4 border-slate-200 border-t-blue-600 rounded-full animate-spin mb-6"></div>
            <h1 className="text-xl font-bold text-slate-800">Verificando acceso...</h1>
            <p className="text-sm text-slate-500 mt-2">Preparando tu espacio de trabajo.</p>
        </div>
    );
}
