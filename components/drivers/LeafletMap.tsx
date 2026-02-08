'use client';
import { useRouter } from 'next/navigation';
import { MapContainer, TileLayer, Marker, Popup, useMap } from 'react-leaflet';
import { MapPin, Star, DollarSign, Navigation, Wrench, Calendar } from 'lucide-react';
import { useRef, forwardRef, useImperativeHandle, useEffect } from 'react';
import L from 'leaflet';
import 'leaflet/dist/leaflet.css';
import { Workshop } from '@/lib/mockData';

// Fix for Leaflet icons in Next.js
const DefaultIcon = L.icon({
    iconUrl: 'https://unpkg.com/leaflet@1.7.1/dist/images/marker-icon.png',
    iconRetinaUrl: 'https://unpkg.com/leaflet@1.7.1/dist/images/marker-icon-2x.png',
    shadowUrl: 'https://unpkg.com/leaflet@1.7.1/dist/images/marker-shadow.png',
    iconSize: [25, 41],
    iconAnchor: [12, 41],
    popupAnchor: [1, -34],
    shadowSize: [41, 41]
});

L.Marker.prototype.options.icon = DefaultIcon;

interface LeafletMapProps {
    workshops: Workshop[];
    selectedId?: number;
    onSelect?: (id: number) => void;
}

// Internal component to access the map instance
function MapController({ mapRef }: { mapRef: React.MutableRefObject<L.Map | null> }) {
    const map = useMap();

    useEffect(() => {
        if (mapRef) {
            mapRef.current = map;
        }
    }, [map, mapRef]);

    return null;
}

const LeafletMap = forwardRef(({ workshops, selectedId, onSelect }: LeafletMapProps, ref) => {
    const router = useRouter();
    const mapRef = useRef<L.Map | null>(null);

    // Initial center: Puerto Montt, Chile
    const puertoMonttCenter: [number, number] = [-41.4693, -72.9424];

    useImperativeHandle(ref, () => ({
        flyToLocation: (lat: number, lng: number, zoom = 14) => {
            if (mapRef.current) {
                mapRef.current.flyTo([lat, lng], zoom, {
                    duration: 2
                });
            }
        }
    }));

    const handleMarkerClick = (spotId: number) => {
        if (onSelect) {
            onSelect(spotId);
        }
    };

    return (
        <div className="w-full h-full min-h-[500px] bg-slate-200 rounded-xl overflow-hidden shadow-lg relative z-0">
            <MapContainer
                center={puertoMonttCenter}
                zoom={13}
                scrollWheelZoom={true}
                style={{ height: '100%', width: '100%', minHeight: '500px' }}
                className="z-0"
            >
                <TileLayer
                    attribution='&copy; <a href="https://www.openstreetmap.org/copyright">OpenStreetMap</a> contributors'
                    url="https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png"
                />

                <MapController mapRef={mapRef} />

                {workshops.map((workshop) => {
                    const position: [number, number] = [workshop.coordinates.lat, workshop.coordinates.lng];

                    return (
                        <Marker
                            key={workshop.id}
                            position={position}
                            eventHandlers={{
                                click: () => handleMarkerClick(workshop.id),
                            }}
                        >
                            <Popup>
                                <div className="p-2 min-w-[250px]">
                                    <div className="relative">
                                        <img
                                            src={workshop.image}
                                            alt={workshop.name}
                                            className="w-full h-32 object-cover rounded-lg mb-3"
                                        />
                                        <div className="absolute top-2 right-2 bg-white/90 backdrop-blur-sm px-2 py-1 rounded-md text-xs font-bold text-gray-800 shadow-sm flex items-center gap-1">
                                            <Star className="w-3 h-3 text-yellow-500 fill-yellow-500" />
                                            {workshop.rating}
                                        </div>
                                    </div>

                                    <h3 className="font-bold text-lg text-gray-900 mb-1 leading-tight">
                                        {workshop.name}
                                    </h3>

                                    <div className="flex items-center text-xs text-gray-500 mb-2">
                                        <MapPin className="w-3 h-3 mr-1" />
                                        <span>{workshop.location}</span>
                                    </div>

                                    <div className="flex items-center justify-between mb-3 bg-gray-50 p-2 rounded-lg border border-gray-100">
                                        <div className="flex flex-col">
                                            <span className="text-xs text-gray-500">Desde</span>
                                            <span className="font-bold text-blue-600 text-sm">
                                                ${workshop.basePrice.toLocaleString()}
                                            </span>
                                        </div>
                                        <div className="flex flex-col items-end">
                                            <span className="text-xs text-gray-500">Cupos Hoy</span>
                                            <span className={`font-bold text-sm flex items-center gap-1 ${workshop.availableSlots > 0 ? 'text-green-600' : 'text-red-500'}`}>
                                                <Calendar className="w-3 h-3" />
                                                {workshop.availableSlots}
                                            </span>
                                        </div>
                                    </div>

                                    <div className="flex flex-wrap gap-1 mb-3">
                                        {workshop.services.slice(0, 2).map((service, index) => (
                                            <span
                                                key={index}
                                                className="text-[10px] uppercase font-bold tracking-wider bg-slate-100 text-slate-600 px-2 py-1 rounded-full"
                                            >
                                                {service}
                                            </span>
                                        ))}
                                    </div>

                                    <button
                                        onClick={() => router.push(`/conductores/parking/${workshop.id}`)}
                                        className="w-full bg-blue-600 hover:bg-blue-700 text-white font-semibold py-2 px-4 rounded-lg transition-colors duration-200 flex items-center justify-center gap-2"
                                    >
                                        <Wrench className="w-4 h-4" />
                                        Agendar Visita
                                    </button>
                                </div>
                            </Popup>
                        </Marker>
                    );
                })}
            </MapContainer>

            <div className="absolute bottom-4 right-4 bg-white px-4 py-3 rounded-lg shadow-lg z-[1000] border border-gray-100">
                <div className="flex items-center gap-2 text-sm">
                    <div className="w-8 h-8 rounded-full bg-blue-50 flex items-center justify-center border border-blue-100">
                        <Wrench className="w-4 h-4 text-blue-600" />
                    </div>
                    <div className="flex flex-col">
                        <span className="font-bold text-gray-900 leading-none">
                            {workshops.length} Talleres
                        </span>
                        <span className="text-xs text-gray-500">Disponibles ahora</span>
                    </div>
                </div>
            </div>
        </div>
    );
});

LeafletMap.displayName = 'LeafletMap';

export default LeafletMap;
