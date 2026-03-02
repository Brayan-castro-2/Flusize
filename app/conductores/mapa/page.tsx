'use client';
import { useState, useRef, useEffect, Suspense } from 'react';
import { Search, MapPin, Loader2, Wrench, Star, Calendar, Filter, User, ChevronUp, ChevronDown, Bell, CheckCircle2, AlertTriangle } from 'lucide-react';
import { useRouter, useSearchParams } from 'next/navigation';
import dynamic from 'next/dynamic';
import { Workshop } from '@/lib/mockData';
import Link from 'next/link';
import { useAuth } from '@/contexts/auth-context';
import { sileo } from 'sileo';
import {
    DropdownMenu,
    DropdownMenuContent,
    DropdownMenuItem,
    DropdownMenuLabel,
    DropdownMenuSeparator,
    DropdownMenuTrigger,
} from '@/components/ui/dropdown-menu';

// Dynamically import the map to avoid SSR issues
const MapWrapper = dynamic(() => import('@/components/drivers/MapWrapper'), {
    ssr: false,
    loading: () => (
        <div className="w-full h-full flex items-center justify-center bg-slate-100">
            <Loader2 className="w-8 h-8 animate-spin text-blue-600" />
        </div>
    )
});

function MapViewContent() {
    const router = useRouter();
    const searchParams = useSearchParams();
    const mapRef = useRef<any>(null);
    const [searchQuery, setSearchQuery] = useState('');
    const [selectedWorkshop, setSelectedWorkshop] = useState<Workshop | null>(null);
    const [isSearching, setIsSearching] = useState(false);
    const [workshops, setWorkshops] = useState<Workshop[]>([]);
    const [allWorkshops, setAllWorkshops] = useState<Workshop[]>([]);
    const [loading, setLoading] = useState(true);

    const filterParam = searchParams.get('filter');
    const isEmergency = searchParams.get('emergency') === 'true';

    // Auth and Notifications
    const { user } = useAuth();
    const [notifEstado, setNotifEstado] = useState<string | null>(null);

    // Bottom sheet state for mobile
    const [isSheetExpanded, setIsSheetExpanded] = useState(false);

    useEffect(() => {
        const fetchTalleres = async () => {
            const { supabase } = await import('@/lib/supabase');
            const { data, error } = await supabase
                .from('talleres')
                .select('*')
                .eq('activo', true)
                .eq('mostrar_en_mapa', true);

            if (data && !error) {
                const mappedWorkshops: Workshop[] = data.map((taller: any) => ({
                    id: taller.id,
                    name: taller.nombre,
                    manager: "Administrador",
                    location: taller.direccion || "Ubicación no disponible",
                    basePrice: 0,
                    rating: 5.0,
                    reviews: 0,
                    distance: "N/A",
                    image: taller.logo_url || "https://images.unsplash.com/photo-1619642751034-765dfdf7c58e?auto=format&fit=crop&q=80&w=600",
                    coordinates: { lat: taller.latitud || -41.4693, lng: taller.longitud || -72.9424 },
                    services: taller.etiquetas_servicios || [],
                    description: taller.descripcion || "",
                    availability: "Consulte horario",
                    specialties: taller.etiquetas_servicios || [],
                    availableSlots: 10,
                    whatsapp: taller.whatsapp || taller.telefono || undefined,
                    slug: taller.slug
                }));

                setAllWorkshops(mappedWorkshops);

                // Apply initial emergency filter if present
                if (filterParam) {
                    const filtered = mappedWorkshops.filter(shop =>
                        shop.specialties.some((s: string) => s.toLowerCase().includes(filterParam.toLowerCase()))
                    );
                    setWorkshops(filtered.length > 0 ? filtered : mappedWorkshops);
                } else {
                    setWorkshops(mappedWorkshops);
                }
            } else {
                setWorkshops([]);
                setAllWorkshops([]);
            }
            setLoading(false);
        };

        fetchTalleres();
    }, [filterParam]);

    // Handle Auto-Geolocation in Emergency Mode
    useEffect(() => {
        if (isEmergency && !loading && mapRef.current) {
            if (navigator.geolocation) {
                navigator.geolocation.getCurrentPosition(
                    (position) => {
                        const { latitude, longitude } = position.coords;
                        mapRef.current.flyToLocation(latitude, longitude, 15);
                        sileo.info({
                            title: 'Ubicación Detectada',
                            description: 'Buscando talleres especializados cerca de ti.',
                            position: "top-center"
                        });
                    },
                    (error) => {
                        console.error("Geolocation error:", error);
                    }
                );
            }
        }
    }, [isEmergency, loading]);

    // ──────────────────────────────────────────
    // NOTIFICACIONES EN TIEMPO REAL
    // ──────────────────────────────────────────
    useEffect(() => {
        if (!user) return;

        const setupRealtime = async () => {
            const { supabase } = await import('@/lib/supabase');
            const channel = supabase
                .channel('ordenes-tracker-map')
                .on(
                    'postgres_changes',
                    {
                        event: 'UPDATE',
                        schema: 'public',
                        table: 'ordenes',
                    },
                    (payload) => {
                        if (payload.new.cliente_id === user.id) {
                            sileo.success({
                                title: 'Estado de Orden',
                                description: `Actualizado a: ${payload.new.estado.replace('_', ' ')}`,
                                position: "top-center"
                            });
                            setNotifEstado(payload.new.estado);
                        }
                    }
                )
                .subscribe();

            return () => {
                supabase.removeChannel(channel);
            };
        };

        const cleanup = setupRealtime();

        return () => {
            cleanup.then(unsub => unsub && unsub());
        };
    }, [user]);

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
        <div className="h-[100dvh] w-full relative overflow-hidden bg-slate-100 flex flex-col font-sans">
            {/* 1. Map container (Background 100%) */}
            <div className={`absolute inset-0 z-0 transition-transform duration-500`}>
                <MapWrapper
                    ref={mapRef}
                    workshops={workshops}
                    selectedId={selectedWorkshop?.id ? String(selectedWorkshop.id) : undefined}
                    onSelect={(id: string | number) => {
                        const shop = workshops.find(s => s.id === id);
                        setSelectedWorkshop(shop || null);
                        setIsSheetExpanded(true); // Auto-expand sheet when selecting a pin on mobile
                    }}
                />
            </div>

            {/* Emergency Banner */}
            {isEmergency && (
                <div className="absolute top-[80px] md:top-[100px] left-1/2 -translate-x-1/2 z-[600] w-[90%] max-w-lg">
                    <div className="bg-red-600 text-white p-4 rounded-2xl shadow-[0_15px_40px_rgba(220,38,38,0.4)] flex items-center gap-4 animate-bounce-subtle border-b-4 border-red-800">
                        <div className="w-12 h-12 bg-white/20 rounded-xl flex items-center justify-center shrink-0">
                            <AlertTriangle className="w-7 h-7" />
                        </div>
                        <div>
                            <p className="text-xs font-black uppercase tracking-widest opacity-80">Asistencia Activa</p>
                            <p className="text-sm font-bold">Localizando talleres para: <span className="underline">{filterParam || 'Emergencia'}</span></p>
                        </div>
                    </div>
                </div>
            )}

            {/* 2. Floating Top Bar */}
            <div className="absolute top-4 left-4 right-4 md:top-6 md:left-6 md:right-auto md:w-[460px] z-[500] flex items-center gap-2">
                {/* Back Button */}
                <button
                    onClick={() => router.push('/')}
                    className="w-14 h-14 bg-white/95 backdrop-blur-md shadow-lg shadow-slate-200/50 rounded-2xl flex items-center justify-center border border-slate-100 hover:bg-slate-50 hover:scale-105 active:scale-95 transition-all outline-none shrink-0 focus:ring-2 focus:ring-blue-500/50"
                    aria-label="Volver al inicio"
                >
                    <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth="2.5" strokeLinecap="round" strokeLinejoin="round" className="text-slate-700 w-6 h-6"><path d="m12 19-7-7 7-7" /><path d="M19 12H5" /></svg>
                </button>

                {/* Search Bar */}
                <form
                    onSubmit={handleSearch}
                    className="flex-1 bg-white/95 backdrop-blur-md shadow-lg shadow-slate-200/50 rounded-2xl flex items-center px-4 h-14 border border-slate-100 transition-all hover:shadow-xl focus-within:ring-2 focus-within:ring-blue-500/50"
                >
                    <Search className="w-5 h-5 text-slate-400 mr-3 shrink-0" />
                    <input
                        type="text"
                        value={searchQuery}
                        onChange={(e) => setSearchQuery(e.target.value)}
                        placeholder="Buscar talleres, servicios..."
                        className="bg-transparent flex-1 w-full outline-none text-sm font-semibold text-slate-800 placeholder:text-slate-400"
                    />
                    {isSearching ? (
                        <Loader2 className="w-4 h-4 animate-spin text-blue-600 shrink-0 ml-2" />
                    ) : (
                        <button type="button" className="p-1 rounded-full hover:bg-slate-100 transition-colors ml-1 shrink-0">
                            <Filter className="w-4 h-4 text-slate-400" />
                        </button>
                    )}
                </form>

                {/* Controles Derechos */}
                <div className="flex items-center justify-end gap-2 shrink-0">
                    {/* Campanita */}
                    <DropdownMenu>
                        <DropdownMenuTrigger asChild>
                            <button className="w-14 h-14 bg-white/95 backdrop-blur-md shadow-lg shadow-slate-200/50 rounded-full flex items-center justify-center border border-slate-100 hover:bg-slate-50 hover:scale-105 active:scale-95 transition-all outline-none relative focus:ring-2 focus:ring-blue-500/50">
                                <Bell className="w-6 h-6 text-slate-700" />
                                {notifEstado && (
                                    <span className="absolute top-3 right-3 w-3 h-3 bg-red-500 border-2 border-white rounded-full animate-pulse"></span>
                                )}
                            </button>
                        </DropdownMenuTrigger>
                        <DropdownMenuContent align="end" className="w-64 p-2 rounded-2xl shadow-xl border-slate-100 z-50">
                            <DropdownMenuLabel className="font-bold text-[10px] uppercase tracking-widest text-slate-400 mb-2 inline-flex items-center gap-1.5 px-2">
                                <Bell className="w-3 h-3" />
                                Notificaciones
                            </DropdownMenuLabel>
                            {notifEstado ? (
                                <div className="p-3 bg-gradient-to-tr from-blue-50 to-cyan-50 rounded-xl border border-blue-100 mb-1">
                                    <p className="text-[11px] text-blue-800/70 font-bold uppercase tracking-wide mb-1">Tu orden activa está:</p>
                                    <div className="flex items-center gap-2">
                                        <div className="w-2 h-2 rounded-full bg-blue-500 animate-pulse"></div>
                                        <p className="text-sm font-black text-blue-700 uppercase tracking-tight">{notifEstado.replace('_', ' ')}</p>
                                    </div>
                                </div>
                            ) : (
                                <div className="py-6 px-4 flex flex-col items-center text-center">
                                    <div className="w-8 h-8 rounded-full bg-slate-50 flex items-center justify-center mb-2">
                                        <CheckCircle2 className="w-4 h-4 text-slate-300" />
                                    </div>
                                    <p className="text-xs font-semibold text-slate-500">Estás al día</p>
                                    <p className="text-[10px] font-medium text-slate-400 mt-0.5">No hay actualizaciones recientes.</p>
                                </div>
                            )}
                        </DropdownMenuContent>
                    </DropdownMenu>

                    {/* Profile Button to /mi-garage */}
                    <button
                        onClick={() => router.push('/mi-garage')}
                        className="w-14 h-14 bg-white/95 backdrop-blur-md shadow-lg shadow-slate-200/50 rounded-full flex items-center justify-center border border-slate-100 hover:bg-slate-50 hover:scale-105 active:scale-95 transition-all focus:outline-none focus:ring-2 focus:ring-blue-500/50"
                        aria-label="Mi Garage"
                    >
                        <User className="w-6 h-6 text-slate-700" />
                    </button>
                </div>
            </div>

            {/* 3. Floating Bottom Sheet (Mobile) / Side Panel (Desktop) */}
            <div
                className={`
                    absolute left-0 right-0 z-40 bg-white shadow-[0_-8px_30px_rgb(0,0,0,0.12)] border-t border-slate-100
                    md:top-24 md:left-6 md:bottom-6 md:right-auto md:w-[400px] md:rounded-3xl md:border md:shadow-2xl
                    flex flex-col transition-all duration-500 ease-[cubic-bezier(0.32,0.72,0,1)]
                    rounded-t-3xl
                    ${isSheetExpanded ? 'bottom-0 h-[85vh] md:h-auto' : 'bottom-0 h-[22vh] md:h-auto'}
                `}
            >
                {/* Drag Handle & Header */}
                <div
                    className="flex flex-col shrink-0 md:cursor-auto cursor-pointer"
                    onClick={() => setIsSheetExpanded(!isSheetExpanded)}
                >
                    {/* Handle Pill */}
                    <div className="md:hidden w-full pt-3 pb-2 flex justify-center items-center">
                        <div className="w-12 h-1.5 bg-slate-200 rounded-full" />
                    </div>

                    {/* Title */}
                    <div className="px-6 py-3 flex justify-between items-center">
                        <div className="flex flex-col">
                            <h2 className="text-xl font-black text-slate-800 tracking-tight flex items-center gap-2">
                                <Wrench className="w-5 h-5 text-blue-600" />
                                {isEmergency ? 'Auxilio Cercano' : 'Talleres Premium'}
                            </h2>
                            <p className="text-[10px] font-bold text-slate-400 uppercase tracking-widest mt-1">
                                {loading ? 'Buscando...' : `${workshops.length} Cerca de ti`}
                            </p>
                        </div>

                        <button className="md:hidden w-8 h-8 rounded-full bg-slate-50 flex items-center justify-center text-slate-500 hover:bg-slate-100 border border-slate-200">
                            {isSheetExpanded ? <ChevronDown className="w-5 h-5" /> : <ChevronUp className="w-5 h-5" />}
                        </button>
                    </div>
                </div>

                {/* Content Area */}
                <div className={`flex-1 overflow-y-auto px-4 sm:px-6 pb-20 md:pb-6 space-y-4 ${!isSheetExpanded ? 'hidden md:block mt-4' : 'block mt-2'}`}>
                    {loading ? (
                        <div className="flex-1 flex flex-col items-center justify-center py-12">
                            <Loader2 className="w-8 h-8 animate-spin text-blue-600 mb-4" />
                            <p className="text-sm font-semibold text-slate-500">Cargando mapa...</p>
                        </div>
                    ) : (
                        <>
                            {workshops.length === 0 && (
                                <div className="py-12 px-6 text-center">
                                    <div className="w-16 h-16 bg-slate-50 rounded-full flex items-center justify-center mx-auto mb-4 border border-slate-100">
                                        <Search className="w-8 h-8 text-slate-300" />
                                    </div>
                                    <p className="text-slate-800 font-black text-sm mb-1 uppercase tracking-tight">Sin resultados exactos</p>
                                    <p className="text-xs text-slate-500 font-bold mb-6">No hay talleres especializados en {filterParam} en esta zona específica.</p>
                                    <button
                                        onClick={() => setWorkshops(allWorkshops)}
                                        className="text-blue-600 text-[10px] font-black uppercase tracking-widest bg-blue-50 px-4 py-2 rounded-xl hover:bg-blue-100 transition-colors"
                                    >
                                        Ver todos los talleres
                                    </button>
                                </div>
                            )}
                            {workshops.map((shop) => (
                                <div
                                    key={shop.id}
                                    onClick={(e) => {
                                        e.stopPropagation();
                                        setSelectedWorkshop(shop);
                                        if (mapRef.current) {
                                            mapRef.current.flyToLocation(shop.coordinates.lat, shop.coordinates.lng, 16);
                                        }
                                        const profileSlug = shop.slug?.startsWith('steelmonkey') ? 'steelmonkey' : (shop.slug || shop.id);
                                        router.push(`/${profileSlug}`);
                                    }}
                                    className={`
                                        group relative bg-white rounded-2xl overflow-hidden cursor-pointer transition-all duration-300
                                        border-2 
                                        ${selectedWorkshop?.id === shop.id
                                            ? 'border-blue-500 shadow-md transform scale-[1.02]'
                                            : 'border-slate-100 hover:border-blue-200 hover:shadow-sm'}
                                    `}
                                >
                                    <div className="p-3">
                                        <div className="flex gap-4">
                                            {/* Image */}
                                            <div className="w-24 h-24 flex-shrink-0 relative rounded-xl overflow-hidden shadow-sm">
                                                <img
                                                    src={shop.image}
                                                    alt={shop.name}
                                                    className="w-full h-full object-cover group-hover:scale-110 transition-transform duration-500"
                                                />
                                                <div className="absolute top-1.5 left-1.5 bg-white backdrop-blur-md px-1.5 py-0.5 rounded-md text-[10px] font-black text-slate-800 flex items-center gap-1 shadow-sm border border-white/50">
                                                    <Star className="w-3 h-3 text-yellow-500 fill-yellow-500" />
                                                    {shop.rating}
                                                </div>
                                            </div>

                                            {/* Info */}
                                            <div className="flex-1 flex flex-col justify-center min-w-0 py-1">
                                                <h3 className="text-base font-black text-slate-800 leading-tight group-hover:text-blue-600 transition-colors truncate mb-1">
                                                    {shop.name}
                                                </h3>
                                                <p className="text-[11px] font-semibold text-slate-500 flex items-center gap-1 mb-2 truncate">
                                                    <MapPin className="w-3.5 h-3.5 text-slate-400 shrink-0" />
                                                    <span className="truncate">{shop.location}</span>
                                                </p>

                                                {/* Tags */}
                                                <div className="flex flex-wrap gap-1">
                                                    {shop.specialties.slice(0, 2).map((s, i) => (
                                                        <span key={i} className="text-[9px] uppercase tracking-wider font-bold bg-slate-100/80 text-slate-600 px-2 py-1 rounded-md">
                                                            {s}
                                                        </span>
                                                    ))}
                                                </div>
                                            </div>
                                        </div>
                                    </div>

                                    <div
                                        className={`
                                            px-4 py-3 border-t flex justify-between items-center transition-colors
                                            ${selectedWorkshop?.id === shop.id ? 'bg-blue-50 border-blue-100' : 'bg-slate-50/50 border-slate-100 group-hover:bg-slate-100/80'}
                                        `}
                                    >
                                        <div className="flex items-center gap-1.5">
                                            {!shop.slug?.startsWith('steelmonkey') && (
                                                <>
                                                    <div className={`w-2 h-2 rounded-full ${shop.availableSlots > 0 ? 'bg-emerald-500' : 'bg-amber-500'}`} />
                                                    <span className={`text-[10px] font-bold uppercase tracking-wider ${shop.availableSlots > 0 ? 'text-emerald-700' : 'text-amber-700'}`}>
                                                        {shop.availableSlots > 0 ? `${shop.availableSlots} Cupos` : 'Sin Cupo'}
                                                    </span>
                                                </>
                                            )}
                                        </div>
                                        <div className="text-blue-600 text-[10px] font-black uppercase tracking-widest flex items-center gap-1 group-hover:translate-x-1 transition-transform">
                                            Ver Perfil →
                                        </div>
                                    </div>
                                </div>
                            ))}
                        </>
                    )}
                </div>
            </div>

            {/* Promo Banner / Action Add-on - Hidden on mobile unless sheet expanded, normally desktop */}
            <div className={`hidden md:block absolute bottom-6 right-6 z-40 bg-slate-900 text-white p-5 rounded-3xl shadow-2xl max-w-sm border border-slate-700`}>
                <div className="flex items-start gap-4">
                    <div className="w-12 h-12 bg-white/10 rounded-2xl flex items-center justify-center shrink-0 shadow-inner border border-white/5">
                        <Wrench className="w-6 h-6 text-blue-400" />
                    </div>
                    <div>
                        <h3 className="font-black text-sm mb-1 text-slate-50">Gestiona tu Taller</h3>
                        <p className="text-xs text-slate-400 mb-4 leading-relaxed font-medium">Únete a Flusize y obtén más visibilidad para tu negocio local instantáneamente.</p>
                        <button
                            onClick={() => router.push('/registro-taller')}
                            className="bg-white text-slate-900 text-xs font-black uppercase tracking-wider px-4 py-2.5 rounded-xl shadow-[0_0_15px_rgba(255,255,255,0.2)] hover:shadow-[0_0_20px_rgba(255,255,255,0.4)] transition-all active:scale-95 w-full flex justify-center items-center"
                        >
                            Registrar Mi Taller
                        </button>
                    </div>
                </div>
            </div>
        </div>
    );
}

export default function MapView() {
    return (
        <Suspense fallback={
            <div className="h-screen w-full flex flex-col items-center justify-center bg-slate-50">
                <div className="relative mb-8">
                    <div className="w-20 h-20 border-4 border-blue-100 border-t-blue-600 rounded-full animate-spin" />
                    <div className="absolute inset-0 flex items-center justify-center">
                        <img src="/logo_flusize.png" alt="Flusize" className="w-8 h-8 object-contain animate-pulse" />
                    </div>
                </div>
                <p className="text-sm font-black text-slate-800 uppercase tracking-[0.3em] animate-pulse">Cargando Ecosistema...</p>
            </div>
        }>
            <MapViewContent />
        </Suspense>
    );
}
