'use client';

import { useState, useEffect } from 'react';
import { useParams, useRouter } from 'next/navigation';
import { supabase } from '@/lib/supabase';
import {
    MapPin,
    ChevronLeft,
    Wrench,
    MessageCircle,
    AlertCircle,
    Instagram,
    Facebook,
    Globe,
    Trophy,
    Zap,
    ShieldCheck,
    Star
} from 'lucide-react';

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

    if (loading) {
        return (
            <div className="min-h-screen bg-[#020617] flex items-center justify-center">
                <div className="w-12 h-12 border-[3px] border-violet-900/30 border-t-violet-500 rounded-full animate-spin"></div>
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

    // Contacto
    const tel = workshop.whatsapp || workshop.telefono || '';
    const telefonoLimpio = tel.replace(/\D/g, '');
    const phoneWithCode = telefonoLimpio.startsWith('56') ? telefonoLimpio : `56${telefonoLimpio}`;
    const waMsg = encodeURIComponent(`Hola ${workshop.nombre}, vengo de Flusize. Necesito cotizar un servicio.`);
    const waLink = telefonoLimpio ? `https://wa.me/${phoneWithCode}?text=${waMsg}` : '';

    // Lógica de Branding "Titán"
    const isSteelmonkey = workshop.slug === 'steelmonkey';
    const primaryColor = isSteelmonkey ? '#FF4D00' : '#7C3AED'; // Naranja Steelmonkey vs Violeta Flusize
    const secondaryColor = isSteelmonkey ? '#0B0B0B' : '#020617'; // Negro Carbón
    const accentColor = isSteelmonkey ? '#FF4D00' : '#A78BFA';

    return (
        <div className={`min-h-screen ${isSteelmonkey ? 'bg-[#0B0B0B]' : 'bg-[#020617]'} pb-24 text-slate-300`}>
            {/* ── Navbar Premium ── */}
            <nav className={`${isSteelmonkey ? 'bg-[#0B0B0B]/80' : 'bg-[#020617]/80'} backdrop-blur-xl border-b border-white/5 z-50 sticky top-0 transition-all`}>
                <div className="max-w-7xl mx-auto px-6">
                    <div className="flex justify-between h-20">
                        <div className="flex items-center gap-3 cursor-pointer group" onClick={() => router.push('/conductores/mapa')}>
                            <div
                                className="w-10 h-10 rounded-2xl flex items-center justify-center shadow-lg transition-transform group-hover:scale-105"
                                style={{
                                    background: `linear-gradient(to bottom right, ${primaryColor}, ${isSteelmonkey ? '#CC3D00' : '#4338CA'})`,
                                    boxShadow: `0 10px 15px -3px ${primaryColor}40`
                                }}
                            >
                                <span className="text-white font-black text-lg">{isSteelmonkey ? 'S' : 'F'}</span>
                            </div>
                            <span className="font-black text-2xl tracking-tighter text-white">
                                {isSteelmonkey ? 'Steelmonkey' : 'Flusize'} <span className={`text-[10px] uppercase tracking-[0.2em] font-bold block leading-none ml-1 ${isSteelmonkey ? 'text-[#FF4D00]' : 'text-violet-400'}`}>{isSteelmonkey ? 'Titán Performance' : 'Premium Network'}</span>
                            </span>
                        </div>
                        <div className="flex items-center">
                            <button
                                className="text-xs font-black text-slate-400 hover:text-white transition-colors px-5 py-2.5 rounded-xl bg-white/5 hover:bg-white/10 border border-white/5 uppercase tracking-widest"
                                onClick={() => router.push('/conductores/mapa')}
                            >
                                ← Mapa
                            </button>
                        </div>
                    </div>
                </div>
            </nav>

            {/* ── Hero Profile ── */}
            <div className="max-w-7xl mx-auto px-6 pt-10">
                <div className="grid lg:grid-cols-12 gap-10">

                    {/* Left: Info Principal */}
                    <div className="lg:col-span-8 space-y-10">
                        <div className="relative rounded-[32px] overflow-hidden bg-slate-900 border border-white/5 shadow-2xl group">
                            <div className="h-64 sm:h-96 relative">
                                <img
                                    src={isSteelmonkey ? '/workshops/steelmonkey-hero.png' : (workshop.logo_url || 'https://images.unsplash.com/photo-1619642751034-765dfdf7c58e?auto=format&fit=crop&q=80&w=1600')}
                                    alt={workshop.nombre}
                                    className={`w-full h-full object-cover ${isSteelmonkey ? 'opacity-60' : 'opacity-40 mix-blend-luminosity'} group-hover:scale-105 transition-transform duration-1000`}
                                />
                                <div className={`absolute inset-0 bg-gradient-to-t from-${isSteelmonkey ? '[#0B0B0B]' : '[#020617]'} via-transparent to-transparent`} />
                            </div>

                            <div className="absolute bottom-0 left-0 right-0 p-8 sm:p-12">
                                {/* Medallas de Autoridad */}
                                {isSteelmonkey && workshop.reconocimientos && (
                                    <div className="flex flex-wrap gap-4 mb-8">
                                        {workshop.reconocimientos.map((badge, idx) => {
                                            const Icon = badge.icon === 'Trophy' ? Trophy : badge.icon === 'Zap' ? Zap : ShieldCheck;
                                            return (
                                                <div key={idx} className="flex items-center gap-2 px-4 py-2 bg-black/60 backdrop-blur-xl border border-[#FF4D00]/30 rounded-2xl shadow-xl">
                                                    <Icon className="w-4 h-4 text-[#FF4D00]" />
                                                    <span className="text-[10px] font-black text-white uppercase tracking-widest">{badge.label}</span>
                                                </div>
                                            );
                                        })}
                                    </div>
                                )}

                                <div className="flex flex-wrap gap-3 mb-6">
                                    <span
                                        className="text-white px-3 py-1 rounded-full text-[10px] font-black uppercase tracking-widest border border-opacity-50 shadow-lg"
                                        style={{
                                            backgroundColor: primaryColor,
                                            borderColor: accentColor,
                                            boxShadow: `0 10px 15px -3px ${primaryColor}40`
                                        }}
                                    >
                                        {isSteelmonkey ? 'Taller Titán' : 'Partner Verificado'}
                                    </span>
                                    {workshop.ciudad && (
                                        <span className="bg-white/10 backdrop-blur-md text-slate-200 px-3 py-1 rounded-full text-[10px] font-black uppercase tracking-widest border border-white/10">
                                            📍 {workshop.ciudad}
                                        </span>
                                    )}
                                </div>
                                <h1 className="text-4xl sm:text-6xl font-black text-white tracking-tighter mb-4 leading-none">
                                    {workshop.nombre}
                                </h1>
                                <p className="text-lg text-slate-400 font-medium max-w-2xl flex items-center gap-2">
                                    <MapPin className="w-5 h-5 text-violet-500" />
                                    {workshop.direccion || 'Ubicación central Flusize'}
                                </p>
                            </div>
                        </div>

                        {/* Bio & Details */}
                        <div className="grid sm:grid-cols-2 gap-8">
                            <div className="bg-white/5 border border-white/5 rounded-3xl p-8 backdrop-blur-sm">
                                <h3 className="font-black text-white text-xl mb-4 tracking-tight flex items-center gap-2">
                                    <Globe className="w-5 h-5 text-violet-400" />
                                    Sobre Nosotros
                                </h3>
                                <p className="text-slate-400 leading-relaxed font-medium">
                                    {workshop.descripcion || `${workshop.nombre} ofrece soluciones automotrices de alta calidad bajo los estándares de la red Flusize. Contamos con tecnología de punta y personal experto.`}
                                </p>
                            </div>

                            <div className="bg-white/5 border border-white/5 rounded-3xl p-8 backdrop-blur-sm">
                                <h3 className="font-black text-white text-xl mb-4 tracking-tight flex items-center gap-2">
                                    <Wrench className="w-5 h-5 text-violet-400" />
                                    Servicios Destacados
                                </h3>
                                <div className="flex flex-wrap gap-2">
                                    {(workshop as any).servicios && Array.isArray((workshop as any).servicios) ? (
                                        (workshop as any).servicios.map((tag: string) => (
                                            <span key={tag} className="px-3 py-1.5 bg-slate-900 border border-white/5 rounded-xl text-xs font-bold text-slate-300 uppercase tracking-wider">
                                                {tag}
                                            </span>
                                        ))
                                    ) : (
                                        ['Mecánica General', 'Scanner', 'Frenos', 'Suspensión'].map(tag => (
                                            <span key={tag} className="px-3 py-1.5 bg-slate-900 border border-white/5 rounded-xl text-xs font-bold text-slate-300 uppercase tracking-wider">
                                                {tag}
                                            </span>
                                        ))
                                    )}
                                </div>
                            </div>
                        </div>
                    </div>

                    {/* Right: Acciones & Redes */}
                    <div className="lg:col-span-4 space-y-8">
                        {/* Card Contacto */}
                        <div
                            className="rounded-[32px] p-8 shadow-2xl sticky top-28 border border-white/5"
                            style={{
                                background: isSteelmonkey
                                    ? `linear-gradient(135deg, #FF4D00 0%, #CC3D00 100%)`
                                    : `linear-gradient(135deg, #7C3AED 0%, #4338CA 100%)`,
                                boxShadow: isSteelmonkey ? `0 25px 50px -12px rgba(255, 77, 0, 0.4)` : `0 25px 50px -12px rgba(124, 58, 237, 0.4)`
                            }}
                        >
                            <div className="w-16 h-16 bg-white/10 backdrop-blur-md rounded-2xl flex items-center justify-center mb-8 border border-white/10">
                                <MessageCircle className="w-8 h-8 text-white" />
                            </div>

                            <h3 className="text-3xl font-black text-white mb-3 tracking-tight">Contacto Directo</h3>
                            <p className="text-white/80 text-sm mb-10 font-bold leading-relaxed uppercase tracking-wider">
                                Atencion inmediata vía WhatsApp
                            </p>

                            <div className="space-y-4">
                                {waLink ? (
                                    <a
                                        href={waLink}
                                        target="_blank"
                                        rel="noopener noreferrer"
                                        className={`w-full py-5 bg-white hover:bg-slate-50 active:scale-[0.98] transition-all font-black rounded-2xl flex items-center justify-center gap-3 shadow-xl shadow-black/20 ${isSteelmonkey ? 'text-[#FF4D00]' : 'text-violet-700'}`}
                                    >
                                        <MessageCircle className="w-6 h-6" />
                                        <span>ENVIAR MENSAJE</span>
                                    </a>
                                ) : (
                                    <div className="w-full py-5 bg-black/20 text-white/50 font-black rounded-2xl text-center border border-white/5">
                                        SIN ACCESO WHATSAPP
                                    </div>
                                )}

                                {isSteelmonkey && (
                                    <a
                                        href={`https://instagram.com/${workshop.instagram}`}
                                        target="_blank"
                                        rel="noopener noreferrer"
                                        className="w-full py-5 bg-black hover:bg-slate-900 active:scale-[0.98] transition-all text-white font-black rounded-2xl flex items-center justify-center gap-3 shadow-xl border border-white/10"
                                    >
                                        <Instagram className="w-6 h-6 text-[#FF4D00]" />
                                        <span>VER PROYECTOS INSTAGRAM</span>
                                    </a>
                                )}
                            </div>

                            {/* Redes SECUNDARIAS Fallback */}
                            {!isSteelmonkey && (
                                <div className="mt-10 pt-8 border-t border-white/10 flex items-center justify-center gap-6">
                                    {workshop.instagram && (
                                        <a href={`https://instagram.com/${workshop.instagram}`} target="_blank" className="text-white/60 hover:text-white transition-colors">
                                            <Instagram className="w-6 h-6" />
                                        </a>
                                    )}
                                    {workshop.facebook && (
                                        <a href={workshop.facebook} target="_blank" className="text-white/60 hover:text-white transition-colors">
                                            <Facebook className="w-6 h-6" />
                                        </a>
                                    )}
                                </div>
                            )}
                        </div>

                        {/* Footer Link */}
                        <div className="text-center px-4">
                            <p className="text-[10px] font-black text-slate-600 uppercase tracking-[0.3em]">
                                Protegido por Flusize Cloud Security
                            </p>
                        </div>
                    </div>

                </div>
            </div>
        </div>
    );
}
