'use client';

import { useEffect } from 'react';
import { useParams, useRouter } from 'next/navigation';
import { Loader2 } from 'lucide-react';

export default function OrdenDetailPage() {
    const params = useParams();
    const router = useRouter();
    const orderId = params.id;

    useEffect(() => {
        if (orderId) {
            router.replace(`/admin/ordenes/clean?id=${orderId}`);
        } else {
            router.replace('/admin/ordenes');
        }
    }, [router, orderId]);

    return (
        <div className="flex items-center justify-center h-[50vh]">
            <Loader2 className="w-8 h-8 animate-spin text-blue-500" />
            <span className="ml-2 text-slate-400">Redirigiendo...</span>
        </div>
    );
}
