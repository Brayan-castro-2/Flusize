'use client';

import { useState, useEffect, useRef } from 'react';
import { MapContainer, TileLayer, Marker, useMapEvents, useMap } from 'react-leaflet';
import L from 'leaflet';
import { Search, Loader2 } from 'lucide-react';

// Corregir iconos de Leaflet en Next.js
import 'leaflet/dist/leaflet.css';

const DefaultIcon = L.icon({
    iconUrl: 'https://unpkg.com/leaflet@1.9.4/dist/images/marker-icon.png',
    shadowUrl: 'https://unpkg.com/leaflet@1.9.4/dist/images/marker-shadow.png',
    iconSize: [25, 41],
    iconAnchor: [12, 41],
});
L.Marker.prototype.options.icon = DefaultIcon;

interface MapPickerProps {
    onChange: (lat: string, lng: string) => void;
    initialLat?: string;
    initialLng?: string;
}

// Sub-componente para manejar eventos de clic en cualquier parte del mapa
function ClickHandler({ onChange, setPosition }: {
    onChange: (lat: string, lng: string) => void,
    setPosition: (pos: [number, number]) => void
}) {
    useMapEvents({
        click(e) {
            const { lat, lng } = e.latlng;
            const newPos: [number, number] = [lat, lng];
            setPosition(newPos);
            onChange(lat.toFixed(6), lng.toFixed(6));
        },
    });
    return null;
}

// Sub-componente para controlar el GPS y animaciones
function GpsControl({ onChange, setPosition }: {
    onChange: (lat: string, lng: string) => void,
    setPosition: (pos: [number, number]) => void
}) {
    const map = useMap();
    const [loading, setLoading] = useState(false);

    const handleGetLocation = () => {
        if (typeof window === 'undefined' || !navigator.geolocation) {
            alert("Tu navegador no soporta geolocalización.");
            return;
        }

        setLoading(true);
        navigator.geolocation.getCurrentPosition(
            (position) => {
                const { latitude, longitude } = position.coords;
                const newPos: [number, number] = [latitude, longitude];

                setPosition(newPos);
                onChange(latitude.toFixed(6), longitude.toFixed(6));
                map.flyTo(newPos, 16, { animate: true, duration: 1.5 });
                setLoading(false);
            },
            (error) => {
                setLoading(false);
                let msg = "No pudimos obtener tu ubicación.";
                if (error.code === 1) msg = "Permiso de ubicación denegado. Por favor, actívalo en tu navegador.";
                alert(msg);
            },
            { enableHighAccuracy: true, timeout: 10000 }
        );
    };

    return (
        <div className="absolute bottom-2 right-2 z-[1000]">
            <button
                type="button"
                onClick={(e) => {
                    e.stopPropagation();
                    e.preventDefault();
                    handleGetLocation();
                }}
                disabled={loading}
                className="bg-white hover:bg-slate-50 text-slate-900 text-[11px] font-bold px-3 py-2 rounded-lg shadow-xl border border-slate-200 flex items-center gap-2 transition-all active:scale-95 disabled:opacity-70"
            >
                {loading ? (
                    <span className="flex items-center gap-2">
                        <span className="w-3 h-3 border-2 border-slate-900 border-t-transparent rounded-full animate-spin" />
                        Obteniendo GPS...
                    </span>
                ) : (
                    <>📍 GPS Actual</>
                )}
            </button>
        </div>
    );
}

// Sub-componente para sincronizar la vista del mapa con el estado externo sin re-iniciar el contenedor entero (flyTo)
function MapViewHandler({ position }: { position: [number, number] | null }) {
    const map = useMap();
    useEffect(() => {
        if (position) {
            // Evita saltos bruscos si ya estamos muy cerca
            const currentCenter = map.getCenter();
            if (currentCenter.lat !== position[0] || currentCenter.lng !== position[1]) {
                map.flyTo(position, 16, { animate: true, duration: 1.5 });
            }
        }
    }, [position, map]);
    return null;
}

