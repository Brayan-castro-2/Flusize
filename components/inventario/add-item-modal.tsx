'use client';

import { useEffect, useRef, useState, useCallback } from 'react';
import {
    X, Package, ArrowDownCircle, ArrowUpCircle, Loader2,
    Hash, FileText, Building2, StickyNote, DollarSign, Tag,
    Layers, ImageIcon, Plus, Percent, ChevronDown
} from 'lucide-react';
import { motion, AnimatePresence } from 'framer-motion';
import { toast } from 'sonner';
import { supabase } from '@/lib/supabase';
import { useAuth } from '@/contexts/auth-context';

interface AddItemModalProps {
    isOpen: boolean;
    onClose: () => void;
    onSuccess: () => void;
    mode: 'ENTRADA' | 'SALIDA';
    initialData?: {
        codigo_producto?: string;
        empresa?: string;
    } | null;
}

interface FormState {
    codigo_producto: string;
    nombre_producto: string;
    cantidad: string;
    nro_guia_despacho: string;
    empresa: string;
    nota: string;
    // Pricing
    precio_venta: string;
    precio_compra: string;
    porcentaje_iva: string;
    // Classification
    categoria: string;
    nueva_categoria: string;
    marca: string;
    nueva_marca: string;
}

const EMPTY_FORM: FormState = {
    codigo_producto: '',
    nombre_producto: '',
    cantidad: '',
    nro_guia_despacho: '',
    empresa: '',
    nota: '',
    precio_venta: '',
    precio_compra: '',
    porcentaje_iva: '19',
    categoria: '',
    nueva_categoria: '',
    marca: '',
    nueva_marca: '',
};

// Deduplicate helper
const unique = (arr: string[]) => Array.from(new Set(arr.filter(Boolean))).sort();

