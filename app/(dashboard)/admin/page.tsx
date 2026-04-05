'use client';

export const dynamic = 'force-dynamic';

import { useState, useEffect, useMemo, useCallback } from 'react';
import { useRouter } from 'next/navigation';
import { useAuth } from '@/contexts/auth-context';
import { useDashboardOrders, useDashboardContracts } from '@/hooks/use-dashboard';
import { useGananciaHistorica } from '@/hooks/use-ganancia';
import {
    obtenerPerfiles,
    obtenerVehiculos,
    type OrdenDB,
    type PerfilDB,
    type VehiculoDB
} from '@/lib/storage-adapter';
import {
    Collapsible,
    CollapsibleContent,
    CollapsibleTrigger,
} from '@/components/ui/collapsible';
import { Card, CardContent } from '@/components/ui/card';
import { Button } from '@/components/ui/button';
import { Badge } from '@/components/ui/badge';
import {
    LayoutDashboard,
    Car,
    Clock,
    Wrench,
    CheckCircle,
    RefreshCw,
    ChevronRight,
    TrendingUp,
    Loader2,
    Users,
    DollarSign,
    ChevronDown,
    Calendar
} from 'lucide-react';
import Link from 'next/link';
import nextDynamic from 'next/dynamic';
import { DebtSummaryCard } from '@/components/analytics/debt-summary-card';

// Skeleton UI para los Gráficos Lazy Loaded
const ChartSkeleton = () => (
    <div className="w-full h-[400px] bg-white dark:bg-gray-800 border-slate-200 dark:border-gray-700 rounded-xl p-6 shadow-sm border animate-pulse flex flex-col">
        <div className="w-48 h-6 bg-slate-200 dark:bg-slate-700 rounded mb-4" />
        <div className="flex-1 bg-slate-100 dark:bg-slate-800 rounded" />
    </div>
);

// Dynamic Imports para Deferred JS Parsing de Recharts
const RevenueChart = nextDynamic(() => import('@/components/analytics/revenue-chart').then(mod => mod.RevenueChart), { ssr: false, loading: () => <ChartSkeleton /> });
const StatusChart = nextDynamic(() => import('@/components/analytics/status-chart').then(mod => mod.StatusChart), { ssr: false, loading: () => <ChartSkeleton /> });
const TopBrandsChart = nextDynamic(() => import('@/components/analytics/top-brands-chart').then(mod => mod.TopBrandsChart), { ssr: false, loading: () => <ChartSkeleton /> });
const TopServicesChart = nextDynamic(() => import('@/components/analytics/top-services-chart').then(mod => mod.TopServicesChart), { ssr: false, loading: () => <ChartSkeleton /> });
const SeasonalityChart = nextDynamic(() => import('@/components/analytics/seasonality-chart').then(mod => mod.SeasonalityChart), { ssr: false, loading: () => <ChartSkeleton /> });
import { FEATURE_FLAGS } from '@/config/modules';
import { NewBadge } from '@/components/ui/new-badge';
import { UpcomingAppointments } from '@/components/agenda/upcoming-appointments';
import { useDateFilter } from '@/hooks/use-date-filter';
import { DateRangeFilter } from '@/components/filters/date-range-filter';

// Skeleton loader para stats
function StatsSkeleton() {
    return (
        <div className="grid grid-cols-2 gap-3">
            {[1, 2, 3, 4].map((i) => (
                <div key={i} className="bg-white rounded-xl p-4 animate-pulse border border-gray-200">
                    <div className="w-8 h-8 bg-gray-200 rounded mb-2" />
                    <div className="w-12 h-8 bg-gray-200 rounded mb-1" />
                    <div className="w-20 h-4 bg-gray-200 rounded" />
                </div>
            ))}
        </div>
    );
}

const cleanMoney = (val: string | number | undefined | null): number => {
    if (val === undefined || val === null) return 0;
    if (typeof val === 'number') return val;
    const cleaned = String(val).replace(/\D/g, '');
    return cleaned ? Number(cleaned) : 0;
};

