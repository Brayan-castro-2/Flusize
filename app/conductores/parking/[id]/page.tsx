'use client';
import { useState, useEffect } from 'react';
import { useParams, useRouter } from 'next/navigation';
import { MapPin, Clock, Shield, Star, Calendar, ChevronLeft, CreditCard, CheckCircle, AlertCircle, Wrench, User, Phone, Share2 } from 'lucide-react';
import { workshops } from '@/lib/mockData';
import { addAppointment } from '@/lib/appointmentStorage';
import Link from 'next/link';

export default function WorkshopDetail() {
    const params = useParams();
    const router = useRouter();
    const id = params?.id;

    const [selectedDate, setSelectedDate] = useState('');
    const [selectedTime, setSelectedTime] = useState('');
    const [serviceType, setServiceType] = useState('Mantención General'); // Default service
    const [workshop, setWorkshop] = useState<any>(null);
    const [loading, setLoading] = useState(true);
    const [showConfirmation, setShowConfirmation] = useState(false);

    useEffect(() => {
        if (!id) return;

        // Simulate fetch
        const shop = workshops.find(p => p.id.toString() === id.toString());

        setTimeout(() => {
            if (shop) {
                setWorkshop(shop);
            }
            setLoading(false);
        }, 500);
    }, [id]);

    if (loading) {
        return (
            <div className="min-h-screen bg-gray-50 flex items-center justify-center">
                <div className="animate-spin rounded-full h-12 w-12 border-b-2 border-blue-600"></div>
            </div>
        );
    }

    if (!workshop) {
        return (
            <div className="min-h-screen bg-gray-50 flex items-center justify-center">
                <div className="text-center">
                    <h2 className="text-2xl font-bold text-gray-800">Taller no encontrado</h2>
                    <button
                        onClick={() => router.push('/conductores/mapa')}
                        className="mt-4 px-6 py-2 bg-blue-600 text-white rounded-lg hover:bg-blue-700 transition-colors"
                    >
                        Volver al mapa
                    </button>
                </div>
            </div>
        );
    }

    const handleReserve = () => {
        if (!selectedDate || !selectedTime) {
            alert('Por favor selecciona fecha y hora para tu cita');
            return;
        }

        if (workshop.availableSlots <= 0) {
            alert('Lo sentimos, este taller no tiene cupos disponibles hoy. Intenta otra fecha.');
            return;
        }

        // Save appointment to localStorage
        addAppointment({
            workshopId: workshop.id,
            workshopName: workshop.name,
            workshopLocation: workshop.location,
            workshopImage: workshop.image,
            serviceType,
            date: selectedDate,
            time: selectedTime,
            estimatedPrice: workshop.basePrice,
        });

        // Show confirmation modal
        setShowConfirmation(true);
    };

    return (
        <div className="min-h-screen bg-gray-50 pb-20">
            {/* Navbar Simple for Driver Section */}
            <nav className="bg-white shadow-sm border-b border-gray-200 z-50 sticky top-0">
                <div className="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8">
                    <div className="flex justify-between h-16">
                        <div className="flex items-center cursor-pointer" onClick={() => router.push('/')}>
                            <span className="font-extrabold text-2xl tracking-wide text-slate-900">FLUSIZE</span>
                            <span className="text-[0.6rem] font-medium text-blue-600 ml-1 mt-1 tracking-wider uppercase">Drivers</span>
                        </div>
                        <div className="flex items-center gap-4">
                            <button className="text-sm text-gray-500 hover:text-gray-900" onClick={() => router.push('/conductores/mapa')}>Volver al Mapa</button>
                        </div>
                    </div>
                </div>
            </nav>

            {/* Hero Image */}
            <div className="relative h-64 md:h-80">
                <img
                    src={workshop.image}
                    alt={workshop.name}
                    className="w-full h-full object-cover"
                />
                <div className="absolute inset-0 bg-gradient-to-t from-gray-900 via-gray-900/40 to-transparent"></div>
                <button
                    onClick={() => router.back()}
                    className="absolute top-4 left-4 bg-white/90 p-2 rounded-full hover:bg-white transition-colors shadow-lg z-10"
                >
                    <ChevronLeft className="w-6 h-6 text-gray-800" />
                </button>

                <div className="absolute bottom-0 left-0 right-0 p-6 md:p-8 text-white z-10">
                    <div className="max-w-4xl mx-auto w-full">
                        <div className="flex items-center gap-2 mb-2">
                            <span className="bg-blue-600 text-white px-2 py-0.5 rounded textxs font-bold uppercase tracking-wider">Verificado</span>
                            <div className="flex items-center gap-1 text-yellow-400">
                                <Star className="w-4 h-4 fill-current" />
                                <span className="font-bold">{workshop.rating}</span>
                                <span className="text-gray-300 font-normal">({workshop.reviews} reseñas)</span>
                            </div>
                        </div>
                        <h1 className="text-3xl md:text-4xl font-bold mb-2 shadow-sm">{workshop.name}</h1>
                        <p className="flex items-center gap-2 text-gray-200 text-sm md:text-base">
                            <MapPin className="w-4 h-4" />
                            {workshop.location}
                        </p>
                    </div>
                </div>
            </div>

            <div className="max-w-4xl mx-auto px-4 mt-6 relative z-10">
                <div className="grid md:grid-cols-3 gap-8">
                    {/* Left Column: Info */}
                    <div className="md:col-span-2 space-y-6">

                        {/* Manager / About */}
                        <div className="bg-white rounded-xl shadow-sm p-6 border border-gray-100">
                            <div className="flex items-center gap-4 mb-4">
                                <div className="w-12 h-12 bg-gray-100 rounded-full flex items-center justify-center">
                                    <User className="w-6 h-6 text-gray-400" />
                                </div>
                                <div>
                                    <h3 className="font-bold text-gray-900">Encargado: {workshop.manager}</h3>
                                    <p className="text-sm text-gray-500">Miembro desde 2023</p>
                                </div>
                                <button className="ml-auto p-2 hover:bg-gray-100 rounded-full text-gray-400 hover:text-blue-600 transition-colors">
                                    <Share2 className="w-5 h-5" />
                                </button>
                            </div>
                            <hr className="my-4 border-gray-100" />
                            <h3 className="font-bold text-gray-800 mb-2">Sobre el Taller</h3>
                            <p className="text-gray-600 leading-relaxed text-sm md:text-base">
                                {workshop.description}
                            </p>
                        </div>

                        {/* Specialities */}
                        <div className="bg-white rounded-xl shadow-sm p-6 border border-gray-100">
                            <h3 className="font-bold text-gray-800 mb-4 flex items-center gap-2">
                                <Shield className="w-5 h-5 text-blue-600" />
                                Especialidades y Servicios
                            </h3>
                            <div className="flex flex-wrap gap-2 mb-4">
                                {workshop.specialties.map((spec: string, i: number) => (
                                    <span key={i} className="bg-blue-50 text-blue-700 px-3 py-1 rounded-full text-sm font-semibold border border-blue-100">
                                        {spec}
                                    </span>
                                ))}
                            </div>
                            <div className="grid grid-cols-2 gap-3">
                                {workshop.services.map((service: string, index: number) => (
                                    <div key={index} className="flex items-center gap-2 text-gray-600 bg-gray-50 p-3 rounded-lg border border-gray-100 text-sm">
                                        <Wrench className="w-4 h-4 text-gray-400" />
                                        {service}
                                    </div>
                                ))}
                            </div>
                        </div>

                        {/* Reviews Preview (Static) */}
                        <div className="bg-white rounded-xl shadow-sm p-6 border border-gray-100">
                            <h3 className="font-bold text-gray-800 mb-4">Opiniones de Clientes</h3>
                            <div className="space-y-4">
                                <div className="border-b border-gray-50 pb-4">
                                    <div className="flex items-center gap-2 mb-1">
                                        <div className="font-bold text-sm">Juan Pérez</div>
                                        <div className="flex text-yellow-400"><Star className="w-3 h-3 fill-current" /><Star className="w-3 h-3 fill-current" /><Star className="w-3 h-3 fill-current" /><Star className="w-3 h-3 fill-current" /><Star className="w-3 h-3 fill-current" /></div>
                                    </div>
                                    <p className="text-gray-600 text-sm">"Excelente servicio, muy rápidos y transparentes con los precios."</p>
                                </div>
                                <div>
                                    <div className="flex items-center gap-2 mb-1">
                                        <div className="font-bold text-sm">María Soto</div>
                                        <div className="flex text-yellow-400"><Star className="w-3 h-3 fill-current" /><Star className="w-3 h-3 fill-current" /><Star className="w-3 h-3 fill-current" /><Star className="w-3 h-3 fill-current" /></div>
                                    </div>
                                    <p className="text-gray-600 text-sm">"Buena atención del encargado, resolvieron mi problema de frenos en el día."</p>
                                </div>
                            </div>
                        </div>
                    </div>

                    {/* Right Column: Booking Card (Sticky) */}
                    <div className="md:col-span-1">
                        <div className="bg-white p-6 rounded-xl shadow-lg border border-gray-200 sticky top-24">
                            <div className="flex justify-between items-start mb-6">
                                <div>
                                    <span className="text-sm text-gray-500 block mb-1">Precio Base</span>
                                    <span className="text-3xl font-bold text-gray-900">${workshop.basePrice.toLocaleString()}</span>
                                </div>
                                <div className={`px-3 py-1 rounded-full text-xs font-bold flex items-center gap-1 ${workshop.availableSlots > 0 ? 'bg-green-100 text-green-700' : 'bg-red-100 text-red-700'}`}>
                                    <Calendar className="w-3 h-3" />
                                    {workshop.availableSlots > 0 ? 'Disponible' : 'Sin Cupos'}
                                </div>
                            </div>

                            <div className="space-y-4">
                                <div>
                                    <label className="block text-xs font-bold text-gray-700 mb-1 uppercase tracking-wide">Tipo de Servicio</label>
                                    <select
                                        className="w-full px-4 py-2 border border-gray-200 rounded-lg focus:ring-2 focus:ring-blue-600 outline-none text-sm bg-gray-50"
                                        value={serviceType}
                                        onChange={(e) => setServiceType(e.target.value)}
                                    >
                                        {workshop.services.map((s: string) => (
                                            <option key={s} value={s}>{s}</option>
                                        ))}
                                    </select>
                                </div>

                                <div>
                                    <label className="block text-xs font-bold text-gray-700 mb-1 uppercase tracking-wide">Fecha Preferida</label>
                                    <div className="relative">
                                        <Calendar className="absolute left-3 top-1/2 transform -translate-y-1/2 text-gray-400 w-4 h-4" />
                                        <input
                                            type="date"
                                            className="w-full pl-10 pr-4 py-2 border border-gray-200 rounded-lg focus:ring-2 focus:ring-blue-600 outline-none transition-all text-sm"
                                            value={selectedDate}
                                            onChange={(e) => setSelectedDate(e.target.value)}
                                        />
                                    </div>
                                </div>

                                <div>
                                    <label className="block text-xs font-bold text-gray-700 mb-1 uppercase tracking-wide">Hora</label>
                                    <div className="relative">
                                        <Clock className="absolute left-3 top-1/2 transform -translate-y-1/2 text-gray-400 w-4 h-4" />
                                        <input
                                            type="time"
                                            className="w-full pl-10 pr-4 py-2 border border-gray-200 rounded-lg focus:ring-2 focus:ring-blue-600 outline-none transition-all text-sm"
                                            value={selectedTime}
                                            onChange={(e) => setSelectedTime(e.target.value)}
                                        />
                                    </div>
                                </div>

                                <div className="border-t border-dashed border-gray-200 pt-4 mt-2">
                                    <div className="flex justify-between text-sm mb-2">
                                        <span className="text-gray-500">Reserva (pago en local)</span>
                                        <span className="font-medium">$0</span>
                                    </div>
                                    <div className="flex justify-between text-sm mb-4">
                                        <span className="text-gray-500">Estimado Total</span>
                                        <span className="font-bold text-gray-900">${workshop.basePrice.toLocaleString()}</span>
                                    </div>

                                    <button
                                        onClick={handleReserve}
                                        className="w-full bg-blue-600 hover:bg-blue-700 text-white font-bold py-3 px-4 rounded-xl shadow-lg shadow-blue-600/20 transition-all transform hover:-translate-y-0.5 flex items-center justify-center gap-2"
                                    >
                                        <Calendar className="w-5 h-5" />
                                        Solicitar Cita
                                    </button>
                                    <p className="text-xs text-center text-gray-400 mt-3">
                                        No se realiza cobro hasta confirmar el servicio en el taller.
                                    </p>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            {/* Confirmation Modal */}
            {showConfirmation && (
                <div className="fixed inset-0 bg-black/50 backdrop-blur-sm flex items-center justify-center z-50 p-4">
                    <div className="bg-white rounded-2xl shadow-2xl max-w-md w-full p-8 relative animate-in fade-in zoom-in duration-200">
                        <div className="text-center">
                            <div className="w-16 h-16 bg-green-100 rounded-full flex items-center justify-center mx-auto mb-4">
                                <CheckCircle className="w-10 h-10 text-green-600" />
                            </div>
                            <h2 className="text-2xl font-bold text-gray-900 mb-2">¡Cita Agendada!</h2>
                            <p className="text-gray-600 mb-6">
                                Tu cita ha sido registrada exitosamente. El taller confirmará tu solicitud pronto.
                            </p>

                            <div className="bg-gray-50 rounded-xl p-4 mb-6 text-left">
                                <div className="space-y-2 text-sm">
                                    <div className="flex justify-between">
                                        <span className="text-gray-500">Taller:</span>
                                        <span className="font-semibold text-gray-900">{workshop.name}</span>
                                    </div>
                                    <div className="flex justify-between">
                                        <span className="text-gray-500">Servicio:</span>
                                        <span className="font-semibold text-gray-900">{serviceType}</span>
                                    </div>
                                    <div className="flex justify-between">
                                        <span className="text-gray-500">Fecha:</span>
                                        <span className="font-semibold text-gray-900">{selectedDate}</span>
                                    </div>
                                    <div className="flex justify-between">
                                        <span className="text-gray-500">Hora:</span>
                                        <span className="font-semibold text-gray-900">{selectedTime}</span>
                                    </div>
                                </div>
                            </div>

                            <div className="flex gap-3">
                                <button
                                    onClick={() => router.push('/conductores/mapa')}
                                    className="flex-1 px-4 py-3 bg-gray-100 hover:bg-gray-200 text-gray-700 font-semibold rounded-lg transition-colors"
                                >
                                    Volver al Mapa
                                </button>
                                <button
                                    onClick={() => router.push('/conductores/mis-citas')}
                                    className="flex-1 px-4 py-3 bg-blue-600 hover:bg-blue-700 text-white font-semibold rounded-lg transition-colors flex items-center justify-center gap-2"
                                >
                                    <Calendar className="w-5 h-5" />
                                    Ver Mis Citas
                                </button>
                            </div>
                        </div>
                    </div>
                </div>
            )}
        </div>
    );
}
