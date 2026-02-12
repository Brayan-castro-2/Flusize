/**
 * Servicio de notificaciones por email
 * Usa Resend (gratis hasta 100 emails/día)
 */

import { OrdenConDetallesDB } from './types';

interface EmailRecipient {
    email?: string;
    telefono?: string;
}

/**
 * Envía notificación cuando se crea una nueva orden
 */
export async function sendOrderCreatedNotification(
    orden: OrdenConDetallesDB,
    cliente: EmailRecipient,
    publicLink: string
): Promise<boolean> {
    if (!cliente.email) {
        console.log('⚠️ No se puede enviar email: cliente sin email');
        return false;
    }

    // TODO: Integrar con Resend API
    console.log('📧 [DEV] Enviando email a:', cliente.email);
    console.log('📧 [DEV] Asunto: Tu vehículo ingresó al taller');
    console.log('📧 [DEV] Enlace público:', publicLink);
    console.log('📧 [DEV] Orden:', orden.id, '-', orden.patente);

    // Simular envío exitoso en desarrollo
    return true;
}

/**
 * Envía notificación cuando cambia el estado de una orden
 */
export async function sendOrderStatusUpdate(
    orden: OrdenConDetallesDB,
    nuevoEstado: string,
    publicLink: string
): Promise<boolean> {
    // TODO: Implementar cuando tengamos email del cliente en la orden
    console.log('📧 [DEV] Actualización de estado:', nuevoEstado);
    console.log('📧 [DEV] Orden:', orden.id);
    console.log('📧 [DEV] Enlace:', publicLink);

    return true;
}

/**
 * Reenvía el enlace público a un cliente
 */
export async function resendPublicLink(
    email: string,
    patente: string,
    publicLink: string
): Promise<boolean> {
    console.log('📧 [DEV] Reenviando enlace a:', email);
    console.log('📧 [DEV] Patente:', patente);
    console.log('📧 [DEV] Enlace:', publicLink);

    return true;
}
