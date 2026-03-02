'use client';

import { useState, useEffect, useRef } from 'react';
import { useAuth } from '@/contexts/auth-context';
import { getWorkshopData, updateWorkshopAction, uploadLogoAction } from './actions';
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
    Settings
} from 'lucide-react';
import { useRouter } from 'next/navigation';

export default function PerfilTallerPage() {
    const { user } = useAuth();
    const router = useRouter();
    const fileInputRef = useRef<HTMLInputElement>(null);

    const [loading, setLoading] = useState(true);
    const [saving, setSaving] = useState(false);
    const [uploading, setUploading] = useState(false);
    const [workshop, setWorkshop] = useState<any>(null);
    const [toast, setToast] = useState<{ type: 'success' | 'error', msg: string } | null>(null);

    useEffect(() => {
        if (user?.tallerId) {
            loadData();
        }
    }, [user?.tallerId]);

    const loadData = async () => {
        setLoading(true);
        const res = await getWorkshopData(user!.tallerId!);
        if (res.success) {
            setWorkshop(res.data);
        } else {
            showToast('error', 'Error al cargar los datos del taller');
        }
        setLoading(false);
    };

    const showToast = (type: 'success' | 'error', msg: string) => {
        setToast({ type, msg });
        setTimeout(() => setToast(null), 3000);
    };

    const handleSave = async (e: React.FormEvent) => {
        e.preventDefault();
        setSaving(true);

        const updates = {
            nombre: workshop.nombre,
            descripcion: workshop.descripcion,
            direccion: workshop.direccion,
            telefono: workshop.telefono,
            whatsapp: workshop.whatsapp,
            instagram: workshop.instagram,
            facebook: workshop.facebook,
            ciudad: workshop.ciudad,
            // Convertir servicios de string (comas) a array si es necesario, 
            // pero el input lo manejamos como string para el usuario
            servicios: Array.isArray(workshop.servicios)
                ? workshop.servicios
                : (workshop.servicios || '').split(',').map((s: string) => s.trim()).filter(Boolean)
        };

        const res = await updateWorkshopAction(user!.tallerId!, updates);
        if (res.success) {
            showToast('success', 'Perfil actualizado correctamente');
        } else {
            showToast('error', res.error || 'Error al actualizar');
        }
        setSaving(false);
    };

    const handleLogoUpload = async (e: React.ChangeEvent<HTMLInputElement>) => {
        const file = e.target.files?.[0];
        if (!file) return;

        setUploading(true);
        const formData = new FormData();
        formData.append('file', file);

        const res = await uploadLogoAction(user!.tallerId!, formData);
        if (res.success) {
            setWorkshop((prev: any) => ({ ...prev, logo_url: res.logoUrl }));
            showToast('success', 'Logo actualizado');
        } else {
            showToast('error', res.error || 'Error al subir el logo');
        }
        setUploading(false);
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

            <form onSubmit={handleSave} className="space-y-8">
                {/* Logo Section */}
                <div className="bg-white border border-gray-200 rounded-[32px] p-6 sm:p-8 relative overflow-hidden group shadow-sm shadow-gray-200/50">
                    <div className="absolute top-0 right-0 p-8 opacity-0 group-hover:opacity-10 pointer-events-none transition-opacity">
                        <Camera className="w-32 h-32 text-gray-900" />
                    </div>

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
                                {uploading && (
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
                <div className="bg-white border border-gray-200 rounded-3xl p-6 sm:p-8 space-y-6 shadow-sm shadow-gray-200/50">
                    <h3 className="text-xs font-black text-gray-400 uppercase tracking-[0.2em] flex items-center gap-2">
                        <Wrench className="w-4 h-4 text-blue-500" />
                        Servicios y Especialidades
                    </h3>

                    <div className="space-y-4">
                        <label className="block text-[10px] font-black text-gray-500 uppercase tracking-widest">
                            Catálogo de Servicios (Separados por comas)
                        </label>
                        <textarea
                            value={Array.isArray(workshop.servicios) ? workshop.servicios.join(', ') : (workshop.servicios || '')}
                            onChange={e => setWorkshop({ ...workshop, servicios: e.target.value })}
                            rows={3}
                            className="w-full bg-gray-50 border border-gray-200 rounded-xl px-4 py-3.5 text-sm text-gray-900 focus:outline-none focus:border-blue-500 focus:ring-4 focus:ring-blue-500/5 transition-all resize-none leading-relaxed"
                            placeholder="Mecánica General, Detailing..."
                        />
                        <div className="flex flex-wrap gap-2">
                            {(Array.isArray(workshop.servicios) ? workshop.servicios : (workshop.servicios || '').split(',').map((s: string) => s.trim()).filter(Boolean)).map((tag: string, i: number) => (
                                <span key={i} className="px-3 py-1 bg-blue-50 border border-blue-100 rounded-lg text-[10px] font-bold text-blue-600 uppercase tracking-wider">
                                    {tag}
                                </span>
                            ))}
                        </div>
                    </div>
                </div>

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

            {/* Toasts */}
            {toast && (
                <div className={`fixed bottom-10 right-10 z-[100] flex items-center gap-3 px-6 py-4 rounded-2xl border backdrop-blur-xl animate-in fade-in slide-in-from-bottom-5 duration-300 ${toast.type === 'success'
                    ? 'bg-emerald-500/10 border-emerald-500/50 text-emerald-600'
                    : 'bg-red-500/10 border-red-500/50 text-red-600'
                    }`}>
                    {toast.type === 'success' ? <CheckCircle2 className="w-5 h-5" /> : <AlertCircle className="w-5 h-5" />}
                    <span className="font-bold text-sm tracking-tight">{toast.msg}</span>
                </div>
            )}
        </div>
    );
}
