import { getOrdenPublica } from '@/lib/public-actions'
import { notFound } from 'next/navigation'
import Image from 'next/image'
import Link from 'next/link'

interface PageProps {
    params: {
        slug: string
        id: string
    }
}

export default async function OrdenPublicaPage({ params }: PageProps) {
    const ordenId = parseInt(params.id)
    const resultado = await getOrdenPublica(ordenId, params.slug)

    if (!resultado) {
        notFound()
    }

    const { orden, taller } = resultado
    // vehiculos viene como array de Supabase, tomamos el primero
    const vehiculo = Array.isArray(orden.vehiculos) ? orden.vehiculos[0] : orden.vehiculos
    const cliente = vehiculo?.clientes

    // Mapeo de estados a español
    const estadoTexto = {
        'pendiente': 'Pendiente',
        'en_progreso': 'En Progreso',
        'completada': 'Completada',
        'entregada': 'Entregada',
        'cancelada': 'Cancelada',
        'debe': 'Debe'
    }

    // Calcular progreso
    const progreso = {
        'pendiente': 25,
        'en_progreso': 50,
        'completada': 75,
        'entregada': 100,
        'cancelada': 0,
        'debe': 100
    }

    return (
        <div className="min-h-screen bg-gradient-to-br from-gray-50 to-gray-100">
            {/* Header del Taller */}
            <header className="bg-white shadow-sm border-b">
                <div className="container mx-auto px-4 py-6">
                    <div className="flex items-center gap-4">
                        {taller.logo_url && (
                            <Image
                                src={taller.logo_url}
                                alt={taller.nombre}
                                width={60}
                                height={60}
                                className="rounded-lg"
                            />
                        )}
                        <div>
                            <h1 className="text-2xl font-bold text-gray-900">{taller.nombre}</h1>
                            <p className="text-sm text-gray-600">{taller.direccion}</p>
                        </div>
                    </div>
                </div>
            </header>

            {/* Contenido Principal */}
            <main className="container mx-auto px-4 py-8 max-w-4xl">
                {/* Card Principal */}
                <div className="bg-white rounded-2xl shadow-lg overflow-hidden">
                    {/* Estado y Progreso */}
                    <div className="bg-gradient-to-r from-blue-600 to-blue-700 p-6 text-white">
                        <div className="flex items-center justify-between mb-4">
                            <div>
                                <p className="text-sm opacity-90">Estado de tu vehículo</p>
                                <h2 className="text-3xl font-bold">{estadoTexto[orden.estado as keyof typeof estadoTexto]}</h2>
                            </div>
                            <div className="text-right">
                                <p className="text-sm opacity-90">Orden #{orden.id}</p>
                                <p className="text-lg font-semibold">{vehiculo?.marca} {vehiculo?.modelo}</p>
                            </div>
                        </div>

                        {/* Barra de Progreso */}
                        <div className="w-full bg-blue-800 rounded-full h-3 overflow-hidden">
                            <div
                                className="bg-white h-full transition-all duration-500 rounded-full"
                                style={{ width: `${progreso[orden.estado as keyof typeof progreso]}%` }}
                            />
                        </div>
                    </div>

                    {/* Información del Vehículo */}
                    <div className="p-6 border-b">
                        <h3 className="text-lg font-semibold text-gray-900 mb-4">Información del Vehículo</h3>
                        <div className="grid grid-cols-2 md:grid-cols-4 gap-4">
                            <div>
                                <p className="text-sm text-gray-600">Patente</p>
                                <p className="font-semibold text-gray-900">{orden.patente_vehiculo}</p>
                            </div>
                            <div>
                                <p className="text-sm text-gray-600">Marca</p>
                                <p className="font-semibold text-gray-900">{vehiculo?.marca}</p>
                            </div>
                            <div>
                                <p className="text-sm text-gray-600">Modelo</p>
                                <p className="font-semibold text-gray-900">{vehiculo?.modelo}</p>
                            </div>
                            <div>
                                <p className="text-sm text-gray-600">Año</p>
                                <p className="font-semibold text-gray-900">{vehiculo?.anio}</p>
                            </div>
                        </div>
                    </div>

                    {/* Detalles del Servicio */}
                    <div className="p-6 border-b">
                        <h3 className="text-lg font-semibold text-gray-900 mb-4">Detalles del Servicio</h3>
                        <div className="space-y-3">
                            <div>
                                <p className="text-sm text-gray-600">Descripción</p>
                                <p className="text-gray-900">{orden.descripcion_ingreso}</p>
                            </div>
                            {orden.observaciones_mecanico && (
                                <div>
                                    <p className="text-sm text-gray-600">Observaciones del Mecánico</p>
                                    <p className="text-gray-900">{orden.observaciones_mecanico}</p>
                                </div>
                            )}
                            <div className="grid grid-cols-2 gap-4 pt-2">
                                <div>
                                    <p className="text-sm text-gray-600">Fecha de Ingreso</p>
                                    <p className="font-semibold text-gray-900">
                                        {new Date(orden.fecha_ingreso).toLocaleDateString('es-CL')}
                                    </p>
                                </div>
                                {orden.fecha_entrega && (
                                    <div>
                                        <p className="text-sm text-gray-600">Fecha de Entrega</p>
                                        <p className="font-semibold text-gray-900">
                                            {new Date(orden.fecha_entrega).toLocaleDateString('es-CL')}
                                        </p>
                                    </div>
                                )}
                            </div>
                        </div>
                    </div>

                    {/* Fotos */}
                    {orden.fotos_urls && orden.fotos_urls.length > 0 && (
                        <div className="p-6 border-b">
                            <h3 className="text-lg font-semibold text-gray-900 mb-4">Fotos del Vehículo</h3>
                            <div className="grid grid-cols-2 md:grid-cols-3 gap-4">
                                {orden.fotos_urls.map((url: string, index: number) => (
                                    <div key={index} className="relative aspect-video rounded-lg overflow-hidden">
                                        <Image
                                            src={url}
                                            alt={`Foto ${index + 1}`}
                                            fill
                                            className="object-cover hover:scale-105 transition-transform"
                                        />
                                    </div>
                                ))}
                            </div>
                        </div>
                    )}

                    {/* Precio */}
                    {orden.precio_total > 0 && (
                        <div className="p-6 bg-gray-50">
                            <div className="flex items-center justify-between">
                                <span className="text-lg font-semibold text-gray-900">Total</span>
                                <span className="text-3xl font-bold text-blue-600">
                                    ${orden.precio_total.toLocaleString('es-CL')}
                                </span>
                            </div>
                        </div>
                    )}
                </div>

                {/* CTA: Crear Cuenta */}
                <div className="mt-8 bg-gradient-to-r from-blue-600 to-purple-600 rounded-2xl p-8 text-white text-center">
                    <h3 className="text-2xl font-bold mb-2">¿Quieres historial de tus mantenciones?</h3>
                    <p className="text-blue-100 mb-6">
                        Crea tu cuenta gratis en Fluesize y accede al historial completo de todos tus vehículos
                    </p>
                    <Link
                        href="/registro"
                        className="inline-block bg-white text-blue-600 font-semibold px-8 py-3 rounded-lg hover:bg-blue-50 transition-colors"
                    >
                        Crear Cuenta Gratis
                    </Link>
                </div>

                {/* Información de Contacto */}
                <div className="mt-6 text-center text-gray-600">
                    <p className="text-sm">¿Tienes dudas? Contacta a {taller.nombre}</p>
                    <div className="flex items-center justify-center gap-4 mt-2">
                        {taller.telefono && (
                            <a href={`tel:${taller.telefono}`} className="text-blue-600 hover:underline">
                                {taller.telefono}
                            </a>
                        )}
                        {taller.email && (
                            <a href={`mailto:${taller.email}`} className="text-blue-600 hover:underline">
                                {taller.email}
                            </a>
                        )}
                    </div>
                </div>
            </main>
        </div>
    )
}
