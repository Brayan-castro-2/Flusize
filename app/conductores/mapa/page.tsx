'use client';
import { useState, useRef, useEffect } from 'react';
import { Search, MapPin, Loader2, Navigation, Wrench, Star, Calendar, Filter } from 'lucide-react';
import { useRouter } from 'next/navigation';
import dynamic from 'next/dynamic';
import { workshops as mockWorkshops, Workshop } from '@/lib/mockData';
import { getPendingCount } from '@/lib/appointmentStorage';
import Link from 'next/link';

// Dynamically import the map to avoid SSR issues
const MapWrapper = dynamic(() => import('@/components/drivers/MapWrapper'), {
    ssr: false,
    loading: () => (
        <div className="w-full h-full flex items-center justify-center bg-gray-100 rounded-xl">
            <Loader2 className="w-10 h-10 animate-spin text-blue-600" />
            <span className="ml-2 text-gray-600">Cargando mapa de talleres...</span>
        </div>
    )
});

export default function MapView() {
    const router = useRouter();
    const mapRef = useRef<any>(null);
    const [searchQuery, setSearchQuery] = useState('');
    const [selectedWorkshop, setSelectedWorkshop] = useState<Workshop | null>(null);
    const [isSearching, setIsSearching] = useState(false);
    const [workshops, setWorkshops] = useState<Workshop[]>([]);
    const [loading, setLoading] = useState(true);
    const [pendingCount, setPendingCount] = useState(0);

    useEffect(() => {
        // Simulate fetching data
        setTimeout(() => {
            setWorkshops(mockWorkshops);
            setLoading(false);
        }, 1000);

        // Update pending count
        setPendingCount(getPendingCount());
    }, []);

    const handleSearch = async (e: React.FormEvent) => {
        e.preventDefault();
        if (!searchQuery.trim()) return;

        setIsSearching(true);
        try {
            const response = await fetch(`https://nominatim.openstreetmap.org/search?format=json&q=${encodeURIComponent(searchQuery + ', Puerto Montt, Chile')}`);
            const data = await response.json();

            if (data && data.length > 0) {
                const { lat, lon } = data[0];
                const latNum = parseFloat(lat);
                const lngNum = parseFloat(lon);

                if (mapRef.current) {
                    mapRef.current.flyToLocation(latNum, lngNum, 15);
                }
            }
        } catch (error) {
            console.error("Error searching location:", error);
        } finally {
            setIsSearching(false);
        }
    };

    return (
        <div className="min-h-screen bg-gray-50 flex flex-col">
            {/* Navbar Simple for Driver Section */}
            <nav className="bg-white shadow-sm border-b border-gray-200 z-50">
                <div className="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8">
                    <div className="flex justify-between h-16">
                        <div className="flex items-center cursor-pointer" onClick={() => router.push('/')}>
                            <span className="font-extrabold text-2xl tracking-wide text-slate-900">FLUSIZE</span>
                            <span className="text-[0.6rem] font-medium text-blue-600 ml-1 mt-1 tracking-wider uppercase">Drivers</span>
                        </div>
                        <div className="flex items-center gap-4">
                            <Link href="/conductores/mis-citas">
                                <button className="text-sm text-gray-500 hover:text-gray-900 font-medium flex items-center gap-2">
                                    <Calendar className="w-4 h-4" />
                                    Mis Citas
                                    {pendingCount > 0 && (
                                        <span className="bg-blue-600 text-white text-xs font-bold px-2 py-0.5 rounded-full">
                                            {pendingCount}
                                        </span>
                                    )}
                                </button>
                            </Link>
                            <div className="h-8 w-8 rounded-full bg-blue-100 flex items-center justify-center text-blue-600 font-bold border border-blue-200">
                                J
                            </div>
                        </div>
                    </div>
                </div>
            </nav>

            {/* Search Bar */}
            <div className="bg-white shadow-sm p-4 z-10 sticky top-0">
                <div className="max-w-7xl mx-auto flex gap-4">
                    <form onSubmit={handleSearch} className="flex-1 relative">
                        <Search className="absolute left-3 top-1/2 transform -translate-y-1/2 text-gray-400 w-5 h-5" />
                        <input
                            type="text"
                            value={searchQuery}
                            onChange={(e) => setSearchQuery(e.target.value)}
                            placeholder="Buscar taller, servicio o ubicación..."
                            className="w-full pl-10 pr-4 py-3 border border-gray-200 rounded-lg focus:ring-2 focus:ring-blue-500 focus:border-transparent outline-none shadow-sm transition-all text-sm"
                        />
                    </form>
                    <button
                        onClick={handleSearch}
                        disabled={isSearching}
                        className="bg-blue-600 hover:bg-blue-700 text-white font-bold py-2 px-6 rounded-lg transition-colors flex items-center gap-2 shadow-sm text-sm"
                    >
                        {isSearching ? <Loader2 className="animate-spin w-5 h-5" /> : <Search className="w-5 h-5" />}
                        Buscar
                    </button>
                    <button className="bg-white border border-gray-200 text-gray-700 hover:bg-gray-50 font-bold py-2 px-4 rounded-lg transition-colors flex items-center gap-2 shadow-sm text-sm">
                        <Filter className="w-4 h-4" />
                        Filtros
                    </button>
                </div>
            </div>

            {/* Main Content */}
            <div className="flex-1 flex flex-col md:flex-row relative">
                {/* Map Container - Sticky on desktop, fixed height on mobile */}
                <div className="w-full md:w-1/2 lg:w-3/5 h-[50vh] md:h-[calc(100vh-144px)] md:sticky md:top-[144px] relative z-0 order-2 md:order-1">
                    <MapWrapper
                        ref={mapRef}
                        workshops={workshops} // Updated prop name
                        selectedId={selectedWorkshop?.id}
                        onSelect={(id: number) => {
                            const shop = workshops.find(s => s.id === id);
                            setSelectedWorkshop(shop || null);
                            // Scroll panel logic could go here
                        }}
                    />
                </div>

                {/* Workshops List / Details Panel */}
                <div className="w-full md:w-1/2 lg:w-2/5 bg-white shadow-xl overflow-y-auto z-20 border-l border-gray-200 order-1 md:order-2 h-[50vh] md:h-[calc(100vh-144px)]">
                    <div className="p-4">
                        <div className="flex justify-between items-center mb-4">
                            <h2 className="text-lg font-bold text-gray-800 flex items-center gap-2">
                                <Wrench className="w-5 h-5 text-blue-600" />
                                Talleres Recomendados
                            </h2>
                            <span className="text-xs text-gray-500 font-medium bg-gray-100 px-2 py-1 rounded-full">{workshops.length} resultados</span>
                        </div>

                        {loading ? (
                            <div className="flex justify-center py-8">
                                <Loader2 className="w-8 h-8 animate-spin text-blue-600" />
                            </div>
                        ) : (
                            <div className="space-y-4 pb-20">
                                {workshops.map((shop) => (
                                    <div
                                        key={shop.id}
                                        onClick={() => {
                                            setSelectedWorkshop(shop);
                                            if (mapRef.current) {
                                                mapRef.current.flyToLocation(shop.coordinates.lat, shop.coordinates.lng, 16);
                                            }
                                        }}
                                        className={`group relative bg-white border rounded-xl overflow-hidden cursor-pointer transition-all hover:shadow-md ${selectedWorkshop?.id === shop.id
                                            ? 'border-blue-500 ring-1 ring-blue-500'
                                            : 'border-gray-200 hover:border-gray-300'}`}
                                    >
                                        <div className="flex p-3 gap-4">
                                            {/* Left: Image & Rating */}
                                            <div className="w-24 h-24 flex-shrink-0 relative">
                                                <img
                                                    src={shop.image}
                                                    alt={shop.name}
                                                    className="w-full h-full object-cover rounded-lg"
                                                />
                                                <div className="absolute top-1 left-1 bg-white/90 backdrop-blur-sm px-1.5 py-0.5 rounded text-[10px] font-bold text-gray-800 flex items-center gap-0.5 shadow-sm border border-gray-100">
                                                    <Star className="w-3 h-3 text-yellow-500 fill-yellow-500" />
                                                    {shop.rating}
                                                </div>
                                            </div>

                                            {/* Right: Info */}
                                            <div className="flex-1 flex flex-col justify-between">
                                                <div>
                                                    <h3 className="font-bold text-gray-900 group-hover:text-blue-600 transition-colors line-clamp-1">{shop.name}</h3>
                                                    <p className="text-xs text-gray-500 flex items-center gap-1 mb-2">
                                                        <MapPin className="w-3 h-3" /> {shop.location}
                                                    </p>

                                                    {/* Services Tags */}
                                                    <div className="flex flex-wrap gap-1 mb-2">
                                                        {shop.specialties.slice(0, 2).map((s, i) => (
                                                            <span key={i} className="text-[10px] bg-slate-100 text-slate-600 px-1.5 py-0.5 rounded-md font-medium">
                                                                {s}
                                                            </span>
                                                        ))}
                                                    </div>
                                                </div>
                                            </div>
                                        </div>

                                        {/* Bottom Action Bar */}
                                        <div className="bg-gray-50 px-3 py-2 border-t border-gray-100 flex justify-between items-center">
                                            <div className="flex flex-col">
                                                <span className="text-[10px] text-gray-500 uppercase font-semibold">Cupos hoy</span>
                                                <div className={`flex items-center gap-1 font-bold text-sm ${shop.availableSlots > 0 ? 'text-green-600' : 'text-red-500'}`}>
                                                    <Calendar className="w-3 h-3" />
                                                    {shop.availableSlots > 0 ? `${shop.availableSlots} Disponibles` : 'Agotado'}
                                                </div>
                                            </div>

                                            <button
                                                className="bg-white border border-blue-600 text-blue-600 hover:bg-blue-50 font-bold py-1.5 px-4 rounded-lg text-xs transition-colors shadow-sm"
                                                onClick={(e) => {
                                                    e.stopPropagation();
                                                    router.push(`/conductores/parking/${shop.id}`);
                                                }}
                                            >
                                                Ver Perfil
                                            </button>
                                        </div>
                                    </div>
                                ))}
                            </div>
                        )}
                    </div>

                    {/* B2C Promo Banner */}
                    <div className="mx-4 mb-4 p-4 bg-gradient-to-r from-blue-600 to-cyan-500 rounded-xl text-white shadow-lg">
                        <div className="flex items-start gap-3">
                            <div className="bg-white/20 p-2 rounded-lg">
                                <Wrench className="w-6 h-6 text-white" />
                            </div>
                            <div>
                                <h3 className="font-bold text-sm mb-1">¿Tienes un taller?</h3>
                                <p className="text-xs text-blue-50 mb-3">Únete a la red Flusize y consigue más clientes hoy mismo.</p>
                                <button
                                    onClick={() => router.push('/registro-taller')}
                                    className="bg-white text-blue-600 text-xs font-bold px-3 py-1.5 rounded-lg shadow-sm hover:bg-blue-50 transition-colors"
                                >
                                    Registrar mi Taller
                                </button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    );
}
