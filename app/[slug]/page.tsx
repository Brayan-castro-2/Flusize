'use client';

import { useState, useEffect } from 'react';
import { useParams, useRouter } from 'next/navigation';
import { supabase } from '@/lib/supabase';
import {
    MapPin,
    ChevronLeft,
    MessageCircle,
    AlertCircle,
    Instagram,
    ExternalLink,
    Share2,
    CheckCircle2,
    Clock,
    Globe,
    Star,
    Phone,
    Calendar,
    Award,
    ShieldCheck,
    ArrowRight
} from 'lucide-react';
import { motion, AnimatePresence } from 'framer-motion';
import { Button } from '@/components/ui/button';

interface WorkshopData {
    id: string;
    nombre: string;
    direccion: string | null;
    telefono: string | null;
    whatsapp: string | null;
    descripcion: string | null;
    logo_url: string | null;
    slug: string | null;
    instagram: string | null;
    facebook: string | null;
    ciudad: string | null;
    region: string | null;
    sitio_web: string | null;
    reconocimiento: string | null;
    estadisticas: string | null;
    portada_url: string | null;
    color_primario: string | null;
    reconocimientos?: { icon: string; label: string }[];
}

export default function WorkshopDetail() {
    const params = useParams();
    const router = useRouter();
    const slugOrId = params?.slug as string;

    const [workshop, setWorkshop] = useState<WorkshopData | null>(null);
    const [loading, setLoading] = useState(true);
    const [error, setError] = useState<string | null>(null);

    useEffect(() => {
        async function loadWorkshop() {
            if (!slugOrId) return;

            // Intentar por Slug primero
            let { data, error } = await supabase
                .from('talleres')
                .select('*')
                .eq('slug', slugOrId)
                .maybeSingle();

            // Si no hay slug, intentar por ID (soporte fallback)
            if (!data) {
                const isUUID = /^[0-9a-f]{8}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{12}$/i.test(slugOrId);
                if (isUUID || !error) {
                    const { data: idData, error: idError } = await supabase
                        .from('talleres')
                        .select('*')
                        .eq('id', slugOrId)
                        .maybeSingle();

                    data = idData;
                    error = idError;
                }
            }

            if (error) {
                console.error('Error fetching workshop:', error);
                setError('Error al cargar la información del taller.');
            } else if (!data) {
                setError('Taller no encontrado.');
            } else {
                setWorkshop(data);
            }
            setLoading(false);
        }
        loadWorkshop();
    }, [slugOrId]);

    // Fetch Gallery Photos (Last works)
    const [gallery, setGallery] = useState<string[]>([]);

    useEffect(() => {
        async function loadGallery() {
            if (!workshop) return;
            
            const { data: orders } = await supabase
                .from('ordenes')
                .select('fotos_urls')
                .eq('taller_id', workshop.id)
                .eq('estado', 'entregada')
                .limit(4);

            if (orders) {
                const photos = orders.flatMap(o => o.fotos_urls || []).slice(0, 6);
                setGallery(photos);
            }
        }
        if (workshop) loadGallery();
    }, [workshop]);

    if (loading) {
        return (
            <div className="min-h-screen bg-slate-50 flex flex-col items-center justify-center">
                <div className="relative">
                    <div className="w-16 h-16 border-4 border-blue-100 border-t-blue-600 rounded-full animate-spin"></div>
                    <img src="/logo_flusize.png" alt="Flusize" className="absolute inset-0 m-auto w-6 h-6 animate-pulse" />
                </div>
                <p className="mt-4 text-xs font-black text-slate-400 uppercase tracking-widest">Generando Experiencia...</p>
            </div>
        );
    }

    if (error || !workshop) {
        return (
            <div className="min-h-screen bg-[#020617] flex flex-col items-center justify-center p-6 text-center">
                <div className="w-20 h-20 bg-red-950/30 rounded-full flex items-center justify-center mb-6 border border-red-900/50">
                    <AlertCircle className="w-10 h-10 text-red-500" />
                </div>
                <h2 className="text-2xl font-black text-white mb-2 tracking-tight">{error || 'Taller no encontrado'}</h2>
                <button
                    onClick={() => router.push('/conductores/mapa')}
                    className="mt-8 px-8 py-3.5 bg-violet-600 text-white rounded-2xl hover:bg-violet-500 transition-all font-bold shadow-lg shadow-violet-600/20 active:scale-95"
                >
                    Volver al Explorador
                </button>
            </div>
        );
    }

    const tel = workshop.whatsapp || workshop.telefono || '';
    const telefonoLimpio = tel.replace(/\D/g, '');
    const phoneWithCode = telefonoLimpio.startsWith('56') ? telefonoLimpio : `56${telefonoLimpio}`;
    const waMsg = encodeURIComponent(`Hola ${workshop.nombre}, vengo de Flusize. Necesito cotizar un servicio.`);
    const waLink = telefonoLimpio ? `https://wa.me/${phoneWithCode}?text=${waMsg}` : '';

    // Lógica de Branding "Titán"
    const isSteelmonkey = workshop.slug === 'steelmonkey';
    const finalLogoUrl = isSteelmonkey ? '/steelmonkey-profile.png' : (workshop.logo_url || 'https://images.unsplash.com/photo-1614164185128-e4ec99c436d7?q=80&w=200&h=200&auto=format&fit=crop');

    // Opening Hours Logic
    const isNowOpen = () => {
        if (!workshop.horario) return true; // Default to true if not set
        const now = new Date();
        const days = ['domingo', 'lunes', 'martes', 'miercoles', 'jueves', 'viernes', 'sabado'];
        const dayName = days[now.getDay()];
        const todaySchedule = (workshop.horario as any)?.[dayName];
        
        if (!todaySchedule || !todaySchedule.abierto) return false;
        
        const [hStart, mStart] = todaySchedule.inicio.split(':').map(Number);
        const [hEnd, mEnd] = todaySchedule.fin.split(':').map(Number);
        const currentTime = now.getHours() * 60 + now.getMinutes();
        const startTime = hStart * 60 + mStart;
        const endTime = hEnd * 60 + mEnd;
        
        return currentTime >= startTime && currentTime <= endTime;
    };

    return (
        <div className="min-h-screen bg-white text-slate-900 font-sans pb-24">
            {/* 1. HERO SECTION PREMIUM */}
            <div className="relative h-[40vh] md:h-[50vh] w-full overflow-hidden">
                {/* Background Cover */}
                <div className="absolute inset-0 w-full h-full">
                    {workshop.portada_url ? (
                        <img src={workshop.portada_url} alt="" className="w-full h-full object-cover" />
                    ) : (
                        <div className="w-full h-full bg-gradient-to-br from-blue-600 to-indigo-900" />
                    )}
                    <div className="absolute inset-0 bg-gradient-to-t from-white via-white/20 to-black/30" />
                </div>

                {/* Top Actions */}
                <div className="absolute top-6 left-4 right-4 flex justify-between items-center z-10">
                    <button 
                        onClick={() => router.push('/conductores/mapa')}
                        className="w-10 h-10 bg-white/20 backdrop-blur-md rounded-full flex items-center justify-center text-white border border-white/20"
                    >
                        <ChevronLeft className="w-6 h-6" />
                    </button>
                    <button className="w-10 h-10 bg-white/20 backdrop-blur-md rounded-full flex items-center justify-center text-white border border-white/20">
                        <Share2 className="w-5 h-5" />
                    </button>
                </div>

                {/* Profile Identity - Overlapping Hero */}
                <div className="absolute -bottom-16 left-0 right-0 flex flex-col items-center px-6">
                    <div className="relative">
                        <div className="w-32 h-32 md:w-36 md:h-36 rounded-full border-[6px] border-white bg-white shadow-2xl overflow-hidden">
                            <img src={finalLogoUrl} alt={workshop.nombre} className="w-full h-full object-cover" />
                        </div>
                        <div className="absolute bottom-1 right-1 w-8 h-8 bg-blue-600 rounded-full border-4 border-white flex items-center justify-center shadow-lg">
                            <CheckCircle2 className="w-4 h-4 text-white" />
                        </div>
                    </div>
                </div>
            </div>

            {/* 2. BODY CONTENT */}
            <div className="mt-20 px-6 max-w-2xl mx-auto flex flex-col items-center">
                {/* Header Info */}
                <div className="text-center space-y-2 mb-8">
                    <h1 className="text-3xl md:text-4xl font-black text-slate-900 tracking-tight">{workshop.nombre}</h1>
                    <div className="flex items-center justify-center gap-3">
                        <div className="flex items-center gap-1 bg-amber-50 px-2.5 py-1 rounded-full border border-amber-100">
                            <Star className="w-3.5 h-3.5 fill-amber-400 text-amber-400" />
                            <span className="text-xs font-black text-amber-700">4.9</span>
                        </div>
                        <div className="flex items-center gap-1 bg-blue-50 px-2.5 py-1 rounded-full border border-blue-100">
                            <ShieldCheck className="w-3.5 h-3.5 text-blue-600" />
                            <span className="text-[10px] font-black text-blue-700 uppercase tracking-tighter">Taller Verificado</span>
                        </div>
                        <div className={`flex items-center gap-1 ${isNowOpen() ? 'bg-emerald-50 border-emerald-100' : 'bg-red-50 border-red-100'} px-2.5 py-1 rounded-full border`}>
                            <div className={`w-1.5 h-1.5 rounded-full ${isNowOpen() ? 'bg-emerald-500 animate-pulse' : 'bg-red-500'}`} />
                            <span className={`text-[10px] font-black ${isNowOpen() ? 'text-emerald-700' : 'text-red-700'} uppercase tracking-tighter`}>
                                {isNowOpen() ? 'Abierto' : 'Cerrado'}
                            </span>
                        </div>
                    </div>
                    <p className="text-sm font-bold text-slate-500 max-w-xs mx-auto mt-4 px-4 leading-relaxed">
                        {workshop.descripcion || "Servicio técnico automotriz especializado en atención multimarca."}
                    </p>
                </div>

                {/* 3. STICKY ACTIONS AREA */}
                <div className="w-full space-y-4 mb-12">
                    {/* Pulsing Booking Button */}
                    <motion.div 
                        initial={{ scale: 1 }}
                        animate={{ scale: [1, 1.02, 1] }}
                        transition={{ duration: 2, repeat: Infinity, ease: "easeInOut" }}
                        className="relative group"
                    >
                        <div className="absolute -inset-1 bg-blue-600 rounded-[2.5rem] blur opacity-25 group-hover:opacity-40 transition duration-1000" />
                        <Button 
                            onClick={() => {
                                const msg = encodeURIComponent(`Hola ${workshop.nombre}, me gustaría agendar una hora para mi vehículo a través de Flusize.`);
                                window.open(`https://wa.me/${phoneWithCode}?text=${msg}`, '_blank');
                            }}
                            className="relative w-full h-16 rounded-[2rem] bg-blue-600 text-white hover:bg-blue-700 font-black text-base shadow-xl border-none flex items-center justify-between px-8"
                        >
                            <div className="flex items-center gap-3">
                                <Calendar className="w-6 h-6" />
                                <span>Agendar Cita Online</span>
                            </div>
                            <ArrowRight className="w-5 h-5 group-hover:translate-x-1 transition-transform" />
                        </Button>
                    </motion.div>

                    <div className="grid grid-cols-2 gap-4">
                        {waLink && (
                            <a href={waLink} target="_blank" className="flex items-center justify-center gap-3 h-14 bg-emerald-500 text-white rounded-3xl font-black text-sm shadow-lg hover:shadow-emerald-200 transition-all active:scale-95">
                                <MessageCircle className="w-5 h-5" /> WhatsApp
                            </a>
                        )}
                        <a href={`tel:${tel}`} className="flex items-center justify-center gap-3 h-14 bg-slate-900 text-white rounded-3xl font-black text-sm shadow-lg hover:shadow-slate-400 transition-all active:scale-95">
                            <Phone className="w-5 h-5" /> Llamar
                        </a>
                    </div>
                </div>

                {/* 4. GALLERY (TRABAJOS RECIENTES) */}
                <div className="w-full space-y-4 mb-12 text-left">
                    <div className="flex items-center justify-between">
                        <h3 className="text-xl font-black text-slate-900 tracking-tight">Trabajos Recientes</h3>
                        <div className="px-2.5 py-1 bg-slate-100 rounded-lg text-[10px] font-black text-slate-500 uppercase tracking-widest">En Tiempo Real</div>
                    </div>
                    
                    <div className="grid grid-cols-2 md:grid-cols-3 gap-3">
                        {gallery.length > 0 ? (
                            gallery.map((url, i) => (
                                <div key={i} className="aspect-square rounded-2xl overflow-hidden border border-slate-100 shadow-sm transition-transform hover:scale-[1.02]">
                                    <img src={url} alt={`Trabajo ${i}`} className="w-full h-full object-cover" />
                                </div>
                            ))
                        ) : (
                            // Placeholders
                            [1,2,3,4].map((i) => (
                                <div key={i} className="aspect-square rounded-2xl overflow-hidden border border-slate-100 bg-slate-50 flex items-center justify-center group">
                                    <img 
                                        src={`https://images.unsplash.com/photo-1486262715619-67b85e0b08d3?q=80&w=600&auto=format&fit=crop&sig=${i}`} 
                                        alt="" 
                                        className="w-full h-full object-cover opacity-80" 
                                    />
                                    <div className="absolute inset-0 bg-black/10 transition-opacity group-hover:opacity-0" />
                                </div>
                            ))
                        )}
                    </div>
                </div>

                {/* 5. UBICACIÓN & HORARIOS */}
                <div className="w-full bg-slate-50 rounded-[2.5rem] p-8 border border-slate-100 space-y-6 mb-12">
                    <div className="flex items-start gap-4">
                        <div className="w-12 h-12 bg-white rounded-2xl shadow-sm flex items-center justify-center border border-slate-100 shrink-0">
                            <MapPin className="w-6 h-6 text-blue-600" />
                        </div>
                        <div>
                            <h4 className="font-black text-slate-900 leading-tight mb-1 text-lg">Nuestra Casa</h4>
                            <p className="text-sm font-bold text-slate-500 leading-snug">{workshop.direccion || "Dirección no disponible"}</p>
                            <p className="text-xs font-black text-slate-400 mt-1 uppercase tracking-widest">{workshop.ciudad}, {workshop.region}</p>
                        </div>
                    </div>

                    <div className="relative h-40 w-full rounded-2xl overflow-hidden shadow-inner border border-slate-200">
                        {/* Static map placeholder */}
                        <img 
                            src={`https://api.mapbox.com/styles/v1/mapbox/streets-v11/static/pin-s-car+3b47fb(${workshop.longitud || -72.94},${workshop.latitud || -41.46})/${workshop.longitud || -72.94},${workshop.latitud || -41.46},15,0/600x400@2x?access_token=pk.eyJ1IjoiZmx1c2l6ZSIsImEiOiJjbGozeWd5ZWowaGQyM2VudjVwZzY1ZzR0In0.X_b_b-b-b-b-b-b-b-b-b-b`} 
                            alt="Mapa de ubicación"
                            className="w-full h-full object-cover"
                        />
                        <div className="absolute bottom-3 right-3 bg-white px-3 py-1.5 rounded-full shadow-lg border border-slate-100">
                            <span className="text-[10px] font-black text-blue-600 uppercase tracking-widest">Abrir en Waze</span>
                        </div>
                    </div>

                    <div className="space-y-3 pt-2">
                        <div className="flex items-center gap-2 mb-4">
                            <Clock className="w-4 h-4 text-slate-400" />
                            <h4 className="text-xs font-black text-slate-400 uppercase tracking-widest">Horario de Atención</h4>
                        </div>
                        {['lunes', 'viernes', 'sabado'].map((day) => {
                            const sched = (workshop.horario as any)?.[day] || { inicio: '09:00', fin: '18:00', abierto: day !== 'sabado' };
                            return (
                                <div key={day} className="flex justify-between items-center px-2">
                                    <span className="text-xs font-black text-slate-800 capitalize tracking-tight">{day}</span>
                                    <span className="text-xs font-bold text-slate-500">
                                        {sched.abierto ? `${sched.inicio} — ${sched.fin}` : 'Cerrado'}
                                    </span>
                                </div>
                            );
                        })}
                    </div>
                </div>

                {/* 6. LOOP VIRAL (BRANDING FLUSIZE) */}
                <div className="w-full bg-gradient-to-br from-slate-900 to-black rounded-[2.5rem] p-10 text-center relative overflow-hidden shadow-2xl">
                    {/* Abstract shapes */}
                    <div className="absolute -top-20 -right-20 w-40 h-40 bg-blue-600/20 rounded-full blur-3xl" />
                    <div className="absolute -bottom-20 -left-20 w-40 h-40 bg-blue-400/10 rounded-full blur-3xl" />
                    
                    <img src="/logo_flusize.png" alt="Flusize" className="w-10 h-10 mx-auto mb-6 opacity-30 grayscale invert" />
                    <h3 className="text-2xl font-black text-white tracking-tight mb-4">¿Tienes un Taller?</h3>
                    <p className="text-slate-400 font-bold mb-8 text-sm leading-relaxed max-w-xs mx-auto">
                        Digitaliza tu negocio, gestiona órdenes y fideliza a tus clientes como un Titán.
                    </p>
                    <Button 
                        onClick={() => router.push('/registro-taller')}
                        className="h-14 px-8 rounded-full bg-blue-600 hover:bg-white hover:text-blue-600 text-white font-black text-xs transition-all border-none"
                    >
                        REGÍSTRATE GRATIS
                    </Button>
                </div>

                <p className="mt-12 text-[#ccc] text-[10px] font-black tracking-[0.3em] uppercase">
                    Trusted by Flusize Cloud
                </p>
            </div>
        </div>
    );
}
