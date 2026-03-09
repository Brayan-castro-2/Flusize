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
    Globe
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

    // Usar logo explícito si es steelmonkey, sino el de BDD
    const finalLogoUrl = isSteelmonkey ? '/steelmonkey-profile.png' : (workshop.logo_url || 'https://images.unsplash.com/photo-1614164185128-e4ec99c436d7?q=80&w=200&h=200&auto=format&fit=crop');

    return (
        <div className="min-h-screen bg-[#0a0a0a] text-white font-sans selection:bg-orange-500/30 pb-20">
            {/* NAVBAR DESKTOP & MOBILE */}
            <header className="border-b border-[#222] bg-[#0a0a0a] sticky top-0 z-50">
                <div className="max-w-7xl mx-auto px-4 sm:px-6 h-20 flex items-center justify-between">
                    <div className="flex items-center gap-4 relative z-10">
                        <div
                            className="w-12 h-12 rounded-xl flex items-center justify-center font-black text-white text-2xl shadow-lg shadow-orange-500/20"
                            style={{ backgroundColor: workshop.color_primario || '#ea580c' }}
                        >
                            {workshop.nombre.charAt(0).toUpperCase()}
                        </div>
                        <div className="hidden sm:block">
                            <h1 className="text-xl font-black text-white leading-none tracking-tight">{workshop.nombre}</h1>
                            {isSteelmonkey ? (
                                <p className="text-xs font-bold tracking-widest mt-1 uppercase" style={{ color: workshop.color_primario || '#ea580c' }}>TITÁN PERFORMANCE</p>
                            ) : (
                                <p className="text-xs text-slate-400 font-medium mt-1 uppercase tracking-wider">Taller Verificado</p>
                            )}
                        </div>
                    </div>
                    <button
                        onClick={() => router.push('/conductores/mapa')}
                        className="flex items-center gap-2 px-4 py-2 bg-[#1a1a1a] hover:bg-[#222] border border-[#333] rounded-lg text-sm font-semibold text-slate-300 transition-colors"
                    >
                        <ChevronLeft className="w-4 h-4" />
                        MAPA
                    </button>
                </div>
            </header>

            {/* CONTENEDOR DE PORTADA DINÁMICO */}
            <div className="w-full h-48 md:h-64 lg:h-80 relative overflow-hidden bg-slate-900">
                {workshop.portada_url ? (
                    <img
                        src={workshop.portada_url}
                        alt=""
                        className="w-full h-full object-cover"
                    />
                ) : (
                    <div className="w-full h-full bg-gradient-to-br from-slate-800 to-slate-950 opacity-50" />
                )}
                <div className="absolute inset-0 bg-black/20" />
            </div>

            {/* MAIN LAYOUT */}
            <main className="max-w-7xl mx-auto px-4 sm:px-6 mt-8 md:mt-12 grid grid-cols-1 lg:grid-cols-[1fr_400px] gap-8 items-start">

                {/* COLUMNA IZQUIERDA: HERO & INFO */}
                <div className="space-y-6">
                    {/* Hero Card */}
                    <div className="bg-[#0f172a] rounded-[2rem] p-6 md:p-10 border border-slate-800/50 shadow-2xl relative overflow-hidden group/hero">
                        {/* Background Image / Portada */}
                        {workshop.portada_url ? (
                            <div className="absolute inset-0 z-0">
                                <img
                                    src={workshop.portada_url}
                                    alt="Portada Taller"
                                    className="w-full h-full object-cover opacity-30 group-hover/hero:opacity-40 transition-opacity duration-700"
                                />
                                <div className="absolute inset-0 bg-gradient-to-t from-[#0f172a] via-[#0f172a]/80 to-transparent" />
                            </div>
                        ) : (
                            <div className="absolute top-0 right-0 -mt-20 -mr-20 w-64 h-64 bg-blue-600/10 blur-[100px] rounded-full pointer-events-none" />
                        )}

                        <div className="relative z-10">

                            {/* Badges Dinámicos */}
                            {(workshop.reconocimiento || workshop.estadisticas) && (
                                <div className="flex flex-wrap gap-3 mb-8">
                                    {workshop.reconocimiento && (
                                        <span
                                            className="flex items-center gap-2 px-3 py-1.5 rounded-full bg-[#0f172a]/80 backdrop-blur-md border text-xs font-bold text-white tracking-wide"
                                            style={{ borderColor: `${workshop.color_primario || '#f97316'}4d` }}
                                        >
                                            <span style={{ color: workshop.color_primario || '#f97316' }}>🏆</span> {workshop.reconocimiento.toUpperCase()}
                                        </span>
                                    )}
                                    {workshop.estadisticas && (
                                        <span
                                            className="flex items-center gap-2 px-3 py-1.5 rounded-full bg-[#0f172a]/80 backdrop-blur-md border text-xs font-bold text-white tracking-wide"
                                            style={{ borderColor: `${workshop.color_primario || '#f97316'}4d` }}
                                        >
                                            <span style={{ color: workshop.color_primario || '#f97316' }}>⚡</span> {workshop.estadisticas.toUpperCase()}
                                        </span>
                                    )}
                                    <span
                                        className="flex items-center gap-2 px-3 py-1.5 rounded-full bg-[#0f172a]/80 backdrop-blur-md border text-xs font-bold text-white tracking-wide"
                                        style={{ borderColor: `${workshop.color_primario || '#f97316'}4d` }}
                                    >
                                        <span style={{ color: workshop.color_primario || '#f97316' }}>🛡️</span> CALIDAD CERTIFICADA
                                    </span>
                                </div>
                            )}

                            {/* Badges Fila 2 */}
                            <div className="flex items-center gap-3 mb-6">
                                {isSteelmonkey && (
                                    <span
                                        className="px-4 py-1.5 rounded-full text-xs font-black text-white tracking-wide uppercase"
                                        style={{ backgroundColor: workshop.color_primario || '#ea580c' }}
                                    >
                                        Taller Titán
                                    </span>
                                )}
                                <span className="px-4 py-1.5 rounded-full bg-slate-800/80 text-xs font-bold text-slate-300 tracking-wide flex items-center gap-1.5 uppercase">
                                    <MapPin className="w-3.5 h-3.5 text-rose-400" />
                                    {workshop.ciudad || 'Santiago'}
                                </span>
                            </div>

                            {/* Título Principal */}
                            <h2 className="text-4xl md:text-5xl lg:text-6xl font-black text-white leading-[1.05] tracking-tight mb-6">
                                {workshop.nombre} —<br />
                                <span className="text-slate-200">
                                    {isSteelmonkey ? 'Performance & Detail' : 'Centro Especializado'}
                                </span>
                            </h2>

                            <p className="flex items-center gap-2 text-slate-400 text-lg md:text-xl font-medium">
                                <MapPin className="w-5 h-5 text-indigo-400 shrink-0" />
                                {workshop.direccion ? `${workshop.direccion}, ${workshop.ciudad || ''} ${workshop.region || ''}` : 'Ubicación no especificada'}
                            </p>
                        </div>
                    </div>

                    {/* Grilla Info: Sobre Nosotros & Servicios */}
                    <div className="grid grid-cols-1 md:grid-cols-2 gap-6">
                        {/* Biografía */}
                        <div className="bg-[#1a1a1a] rounded-3xl p-6 md:p-8 border border-[#2a2a2a]">
                            <h3 className="text-lg font-black text-white flex items-center gap-2 mb-4">
                                <Globe className="w-5 h-5 text-indigo-400" />
                                Sobre Nosotros
                            </h3>
                            <p className="text-slate-400 leading-relaxed font-medium">
                                {workshop.descripcion || (isSteelmonkey
                                    ? 'Fabricación artesanal de líneas de escape en acero inoxidable, potenciación de motores y personalización de alto nivel. Elevando el estándar automotriz en Santiago y Lampa.'
                                    : 'Somos especialistas dedicados a brindar el mejor servicio automotriz de la región. Calidad y transparencia garantizada.'
                                )}
                            </p>
                        </div>

                        {/* Servicios Tag Cloud */}
                        <div className="bg-[#1a1a1a] rounded-3xl p-6 md:p-8 border border-[#2a2a2a]">
                            <h3 className="text-lg font-black text-white flex items-center gap-2 mb-6">
                                <CheckCircle2 className="w-5 h-5 text-indigo-400" />
                                Servicios Destacados
                            </h3>
                            <div className="flex flex-wrap gap-2">
                                {isSteelmonkey ? (
                                    <>
                                        <span className="px-3 py-1.5 rounded-lg bg-blue-950/40 border border-blue-900/50 text-xs font-bold text-blue-200 uppercase tracking-wide">Reprogramación ECU (STAGE 1)</span>
                                        <span className="px-3 py-1.5 rounded-lg bg-blue-950/40 border border-blue-900/50 text-xs font-bold text-blue-200 uppercase tracking-wide">Detailing Cerámico PRO</span>
                                        <span className="px-3 py-1.5 rounded-lg bg-blue-950/40 border border-blue-900/50 text-xs font-bold text-blue-200 uppercase tracking-wide">Mantenimiento de Alta Gama</span>
                                        <span className="px-3 py-1.5 rounded-lg bg-blue-950/40 border border-blue-900/50 text-xs font-bold text-blue-200 uppercase tracking-wide">Instalación de Upgrades</span>
                                        <span className="px-3 py-1.5 rounded-lg bg-blue-950/40 border border-blue-900/50 text-xs font-bold text-blue-200 uppercase tracking-wide">Scanner Avanzado</span>
                                    </>
                                ) : (
                                    <>
                                        <span className="px-3 py-1.5 rounded-lg bg-[#222] text-xs font-bold text-slate-300 uppercase tracking-wide">Diagnóstico Computarizado</span>
                                        <span className="px-3 py-1.5 rounded-lg bg-[#222] text-xs font-bold text-slate-300 uppercase tracking-wide">Mantención Por Kilometraje</span>
                                        <span className="px-3 py-1.5 rounded-lg bg-[#222] text-xs font-bold text-slate-300 uppercase tracking-wide">Frenos y Suspensión</span>
                                    </>
                                )}
                            </div>
                        </div>
                    </div>
                </div>

                {/* COLUMNA DERECHA: CONTACTO (STICKY) */}
                <div className="lg:sticky lg:top-28">
                    <div
                        className="rounded-[2rem] p-8 shadow-2xl relative overflow-hidden"
                        style={{
                            backgroundColor: workshop.color_primario || '#ea580c',
                            boxShadow: `0 25px 50px -12px ${workshop.color_primario || '#ea580c'}33`
                        }}
                    >
                        {/* Adorno circular sutil */}
                        <div className="absolute top-0 right-0 translate-x-1/3 -translate-y-1/3 w-64 h-64 bg-white/10 rounded-full blur-2xl pointer-events-none" />

                        <div className="w-14 h-14 bg-white/20 backdrop-blur-md rounded-2xl flex items-center justify-center mb-6">
                            <MessageCircle className="w-7 h-7 text-white" />
                        </div>

                        <h3 className="text-3xl md:text-4xl font-black text-white tracking-tight mb-2">
                            Contacto Directo
                        </h3>
                        <p className="text-white/80 font-bold tracking-widest text-sm uppercase mb-8">
                            Atención inmediata vía WhatsApp
                        </p>

                        <div className="space-y-4 relative z-10">
                            {waLink && (
                                <a
                                    href={waLink}
                                    target="_blank"
                                    rel="noopener noreferrer"
                                    className="flex w-full items-center justify-center gap-3 bg-white px-6 py-4 rounded-xl font-bold hover:bg-white/90 transition-all active:scale-[0.98] shadow-lg shadow-black/10"
                                    style={{ color: workshop.color_primario || '#ea580c' }}
                                >
                                    <MessageCircle className="w-5 h-5 flex-shrink-0" />
                                    ENVIAR MENSAJE
                                </a>
                            )}

                            {workshop.instagram && (
                                <a
                                    href={`https://instagram.com/${workshop.instagram}`}
                                    target="_blank"
                                    rel="noopener noreferrer"
                                    className="flex w-full items-center justify-center gap-3 bg-black text-white px-6 py-4 rounded-xl font-bold hover:bg-neutral-900 transition-all active:scale-[0.98]"
                                >
                                    <Instagram className="w-5 h-5 flex-shrink-0" />
                                    VER PROYECTOS INSTAGRAM
                                </a>
                            )}

                            {workshop.sitio_web && (
                                <a
                                    href={workshop.sitio_web.startsWith('http') ? workshop.sitio_web : `https://${workshop.sitio_web}`}
                                    target="_blank"
                                    rel="noopener noreferrer"
                                    className="flex w-full items-center justify-center gap-3 bg-white/10 border border-white/20 text-white px-6 py-4 rounded-xl font-bold hover:bg-white/20 transition-all active:scale-[0.98]"
                                >
                                    <Globe className="w-5 h-5 flex-shrink-0" />
                                    SITIO WEB OFICIAL
                                </a>
                            )}
                        </div>
                    </div>

                    <p className="text-center text-[#444] text-[10px] sm:text-xs font-black tracking-[0.2em] uppercase mt-8">
                        Protegido por Flusize Cloud Security
                    </p>
                </div>
            </main>
        </div>
    );
}
