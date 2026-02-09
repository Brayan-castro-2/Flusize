'use client';

import { useState } from 'react';
import { useRouter } from 'next/navigation';
import Link from 'next/link';
import { Button } from '@/components/ui/button';
import { Input } from '@/components/ui/input';
import { Label } from '@/components/ui/label';
import { ArrowLeft, Wrench, MapPin, Phone, Mail, Building, CheckCircle } from 'lucide-react';

const Logo = () => (
    <div className="flex items-center gap-2">
        <div className="relative w-8 h-8">
            <div className="absolute inset-0 bg-gradient-to-tr from-cyan-500 to-blue-600 rounded-tr-xl rounded-bl-xl transform skew-x-[-10deg]"></div>
            <div className="absolute top-1/2 left-0 w-5 h-1 bg-white transform -translate-y-1/2 skew-x-[-10deg] ml-1"></div>
            <div className="absolute bottom-2 left-1 w-3 h-1 bg-white skew-x-[-10deg]"></div>
        </div>
        <div className="flex flex-col leading-none">
            <span className="font-extrabold text-2xl tracking-wide text-white">FLUSIZE</span>
            <span className="text-[0.6rem] font-medium text-cyan-400 tracking-wider">ORDEN Y CONTROL</span>
        </div>
    </div>
);