export default function MapPicker({ onChange, initialLat, initialLng }: MapPickerProps) {
    const defaultCenter: [number, number] = [-33.4489, -70.6693]; // Santiago, Chile
    const [position, setPosition] = useState<[number, number] | null>(null);

    const [searchQuery, setSearchQuery] = useState('');
    const [isSearching, setIsSearching] = useState(false);

    const markerRef = useRef<L.Marker>(null);

    // Sincronización inyectada desde propiedades (Inputs)
    useEffect(() => {
        if (initialLat && initialLng) {
            const lat = parseFloat(initialLat);
            const lng = parseFloat(initialLng);
            // Ignoramos si no difiere mucho de 'position'
            if (!isNaN(lat) && !isNaN(lng)) {
                if (!position || position[0] !== lat || position[1] !== lng) {
                    setPosition([lat, lng]);
                }
            }
        }
    }, [initialLat, initialLng]);

    const handleSearch = async (e: React.FormEvent) => {
        e.preventDefault();
        e.stopPropagation();
        if (!searchQuery.trim()) return;

        setIsSearching(true);
        try {
            // Geocoding gratuito via Nominatim OpenStreetMap
            const res = await fetch(`https://nominatim.openstreetmap.org/search?format=json&q=${encodeURIComponent(searchQuery + ", Chile")}&limit=1`);
            const data = await res.json();

            if (data && data.length > 0) {
                const lat = parseFloat(data[0].lat);
                const lng = parseFloat(data[0].lon);

                setPosition([lat, lng]);
                onChange(lat.toFixed(6), lng.toFixed(6));
                setSearchQuery(''); // Limpia el cajón luego de saltar
            } else {
                alert("Dirección no encontrada. Intenta especificar comuna.");
            }
        } catch (error) {
            console.error("Geocoding err:", error);
            alert("Error al buscar dirección.");
        } finally {
            setIsSearching(false);
        }
    };

    return (
        <div className="relative h-[400px] w-full rounded-xl overflow-hidden border border-slate-700 shadow-inner group flex flex-col bg-slate-950">
            {/* Buscador Integrado Superior Nominatim */}
            <div className="p-2 bg-slate-900 border-b border-slate-800 z-[1000] flex-shrink-0">
                <form onSubmit={handleSearch} className="relative">
                    <Search className="absolute left-3 top-1/2 -translate-y-1/2 w-4 h-4 text-slate-500" />
                    <input
                        type="text"
                        value={searchQuery}
                        onChange={(e) => setSearchQuery(e.target.value)}
                        placeholder="Buscar calle o comuna... (ej: Providencia 123)"
                        className="w-full bg-slate-950 border border-slate-700 rounded-lg pl-9 pr-24 py-2.5 text-xs text-slate-200 placeholder-slate-500 focus:outline-none focus:border-violet-500 focus:ring-1 focus:ring-violet-500/30 transition-colors"
                        disabled={isSearching}
                    />
                    <button
                        type="submit"
                        disabled={isSearching || !searchQuery.trim()}
                        className="absolute right-1.5 top-1/2 -translate-y-1/2 bg-violet-600 hover:bg-violet-500 disabled:bg-slate-800 disabled:text-slate-500 text-white text-[10px] font-bold px-3 py-1.5 rounded-md transition-colors flex items-center gap-1 uppercase"
                    >
                        {isSearching ? <Loader2 className="w-3 h-3 animate-spin" /> : 'Buscar'}
                    </button>
                </form>
            </div>

            <MapContainer
                center={position || defaultCenter}
                zoom={14}
                maxZoom={19} // CRITICO: Evita pixelamiento rompiendo el limite de tiles de OSM
                scrollWheelZoom={true}
                className="flex-1 w-full z-0"
            >
                <TileLayer
                    maxZoom={19}
                    attribution='&copy; <a href="https://www.openstreetmap.org/copyright">OpenStreetMap</a> contributors'
                    url="https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png"
                />

                <ClickHandler onChange={onChange} setPosition={setPosition} />
                <GpsControl onChange={onChange} setPosition={setPosition} />
                <MapViewHandler position={position} />

                {position && (
                    <Marker
                        position={position}
                        draggable={true} // Se habilita el DRAG & DROP
                        ref={markerRef}
                        eventHandlers={{
                            dragend() {
                                const marker = markerRef.current;
                                if (marker != null) {
                                    const { lat, lng } = marker.getLatLng();
                                    setPosition([lat, lng]);
                                    onChange(lat.toFixed(6), lng.toFixed(6));
                                }
                            },
                        }}
                    />
                )}
            </MapContainer>

            <div className="absolute bottom-2 left-2 z-[1000] bg-slate-900/80 backdrop-blur-sm px-2 py-1 flex items-center gap-1.5 rounded text-[10px] text-slate-400 border border-slate-700 pointer-events-none">
                <span className="w-1.5 h-1.5 rounded-full bg-violet-500 animate-pulse"></span>
                Puedes arrastrar el pin libremente
            </div>
        </div>
    );
}
