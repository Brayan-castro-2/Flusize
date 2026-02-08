'use client';
import dynamic from 'next/dynamic';

const LeafletMap = dynamic(() => import('@/components/drivers/LeafletMap'), {
    ssr: false,
    loading: () => (
        <div className="w-full h-full flex items-center justify-center bg-gray-100 rounded-xl">
            <p className="text-gray-500 animate-pulse">Cargando mapa...</p>
        </div>
    )
});

export default LeafletMap;
