'use client';

import { useState, useEffect, useMemo, useRef, useCallback, Fragment } from 'react';
import { useRouter, useSearchParams } from 'next/navigation';
import { useAuth } from '@/contexts/auth-context';
import { useDebounce } from '@/hooks/use-debounce';
import { Button } from '@/components/ui/button';
import { Input } from '@/components/ui/input';
import { Card } from '@/components/ui/card';
import { Tabs, TabsContent, TabsList, TabsTrigger } from '@/components/ui/tabs';
import {
    Users,
    Search,
    Plus,
    MoreHorizontal,
    Phone,
    Mail,
    Building2,
    User,
    Loader2,
    Calendar,
    Wallet,
    TrendingUp,
    ChevronDown,
    ChevronUp,
    Car,
    FileText,
    Wrench,
    Crown,
    ArrowUpDown,
    ArrowUp,
    ArrowDown,
    ArrowRight,
    AlertTriangle,
    MessageCircle
} from 'lucide-react';
import { supabase } from '@/lib/supabase';
import { obtenerClientes } from '@/lib/supabase-service';
import type { ClienteWithStats, VehiculoDB } from '@/lib/storage-adapter';
import Link from 'next/link';
import {
    DropdownMenu,
    DropdownMenuContent,
    DropdownMenuItem,
    DropdownMenuLabel,
    DropdownMenuTrigger,
    DropdownMenuSeparator
} from '@/components/ui/dropdown-menu';
import {
    Dialog,
    DialogContent,
    DialogHeader,
    DialogTitle,
} from '@/components/ui/dialog';
import { ClienteModal } from '@/components/clientes/cliente-modal';
import { useInfiniteClientes } from '@/hooks/use-clientes';

// Helper for formatting currency
const formatCurrency = (amount: number) => {
    return new Intl.NumberFormat('es-CL', { style: 'currency', currency: 'CLP' }).format(amount);
};

// Componente para mostrar contratos del cliente (Lazy loading)
function ContratosCliente({ rut, tallerId }: { rut: string; tallerId: string }) {
    const [contratos, setContratos] = useState<any[]>([]);
    const [loading, setLoading] = useState(true);

    useEffect(() => {
        async function fetchContratos() {
            if (!rut || !tallerId) return;
            setLoading(true);
            try {
                const { data, error } = await supabase
                    .from('contratos')
                    .select('*')
                    .eq('cliente_rut', rut)
                    .eq('taller_id', tallerId)
                    .order('creado_en', { ascending: false });

                if (data) setContratos(data);
            } catch (error) {
                console.error('Error fetching contracts:', error);
            } finally {
                setLoading(false);
            }
        }
        fetchContratos();
    }, [rut, tallerId]);

    if (loading) return (
        <div className="flex flex-col items-center justify-center py-12 gap-3">
            <Loader2 className="w-8 h-8 animate-spin text-blue-500" />
            <p className="text-slate-400 text-sm font-medium animate-pulse">Cargando historial contractual...</p>
        </div>
    );

    if (contratos.length === 0) {
        return (
            <div className="flex flex-col items-center justify-center py-12 text-center bg-slate-900/40 rounded-2xl border border-slate-800 border-dashed group hover:border-blue-500/30 transition-colors">
                <div className="w-16 h-16 bg-slate-800/50 rounded-2xl flex items-center justify-center mb-4 group-hover:scale-110 transition-transform">
                    <FileText className="w-8 h-8 text-slate-600 group-hover:text-blue-500/50" />
                </div>
                <h5 className="text-white font-bold mb-1">Sin contratos registrados</h5>
                <p className="text-sm text-slate-500 max-w-[280px]">No se han generado contratos de venta o arriendo para este RUT aún.</p>
            </div>
        );
    }

    return (
        <div className="grid grid-cols-1 md:grid-cols-2 gap-4">
            {contratos.map((c) => (
                <div key={c.id} className="group bg-[#1E293B] border border-slate-700/60 p-5 rounded-2xl hover:border-blue-500/50 transition-all shadow-lg relative overflow-hidden">
                    <div className="absolute top-0 right-0 p-3">
                        <div className={`px-2.5 py-1 rounded-full text-[10px] font-black uppercase tracking-tighter ${
                            c.estado === 'firmado' ? 'bg-emerald-500/20 text-emerald-400 border border-emerald-500/30' : 'bg-blue-500/20 text-blue-400 border border-blue-500/30'
                        }`}>
                            {c.estado || 'activo'}
                        </div>
                    </div>
                    
                    <div className="flex items-start gap-4 mb-4">
                        <div className="w-12 h-12 bg-slate-800 rounded-xl flex items-center justify-center border border-slate-700 shadow-inner group-hover:bg-blue-500/10 transition-colors">
                            <Car className="w-6 h-6 text-slate-400 group-hover:text-blue-400" />
                        </div>
                        <div>
                            <p className="text-[10px] text-blue-400 font-black uppercase tracking-widest">{c.tipo || 'CONTRATO'}</p>
                            <h4 className="text-white font-bold text-sm tracking-tight">{c.vehiculo_marca} {c.vehiculo_modelo}</h4>
                            <p className="text-xs text-slate-500 font-mono mt-0.5">{c.vehiculo_patente}</p>
                        </div>
                    </div>

                    <div className="grid grid-cols-2 gap-4 py-3 border-t border-slate-700/50 mt-2">
                        <div>
                            <p className="text-[10px] text-slate-500 font-bold uppercase mb-0.5">Fecha</p>
                            <p className="text-xs text-white font-medium">{new Date(c.creado_en).toLocaleDateString('es-CL', { day: '2-digit', month: 'short', year: 'numeric' })}</p>
                        </div>
                        <div className="text-right">
                            <p className="text-[10px] text-slate-500 font-bold uppercase mb-0.5">Monto Total</p>
                            <p className="text-sm text-emerald-400 font-black">{formatCurrency(c.precio_total || 0)}</p>
                        </div>
                    </div>

                    <Button variant="ghost" size="sm" className="w-full mt-2 bg-slate-800/30 hover:bg-blue-600 hover:text-white text-slate-400 border border-transparent hover:border-blue-500 text-[11px] font-bold h-9 rounded-xl transition-all">
                        <FileText className="w-3.5 h-3.5 mr-2" />
                        Ver Documentación
                    </Button>
                </div>
            ))}
        </div>
    );
}

