'use client';

import { useState, useEffect } from 'react';
import { useAuth } from '@/contexts/auth-context';
import { 
    obtenerTodosServiciosFrecuentes, 
    actualizarServicioFrecuente, 
    eliminarServicioFrecuente,
    crearServicioFrecuente
} from '@/lib/storage-adapter';
import { supabase } from '@/lib/supabase';
import type { ServicioDB } from '@/lib/supabase';
import { Pencil, Trash2, Check, X, Wrench, Search, Loader2, PlusCircle, Gauge } from 'lucide-react';
import { toast } from 'sonner';

export function ServiciosManager() {
    const { user } = useAuth();
    const [servicios, setServicios] = useState<ServicioDB[]>([]);
    const [loading, setLoading] = useState(true);
    const [searchTerm, setSearchTerm] = useState('');

    // Toggle KM
    const [kmHabilitado, setKmHabilitado] = useState(false);
    const [savingKm, setSavingKm] = useState(false);

    const [editingId, setEditingId] = useState<number | null>(null);
    const [editForm, setEditForm] = useState({ descripcion: '', precio_base: 0 });

    const [showCreateForm, setShowCreateForm] = useState(false);
    const [createForm, setCreateForm] = useState({ descripcion: '', precio_base: 0 });
    const [creating, setCreating] = useState(false);

    const loadAll = async () => {
        if (!user?.tallerId) return;
        try {
            const [serviciosData, tallerData] = await Promise.all([
                obtenerTodosServiciosFrecuentes(user.tallerId),
                supabase.from('talleres').select('modulos_activos').eq('id', user.tallerId).single()
            ]);

            setServicios(serviciosData);

            // Leer flag km_recepcion del campo modulos_activos
            const modulos: string[] = tallerData.data?.modulos_activos || [];
            setKmHabilitado(modulos.includes('km_recepcion'));
        } catch (error) {
            console.error(error);
            toast.error('Error al cargar configuración');
        } finally {
            setLoading(false);
        }
    };

    useEffect(() => {
        loadAll();
    }, [user?.tallerId]);

    const handleToggleKm = async () => {
        if (!user?.tallerId) return;
        setSavingKm(true);
        try {
            // Leer modulos actuales
            const { data: taller } = await supabase
                .from('talleres')
                .select('modulos_activos')
                .eq('id', user.tallerId)
                .single();

            const modulosActuales: string[] = taller?.modulos_activos || [];
            const nuevoValor = !kmHabilitado;

            const nuevosModulos: string[] = nuevoValor
                ? [...modulosActuales.filter((m: string) => m !== 'km_recepcion'), 'km_recepcion']
                : modulosActuales.filter((m: string) => m !== 'km_recepcion');

            const { error } = await supabase
                .from('talleres')
                .update({ modulos_activos: nuevosModulos })
                .eq('id', user.tallerId);

            if (error) throw error;

            setKmHabilitado(nuevoValor);
            toast.success(nuevoValor ? 'Control de KM activado en Recepción' : 'Control de KM desactivado en Recepción');
        } catch (error) {
            toast.error('Error al guardar configuración de KM');
        } finally {
            setSavingKm(false);
        }
    };

    const handleCreate = async () => {
        if (!createForm.descripcion.trim()) {
            toast.error('La descripción no puede estar vacía');
            return;
        }
        if (!user?.tallerId) return;

        setCreating(true);
        try {
            const nuevo = await crearServicioFrecuente({
                descripcion: createForm.descripcion.trim(),
                precio_base: createForm.precio_base,
                taller_id: user.tallerId,
            });
            if (nuevo) {
                setServicios(prev => [nuevo, ...prev]);
                setCreateForm({ descripcion: '', precio_base: 0 });
                setShowCreateForm(false);
                toast.success('Servicio creado correctamente');
            } else {
                toast.error('No se pudo crear el servicio. ¿Ya existe uno con ese nombre?');
            }
        } catch {
            toast.error('Error al crear el servicio');
        } finally {
            setCreating(false);
        }
    };

    const handleToggleActivo = async (servicio: ServicioDB) => {
        const toastId = toast.loading('Actualizando estado...');
        try {
            const success = await actualizarServicioFrecuente(servicio.id, { activo: !servicio.activo });
            if (success) {
                setServicios(prev => prev.map(s => s.id === servicio.id ? { ...s, activo: !s.activo } : s));
                toast.success(servicio.activo ? 'Servicio desactivado' : 'Servicio activado', { id: toastId });
            } else throw new Error();
        } catch {
            toast.error('Error al actualizar estado', { id: toastId });
        }
    };

    const handleDelete = async (id: number) => {
        if (!confirm('¿Eliminar este servicio? Esta acción no se puede deshacer.')) return;
        const toastId = toast.loading('Eliminando...');
        try {
            const success = await eliminarServicioFrecuente(id);
            if (success) {
                setServicios(prev => prev.filter(s => s.id !== id));
                toast.success('Servicio eliminado', { id: toastId });
            } else throw new Error();
        } catch {
            toast.error('Error al eliminar el servicio', { id: toastId });
        }
    };

    const startEdit = (servicio: ServicioDB) => {
        setEditingId(servicio.id);
        setEditForm({ descripcion: servicio.descripcion, precio_base: servicio.precio_base || 0 });
    };

    const saveEdit = async (id: number) => {
        if (!editForm.descripcion.trim()) { toast.error('La descripción no puede estar vacía'); return; }
        const toastId = toast.loading('Guardando...');
        try {
            const success = await actualizarServicioFrecuente(id, {
                descripcion: editForm.descripcion.trim(),
                precio_base: editForm.precio_base
            });
            if (success) {
                setServicios(prev => prev.map(s => s.id === id ? { ...s, descripcion: editForm.descripcion.trim(), precio_base: editForm.precio_base } : s));
                setEditingId(null);
                toast.success('Servicio actualizado', { id: toastId });
            } else throw new Error();
        } catch {
            toast.error('Error al guardar cambios', { id: toastId });
        }
    };

    const filteredServicios = servicios.filter(s =>
        s.descripcion.toLowerCase().includes(searchTerm.toLowerCase())
    );

    if (loading) {
        return (
            <div className="flex items-center justify-center p-8 bg-white border border-gray-200 rounded-3xl shadow-sm">
                <Loader2 className="w-6 h-6 animate-spin text-blue-500" />
                <span className="ml-3 text-sm font-medium text-gray-500">Cargando catálogo...</span>
            </div>
        );
    }

    return (
        <div className="space-y-4">
            {/* Toggle KM */}
            <div className="bg-white border border-gray-200 rounded-3xl p-6 shadow-sm shadow-gray-200/50">
                <div className="flex items-center justify-between">
                    <div className="flex items-center gap-3">
                        <div className="w-9 h-9 bg-blue-50 rounded-xl flex items-center justify-center">
                            <Gauge className="w-5 h-5 text-blue-500" />
                        </div>
                        <div>
                            <p className="text-sm font-bold text-gray-800">Control de KM en Recepción</p>
                            <p className="text-xs text-gray-500 mt-0.5">
                                Activa si tu taller registra kilómetros de entrada y salida de vehículos
                            </p>
                        </div>
                    </div>
                    <button
                        type="button"
                        onClick={handleToggleKm}
                        disabled={savingKm}
                        className={`relative inline-flex h-6 w-11 shrink-0 cursor-pointer rounded-full border-2 border-transparent transition-colors duration-200 ease-in-out focus:outline-none disabled:opacity-50 ${kmHabilitado ? 'bg-blue-500' : 'bg-gray-200'}`}
                    >
                        {savingKm ? (
                            <span className="w-5 h-5 flex items-center justify-center">
                                <Loader2 className="w-3 h-3 text-white animate-spin absolute top-0.5 left-0.5" />
                            </span>
                        ) : (
                            <span className={`${kmHabilitado ? 'translate-x-5' : 'translate-x-0'} pointer-events-none inline-block h-5 w-5 transform rounded-full bg-white shadow transition duration-200 ease-in-out`} />
                        )}
                    </button>
                </div>
            </div>

            {/* Catálogo de Servicios */}
            <div className="bg-white border border-gray-200 rounded-3xl p-6 sm:p-8 space-y-6 shadow-sm shadow-gray-200/50">
                <div className="flex flex-col sm:flex-row sm:items-center justify-between gap-4">
                    <h3 className="text-xs font-black text-gray-400 uppercase tracking-[0.2em] flex items-center gap-2">
                        <Wrench className="w-4 h-4 text-blue-500" />
                        Catálogo de Servicios Frecuentes
                    </h3>
                    <div className="flex items-center gap-2">
                        <div className="relative">
                            <Search className="w-4 h-4 text-gray-400 absolute left-3 top-1/2 -translate-y-1/2" />
                            <input
                                type="text"
                                placeholder="Buscar servicio..."
                                value={searchTerm}
                                onChange={(e) => setSearchTerm(e.target.value)}
                                className="pl-9 pr-4 py-2 bg-gray-50 border border-gray-200 rounded-xl text-sm text-gray-900 focus:outline-none focus:border-blue-500 focus:ring-2 focus:ring-blue-500/20 w-full sm:w-52"
                            />
                        </div>
                        <button
                            type="button"
                            onClick={() => { setShowCreateForm(!showCreateForm); setCreateForm({ descripcion: '', precio_base: 0 }); }}
                            className="flex items-center gap-2 px-4 py-2 bg-blue-500 hover:bg-blue-600 text-white text-sm font-semibold rounded-xl transition-colors whitespace-nowrap"
                        >
                            <PlusCircle className="w-4 h-4" />
                            Nuevo Servicio
                        </button>
                    </div>
                </div>

                <p className="text-sm text-gray-500">
                    Los servicios se agregan automáticamente al crear una orden de recepción. Aquí también puedes agregar, editar, desactivar o eliminar servicios del catálogo.
                </p>

                {/* Formulario de Creación */}
                {showCreateForm && (
                    <div className="p-4 bg-blue-50 border border-blue-100 rounded-2xl space-y-3">
                        <p className="text-xs font-bold text-blue-700 uppercase tracking-wider">Nuevo servicio</p>
                        <div className="flex flex-col sm:flex-row items-start sm:items-center gap-3">
                            <input
                                autoFocus
                                type="text"
                                placeholder="Nombre del servicio (ej: Cambio de frenos)"
                                value={createForm.descripcion}
                                onChange={e => setCreateForm({ ...createForm, descripcion: e.target.value })}
                                onKeyDown={e => e.key === 'Enter' && handleCreate()}
                                className="flex-1 bg-white border border-blue-200 rounded-xl px-4 py-2.5 text-sm text-gray-900 focus:outline-none focus:ring-2 focus:ring-blue-500/20 w-full"
                            />
                            <div className="flex items-center gap-2">
                                <span className="text-gray-500 text-sm">$</span>
                                <input
                                    type="number"
                                    placeholder="Precio base"
                                    value={createForm.precio_base || ''}
                                    onChange={e => setCreateForm({ ...createForm, precio_base: Number(e.target.value) })}
                                    className="w-32 bg-white border border-blue-200 rounded-xl px-3 py-2.5 text-sm text-gray-900 focus:outline-none focus:ring-2 focus:ring-blue-500/20"
                                />
                            </div>
                            <div className="flex items-center gap-2">
                                <button
                                    type="button"
                                    onClick={handleCreate}
                                    disabled={creating}
                                    className="flex items-center gap-1.5 px-4 py-2.5 bg-blue-500 hover:bg-blue-600 disabled:opacity-50 text-white text-sm font-semibold rounded-xl transition-colors"
                                >
                                    {creating ? <Loader2 className="w-4 h-4 animate-spin" /> : <Check className="w-4 h-4" />}
                                    Guardar
                                </button>
                                <button
                                    type="button"
                                    onClick={() => setShowCreateForm(false)}
                                    className="p-2.5 text-gray-400 hover:bg-gray-100 rounded-xl transition-colors"
                                >
                                    <X className="w-4 h-4" />
                                </button>
                            </div>
                        </div>
                    </div>
                )}

                {filteredServicios.length === 0 ? (
                    <div className="text-center py-10 bg-gray-50 border border-dashed border-gray-200 rounded-2xl">
                        <p className="text-sm text-gray-500 font-medium">
                            {searchTerm ? 'No se encontraron servicios con ese nombre' : 'Sin servicios aún. Crea el primero con el botón "Nuevo Servicio"'}
                        </p>
                    </div>
                ) : (
                    <div className="overflow-x-auto rounded-xl border border-gray-100">
                        <table className="w-full text-left border-collapse">
                            <thead>
                                <tr className="bg-gray-50/50 border-b border-gray-100">
                                    <th className="py-3 px-4 text-[10px] font-black uppercase tracking-widest text-gray-400">Servicio</th>
                                    <th className="py-3 px-4 text-[10px] font-black uppercase tracking-widest text-gray-400">Precio Base</th>
                                    <th className="py-3 px-4 text-[10px] font-black uppercase tracking-widest text-gray-400 text-center">Estado</th>
                                    <th className="py-3 px-4 text-[10px] font-black uppercase tracking-widest text-gray-400 text-right">Acciones</th>
                                </tr>
                            </thead>
                            <tbody className="divide-y divide-gray-100 text-sm">
                                {filteredServicios.map(servicio => (
                                    <tr key={servicio.id} className="hover:bg-blue-50/20 transition-colors group">
                                        <td className="py-3 px-4">
                                            {editingId === servicio.id ? (
                                                <input
                                                    autoFocus
                                                    type="text"
                                                    value={editForm.descripcion}
                                                    onChange={e => setEditForm({ ...editForm, descripcion: e.target.value })}
                                                    className="w-full bg-white border border-blue-200 rounded-lg px-2 py-1 text-sm text-gray-900 focus:outline-none focus:ring-2 focus:ring-blue-500/20"
                                                />
                                            ) : (
                                                <span className={`font-medium ${servicio.activo ? 'text-gray-900' : 'text-gray-400 line-through'}`}>
                                                    {servicio.descripcion}
                                                </span>
                                            )}
                                        </td>
                                        <td className="py-3 px-4">
                                            {editingId === servicio.id ? (
                                                <div className="flex items-center gap-1">
                                                    <span className="text-gray-500">$</span>
                                                    <input
                                                        type="number"
                                                        value={editForm.precio_base}
                                                        onChange={e => setEditForm({ ...editForm, precio_base: Number(e.target.value) })}
                                                        className="w-24 bg-white border border-blue-200 rounded-lg px-2 py-1 text-sm text-gray-900 focus:outline-none focus:ring-2 focus:ring-blue-500/20"
                                                    />
                                                </div>
                                            ) : (
                                                <span className={`text-gray-600 ${!servicio.activo && 'opacity-50'}`}>
                                                    ${servicio.precio_base?.toLocaleString('es-CL') || 0}
                                                </span>
                                            )}
                                        </td>
                                        <td className="py-3 px-4 text-center">
                                            {editingId !== servicio.id && (
                                                <button
                                                    type="button"
                                                    onClick={() => handleToggleActivo(servicio)}
                                                    className={`relative inline-flex h-5 w-9 shrink-0 cursor-pointer rounded-full border-2 border-transparent transition-colors duration-200 ease-in-out focus:outline-none focus:ring-2 focus:ring-blue-500 focus:ring-offset-2 ${servicio.activo ? 'bg-blue-500' : 'bg-gray-200'}`}
                                                >
                                                    <span className={`${servicio.activo ? 'translate-x-4' : 'translate-x-0'} pointer-events-none inline-block h-4 w-4 transform rounded-full bg-white shadow transition duration-200 ease-in-out`} />
                                                </button>
                                            )}
                                        </td>
                                        <td className="py-3 px-4 text-right">
                                            {editingId === servicio.id ? (
                                                <div className="flex items-center justify-end gap-2">
                                                    <button onClick={() => saveEdit(servicio.id)} className="p-1.5 text-emerald-600 hover:bg-emerald-50 rounded-lg transition-colors">
                                                        <Check className="w-4 h-4" />
                                                    </button>
                                                    <button onClick={() => setEditingId(null)} className="p-1.5 text-gray-400 hover:bg-gray-100 rounded-lg transition-colors">
                                                        <X className="w-4 h-4" />
                                                    </button>
                                                </div>
                                            ) : (
                                                <div className="flex items-center justify-end gap-1 opacity-0 group-hover:opacity-100 transition-opacity">
                                                    <button onClick={() => startEdit(servicio)} className="p-1.5 text-blue-500 hover:bg-blue-50 rounded-lg transition-colors" title="Editar">
                                                        <Pencil className="w-4 h-4" />
                                                    </button>
                                                    <button onClick={() => handleDelete(servicio.id)} className="p-1.5 text-red-500 hover:bg-red-50 rounded-lg transition-colors" title="Eliminar">
                                                        <Trash2 className="w-4 h-4" />
                                                    </button>
                                                </div>
                                            )}
                                        </td>
                                    </tr>
                                ))}
                            </tbody>
                        </table>
                    </div>
                )}
            </div>
        </div>
    );
}