export default function AddItemModal({ isOpen, onClose, onSuccess, mode, initialData }: AddItemModalProps) {
    const { user } = useAuth();
    const [form, setForm] = useState<FormState>(EMPTY_FORM);
    const [isSubmitting, setIsSubmitting] = useState(false);
    const [ivaActivo, setIvaActivo] = useState(true);
    const firstInputRef = useRef<HTMLInputElement>(null);

    // Existing categories and brands from catalogue
    const [categorias, setCategorias] = useState<string[]>([]);
    const [marcas, setMarcas] = useState<string[]>([]);

    // Image upload
    const [imageFile, setImageFile] = useState<File | null>(null);
    const [imagePreview, setImagePreview] = useState<string | null>(null);
    const [uploadingImage, setUploadingImage] = useState(false);

    // Section expansion
    const [showPricing, setShowPricing] = useState(false);
    const [showClassification, setShowClassification] = useState(false);

    const isEntrada = mode === 'ENTRADA';

    // Load existing categories and brands
    const loadMeta = useCallback(async () => {
        if (!user?.tallerId) return;
        const { data } = await supabase
            .from('productos')
            .select('categoria, marca')
            .eq('taller_id', user.tallerId);

        if (data) {
            setCategorias(unique(data.map((d: any) => d.categoria).filter(Boolean)));
            setMarcas(unique(data.map((d: any) => d.marca).filter(Boolean)));
        }
    }, [user?.tallerId]);

    useEffect(() => {
        if (isOpen) {
            setForm({
                ...EMPTY_FORM,
                codigo_producto: initialData?.codigo_producto ?? '',
                empresa: initialData?.empresa ?? '',
            });
            setImageFile(null);
            setImagePreview(null);
            setShowPricing(false);
            setShowClassification(false);
            setIvaActivo(true);
            loadMeta();
            setTimeout(() => firstInputRef.current?.focus(), 80);
        }
    }, [isOpen, initialData, mode]);

    useEffect(() => {
        const onKey = (e: KeyboardEvent) => {
            if (e.key === 'Escape' && isOpen && !isSubmitting) onClose();
        };
        window.addEventListener('keydown', onKey);
        return () => window.removeEventListener('keydown', onKey);
    }, [isOpen, isSubmitting, onClose]);

    const handleChange = (e: React.ChangeEvent<HTMLInputElement | HTMLTextAreaElement | HTMLSelectElement>) => {
        setForm(prev => ({ ...prev, [e.target.name]: e.target.value }));
    };

    const handleImageChange = (e: React.ChangeEvent<HTMLInputElement>) => {
        const file = e.target.files?.[0];
        if (!file) return;
        if (file.size > 5 * 1024 * 1024) { toast.error('La imagen no debe superar los 5 MB.'); return; }
        setImageFile(file);
        setImagePreview(URL.createObjectURL(file));
    };

    const uploadImage = async (codigo: string): Promise<string | null> => {
        if (!imageFile || !user?.tallerId) return null;
        setUploadingImage(true);
        try {
            const ext = imageFile.name.split('.').pop();
            const path = `${user.tallerId}/${codigo}.${ext}`;
            const { data, error } = await supabase.storage
                .from('product-images')
                .upload(path, imageFile, { upsert: true, contentType: imageFile.type });

            if (error) throw error;

            const { data: publicUrl } = supabase.storage
                .from('product-images')
                .getPublicUrl(path);

            return publicUrl?.publicUrl ?? null;
        } catch (err: any) {
            console.warn('Image upload failed:', err.message);
            toast.warning('La imagen no se pudo subir, pero el producto se guardará de todas formas.');
            return null;
        } finally {
            setUploadingImage(false);
        }
    };

    const handleSubmit = async (e: React.FormEvent) => {
        e.preventDefault();

        if (!user?.tallerId) {
            toast.error('Error de sesión: no se encontró el taller.');
            return;
        }

        const codigo = form.codigo_producto.trim().toUpperCase();
        const cantidad = parseInt(form.cantidad, 10);
        const nroGuia = form.nro_guia_despacho.trim();

        if (!codigo) { toast.error('El Código SKU es obligatorio.'); return; }
        if (!cantidad || isNaN(cantidad) || cantidad <= 0) { toast.error('La Cantidad debe ser un número mayor a 0.'); return; }
        if (!nroGuia) { toast.error('El Nro. Guía/Documento es obligatorio.'); return; }

        // Resolve category and brand (new vs existing)
        const categoriaFinal = form.nueva_categoria.trim() || form.categoria.trim() || null;
        const marcaFinal = form.nueva_marca.trim() || form.marca.trim() || null;

        // Pricing
        const precioVenta = form.precio_venta ? parseFloat(form.precio_venta) : null;
        const precioCompra = form.precio_compra ? parseFloat(form.precio_compra) : null;
        const porcIVA = ivaActivo && form.porcentaje_iva ? parseFloat(form.porcentaje_iva) : 0;

        setIsSubmitting(true);

        try {
            // --- PASO 1: Upsert del Producto ---
            const { data: existingProduct, error: fetchErr } = await supabase
                .from('productos')
                .select('codigo, stock_actual, nombre')
                .eq('codigo', codigo)
                .eq('taller_id', user.tallerId)
                .maybeSingle();

            if (fetchErr) throw fetchErr;

            // Upload image if selected
            const imagenUrl = imageFile ? await uploadImage(codigo) : null;

            const productFields = {
                codigo,
                nombre: form.nombre_producto.trim() || codigo,
                taller_id: user.tallerId,
                ...(categoriaFinal !== null && { categoria: categoriaFinal }),
                ...(marcaFinal !== null && { marca: marcaFinal }),
                ...(precioVenta !== null && { precio_venta: precioVenta }),
                ...(precioCompra !== null && { precio_compra: precioCompra }),
                porcentaje_iva: porcIVA,
                ...(imagenUrl && { imagen_url: imagenUrl }),
            };

            if (!existingProduct) {
                const { error: insertProdErr } = await supabase
                    .from('productos')
                    .insert({
                        ...productFields,
                        stock_actual: 0,
                        stock_minimo: 0,
                        unidad_medida: 'Unidad',
                    });
                if (insertProdErr) throw insertProdErr;
            } else {
                // Update mutable fields on existing product
                const { error: updateProdErr } = await supabase
                    .from('productos')
                    .update({
                        ...(form.nombre_producto.trim() && { nombre: form.nombre_producto.trim() }),
                        ...(categoriaFinal !== null && { categoria: categoriaFinal }),
                        ...(marcaFinal !== null && { marca: marcaFinal }),
                        ...(precioVenta !== null && { precio_venta: precioVenta }),
                        ...(precioCompra !== null && { precio_compra: precioCompra }),
                        porcentaje_iva: porcIVA,
                        ...(imagenUrl && { imagen_url: imagenUrl }),
                    })
                    .eq('codigo', codigo)
                    .eq('taller_id', user.tallerId);
                if (updateProdErr) throw updateProdErr;
            }

            // --- PASO 2: Insert del Movimiento --- (NOTE: NO creado_por field)
            const now = new Date();
            const { error: movErr } = await supabase
                .from('movimientos_inventario')
                .insert({
                    taller_id: user.tallerId,
                    codigo_producto: codigo,
                    cantidad,
                    tipo_movimiento: mode,
                    fecha: now.toISOString(),
                    anio: now.getFullYear(),
                    mes: now.getMonth() + 1,
                    semana: Math.ceil(now.getDate() / 7),
                    nro_guia_despacho: nroGuia || null,
                    nota: form.nota.trim() || null,
                });

            if (movErr) throw movErr;

            // --- PASO 3: Update stock_actual ---
            const currentStock = existingProduct?.stock_actual ?? 0;
            const newStock = isEntrada ? currentStock + cantidad : Math.max(0, currentStock - cantidad);

            await supabase
                .from('productos')
                .update({ stock_actual: newStock })
                .eq('codigo', codigo)
                .eq('taller_id', user.tallerId);

            toast.success(`${isEntrada ? 'Entrada' : 'Salida'} registrada`, {
                description: `${cantidad} unidades de ${codigo}. Stock ahora: ${newStock}.`,
            });

            onSuccess();
            onClose();
            setForm(EMPTY_FORM);
            setImageFile(null);
            setImagePreview(null);
        } catch (err: any) {
            console.error('AddItemModal submit error:', err);
            toast.error('Error al registrar el movimiento', {
                description: err?.message || 'Revisa la consola para más detalles.',
            });
        } finally {
            setIsSubmitting(false);
        }
    };

    const accent = isEntrada
        ? { ring: 'focus:ring-emerald-500', bg: 'bg-emerald-600', hover: 'hover:bg-emerald-700', light: 'bg-emerald-50', text: 'text-emerald-700', border: 'border-emerald-200', icon: 'text-emerald-600', badge: 'bg-emerald-100 text-emerald-700' }
        : { ring: 'focus:ring-red-500', bg: 'bg-red-600', hover: 'hover:bg-red-700', light: 'bg-red-50', text: 'text-red-700', border: 'border-red-200', icon: 'text-red-600', badge: 'bg-red-100 text-red-700' };

    const inputCls = `w-full px-3 py-2.5 rounded-xl border border-slate-200 bg-slate-50 text-sm font-medium text-slate-800 placeholder-slate-400 focus:outline-none focus:ring-2 ${accent.ring} focus:border-transparent transition-all disabled:opacity-60`;

    // Compute IVA amount for display
    const ivaAmount = form.precio_venta && form.porcentaje_iva
        ? (parseFloat(form.precio_venta) * parseFloat(form.porcentaje_iva) / 100).toFixed(0)
        : null;

    return (
        <AnimatePresence>
            {isOpen && (
                <>
                    <motion.div
                        key="backdrop"
                        initial={{ opacity: 0 }}
                        animate={{ opacity: 1 }}
                        exit={{ opacity: 0 }}
                        transition={{ duration: 0.18 }}
                        onClick={() => !isSubmitting && onClose()}
                        className="fixed inset-0 z-[90] bg-slate-900/60 backdrop-blur-sm"
                    />
                    <motion.div
                        key="modal"
                        initial={{ opacity: 0, scale: 0.95, y: 20 }}
                        animate={{ opacity: 1, scale: 1, y: 0 }}
                        exit={{ opacity: 0, scale: 0.95, y: 20 }}
                        transition={{ type: 'spring', damping: 28, stiffness: 380 }}
                        className="fixed inset-0 z-[91] flex items-center justify-center p-4 pointer-events-none"
                    >
                        <div className="w-full max-w-2xl bg-white rounded-2xl shadow-2xl border border-slate-100 pointer-events-auto overflow-hidden flex flex-col max-h-[92vh]">

                            {/* ── Header ── */}
                            <div className={`flex items-center justify-between px-6 py-4 border-b ${accent.border} ${accent.light} shrink-0`}>
                                <div className="flex items-center gap-3">
                                    {isEntrada
                                        ? <ArrowDownCircle className={`w-6 h-6 ${accent.icon}`} />
                                        : <ArrowUpCircle className={`w-6 h-6 ${accent.icon}`} />
                                    }
                                    <div>
                                        <h2 className={`text-base font-black ${accent.text}`}>
                                            Registrar {isEntrada ? 'Entrada' : 'Salida'} de Stock
                                        </h2>
                                        <p className="text-xs text-slate-500 font-medium">
                                            {isEntrada ? 'El stock aumentará automáticamente.' : 'El stock disminuirá automáticamente.'}
                                        </p>
                                    </div>
                                </div>
                                <button onClick={() => !isSubmitting && onClose()} className="p-2 rounded-xl text-slate-400 hover:text-slate-600 hover:bg-white/80 transition-colors">
                                    <X className="w-5 h-5" />
                                </button>
                            </div>

                            {/* ── Scrollable form ── */}
                            <form onSubmit={handleSubmit} className="flex-1 overflow-y-auto px-6 py-5 space-y-5">

                                {/* === Section 1: Identity === */}
                                <div className="grid grid-cols-2 gap-4">
                                    <div>
                                        <label className="block text-[10px] font-black text-slate-500 uppercase tracking-widest mb-1.5">
                                            Código SKU <span className="text-red-500">*</span>
                                        </label>
                                        <div className="relative">
                                            <Hash className="absolute left-3 top-1/2 -translate-y-1/2 w-4 h-4 text-slate-400 pointer-events-none" />
                                            <input
                                                ref={firstInputRef}
                                                type="text"
                                                name="codigo_producto"
                                                value={form.codigo_producto}
                                                onChange={handleChange}
                                                placeholder="ACE-001"
                                                required
                                                disabled={isSubmitting}
                                                className={`${inputCls} pl-9 font-mono font-bold`}
                                            />
                                        </div>
                                    </div>
                                    <div>
                                        <label className="block text-[10px] font-black text-slate-500 uppercase tracking-widest mb-1.5">
                                            Nombre / Descripción
                                        </label>
                                        <div className="relative">
                                            <Package className="absolute left-3 top-1/2 -translate-y-1/2 w-4 h-4 text-slate-400 pointer-events-none" />
                                            <input
                                                type="text"
                                                name="nombre_producto"
                                                value={form.nombre_producto}
                                                onChange={handleChange}
                                                placeholder="Aceite 5W-30 Shell"
                                                disabled={isSubmitting}
                                                className={`${inputCls} pl-9`}
                                            />
                                        </div>
                                    </div>
                                </div>

                                {/* === Section 2: Movement === */}
                                <div className="grid grid-cols-2 gap-4">
                                    <div>
                                        <label className="block text-[10px] font-black text-slate-500 uppercase tracking-widest mb-1.5">
                                            Cantidad <span className="text-red-500">*</span>
                                        </label>
                                        <input
                                            type="number"
                                            name="cantidad"
                                            value={form.cantidad}
                                            onChange={handleChange}
                                            placeholder="0"
                                            min="1"
                                            required
                                            disabled={isSubmitting}
                                            className={`${inputCls} text-center font-black [appearance:textfield] [&::-webkit-outer-spin-button]:appearance-none [&::-webkit-inner-spin-button]:appearance-none`}
                                        />
                                    </div>
                                    <div>
                                        <label className="block text-[10px] font-black text-slate-500 uppercase tracking-widest mb-1.5">
                                            Nro. Guía/Documento <span className="text-red-500">*</span>
                                        </label>
                                        <div className="relative">
                                            <FileText className="absolute left-3 top-1/2 -translate-y-1/2 w-4 h-4 text-slate-400 pointer-events-none" />
                                            <input
                                                type="text"
                                                name="nro_guia_despacho"
                                                value={form.nro_guia_despacho}
                                                onChange={handleChange}
                                                placeholder="GD-2026-001"
                                                required
                                                disabled={isSubmitting}
                                                className={`${inputCls} pl-9`}
                                            />
                                        </div>
                                    </div>
                                </div>

                                {/* Empresa + Nota */}
                                <div className="grid grid-cols-2 gap-4">
                                    <div>
                                        <label className="block text-[10px] font-black text-slate-500 uppercase tracking-widest mb-1.5">
                                            {isEntrada ? 'Proveedor' : 'Destino'}
                                        </label>
                                        <div className="relative">
                                            <Building2 className="absolute left-3 top-1/2 -translate-y-1/2 w-4 h-4 text-slate-400 pointer-events-none" />
                                            <input
                                                type="text"
                                                name="empresa"
                                                value={form.empresa}
                                                onChange={handleChange}
                                                placeholder={isEntrada ? 'Proveedor ABC' : 'Consumo interno'}
                                                disabled={isSubmitting}
                                                className={`${inputCls} pl-9`}
                                            />
                                        </div>
                                    </div>
                                    <div>
                                        <label className="block text-[10px] font-black text-slate-500 uppercase tracking-widest mb-1.5">
                                            Nota <span className="text-slate-400 font-normal">(opcional)</span>
                                        </label>
                                        <div className="relative">
                                            <StickyNote className="absolute left-3 top-3 w-4 h-4 text-slate-400 pointer-events-none" />
                                            <textarea
                                                name="nota"
                                                value={form.nota}
                                                onChange={handleChange}
                                                placeholder="Observaciones..."
                                                rows={1}
                                                disabled={isSubmitting}
                                                className={`${inputCls} pl-9 resize-none`}
                                            />
                                        </div>
                                    </div>
                                </div>

                                {/* === Collapsible: Precios & IVA === */}
                                <div className="rounded-2xl border border-slate-200 overflow-hidden">
                                    <button
                                        type="button"
                                        onClick={() => setShowPricing(v => !v)}
                                        className="w-full flex items-center justify-between px-4 py-3 bg-slate-50 hover:bg-slate-100 transition-colors text-left"
                                    >
                                        <span className="flex items-center gap-2 text-sm font-bold text-slate-700">
                                            <DollarSign className="w-4 h-4 text-blue-500" />
                                            Precios e IVA
                                        </span>
                                        <ChevronDown className={`w-4 h-4 text-slate-400 transition-transform ${showPricing ? 'rotate-180' : ''}`} />
                                    </button>
                                    <AnimatePresence initial={false}>
                                        {showPricing && (
                                            <motion.div
                                                initial={{ height: 0, opacity: 0 }}
                                                animate={{ height: 'auto', opacity: 1 }}
                                                exit={{ height: 0, opacity: 0 }}
                                                transition={{ duration: 0.18 }}
                                                className="overflow-hidden"
                                            >
                                                <div className="px-4 pb-4 pt-3 space-y-3">
                                                    <div className="grid grid-cols-3 gap-3">
                                                        <div>
                                                            <label className="block text-[10px] font-black text-slate-500 uppercase tracking-widest mb-1.5">
                                                                Precio Venta (PVP)
                                                            </label>
                                                            <div className="relative">
                                                                <span className="absolute left-3 top-1/2 -translate-y-1/2 text-slate-400 text-sm font-bold">$</span>
                                                                <input
                                                                    type="number"
                                                                    name="precio_venta"
                                                                    value={form.precio_venta}
                                                                    onChange={handleChange}
                                                                    placeholder="0"
                                                                    min="0"
                                                                    step="1"
                                                                    disabled={isSubmitting}
                                                                    className={`${inputCls} pl-7 [appearance:textfield] [&::-webkit-outer-spin-button]:appearance-none [&::-webkit-inner-spin-button]:appearance-none`}
                                                                />
                                                            </div>
                                                        </div>
                                                        <div>
                                                            <label className="block text-[10px] font-black text-slate-500 uppercase tracking-widest mb-1.5">
                                                                Precio Compra
                                                            </label>
                                                            <div className="relative">
                                                                <span className="absolute left-3 top-1/2 -translate-y-1/2 text-slate-400 text-sm font-bold">$</span>
                                                                <input
                                                                    type="number"
                                                                    name="precio_compra"
                                                                    value={form.precio_compra}
                                                                    onChange={handleChange}
                                                                    placeholder="0 (opcional)"
                                                                    min="0"
                                                                    step="1"
                                                                    disabled={isSubmitting}
                                                                    className={`${inputCls} pl-7 [appearance:textfield] [&::-webkit-outer-spin-button]:appearance-none [&::-webkit-inner-spin-button]:appearance-none`}
                                                                />
                                                            </div>
                                                        </div>
                                                        <div>
                                                            <div className="flex items-center justify-between mb-1.5">
                                                                <label className="block text-[10px] font-black text-slate-500 uppercase tracking-widest">
                                                                    IVA %
                                                                </label>
                                                                <button
                                                                    type="button"
                                                                    onClick={() => setIvaActivo(v => !v)}
                                                                    className={`relative inline-flex h-5 w-9 items-center rounded-full transition-colors focus:outline-none ${
                                                                        ivaActivo ? 'bg-emerald-500' : 'bg-slate-300'
                                                                    }`}
                                                                    title={ivaActivo ? 'Desactivar IVA' : 'Activar IVA'}
                                                                >
                                                                    <span className={`inline-block h-3.5 w-3.5 transform rounded-full bg-white shadow transition-transform ${
                                                                        ivaActivo ? 'translate-x-4' : 'translate-x-0.5'
                                                                    }`} />
                                                                </button>
                                                            </div>
                                                            {ivaActivo ? (
                                                                <div className="relative">
                                                                    <Percent className="absolute left-3 top-1/2 -translate-y-1/2 w-4 h-4 text-slate-400 pointer-events-none" />
                                                                    <input
                                                                        type="number"
                                                                        name="porcentaje_iva"
                                                                        value={form.porcentaje_iva}
                                                                        onChange={handleChange}
                                                                        placeholder="19"
                                                                        min="0"
                                                                        max="100"
                                                                        disabled={isSubmitting}
                                                                        className={`${inputCls} pl-9 [appearance:textfield] [&::-webkit-outer-spin-button]:appearance-none [&::-webkit-inner-spin-button]:appearance-none`}
                                                                    />
                                                                </div>
                                                            ) : (
                                                                <div className="flex items-center justify-center h-[42px] rounded-xl bg-slate-100 border border-slate-200">
                                                                    <span className="text-xs font-bold text-slate-400">Sin IVA</span>
                                                                </div>
                                                            )}
                                                        </div>
                                                    </div>

                                                    {/* IVA Live Calculation Badge */}
                                                    {ivaActivo && ivaAmount && (
                                                        <div className="flex items-center gap-2 rounded-xl bg-blue-50 border border-blue-100 px-4 py-2.5">
                                                            <Percent className="w-4 h-4 text-blue-500 shrink-0" />
                                                            <span className="text-sm text-blue-700 font-medium">
                                                                IVA incluido:{' '}
                                                                <span className="font-black">${parseInt(ivaAmount).toLocaleString('es-CL')}</span>
                                                                {' '}— Precio neto:{' '}
                                                                <span className="font-black">
                                                                    ${(parseFloat(form.precio_venta || '0') - parseFloat(ivaAmount)).toLocaleString('es-CL')}
                                                                </span>
                                                            </span>
                                                        </div>
                                                    )}
                                                </div>
                                            </motion.div>
                                        )}
                                    </AnimatePresence>
                                </div>

                                {/* === Collapsible: Categoría, Marca, Imagen === */}
                                <div className="rounded-2xl border border-slate-200 overflow-hidden">
                                    <button
                                        type="button"
                                        onClick={() => setShowClassification(v => !v)}
                                        className="w-full flex items-center justify-between px-4 py-3 bg-slate-50 hover:bg-slate-100 transition-colors text-left"
                                    >
                                        <span className="flex items-center gap-2 text-sm font-bold text-slate-700">
                                            <Tag className="w-4 h-4 text-purple-500" />
                                            Categoría, Marca e Imagen
                                        </span>
                                        <ChevronDown className={`w-4 h-4 text-slate-400 transition-transform ${showClassification ? 'rotate-180' : ''}`} />
                                    </button>
                                    <AnimatePresence initial={false}>
                                        {showClassification && (
                                            <motion.div
                                                initial={{ height: 0, opacity: 0 }}
                                                animate={{ height: 'auto', opacity: 1 }}
                                                exit={{ height: 0, opacity: 0 }}
                                                transition={{ duration: 0.18 }}
                                                className="overflow-hidden"
                                            >
                                                <div className="px-4 pb-4 pt-3 space-y-4">

                                                    {/* Categoria */}
                                                    <div className="grid grid-cols-2 gap-3">
                                                        <div>
                                                            <label className="block text-[10px] font-black text-slate-500 uppercase tracking-widest mb-1.5">
                                                                Categoría existente
                                                            </label>
                                                            <div className="relative">
                                                                <Layers className="absolute left-3 top-1/2 -translate-y-1/2 w-4 h-4 text-slate-400 pointer-events-none" />
                                                                <select
                                                                    name="categoria"
                                                                    value={form.categoria}
                                                                    onChange={handleChange}
                                                                    disabled={isSubmitting || !!form.nueva_categoria}
                                                                    className={`${inputCls} pl-9 appearance-none`}
                                                                >
                                                                    <option value="">Seleccionar...</option>
                                                                    {categorias.map(c => (
                                                                        <option key={c} value={c}>{c}</option>
                                                                    ))}
                                                                </select>
                                                            </div>
                                                        </div>
                                                        <div>
                                                            <label className="block text-[10px] font-black text-slate-500 uppercase tracking-widest mb-1.5">
                                                                <Plus className="inline w-3 h-3 mr-0.5" />
                                                                Nueva categoría
                                                            </label>
                                                            <input
                                                                type="text"
                                                                name="nueva_categoria"
                                                                value={form.nueva_categoria}
                                                                onChange={handleChange}
                                                                placeholder="Ej: Filtros de aire"
                                                                disabled={isSubmitting}
                                                                className={inputCls}
                                                            />
                                                        </div>
                                                    </div>

                                                    {/* Marca */}
                                                    <div className="grid grid-cols-2 gap-3">
                                                        <div>
                                                            <label className="block text-[10px] font-black text-slate-500 uppercase tracking-widest mb-1.5">
                                                                Marca existente
                                                            </label>
                                                            <div className="relative">
                                                                <Tag className="absolute left-3 top-1/2 -translate-y-1/2 w-4 h-4 text-slate-400 pointer-events-none" />
                                                                <select
                                                                    name="marca"
                                                                    value={form.marca}
                                                                    onChange={handleChange}
                                                                    disabled={isSubmitting || !!form.nueva_marca}
                                                                    className={`${inputCls} pl-9 appearance-none`}
                                                                >
                                                                    <option value="">Seleccionar...</option>
                                                                    {marcas.map(m => (
                                                                        <option key={m} value={m}>{m}</option>
                                                                    ))}
                                                                </select>
                                                            </div>
                                                        </div>
                                                        <div>
                                                            <label className="block text-[10px] font-black text-slate-500 uppercase tracking-widest mb-1.5">
                                                                <Plus className="inline w-3 h-3 mr-0.5" />
                                                                Nueva marca
                                                            </label>
                                                            <input
                                                                type="text"
                                                                name="nueva_marca"
                                                                value={form.nueva_marca}
                                                                onChange={handleChange}
                                                                placeholder="Ej: Mobil, Bosch, NGK"
                                                                disabled={isSubmitting}
                                                                className={inputCls}
                                                            />
                                                        </div>
                                                    </div>

                                                    {/* Image upload */}
                                                    <div>
                                                        <label className="block text-[10px] font-black text-slate-500 uppercase tracking-widest mb-1.5">
                                                            Imagen del producto <span className="text-slate-400 font-normal">(opcional, máx 5 MB)</span>
                                                        </label>
                                                        <div className="flex items-center gap-4">
                                                            <label className="cursor-pointer flex items-center gap-2 px-4 py-2.5 rounded-xl border border-slate-200 bg-slate-50 hover:bg-slate-100 transition-colors text-sm font-bold text-slate-600">
                                                                <ImageIcon className="w-4 h-4 text-slate-400" />
                                                                {imageFile ? 'Cambiar imagen' : 'Subir imagen'}
                                                                <input
                                                                    type="file"
                                                                    accept="image/*"
                                                                    onChange={handleImageChange}
                                                                    className="hidden"
                                                                    disabled={isSubmitting}
                                                                />
                                                            </label>
                                                            {imagePreview && (
                                                                <div className="relative group">
                                                                    {/* eslint-disable-next-line @next/next/no-img-element */}
                                                                    <img
                                                                        src={imagePreview}
                                                                        alt="Preview"
                                                                        className="w-14 h-14 object-cover rounded-xl border border-slate-200 shadow-sm"
                                                                    />
                                                                    <button
                                                                        type="button"
                                                                        onClick={() => { setImageFile(null); setImagePreview(null); }}
                                                                        className="absolute -top-1.5 -right-1.5 w-5 h-5 bg-red-500 text-white rounded-full flex items-center justify-center opacity-0 group-hover:opacity-100 transition-opacity"
                                                                    >
                                                                        <X className="w-3 h-3" />
                                                                    </button>
                                                                </div>
                                                            )}
                                                        </div>
                                                    </div>
                                                </div>
                                            </motion.div>
                                        )}
                                    </AnimatePresence>
                                </div>

                            </form>

                            {/* ── Footer CTA ── */}
                            <div className="px-6 py-4 border-t border-slate-100 shrink-0 flex gap-3 bg-white">
                                <button
                                    type="button"
                                    onClick={() => !isSubmitting && onClose()}
                                    disabled={isSubmitting}
                                    className="flex-1 rounded-xl border border-slate-200 bg-slate-50 px-5 py-2.5 text-sm font-bold text-slate-600 hover:bg-slate-100 transition-colors disabled:opacity-50"
                                >
                                    Cancelar
                                </button>
                                <button
                                    type="submit"
                                    form=""
                                    disabled={isSubmitting}
                                    onClick={handleSubmit as any}
                                    className={`flex-[2] flex items-center justify-center gap-2 rounded-xl ${accent.bg} ${accent.hover} px-5 py-2.5 text-sm font-black text-white transition-colors shadow-md disabled:opacity-60 disabled:cursor-not-allowed`}
                                >
                                    {isSubmitting ? (
                                        <>
                                            <Loader2 className="w-4 h-4 animate-spin" />
                                            {uploadingImage ? 'Subiendo imagen...' : 'Registrando...'}
                                        </>
                                    ) : (
                                        <>
                                            {isEntrada ? <ArrowDownCircle className="w-4 h-4" /> : <ArrowUpCircle className="w-4 h-4" />}
                                            Confirmar {isEntrada ? 'Entrada' : 'Salida'}
                                        </>
                                    )}
                                </button>
                            </div>
                        </div>
                    </motion.div>
                </>
            )}
        </AnimatePresence>
    );
}
