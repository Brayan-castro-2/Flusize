'use client';
import { MapContainer, TileLayer } from 'react-leaflet';
import 'leaflet/dist/leaflet.css';

export default function FomoMapInner() {
    // Centro ajustado para mostrar la zona sur de Chile (Los Lagos/Los Ríos)
    return (
        <MapContainer
            center={[-41.0, -72.5]}
            zoom={6}
            zoomControl={false}
            scrollWheelZoom={false}
            dragging={false}
            doubleClickZoom={false}
            touchZoom={false}
            keyboard={false}
            style={{ height: '100%', width: '100%', background: '#0f172a' }} // match bg-slate-900
            className="z-0"
        >
            <TileLayer
                url="https://{s}.basemaps.cartocdn.com/dark_all/{z}/{x}/{y}{r}.png"
                attribution='&copy; <a href="https://www.openstreetmap.org/copyright">OSM</a>'
            />
        </MapContainer>
    );
}
