'use server';

import { createClient } from '@supabase/supabase-js';
import { revalidatePath } from 'next/cache';

const supabaseUrl = process.env.NEXT_PUBLIC_SUPABASE_URL!;
const supabaseServiceKey = process.env.SUPABASE_SERVICE_ROLE_KEY || process.env.NEXT_PUBLIC_SUPABASE_ANON_KEY!;

const supabaseAdmin = createClient(supabaseUrl, supabaseServiceKey, {
    auth: {
        autoRefreshToken: false,
        persistSession: false
    }
});

export async function getWorkshopData(tallerId: string) {
    try {
        const { data, error } = await supabaseAdmin
            .from('talleres')
            .select('*')
            .eq('id', tallerId)
            .single();

        if (error) throw error;
        return { success: true, data };
    } catch (error: any) {
        console.error('[Action] Error fetching workshop data:', error);
        return { success: false, error: error.message };
    }
}

export async function updateWorkshopAction(tallerId: string, updates: any) {
    try {
        const { error } = await supabaseAdmin
            .from('talleres')
            .update(updates)
            .eq('id', tallerId);

        if (error) throw error;

        revalidatePath('/admin/perfil');
        revalidatePath(`/${updates.slug || ''}`); // Revalidar Bio-Link si cambió el slug o datos

        return { success: true, message: 'Perfil actualizado correctamente' };
    } catch (error: any) {
        console.error('[Action] Error updating workshop:', error);
        return { success: false, error: error.message };
    }
}

export async function uploadLogoAction(tallerId: string, formData: FormData) {
    try {
        const file = formData.get('file') as File;
        if (!file) throw new Error('No se proporcionó ningún archivo');

        const fileExt = file.name.split('.').pop();
        const fileName = `${tallerId}/logo-${Date.now()}.${fileExt}`;
        const filePath = `${fileName}`;

        // Subir al bucket 'logos_talleres'
        const { error: uploadError } = await supabaseAdmin.storage
            .from('logos_talleres')
            .upload(filePath, file, {
                upsert: true,
                contentType: file.type
            });

        if (uploadError) throw uploadError;

        // Obtener URL pública
        const { data: { publicUrl } } = supabaseAdmin.storage
            .from('logos_talleres')
            .getPublicUrl(filePath);

        // Actualizar tabla talleres
        const { error: updateError } = await supabaseAdmin
            .from('talleres')
            .update({ logo_url: publicUrl })
            .eq('id', tallerId);

        if (updateError) throw updateError;

        revalidatePath('/admin/perfil');
        return { success: true, logoUrl: publicUrl };
    } catch (error: any) {
        console.error('[Action] Error uploading logo:', error);
        return { success: false, error: error.message };
    }
}

export async function uploadPortadaAction(tallerId: string, formData: FormData) {
    try {
        const file = formData.get('file') as File;
        if (!file) throw new Error('No se proporcionó ningún archivo');

        const fileExt = file.name.split('.').pop();
        const fileName = `${tallerId}/portada-${Date.now()}.${fileExt}`;
        const filePath = `${fileName}`;

        // Subir al bucket 'portadas_talleres'
        // Nota: Asegúrate de que el bucket exista en Supabase
        const { error: uploadError } = await supabaseAdmin.storage
            .from('portadas_talleres')
            .upload(filePath, file, {
                upsert: true,
                contentType: file.type
            });

        if (uploadError) throw uploadError;

        // Obtener URL pública
        const { data: { publicUrl } } = supabaseAdmin.storage
            .from('portadas_talleres')
            .getPublicUrl(filePath);

        // Actualizar tabla talleres
        const { error: updateError } = await supabaseAdmin
            .from('talleres')
            .update({ portada_url: publicUrl })
            .eq('id', tallerId);

        if (updateError) throw updateError;

        revalidatePath('/admin/perfil');
        revalidatePath(`/`); // Revalidar por si se ve en algún listado
        return { success: true, portadaUrl: publicUrl };
    } catch (error: any) {
        console.error('[Action] Error uploading portada:', error);
        return { success: false, error: error.message };
    }
}
