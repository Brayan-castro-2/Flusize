import { NextRequest, NextResponse } from 'next/server';
import { obtenerOrdenPorId } from '@/lib/storage-adapter';
import { isValidTokenFormat } from '@/lib/token-utils';

export async function GET(
    request: NextRequest,
    { params }: { params: { id: string; token: string } }
) {
    try {
        const ordenId = parseInt(params.id);
        const token = params.token;

        // Validar formato del token
        if (!isValidTokenFormat(token)) {
            return NextResponse.json(
                { error: 'Token inválido' },
                { status: 400 }
            );
        }

        // Obtener orden
        const orden = await obtenerOrdenPorId(ordenId);

        if (!orden) {
            return NextResponse.json(
                { error: 'Orden no encontrada' },
                { status: 404 }
            );
        }

        // Validar que el token coincida
        if (orden.access_token !== token) {
            return NextResponse.json(
                { error: 'Acceso denegado' },
                { status: 403 }
            );
        }

        // Actualizar última visualización pública
        // TODO: Implementar updateLastPublicView en storage-adapter

        // Retornar datos públicos (sin información sensible)
        const publicData = {
            orden_id: orden.id,
            patente: orden.patente,
            estado: orden.estado,
            fecha_ingreso: orden.fecha_ingreso,
            fecha_estimada_entrega: orden.fecha_estimada_entrega,
            descripcion_trabajo: orden.descripcion_trabajo,
            fotos_urls: orden.fotos_urls || [],
            taller: {
                nombre: orden.taller_nombre || 'Taller',
                // TODO: Agregar logo y teléfono del taller
            },
            // NO incluir: precios, costos, notas privadas
        };

        return NextResponse.json(publicData);
    } catch (error) {
        console.error('Error en API pública de orden:', error);
        return NextResponse.json(
            { error: 'Error interno del servidor' },
            { status: 500 }
        );
    }
}