export default function AdminPage() {
    const { user, hasPermission } = useAuth();
    const router = useRouter();
    const { data: allOrders = [], isLoading: isLoadingOrders } = useDashboardOrders();
    const { data: allContracts = [], isLoading: isLoadingContracts } = useDashboardContracts();
    const { data: gananciaHistorica = 0, isLoading: isLoadingGanancia } = useGananciaHistorica();
    const { dateFilter, setDateFilter, filteredOrders } = useDateFilter(allOrders);
    const [perfiles, setPerfiles] = useState<PerfilDB[]>([]);
    // const [vehiculos, setVehiculos] = useState<VehiculoDB[]>([]); // REMOVED
    const [isLoadingOther, setIsLoadingOther] = useState(true);
    const [isRefreshing, setIsRefreshing] = useState(false);

    // FASE 27: Solo el superadmin (Dueño del Taller) puede ver las métricas financieras del Dashboard.
    // Los demás roles (taller_admin, admin, mecanico) son redirigidos a Órdenes.
    useEffect(() => {
        if (user && user.role !== 'superadmin') {
            router.replace('/admin/ordenes');
        }
    }, [user, router]);

    const isLoading = isLoadingOrders || isLoadingOther || isLoadingGanancia;
    const canViewPrices = hasPermission('financials.view_totals');
    const todaysOrders = useMemo(() => {
        const hoy = new Date();
        const hoyStr = hoy.toISOString().split('T')[0]; // "YYYY-MM-DD" en UTC
        // Pero queremos el hoy LOCAL
        const localHoy = new Date(hoy.getTime() - (hoy.getTimezoneOffset() * 60000)).toISOString().split('T')[0];

        return allOrders.filter(o => {
            const fechaIngreso = o.fecha_ingreso || (o as any).creado_en || (o as any).created_at;
            if (!fechaIngreso) return false;

            // Extraer solo la parte de la fecha YYYY-MM-DD
            const fechaOrdenStr = new Date(fechaIngreso).toISOString().split('T')[0];
            return fechaOrdenStr === localHoy;
        });
    }, [allOrders]);

    const loadData = useCallback(async () => {
        try {
            const perfs = await obtenerPerfiles();
            setPerfiles(perfs || []);
        } catch (error) {
            console.error('❌ Error cargando datos:', error);
        } finally {
            setIsLoadingOther(false);
            setIsRefreshing(false);
        }
    }, []);

    useEffect(() => {
        loadData();
    }, [loadData]);

    const handleRefresh = useCallback(async () => {
        setIsRefreshing(true);
        await loadData();
    }, [loadData]);

    const stats = useMemo(() => {
        const completedTodaysOrders = todaysOrders.filter(o => o.estado === 'completada' || o.estado === 'entregada');
        const completedFilteredOrders = filteredOrders.filter(o => o.estado === 'completada' || o.estado === 'entregada');

        // Filtrar contratos por fecha para el periodo seleccionado
        const filteredContracts = allContracts.filter(c => {
            if (!dateFilter || !dateFilter.startDate || !dateFilter.endDate) return true;
            const cDate = new Date(c.actualizado_en || c.creado_en);
            cDate.setHours(0,0,0,0);
            const start = new Date(dateFilter.startDate); start.setHours(0,0,0,0);
            const end = new Date(dateFilter.endDate); end.setHours(23,59,59,999);
            return cDate >= start && cDate <= end;
        });

        // Contratos de hoy
        const today = new Date(); today.setHours(0,0,0,0);
        const todaysContracts = allContracts.filter(c => {
            const cDate = new Date(c.actualizado_en || c.creado_en);
            cDate.setHours(0,0,0,0);
            return cDate.getTime() === today.getTime();
        });

        const contractFilteredRevenue = filteredContracts.reduce((acc, c) => acc + (Number(c.precio_total) || 0), 0);
        const contractTodayRevenue = todaysContracts.reduce((acc, c) => acc + (Number(c.precio_total) || 0), 0);

        return {
            todayRevenue: completedTodaysOrders.reduce((acc, o) => acc + cleanMoney(o.precio_total), 0) + contractTodayRevenue,
            pending: filteredOrders.filter(o => o.estado === 'pendiente' || o.estado === 'en_curso').length,
            filteredRevenue: completedFilteredOrders.reduce((acc, o) => acc + cleanMoney(o.precio_total), 0) + contractFilteredRevenue,
            completed: completedFilteredOrders.length + filteredContracts.length,
        };
    }, [todaysOrders, filteredOrders, allContracts, dateFilter]);

    // Calcular rendimiento de mecánicos
    const mechanicPerformance = useMemo(() => {
        const mechanics = perfiles.filter(p => p.rol === 'mecanico' || p.rol === 'taller_admin');

        return mechanics.map(mechanic => {
            const assignedOrders = filteredOrders.filter(o => o.asignado_a === mechanic.id);
            const completedOrders = assignedOrders.filter(o => o.estado === 'completada');
            const totalRevenue = assignedOrders.reduce((acc, o) => acc + cleanMoney(o.precio_total), 0);

            return {
                id: mechanic.id,
                name: mechanic.nombre_completo,
                ordersCount: assignedOrders.length,
                totalRevenue,
                completedCount: completedOrders.length,
                completedOrders: completedOrders,
            };
        }).sort((a, b) => b.ordersCount - a.ordersCount);
    }, [filteredOrders, perfiles]);

    const getPerfilNombre = (order: OrdenDB) => {
        // Ahora usamos el perfil anidado si existe
        if (order.asignado) return order.asignado.nombre_completo;
        if (order.creado) return order.creado.nombre_completo;
        if (order.creado_por_perfil) return order.creado_por_perfil.nombre_completo;
        return 'Sin asignar';
    };

    const getStatusBadge = (status: string) => {
        const config: Record<string, { class: string; label: string }> = {
            pendiente: { class: 'bg-amber-500/20 text-amber-400 border-amber-500/30', label: 'Pendiente' },
            en_progreso: { class: 'bg-[#0066FF]/20 text-[#0066FF] border-[#0066FF]/30', label: 'En Progreso' },
            completada: { class: 'bg-green-500/20 text-green-400 border-green-500/30', label: 'Completada' },
            cancelada: { class: 'bg-red-500/20 text-red-400 border-red-500/30', label: 'Cancelada' },
        };
        const c = config[status] || config.pendiente;
        return <Badge className={`${c.class} border`}>{c.label}</Badge>;
    };

    return (
        <div className="space-y-6">
            {/* Header */}
            <div className="flex items-center justify-between">
                <div className="flex items-center gap-3">
                    <div className="w-10 h-10 bg-gradient-to-br from-cyan-500 to-blue-600 rounded-xl flex items-center justify-center shadow-lg shadow-blue-500/30">
                        <LayoutDashboard className="w-5 h-5 text-gray-900" />
                    </div>
                    <div>
                        <h1 className="text-xl md:text-2xl font-bold text-gray-900">Dashboard</h1>
                        <p className="text-sm text-gray-500">Resumen del taller</p>
                    </div>
                </div>
                <Button
                    onClick={handleRefresh}
                    size="icon"
                    variant="ghost"
                    disabled={isLoading || isRefreshing}
                    className="w-10 h-10 rounded-xl text-gray-600 hover:text-blue-600 hover:bg-blue-50"
                >
                    <RefreshCw className={`w-5 h-5 ${isRefreshing ? 'animate-spin' : ''}`} />
                </Button>
            </div>

            {/* Filtros */}
            <DateRangeFilter
                onFilterChange={setDateFilter}
                totalOrders={filteredOrders.length}
                totalRevenue={stats.filteredRevenue}
            />

            {/* Stats Grid */}
            {isLoading ? (
                <StatsSkeleton />
            ) : (
                <div className="grid grid-cols-2 gap-3 sm:gap-4">
                    {/* Ganancia Histórica Total (All-Time Revenue) - TITAN THEME */}
                    {canViewPrices && (
                        <Card className="col-span-2 bg-[#0F1115] border border-[#FF4D00]/30 shadow-2xl shadow-[#FF4D00]/10 relative overflow-hidden group">
                            <div className="absolute inset-0 bg-gradient-to-r from-[#FF4D00]/5 to-transparent opacity-0 group-hover:opacity-100 transition-opacity duration-500" />
                            <CardContent className="p-4 sm:p-6 relative z-10">
                                <div className="flex items-center justify-between mb-3">
                                    <div className="flex items-center gap-3">
                                        <div className="w-10 h-10 rounded-xl bg-[#FF4D00]/10 flex items-center justify-center border border-[#FF4D00]/20">
                                            <DollarSign className="w-5 h-5 text-[#FF4D00]" />
                                        </div>
                                        <div>
                                            <p className="text-sm font-medium text-gray-400">{user?.workshopName || 'Taller General'}</p>
                                            <p className="text-xs font-bold text-[#FF4D00] uppercase tracking-wider">Ganancia Histórica Total</p>
                                        </div>
                                    </div>
                                    <TrendingUp className="w-5 h-5 text-[#FF4D00]/80" />
                                </div>
                                <div className="flex items-baseline gap-2">
                                    <span className="text-2xl text-gray-400 font-medium">$</span>
                                    <p className="text-4xl sm:text-5xl font-black text-white tracking-tight drop-shadow-sm">
                                        {gananciaHistorica.toLocaleString('es-CL')}
                                    </p>
                                </div>
                            </CardContent>
                        </Card>
                    )}

                    {canViewPrices && (
                        <Card className="bg-[#0066FF] border-0 shadow-xl shadow-[#0066FF]/20">
                            <CardContent className="p-3 sm:p-4">
                                <div className="flex items-center justify-between mb-2">
                                    <Car className="w-5 h-5 sm:w-6 sm:h-6 text-blue-200" />
                                    <TrendingUp className="w-3 h-3 sm:w-4 sm:h-4 text-blue-200" />
                                </div>
                                <p className="text-xl sm:text-3xl font-bold text-gray-900">${stats.todayRevenue.toLocaleString('es-CL')}</p>
                                <p className="text-xs sm:text-sm text-blue-200">Ingresos Hoy</p>
                            </CardContent>
                        </Card>
                    )}

                    <Card className="bg-amber-500 border-0 shadow-xl shadow-amber-500/20">
                        <CardContent className="p-3 sm:p-4">
                            <Clock className="w-5 h-5 sm:w-6 sm:h-6 text-amber-200 mb-2" />
                            <p className="text-xl sm:text-3xl font-bold text-gray-900">{stats.pending}</p>
                            <p className="text-xs sm:text-sm text-amber-200">Pendientes</p>
                        </CardContent>
                    </Card>

                    {canViewPrices && (
                        <Card className="bg-white border border-gray-200">
                            <CardContent className="p-3 sm:p-4">
                                <Calendar className="w-5 h-5 sm:w-6 sm:h-6 text-gray-600 mb-2" />
                                <p className="text-xl sm:text-3xl font-bold text-gray-900">${stats.filteredRevenue.toLocaleString('es-CL')}</p>
                                <p className="text-xs sm:text-sm text-gray-600">{dateFilter ? 'Monto del Período' : 'Monto Mensual'}</p>
                            </CardContent>
                        </Card>
                    )}

                    <Card className="bg-green-600 border-0 shadow-xl shadow-green-500/20">
                        <CardContent className="p-3 sm:p-4">
                            <CheckCircle className="w-5 h-5 sm:w-6 sm:h-6 text-green-200 mb-2" />
                            <p className="text-xl sm:text-3xl font-bold text-gray-900">{stats.completed}</p>
                            <p className="text-xs sm:text-sm text-green-200">Completadas</p>
                        </CardContent>
                    </Card>
                </div>
            )}

            {/* Upcoming Appointments Alert */}
            <UpcomingAppointments />

            {/* Analytics Section */}
            {
                FEATURE_FLAGS.showAnalytics && (
                    <div className="space-y-6">
                        <div className="flex items-center gap-2">
                            <h2 className="text-lg font-semibold text-gray-900">Analíticas</h2>
                        </div>

                        {/* Charts Grid */}
                        <div className="grid grid-cols-1 lg:grid-cols-2 gap-6">
                            <RevenueChart orders={allOrders} />
                            <StatusChart orders={allOrders} />
                        </div>

                        {/* Market Analysis Grid */}
                        <div className="grid grid-cols-1 lg:grid-cols-2 gap-6">
                            <TopBrandsChart orders={allOrders} />
                            <TopServicesChart orders={allOrders} />
                        </div>

                        {/* Seasonality Row */}
                        <div className="w-full">
                            <SeasonalityChart orders={allOrders} />
                        </div>

                        {/* Debt Summary */}
                        <DebtSummaryCard orders={allOrders} />
                    </div>
                )
            }

            {/* Today's Orders */}
            <div>
                <div className="flex items-center justify-between mb-4">
                    <h2 className="text-lg font-semibold text-gray-900">Órdenes de Hoy</h2>
                    <Link href="/admin/ordenes" prefetch>
                        <Button variant="ghost" size="sm" className="text-[#0066FF] hover:text-blue-300 hover:bg-[#0066FF]/10">
                            Ver todas
                            <ChevronRight className="w-4 h-4 ml-1" />
                        </Button>
                    </Link>
                </div>

                {isLoading ? (
                    <div className="space-y-3">
                        {[1, 2, 3].map((i) => (
                            <div key={i} className="bg-white rounded-xl p-4 animate-pulse">
                                <div className="flex items-center gap-4">
                                    <div className="w-16 h-12 bg-[#333] rounded-lg" />
                                    <div className="flex-1">
                                        <div className="w-32 h-4 bg-[#333] rounded mb-2" />
                                        <div className="w-48 h-3 bg-[#333] rounded" />
                                    </div>
                                </div>
                            </div>
                        ))}
                    </div>
                ) : todaysOrders.length === 0 ? (
                    <Card className="bg-white border-gray-200">
                        <CardContent className="py-12 text-center">
                            <Car className="w-12 h-12 mx-auto mb-3 text-gray-600" />
                            <p className="text-gray-600">No hay órdenes registradas hoy</p>
                            <Link href="/recepcion" prefetch>
                                <Button className="mt-4 bg-[#0066FF] hover:bg-[#0052CC]">
                                    Registrar vehículo
                                </Button>
                            </Link>
                        </CardContent>
                    </Card>
                ) : (
                    <div className="space-y-3">
                        {todaysOrders.slice(0, 5).map((order) => {
                            const vehiculo = order.vehiculos;
                            return (
                                <Link key={order.id} href={`/admin/ordenes/clean?id=${order.id}`} prefetch>
                                    <Card className="bg-white border-gray-200 hover:bg-gray-50 transition-colors duration-150 active:scale-[0.99]">
                                        <CardContent className="p-4">
                                            <div className="flex items-center gap-4">
                                                <div className="w-16 h-12 bg-[#333333] rounded-lg flex items-center justify-center">
                                                    <span className="text-gray-900 font-mono font-bold text-sm">
                                                        {order.patente_vehiculo}
                                                    </span>
                                                </div>

                                                <div className="flex-1 min-w-0">
                                                    <p className="text-gray-900 font-medium truncate">
                                                        {vehiculo ? `${vehiculo.marca} ${vehiculo.modelo}` : order.patente_vehiculo}
                                                    </p>
                                                    <p className="text-xs text-blue-400 truncate">
                                                        {order.cliente?.nombre_completo || order.cliente_nombre || 'Cliente S/R'}
                                                    </p>
                                                    {order.asignado_a && (
                                                        <p className="text-xs text-gray-500 mt-1">
                                                            Mecánico: {getPerfilNombre(order)}
                                                        </p>
                                                    )}
                                                </div>

                                                <div className="hidden sm:block">
                                                    {getStatusBadge(order.estado)}
                                                </div>

                                                <ChevronRight className="w-5 h-5 text-gray-500" />
                                            </div>

                                            <div className="mt-3 flex items-center justify-between sm:hidden">
                                                {getStatusBadge(order.estado)}
                                                <span className="text-xs text-gray-500">
                                                    {getPerfilNombre(order)}
                                                </span>
                                            </div>
                                        </CardContent>
                                    </Card>
                                </Link>
                            );
                        })}
                    </div>
                )}
            </div>

            {/* Mechanic Performance */}
            <div>
                <div className="flex items-center gap-3 mb-4">
                    <Users className="w-5 h-5 text-[#0066FF]" />
                    <h2 className="text-lg font-semibold text-gray-900">Rendimiento de Mecánicos</h2>
                </div>

                {isLoading ? (
                    <div className="space-y-3">
                        {[1, 2].map((i) => (
                            <div key={i} className="bg-white rounded-xl p-4 animate-pulse">
                                <div className="flex items-center justify-between">
                                    <div className="w-32 h-4 bg-[#333] rounded" />
                                    <div className="w-16 h-4 bg-[#333] rounded" />
                                </div>
                            </div>
                        ))}
                    </div>
                ) : mechanicPerformance.length === 0 ? (
                    <Card className="bg-white border-gray-200">
                        <CardContent className="py-8 text-center">
                            <Users className="w-10 h-10 mx-auto mb-2 text-gray-600" />
                            <p className="text-gray-600 text-sm">No hay datos de mecánicos</p>
                        </CardContent>
                    </Card>
                ) : (
                    <div className="space-y-3">
                        {mechanicPerformance.map((mechanic, index) => (
                            <Collapsible key={mechanic.id}>
                                <Card className="bg-white border-gray-200">
                                    <CardContent className="p-4">
                                        <div className="flex items-center justify-between mb-3">
                                            <div className="flex items-center gap-3">
                                                <div className={`w-8 h-8 rounded-full flex items-center justify-center text-sm font-bold ${index === 0 ? 'bg-yellow-500/20 text-yellow-400' :
                                                    index === 1 ? 'bg-gray-400/20 text-gray-300' :
                                                        index === 2 ? 'bg-orange-500/20 text-orange-400' :
                                                            'bg-[#333333] text-gray-600'
                                                    }`}>
                                                    #{index + 1}
                                                </div>
                                                <div>
                                                    <p className="text-gray-900 font-medium">{mechanic.name}</p>
                                                    <p className="text-xs text-gray-600">{mechanic.completedCount} completadas</p>
                                                </div>
                                            </div>
                                            <div className="text-right">
                                                <p className="text-gray-900 font-bold">{mechanic.ordersCount}</p>
                                                <p className="text-xs text-gray-600">órdenes</p>
                                            </div>
                                        </div>
                                        <div className="flex items-center justify-between">
                                            {canViewPrices && (
                                                <div className="flex items-center gap-2 text-sm">
                                                    <DollarSign className="w-4 h-4 text-green-400" />
                                                    <span className="text-green-400 font-semibold">
                                                        ${mechanic.totalRevenue.toLocaleString('es-CL')}
                                                    </span>
                                                    <span className="text-gray-500">generados</span>
                                                </div>
                                            )}
                                            {mechanic.completedOrders.length > 0 && (
                                                <CollapsibleTrigger asChild>
                                                    <Button variant="ghost" size="sm" className="text-gray-600 hover:text-gray-900">
                                                        Ver órdenes
                                                        <ChevronDown className="w-4 h-4 ml-1" />
                                                    </Button>
                                                </CollapsibleTrigger>
                                            )}
                                        </div>
                                        <CollapsibleContent className="mt-3">
                                            <div className="space-y-2 pt-3 border-t border-gray-200">
                                                {mechanic.completedOrders.map((order) => {
                                                    const vehiculo = order.vehiculos;
                                                    return (
                                                        <Link key={order.id} href={`/admin/ordenes/clean?id=${order.id}`}>
                                                            <div className="bg-gray-50 rounded-lg p-3 hover:bg-[#2a2a2a] transition-colors">
                                                                <div className="flex items-center justify-between gap-3">
                                                                    <div className="flex-1 min-w-0">
                                                                        <p className="text-gray-900 text-sm font-medium truncate">
                                                                            {vehiculo ? `${vehiculo.marca} ${vehiculo.modelo}` : order.patente_vehiculo}
                                                                        </p>
                                                                        <p className="text-xs text-gray-600 truncate">
                                                                            {order.descripcion_ingreso}
                                                                        </p>
                                                                    </div>
                                                                    <div className="text-right flex-shrink-0">
                                                                        {canViewPrices && (
                                                                            <p className="text-green-400 text-sm font-semibold whitespace-nowrap">
                                                                                ${(order.precio_total || 0).toLocaleString('es-CL')}
                                                                            </p>
                                                                        )}
                                                                        <p className="text-xs text-gray-500">
                                                                            {order.patente_vehiculo}
                                                                        </p>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </Link>
                                                    );
                                                })}
                                            </div>
                                        </CollapsibleContent>
                                    </CardContent>
                                </Card>
                            </Collapsible>
                        ))}
                    </div>
                )}
            </div>

            {/* Quick Actions */}
            <div className="grid grid-cols-2 gap-3">
                <Link href="/admin/ordenes" prefetch>
                    <Card className="bg-white border-gray-200 hover:bg-gray-50 transition-colors duration-150 active:scale-[0.98]">
                        <CardContent className="p-4 flex items-center gap-3">
                            <div className="w-10 h-10 bg-[#0066FF]/20 rounded-xl flex items-center justify-center">
                                <Car className="w-5 h-5 text-[#0066FF]" />
                            </div>
                            <div>
                                <p className="text-gray-900 font-medium">Órdenes</p>
                                <p className="text-xs text-gray-600">Gestionar</p>
                            </div>
                        </CardContent>
                    </Card>
                </Link>

                <Link href="/admin/usuarios" prefetch>
                    <Card className="bg-white border-gray-200 hover:bg-gray-50 transition-colors duration-150 active:scale-[0.98]">
                        <CardContent className="p-4 flex items-center gap-3">
                            <div className="w-10 h-10 bg-[#0066FF]/20 rounded-xl flex items-center justify-center">
                                <Wrench className="w-5 h-5 text-[#0066FF]" />
                            </div>
                            <div>
                                <p className="text-gray-900 font-medium">Usuarios</p>
                                <p className="text-xs text-gray-600">Gestionar</p>
                            </div>
                        </CardContent>
                    </Card>
                </Link>
            </div>
        </div>
    );
}
