'use client';
import { useRouter } from 'next/navigation';
import { MapContainer, TileLayer, Marker, ZoomControl, useMap } from 'react-leaflet';
import { useRef, forwardRef, useImperativeHandle, useEffect, useState } from 'react';
import L from 'leaflet';
import 'leaflet/dist/leaflet.css';

interface Workshop {
    id: string | number;
    name: string;
    location: string;
    coordinates: { lat: number; lng: number };
    rating: number;
    slug?: string;
    whatsapp?: string;
    ciudad?: string;
    image?: string;
    specialties?: string[];
}

interface LeafletMapProps {
    workshops: Workshop[];
    onSelect: (id: string) => void;
    selectedId?: string;
}

// Sub-component to capture the map instance safely
const MapInstanceCapturer = ({ setMap }: { setMap: (map: L.Map) => void }) => {
    const map = useMap();
    useEffect(() => {
        if (map) {
            setMap(map);
        }
    }, [map, setMap]);
    return null;
};

const createCustomIcon = (workshop: Workshop) => {
    const isPremium = workshop.rating >= 4.8;
    const isVulca = workshop.specialties?.some((s: string) => s.toLowerCase().includes('vulca'));
    
    let emoji = '🛠️';
    if (isVulca) emoji = '🚗';
    if (workshop.specialties?.some((s: string) => s.toLowerCase().includes('cerraj'))) emoji = '🔑';
    if (workshop.specialties?.some((s: string) => s.toLowerCase().includes('detail'))) emoji = '✨';

    return L.divIcon({
        html: `
            <div class="relative group">
                <div class="w-11 h-11 bg-white rounded-2xl flex items-center justify-center shadow-[0_10px_25px_rgba(0,0,0,0.1)] border-2 ${isPremium ? 'border-amber-400' : 'border-blue-500'} transition-all duration-300 group-hover:scale-110 group-hover:-translate-y-1">
                    <span class="text-xl">${emoji}</span>
                    ${isPremium ? `
                        <div class="absolute -top-1.5 -right-1.5 w-5 h-5 bg-blue-600 rounded-full border-2 border-white flex items-center justify-center shadow-lg">
                            <svg xmlns="http://www.w3.org/2000/svg" width="12" height="12" viewBox="0 0 24 24" fill="none" stroke="white" stroke-width="4" stroke-linecap="round" stroke-linejoin="round"><polyline points="20 6 9 17 4 12"/></svg>
                        </div>
                    ` : ''}
                </div>
                <div class="absolute -bottom-1 left-1/2 -translate-x-1/2 w-0 h-0 border-l-[6px] border-l-transparent border-r-[6px] border-r-transparent border-t-[8px] ${isPremium ? 'border-t-amber-400' : 'border-t-blue-500'} drop-shadow-sm"></div>
            </div>
        `,
        className: 'custom-div-icon',
        iconSize: [44, 52],
        iconAnchor: [22, 52],
    });
};

const LeafletMap = forwardRef(({ workshops, onSelect, selectedId }: LeafletMapProps, ref) => {
    const [mapInstance, setMapInstance] = useState<L.Map | null>(null);

    useImperativeHandle(ref, () => ({
        flyToLocation: (lat: number, lng: number, zoom = 16) => {
            if (mapInstance) {
                mapInstance.flyTo([lat, lng], zoom, { duration: 1.5 });
            }
        },
        getCurrentMap: () => mapInstance
    }));

    return (
        <div className="w-full h-full relative">
            <MapContainer
                center={[-41.4693, -72.9424]}
                zoom={13}
                scrollWheelZoom={true}
                className="w-full h-full"
                zoomControl={false}
                style={{ background: '#f8fafc' }}
            >
                <TileLayer
                    url="https://{s}.basemaps.cartocdn.com/rastertiles/voyager/{z}/{x}/{y}{r}.png"
                    attribution='&copy; <a href="https://www.openstreetmap.org/copyright">OSM</a>'
                />

                <ZoomControl position="topright" />
                <MapInstanceCapturer setMap={setMapInstance} />

                {workshops.map((workshop) => (
                    <Marker
                        key={workshop.id}
                        position={[workshop.coordinates.lat, workshop.coordinates.lng]}
                        icon={createCustomIcon(workshop)}
                        eventHandlers={{
                            click: () => onSelect(String(workshop.id)),
                        }}
                    />
                ))}
            </MapContainer>
        </div>
    );
});

LeafletMap.displayName = 'LeafletMap';

export default LeafletMap;