export default function RegistroTallerPage() {
    const router = useRouter();
    const [formData, setFormData] = useState({
        nombreTaller: '',
        nombreEncargado: '',
        email: '',
        telefono: '',
        direccion: '',
        ciudad: '',
        servicios: [] as string[],
    });

    const serviciosDisponibles = [
        'Mecánica General',
        'Frenos',
        'Suspensión',
        'Electricidad',
        'Diagnóstico Computarizado',
        'Cambio de Aceite',
        'Alineación y Balanceo',
        'Neumáticos',
    ];

    const handleSubmit = (e: React.FormEvent) => {
        e.preventDefault();
        // Redirect to pricing plans
        router.push('/planes');
    };

    const toggleServicio = (servicio: string) => {
        setFormData(prev => ({
            ...prev,
            servicios: prev.servicios.includes(servicio)
                ? prev.servicios.filter(s => s !== servicio)
                : [...prev.servicios, servicio]
        }));
    };

    return (
        <main className="min-h-screen bg-gradient-to-br from-slate-900 via-slate-800 to-slate-900 relative overflow-hidden">
            {/* Background decorations */}
            <div className="absolute top-0 right-0 w-96 h-96 bg-cyan-500/10 rounded-full blur-3xl"></div>
            <div className="absolute bottom-0 left-0 w-96 h-96 bg-blue-600/10 rounded-full blur-3xl"></div>

            {/* Header */}
            <div className="relative z-10 border-b border-slate-700 bg-slate-900/50 backdrop-blur-sm">
                <div className="max-w-7xl mx-auto px-6 py-4 flex items-center justify-between">
                    <Logo />
                    <Link href="/login">
                        <button className="text-slate-400 hover:text-cyan-400 transition-colors text-sm font-medium">
                            ¿Ya tienes cuenta? Inicia sesión
                        </button>
                    </Link>
                </div>
            </div>

            <div className="relative z-10 max-w-4xl mx-auto px-6 py-12">
                {/* Back Button */}
                <Link href="/">
                    <button className="flex items-center gap-2 text-slate-400 hover:text-cyan-400 transition-colors mb-8">
                        <ArrowLeft className="w-5 h-5" />
                        <span className="text-sm font-medium">Volver al inicio</span>
                    </button>
                </Link>

                {/* Header */}
                <div className="text-center mb-12">
                    <div className="inline-flex items-center gap-2 px-4 py-2 rounded-full bg-cyan-500/10 text-cyan-400 border border-cyan-500/20 mb-4">
                        <Wrench className="w-4 h-4" />
                        <span className="text-sm font-semibold">Únete a la Red Flusize</span>
                    </div>
                    <h1 className="text-4xl font-bold text-white mb-4">Registra tu Taller</h1>
                    <p className="text-slate-400 text-lg max-w-2xl mx-auto">
                        Conecta con miles de clientes, gestiona tus citas y haz crecer tu negocio con nuestra plataforma.
                    </p>
                </div>

                {/* Registration Form */}
                <div className="bg-slate-800/50 backdrop-blur-md rounded-2xl p-8 border border-slate-700 shadow-2xl">
                    <form onSubmit={handleSubmit} className="space-y-6">
                        {/* Business Info */}
                        <div className="space-y-4">
                            <h2 className="text-xl font-bold text-white flex items-center gap-2">
                                <Building className="w-5 h-5 text-cyan-400" />
                                Información del Taller
                            </h2>

                            <div className="grid grid-cols-1 md:grid-cols-2 gap-4">
                                <div className="space-y-2">
                                    <Label className="text-slate-300">Nombre del Taller *</Label>
                                    <Input
                                        required
                                        value={formData.nombreTaller}
                                        onChange={(e) => setFormData({ ...formData, nombreTaller: e.target.value })}
                                        placeholder="Ej: Taller Mecánico Los Andes"
                                        className="bg-slate-900/50 border-slate-600 text-white"
                                    />
                                </div>

                                <div className="space-y-2">
                                    <Label className="text-slate-300">Nombre del Encargado *</Label>
                                    <Input
                                        required
                                        value={formData.nombreEncargado}
                                        onChange={(e) => setFormData({ ...formData, nombreEncargado: e.target.value })}
                                        placeholder="Ej: Juan Pérez"
                                        className="bg-slate-900/50 border-slate-600 text-white"
                                    />
                                </div>
                            </div>
                        </div>

                        {/* Contact Info */}
                        <div className="space-y-4">
                            <h2 className="text-xl font-bold text-white flex items-center gap-2">
                                <Phone className="w-5 h-5 text-cyan-400" />
                                Información de Contacto
                            </h2>

                            <div className="grid grid-cols-1 md:grid-cols-2 gap-4">
                                <div className="space-y-2">
                                    <Label className="text-slate-300">Email *</Label>
                                    <Input
                                        required
                                        type="email"
                                        value={formData.email}
                                        onChange={(e) => setFormData({ ...formData, email: e.target.value })}
                                        placeholder="contacto@taller.cl"
                                        className="bg-slate-900/50 border-slate-600 text-white"
                                    />
                                </div>

                                <div className="space-y-2">
                                    <Label className="text-slate-300">Teléfono *</Label>
                                    <Input
                                        required
                                        type="tel"
                                        value={formData.telefono}
                                        onChange={(e) => setFormData({ ...formData, telefono: e.target.value })}
                                        placeholder="+56 9 1234 5678"
                                        className="bg-slate-900/50 border-slate-600 text-white"
                                    />
                                </div>
                            </div>
                        </div>

                        {/* Location */}
                        <div className="space-y-4">
                            <h2 className="text-xl font-bold text-white flex items-center gap-2">
                                <MapPin className="w-5 h-5 text-cyan-400" />
                                Ubicación
                            </h2>

                            <div className="grid grid-cols-1 md:grid-cols-2 gap-4">
                                <div className="space-y-2">
                                    <Label className="text-slate-300">Dirección *</Label>
                                    <Input
                                        required
                                        value={formData.direccion}
                                        onChange={(e) => setFormData({ ...formData, direccion: e.target.value })}
                                        placeholder="Av. Principal 123"
                                        className="bg-slate-900/50 border-slate-600 text-white"
                                    />
                                </div>

                                <div className="space-y-2">
                                    <Label className="text-slate-300">Ciudad *</Label>
                                    <Input
                                        required
                                        value={formData.ciudad}
                                        onChange={(e) => setFormData({ ...formData, ciudad: e.target.value })}
                                        placeholder="Puerto Montt"
                                        className="bg-slate-900/50 border-slate-600 text-white"
                                    />
                                </div>
                            </div>
                        </div>

                        {/* Services */}
                        <div className="space-y-4">
                            <h2 className="text-xl font-bold text-white flex items-center gap-2">
                                <Wrench className="w-5 h-5 text-cyan-400" />
                                Servicios que Ofreces
                            </h2>

                            <div className="grid grid-cols-2 md:grid-cols-3 gap-3">
                                {serviciosDisponibles.map((servicio) => (
                                    <button
                                        key={servicio}
                                        type="button"
                                        onClick={() => toggleServicio(servicio)}
                                        className={`p-3 rounded-lg border-2 transition-all text-sm font-medium ${formData.servicios.includes(servicio)
                                                ? 'border-cyan-500 bg-cyan-500/10 text-cyan-400'
                                                : 'border-slate-600 bg-slate-900/50 text-slate-400 hover:border-slate-500'
                                            }`}
                                    >
                                        <div className="flex items-center gap-2">
                                            {formData.servicios.includes(servicio) && (
                                                <CheckCircle className="w-4 h-4" />
                                            )}
                                            <span>{servicio}</span>
                                        </div>
                                    </button>
                                ))}
                            </div>
                        </div>

                        {/* Submit */}
                        <div className="pt-6 border-t border-slate-700">
                            <Button
                                type="submit"
                                className="w-full h-14 bg-gradient-to-r from-cyan-500 to-blue-600 hover:from-cyan-400 hover:to-blue-500 text-white text-lg font-semibold rounded-xl shadow-lg shadow-cyan-500/25"
                            >
                                Ver Planes y Continuar
                            </Button>
                            <p className="text-center text-xs text-slate-500 mt-4">
                                Al continuar, aceptas nuestros términos y condiciones
                            </p>
                        </div>
                    </form>
                </div>
            </div>
        </main>
    );
}
