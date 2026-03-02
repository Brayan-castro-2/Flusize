'use client';
import dynamic from 'next/dynamic';

const LeafletMap = dynamic(() => import('@/components/drivers/LeafletMap'), {
    ssr: false,
    loading: () => null
});

export default LeafletMap;
