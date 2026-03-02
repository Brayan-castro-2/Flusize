'use client';

import { useState, useEffect } from 'react';
import { MapContainer, TileLayer, Marker, useMapEvents, useMap } from 'react-leaflet';
import L from 'leaflet';

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

// Sub-componente para manejar eventos de clic
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
        <div className="absolute top-2 right-2 z-[1000]">
            <button
                type="button"
                onClick={(e) => {
                    e.stopPropagation();
                    handleGetLocation();
                }}
                disabled={loading}
                className="bg-white hover:bg-slate-50 text-slate-900 text-[11px] font-bold px-3 py-2 rounded-lg shadow-xl border border-slate-200 flex items-center gap-2 transition-all active:scale-95 disabled:opacity-70"
            >
                {loading ? (
                    <span className="flex items-center gap-2">
                        <span className="w-3 h-3 border-2 border-slate-900 border-t-transparent rounded-full animate-spin" />
                        Obteniendo...
                    </span>
                ) : (
                    <>📍 Usar mi ubicación actual</>
                )}
            </button>
        </div>
    );
}

// Sub-componente para sincronizar la vista del mapa con el estado externo sin re-iniciar el contenedor
function MapViewHandler({ position }: { position: [number, number] | null }) {
    const map = useMap();
    useEffect(() => {
        if (position) {
            map.setView(position, map.getZoom());
        }
    }, [position, map]);
    return null;
}

export default function MapPicker({ onChange, initialLat, initialLng }: MapPickerProps) {
    const defaultCenter: [number, number] = [-33.4489, -70.6693]; // Santiago, Chile
    const [position, setPosition] = useState<[number, number] | null>(null);

    // Solo inicializar position desde props una vez o cuando cambien significativamente
    useEffect(() => {
        if (initialLat && initialLng && !position) {
            const lat = parseFloat(initialLat);
            const lng = parseFloat(initialLng);
            if (!isNaN(lat) && !isNaN(lng)) {
                setPosition([lat, lng]);
            }
        }
    }, [initialLat, initialLng, position]);

    return (
        <div className="relative h-[300px] w-full rounded-xl overflow-hidden border border-slate-700 shadow-inner group bg-slate-950">
            <MapContainer
                center={defaultCenter}
                zoom={13}
                scrollWheelZoom={false}
                className="h-full w-full z-0"
            >
                <TileLayer
                    attribution='&copy; <a href="https://www.openstreetmap.org/copyright">OpenStreetMap</a> contributors'
                    url="https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png"
                />

                <ClickHandler onChange={onChange} setPosition={setPosition} />
                <GpsControl onChange={onChange} setPosition={setPosition} />
                <MapViewHandler position={position} />

                {position && <Marker position={position} />}
            </MapContainer>

            <div className="absolute bottom-2 left-2 z-[1000] bg-slate-900/80 backdrop-blur-sm px-2 py-1 rounded text-[10px] text-slate-400 border border-slate-700 pointer-events-none opacity-0 group-hover:opacity-100 transition-opacity">
                Haz clic para marcar manual
            </div>
        </div>
    );
}