// Skeleton loader para la tabla de clientes
function ClientesSkeleton() {
    return (
        <div className="space-y-4 animate-pulse">
            {/* Desktop Skeleton */}
            <div className="hidden md:block bg-[#0F172A] border border-slate-700/80 rounded-2xl overflow-hidden">
                <div className="bg-[#1E293B] h-14 border-b border-slate-700/80" />
                {[...Array(8)].map((_, i) => (
                    <div key={i} className="flex items-center px-6 py-4 gap-4 border-b border-slate-800/80">
                        <div className="w-11 h-11 bg-slate-800 rounded-xl" />
                        <div className="flex-1 space-y-2">
                            <div className="h-4 w-32 bg-slate-800 rounded" />
                            <div className="h-3 w-20 bg-slate-800 rounded" />
                        </div>
                        <div className="flex-1 space-y-2">
                            <div className="h-4 w-24 bg-slate-800 rounded" />
                            <div className="h-3 w-32 bg-slate-800 rounded" />
                        </div>
                        <div className="w-24 h-4 bg-slate-800 rounded" />
                        <div className="w-24 h-6 bg-slate-800/50 rounded-lg" />
                        <div className="w-10 h-10 bg-slate-800 rounded-full" />
                    </div>
                ))}
            </div>

            {/* Mobile Skeleton */}
            <div className="md:hidden space-y-4">
                {[...Array(4)].map((_, i) => (
                    <div key={i} className="bg-[#1E293B] border border-slate-700/60 p-5 rounded-2xl space-y-4">
                        <div className="flex items-center gap-4">
                            <div className="w-12 h-12 bg-slate-800 rounded-xl" />
                            <div className="space-y-2">
                                <div className="h-4 w-32 bg-slate-800 rounded" />
                                <div className="h-3 w-16 bg-slate-800 rounded" />
                            </div>
                        </div>
                        <div className="grid grid-cols-2 gap-3 pb-2">
                            <div className="h-12 bg-slate-800/30 rounded-lg" />
                            <div className="h-12 bg-slate-800/30 rounded-lg" />
                        </div>
                    </div>
                ))}
            </div>
        </div>
    );
}

