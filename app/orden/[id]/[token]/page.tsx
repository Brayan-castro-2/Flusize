'use client';

import { useEffect, useState } from 'react';
import { useParams, useRouter } from 'next/navigation';
import { Loader2, Car, Calendar, Clock, CheckCircle2, AlertCircle } from 'lucide-react';
import { Card, CardContent, CardHeader, CardTitle } from '@/components/ui/card';
import { Badge } from '@/components/ui/badge';
import { Button } from '@/components/ui/button';

interface PublicOrderData {
    orden_id: number;
    patente: string;
    estado: string;
    fecha_ingreso: string;
    fecha_estimada_entrega?: string;
    descripcion_trabajo?: string;
    fotos_urls: string[];
    taller: {
        nombre: string;
    };
}

const STATUS_CONFIG: Record<string, { label: string; color: string; icon: any }> = {
    pendiente: { label: 'Pendiente', color: 'bg-amber-100 text-amber-800 border-amber-300', icon: Clock },
    en_progreso: { label: 'En Progreso', color: 'bg-blue-100 text-blue-800 border-blue-300', icon: AlertCircle },
    completada: { label: 'Completada', color: 'bg-green-100 text-green-800 border-green-300', icon: CheckCircle2 },
};

export default function PublicOrderPage() {
    const params = useParams();
    const router = useRouter();
    const [order, setOrder] = useState<PublicOrderData | null>(null);
    const [loading, setLoading] = useState(true);
    const [error, setError] = useState<string | null>(null);

    useEffect(() => {
        async function fetchOrder() {
            try {
                const response = await fetch(`/api/public/orden/${params.id}/${params.token}`);

                if (!response.ok) {
                    if (response.status === 404) {
                        setError('Orden no encontrada');
                    } else if (response.status === 403) {
                        setError('Enlace inválido o expirado');
                    } else {
                        setError('Error al cargar la orden');
                    }
                    return;
                }

                const data = await response.json();
                setOrder(data);
            } catch (err) {
                setError('Error de conexión');
            } finally {
                setLoading(false);
            }
        }

        fetchOrder();
    }, [params.id, params.token]);

    if (loading) {
        return (
            <div className="min-h-screen bg-gradient-to-br from-blue-50 to-cyan-50 flex items-center justify-center">
                <div className="text-center">
                    <Loader2 className="w-12 h-12 animate-spin text-blue-600 mx-auto mb-4" />
                    <p className="text-gray-600">Cargando información...</p>
                </div>
            </div>
        );
    }

    if (error || !order) {
        return (
            <div className="min-h-screen bg-gradient-to-br from-blue-50 to-cyan-50 flex items-center justify-center p-4">
                <Card className="max-w-md w-full">
                    <CardContent className="pt-6 text-center">
                        <AlertCircle className="w-16 h-16 text-red-500 mx-auto mb-4" />
                        <h2 className="text-2xl font-bold text-gray-900 mb-2">
                            {error || 'Orden no encontrada'}
                        </h2>
                        <p className="text-gray-600 mb-6">
                            El enlace puede ser inválido o haber expirado.
                        </p>
                        <Button onClick={() => router.push('/')} className="bg-blue-600 hover:bg-blue-700">
                            Volver al inicio
                        </Button>
                    </CardContent>
                </Card>
            </div>
        );
    }

    const statusConfig = STATUS_CONFIG[order.estado] || STATUS_CONFIG.pendiente;
    const StatusIcon = statusConfig.icon;

    return (
        <div className="min-h-screen bg-gradient-to-br from-blue-50 to-cyan-50">
            {/* Header */}
            <header className="bg-gradient-to-r from-blue-500 to-cyan-400 shadow-md">
                <div className="max-w-4xl mx-auto px-4 py-6">
                    <div className="flex items-center gap-3">
                        <div className="relative w-12 h-12">
                            <div className="absolute inset-0 bg-white rounded-tr-xl rounded-bl-xl transform skew-x-[-10deg]"></div>
                            <div className="absolute top-1/2 left-0 w-8 h-1 bg-blue-600 transform -translate-y-1/2 skew-x-[-10deg] ml-1"></div>
                            <div className="absolute bottom-2 left-1 w-5 h-1 bg-blue-600 skew-x-[-10deg]"></div>
                        </div>
                        <div>
                            <h1 className="text-2xl font-bold text-white">FLUSIZE</h1>
                            <p className="text-sm text-blue-100">{order.taller.nombre}</p>
                        </div>
                    </div>
                </div>
            </header>

            {/* Main Content */}
            <main className="max-w-4xl mx-auto px-4 py-8 space-y-6">
                {/* Vehicle Status Card */}
                <Card className="border-2 border-blue-200 shadow-lg">
                    <CardHeader className="bg-gradient-to-r from-blue-50 to-cyan-50">
                        <div className="flex items-center justify-between">
                            <div className="flex items-center gap-3">
                                <Car className="w-8 h-8 text-blue-600" />
                                <div>
                                    <CardTitle className="text-3xl font-bold text-gray-900">
                                        {order.patente}
                                    </CardTitle>
                                    <p className="text-sm text-gray-600">Orden #{order.orden_id}</p>
                                </div>
                            </div>
                            <Badge className={`${statusConfig.color} border px-4 py-2 text-sm font-semibold`}>
                                <StatusIcon className="w-4 h-4 mr-2" />
                                {statusConfig.label}
                            </Badge>
                        </div>
                    </CardHeader>
                    <CardContent className="pt-6 space-y-4">
                        <div className="grid grid-cols-1 md:grid-cols-2 gap-4">
                            <div className="flex items-center gap-3 p-3 bg-gray-50 rounded-lg">
                                <Calendar className="w-5 h-5 text-blue-600" />
                                <div>
                                    <p className="text-xs text-gray-500">Fecha de Ingreso</p>
                                    <p className="font-semibold text-gray-900">
                                        {new Date(order.fecha_ingreso).toLocaleDateString('es-CL')}
                                    </p>
                                </div>
                            </div>
                            {order.fecha_estimada_entrega && (
                                <div className="flex items-center gap-3 p-3 bg-gray-50 rounded-lg">
                                    <Clock className="w-5 h-5 text-blue-600" />
                                    <div>
                                        <p className="text-xs text-gray-500">Entrega Estimada</p>
                                        <p className="font-semibold text-gray-900">
                                            {new Date(order.fecha_estimada_entrega).toLocaleDateString('es-CL')}
                                        </p>
                                    </div>
                                </div>
                            )}
                        </div>

                        {order.descripcion_trabajo && (
                            <div className="mt-4">
                                <h3 className="font-semibold text-gray-900 mb-2">Trabajo Realizado</h3>
                                <p className="text-gray-700 bg-gray-50 p-4 rounded-lg">
                                    {order.descripcion_trabajo}
                                </p>
                            </div>
                        )}
                    </CardContent>
                </Card>

                {/* CTA Card */}
                <Card className="bg-gradient-to-r from-blue-600 to-cyan-500 text-white border-0 shadow-lg">
                    <CardContent className="pt-6 text-center">
                        <h3 className="text-2xl font-bold mb-2">¿Quieres historial completo?</h3>
                        <p className="text-blue-100 mb-4">
                            Crea tu cuenta gratis en Flusize y accede al historial de todas tus mantenciones
                        </p>
                        <Button
                            onClick={() => router.push('/registro-taller')}
                            className="bg-white text-blue-600 hover:bg-gray-100 font-semibold"
                        >
                            Crear Cuenta Gratis
                        </Button>
                    </CardContent>
                </Card>
            </main>
        </div>
    );
}
