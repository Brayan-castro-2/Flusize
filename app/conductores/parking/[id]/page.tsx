'use client';

import { useState, useEffect } from 'react';
import { useParams, useRouter } from 'next/navigation';
import { supabase } from '@/lib/supabase';
import {
    MapPin,
    ChevronLeft,
    Wrench,
    MessageCircle,
    AlertCircle
} from 'lucide-react';

interface WorkshopData {
    id: string;
    nombre: string;
    direccion: string | null;
    telefono: string | null;
    descripcion: string | null;
    logo_url: string | null;
    etiquetas_servicios: string[] | null;
}

export default function WorkshopDetail() {
    const params = useParams();
    const router = useRouter();
    const idStr = params?.id as string;

    const [workshop, setWorkshop] = useState<WorkshopData | null>(null);
    const [loading, setLoading] = useState(true);
    const [error, setError] = useState<string | null>(null);

    useEffect(() => {
        async function loadWorkshop() {
            if (!idStr) return;

            const { data, error } = await supabase
                .from('talleres')
                .select('id, nombre, direccion, telefono, descripcion, logo_url, etiquetas_servicios')
                // Try matching by id or slug
                .or(`id.eq.${idStr},slug.eq.${idStr}`)
                .maybeSingle();

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
    }, [idStr]);

    if (loading) {
        return (
            <div className="min-h-screen bg-slate-50 flex items-center justify-center">
                <div className="w-10 h-10 border-[3px] border-blue-100 border-t-blue-600 rounded-full animate-spin"></div>
            </div>
        );
    }

    if (error || !workshop) {
        return (
            <div className="min-h-screen bg-slate-50 flex flex-col items-center justify-center p-6 text-center">
                <div className="w-16 h-16 bg-red-50 rounded-full flex items-center justify-center mb-4">
                    <AlertCircle className="w-8 h-8 text-red-500" />
                </div>
                <h2 className="text-xl font-bold text-slate-800 mb-2">{error || 'Taller no encontrado'}</h2>
                <button
                    onClick={() => router.push('/conductores/mapa')}
                    className="mt-6 px-6 py-3 bg-blue-600 text-white rounded-xl hover:bg-blue-700 transition-colors font-bold shadow-sm shadow-blue-200"
                >
                    Volver al mapa
                </button>
            </div>
        );
    }

    // Soft Booking WhatsApp link generation
    const telefonoLimpio = workshop.telefono?.replace(/\D/g, '') || '';
    // Add country code if it doesn't have it (assuming Chile +56 by default for this MVP context)
    const phoneWithCode = telefonoLimpio.startsWith('56') ? telefonoLimpio : `56${telefonoLimpio}`;
    const waMsg = encodeURIComponent(`Hola ${workshop.nombre}, vi su taller en Flusize y me gustaría cotizar un servicio para mi auto.`);
    const waLink = telefonoLimpio ? `https://wa.me/${phoneWithCode}?text=${waMsg}` : '';

    return (
        <div className="min-h-screen bg-slate-50 pb-20">
            {/* ── Navbar Simple ── */}
            <nav className="bg-white shadow-sm border-b border-slate-100 z-50 sticky top-0">
                <div className="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8">
                    <div className="flex justify-between h-16">
                        <div className="flex items-center cursor-pointer" onClick={() => router.push('/conductores/mapa')}>
                            <div className="w-7 h-7 rounded-lg bg-blue-600 flex items-center justify-center mr-2">
                                <span className="text-white font-black text-sm leading-none">F</span>
                            </div>
                            <span className="font-extrabold text-xl tracking-tight text-slate-800">
                                Flusize <span className="text-[10px] text-blue-600 uppercase tracking-widest ml-0.5">Drivers</span>
                            </span>
                        </div>
                        <div className="flex items-center">
                            <button
                                className="text-sm font-semibold text-slate-500 hover:text-blue-600 transition-colors px-3 py-2 rounded-lg hover:bg-blue-50"
                                onClick={() => router.push('/conductores/mapa')}
                            >
                                Volver al Mapa
                            </button>
                        </div>
                    </div>
                </div>
            </nav>

            {/* ── Hero Image ── */}
            <div className="relative h-64 md:h-80 bg-slate-800 overflow-hidden">
                <img
                    src={workshop.logo_url || 'https://images.unsplash.com/photo-1619642751034-765dfdf7c58e?auto=format&fit=crop&q=80&w=1600'}
                    alt={workshop.nombre}
                    className="w-full h-full object-cover opacity-60 mix-blend-overlay"
                />
                <div className="absolute inset-0 bg-gradient-to-t from-slate-900 via-slate-900/40 to-transparent" />

                <button
                    onClick={() => router.back()}
                    className="absolute top-6 left-6 md:left-auto md:top-8 bg-white/10 hover:bg-white/20 backdrop-blur text-white p-2.5 rounded-full transition-all z-10 border border-white/10"
                >
                    <ChevronLeft className="w-5 h-5 relative right-px" />
                </button>

                <div className="absolute bottom-0 left-0 right-0 p-6 md:p-8 text-white z-10">
                    <div className="max-w-4xl mx-auto w-full">
                        <span className="inline-block bg-blue-600/90 text-blue-50 px-2.5 py-1 rounded-md text-xs font-bold uppercase tracking-wider mb-3 shadow-sm backdrop-blur-sm border border-blue-500/50">
                            Taller Aliado
                        </span>
                        <h1 className="text-3xl md:text-5xl font-extrabold mb-3 tracking-tight leading-tight">
                            {workshop.nombre}
                        </h1>
                        <p className="flex items-center gap-2 text-blue-100 text-sm md:text-base font-medium md:max-w-lg">
                            <MapPin className="w-4 h-4 shrink-0" />
                            <span className="truncate">{workshop.direccion || 'Sin dirección registrada'}</span>
                        </p>
                    </div>
                </div>
            </div>

            {/* ── Content ── */}
            <div className="max-w-4xl mx-auto px-4 mt-6 md:mt-8 relative z-10">
                <div className="grid md:grid-cols-3 gap-6 md:gap-8">

                    {/* Left Column: Info */}
                    <div className="md:col-span-2 space-y-6">

                        {/* About */}
                        <div className="bg-white rounded-2xl shadow-sm p-6 md:p-8 border border-slate-100">
                            <h3 className="font-bold text-slate-800 text-lg mb-4 tracking-tight">Sobre el Taller</h3>
                            <p className="text-slate-500 leading-relaxed text-sm md:text-base whitespace-pre-wrap">
                                {workshop.descripcion || 'Este taller forma parte de la red Flusize, brindando servicios de excelencia para tu vehículo. Aún no han agregado una descripción detallada.'}
                            </p>
                        </div>

                        {/* Specialties */}
                        <div className="bg-white rounded-2xl shadow-sm p-6 md:p-8 border border-slate-100">
                            <h3 className="font-bold text-slate-800 text-lg mb-5 tracking-tight flex items-center gap-2">
                                <Wrench className="w-5 h-5 text-blue-600" />
                                Especialidades y Servicios
                            </h3>

                            {workshop.etiquetas_servicios && workshop.etiquetas_servicios.length > 0 ? (
                                <div className="flex flex-wrap gap-2.5">
                                    {workshop.etiquetas_servicios.map((tag, i) => (
                                        <span
                                            key={i}
                                            className="bg-blue-50 text-blue-700 px-4 py-2 rounded-xl text-sm font-semibold border border-blue-100/50"
                                        >
                                            {tag}
                                        </span>
                                    ))}
                                </div>
                            ) : (
                                <div className="bg-slate-50 rounded-xl p-4 border border-slate-100 border-dashed text-slate-400 text-sm font-medium">
                                    Este taller no ha listado servicios específicos por ahora. Contacta al taller para más detalles.
                                </div>
                            )}
                        </div>
                    </div>

                    {/* Right Column: Soft Booking WhatsApp */}
                    <div className="md:col-span-1">
                        <div className="bg-white p-6 md:p-8 rounded-2xl shadow-sm border border-slate-100 sticky top-24">
                            <div className="w-14 h-14 bg-emerald-50 rounded-2xl flex items-center justify-center mb-6 border border-emerald-100/50">
                                <MessageCircle className="w-7 h-7 text-emerald-500" />
                            </div>

                            <h3 className="text-xl font-bold text-slate-800 mb-2 tracking-tight">Cotizar Servicio</h3>
                            <p className="text-slate-500 text-sm mb-8 leading-relaxed">
                                Contacta directamente al administrador del taller para consultar por tu problema, verificar disponibilidad y ver precios estimados.
                            </p>

                            {telefonoLimpio ? (
                                <a
                                    href={waLink}
                                    target="_blank"
                                    rel="noopener noreferrer"
                                    className="w-full py-3.5 bg-emerald-500 hover:bg-emerald-600 active:scale-[0.98] transition-all text-white font-bold rounded-xl flex items-center justify-center gap-2 shadow-sm shadow-emerald-500/20"
                                >
                                    <MessageCircle className="w-5 h-5 shrink-0" />
                                    <span>Contactar por WhatsApp</span>
                                </a>
                            ) : (
                                <div className="w-full py-3.5 bg-slate-50 border border-slate-200 text-slate-400 font-bold rounded-xl flex items-center justify-center gap-2 text-sm text-center">
                                    Taller sin WhatsApp registrado
                                </div>
                            )}

                            <p className="text-xs text-center text-slate-400 mt-4 px-2">
                                Conexion facilitada por la red de talleres Flusize.
                            </p>
                        </div>
                    </div>

                </div>
            </div>
        </div>
    );
}
