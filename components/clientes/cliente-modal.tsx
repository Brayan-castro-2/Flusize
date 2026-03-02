'use client';

import { useState, useEffect } from 'react';
import { Button } from '@/components/ui/button';
import { Input } from '@/components/ui/input';
import { Label } from '@/components/ui/label';
import { Textarea } from '@/components/ui/textarea';
import {
    Dialog,
    DialogContent,
    DialogDescription,
    DialogFooter,
    DialogHeader,
    DialogTitle,
} from '@/components/ui/dialog';
import { Tabs, TabsContent, TabsList, TabsTrigger } from '@/components/ui/tabs';
import {
    Table,
    TableBody,
    TableCell,
    TableHead,
    TableHeader,
    TableRow,
} from '@/components/ui/table';
import { useRouter } from 'next/navigation';
import { crearCliente, actualizarCliente, crearVehiculo, ClienteWithStats } from '@/lib/storage-adapter';
import { Loader2, Plus, Phone, Mail, FileText, Calendar, ExternalLink, Car, Search, MessageCircle, TrendingUp, Wallet, User, Building2 } from 'lucide-react';
import { consultarPatenteGetAPI, isGetAPIConfigured } from '@/lib/getapi-service';
import { buscarVehiculoPorPatente } from '@/lib/storage-adapter';

interface ClienteModalProps {
    isOpen: boolean;
    onClose: () => void;
    onSave: () => void;
    cliente?: ClienteWithStats;
    defaultTab?: string;
}

const formatCurrency = (val: number) =>
    new Intl.NumberFormat('es-CL', { style: 'currency', currency: 'CLP' }).format(val);

