'use client';

import { useState, useEffect } from 'react';
import { useRouter } from 'next/navigation';
import { Calendar, MapPin, Clock, Wrench, X, CheckCircle, AlertCircle, ChevronRight } from 'lucide-react';
import { getAppointments, cancelAppointment, type ClientAppointment } from '@/lib/appointmentStorage';
import Link from 'next/link';

export default function MisCitasPage() {
    const router = useRouter();
    const [appointments, setAppointments] = useState<ClientAppointment[]>([]);
    const [filter, setFilter] = useState<'all' | 'pending' | 'confirmed' | 'completed' | 'cancelled'>('all');
    const [loading, setLoading] = useState(true);

    useEffect(() => {
        // Load appointments from localStorage
        const loadAppointments = () => {
            const allAppointments = getAppointments();
            setAppointments(allAppointments);
            setLoading(false);
        };

        loadAppointments();
    }, []);

    const handleCancelAppointment = (id: number) => {
        if (confirm('¿Estás seguro de que quieres cancelar esta cita?')) {
            cancelAppointment(id);
            setAppointments(getAppointments());
        }
    };

    const filteredAppointments = appointments.filter(apt => {
        if (filter === 'all') return true;
        return apt.status === filter;
    });

    const getStatusBadge = (status: ClientAppointment['status']) => {
        const badges = {
            pending: { text: 'Pendiente', class: 'bg-yellow-100 text-yellow-700 border-yellow-200', icon: Clock },
            confirmed: { text: 'Confirmada', class: 'bg-blue-100 text-blue-700 border-blue-200', icon: CheckCircle },
            completed: { text: 'Completada', class: 'bg-green-100 text-green-700 border-green-200', icon: CheckCircle },
            cancelled: { text: 'Cancelada', class: 'bg-red-100 text-red-700 border-red-200', icon: X },
        };
        const badge = badges[status];
        const Icon = badge.icon;
        return (
            <span className={`inline-flex items-center gap-1 px-3 py-1 rounded-full text-xs font-bold border ${badge.class}`}>
                <Icon className="w-3 h-3" />
                {badge.text}
            </span>
        );
    };

    const formatDate = (dateStr: string) => {
        const date = new Date(dateStr);
        return date.toLocaleDateString('es-CL', {
            weekday: 'short',
            day: 'numeric',
            month: 'short',
            year: 'numeric'
        });
    };

    const pendingCount = appointments.filter(a => a.status === 'pending').length;

    return (
        <div className="min-h-screen bg-gray-50 flex flex-col">
            {/* Navbar */}
            <nav className="bg-white shadow-sm border-b border-gray-200 z-50">
                <div className="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8">
                    <div className="flex justify-between h-16">
                        <div className="flex items-center cursor-pointer" onClick={() => router.push('/')}>
                            <span className="font-extrabold text-2xl tracking-wide text-slate-900">FLUSIZE</span>
                            <span className="text-[0.6rem] font-medium text-blue-600 ml-1 mt-1 tracking-wider uppercase">Drivers</span>
                        </div>
                        <div className="flex items-center gap-4">
                            <Link href="/conductores/mapa">
                                <button className="text-sm text-gray-500 hover:text-gray-900 font-medium flex items-center gap-2">
                                    <MapPin className="w-4 h-4" />
                                    Buscar Talleres
                                </button>
                            </Link>
                            <Link href="/conductores/mis-citas">
                                <button className="text-sm text-blue-600 hover:text-blue-700 font-bold flex items-center gap-2">
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

            {/* Header */}
            <div className="bg-gradient-to-r from-blue-600 to-cyan-500 text-white py-12">
                <div className="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8">
                    <h1 className="text-3xl md:text-4xl font-bold mb-2 flex items-center gap-3">
                        <Calendar className="w-8 h-8" />
                        Mis Citas
                    </h1>
                    <p className="text-blue-100">Gestiona tus citas agendadas con talleres mecánicos</p>
                </div>
            </div>

            {/* Filters */}
            <div className="bg-white shadow-sm border-b border-gray-200">
                <div className="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8 py-4">
                    <div className="flex gap-2 overflow-x-auto">
                        <button
                            onClick={() => setFilter('all')}
                            className={`px-4 py-2 rounded-lg font-semibold text-sm whitespace-nowrap transition-colors ${filter === 'all'
                                    ? 'bg-blue-600 text-white'
                                    : 'bg-gray-100 text-gray-700 hover:bg-gray-200'
                                }`}
                        >
                            Todas ({appointments.length})
                        </button>
                        <button
                            onClick={() => setFilter('pending')}
                            className={`px-4 py-2 rounded-lg font-semibold text-sm whitespace-nowrap transition-colors ${filter === 'pending'
                                    ? 'bg-yellow-600 text-white'
                                    : 'bg-gray-100 text-gray-700 hover:bg-gray-200'
                                }`}
                        >
                            Pendientes ({appointments.filter(a => a.status === 'pending').length})
                        </button>
                        <button
                            onClick={() => setFilter('confirmed')}
                            className={`px-4 py-2 rounded-lg font-semibold text-sm whitespace-nowrap transition-colors ${filter === 'confirmed'
                                    ? 'bg-blue-600 text-white'
                                    : 'bg-gray-100 text-gray-700 hover:bg-gray-200'
                                }`}
                        >
                            Confirmadas ({appointments.filter(a => a.status === 'confirmed').length})
                        </button>
                        <button
                            onClick={() => setFilter('completed')}
                            className={`px-4 py-2 rounded-lg font-semibold text-sm whitespace-nowrap transition-colors ${filter === 'completed'
                                    ? 'bg-green-600 text-white'
                                    : 'bg-gray-100 text-gray-700 hover:bg-gray-200'
                                }`}
                        >
                            Completadas ({appointments.filter(a => a.status === 'completed').length})
                        </button>
                    </div>
                </div>
            </div>

            {/* Appointments List */}
            <div className="flex-1 max-w-7xl mx-auto px-4 sm:px-6 lg:px-8 py-8 w-full">
                {loading ? (
                    <div className="flex justify-center py-12">
                        <div className="animate-spin rounded-full h-12 w-12 border-b-2 border-blue-600"></div>
                    </div>
                ) : filteredAppointments.length === 0 ? (
                    <div className="text-center py-12">
                        <Calendar className="w-16 h-16 text-gray-300 mx-auto mb-4" />
                        <h3 className="text-xl font-bold text-gray-800 mb-2">
                            {filter === 'all' ? 'No tienes citas agendadas' : `No tienes citas ${filter === 'pending' ? 'pendientes' : filter === 'confirmed' ? 'confirmadas' : 'completadas'}`}
                        </h3>
                        <p className="text-gray-500 mb-6">Busca talleres cercanos y agenda tu próxima mantención</p>
                        <Link href="/conductores/mapa">
                            <button className="bg-blue-600 hover:bg-blue-700 text-white font-bold py-3 px-6 rounded-lg transition-colors">
                                Buscar Talleres
                            </button>
                        </Link>
                    </div>
                ) : (
                    <div className="space-y-4">
                        {filteredAppointments.map((appointment) => (
                            <div
                                key={appointment.id}
                                className="bg-white rounded-xl shadow-sm border border-gray-200 p-6 hover:shadow-md transition-shadow"
                            >
                                <div className="flex flex-col md:flex-row gap-4">
                                    {/* Workshop Image */}
                                    <div className="w-full md:w-32 h-32 rounded-lg overflow-hidden flex-shrink-0">
                                        <img
                                            src={appointment.workshopImage}
                                            alt={appointment.workshopName}
                                            className="w-full h-full object-cover"
                                        />
                                    </div>

                                    {/* Appointment Details */}
                                    <div className="flex-1">
                                        <div className="flex items-start justify-between mb-3">
                                            <div>
                                                <h3 className="text-xl font-bold text-gray-900 mb-1">
                                                    {appointment.workshopName}
                                                </h3>
                                                <p className="text-sm text-gray-500 flex items-center gap-1">
                                                    <MapPin className="w-4 h-4" />
                                                    {appointment.workshopLocation}
                                                </p>
                                            </div>
                                            {getStatusBadge(appointment.status)}
                                        </div>

                                        <div className="grid grid-cols-1 md:grid-cols-3 gap-4 mb-4">
                                            <div className="flex items-center gap-2 text-gray-700">
                                                <Calendar className="w-5 h-5 text-blue-600" />
                                                <div>
                                                    <p className="text-xs text-gray-500">Fecha</p>
                                                    <p className="font-semibold">{formatDate(appointment.date)}</p>
                                                </div>
                                            </div>
                                            <div className="flex items-center gap-2 text-gray-700">
                                                <Clock className="w-5 h-5 text-blue-600" />
                                                <div>
                                                    <p className="text-xs text-gray-500">Hora</p>
                                                    <p className="font-semibold">{appointment.time}</p>
                                                </div>
                                            </div>
                                            <div className="flex items-center gap-2 text-gray-700">
                                                <Wrench className="w-5 h-5 text-blue-600" />
                                                <div>
                                                    <p className="text-xs text-gray-500">Servicio</p>
                                                    <p className="font-semibold">{appointment.serviceType}</p>
                                                </div>
                                            </div>
                                        </div>

                                        <div className="flex items-center justify-between pt-4 border-t border-gray-100">
                                            <div>
                                                <p className="text-sm text-gray-500">Precio Estimado</p>
                                                <p className="text-2xl font-bold text-gray-900">
                                                    ${appointment.estimatedPrice.toLocaleString()}
                                                </p>
                                            </div>

                                            <div className="flex gap-2">
                                                <Link href={`/conductores/parking/${appointment.workshopId}`}>
                                                    <button className="px-4 py-2 bg-gray-100 hover:bg-gray-200 text-gray-700 font-semibold rounded-lg transition-colors flex items-center gap-2">
                                                        Ver Taller
                                                        <ChevronRight className="w-4 h-4" />
                                                    </button>
                                                </Link>
                                                {appointment.status === 'pending' && (
                                                    <button
                                                        onClick={() => handleCancelAppointment(appointment.id)}
                                                        className="px-4 py-2 bg-red-50 hover:bg-red-100 text-red-600 font-semibold rounded-lg transition-colors flex items-center gap-2"
                                                    >
                                                        <X className="w-4 h-4" />
                                                        Cancelar
                                                    </button>
                                                )}
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        ))}
                    </div>
                )}
            </div>
        </div>
    );
}
