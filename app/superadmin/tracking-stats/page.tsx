'use client';

import { useEffect, useState } from 'react';
import { supabase } from '@/lib/supabase';
import {
    BarChart3,
    Users,
    ClipboardList,
    MessageCircle,
    TrendingUp,
    Building2,
    RefreshCw,
    CheckCircle,
    AlertTriangle,
} from 'lucide-react';

// ─── Types ────────────────────────────────────────────────────────────────────

interface GlobalStats {
    total_ordenes: number;
    ordenes_7d: number;
    ordenes_30d: number;
    total_talleres: number;
    total_clientes: number;
    total_usuarios_conductores: number;
    ordenes_con_tracking: number;
    tasa_tracking_global: number;
    talleres_usando_tracking: number;
    ordenes_con_token_publico: number;
    vistas_tracking: number;
    conversiones_tracking: number;
}

interface TallerStat {
    id: string;
    nombre: string;
    plan_suscripcion: string;
    total_ordenes: number;
    ordenes_7d: number;
    ordenes_con_cliente_telefono: number;
    tasa_tracking: number;
    ordenes_iniciadas: number;
    vistas_tracking: number;
    conversiones_tracking: number;
}

// ─── Helpers ─────────────────────────────────────────────────────────────────

function StatCard({
    label, value, sub, icon: Icon, color = 'violet',
}: { label: string; value: string | number; sub?: string; icon: React.ElementType; color?: string }) {
    const colors: Record<string, string> = {
        violet: 'bg-violet-500/10 border-violet-500/20 text-violet-400',
        green:  'bg-green-500/10  border-green-500/20  text-green-400',
        blue:   'bg-blue-500/10   border-blue-500/20   text-blue-400',
        amber:  'bg-amber-500/10  border-amber-500/20  text-amber-400',
        rose:   'bg-rose-500/10   border-rose-500/20   text-rose-400',
        cyan:   'bg-cyan-500/10   border-cyan-500/20   text-cyan-400',
    };
    return (
        <div className="rounded-2xl bg-slate-900 border border-slate-800 p-5 flex items-start gap-4">
            <div className={`w-11 h-11 rounded-xl border flex items-center justify-center shrink-0 ${colors[color]}`}>
                <Icon className="w-5 h-5" />
            </div>
            <div className="min-w-0">
                <p className="text-xs text-slate-500 font-semibold uppercase tracking-wider mb-1">{label}</p>
                <p className="text-2xl font-black text-white">{value.toLocaleString('es-CL')}</p>
                {sub && <p className="text-xs text-slate-400 mt-0.5">{sub}</p>}
            </div>
        </div>
    );
}

function TrackingBar({ value }: { value: number }) {
    const color = value >= 70 ? 'bg-green-500' : value >= 40 ? 'bg-amber-500' : 'bg-rose-500';
    return (
        <div className="flex items-center gap-2">
            <div className="flex-1 h-2 rounded-full bg-slate-700 overflow-hidden">
                <div className={`h-full rounded-full ${color} transition-all`} style={{ width: `${Math.min(value, 100)}%` }} />
            </div>
            <span className="text-xs font-bold text-slate-300 w-10 text-right">{value}%</span>
        </div>
    );
}

// ─── Page ──────────────────────────────────────────────────────────────────────

