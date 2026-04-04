'use client';

import { useState, useEffect } from 'react';
import { supabase } from '@/lib/supabase';
import { useAuth } from '@/contexts/auth-context';
import ModuleGuard from '@/components/guards/ModuleGuard';
import { Car, Clock, CheckCircle2, AlertTriangle, Calendar, User, Search, RefreshCw, Smartphone } from 'lucide-react';
import { Button } from '@/components/ui/button';
import { Input } from '@/components/ui/input';

interface Arriendo {
    id: string;
    patente: string;
    marca: string;
    modelo: string;
    anio: number;
    fecha_salida: string;
    fecha_retorno: string;
    cliente_id: string;
    estado: string;
}

interface Cliente {
    id: string;
    nombre_completo: string;
    telefono: string;
}

export default function RentACarPage() {
    const { user } = useAuth();
    const [arriendos, setArriendos] = useState<(Arriendo & { cliente?: Cliente })[]>([]);
    const [loading, setLoading] = useState(true);
    const [searchTerm, setSearchTerm] = useState('');

    const fetchData = async () => {
        if (!user?.tallerId) return;
        setLoading(true);

        try {
            // 1. Obtener flota arrendada
            const { data: flotaData, error: flotaError } = await supabase
                .from('flota')
                .select('*')
                .eq('taller_id', user.tallerId)
                .eq('estado', 'Arrendado');

            if (flotaError) throw flotaError;

            // 2. Obtener clientes (ya que no confiamos 100% en la FK de Supabase todavía)
            const { data: clientesData, error: clientesError } = await supabase
                .from('clientes')
                .select('id, nombre_completo, telefono')
                .eq('taller_id', user.tallerId);

            if (clientesError) throw clientesError;

            const clientesMap = new Map((clientesData || []).map(c => [c.id, c]));

            const combined = (flotaData || []).map(v => ({
                ...v,
                cliente: v.cliente_id ? clientesMap.get(v.cliente_id) : undefined
            }));

            // Ordenar por fecha de retorno más próxima
            combined.sort((a, b) => {
                if (!a.fecha_retorno) return 1;
                if (!b.fecha_retorno) return -1;
                return new Date(a.fecha_retorno).getTime() - new Date(b.fecha_retorno).getTime();
            });

            setArriendos(combined);
        } catch (error) {
            console.error('Error fetching rent-a-car data:', error);
        } finally {
            setLoading(false);
        }
    };

    useEffect(() => {
        fetchData();
    }, [user?.tallerId]);

    const isAtrasado = (fechaRetorno: string) => {
        if (!fechaRetorno) return false;
        const hoy = new Date();
        hoy.setHours(0, 0, 0, 0); // Comparar solo el día
        const retorno = new Date(fechaRetorno + 'T00:00:00'); // Tratar como hora local
        return retorno < hoy;
    };

    const formatDate = (dateStr: string) => {
        if (!dateStr) return 'N/A';
        const d = new Date(dateStr + 'T00:00:00');
        // DD/MM/YYYY
        return `${d.getDate().toString().padStart(2, '0')}/${(d.getMonth() + 1).toString().padStart(2, '0')}/${d.getFullYear()}`;
    };

    const filteredArriendos = arriendos.filter(a => {
        const term = searchTerm.toLowerCase();
        return a.patente?.toLowerCase().includes(term) ||
            a.marca?.toLowerCase().includes(term) ||
            a.modelo?.toLowerCase().includes(term) ||
            a.cliente?.nombre_completo?.toLowerCase().includes(term);
    });

    const totalActivos = arriendos.length;
    const totalAtrasados = arriendos.filter(a => isAtrasado(a.fecha_retorno)).length;

    return (
        <ModuleGuard componentId="rentacar" fallbackClassName="bg-slate-900 border border-slate-800">
            <div className="p-4 sm:p-6 lg:p-8 max-w-7xl mx-auto space-y-8">
                {/* Header */}
                <div className="flex flex-col sm:flex-row justify-between items-start sm:items-center gap-4">
                    <div>
                        <h1 className="text-2xl sm:text-3xl font-black text-white tracking-tight flex items-center gap-3">
                            <Car className="w-8 h-8 text-cyan-400" />
                            Gestión Rent-a-Car
                        </h1>
                        <p className="text-slate-400 mt-1">Monitorea los arriendos activos y fechas de retorno.</p>
                    </div>
                </div>

                {/* Dashboard Stats */}
                <div className="grid grid-cols-1 sm:grid-cols-2 gap-4">
                    <div className="bg-slate-800/60 rounded-2xl p-5 border border-slate-700/50 flex items-center gap-4 relative overflow-hidden">
                        <div className="absolute top-0 right-0 p-6 opacity-5">
                            <Car className="w-24 h-24" />
                        </div>
                        <div className="p-3 rounded-xl bg-blue-500/20 border border-blue-500/40 text-blue-400">
                            <Clock className="w-6 h-6" />
                        </div>
                        <div>
                            <p className="text-sm font-bold text-slate-400 uppercase tracking-wider">Arriendos Activos</p>
                            <p className="text-3xl font-black text-white mt-1">{totalActivos}</p>
                        </div>
                    </div>
                    
                    <div className="bg-slate-800/60 rounded-2xl p-5 border border-slate-700/50 flex items-center gap-4 relative overflow-hidden">
                        <div className="absolute top-0 right-0 p-6 opacity-5">
                            <AlertTriangle className="w-24 h-24" />
                        </div>
                        <div className="p-3 rounded-xl bg-red-500/20 border border-red-500/40 text-red-400">
                            <AlertTriangle className="w-6 h-6" />
                        </div>
                        <div>
                            <p className="text-sm font-bold text-slate-400 uppercase tracking-wider">Atrasados</p>
                            <p className="text-3xl font-black text-white mt-1">{totalAtrasados}</p>
                        </div>
                    </div>
                </div>

                {/* Main Content */}
                <div className="bg-slate-900 border border-slate-800 rounded-3xl overflow-hidden flex flex-col">
                    <div className="p-5 border-b border-slate-800 bg-slate-800/20 flex flex-col sm:flex-row gap-4 justify-between items-center">
                        <div className="relative w-full sm:max-w-md">
                            <Search className="absolute left-3 top-1/2 -translate-y-1/2 w-4 h-4 text-slate-500" />
                            <Input 
                                placeholder="Buscar patente, modelo o cliente..." 
                                value={searchTerm}
                                onChange={(e) => setSearchTerm(e.target.value)}
                                className="pl-9 bg-slate-950 border-slate-700 text-white rounded-xl focus-visible:ring-cyan-500 focus-visible:border-cyan-500"
                            />
                        </div>
                        <Button 
                            variant="outline" 
                            onClick={fetchData} 
                            disabled={loading}
                            className="bg-slate-800 border-slate-700 text-slate-300 hover:bg-slate-700 w-full sm:w-auto"
                        >
                            <RefreshCw className={`w-4 h-4 mr-2 ${loading ? 'animate-spin' : ''}`} />
                            Actualizar
                        </Button>
                    </div>

                    <div className="overflow-x-auto min-h-[400px]">
                        <table className="w-full text-left border-collapse">
                            <thead>
                                <tr className="border-b border-slate-800 bg-slate-900/50">
                                    <th className="p-4 text-xs font-bold text-slate-400 uppercase tracking-wider">Vehículo</th>
                                    <th className="p-4 text-xs font-bold text-slate-400 uppercase tracking-wider">Cliente Asignado</th>
                                    <th className="p-4 text-xs font-bold text-slate-400 uppercase tracking-wider">Fechas de Arriendo</th>
                                    <th className="p-4 text-xs font-bold text-slate-400 uppercase tracking-wider text-right">Estado</th>
                                </tr>
                            </thead>
                            <tbody className="divide-y divide-slate-800/50">
                                {loading ? (
                                    <tr>
                                        <td colSpan={4} className="p-8 text-center text-slate-500">
                                            <div className="flex flex-col justify-center items-center gap-2">
                                                <RefreshCw className="w-6 h-6 animate-spin text-cyan-500" />
                                                <p>Cargando información...</p>
                                            </div>
                                        </td>
                                    </tr>
                                ) : filteredArriendos.length === 0 ? (
                                    <tr>
                                        <td colSpan={4} className="p-12 text-center">
                                            <div className="inline-flex items-center justify-center w-16 h-16 rounded-full bg-slate-800 mb-4">
                                                <Car className="w-8 h-8 text-slate-500" />
                                            </div>
                                            <p className="text-slate-400 text-lg">No hay vehículos arrendados actualmente.</p>
                                            <p className="text-slate-500 text-sm mt-1">
                                                Ve al módulo de Flota para asignar vehículos a un cliente.
                                            </p>
                                        </td>
                                    </tr>
                                ) : (
                                    filteredArriendos.map((item) => {
                                        const atrasado = isAtrasado(item.fecha_retorno);
                                        return (
                                            <tr key={item.id} className="hover:bg-slate-800/20 transition-colors group">
                                                <td className="p-4">
                                                    <div className="flex items-center gap-3">
                                                        <div className={`p-2 rounded-lg ${atrasado ? 'bg-red-500/10' : 'bg-cyan-500/10'}`}>
                                                            <Car className={`w-5 h-5 ${atrasado ? 'text-red-400' : 'text-cyan-400'}`} />
                                                        </div>
                                                        <div>
                                                            <p className="font-mono font-black text-white">{item.patente}</p>
                                                            <p className="text-xs text-slate-400">{item.marca} {item.modelo}</p>
                                                        </div>
                                                    </div>
                                                </td>
                                                <td className="p-4">
                                                    {item.cliente ? (
                                                        <div>
                                                            <p className="font-bold text-slate-200 flex items-center gap-2">
                                                                <User className="w-3.5 h-3.5 text-slate-500" />
                                                                {item.cliente.nombre_completo}
                                                            </p>
                                                            {item.cliente.telefono && (
                                                                <p className="text-xs text-slate-400 flex items-center gap-2 mt-1">
                                                                    <Smartphone className="w-3.5 h-3.5 text-slate-500" />
                                                                    {item.cliente.telefono}
                                                                </p>
                                                            )}
                                                        </div>
                                                    ) : (
                                                        <p className="text-sm text-slate-500 italic">Cliente no encontrado (ID: {item.cliente_id})</p>
                                                    )}
                                                </td>
                                                <td className="p-4">
                                                    <div className="flex items-center gap-3">
                                                        <div>
                                                            <p className="text-[10px] text-slate-500 uppercase font-bold tracking-wider">Salida</p>
                                                            <p className="text-sm text-slate-200 font-medium flex items-center gap-1.5">
                                                                <Calendar className="w-3.5 h-3.5 text-slate-400" />
                                                                {formatDate(item.fecha_salida)}
                                                            </p>
                                                        </div>
                                                        <div className="w-4 h-px bg-slate-700"></div>
                                                        <div>
                                                            <p className="text-[10px] text-slate-500 uppercase font-bold tracking-wider">Retorno</p>
                                                            <p className={`text-sm font-medium flex items-center gap-1.5 ${atrasado ? 'text-red-400 font-bold' : 'text-slate-200'}`}>
                                                                <Calendar className={`w-3.5 h-3.5 ${atrasado ? 'text-red-400' : 'text-slate-400'}`} />
                                                                {formatDate(item.fecha_retorno)}
                                                            </p>
                                                        </div>
                                                    </div>
                                                </td>
                                                <td className="p-4 text-right">
                                                    {atrasado ? (
                                                        <div className="inline-flex items-center gap-1.5 px-3 py-1.5 rounded-full border border-red-500/40 bg-red-500/20 text-red-400 text-xs font-bold shadow-[0_0_15px_rgba(239,68,68,0.2)]">
                                                            <AlertTriangle className="w-3.5 h-3.5" />
                                                            Atrasado
                                                        </div>
                                                    ) : (
                                                        <div className="inline-flex items-center gap-1.5 px-3 py-1.5 rounded-full border border-emerald-500/40 bg-emerald-500/20 text-emerald-400 text-xs font-bold">
                                                            <CheckCircle2 className="w-3.5 h-3.5" />
                                                            Vigente
                                                        </div>
                                                    )}
                                                </td>
                                            </tr>
                                        );
                                    })
                                )}
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </ModuleGuard>
    );
}
