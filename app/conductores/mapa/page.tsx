'use client';
import { useState, useRef, useEffect, Suspense, useMemo } from 'react';
import { Search, MapPin, Loader2, Wrench, Star, Calendar, Filter, User, ChevronUp, ChevronDown, Bell, CheckCircle2, AlertTriangle, ChevronLeft, X, MessageCircle, Locate } from 'lucide-react';
import { motion, AnimatePresence } from 'framer-motion';
import { Button } from '@/components/ui/button';
import { useRouter, useSearchParams } from 'next/navigation';
import dynamic from 'next/dynamic';
import { Workshop } from '@/lib/mockData';
import Link from 'next/link';
import { useAuth } from '@/contexts/auth-context';
import { toast } from 'sonner';
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
    const [userLocation, setUserLocation] = useState<{lat: number, lng: number} | null>(null);

    const filterParam = searchParams.get('filter');
    const isEmergency = searchParams.get('emergency') === 'true';

    // Auth and Notifications
    const { user } = useAuth();
    const [notifEstado, setNotifEstado] = useState<string | null>(null);

    // Bottom sheet state for mobile
    const [isSheetExpanded, setIsSheetExpanded] = useState(false);
    const [showSOSMenu, setShowSOSMenu] = useState(false);
    const [activeCategory, setActiveCategory] = useState<string>('todos');
    const [isListView, setIsListView] = useState(false);
    const [isListExpanded, setIsListExpanded] = useState(false);
    const [isEmergencyActive, setIsEmergencyActive] = useState(false);
    const [mapCommand, setMapCommand] = useState<{ lat: number, lng: number, zoom: number, ts: number } | null>(null);

    const categories = [
        { label: 'Mecánica', icon: '🛠️', filter: 'mecan' },
        { label: 'Vulcas', icon: '🚗', filter: 'vulca' },
        { label: 'Cerrajeros', icon: '🔑', filter: 'cerraj' },
        { label: 'Detailing', icon: '✨', filter: 'detail' },
    ];

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
                        setUserLocation({ lat: latitude, lng: longitude });
                        setMapCommand({ lat: latitude, lng: longitude, zoom: 16, ts: Date.now() });
                        toast.info('Ubicación Detectada', {
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
                            toast.success('Estado de Orden', {
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
            const normalize = (str: string) => str.normalize("NFD").replace(/[\u0300-\u036f]/g, "").toLowerCase();
            const query = normalize(searchQuery.trim());
            
            // Search in local workshops instead of Nominatim
            const foundWorkshop = allWorkshops.find(shop => 
                normalize(shop.name).includes(query) || 
                normalize(shop.location).includes(query) ||
                (shop.slug && normalize(shop.slug).includes(query)) ||
                shop.specialties.some(s => normalize(s).includes(query))
            );

            if (foundWorkshop) {
                setSelectedWorkshop(foundWorkshop);
                setIsSheetExpanded(true);
                setMapCommand({ lat: foundWorkshop.coordinates.lat, lng: foundWorkshop.coordinates.lng, zoom: 17, ts: Date.now() });
                toast.success('Taller encontrado', { 
                    description: `Mostrando detalles de ${foundWorkshop.name}` 
                });
            } else {
                // FALLBACK: If not a workshop name, try searching for location (legacy behavior but improved)
                const geoQuery = encodeURIComponent(`${searchQuery}, Puerto Montt, Los Lagos, Chile`);
                const response = await fetch(`https://nominatim.openstreetmap.org/search?format=json&q=${geoQuery}&limit=1`);
                const data = await response.json();

                if (data && data.length > 0) {
                    const { lat, lon } = data[0];
                    setMapCommand({ lat: parseFloat(lat), lng: parseFloat(lon), zoom: 16, ts: Date.now() });
                    toast.info('Ubicación encontrada', { description: 'Mostrando resultados cercanos a esta área.' });
                } else {
                    toast.info('Sin resultados', { description: 'No encontramos talleres con ese nombre o ubicación.' });
                }
            }
        } catch (error) {
            console.error("Error searching:", error);
            toast.error('Error de búsqueda', { description: 'No pudimos procesar la solicitud.' });
        } finally {
            setIsSearching(false);
        }
    };

    const displayedWorkshops = useMemo(() => {
        if (!searchQuery.trim()) return workshops;
        const normalize = (str: string) => str.normalize("NFD").replace(/[\u0300-\u036f]/g, "").toLowerCase();
        const query = normalize(searchQuery.trim());
        return workshops.filter(shop => 
            normalize(shop.name).includes(query) || 
            normalize(shop.location).includes(query) ||
            (shop.slug && normalize(shop.slug).includes(query)) ||
            (shop.specialties && shop.specialties.some(s => normalize(s).includes(query)))
        );
    }, [workshops, searchQuery]);

    return (
        <div className="h-[100dvh] w-full relative overflow-hidden bg-slate-100 flex flex-col font-sans">
            {/* Efecto Modo Emergencia */}
            <AnimatePresence>
                {isEmergencyActive && (
                    <motion.div
                        initial={{ opacity: 0 }}
                        animate={{ opacity: 1 }}
                        exit={{ opacity: 0 }}
                        className="absolute inset-0 z-[9999] bg-red-500/20 pointer-events-none flex items-center justify-center backdrop-blur-sm"
                    >
                        <motion.div
                            initial={{ scale: 0.9, opacity: 0 }}
                            animate={{ scale: 1, opacity: 1 }}
                            exit={{ scale: 0.9, opacity: 0 }}
                            className="bg-white p-6 rounded-3xl shadow-2xl max-w-sm text-center border-2 border-red-500/50"
                        >
                            <div className="w-16 h-16 bg-red-100 rounded-full flex items-center justify-center mx-auto mb-4">
                                <Loader2 className="w-8 h-8 text-red-500 animate-spin" />
                            </div>
                            <h3 className="text-xl font-black text-slate-900 mb-2">Buscando unidades...</h3>
                            <p className="text-slate-600 font-medium text-sm">Lo sentimos, no hay unidades disponibles por el momento en tu zona.</p>
                        </motion.div>
                    </motion.div>
                )}
            </AnimatePresence>

            {/* 1. Map container (Background 100%) */}
            <div className={`absolute inset-0 z-0 transition-transform duration-500`}>
                <MapWrapper
                    ref={mapRef}
                    workshops={displayedWorkshops}
                    selectedId={selectedWorkshop?.id ? String(selectedWorkshop.id) : undefined}
                    userLocation={userLocation}
                    mapCommand={mapCommand}
                    onSelect={(id: string | number) => {
                        const shop = workshops.find(s => String(s.id) === String(id));
                        if (shop) {
                            setSelectedWorkshop(shop);
                            setIsSheetExpanded(true);
                            setMapCommand({ lat: shop.coordinates.lat, lng: shop.coordinates.lng, zoom: 17, ts: Date.now() });
                        }
                    }}
                    onDoubleClick={(id: string | number) => {
                        const shop = workshops.find(s => String(s.id) === String(id));
                        if (shop) {
                            router.push(`/${shop.slug || shop.id}`);
                        }
                    }}
                />
            </div>

            {/* VISTA DE LISTA (Full overlay, controlled by isListView) */}
            <div className={`absolute inset-0 z-[100] bg-slate-50 flex flex-col transition-opacity duration-300 ${isListView ? 'opacity-100 pointer-events-auto' : 'opacity-0 pointer-events-none'}`}>
                <div className="pt-40 pb-24 overflow-y-auto flex-1">
                    <div className="max-w-xl mx-auto px-4 space-y-4">
                        {displayedWorkshops.map(shop => (
                            <div key={shop.id} className="bg-white rounded-3xl p-4 shadow-sm border border-slate-100 flex gap-4">
                                <img src={shop.image} alt={shop.name} className="w-24 h-24 rounded-2xl object-cover shrink-0" />
                                <div className="flex flex-col flex-1 py-1">
                                    <div className="flex justify-between items-start mb-1">
                                        <h3 className="font-black text-slate-900 text-lg leading-tight">{shop.name}</h3>
                                        <div className="flex items-center gap-1 text-yellow-500 text-xs font-bold bg-yellow-50 px-2 py-0.5 rounded-md shrink-0">
                                            <Star className="w-3 h-3 fill-current" /> {shop.rating}
                                        </div>
                                    </div>
                                    <p className="text-xs text-slate-500 font-medium line-clamp-1 mb-2">{shop.location}</p>
                                    <div className="flex flex-wrap gap-1 mb-3">
                                        {shop.specialties.slice(0, 2).map((s, i) => (
                                            <span key={i} className="text-[9px] font-black uppercase tracking-wider bg-slate-100 text-slate-600 px-2 py-0.5 rounded-md">
                                                {s}
                                            </span>
                                        ))}
                                        {shop.specialties.length > 2 && <span className="text-[9px] font-black uppercase text-slate-400">+{shop.specialties.length - 2}</span>}
                                    </div>
                                    <div className="mt-auto flex justify-end">
                                        <Button onClick={() => router.push(`/${shop.slug || shop.id}`)} size="sm" className="bg-blue-600 text-white hover:bg-blue-700 rounded-xl text-xs font-bold px-4">
                                            Agendar Cita
                                        </Button>
                                    </div>
                                </div>
                            </div>
                        ))}
                        {displayedWorkshops.length === 0 && (
                            <div className="text-center py-20">
                                <Wrench className="w-12 h-12 text-slate-300 mx-auto mb-4" />
                                <p className="text-slate-500 font-bold">No hay talleres para esta búsqueda</p>
                            </div>
                        )}
                    </div>
                </div>
            </div>

            {/* 2. Floating Top Bar Area */}
            <div className="absolute top-4 left-0 right-0 z-[500] px-4 md:px-6 space-y-4">
                <div className="max-w-xl mx-auto md:mx-0 flex items-center gap-3">
                    {/* Back Button */}
                    <button
                        onClick={() => router.push('/')}
                        className="w-10 h-10 md:w-12 md:h-12 bg-white/95 backdrop-blur-xl shadow-[0_15px_35px_rgba(0,0,0,0.06)] rounded-full md:rounded-3xl flex items-center justify-center border border-white/50 hover:bg-white hover:scale-105 active:scale-95 transition-all outline-none shrink-0"
                    >
                        <ChevronLeft className="text-slate-700 w-5 h-5 md:w-6 md:h-6" />
                    </button>

                    {/* Search Bar - Slim Version */}
                    <form
                        onSubmit={handleSearch}
                        className="flex-1 bg-white/95 backdrop-blur-xl shadow-[0_15px_35px_rgba(0,0,0,0.06)] rounded-full md:rounded-3xl flex items-center px-4 h-10 md:h-12 border-none transition-all focus-within:ring-2 focus-within:ring-blue-500/30 min-w-0"
                    >
                        <Search className="w-4 h-4 text-slate-400 mr-3 shrink-0" />
                        <input
                            type="text"
                            value={searchQuery}
                            onChange={(e) => setSearchQuery(e.target.value)}
                            placeholder="Buscar talleres, servicios..."
                            className="bg-transparent flex-1 w-full outline-none text-[13px] font-bold !text-slate-900 !placeholder-slate-500"
                        />
                        {isSearching && <Loader2 className="w-4 h-4 animate-spin text-blue-600 shrink-0 ml-2" />}
                    </form>

                    {/* User Profile */}
                    <button
                        onClick={() => router.push('/mi-garage')}
                        className="w-10 h-10 md:w-12 md:h-12 bg-white shadow-[0_15px_35px_rgba(0,0,0,0.06)] rounded-full flex items-center justify-center border border-white/50 hover:bg-slate-50 transition-all shrink-0"
                    >
                        <User className="w-5 h-5 md:w-5 md:h-5 text-slate-700" />
                    </button>
                </div>

                {/* 3. Filtros Rápidos (Pills) con Scroll Horizontal */}
                <div className="max-w-xl mx-auto md:mx-0 flex items-center gap-2 overflow-x-auto pb-2 scrollbar-hide no-scrollbar px-4 py-2 whitespace-nowrap">
                    {/* Botón "Todos" para limpiar filtros */}
                    <button
                        onClick={() => {
                            setWorkshops(allWorkshops);
                            setActiveCategory('todos');
                        }}
                        className={`whitespace-nowrap flex items-center gap-2 px-4 py-2.5 rounded-full text-xs font-black transition-all active:scale-95 border ${
                            activeCategory === 'todos' 
                            ? 'bg-blue-600 text-white border-blue-600 shadow-lg shadow-blue-500/20' 
                            : 'bg-white/95 backdrop-blur-xl text-slate-900 border-none shadow-[0_15px_25px_rgba(0,0,0,0.04)]'
                        }`}
                    >
                        <span>🌐</span>
                        <span>Todos</span>
                    </button>

                    {categories.map((cat, idx) => (
                        <button
                            key={idx}
                            onClick={() => {
                                if (activeCategory === cat.filter) {
                                    setWorkshops(allWorkshops);
                                    setActiveCategory('todos');
                                    return;
                                }

                                const normalize = (str: string) => str.normalize("NFD").replace(/[\u0300-\u036f]/g, "").toLowerCase();
                                const filterStr = normalize(cat.filter);
                                const filtered = allWorkshops.filter(shop =>
                                    shop.specialties && Array.isArray(shop.specialties) && 
                                    shop.specialties.some(s => normalize(s).includes(filterStr))
                                );
                                
                                setWorkshops(filtered);
                                setActiveCategory(cat.filter);
                                toast.info(`Filtrando: ${cat.label}`, { description: `${filtered.length} talleres encontrados.` });
                            }}
                            className={`whitespace-nowrap flex items-center gap-2 px-4 py-2.5 rounded-full text-xs font-black transition-all active:scale-95 border ${
                                activeCategory === cat.filter 
                                ? 'bg-blue-600 text-white border-blue-600 shadow-lg shadow-blue-500/20' 
                                : 'bg-white/95 backdrop-blur-xl text-slate-900 border-none shadow-[0_15px_25px_rgba(0,0,0,0.04)]'
                            }`}
                        >
                            <span className="text-base">{cat.icon}</span>
                            <span>{cat.label}</span>
                        </button>
                    ))}
                </div>

                {/* 3.1 Workshop Info Card (Moved from LeafletMap) */}
                <div className="hidden md:block transition-all duration-300">
                    <div className="bg-white/95 backdrop-blur-xl px-4 py-3 rounded-3xl shadow-[0_15px_35px_rgba(0,0,0,0.06)] border border-white/50 flex items-center gap-3 w-fit">
                        <div className="w-10 h-10 rounded-2xl bg-blue-600 flex items-center justify-center shadow-[0_8px_15px_rgba(37,99,235,0.2)] shrink-0">
                            <Wrench className="w-5 h-5 text-white" />
                        </div>
                        <div className="flex flex-col">
                            <span className="font-black text-slate-800 text-sm leading-none mb-0.5">
                                {workshops.length} Talleres
                            </span>
                            <span className="text-[10px] text-slate-500 font-bold uppercase tracking-wider">Cerca de ti</span>
                        </div>
                    </div>
                </div>
            </div>

            {/* 4. BOTONES FLOTANTES IZQUIERDA (SOS Y UBICACIÓN) */}
            <div className={`absolute bottom-[18vh] md:bottom-10 right-4 z-[500] flex flex-col items-end gap-3 transition-all duration-500 ${selectedWorkshop ? 'translate-y-[-20vh] md:translate-y-0' : ''} ${isListExpanded ? 'opacity-0 pointer-events-none translate-y-4' : 'opacity-100'}`}>
                {/* Geolocation Button */}
                <button
                    onClick={(e) => {
                        e.stopPropagation();
                        if (navigator.geolocation) {
                            navigator.geolocation.getCurrentPosition(
                                (position) => {
                                    const { latitude, longitude } = position.coords;
                                    setUserLocation({ lat: latitude, lng: longitude });
                                    setMapCommand({ lat: latitude, lng: longitude, zoom: 16, ts: Date.now() });
                                }
                            );
                        }
                    }}
                    className="w-12 h-12 md:w-14 md:h-14 bg-white text-blue-600 shadow-[0_15px_35px_rgba(0,0,0,0.1)] hover:bg-white hover:scale-105 flex items-center justify-center rounded-2xl md:rounded-3xl transition-all active:scale-95 group border border-slate-100"
                    title="Mi ubicación"
                >
                    <Locate className="w-5 h-5 md:w-6 md:h-6 group-hover:scale-110 transition-transform" />
                </button>

                <div className="relative">
                    <div
                        className={`absolute bottom-0 right-20 bg-white/95 backdrop-blur-xl rounded-[2.5rem] p-4 shadow-[0_25px_60px_rgba(220,38,38,0.15)] border border-red-50 mb-0 w-56 space-y-2 z-[501] origin-bottom-right transition-all duration-300 ${showSOSMenu ? 'scale-100 opacity-100 pointer-events-auto' : 'scale-0 opacity-0 pointer-events-none'}`}
                    >
                                <p className="text-[10px] font-black text-red-500 uppercase tracking-widest px-3 mb-2">Asistencia VIP 24/7</p>
                                <button 
                                    onClick={() => {
                                        setShowSOSMenu(false);
                                        setIsEmergencyActive(true);
                                        setTimeout(() => setIsEmergencyActive(false), 4000);
                                    }}
                                    className="w-full text-left px-4 py-3 rounded-2xl text-slate-700 text-xs font-bold hover:bg-red-50 flex items-center gap-3 transition-colors"
                                >
                                    <span className="text-lg">🚜</span>
                                    Grúa 24/7
                                </button>
                                <button 
                                    onClick={() => {
                                        setShowSOSMenu(false);
                                        setIsEmergencyActive(true);
                                        setTimeout(() => setIsEmergencyActive(false), 4000);
                                    }}
                                    className="w-full text-left px-4 py-3 rounded-2xl text-slate-700 text-xs font-bold hover:bg-red-50 flex items-center gap-3 transition-colors"
                                >
                                    <span className="text-lg">🔑</span>
                                    Cerrajeros Móvil
                                </button>
                                <button 
                                    onClick={() => {
                                        setShowSOSMenu(false);
                                        setIsEmergencyActive(true);
                                        setTimeout(() => setIsEmergencyActive(false), 4000);
                                    }}
                                    className="w-full text-left px-4 py-3 rounded-2xl text-slate-700 text-xs font-bold hover:bg-red-50 flex items-center gap-3 transition-colors"
                                >
                                    <span className="text-lg">🚗</span>
                                    Vulca a Domicilio
                                </button>
                    </div>
                    
                    <button
                        onClick={() => setShowSOSMenu(!showSOSMenu)}
                        className="w-14 h-14 md:w-16 md:h-16 bg-red-600 text-white shadow-[0_20px_40px_rgba(220,38,38,0.3)] hover:bg-red-700 rounded-full flex items-center justify-center transition-all active:scale-95 group relative border-4 border-white"
                    >
                        <div className="absolute inset-0 bg-red-500 rounded-full animate-ping opacity-25" />
                        <AlertTriangle className="w-6 h-6 md:w-8 md:h-8 group-hover:scale-110 transition-transform relative z-10" />
                    </button>
                </div>
            </div>

            {/* BOTÓN FLOTANTE VER LISTA / VER MAPA */}
            <div className="absolute bottom-6 left-1/2 -translate-x-1/2 z-[400]">
                <button
                    onClick={() => setIsListView(!isListView)}
                    className="bg-slate-900 text-white font-black text-sm px-6 py-3.5 rounded-full shadow-[0_15px_30px_rgba(0,0,0,0.2)] flex items-center gap-2 hover:scale-105 active:scale-95 transition-all border border-slate-700"
                >
                    {isListView ? (
                        <>
                            <MapPin className="w-4 h-4 text-cyan-400" />
                            Ver Mapa
                        </>
                    ) : (
                        <>
                            <Search className="w-4 h-4 text-cyan-400" />
                            Ver Lista
                        </>
                    )}
                </button>
            </div>

            {/* 5. BOTTOM SHEET (EL RADAR) */}
            <AnimatePresence>
                {selectedWorkshop && (
                    <motion.div
                        initial={{ y: "100%" }}
                        animate={{ y: isSheetExpanded ? 0 : "75%" }}
                        transition={{ duration: 0.5, ease: [0.32, 0.72, 0, 1] }}
                        className="absolute bottom-0 left-0 right-0 z-[600] md:left-6 md:bottom-6 md:right-auto md:w-[420px] bg-white rounded-t-[2.5rem] md:rounded-[2.5rem] shadow-[0_-15px_60px_rgba(0,0,0,0.1)] border-t border-slate-100 md:border overflow-hidden flex flex-col max-h-[85vh]"
                    >
                        {/* Drag indicator (Mobile only) */}
                        <div 
                            className="md:hidden w-full h-8 flex items-center justify-center cursor-pointer"
                            onClick={() => setIsSheetExpanded(!isSheetExpanded)}
                        >
                            <div className="w-12 h-1.5 bg-slate-200 rounded-full" />
                        </div>

                        {/* FOTO TALLER CABECERA (Solo expanded) */}
                        <div className="relative h-48 md:h-56 shrink-0">
                            <img
                                src={selectedWorkshop.image}
                                alt={selectedWorkshop.name}
                                className="w-full h-full object-cover"
                            />
                            <div className="absolute inset-0 bg-gradient-to-t from-black/80 via-transparent to-transparent" />
                            <button 
                                onClick={() => setSelectedWorkshop(null)}
                                className="absolute top-4 right-4 w-8 h-8 bg-black/30 backdrop-blur-md rounded-full flex items-center justify-center text-white border border-white/20"
                            >
                                <X className="w-5 h-5" />
                            </button>

                            <div className="absolute bottom-4 left-6 right-6">
                                <div className="flex items-center gap-2 mb-2">
                                    <div className="bg-blue-600 text-white text-[9px] font-black uppercase tracking-widest px-2.5 py-1 rounded-lg flex items-center gap-1.5 shadow-lg border border-blue-400">
                                        <CheckCircle2 className="w-3 h-3" /> Taller Verificado
                                    </div>
                                    <div className="bg-white/20 backdrop-blur-md text-white text-[9px] font-black px-2.5 py-1 rounded-lg border border-white/20">
                                        ⭐ {selectedWorkshop.rating}
                                    </div>
                                </div>
                                <h3 className="text-2xl font-black text-white leading-tight tracking-tight">{selectedWorkshop.name}</h3>
                            </div>
                        </div>

                        {/* INFO & ACCIONES */}
                        <div className="flex-1 overflow-y-auto px-6 py-6 space-y-6">
                            <div className="flex items-start gap-3">
                                <MapPin className="w-5 h-5 text-blue-600 shrink-0 mt-0.5" />
                                <p className="text-[13px] font-bold text-slate-600 leading-snug">{selectedWorkshop.location}</p>
                            </div>

                            <div className="space-y-3">
                                <h4 className="text-[11px] font-black text-slate-400 uppercase tracking-widest">Especialidades</h4>
                                <div className="flex flex-wrap gap-2">
                                    {selectedWorkshop.specialties.map((s, i) => (
                                        <span key={i} className="px-3 py-1.5 bg-slate-50 text-slate-700 text-[11px] font-black rounded-xl border border-slate-100 uppercase tracking-tighter">
                                            {s}
                                        </span>
                                    ))}
                                </div>
                            </div>

                            <div className="h-px bg-slate-100" />

                            <div className="grid grid-cols-2 gap-3">
                                <Button className="h-14 rounded-3xl bg-emerald-500 text-white hover:bg-emerald-600 border-none font-black text-xs shadow-[0_10px_20px_rgba(16,185,129,0.2)]">
                                    <MessageCircle className="w-5 h-5 mr-2" /> WhatsApp
                                </Button>
                                <Button className="h-14 rounded-3xl bg-blue-500 text-white hover:bg-blue-600 border-none font-black text-xs shadow-[0_10px_20px_rgba(59,130,246,0.2)]">
                                    <Bell className="w-5 h-5 mr-2" /> Llamar
                                </Button>
                            </div>

                            <Button 
                                onClick={() => router.push(`/${selectedWorkshop.slug || selectedWorkshop.id}`)}
                                className="w-full h-16 rounded-[2.5rem] bg-slate-900 text-white hover:bg-black font-black text-sm shadow-[0_20px_40px_rgba(0,0,0,0.15)] tracking-tight transition-all active:scale-[0.98]"
                            >
                                Agendar Cita en Taller
                            </Button>
                        </div>
                    </motion.div>
                )}
            </AnimatePresence>
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
