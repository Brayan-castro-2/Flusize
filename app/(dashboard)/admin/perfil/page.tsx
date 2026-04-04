'use client';

import { useState, useEffect, useRef } from 'react';
import { useAuth } from '@/contexts/auth-context';
import { getWorkshopData, updateWorkshopAction, uploadLogoAction, uploadPortadaAction } from './actions';
import {
    Camera,
    Save,
    MapPin,
    Phone,
    Info,
    Wrench,
    ArrowLeft,
    CheckCircle2,
    Loader2,
    AlertCircle,
    Settings,
    UserCircle,
    Globe,
    Image as ImageIcon
} from 'lucide-react';
import { toast } from 'sonner';
import { actualizarPerfil } from '@/lib/storage-adapter';
import { useRouter } from 'next/navigation';
import { ServiciosManager } from '@/components/admin/servicios-manager';

export default function PerfilTallerPage() {
    const { user, refetchUser, hasPermission } = useAuth();
    const router = useRouter();
    const fileInputRef = useRef<HTMLInputElement>(null);
    const portadaInputRef = useRef<HTMLInputElement>(null);

    const [loading, setLoading] = useState(true);
    const [saving, setSaving] = useState(false);
    const [uploadingLogo, setUploadingLogo] = useState(false);
    const [uploadingPortada, setUploadingPortada] = useState(false);
    const [workshop, setWorkshop] = useState<any>(null);
    const [personalInfo, setPersonalInfo] = useState({ nombre: '', email: '' });

    useEffect(() => {
        if (!user) return;
        
        // FASE 75 y PERMISOS: Bloqueo de Perfil para Mecánicos u otros sin permiso.
        // Solo Admin, Superadmin, o quienes tengan explicitamente perfil.editar.
        const isAdmin = user.role === 'admin' || user.role === 'superadmin' || user.role === 'taller_admin';
        if (!isAdmin && !hasPermission('perfil.editar')) {
            router.replace('/admin/ordenes');
            return;
        }

        if (user.tallerId) {
            loadData();
        }
    }, [user?.tallerId, user?.role, hasPermission, router]);

    const loadData = async () => {
        setLoading(true);
        const res = await getWorkshopData(user!.tallerId!);
        if (res.success) {
            setWorkshop(res.data);
            setPersonalInfo({
                nombre: user?.name || '',
                email: user?.email || ''
            });
        } else {
            toast.error('Error al cargar los datos del taller');
        }
        setLoading(false);
    };

    const handleSave = async (e: React.FormEvent) => {
        e.preventDefault();
        setSaving(true);

        const updatesWorkshop = {
            nombre: workshop.nombre,
            descripcion: workshop.descripcion,
            direccion: workshop.direccion,
            telefono: workshop.telefono,
            whatsapp: workshop.whatsapp,
            instagram: workshop.instagram,
            facebook: workshop.facebook,
            sitio_web: workshop.sitio_web,
            ciudad: workshop.ciudad,
            reconocimiento: workshop.reconocimiento,
            estadisticas: workshop.estadisticas,
            color_primario: workshop.color_primario,
            servicios: Array.isArray(workshop.servicios)
                ? workshop.servicios
                : (workshop.servicios || '').split(',').map((s: string) => s.trim()).filter(Boolean)
        };

        try {
            const [resWorkshop, resPersonal] = await Promise.all([
                updateWorkshopAction(user!.tallerId!, updatesWorkshop),
                actualizarPerfil(user!.id, { nombre_completo: personalInfo.nombre })
            ]);

            if (resWorkshop.success && resPersonal) {
                // Sincronizar estado global inmediatamente
                await refetchUser();

                toast.success('Perfil actualizado correctamente');
                // Forzar actualización suave del contexto/UI
                router.refresh();
            } else {
                toast.error('Error al actualizar algunos datos');
            }
        } catch (error: any) {
            toast.error('Error de conexión al guardar');
            console.error(error);
        } finally {
            setSaving(false);
        }
    };

    const handleLogoUpload = async (e: React.ChangeEvent<HTMLInputElement>) => {
        const file = e.target.files?.[0];
        if (!file || !workshop.id) return;

        setUploadingLogo(true);
        const formData = new FormData();
        formData.append('file', file);

        try {
            const result = await uploadLogoAction(workshop.id, formData);
            if (result.success) {
                setWorkshop((prev: any) => ({ ...prev, logo_url: result.logoUrl }));
                toast.success('Logo actualizado');
            } else {
                toast.error(result.error);
            }
        } catch (error) {
            toast.error('Error al subir el logo');
        } finally {
            setUploadingLogo(false);
        }
    };

    const handlePortadaUpload = async (e: React.ChangeEvent<HTMLInputElement>) => {
        const file = e.target.files?.[0];
        if (!file || !workshop.id) return;

        setUploadingPortada(true);
        const formData = new FormData();
        formData.append('file', file);

        try {
            const result = await uploadPortadaAction(workshop.id, formData);
            if (result.success) {
                setWorkshop((prev: any) => ({ ...prev, portada_url: result.portadaUrl }));
                toast.success('Foto de portada actualizada');
            } else {
                toast.error(result.error);
            }
        } catch (error) {
            toast.error('Error al subir la portada');
        } finally {
            setUploadingPortada(false);
        }
    };
    if (loading) {
        return (
            <div className="flex flex-col items-center justify-center min-h-[60vh]">
                <Loader2 className="w-10 h-10 text-violet-500 animate-spin" />
                <p className="text-slate-500 mt-4 font-medium animate-pulse">Cargando perfil...</p>
            </div>
        );
    }

    return (
        <div className="max-w-4xl mx-auto p-4 sm:p-6 lg:p-10 space-y-8">
            {/* Header */}
            <div className="flex flex-col sm:flex-row sm:items-center justify-between gap-6">
                <div className="space-y-1">
                    <h1 className="text-2xl md:text-3xl font-black text-gray-900 tracking-tight flex items-center gap-3">
                        <div className="w-10 h-10 bg-gradient-to-br from-cyan-500 to-blue-600 rounded-xl flex items-center justify-center shadow-lg shadow-blue-500/30">
                            <Settings className="w-5 h-5 text-gray-900" />
                        </div>
                        Perfil del Taller
                    </h1>
                    <p className="text-gray-500 font-medium">Gestiona tu identidad pública y presencia digital</p>
                </div>
                <div className="flex flex-wrap gap-3">
                    {workshop?.sitio_web && (
                        <a
                            href={workshop.sitio_web.startsWith('http') ? workshop.sitio_web : `https://${workshop.sitio_web}`}
                            target="_blank"
                            rel="noopener noreferrer"
                            className="inline-flex items-center gap-2 px-4 py-2.5 bg-white border border-gray-200 rounded-xl text-xs font-bold text-gray-600 hover:text-blue-600 hover:border-blue-500 transition-all uppercase tracking-widest shadow-sm shadow-gray-200/50"
                        >
                            <Globe className="w-4 h-4 text-blue-500" /> Sitio Web
                        </a>
                    )}
                    {workshop?.slug && (
                        <a
                            href={`/${workshop.slug}`}
                            target="_blank"
                            className="inline-flex items-center gap-2 px-4 py-2.5 bg-white border border-gray-200 rounded-xl text-xs font-bold text-gray-600 hover:text-blue-600 hover:border-blue-500 transition-all uppercase tracking-widest shadow-sm shadow-gray-200/50"
                        >
                            <span>🔗</span> Ver Bio-Link Público
                        </a>
                    )}
                </div>
            </div>

            <form onSubmit={handleSave} className="space-y-8">
                {/* Información Personal (Nueva Sección) */}
                <div className="bg-white border border-gray-200 rounded-[32px] p-6 sm:p-8 shadow-sm shadow-gray-200/50 space-y-6">
                    <h3 className="text-xs font-black text-gray-400 uppercase tracking-[0.2em] flex items-center gap-2">
                        <UserCircle className="w-4 h-4 text-blue-500" />
                        Información Personal
                    </h3>
                    <div className="grid md:grid-cols-2 gap-6">
                        <div>
                            <label className="block text-[10px] font-black text-gray-500 uppercase tracking-widest mb-2">Mi Nombre Completo</label>
                            <input
                                type="text"
                                value={personalInfo.nombre}
                                onChange={e => setPersonalInfo({ ...personalInfo, nombre: e.target.value })}
                                className="w-full bg-gray-50 border border-gray-200 rounded-xl px-4 py-3.5 text-sm text-gray-900 focus:outline-none focus:border-blue-500 focus:ring-4 focus:ring-blue-500/5 transition-all font-semibold"
                                placeholder="Tu nombre"
                            />
                        </div>
                        <div>
                            <label className="block text-[10px] font-black text-gray-500 uppercase tracking-widest mb-2">Mi Correo Electrónico</label>
                            <input
                                type="email"
                                disabled
                                value={personalInfo.email}
                                className="w-full bg-gray-100 border border-gray-200 rounded-xl px-4 py-3.5 text-sm text-gray-400 cursor-not-allowed font-medium"
                                title="El correo no se puede cambiar por seguridad"
                            />
                        </div>
                    </div>
                </div>

                {/* Brand Personalization Section */}
                <div className="bg-white border border-gray-200 rounded-[32px] p-6 sm:p-8 shadow-sm shadow-gray-200/50 space-y-6">
                    <h3 className="text-xs font-black text-gray-400 uppercase tracking-[0.2em] flex items-center gap-2">
                        <Camera className="w-4 h-4 text-blue-500" />
                        Personalización de Marca (White Label)
                    </h3>

                    <div className="grid md:grid-cols-2 gap-8 items-start">
                        {/* Color Picker */}
                        <div className="space-y-4">
                            <label className="block text-[10px] font-black text-gray-500 uppercase tracking-widest">Color Primario de tu Marca</label>
                            <div className="flex items-center gap-4">
                                <div
                                    className="w-14 h-14 rounded-2xl border-4 border-white shadow-lg shrink-0"
                                    style={{ backgroundColor: workshop.color_primario || '#EA580C' }}
                                />
                                <div className="flex-1">
                                    <input
                                        type="color"
                                        value={workshop.color_primario || '#EA580C'}
                                        onChange={e => setWorkshop({ ...workshop, color_primario: e.target.value })}
                                        className="w-full h-10 bg-transparent cursor-pointer rounded-lg border-none"
                                    />
                                    <p className="text-[10px] text-gray-400 mt-1 font-medium italic">Este color se usará para tus botones, badges y acentos visuales.</p>
                                </div>
                            </div>
                        </div>

                        {/* Visual Preview Hint */}
                        <div className="bg-gray-50 rounded-2xl p-4 border border-dashed border-gray-200">
                            <div className="flex items-center gap-3 mb-2">
                                <div
                                    className="px-3 py-1 rounded-full text-[9px] font-black text-white uppercase tracking-tighter"
                                    style={{ backgroundColor: workshop.color_primario || '#EA580C' }}
                                >
                                    Vista Previa
                                </div>
                            </div>
                            <p className="text-[10px] text-gray-500 leading-relaxed font-medium">
                                Los elementos que antes eran naranjas ahora adoptarán tu color corporativo.
                            </p>
                        </div>
                    </div>
                </div>

                {/* Logo Section */}
                <div className="bg-white border border-gray-200 rounded-[32px] p-6 sm:p-8 relative overflow-hidden group shadow-sm shadow-gray-200/50">
                    <div className="absolute top-0 right-0 p-8 opacity-0 group-hover:opacity-10 pointer-events-none transition-opacity">
                        <Camera className="w-32 h-32 text-gray-900" />
                    </div>

                    <div className="flex flex-col gap-10">
                        {/* Logo Upload Section */}
                        <div className="flex flex-col md:flex-row items-center gap-8 md:gap-12">
                            <div className="relative">
                                <div className="w-32 h-32 sm:w-40 sm:h-40 rounded-3xl bg-gray-50 border-2 border-gray-100 overflow-hidden shadow-xl relative group/logo">
                                    {workshop.logo_url ? (
                                        <img src={workshop.logo_url} alt="Logo" className="w-full h-full object-cover" />
                                    ) : (
                                        <div className="w-full h-full flex items-center justify-center text-gray-300">
                                            <Camera className="w-12 h-12" />
                                        </div>
                                    )}
                                    {uploadingLogo && (
                                        <div className="absolute inset-0 bg-white/60 backdrop-blur-[2px] flex items-center justify-center">
                                            <Loader2 className="w-8 h-8 text-blue-600 animate-spin" />
                                        </div>
                                    )}
                                </div>
                                <button
                                    type="button"
                                    onClick={() => fileInputRef.current?.click()}
                                    className="absolute -bottom-2 -right-2 w-10 h-10 bg-blue-600 hover:bg-blue-500 text-white rounded-xl flex items-center justify-center shadow-lg hover:scale-110 transition-all border-4 border-white"
                                >
                                    <Camera className="w-4 h-4" />
                                </button>
                                <input
                                    type="file"
                                    ref={fileInputRef}
                                    className="hidden"
                                    accept="image/*"
                                    onChange={handleLogoUpload}
                                />
                            </div>

                            <div className="flex-1 space-y-2 text-center md:text-left">
                                <h3 className="text-xl font-bold text-gray-900 tracking-tight">Logo de la Empresa</h3>
                                <p className="text-sm text-gray-500 leading-relaxed max-w-sm">
                                    Este logo aparecerá en tu Bio-Link, reportes de inspección y comunicaciones con clientes.
                                    Se recomienda una imagen cuadrada de al menos 400x400px.
                                </p>
                            </div>
                        </div>

                        {/* Portada Upload Section */}
                        <div className="flex flex-col md:flex-row items-center gap-8 md:gap-12 pt-8 border-t border-gray-100">
                            <div className="relative w-full md:w-80">
                                <div className="h-32 sm:h-40 rounded-2xl bg-gray-50 border-2 border-gray-100 overflow-hidden shadow-lg relative group/portada">
                                    {workshop.portada_url ? (
                                        <img src={workshop.portada_url} alt="Portada" className="w-full h-full object-cover" />
                                    ) : (
                                        <div className="w-full h-full flex items-center justify-center text-gray-300">
                                            <ImageIcon className="w-10 h-10" />
                                        </div>
                                    )}
                                    {uploadingPortada && (
                                        <div className="absolute inset-0 bg-white/60 backdrop-blur-[2px] flex items-center justify-center">
                                            <Loader2 className="w-8 h-8 text-blue-600 animate-spin" />
                                        </div>
                                    )}
                                </div>
                                <button
                                    type="button"
                                    onClick={() => portadaInputRef.current?.click()}
                                    className="absolute -bottom-2 -right-2 w-10 h-10 bg-slate-800 hover:bg-slate-700 text-white rounded-xl flex items-center justify-center shadow-lg hover:scale-110 transition-all border-4 border-white"
                                >
                                    <Camera className="w-4 h-4" />
                                </button>
                                <input
                                    type="file"
                                    ref={portadaInputRef}
                                    className="hidden"
                                    accept="image/*"
                                    onChange={handlePortadaUpload}
                                />
                            </div>

                            <div className="flex-1 space-y-2 text-center md:text-left">
                                <h3 className="text-lg font-bold text-gray-900 tracking-tight">Foto de Portada</h3>
                                <p className="text-sm text-gray-500 leading-relaxed max-w-sm">
                                    Esta imagen se mostrará como fondo en el encabezado de tu perfil público.
                                    Se recomienda una imagen panorámica de 1200x400px.
                                </p>
                            </div>
                        </div>
                    </div>
                </div>

                {/* Info General */}
                <div className="grid md:grid-cols-2 gap-6 sm:gap-8">
                    <div className="bg-white border border-gray-200 rounded-3xl p-6 sm:p-8 space-y-6 shadow-sm shadow-gray-200/50">
                        <h3 className="text-xs font-black text-gray-400 uppercase tracking-[0.2em] flex items-center gap-2">
                            <Info className="w-4 h-4 text-blue-500" />
                            Información Básica
                        </h3>

                        <div className="space-y-5">
                            <div>
                                <label className="block text-[10px] font-black text-gray-500 uppercase tracking-widest mb-2">Nombre Comercial</label>
                                <input
                                    type="text"
                                    value={workshop.nombre || ''}
                                    onChange={e => setWorkshop({ ...workshop, nombre: e.target.value })}
                                    className="w-full bg-gray-50 border border-gray-200 rounded-xl px-4 py-3.5 text-sm text-gray-900 focus:outline-none focus:border-blue-500 focus:ring-4 focus:ring-blue-500/5 transition-all font-semibold"
                                    placeholder="Ej: Steelmonkey Performance"
                                />
                            </div>
                            <div>
                                <label className="block text-[10px] font-black text-gray-500 uppercase tracking-widest mb-2">Descripción (Bio)</label>
                                <textarea
                                    value={workshop.descripcion || ''}
                                    onChange={e => setWorkshop({ ...workshop, descripcion: e.target.value })}
                                    rows={4}
                                    className="w-full bg-gray-50 border border-gray-200 rounded-xl px-4 py-3.5 text-sm text-gray-900 focus:outline-none focus:border-blue-500 focus:ring-4 focus:ring-blue-500/5 transition-all resize-none leading-relaxed"
                                    placeholder="Describe tu taller..."
                                />
                            </div>
                            <div className="grid md:grid-cols-2 gap-4">
                                <div>
                                    <label className="block text-[10px] font-black text-gray-500 uppercase tracking-widest mb-2">Reconocimiento / Distinción (Max 30 carac.)</label>
                                    <input
                                        type="text"
                                        value={workshop.reconocimiento || ''}
                                        onChange={e => setWorkshop({ ...workshop, reconocimiento: e.target.value })}
                                        className="w-full bg-gray-50 border border-gray-200 rounded-xl px-4 py-3.5 text-sm text-gray-900 focus:outline-none focus:border-blue-500 focus:ring-4 focus:ring-blue-500/5 transition-all font-semibold"
                                        placeholder="Ej: Premio Innovación 2024"
                                    />
                                </div>
                                <div>
                                    <label className="block text-[10px] font-black text-gray-500 uppercase tracking-widest mb-2">Estadística (Max 30 carac.)</label>
                                    <input
                                        type="text"
                                        value={workshop.estadisticas || ''}
                                        onChange={e => setWorkshop({ ...workshop, estadisticas: e.target.value })}
                                        className="w-full bg-gray-50 border border-gray-200 rounded-xl px-4 py-3.5 text-sm text-gray-900 focus:outline-none focus:border-blue-500 focus:ring-4 focus:ring-blue-500/5 transition-all font-semibold"
                                        placeholder="Ej: +500 Autos Potenciados"
                                    />
                                </div>
                            </div>
                        </div>
                    </div>

                    <div className="bg-white border border-gray-200 rounded-3xl p-6 sm:p-8 space-y-6 shadow-sm shadow-gray-200/50">
                        <h3 className="text-xs font-black text-gray-400 uppercase tracking-[0.2em] flex items-center gap-2">
                            <MapPin className="w-4 h-4 text-blue-500" />
                            Contacto y Ubicación
                        </h3>

                        <div className="space-y-5">
                            <div>
                                <label className="block text-[10px] font-black text-gray-500 uppercase tracking-widest mb-2">Dirección Física</label>
                                <input
                                    type="text"
                                    value={workshop.direccion || ''}
                                    onChange={e => setWorkshop({ ...workshop, direccion: e.target.value })}
                                    className="w-full bg-gray-50 border border-gray-200 rounded-xl px-4 py-3.5 text-sm text-gray-900 focus:outline-none focus:border-blue-500 focus:ring-4 focus:ring-blue-500/5 transition-all"
                                    placeholder="Av. Vitacura 9800"
                                />
                            </div>
                            <div className="grid grid-cols-2 gap-4">
                                <div>
                                    <label className="block text-[10px] font-black text-gray-500 uppercase tracking-widest mb-2">WhatsApp</label>
                                    <input
                                        type="text"
                                        value={workshop.whatsapp || ''}
                                        onChange={e => setWorkshop({ ...workshop, whatsapp: e.target.value })}
                                        className="w-full bg-gray-50 border border-gray-200 rounded-xl px-4 py-3.5 text-sm text-gray-900 focus:outline-none focus:border-blue-500 focus:ring-4 focus:ring-blue-500/5 transition-all"
                                        placeholder="+569"
                                    />
                                </div>
                                <div>
                                    <label className="block text-[10px] font-black text-gray-500 uppercase tracking-widest mb-2">Sitio Web Oficial</label>
                                    <input
                                        type="url"
                                        value={workshop.sitio_web || ''}
                                        onChange={e => setWorkshop({ ...workshop, sitio_web: e.target.value })}
                                        className="w-full bg-gray-50 border border-gray-200 rounded-xl px-4 py-3.5 text-sm text-gray-900 focus:outline-none focus:border-blue-500 focus:ring-4 focus:ring-blue-500/5 transition-all"
                                        placeholder="https://www.misitio.com"
                                    />
                                </div>
                            </div>
                            <div className="grid grid-cols-2 gap-4">
                                <div>
                                    <label className="block text-[10px] font-black text-gray-500 uppercase tracking-widest mb-2">Instagram</label>
                                    <input
                                        type="text"
                                        value={workshop.instagram || ''}
                                        onChange={e => setWorkshop({ ...workshop, instagram: e.target.value })}
                                        className="w-full bg-gray-50 border border-gray-200 rounded-xl px-4 py-3.5 text-sm text-gray-900 focus:outline-none focus:border-blue-500 focus:ring-4 focus:ring-blue-500/5 transition-all"
                                        placeholder="@usuario"
                                    />
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                {/* Servicios */}
                <ServiciosManager />

                {/* Action Buttons */}
                <div className="flex items-center justify-end gap-4 pt-4 pb-10">
                    <button
                        type="button"
                        onClick={() => router.back()}
                        className="px-6 py-3.5 text-gray-400 font-bold rounded-2xl hover:text-gray-600 transition-colors uppercase text-[10px] tracking-widest"
                    >
                        Cancelar
                    </button>
                    <button
                        type="submit"
                        disabled={saving}
                        className="group relative px-10 py-4 bg-[#0066FF] text-white font-black rounded-2xl shadow-xl shadow-blue-500/20 hover:bg-blue-700 active:scale-95 transition-all disabled:opacity-50 flex items-center gap-3 overflow-hidden"
                    >
                        {saving ? (
                            <>
                                <Loader2 className="w-5 h-5 animate-spin" />
                                <span className="uppercase text-xs tracking-widest">Guardando...</span>
                            </>
                        ) : (
                            <>
                                <Save className="w-5 h-5" />
                                <span className="uppercase text-xs tracking-widest">Guardar Cambios</span>
                            </>
                        )}
                    </button>
                </div>
            </form>
        </div>
    );
}