export function ClienteModal({ isOpen, onClose, onSave, cliente, defaultTab = 'datos' }: ClienteModalProps) {
    const router = useRouter();
    const [isSubmitting, setIsSubmitting] = useState(false);
    const [activeTab, setActiveTab] = useState(defaultTab);

    // Form State
    const [nombre, setNombre] = useState('');
    const [telefono, setTelefono] = useState('');
    const [email, setEmail] = useState('');
    const [rut, setRut] = useState('');
    const [tipo, setTipo] = useState<'persona' | 'empresa'>('persona');
    const [direccion, setDireccion] = useState('');
    const [notas, setNotas] = useState('');

    // Vehicle Form State
    const [showAddVehicle, setShowAddVehicle] = useState(false);
    const [newVehicle, setNewVehicle] = useState({
        patente: '',
        marca: '',
        modelo: '',
        anio: '',
        motor: ''
    });

    // Autocomplete State
    const [isSearching, setIsSearching] = useState(false);
    const [searchStatus, setSearchStatus] = useState('');
    const [optimisticVehicles, setOptimisticVehicles] = useState<any[]>([]);



    useEffect(() => {
        if (isOpen) {
            setActiveTab(defaultTab || 'datos');
            if (defaultTab === 'vehiculos') {
                setShowAddVehicle(true);
            } else {
                setShowAddVehicle(false);
            }
        }
    }, [isOpen, defaultTab]);

    useEffect(() => {
        if (cliente) {
            setNombre(cliente.nombre_completo);
            setTelefono(cliente.telefono?.replace('+569', '') || '');
            setEmail(cliente.email || '');
            setRut(cliente.rut_dni || '');
            setTipo((cliente.tipo as 'persona' | 'empresa') || 'persona');
            setDireccion(cliente.direccion || '');
            setNotas(cliente.notas || '');
        } else {
            setNombre('');
            setTelefono('');
            setEmail('');
            setRut('');
            setTipo('persona');
            setDireccion('');
            setNotas('');
        }
    }, [cliente, isOpen]);

    useEffect(() => {
        if (cliente?.vehiculos) {
            setOptimisticVehicles(cliente.vehiculos);
        } else {
            setOptimisticVehicles([]);
        }
    }, [cliente]);

    const handlePatenteBlur = async () => {
        const patente = newVehicle.patente.replace(/[^a-zA-Z0-9]/g, '').toUpperCase();
        if (patente.length < 4) return;

        setNewVehicle(prev => ({ ...prev, patente }));
        setIsSearching(true);
        setSearchStatus('🔍 Buscando información...');

        try {
            if (isGetAPIConfigured()) {
                const data = await consultarPatenteGetAPI(patente);
                if (data) {
                    setNewVehicle(prev => ({
                        ...prev,
                        marca: data.marca,
                        modelo: data.modelo,
                        anio: data.anio,
                        motor: data.motor || prev.motor
                    }));
                    setSearchStatus(`✅ Vehículo encontrado: ${data.marca} ${data.modelo}`);
                    setIsSearching(false);
                    return;
                }
            }

            const local = await buscarVehiculoPorPatente(patente);
            if (local) {
                setNewVehicle(prev => ({
                    ...prev,
                    marca: local.marca,
                    modelo: local.modelo,
                    anio: local.anio || prev.anio,
                    motor: local.motor || prev.motor
                }));
                if (local.clientes) {
                    setSearchStatus(`⚠️ Vehículo ya existe (Cliente: ${local.clientes.nombre_completo})`);
                } else {
                    setSearchStatus(`✅ Vehículo encontrado en registro local`);
                }
            } else {
                setSearchStatus('❌ No encontrado. Completa manualmente.');
            }

        } catch (err) {
            console.error(err);
            setSearchStatus('Error en búsqueda');
        } finally {
            setIsSearching(false);
        }
    };

    const handleAddVehicle = async () => {
        if (!cliente?.id) {
            alert('Debes guardar el cliente primero antes de agregar vehículos.');
            return;
        }
        if (!newVehicle.patente || !newVehicle.marca || !newVehicle.modelo) {
            alert('Por favor completa la patente, marca y modelo.');
            return;
        }

        setIsSubmitting(true);
        try {
            await crearVehiculo({
                ...newVehicle,
                cliente_id: cliente.id,
                anio: newVehicle.anio || '',
                motor: newVehicle.motor || '',
            });

            onSave();
            setShowAddVehicle(false);
            setNewVehicle({ patente: '', marca: '', modelo: '', anio: '', motor: '' });
            setSearchStatus('');
        } catch (error) {
            console.error('Error creating vehicle:', error);
            alert('Error al guardar el vehículo. Verifique si la patente ya existe.');
        } finally {
            setIsSubmitting(false);
        }
    };

    const handleSubmit = async (e: React.FormEvent) => {
        e.preventDefault();
        if (!nombre || !telefono) return;

        setIsSubmitting(true);
        try {
            const cleanPhone = telefono.replace(/\D/g, '');
            const finalPhone = cleanPhone.length > 0 ? `+569${cleanPhone}` : '';

            const payload = {
                nombre_completo: nombre,
                telefono: finalPhone,
                email: email || undefined,
                rut_dni: rut || undefined,
                tipo,
                direccion: direccion || undefined,
                notas: notas || undefined,
            };

            if (cliente) {
                await actualizarCliente(cliente.id, payload);
            } else {
                await crearCliente(payload);
            }

            onSave();
            onClose();
        } catch (error) {
            console.error('Error saving client:', error);
        } finally {
            setIsSubmitting(false);
        }
    };

    const history = cliente?.vehiculos?.flatMap(v =>
        (v.ordenes || []).map(o => ({
            ...o,
            vehiculo_str: `${v.marca} ${v.modelo} (${v.patente})`
        }))
    ).sort((a, b) => new Date(b.fecha_ingreso).getTime() - new Date(a.fecha_ingreso).getTime()) || [];

    const formatDate = (date: string) =>
        new Date(date).toLocaleDateString('es-CL');

    const waLink = cliente?.telefono
        ? `https://wa.me/${cliente.telefono.replace(/\D/g, '')}`
        : null;

    return (
        <Dialog open={isOpen} onOpenChange={onClose}>
            <DialogContent className="sm:max-w-[720px] bg-slate-950 border-slate-800 text-slate-100 max-h-[90vh] overflow-y-auto p-0">

                {/* ── PREMIUM HEADER ─────────────────────────── */}
                <div className="relative bg-gradient-to-br from-slate-900 via-blue-950/30 to-slate-900 px-6 pt-6 pb-4 border-b border-slate-800 overflow-hidden">
                    {/* Decorative gradient orb */}
                    <div className="absolute -top-10 -right-10 w-40 h-40 bg-blue-500/10 rounded-full blur-3xl pointer-events-none" />
                    <div className="absolute top-0 left-0 right-0 h-[2px] bg-gradient-to-r from-transparent via-blue-500/50 to-transparent" />

                    <DialogHeader className="m-0 text-left">
                        <div className="flex items-start gap-4">
                            {/* Avatar */}
                            <div className="relative shrink-0">
                                <div className="w-16 h-16 rounded-2xl bg-gradient-to-br from-blue-600 to-blue-800 flex items-center justify-center text-2xl font-black text-white shadow-xl shadow-blue-900/50 border border-blue-500/30">
                                    {nombre ? nombre.charAt(0).toUpperCase() : (cliente ? cliente.nombre_completo.charAt(0).toUpperCase() : '+')}
                                </div>
                                {tipo === 'empresa' && (
                                    <div className="absolute -bottom-1 -right-1 w-5 h-5 bg-purple-500 rounded-full flex items-center justify-center border-2 border-slate-900">
                                        <Building2 className="w-2.5 h-2.5 text-white" />
                                    </div>
                                )}
                            </div>

                            {/* Name & Stats */}
                            <div className="flex-1 min-w-0">
                                <DialogTitle className="text-xl font-bold text-white leading-tight truncate">
                                    {cliente ? cliente.nombre_completo : 'Nuevo Cliente'}
                                </DialogTitle>
                                <DialogDescription className="text-slate-400 text-sm mt-0.5">
                                    {cliente ? `${cliente.rut_dni || 'Sin RUT'} · ${cliente.tipo === 'empresa' ? 'Empresa' : 'Particular'}` : 'Completa los datos del nuevo cliente.'}
                                </DialogDescription>

                                {/* Stats bar for existing clients */}
                                {cliente && (
                                    <div className="flex items-center gap-4 mt-3 flex-wrap">
                                        <div className="flex items-center gap-1.5 bg-emerald-500/10 border border-emerald-500/20 rounded-lg px-3 py-1.5">
                                            <Wallet className="w-3.5 h-3.5 text-emerald-400" />
                                            <span className="text-emerald-400 text-xs font-bold">{formatCurrency(cliente.total_gastado)}</span>
                                        </div>
                                        <div className="flex items-center gap-1.5 bg-blue-500/10 border border-blue-500/20 rounded-lg px-3 py-1.5">
                                            <TrendingUp className="w-3.5 h-3.5 text-blue-400" />
                                            <span className="text-blue-400 text-xs font-bold">{cliente.total_ordenes} {cliente.total_ordenes === 1 ? 'visita' : 'visitas'}</span>
                                        </div>
                                        {waLink && (
                                            <a
                                                href={waLink}
                                                target="_blank"
                                                rel="noopener noreferrer"
                                                className="flex items-center gap-1.5 bg-green-500/10 border border-green-500/20 hover:bg-green-500/20 transition-colors rounded-lg px-3 py-1.5 group"
                                            >
                                                <MessageCircle className="w-3.5 h-3.5 text-green-400 group-hover:scale-110 transition-transform" />
                                                <span className="text-green-400 text-xs font-bold">WhatsApp</span>
                                            </a>
                                        )}
                                    </div>
                                )}
                            </div>
                        </div>
                    </DialogHeader>
                </div>

                {/* ── TABS ───────────────────────────────────── */}
                <div className="px-6 py-4">
                    <Tabs value={activeTab} onValueChange={setActiveTab} className="w-full">
                        <TabsList className="bg-slate-900 border border-slate-800 w-full justify-start p-1 rounded-xl mb-4">
                            <TabsTrigger value="datos" className="rounded-lg data-[state=active]:bg-blue-600 data-[state=active]:text-white text-slate-400 font-medium transition-all flex-1">Datos</TabsTrigger>
                            {cliente && <TabsTrigger value="historial" className="rounded-lg data-[state=active]:bg-slate-800 data-[state=active]:text-white text-slate-400 font-medium transition-all flex-1">Historial</TabsTrigger>}
                            {cliente && <TabsTrigger value="vehiculos" className="rounded-lg data-[state=active]:bg-slate-800 data-[state=active]:text-white text-slate-400 font-medium transition-all flex-1">Vehículos</TabsTrigger>}
                        </TabsList>

                        <TabsContent value="datos" className="space-y-4 py-2">
                            <form id="cliente-form" onSubmit={handleSubmit} className="space-y-4">
                                <div className="grid grid-cols-2 gap-4">
                                    <div className="space-y-2">
                                        <Label htmlFor="nombre" className="text-slate-300 text-xs font-bold uppercase tracking-wider">Nombre Completo *</Label>
                                        <Input
                                            id="nombre"
                                            value={nombre}
                                            onChange={e => setNombre(e.target.value)}
                                            required
                                            className="bg-slate-900/70 border-slate-700 focus:border-blue-500 transition-colors"
                                        />
                                    </div>
                                    <div className="space-y-2">
                                        <Label htmlFor="telefono" className="text-slate-300 text-xs font-bold uppercase tracking-wider">Teléfono (WhatsApp)</Label>
                                        <div className="relative">
                                            <div className="absolute inset-y-0 left-0 flex items-center pl-3 pointer-events-none text-slate-500 text-sm font-mono">
                                                +569
                                            </div>
                                            <Input
                                                id="telefono"
                                                value={telefono}
                                                onChange={e => setTelefono(e.target.value)}
                                                required
                                                className="bg-slate-900/70 border-slate-700 focus:border-blue-500 pl-12 font-mono"
                                                placeholder="12345678"
                                                maxLength={8}
                                            />
                                        </div>
                                    </div>
                                    <div className="space-y-2">
                                        <Label htmlFor="email" className="text-slate-300 text-xs font-bold uppercase tracking-wider">Email</Label>
                                        <Input
                                            id="email"
                                            type="email"
                                            value={email}
                                            onChange={e => setEmail(e.target.value)}
                                            className="bg-slate-900/70 border-slate-700 focus:border-blue-500"
                                        />
                                    </div>
                                    <div className="space-y-2">
                                        <Label htmlFor="rut" className="text-slate-300 text-xs font-bold uppercase tracking-wider">RUT/DNI</Label>
                                        <Input
                                            id="rut"
                                            value={rut}
                                            onChange={e => setRut(e.target.value)}
                                            className="bg-slate-900/70 border-slate-700 focus:border-blue-500 font-mono"
                                        />
                                    </div>
                                </div>

                                <div className="space-y-2">
                                    <Label className="text-slate-300 text-xs font-bold uppercase tracking-wider">Tipo de Cliente</Label>
                                    <div className="flex gap-3">
                                        {(['persona', 'empresa'] as const).map(t => (
                                            <label key={t} className={`flex items-center gap-2 cursor-pointer px-4 py-2.5 rounded-xl border transition-all ${tipo === t ? 'bg-blue-600/20 border-blue-500/50 text-blue-300' : 'bg-slate-900 border-slate-700 text-slate-400 hover:border-slate-600'}`}>
                                                <input
                                                    type="radio"
                                                    name="tipo"
                                                    value={t}
                                                    checked={tipo === t}
                                                    onChange={() => setTipo(t)}
                                                    className="accent-blue-500 sr-only"
                                                />
                                                {t === 'empresa' ? <Building2 className="w-4 h-4" /> : <User className="w-4 h-4" />}
                                                <span className="text-sm font-medium capitalize">{t === 'empresa' ? 'Empresa' : 'Persona'}</span>
                                            </label>
                                        ))}
                                    </div>
                                </div>

                                <div className="space-y-2">
                                    <Label htmlFor="direccion" className="text-slate-300 text-xs font-bold uppercase tracking-wider">Dirección</Label>
                                    <Input
                                        id="direccion"
                                        value={direccion}
                                        onChange={e => setDireccion(e.target.value)}
                                        className="bg-slate-900/70 border-slate-700 focus:border-blue-500"
                                    />
                                </div>

                                <div className="space-y-2">
                                    <Label htmlFor="notas" className="text-slate-300 text-xs font-bold uppercase tracking-wider">Notas Internas</Label>
                                    <Textarea
                                        id="notas"
                                        value={notas}
                                        onChange={e => setNotas(e.target.value)}
                                        className="bg-slate-900/70 border-slate-700 focus:border-blue-500 min-h-[80px] resize-none"
                                        placeholder="Preferencias, alergias, observaciones..."
                                    />
                                </div>

                                {/* WhatsApp CTA for existing clients with phone */}
                                {cliente && waLink && (
                                    <a
                                        href={waLink}
                                        target="_blank"
                                        rel="noopener noreferrer"
                                        className="flex items-center justify-center gap-2.5 w-full py-3 rounded-xl bg-green-500/10 hover:bg-green-500/20 border border-green-500/30 hover:border-green-500/50 text-green-400 font-bold transition-all group"
                                    >
                                        <MessageCircle className="w-5 h-5 group-hover:scale-110 transition-transform" />
                                        Contactar por WhatsApp
                                    </a>
                                )}
                            </form>
                        </TabsContent>

                        <TabsContent value="historial" className="py-2">
                            {history.length === 0 ? (
                                <div className="text-center py-10 text-slate-500 border border-dashed border-slate-800 rounded-xl">
                                    <FileText className="w-10 h-10 mx-auto mb-2 opacity-30" />
                                    <p>No hay órdenes registradas para este cliente.</p>
                                </div>
                            ) : (
                                <div className="rounded-xl border border-slate-800 overflow-hidden">
                                    <Table>
                                        <TableHeader className="bg-slate-900">
                                            <TableRow className="border-slate-800">
                                                <TableHead className="text-slate-400 text-xs uppercase tracking-wider">Fecha</TableHead>
                                                <TableHead className="text-slate-400 text-xs uppercase tracking-wider">Vehículo</TableHead>
                                                <TableHead className="text-slate-400 text-xs uppercase tracking-wider">Servicio</TableHead>
                                                <TableHead className="text-right text-slate-400 text-xs uppercase tracking-wider">Total</TableHead>
                                                <TableHead className="text-right text-slate-400 text-xs uppercase tracking-wider">Ver</TableHead>
                                            </TableRow>
                                        </TableHeader>
                                        <TableBody>
                                            {history.map((order: any) => (
                                                <TableRow key={order.id} className="hover:bg-slate-900/50 border-slate-800/50">
                                                    <TableCell className="font-mono text-xs text-slate-400">{formatDate(order.fecha_ingreso)}</TableCell>
                                                    <TableCell>
                                                        <div className="text-xs font-semibold text-slate-200">{order.vehiculo_str}</div>
                                                    </TableCell>
                                                    <TableCell className="text-xs text-slate-400 max-w-[140px] truncate" title={order.descripcion_ingreso}>
                                                        {order.descripcion_ingreso || 'Mantención General'}
                                                    </TableCell>
                                                    <TableCell className="text-right font-mono text-emerald-400 font-bold">
                                                        {formatCurrency(order.precio_total)}
                                                    </TableCell>
                                                    <TableCell className="text-right">
                                                        <Button
                                                            variant="ghost"
                                                            size="sm"
                                                            onClick={() => {
                                                                onClose();
                                                                router.push(`/admin/ordenes/editar/${order.id}`);
                                                            }}
                                                            className="h-8 w-8 p-0 hover:bg-blue-500/10 hover:text-blue-400 rounded-lg"
                                                        >
                                                            <ExternalLink className="w-4 h-4" />
                                                        </Button>
                                                    </TableCell>
                                                </TableRow>
                                            ))}
                                        </TableBody>
                                    </Table>
                                </div>
                            )}
                        </TabsContent>

                        <TabsContent value="vehiculos" className="py-2">
                            <div className="space-y-4">
                                <div className="flex justify-between items-center">
                                    <h3 className="text-sm font-bold text-white uppercase tracking-widest flex items-center gap-2">
                                        <Car className="w-4 h-4 text-blue-400" />
                                        Flota del Cliente
                                    </h3>
                                    <Button
                                        onClick={() => setShowAddVehicle(!showAddVehicle)}
                                        size="sm"
                                        className={`${showAddVehicle ? 'bg-slate-700 hover:bg-slate-600' : 'bg-blue-600 hover:bg-blue-700'} text-white transition-colors rounded-lg`}
                                    >
                                        <Plus className="w-4 h-4 mr-1.5" />
                                        {showAddVehicle ? 'Cancelar' : 'Agregar Vehículo'}
                                    </Button>
                                </div>

                                {showAddVehicle && (
                                    <div className="bg-slate-900/60 p-4 rounded-xl border border-slate-700 space-y-4">
                                        <h4 className="font-medium text-slate-300 text-sm flex items-center gap-2">
                                            <Plus className="w-4 h-4 text-blue-400" />
                                            Nuevo Vehículo
                                        </h4>
                                        <div className="grid grid-cols-2 gap-4">
                                            <div className="space-y-2">
                                                <Label className="text-slate-400 text-xs uppercase tracking-wider">Patente</Label>
                                                <div className="flex gap-2">
                                                    <Input
                                                        value={newVehicle.patente}
                                                        onChange={e => setNewVehicle(prev => ({ ...prev, patente: e.target.value.toUpperCase() }))}
                                                        placeholder="AA-BB-11"
                                                        maxLength={6}
                                                        className="bg-slate-950 border-slate-700 font-mono uppercase focus:border-blue-500"
                                                        onBlur={handlePatenteBlur}
                                                        onKeyDown={(e) => {
                                                            if (e.key === 'Enter') { e.preventDefault(); handlePatenteBlur(); }
                                                        }}
                                                    />
                                                    <Button
                                                        type="button"
                                                        variant="secondary"
                                                        size="icon"
                                                        onClick={handlePatenteBlur}
                                                        disabled={isSearching}
                                                        className="bg-slate-800 hover:bg-slate-700 border-slate-700"
                                                    >
                                                        {isSearching ? <Loader2 className="w-4 h-4 animate-spin" /> : <Search className="w-4 h-4" />}
                                                    </Button>
                                                </div>
                                                {searchStatus && !isSearching && <span className="text-xs text-slate-400 mt-1 block">{searchStatus}</span>}
                                            </div>
                                            <div className="space-y-2">
                                                <Label className="text-slate-400 text-xs uppercase tracking-wider">Marca</Label>
                                                <Input
                                                    value={newVehicle.marca}
                                                    onChange={e => setNewVehicle(prev => ({ ...prev, marca: e.target.value }))}
                                                    placeholder="Toyota"
                                                    className="bg-slate-950 border-slate-700 focus:border-blue-500"
                                                />
                                            </div>
                                            <div className="space-y-2">
                                                <Label className="text-slate-400 text-xs uppercase tracking-wider">Modelo</Label>
                                                <Input
                                                    value={newVehicle.modelo}
                                                    onChange={e => setNewVehicle(prev => ({ ...prev, modelo: e.target.value }))}
                                                    placeholder="Yaris"
                                                    className="bg-slate-950 border-slate-700 focus:border-blue-500"
                                                />
                                            </div>
                                            <div className="space-y-2">
                                                <Label className="text-slate-400 text-xs uppercase tracking-wider">Año</Label>
                                                <Input
                                                    value={newVehicle.anio}
                                                    onChange={e => setNewVehicle(prev => ({ ...prev, anio: e.target.value }))}
                                                    placeholder="2020"
                                                    className="bg-slate-950 border-slate-700 focus:border-blue-500"
                                                />
                                            </div>
                                            <div className="col-span-2 space-y-2">
                                                <Label className="text-slate-400 text-xs uppercase tracking-wider">Motor (Opcional)</Label>
                                                <Input
                                                    value={newVehicle.motor}
                                                    onChange={e => setNewVehicle(prev => ({ ...prev, motor: e.target.value }))}
                                                    placeholder="1.5 L"
                                                    className="bg-slate-950 border-slate-700 focus:border-blue-500"
                                                />
                                            </div>
                                        </div>
                                        <Button
                                            onClick={handleAddVehicle}
                                            disabled={isSubmitting || !newVehicle.patente || !newVehicle.marca || !newVehicle.modelo}
                                            className="w-full bg-blue-600 hover:bg-blue-700 font-bold"
                                        >
                                            {isSubmitting ? <Loader2 className="w-4 h-4 animate-spin mr-2" /> : <Plus className="w-4 h-4 mr-2" />}
                                            Guardar Vehículo
                                        </Button>
                                    </div>
                                )}

                                <div className="rounded-xl border border-slate-800 overflow-hidden">
                                    <Table>
                                        <TableHeader className="bg-slate-900">
                                            <TableRow className="border-slate-800">
                                                <TableHead className="text-slate-400 text-xs uppercase tracking-wider">Patente</TableHead>
                                                <TableHead className="text-slate-400 text-xs uppercase tracking-wider">Vehículo</TableHead>
                                                <TableHead className="text-slate-400 text-xs uppercase tracking-wider">Motor</TableHead>
                                            </TableRow>
                                        </TableHeader>
                                        <TableBody>
                                            {optimisticVehicles.map((v: any) => (
                                                <TableRow key={v.patente} className="border-slate-800/50 hover:bg-slate-900/50">
                                                    <TableCell className="font-mono font-bold text-white tracking-wider">{v.patente}</TableCell>
                                                    <TableCell className="text-slate-300">{v.marca} {v.modelo} <span className="text-slate-500 text-xs">({v.anio})</span></TableCell>
                                                    <TableCell className="text-slate-400 text-sm">{v.motor || '-'}</TableCell>
                                                </TableRow>
                                            ))}
                                            {optimisticVehicles.length === 0 && (
                                                <TableRow>
                                                    <TableCell colSpan={3} className="text-center text-slate-500 py-8">
                                                        <Car className="w-8 h-8 mx-auto mb-2 opacity-30" />
                                                        No hay vehículos registrados
                                                    </TableCell>
                                                </TableRow>
                                            )}
                                        </TableBody>
                                    </Table>
                                </div>
                            </div>
                        </TabsContent>
                    </Tabs>
                </div>

                {/* ── FOOTER ─────────────────────────────────── */}
                <DialogFooter className="px-6 pb-5 pt-0 border-t border-slate-800/50">
                    {activeTab === 'datos' && (
                        <>
                            <Button variant="outline" onClick={onClose} disabled={isSubmitting} className="border-slate-700 text-slate-300 hover:text-white hover:bg-slate-800">
                                Cancelar
                            </Button>
                            <Button form="cliente-form" type="submit" disabled={isSubmitting} className="bg-blue-600 hover:bg-blue-700 text-white font-bold shadow-lg shadow-blue-900/30">
                                {isSubmitting ? (
                                    <>
                                        <Loader2 className="mr-2 h-4 w-4 animate-spin" />
                                        Guardando...
                                    </>
                                ) : (
                                    cliente ? 'Guardar Cambios' : 'Crear Cliente'
                                )}
                            </Button>
                        </>
                    )}
                    {activeTab !== 'datos' && (
                        <Button variant="outline" onClick={onClose} className="border-slate-700 text-slate-300 hover:text-white hover:bg-slate-800">
                            Cerrar
                        </Button>
                    )}
                </DialogFooter>
            </DialogContent>
        </Dialog>
    );
}
