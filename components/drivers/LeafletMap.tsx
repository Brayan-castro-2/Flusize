'use client';
import { useRouter } from 'next/navigation';
import { MapContainer, TileLayer, Marker, Popup, ZoomControl, useMap } from 'react-leaflet';
import { MapPin, Wrench, Locate, MessageCircle, Star } from 'lucide-react';
import { useRef, forwardRef, useImperativeHandle, useEffect, useState } from 'react';
import L from 'leaflet';
import 'leaflet/dist/leaflet.css';

// Fix for default marker icons in Leaflet
const customIcon = new L.Icon({
    iconUrl: 'https://unpkg.com/leaflet@1.7.1/dist/images/marker-icon.png',
    shadowUrl: 'https://unpkg.com/leaflet@1.7.1/dist/images/marker-shadow.png',
    iconSize: [25, 41],
    iconAnchor: [12, 41],
    popupAnchor: [1, -34],
    shadowSize: [41, 41]
});

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

const LeafletMap = forwardRef(({ workshops, onSelect, selectedId }: LeafletMapProps, ref) => {
    const [mapInstance, setMapInstance] = useState<L.Map | null>(null);
    const router = useRouter();

    useImperativeHandle(ref, () => ({
        flyToLocation: (lat: number, lng: number, zoom = 16) => {
            if (mapInstance) {
                mapInstance.flyTo([lat, lng], zoom, { duration: 1.5 });
            }
        }
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
                    url="https://{s}.basemaps.cartocdn.com/light_all/{z}/{x}/{y}{r}.png"
                    attribution='&copy; <a href="https://www.openstreetmap.org/copyright">OSM</a>'
                />

                <ZoomControl position="topright" />
                <MapInstanceCapturer setMap={setMapInstance} />

                {workshops.map((workshop) => (
                    <Marker
                        key={workshop.id}
                        position={[workshop.coordinates.lat, workshop.coordinates.lng]}
                        icon={customIcon}
                        eventHandlers={{
                            click: () => onSelect(String(workshop.id)),
                            dblclick: () => router.push(`/${workshop.slug || String(workshop.id)}`)
                        }}
                    >
                        <Popup>
                            <div
                                onClick={() => router.push(`/${workshop.slug || workshop.id}`)}
                                className="p-0 min-w-[220px] font-sans cursor-pointer group/popup overflow-hidden rounded-2xl"
                            >
                                {workshop.image && (
                                    <div className="h-24 w-full relative overflow-hidden">
                                        <img
                                            src={workshop.image}
                                            alt={workshop.name}
                                            className="w-full h-full object-cover group-hover/popup:scale-110 transition-transform duration-500"
                                        />
                                        <div className="absolute inset-0 bg-gradient-to-t from-black/60 to-transparent" />
                                        <div className="absolute bottom-2 left-3">
                                            <div className="inline-block bg-blue-600 text-[8px] font-black text-white px-2 py-0.5 rounded-md uppercase tracking-wider">
                                                Partner Verificado
                                            </div>
                                        </div>
                                    </div>
                                )}

                                <div className="p-4">
                                    <h4
                                        className="font-black text-slate-800 text-sm mb-1 leading-tight group-hover/popup:text-blue-600 transition-colors"
                                    >
                                        {workshop.name}
                                    </h4>
                                    <div className="flex items-center gap-1.5 text-[10px] text-slate-500 mb-3 font-bold">
                                        <MapPin className="w-3 h-3 text-slate-400" />
                                        {workshop.location}
                                    </div>

                                    <div className="flex gap-2">
                                        <button
                                            onClick={() => router.push(`/${workshop.slug || workshop.id}`)}
                                            className="flex-1 bg-slate-900 hover:bg-slate-800 text-white py-2 rounded-xl text-[10px] font-black tracking-widest uppercase transition-all shadow-lg shadow-black/10"
                                        >
                                            Ver Perfil
                                        </button>
                                        <a
                                            href={`https://wa.me/${(workshop.whatsapp || '').replace(/\D/g, '')}`}
                                            target="_blank"
                                            rel="noopener noreferrer"
                                            onClick={(e) => e.stopPropagation()}
                                            className="w-10 h-10 flex items-center justify-center bg-emerald-500 hover:bg-emerald-600 text-white rounded-xl shadow-lg shadow-emerald-500/20 transition-all active:scale-90"
                                        >
                                            <MessageCircle className="w-5 h-5" />
                                        </a>
                                    </div>
                                </div>
                            </div>
                        </Popup>
                    </Marker>
                ))}
            </MapContainer>

            {/* Floating Controls Overlay - Corner Bottom Right (Above Promo Banner) */}
            <div className="absolute right-4 bottom-20 md:bottom-[380px] flex flex-col items-end gap-3 z-[1000]">
                {/* Geolocation Button */}
                <button
                    onClick={(e) => {
                        e.stopPropagation();
                        if (navigator.geolocation) {
                            navigator.geolocation.getCurrentPosition(
                                (position) => {
                                    const { latitude, longitude } = position.coords;
                                    if (mapInstance) {
                                        mapInstance.flyTo([latitude, longitude], 16, { duration: 2 });
                                    }
                                }
                            );
                        }
                    }}
                    className="w-12 h-12 bg-blue-600 text-white shadow-2xl hover:bg-blue-500 flex items-center justify-center rounded-full transition-all active:scale-90 group border-2 border-white"
                    title="Mi ubicación"
                >
                    <Locate className="w-6 h-6 group-hover:scale-110 transition-transform" />
                </button>
            </div>

            {/* Workshops Info - Anclado a la izquierda superior */}
            <div className="absolute top-24 left-4 z-[1000] hidden md:block">
                <div className="bg-white/95 backdrop-blur-md px-4 py-3 rounded-2xl shadow-xl border border-slate-100 flex items-center gap-3 min-w-[160px]">
                    <div className="w-10 h-10 rounded-xl bg-blue-50 flex items-center justify-center border border-blue-100 shrink-0">
                        <Wrench className="w-5 h-5 text-blue-600" />
                    </div>
                    <div className="flex flex-col">
                        <span className="font-black text-slate-800 text-sm leading-none mb-0.5">
                            {workshops.length} Talleres
                        </span>
                        <span className="text-[10px] text-slate-400 font-bold uppercase tracking-wider">Cerca de ti</span>
                    </div>
                </div>
            </div>
        </div>
    );
});

LeafletMap.displayName = 'LeafletMap';

export default LeafletMap;