export default function ClientesContent() {
    const { user } = useAuth();
    const isEmployee = user?.role === 'mecanico' || user?.role === 'vendedor';
    const router = useRouter();
    const searchParams = useSearchParams();
    const query = searchParams.get('q') || '';

    // React Query Infinite Scroll
    const [searchTerm, setSearchTerm] = useState(query);
    const debouncedSearchTerm = useDebounce(searchTerm, 500);

    const {
        data,
        fetchNextPage,
        hasNextPage,
        isFetchingNextPage,
        isLoading: isLoadingInitial,
        refetch
    } = useInfiniteClientes(debouncedSearchTerm, 20);

    const allClientes = useMemo(() => {
        return data?.pages.flatMap(page => page.data) || [];
    }, [data]);

    const totalCount = data?.pages[0]?.count || 0;
    const tallerId = user?.tallerId;

    const [expandedClientId, setExpandedClientId] = useState<string | null>(null);
    const [sortConfig, setSortConfig] = useState<{ key: string; direction: 'asc' | 'desc' } | null>(null);

    // Modal State
    const [isModalOpen, setIsModalOpen] = useState(false);
    const [selectedCliente, setSelectedCliente] = useState<ClienteWithStats | undefined>(undefined);
    const [modalTab, setModalTab] = useState('datos');

    // Order Creation State
    const [orderingCliente, setOrderingCliente] = useState<ClienteWithStats | null>(null);

    const handleNewCliente = () => {
        setSelectedCliente(undefined);
        setModalTab('datos');
        setIsModalOpen(true);
    };

    const handleEditCliente = (cliente: ClienteWithStats, tab = 'datos') => {
        setSelectedCliente(cliente);
        setModalTab(tab);
        setIsModalOpen(true);
    };

    const toggleRow = (id: string) => {
        setExpandedClientId(expandedClientId === id ? null : id);
    };

    const handleCreateOrder = (cliente: ClienteWithStats) => {
        // If multiple vehicles, show selector
        if (cliente.vehiculos && cliente.vehiculos.length > 1) {
            setOrderingCliente(cliente);
        } else if (cliente.vehiculos && cliente.vehiculos.length === 1) {
            // If single vehicle, go directly
            router.push(`/recepcion?patente=${cliente.vehiculos[0].patente}`);
        } else {
            // No vehicle, go with RUT
            router.push(`/recepcion?rut=${cliente.rut_dni}`);
        }
    };

    // Sorting Logic
    const handleSort = (key: string) => {
        let direction: 'asc' | 'desc' = 'asc';
        if (sortConfig && sortConfig.key === key && sortConfig.direction === 'asc') {
            direction = 'desc';
        }
        setSortConfig({ key, direction });
    };

    // Sorting Logic (Local sorting for current displayed items)
    const displayClientes = useMemo(() => {
        let sortableItems = [...allClientes];
        if (sortConfig !== null) {
            sortableItems.sort((a, b: any) => {
                const key = sortConfig.key as keyof ClienteWithStats;
                const valA = a[key] ?? '';
                const valB = b[key] ?? '';
                if (valA < valB) return sortConfig.direction === 'asc' ? -1 : 1;
                if (valA > valB) return sortConfig.direction === 'asc' ? 1 : -1;
                return 0;
            });
        }
        return sortableItems;
    }, [allClientes, sortConfig]);

    // INFINITE SCROLL OBSERVER
    const observerRef = useRef<HTMLDivElement | null>(null);

    useEffect(() => {
        if (!hasNextPage || isFetchingNextPage) return;

        const observer = new IntersectionObserver(
            (entries) => {
                if (entries[0].isIntersecting) {
                    fetchNextPage();
                }
            },
            { threshold: 0.1 }
        );

        const currentTarget = observerRef.current;
        if (currentTarget) {
            observer.observe(currentTarget);
        }

        return () => {
            if (currentTarget) {
                observer.unobserve(currentTarget);
            }
        };
    }, [fetchNextPage, hasNextPage, isFetchingNextPage, allClientes]);

    // Fetch clients
    const premiumClientId = useMemo(() => {
        if (!allClientes || allClientes.length === 0) return null;
        const maxOrders = Math.max(...allClientes.map(c => c.total_ordenes || 0));
        if (maxOrders === 0) return null;
        const topClients = allClientes.filter(c => c.total_ordenes === maxOrders);
        return topClients.length === 1 ? topClients[0].id : null;
    }, [allClientes]);

    const confirmOrderVehicle = (patente: string) => {
        router.push(`/recepcion?patente=${patente}`);
        setOrderingCliente(null);
    };

    // Calculate KPIs
    const kpis = useMemo(() => {
        const total = totalCount; // Usamos la variable de paginación del servidor!
        const active = allClientes.filter(c => c.total_ordenes > 0).length;
        const totalRevenue = allClientes.reduce((acc, c) => acc + (c.total_gastado || 0), 0);

        let totalDebt = 0;
        allClientes.forEach(c => {
            if (c.vehiculos) {
                c.vehiculos.forEach((v: any) => {
                    if (v.ordenes) {
                        v.ordenes.forEach((o: any) => {
                            if (o.metodo_pago?.includes('debe')) {
                                if (o.metodos_pago && Array.isArray(o.metodos_pago)) {
                                    const amountDebe = o.metodos_pago
                                        .filter((mp: any) => mp.metodo === 'debe')
                                        .reduce((sum: number, mp: any) => sum + (mp.monto || 0), 0);
                                    totalDebt += amountDebe;
                                } else {
                                    totalDebt += (o.precio_total || 0);
                                }
                            }
                        });
                    }
                });
            }
        });

        return { total, active, totalRevenue, totalDebt };
    }, [allClientes, totalCount]);

    // Handle Search
    const handleSearch = (e: React.FormEvent) => {
        e.preventDefault();
        const params = new URLSearchParams(searchParams);
        if (searchTerm) {
            params.set('q', searchTerm);
        } else {
            params.delete('q');
        }
        router.replace(`/admin/clientes?${params.toString()}`);
    };

    return (
        <div className="space-y-6">
            {/* Header */}
            <div className="flex flex-col md:flex-row md:items-center justify-between gap-4 p-6 bg-gradient-to-r from-slate-900 via-slate-800 to-slate-900 rounded-2xl border border-slate-800 shadow-xl overflow-hidden relative">
                <div className="absolute top-0 right-0 w-64 h-64 bg-red-500/10 rounded-full blur-3xl -mr-20 -mt-20 pointer-events-none"></div>

                <div className="relative z-10">
                    <h1 className="text-3xl font-extrabold text-transparent bg-clip-text bg-gradient-to-r from-white to-slate-400 flex items-center gap-3">
                        <Users className="w-8 h-8 text-red-500" />
                        Directorio de Clientes
                    </h1>
                    <p className="text-slate-400 font-medium mt-1">Gestión avanzada de CRM y fidelización</p>
                </div>

                <Button
                    onClick={handleNewCliente}
                    className="relative z-10 bg-red-600 hover:bg-red-700 text-white w-full md:w-auto shadow-lg shadow-red-600/30 rounded-xl px-6 py-5 font-bold transition-all hover:scale-[1.02] hover:-translate-y-0.5"
                >
                    <Plus className="w-5 h-5 mr-2" />
                    Nuevo Cliente
                </Button>
            </div>

            {/* KPI Cards */}
            <div className="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-4 gap-6">
                <Card className="bg-[#1E293B] border-slate-700 p-6 flex items-center gap-5 hover:border-blue-500/50 hover:shadow-lg hover:shadow-blue-500/10 transition-all group rounded-2xl">
                    <div className="w-14 h-14 rounded-2xl bg-blue-500/10 flex items-center justify-center group-hover:bg-blue-500/20 transition-colors border border-blue-500/20 group-hover:scale-110">
                        <Users className="w-7 h-7 text-blue-400" />
                    </div>
                    <div>
                        <p className="text-blue-400/80 text-[11px] font-bold uppercase tracking-widest mb-1">Total Clientes</p>
                        <p className="text-4xl font-black text-white leading-none tracking-tight">{kpis.total}</p>
                    </div>
                </Card>

                <Card className="bg-[#1E293B] border-slate-700 p-6 flex items-center gap-5 hover:border-emerald-500/50 hover:shadow-lg hover:shadow-emerald-500/10 transition-all group rounded-2xl">
                    <div className="w-14 h-14 rounded-2xl bg-emerald-500/10 flex items-center justify-center group-hover:bg-emerald-500/20 transition-colors border border-emerald-500/20 group-hover:scale-110">
                        <TrendingUp className="w-7 h-7 text-emerald-400" />
                    </div>
                    <div>
                        <p className="text-emerald-400/80 text-[11px] font-bold uppercase tracking-widest mb-1">Clientes Activos</p>
                        <p className="text-4xl font-black text-white leading-none tracking-tight">{kpis.active}</p>
                    </div>
                </Card>

                {!isEmployee && (
                    <>
                        <Card className="bg-[#1E293B] border-slate-700 p-6 flex items-center gap-5 hover:border-yellow-500/50 hover:shadow-lg hover:shadow-yellow-500/10 transition-all group rounded-2xl">
                            <div className="w-14 h-14 rounded-2xl bg-yellow-500/10 flex items-center justify-center group-hover:bg-yellow-500/20 transition-colors border border-yellow-500/20 group-hover:scale-110">
                                <Wallet className="w-7 h-7 text-yellow-400" />
                            </div>
                            <div>
                                <p className="text-yellow-400/80 text-[11px] font-bold uppercase tracking-widest mb-1">Ingresos Totales</p>
                                <p className="text-2xl font-black text-white leading-none tracking-tight">{formatCurrency(kpis.totalRevenue)}</p>
                            </div>
                        </Card>

                        <Card className="bg-[#1E293B] border-slate-700/50 p-6 flex items-center gap-5 hover:border-red-500/50 hover:shadow-lg hover:shadow-red-500/10 transition-all group rounded-2xl relative overflow-hidden">
                            <div className="absolute inset-0 bg-gradient-to-br from-red-500/5 to-transparent opacity-0 group-hover:opacity-100 transition-opacity"></div>
                            <div className="relative z-10 w-14 h-14 rounded-2xl bg-red-500/10 flex items-center justify-center group-hover:bg-red-500/20 transition-colors border border-red-500/20 group-hover:scale-110">
                                <AlertTriangle className="w-7 h-7 text-red-500" />
                            </div>
                            <div className="relative z-10">
                                <p className="text-red-400/80 text-[11px] font-bold uppercase tracking-widest mb-1">Cartera Vencida</p>
                                <p className="text-2xl font-black text-red-400 leading-none tracking-tight">{formatCurrency(kpis.totalDebt)}</p>
                            </div>
                        </Card>
                    </>
                )}
            </div>

            {/* Search */}
            <div className="relative group">
                <div className="absolute inset-0 bg-gradient-to-r from-blue-500/10 via-transparent to-red-500/10 rounded-xl blur-md opacity-0 group-hover:opacity-100 transition-opacity duration-500"></div>
                <Card className="relative bg-[#0F172A] border-slate-700/60 p-2 rounded-xl shadow-lg">
                    <form onSubmit={handleSearch} className="flex gap-2">
                        <div className="relative flex-1 flex items-center">
                            <Search className="absolute left-4 w-5 h-5 text-slate-500 group-focus-within:text-blue-500 transition-colors" />
                            <Input
                                placeholder="Buscar por nombre, RUT, patente o email..."
                                value={searchTerm}
                                onChange={(e) => setSearchTerm(e.target.value)}
                                className="bg-transparent border-none pl-12 text-white placeholder:text-slate-600 focus-visible:ring-0 text-base h-12 shadow-none"
                            />
                        </div>
                        <Button type="submit" className="bg-slate-800 hover:bg-slate-700 text-white font-medium border border-slate-700 h-12 px-6 rounded-lg transition-colors">
                            Buscar
                        </Button>
                    </form>
                </Card>
            </div>

            {/* CONTENT AREA */}
            <div className="space-y-4">
                {isLoadingInitial ? (
                    <ClientesSkeleton />
                ) : allClientes.length === 0 ? (
                    <div className="text-center p-16 text-slate-500 bg-[#0F172A] rounded-2xl border border-slate-800 shadow-inner">
                        <div className="w-20 h-20 bg-slate-800/50 rounded-full flex items-center justify-center mx-auto mb-4">
                            <Users className="w-10 h-10 opacity-40 text-slate-400" />
                        </div>
                        <p className="text-xl font-medium text-slate-300">No se encontraron clientes o vehículos con ese criterio</p>
                        <p className="text-sm mt-2 text-slate-500">Intenta modificar la búsqueda o crear uno nuevo.</p>
                    </div>
                ) : (
                    <>
                        {/* MOBILE VIEW (CARDS) */}
                        <div className="grid grid-cols-1 gap-4 md:hidden">
                            {displayClientes.map((cliente) => (
                                <Card key={cliente.id} className="bg-[#1E293B] border-slate-700/60 p-5 space-y-4 rounded-2xl shadow-md">
                                    <div className="flex items-start justify-between">
                                        <div className="flex items-center gap-4">
                                            <div className="w-12 h-12 rounded-xl bg-gradient-to-br from-slate-700 to-slate-800 flex items-center justify-center text-slate-300 font-bold border border-slate-600/50 shadow-inner">
                                                {cliente.nombre_completo.charAt(0).toUpperCase()}
                                            </div>
                                            <div>
                                                <p className="font-bold text-white text-lg">{cliente.nombre_completo}</p>
                                                <span className={`inline-flex items-center px-2.5 py-0.5 mt-1 rounded-md text-[10px] font-bold uppercase tracking-wider border ${cliente.tipo === 'empresa'
                                                    ? 'bg-purple-500/10 text-purple-400 border-purple-500/20'
                                                    : 'bg-blue-500/10 text-blue-400 border-blue-500/20'
                                                    }`}>
                                                    {cliente.tipo === 'empresa' ? 'Empresa' : 'Particular'}
                                                </span>
                                            </div>
                                        </div>
                                        <DropdownMenu>
                                            <DropdownMenuTrigger asChild>
                                                <Button variant="ghost" className="h-10 w-10 p-0 text-slate-400 hover:text-white hover:bg-slate-700 rounded-full">
                                                    <MoreHorizontal className="w-5 h-5" />
                                                </Button>
                                            </DropdownMenuTrigger>
                                            <DropdownMenuContent align="end" className="bg-[#0F172A] border-slate-700 text-slate-200 rounded-xl shadow-xl">
                                                <DropdownMenuItem onClick={() => handleEditCliente(cliente, 'datos')} className="hover:bg-slate-800 focus:bg-slate-800 cursor-pointer">Editar Cliente</DropdownMenuItem>
                                                <DropdownMenuItem onClick={() => handleEditCliente(cliente, 'historial')} className="hover:bg-slate-800 focus:bg-slate-800 text-blue-400 cursor-pointer">Ver Historial de Órdenes</DropdownMenuItem>
                                                <DropdownMenuItem 
                                                    onClick={() => router.push(`/admin/contratos?rut=${cliente.rut_dni}`)} 
                                                    className="hover:bg-slate-800 focus:bg-slate-800 text-amber-400 cursor-pointer"
                                                >
                                                    📝 Nuevo Contrato
                                                </DropdownMenuItem>
                                            </DropdownMenuContent>
                                        </DropdownMenu>
                                    </div>

                                    <div className="grid grid-cols-2 gap-3 py-3 border-t border-slate-700/50 border-b">
                                        {!isEmployee && (
                                            <div className="text-right">
                                                <p className="text-[11px] font-bold text-slate-500 uppercase tracking-widest mb-1">Total Gastado</p>
                                                <p className="text-base font-black text-emerald-400">{formatCurrency(cliente.total_gastado)}</p>
                                            </div>
                                        )}
                                        <div className="text-right pl-4 border-l border-slate-800/50">
                                            <p className="text-[11px] font-bold text-slate-500 uppercase tracking-widest mb-1">Órdenes</p>
                                            <p className="text-base font-black text-white">{cliente.total_ordenes}</p>
                                        </div>
                                    </div>

                                    <div className="flex items-center justify-between text-sm text-slate-400 px-1">
                                        <div className="flex items-center gap-2 font-medium">
                                            <Phone className="w-4 h-4 text-blue-500/70" />
                                            {cliente.telefono || '---'}
                                        </div>
                                        <div className="flex items-center gap-1.5 text-xs">
                                            <div className="w-2 h-2 rounded-full bg-emerald-500 animate-pulse"></div>
                                            Activo
                                        </div>
                                    </div>
                                </Card>
                            ))}
                        </div>

                        {/* DESKTOP VIEW (TABLE) */}
                        <div className="hidden md:block bg-[#0F172A] border border-slate-700/80 rounded-2xl shadow-2xl overflow-hidden relative">
                            {/* Decorative top border gradient */}
                            <div className="absolute top-0 left-0 right-0 h-[2px] bg-gradient-to-r from-blue-500 via-emerald-500 to-red-500 opacity-50"></div>

                            <div className="overflow-x-auto custom-scrollbar">
                                <table className="w-full text-left text-sm text-slate-300 min-w-[1000px]">
                                    <thead className="bg-[#1E293B] text-slate-400 uppercase font-bold text-[11px] tracking-widest border-b border-slate-700/80">
                                        <tr>
                                            <th className="px-6 py-5 cursor-pointer hover:text-white transition-colors group" onClick={() => handleSort('nombre_completo')}>
                                                <div className="flex items-center gap-2">
                                                    CLIENTE
                                                    <ArrowUpDown className="w-3.5 h-3.5 text-slate-600 group-hover:text-blue-500 transition-colors" />
                                                </div>
                                            </th>
                                            <th className="px-6 py-5 cursor-pointer hover:text-white transition-colors group" onClick={() => handleSort('telefono')}>
                                                <div className="flex items-center gap-2">
                                                    CONTACTO
                                                    <ArrowUpDown className="w-3.5 h-3.5 text-slate-600 group-hover:text-blue-500 transition-colors" />
                                                </div>
                                            </th>
                                            <th className="px-6 py-5 cursor-pointer hover:text-white transition-colors group" onClick={() => handleSort('total_gastado')}>
                                                <div className="flex items-center gap-2">
                                                    ESTADÍSTICAS
                                                    <ArrowUpDown className="w-3.5 h-3.5 text-slate-600 group-hover:text-blue-500 transition-colors" />
                                                </div>
                                            </th>
                                            <th className="px-6 py-5 cursor-pointer hover:text-white transition-colors group" onClick={() => handleSort('tipo')}>
                                                <div className="flex items-center gap-2">
                                                    TIPO
                                                    <ArrowUpDown className="w-3.5 h-3.5 text-slate-600 group-hover:text-blue-500 transition-colors" />
                                                </div>
                                            </th>
                                            <th className="px-6 py-5">ESTADO</th>
                                            <th className="px-6 py-5 text-right">ACCIONES</th>
                                        </tr>
                                    </thead>
                                    <tbody className="divide-y divide-slate-800">
                                        {displayClientes.map((cliente) => (
                                            <Fragment key={cliente.id}>
                                                <tr
                                                    className={`hover:bg-[#1E293B]/60 transition-colors duration-200 group cursor-pointer border-b border-slate-800/80 ${expandedClientId === cliente.id ? 'bg-[#1E293B] shadow-inner' : ''}`}
                                                    onClick={(e) => {
                                                        // Prevent toggle if clicking dropdown or buttons
                                                        if ((e.target as HTMLElement).closest('[role="menuitem"], button')) return;
                                                        toggleRow(cliente.id);
                                                    }}
                                                >
                                                    <td className="px-6 py-4">
                                                        <div className="flex items-center gap-4">
                                                            <div className="relative">
                                                                <div className={`w-11 h-11 rounded-xl bg-gradient-to-br from-slate-700 to-slate-800 flex items-center justify-center text-slate-300 font-bold group-hover:from-blue-600 group-hover:to-blue-700 group-hover:text-white transition-all shadow-sm border ${premiumClientId === cliente.id ? 'border-yellow-500/50 shadow-[#CA8A04]/30' : 'border-slate-600/50'}`}>
                                                                    {cliente.nombre_completo.charAt(0).toUpperCase()}
                                                                </div>
                                                                {premiumClientId === cliente.id && (
                                                                    <div className="absolute -top-3 -right-2 drop-shadow-lg">
                                                                        <Crown className="w-6 h-6 text-yellow-500 fill-yellow-500" />
                                                                    </div>
                                                                )}
                                                            </div>
                                                            <div>
                                                                <p className="font-bold text-white text-[15px] flex items-center gap-2 group-hover:text-blue-400 transition-colors">
                                                                    {cliente.nombre_completo}
                                                                    {premiumClientId === cliente.id && (
                                                                        <span className="text-[10px] bg-yellow-500/10 text-yellow-500 px-1.5 py-0.5 rounded-full border border-yellow-500/20 font-black tracking-widest">VIP</span>
                                                                    )}
                                                                </p>
                                                                <p className="text-xs text-slate-500 font-mono mt-0.5">{cliente.rut_dni || 'Sin RUT'}</p>
                                                            </div>
                                                        </div>
                                                    </td>
                                                    <td className="px-6 py-4">
                                                        <div className="space-y-1.5">
                                                            <div className="flex items-center gap-2.5 text-slate-300 font-medium">
                                                                <div className="p-1 rounded bg-emerald-500/10">
                                                                    <Phone className="w-3.5 h-3.5 text-emerald-500" />
                                                                </div>
                                                                {cliente.telefono || '-'}
                                                            </div>
                                                            <div className="flex items-center gap-2.5 text-slate-400 text-xs">
                                                                <div className="p-1 rounded bg-slate-800">
                                                                    <Mail className="w-3.5 h-3.5 text-slate-400" />
                                                                </div>
                                                                {cliente.email || 'Sin email'}
                                                            </div>
                                                        </div>
                                                    </td>
                                                    <td className="px-6 py-4">
                                                        <div className="space-y-1">
                                                            <div className="flex items-center gap-2 text-emerald-400 font-mono font-bold text-[15px]">
                                                                <span>{formatCurrency(cliente.total_gastado)}</span>
                                                            </div>
                                                            <div className="text-xs text-slate-500 font-medium flex items-center gap-1.5">
                                                                <div className="w-1 h-1 rounded-full bg-slate-600"></div>
                                                                {cliente.total_ordenes} {cliente.total_ordenes === 1 ? 'visita' : 'visitas'}
                                                            </div>
                                                        </div>
                                                    </td>
                                                    <td className="px-6 py-4">
                                                        <span className={`inline-flex items-center gap-1.5 px-3 py-1.5 rounded-lg text-xs font-bold uppercase tracking-wider border ${cliente.tipo === 'empresa'
                                                            ? 'bg-purple-500/10 text-purple-400 border-purple-500/20 shadow-sm shadow-purple-500/5'
                                                            : 'bg-blue-500/10 text-blue-400 border-blue-500/20 shadow-sm shadow-blue-500/5'
                                                            }`}>
                                                            {cliente.tipo === 'empresa' ? <Building2 className="w-3.5 h-3.5" /> : <User className="w-3.5 h-3.5" />}
                                                            {cliente.tipo === 'empresa' ? 'Empresa' : 'Particular'}
                                                        </span>
                                                    </td>
                                                    <td className="px-6 py-4">
                                                        <span className="bg-green-500/10 text-green-500 px-3 py-1 rounded-full text-xs font-medium border border-green-500/20 inline-flex items-center gap-1.5">
                                                            <span className="relative flex h-2 w-2">
                                                                <span className="animate-ping absolute inline-flex h-full w-full rounded-full bg-green-400 opacity-75"></span>
                                                                <span className="relative inline-flex rounded-full h-2 w-2 bg-green-500"></span>
                                                            </span>
                                                            Activo
                                                        </span>
                                                    </td>
                                                    <td className="px-6 py-4 text-right">
                                                        <div className="flex items-center justify-end gap-2">
                                                            {cliente.telefono && (
                                                                <a
                                                                    href={`https://wa.me/${cliente.telefono.replace(/\D/g, "")}`}
                                                                    target="_blank"
                                                                    rel="noopener noreferrer"
                                                                    onClick={(e) => e.stopPropagation()}
                                                                    className="h-9 w-9 flex items-center justify-center rounded-full text-slate-400 hover:text-emerald-400 hover:bg-emerald-500/10 transition-all opacity-0 group-hover:opacity-100 border border-transparent hover:border-emerald-500/30"
                                                                    title="Contactar por WhatsApp"
                                                                >
                                                                    <MessageCircle className="w-4 h-4" />
                                                                </a>
                                                            )}
                                                            <Button
                                                                variant="ghost"
                                                                size="sm"
                                                                className={`h-9 w-9 p-0 rounded-full transition-all ${expandedClientId === cliente.id ? 'bg-blue-500/10 text-blue-400 rotate-180' : 'text-slate-400 hover:text-white hover:bg-[#0F172A] border border-transparent hover:border-slate-700'}`}
                                                                onClick={(e) => {
                                                                    e.stopPropagation();
                                                                    toggleRow(cliente.id);
                                                                }}
                                                            >
                                                                <ChevronDown className="w-5 h-5 transition-transform" />
                                                            </Button>
                                                            <DropdownMenu>
                                                                <DropdownMenuTrigger asChild>
                                                                    <Button variant="ghost" className="h-9 w-9 p-0 text-slate-400 hover:text-white hover:bg-[#0F172A] rounded-full transition-colors border border-transparent hover:border-slate-700">
                                                                        <span className="sr-only">Abrir menú</span>
                                                                        <MoreHorizontal className="w-5 h-5" />
                                                                    </Button>
                                                                </DropdownMenuTrigger>
                                                                <DropdownMenuContent align="end" className="bg-[#0F172A] border-slate-700 min-w-[200px] shadow-2xl p-2 rounded-xl text-slate-300">
                                                                    <DropdownMenuLabel className="text-xs font-bold text-slate-500 uppercase tracking-wider px-2 py-1.5">Acciones</DropdownMenuLabel>
                                                                    <DropdownMenuSeparator className="bg-slate-800 my-1" />
                                                                    <DropdownMenuItem
                                                                        className="flex items-center gap-2 cursor-pointer hover:bg-[#1E293B] focus:bg-[#1E293B] rounded-lg px-3 py-2 transition-colors"
                                                                        onClick={(e) => { e.stopPropagation(); handleEditCliente(cliente, 'datos'); }}
                                                                    >
                                                                        <div className="p-1.5 rounded-lg bg-slate-800 text-slate-400">
                                                                            <User className="w-4 h-4" />
                                                                        </div>
                                                                        <span className="font-medium">Editar Datos</span>
                                                                    </DropdownMenuItem>
                                                                    <DropdownMenuItem
                                                                        className="flex items-center gap-2 cursor-pointer hover:bg-emerald-500/10 focus:bg-emerald-500/10 text-emerald-400 rounded-lg px-3 py-2 transition-colors mt-1"
                                                                        onClick={(e) => { e.stopPropagation(); handleCreateOrder(cliente); }}
                                                                    >
                                                                        <div className="p-1.5 rounded-lg bg-emerald-500/20 text-emerald-400">
                                                                            <Plus className="w-4 h-4" />
                                                                        </div>
                                                                        <span className="font-medium">Nueva Recepción</span>
                                                                    </DropdownMenuItem>
                                                                    <DropdownMenuItem
                                                                        className="flex items-center gap-2 cursor-pointer hover:bg-blue-500/10 focus:bg-blue-500/10 text-blue-400 rounded-lg px-3 py-2 transition-colors mt-1"
                                                                        onClick={(e) => { e.stopPropagation(); router.push(`/admin/contratos?rut=${cliente.rut_dni}`); }}
                                                                    >
                                                                        <div className="p-1.5 rounded-lg bg-blue-500/20 text-blue-400">
                                                                            <FileText className="w-4 h-4" />
                                                                        </div>
                                                                        <span className="font-medium text-blue-400">📝 Nuevo Contrato</span>
                                                                    </DropdownMenuItem>
                                                                </DropdownMenuContent>
                                                            </DropdownMenu>
                                                        </div>
                                                    </td>
                                                </tr>
                                                {expandedClientId === cliente.id && (
                                                    <tr className="bg-[#0F172A] border-b border-slate-700/80">
                                                        <td colSpan={6} className="p-0 border-b border-slate-800/50">
                                                            <div className="p-6 border-l-2 border-blue-500 ml-6 mr-6 mb-6 mt-2 rounded-r-xl bg-slate-900/40 shadow-inner">
                                                                <Tabs defaultValue="vehiculos" className="w-full">
                                                                    <TabsList className="bg-[#1E293B] border border-slate-700/60 p-1 mb-6 rounded-xl flex overflow-x-auto">
                                                                        <TabsTrigger value="datos" className="rounded-lg data-[state=active]:bg-slate-800 data-[state=active]:text-white text-slate-400 font-medium py-2 px-6 transition-all flex-1 whitespace-nowrap">Datos Personales</TabsTrigger>
                                                                        <TabsTrigger value="vehiculos" className="rounded-lg data-[state=active]:bg-blue-600 data-[state=active]:text-white text-slate-400 font-medium py-2 px-6 transition-all shadow-sm flex-1 whitespace-nowrap">Flota ({cliente.vehiculos?.length || 0})</TabsTrigger>
                                                                        <TabsTrigger value="contratos" className="rounded-lg data-[state=active]:bg-emerald-600 data-[state=active]:text-white text-slate-400 font-medium py-2 px-6 transition-all shadow-sm flex-1 whitespace-nowrap">Contratos</TabsTrigger>
                                                                        <TabsTrigger value="historial" className="rounded-lg data-[state=active]:bg-slate-800 data-[state=active]:text-white text-slate-400 font-medium py-2 px-6 transition-all flex-1 whitespace-nowrap">Historial ({cliente.total_ordenes})</TabsTrigger>
                                                                    </TabsList>

                                                                    <TabsContent value="datos" className="space-y-4 outline-none">
                                                                        <div className="grid grid-cols-2 md:grid-cols-4 gap-6">
                                                                            <div className="bg-[#1E293B] p-4 rounded-xl border border-slate-700/50 shadow-sm">
                                                                                <label className="text-[10px] text-blue-400/80 font-bold uppercase tracking-widest block mb-1.5 flex items-center gap-1.5"><Mail className="w-3.5 h-3.5" /> Email</label>
                                                                                <p className="text-white font-medium text-sm break-all">{cliente.email || <span className="text-slate-500 italic">No registrado</span>}</p>
                                                                            </div>
                                                                            <div className="bg-[#1E293B] p-4 rounded-xl border border-slate-700/50 shadow-sm">
                                                                                <label className="text-[10px] text-blue-400/80 font-bold uppercase tracking-widest block mb-1.5 flex items-center gap-1.5"><Phone className="w-3.5 h-3.5" /> Teléfono</label>
                                                                                <p className="text-white font-medium text-sm">{cliente.telefono || <span className="text-slate-500 italic">No registrado</span>}</p>
                                                                            </div>
                                                                            <div className="bg-[#1E293B] p-4 rounded-xl border border-slate-700/50 shadow-sm">
                                                                                <label className="text-[10px] text-blue-400/80 font-bold uppercase tracking-widest block mb-1.5 flex items-center gap-1.5"><Building2 className="w-3.5 h-3.5" /> Dirección</label>
                                                                                <p className="text-white font-medium text-sm">{cliente.direccion || <span className="text-slate-500 italic">No registrada</span>}</p>
                                                                            </div>
                                                                            <div className="bg-[#1E293B] p-4 rounded-xl border border-slate-700/50 shadow-sm">
                                                                                <label className="text-[10px] text-blue-400/80 font-bold uppercase tracking-widest block mb-1.5 flex items-center gap-1.5"><FileText className="w-3.5 h-3.5" /> Notas</label>
                                                                                <p className="text-slate-300 italic text-sm">{cliente.notas || '-'}</p>
                                                                            </div>
                                                                        </div>
                                                                    </TabsContent>

                                                                    <TabsContent value="vehiculos" className="outline-none">
                                                                        <div className="space-y-4">
                                                                            <div className="flex justify-between items-center mb-4 border-b border-slate-700/50 pb-3">
                                                                                <h4 className="text-sm font-bold text-white uppercase tracking-widest flex items-center gap-2">
                                                                                    <Car className="w-5 h-5 text-blue-400" />
                                                                                    Flota del Cliente
                                                                                </h4>
                                                                                <Button
                                                                                    size="sm"
                                                                                    className="h-9 bg-slate-800 hover:bg-slate-700 text-white border border-slate-600 transition-colors shadow-sm rounded-lg font-medium px-4"
                                                                                    onClick={() => handleEditCliente(cliente, 'vehiculos')}
                                                                                >
                                                                                    <Plus className="w-4 h-4 mr-2 text-blue-400" />
                                                                                    Agregar Nuevo
                                                                                </Button>
                                                                            </div>

                                                                            {!cliente.vehiculos || cliente.vehiculos.length === 0 ? (
                                                                                <div className="flex flex-col items-center justify-center py-10 text-center bg-[#1E293B] rounded-xl border border-slate-700/50 border-dashed">
                                                                                    <Car className="w-12 h-12 text-slate-600 mb-3 opacity-50" />
                                                                                    <p className="text-sm text-slate-400 font-medium">No hay vehículos registrados para este cliente.</p>
                                                                                    <p className="text-xs text-slate-500 mt-1">Registra uno nuevo para iniciar una recepción.</p>
                                                                                </div>
                                                                            ) : (
                                                                                <div className="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-4">
                                                                                    {cliente.vehiculos.map((v: any, index: number) => (
                                                                                        <div key={v.id || index} className="group relative bg-[#1E293B] border border-slate-700/60 p-4 rounded-2xl flex items-center justify-between hover:border-blue-500/50 transition-all shadow-md overflow-hidden">
                                                                                            <div className="absolute inset-0 bg-gradient-to-br from-blue-500/5 to-transparent opacity-0 group-hover:opacity-100 transition-opacity"></div>
                                                                                            <div className="relative flex items-center gap-4 z-10 w-full">
                                                                                                <div className="w-12 h-12 bg-slate-800 rounded-xl flex items-center justify-center border border-slate-700 shadow-inner group-hover:scale-105 transition-transform">
                                                                                                    <Car className="w-6 h-6 text-slate-400 group-hover:text-blue-400 transition-colors" />
                                                                                                </div>
                                                                                                <div className="flex-1">
                                                                                                    <p className="font-bold text-white font-mono tracking-wider text-[15px]">{v.patente}</p>
                                                                                                    <p className="text-xs text-slate-400 mt-0.5 font-medium flex flex-col gap-1.5">
                                                                                                        <span className="flex items-center gap-1.5">
                                                                                                            {v.marca || 'S/M'} <span className="w-1 h-1 bg-slate-600 rounded-full"></span> {v.modelo ? v.modelo : 'S/M'}
                                                                                                        </span>
                                                                                                        {v.fue_vendido && (
                                                                                                            <span className="flex items-center gap-1 text-[9px] font-black uppercase text-amber-500 bg-amber-500/10 px-1.5 py-0.5 rounded-full border border-amber-500/20 w-fit">
                                                                                                                <Crown className="w-2.5 h-2.5" />
                                                                                                                Comprado en RentMontt
                                                                                                            </span>
                                                                                                        )}
                                                                                                    </p>
                                                                                                </div>
                                                                                                <Button
                                                                                                    size="sm"
                                                                                                    onClick={() => router.push(`/recepcion?patente=${v.patente}`)}
                                                                                                    className="bg-blue-600 hover:bg-blue-500 text-white shadow-lg shadow-blue-600/20 border-0 rounded-lg h-9 px-4 font-bold opacity-0 group-hover:opacity-100 transition-all -translate-x-2 group-hover:translate-x-0"
                                                                                                >
                                                                                                    Recepcionar
                                                                                                </Button>
                                                                                            </div>
                                                                                        </div>
                                                                                    ))}
                                                                                </div>
                                                                            )}
                                                                        </div>
                                                                    </TabsContent>

                                                                    <TabsContent value="contratos" className="outline-none">
                                                                        <div className="bg-slate-900/60 rounded-2xl border border-slate-800/50 p-6 shadow-xl backdrop-blur-sm">
                                                                            <div className="flex items-center justify-between mb-6">
                                                                                <div>
                                                                                    <h4 className="text-white font-black text-lg tracking-tight flex items-center gap-2">
                                                                                        <FileText className="w-5 h-5 text-emerald-400" />
                                                                                        Contratos y Negocios (RentMontt)
                                                                                    </h4>
                                                                                    <p className="text-xs text-slate-500 font-medium">Contratos de venta, arriendo y leasing asociados</p>
                                                                                </div>
                                                                                <Link href={`/admin/contratos?cliente=${cliente.id}`}>
                                                                                    <Button variant="outline" size="sm" className="bg-slate-800/50 border-slate-700 text-slate-300 hover:text-white hover:bg-slate-700 text-[11px] font-bold h-8 rounded-lg">
                                                                                        Gestionar Todos
                                                                                        <ArrowRight className="w-3.5 h-3.5 ml-2" />
                                                                                    </Button>
                                                                                </Link>
                                                                            </div>
                                                                            <ContratosCliente rut={cliente.rut_dni} tallerId={tallerId || ''} />
                                                                        </div>
                                                                    </TabsContent>

                                                                    <TabsContent value="historial" className="space-y-4 outline-none">
                                                                        <div className="bg-slate-900/60 rounded-2xl border border-slate-800/50 p-6 shadow-xl backdrop-blur-sm overflow-hidden">
                                                                            <div className="flex items-center justify-between mb-6">
                                                                                <div>
                                                                                    <h4 className="text-white font-black text-lg tracking-tight flex items-center gap-2">
                                                                                        <Wrench className="w-5 h-5 text-blue-400" />
                                                                                        Historial de Servicios
                                                                                    </h4>
                                                                                    <p className="text-xs text-slate-500 font-medium">Cronología de órdenes de trabajo y reparaciones</p>
                                                                                </div>
                                                                                <div className="flex gap-2">
                                                                                    <Button 
                                                                                        variant="outline" 
                                                                                        size="sm" 
                                                                                        className="bg-slate-800/50 border-slate-700 text-slate-300 hover:text-white hover:bg-slate-700 text-[11px] font-bold h-8 rounded-lg"
                                                                                        onClick={() => handleCreateOrder(cliente)}
                                                                                    >
                                                                                        Nueva Orden
                                                                                        <Plus className="w-3.5 h-3.5 ml-2" />
                                                                                    </Button>
                                                                                </div>
                                                                            </div>
                                                                            <Button className="relative z-10 bg-slate-800 hover:bg-slate-700 text-white shadow-lg border border-slate-600 h-11 px-6 rounded-xl font-bold transition-transform hover:scale-105" onClick={() => handleEditCliente(cliente, 'historial')}>
                                                                                Ver Historial Completo
                                                                                <ArrowRight className="w-4 h-4 ml-2 text-slate-400" />
                                                                            </Button>
                                                                        </div>
                                                                    </TabsContent>
                                                                </Tabs>
                                                            </div>
                                                        </td>
                                                    </tr>
                                                )}
                                            </Fragment>
                                        ))}
                                    </tbody>
                                </table>

                                {/* Intersection Observer Anchor */}
                                <div ref={observerRef} className="h-20 w-full flex items-center justify-center text-slate-400 gap-3 py-10">
                                    {isFetchingNextPage ? (
                                        <>
                                            <Loader2 className="w-6 h-6 animate-spin text-blue-500" />
                                            <span>Cargando más clientes...</span>
                                        </>
                                    ) : hasNextPage ? (
                                        <span className="text-slate-500/50">Desliza para cargar más</span>
                                    ) : (
                                        <span className="text-slate-500/30 font-medium tracking-wider">FIN DEL DIRECTORIO</span>
                                    )}
                                </div>
                            </div>
                        </div>
                    </>
                )}
            </div>

            <ClienteModal
                isOpen={isModalOpen}
                onClose={() => {
                    setIsModalOpen(false);
                    setSelectedCliente(undefined);
                }}
                onSave={refetch}
                cliente={selectedCliente}
                defaultTab={modalTab}
            />

            <Dialog open={!!orderingCliente} onOpenChange={(open) => !open && setOrderingCliente(null)}>
                <DialogContent className="sm:max-w-md bg-[#0F172A] border-slate-700 text-white shadow-2xl rounded-2xl p-0 overflow-hidden">
                    <div className="bg-gradient-to-r from-blue-900/40 to-slate-900 p-6 border-b border-slate-800 text-center relative">
                        <DialogHeader className="m-0">
                            <div className="w-16 h-16 bg-blue-500/10 rounded-2xl mx-auto flex items-center justify-center mb-4 border border-blue-500/20 shadow-inner">
                                <Car className="w-8 h-8 text-blue-400" />
                            </div>
                            <DialogTitle className="text-2xl font-bold text-white mb-2">Vehículo para Recepción</DialogTitle>
                        </DialogHeader>
                        <p className="text-sm text-slate-300 font-medium">
                            <span className="text-blue-400">{orderingCliente?.nombre_completo}</span> tiene múltiples registrados.<br />¿Con cuál iniciamos hoy?
                        </p>
                        <div className="absolute top-0 inset-x-0 h-1 bg-gradient-to-r from-transparent via-blue-500/50 to-transparent"></div>
                    </div>
                    <div className="p-6 bg-[#0F172A]">
                        <div className="grid gap-3">
                            {orderingCliente?.vehiculos?.map((v: any, index: number) => (
                                <button
                                    key={v.id || index}
                                    className="flex items-center justify-between p-4 bg-[#1E293B] hover:bg-blue-900/20 border border-slate-700 hover:border-blue-500/50 rounded-xl transition-all group text-left focus:outline-none focus:ring-2 focus:ring-blue-500"
                                    onClick={() => confirmOrderVehicle(v.patente)}
                                >
                                    <div className="flex items-center gap-4">
                                        <div className="w-10 h-10 rounded-lg bg-slate-800 flex items-center justify-center border border-slate-600/50 group-hover:border-blue-500/30 transition-colors">
                                            <Car className="w-5 h-5 text-slate-500 group-hover:text-blue-400 transition-colors" />
                                        </div>
                                        <div>
                                            <p className="font-mono font-bold text-lg text-white tracking-wider">{v.patente}</p>
                                            <p className="text-xs text-slate-400 font-medium mt-0.5 group-hover:text-blue-300/70 transition-colors flex items-center gap-1.5">
                                                {v.marca || 'S/M'} <span className="w-1 h-1 bg-slate-600 rounded-full"></span> {v.modelo || 'S/M'}
                                            </p>
                                        </div>
                                    </div>
                                    <ChevronUp className="w-5 h-5 text-slate-600 group-hover:text-blue-500 rotate-90 transition-all" />
                                </button>
                            ))}

                            <div className="relative my-2">
                                <div className="absolute inset-0 flex items-center"><div className="w-full border-t border-slate-800"></div></div>
                                <div className="relative flex justify-center text-xs"><span className="bg-[#0F172A] px-2 text-slate-500 uppercase font-bold tracking-widest">O</span></div>
                            </div>

                            <Button
                                variant="outline"
                                className="w-full justify-center h-14 border-dashed border-slate-600 bg-transparent hover:bg-slate-800 hover:text-white rounded-xl text-slate-400 font-bold transition-colors"
                                onClick={() => {
                                    router.push(`/recepcion?rut=${orderingCliente?.rut_dni}`);
                                    setOrderingCliente(null);
                                }}
                            >
                                <Plus className="w-5 h-5 mr-2" />
                                Registrar Vehículo Nuevo
                            </Button>
                        </div>
                    </div>
                </DialogContent>
            </Dialog>
        </div >
    );
}
