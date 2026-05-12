'use client';

import { Suspense, useEffect } from 'react';
import { useRouter } from 'next/navigation';
import { createBrowserClient } from '@supabase/ssr';

export default function ValidandoSesionPage() {
    return (
        <Suspense fallback={<LoadingContent />}>
            <ValidandoContent />
        </Suspense>
    );
}

function LoadingContent() {
    return (
        <div className="min-h-screen bg-slate-50 flex flex-col items-center justify-center p-6">
            <div className="w-16 h-16 border-4 border-slate-200 border-t-blue-600 rounded-full animate-spin mb-6"></div>
            <h1 className="text-xl font-bold text-slate-800">Verificando acceso...</h1>
            <p className="text-sm text-slate-500 mt-2">Preparando tu espacio de trabajo.</p>
        </div>
    );
}

function ValidandoContent() {
    const router = useRouter();

    useEffect(() => {
        const checkSession = async () => {
            const supabase = createBrowserClient(
                process.env.NEXT_PUBLIC_SUPABASE_URL!,
                process.env.NEXT_PUBLIC_SUPABASE_ANON_KEY!
            );

            const { data: { user } } = await supabase.auth.getUser();

            if (user) {
                // Si hay usuario, recargamos la página actual o vamos a /
                // El middleware interceptará esto y mandará al usuario a su home (recepcion o garage)
                window.location.href = '/';
            } else {
                // Si después de 5 segundos no hay usuario, mandamos a login
                const timer = setTimeout(() => {
                    router.push('/login?error=timeout');
                }, 5000);
                return () => clearTimeout(timer);
            }
        };

        checkSession();
    }, [router]);

    return <LoadingContent />;
}