export default function TrackingStatsPage() {
    const [stats, setStats] = useState<GlobalStats | null>(null);
    const [talleres, setTalleres] = useState<TallerStat[]>([]);
    const [loading, setLoading] = useState(true);
    const [lastRefresh, setLastRefresh] = useState<Date>(new Date());

    const loadData = async () => {
        setLoading(true);
        try {
            // ── Global KPIs ──────────────────────────────────────────────────
            const { data: globalRaw } = await supabase.rpc('exec_sql' as any, {
                sql: `
                SELECT
                    (SELECT COUNT(*) FROM ordenes)::int                                                 AS total_ordenes,
                    (SELECT COUNT(*) FROM ordenes WHERE creado_en >= NOW() - INTERVAL '7 days')::int    AS ordenes_7d,
                    (SELECT COUNT(*) FROM ordenes WHERE creado_en >= NOW() - INTERVAL '30 days')::int   AS ordenes_30d,
                    (SELECT COUNT(*) FROM talleres)::int                                               AS total_talleres,
                    (SELECT COUNT(*) FROM clientes)::int                                               AS total_clientes,
                    (SELECT COUNT(*) FROM ordenes WHERE access_token IS NOT NULL)::int                 AS ordenes_con_token_publico,
                    (SELECT COUNT(DISTINCT o.id) FROM ordenes o JOIN clientes c ON c.id = o.cliente_id WHERE c.telefono IS NOT NULL AND c.telefono != '')::int AS ordenes_con_tracking,
                    (SELECT COUNT(DISTINCT o.taller_id) FROM ordenes o JOIN clientes c ON c.id = o.cliente_id WHERE c.telefono IS NOT NULL AND c.telefono != '')::int AS talleres_usando_tracking;
                `
            });

            // Fallback: direct queries (if rpc not available)
            const [
                { count: totalOrdenes },
                { count: ordenes7d },
                { count: ordenes30d },
                { count: totalTalleres },
                { count: totalClientes },
                { count: totalUsuariosConductores },
                { count: ordenesConToken },
            ] = await Promise.all([
                supabase.from('ordenes').select('*', { count: 'exact', head: true }),
                supabase.from('ordenes').select('*', { count: 'exact', head: true }).gte('creado_en', new Date(Date.now() - 7 * 86400000).toISOString()),
                supabase.from('ordenes').select('*', { count: 'exact', head: true }).gte('creado_en', new Date(Date.now() - 30 * 86400000).toISOString()),
                supabase.from('talleres').select('*', { count: 'exact', head: true }),
                supabase.from('clientes').select('*', { count: 'exact', head: true }),
                supabase.from('perfiles_globales').select('*', { count: 'exact', head: true }),
                supabase.from('ordenes').select('*', { count: 'exact', head: true }).not('access_token', 'is', null),
            ]);

            // Buscar analíticas B2C
            const { data: trackingAnalytics } = await supabase
                .from('orden_tracking_analytics')
                .select('orden_id, vistas_cliente, clicks_registro');

            const totalVistas = trackingAnalytics?.reduce((sum, row) => sum + (row.vistas_cliente || 0), 0) || 0;
            const totalConversiones = trackingAnalytics?.reduce((sum, row) => sum + (row.clicks_registro || 0), 0) || 0;

            // Ordenes con cliente que tiene teléfono (tracking proxy) y estado
            const { data: ordenesConCliente } = await supabase
                .from('ordenes')
                .select('id, taller_id, estado, cliente:clientes!ordenes_cliente_id_fkey(telefono)')
                .not('cliente_id', 'is', null);

            const ordenesConTracking = (ordenesConCliente || []).filter(
                (o: any) => o.cliente?.telefono
            );
            const talleresConTracking = new Set(ordenesConTracking.map((o: any) => o.taller_id)).size;

            setStats({
                total_ordenes: totalOrdenes || 0,
                ordenes_7d: ordenes7d || 0,
                ordenes_30d: ordenes30d || 0,
                total_talleres: totalTalleres || 0,
                total_clientes: totalClientes || 0,
                total_usuarios_conductores: totalUsuariosConductores || 0,
                ordenes_con_token_publico: ordenesConToken || 0,
                ordenes_con_tracking: ordenesConTracking.length,
                tasa_tracking_global: totalOrdenes ? Math.round((ordenesConTracking.length / totalOrdenes) * 100) : 0,
                talleres_usando_tracking: talleresConTracking,
                vistas_tracking: totalVistas,
                conversiones_tracking: totalConversiones,
            });

            // ── Per-taller breakdown ─────────────────────────────────────────
            const { data: talleresDB } = await supabase
                .from('talleres')
                .select('id, nombre, plan_suscripcion')
                .order('nombre');

            if (talleresDB) {
                const tallerStats: TallerStat[] = await Promise.all(
                    talleresDB.map(async (t) => {
                        const [
                            { count: total },
                            { count: semana },
                        ] = await Promise.all([
                            supabase.from('ordenes').select('*', { count: 'exact', head: true }).eq('taller_id', t.id),
                            supabase.from('ordenes').select('*', { count: 'exact', head: true }).eq('taller_id', t.id).gte('creado_en', new Date(Date.now() - 7 * 86400000).toISOString()),
                        ]);

                        // Filtro del global ya traído en vez de hacer 2 joins por cada taller en bucle
                        const tallerOrdersInfo = ordenesConTracking.filter((o: any) => o.taller_id === t.id);
                        const conTelefono = tallerOrdersInfo.length;
                        const iniciadas = tallerOrdersInfo.filter((o: any) => o.estado !== 'pendiente' && o.estado !== 'cancelada').length;

                        // Sumatoria analítica
                        const analyticsDelTaller = trackingAnalytics?.filter(a => tallerOrdersInfo.some((o: any) => o.id === a.orden_id)) || [];
                        const vistasTaller = analyticsDelTaller.reduce((sum, row) => sum + (row.vistas_cliente || 0), 0);
                        const conversionesTaller = analyticsDelTaller.reduce((sum, row) => sum + (row.clicks_registro || 0), 0);
                        
                        const tasa = total ? Math.round((conTelefono / total!) * 100) : 0;

                        return {
                            id: t.id,
                            nombre: t.nombre,
                            plan_suscripcion: t.plan_suscripcion || 'GRATIS',
                            total_ordenes: total || 0,
                            ordenes_7d: semana || 0,
                            ordenes_con_cliente_telefono: conTelefono,
                            tasa_tracking: tasa,
                            ordenes_iniciadas: iniciadas,
                            vistas_tracking: vistasTaller,
                            conversiones_tracking: conversionesTaller,
                        };
                    })
                );
                setTalleres(tallerStats.sort((a, b) => b.total_ordenes - a.total_ordenes));
            }
        } catch (err) {
            console.error('Error cargando stats:', err);
        } finally {
            setLoading(false);
            setLastRefresh(new Date());
        }
    };

    useEffect(() => { loadData(); }, []);

    if (loading) {
        return (
            <div className="space-y-6">
                <div className="h-8 w-64 bg-slate-800 rounded-xl animate-pulse" />
                <div className="grid grid-cols-2 md:grid-cols-3 lg:grid-cols-4 gap-4">
                    {Array.from({ length: 8 }).map((_, i) => (
                        <div key={i} className="h-24 bg-slate-800/60 rounded-2xl animate-pulse" />
                    ))}
                </div>
            </div>
        );
    }

    return (
        <div className="space-y-8">
            {/* Header */}
            <div className="flex items-start justify-between gap-4">
                <div>
                    <h1 className="text-2xl font-black text-white">📡 Tracking Stats</h1>
                    <p className="text-slate-400 text-sm mt-1">
                        Métricas globales de adopción del tracking — todos los talleres, sin filtros.
                    </p>
                </div>
                <div className="flex items-center gap-3">
                    <span className="text-xs text-slate-500">
                        Actualizado {lastRefresh.toLocaleTimeString('es-CL', { hour: '2-digit', minute: '2-digit' })}
                    </span>
                    <button
                        onClick={loadData}
                        disabled={loading}
                        className="flex items-center gap-2 rounded-xl bg-violet-600 hover:bg-violet-500 disabled:opacity-50 px-4 py-2 text-sm font-bold text-white transition-colors"
                    >
                        <RefreshCw className={`w-4 h-4 ${loading ? 'animate-spin' : ''}`} />
                        Refrescar
                    </button>
                </div>
            </div>

            {/* Global KPI Grid */}
            {stats && (
                <div className="grid grid-cols-2 md:grid-cols-3 lg:grid-cols-4 gap-4">
                    <StatCard label="Total Órdenes" value={stats.total_ordenes} sub="Histórico completo" icon={ClipboardList} color="violet" />
                    <StatCard label="Órdenes (7 días)" value={stats.ordenes_7d} sub="Última semana" icon={TrendingUp} color="blue" />
                    <StatCard label="Órdenes (30 días)" value={stats.ordenes_30d} sub="Último mes" icon={BarChart3} color="cyan" />
                    <StatCard label="Total Talleres" value={stats.total_talleres} sub="Registrados en plataforma" icon={Building2} color="amber" />
                    <StatCard label="Total Clientes (B2B)" value={stats.total_clientes} sub="Registrados por talleres" icon={Users} color="violet" />
                    <StatCard label="Conductores (App)" value={stats.total_usuarios_conductores} sub="Cuentas B2C creadas" icon={Users} color="blue" />
                    <StatCard
                        label="Órdenes con Tracking"
                        value={stats.ordenes_con_tracking}
                        sub={`${stats.tasa_tracking_global}% del total`}
                        icon={MessageCircle}
                        color="green"
                    />
                    <StatCard
                        label="Token Público"
                        value={stats.ordenes_con_token_publico}
                        sub="Órdenes con link activo"
                        icon={CheckCircle}
                        color="green"
                    />
                    <StatCard
                        label="Talleres con Tracking"
                        value={stats.talleres_usando_tracking}
                        sub={`de ${stats.total_talleres} totales`}
                        icon={AlertTriangle}
                        color={stats.talleres_usando_tracking < stats.total_talleres / 2 ? 'rose' : 'green'}
                    />
                    <StatCard
                        label="Vistas (App Conductores)"
                        value={stats.vistas_tracking}
                        sub="Impresiones globales"
                        icon={Users}
                        color="cyan"
                    />
                    <StatCard
                        label="Click a Registro B2C"
                        value={stats.conversiones_tracking}
                        sub={`${stats.vistas_tracking > 0 ? Math.round((stats.conversiones_tracking / stats.vistas_tracking)*100) : 0}% CTR`}
                        icon={TrendingUp}
                        color="green"
                    />
                </div>
            )}

            {/* Tracking Adoption Highlight */}
            {stats && (
                <div className="rounded-2xl bg-gradient-to-br from-violet-900/40 to-indigo-900/20 border border-violet-500/20 p-6">
                    <div className="flex items-center gap-3 mb-4">
                        <MessageCircle className="w-6 h-6 text-violet-400" />
                        <h2 className="text-lg font-black text-white">Adopción Global del Tracking</h2>
                    </div>
                    <div className="flex items-end gap-4 mb-3">
                        <span className="text-6xl font-black text-white">{stats.tasa_tracking_global}%</span>
                        <div className="pb-2">
                            <p className="text-slate-300 font-semibold">de las órdenes tienen número de cliente</p>
                            <p className="text-slate-500 text-sm">= pueden recibir el tracking por WhatsApp</p>
                        </div>
                    </div>
                    <div className="h-3 rounded-full bg-slate-800 overflow-hidden">
                        <div
                            className="h-full rounded-full bg-gradient-to-r from-violet-500 to-indigo-400 transition-all"
                            style={{ width: `${stats.tasa_tracking_global}%` }}
                        />
                    </div>
                    <p className="text-xs text-slate-500 mt-2">
                        {stats.talleres_usando_tracking} de {stats.total_talleres} talleres han registrado al menos una orden con datos de contacto del cliente.
                    </p>
                </div>
            )}

            {/* Per-taller table */}
            <div>
                <h2 className="text-lg font-black text-white mb-4 flex items-center gap-2">
                    <Building2 className="w-5 h-5 text-slate-400" />
                    Desglose por Taller
                </h2>
                <div className="overflow-hidden rounded-2xl border border-slate-800">
                    <table className="w-full">
                        <thead className="bg-slate-800/70">
                            <tr>
                                <th className="px-4 py-3 text-left text-xs font-black tracking-widest text-slate-400 uppercase">Taller</th>
                                <th className="px-4 py-3 text-left text-xs font-black tracking-widest text-slate-400 uppercase">Plan</th>
                                <th className="px-4 py-3 text-right text-xs font-black tracking-widest text-slate-400 uppercase">Total Ords.</th>
                                <th className="px-4 py-3 text-right text-xs font-black tracking-widest text-slate-400 uppercase">Con Tel.</th>
                                <th className="px-4 py-3 text-right text-xs font-black tracking-widest text-slate-400 uppercase" title="Órdenes que avanzaron de estado (Uso real)">Órds. Activas</th>
                                <th className="px-4 py-3 text-right text-xs font-black tracking-widest text-slate-400 uppercase">P. Views</th>
                                <th className="px-4 py-3 text-right text-xs font-black tracking-widest text-slate-400 uppercase">Registros</th>
                                <th className="px-4 py-3 text-left text-xs font-black tracking-widest text-slate-400 uppercase min-w-[140px]">Adopción Tracking</th>
                            </tr>
                        </thead>
                        <tbody className="divide-y divide-slate-800">
                            {talleres.map((t) => (
                                <tr key={t.id} className="bg-slate-900 hover:bg-slate-800/60 transition-colors">
                                    <td className="px-4 py-3">
                                        <p className="font-bold text-white text-sm">{t.nombre}</p>
                                    </td>
                                    <td className="px-4 py-3">
                                        <span className={`text-xs font-black px-2 py-0.5 rounded-full ${
                                            t.plan_suscripcion === 'PRO'      ? 'bg-violet-500/20 text-violet-300' :
                                            t.plan_suscripcion === 'PREMIUM'  ? 'bg-amber-500/20  text-amber-300'  :
                                                                                 'bg-slate-700     text-slate-400'
                                        }`}>
                                            {t.plan_suscripcion}
                                        </span>
                                    </td>
                                    <td className="px-4 py-3 text-right font-mono text-white font-bold">{t.total_ordenes.toLocaleString('es-CL')}</td>
                                    <td className="px-4 py-3 text-right font-mono text-blue-400 font-bold">{t.ordenes_con_cliente_telefono}</td>
                                    <td className="px-4 py-3 text-right font-mono text-emerald-400">
                                        <div className="flex flex-col items-end">
                                            <span className="font-bold">{t.ordenes_iniciadas} <span>({t.ordenes_con_cliente_telefono > 0 ? Math.round((t.ordenes_iniciadas/t.ordenes_con_cliente_telefono)*100) : 0}%)</span></span>
                                            <span className="text-[10px] text-slate-500 uppercase tracking-widest">Avanzadas</span>
                                        </div>
                                    </td>
                                    <td className="px-4 py-3 text-right font-mono text-slate-300 font-bold">{t.vistas_tracking.toLocaleString('es-CL')}</td>
                                    <td className="px-4 py-3 text-right font-mono text-amber-400 font-bold">{t.conversiones_tracking.toLocaleString('es-CL')}</td>
                                    <td className="px-4 py-3 min-w-[120px]">
                                        <TrackingBar value={t.tasa_tracking} />
                                    </td>
                                </tr>
                            ))}
                        </tbody>
                    </table>
                    {talleres.length === 0 && (
                        <div className="px-4 py-10 text-center text-slate-500 text-sm">Sin datos disponibles.</div>
                    )}
                </div>
            </div>
        </div>
    );
}
