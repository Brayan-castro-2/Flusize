import crypto from 'crypto';

/**
 * Genera un token aleatorio de 8 caracteres alfanuméricos
 * Ejemplo: "a7f3k9m2"
 */
export function generateAccessToken(): string {
    return crypto.randomBytes(4).toString('hex');
}

/**
 * Genera un token más largo y seguro (16 caracteres)
 * Ejemplo: "a7f3k9m2b5d8e1c4"
 */
export function generateSecureToken(): string {
    return crypto.randomBytes(8).toString('hex');
}

/**
 * Genera el enlace público completo para una orden
 * @param ordenId - ID de la orden
 * @param token - Token de acceso
 * @returns URL completa del enlace público
 */
export function generatePublicOrderLink(ordenId: number, token: string): string {
    const baseUrl = process.env.NEXT_PUBLIC_APP_URL || 'http://localhost:3000';
    return `${baseUrl}/orden/${ordenId}/${token}`;
}

/**
 * Valida el formato de un token
 * @param token - Token a validar
 * @returns true si el token tiene formato válido
 */
export function isValidTokenFormat(token: string): boolean {
    // Token debe ser hexadecimal de 8 o 16 caracteres
    return /^[a-f0-9]{8}$|^[a-f0-9]{16}$/i.test(token);
}
