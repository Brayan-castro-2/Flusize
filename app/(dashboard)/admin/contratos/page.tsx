'use client';

import { useEffect, useState } from 'react';
import { supabase } from '@/lib/supabase';
import { useAuth } from '@/contexts/auth-context';
import ModuleGuard from '@/components/guards/ModuleGuard';
import { Shield, MapPin, Clock, FileText, CheckCircle2, Search, Download } from 'lucide-react';

interface ContratoFirmado {
    id: string;
    orden_id: string | null;
    cliente_nombre: string | null;
    cliente_rut: string | null;
    vehiculo_patente: string | null;
    vehiculo_desc: string | null;
    monto_total: number | null;
    ip_cliente: string | null;
    geolat: number | null;
    geolng: number | null;
    hash_verificacion: string | null;
    firmado_en: string;
    numero_contrato: string | null;
    firma_base64: string | null;
}

function ContratosContent() {
    const { user } = useAuth();
    const [contratos, setContratos] = useState<ContratoFirmado[]>([]);
    const [loading, setLoading] = useState(true);
    const [search, setSearch] = useState('');
    const [selected, setSelected] = useState<ContratoFirmado | null>(null);

    useEffect(() => {
        const fetch = async () => {
            setLoading(true);
            // Cargamos contratos cruzando con ordenes de este taller
            const { data } = await supabase
                .from('contratos_firmados')
                .select('*')
                .order('firmado_en', { ascending: false });
            setContratos((data as ContratoFirmado[]) || []);
            setLoading(false);
        };
        fetch();
    }, []);

    const filtrados = contratos.filter(c => {
        const q = search.toLowerCase();
        return (
            c.cliente_nombre?.toLowerCase().includes(q) ||
            c.vehiculo_patente?.toLowerCase().includes(q) ||
            c.cliente_rut?.toLowerCase().includes(q)
        );
    });

    return (
        <div className="space-y-6">
            <div className="flex items-start justify-between">
                <div>
                    <h1 className="text-2xl md:text-3xl font-black text-slate-800 flex items-center gap-3">
                        <div className="p-2.5 bg-blue-500/20 rounded-xl border border-blue-500/30">
                            <Shield className="w-6 h-6 text-blue-600" />
                        </div>
                        Contratos Digitales
                    </h1>
                    <p className="text-slate-800 font-semibold mt-1 text-sm">Registro de contratos firmados electrónicamente</p>
                </div>
            </div>

            {/* Buscador */}
            <div className="relative">
                <Search className="absolute left-3.5 top-1/2 -translate-y-1/2 w-4 h-4 text-slate-400" />
                <input
                    value={search}
                    onChange={e => setSearch(e.target.value)}
                    placeholder="Buscar por cliente, patente o RUT..."
                    className="w-full h-11 pl-10 pr-4 bg-slate-800 border border-slate-700 text-white rounded-xl text-sm focus:outline-none focus:ring-1 focus:ring-blue-500"
                />
            </div>

            {/* Lista */}
            {loading ? (
                <div className="space-y-3">
                    {[1, 2, 3].map(i => <div key={i} className="h-20 bg-slate-800/40 rounded-2xl animate-pulse" />)}
                </div>
            ) : filtrados.length === 0 ? (
                <div className="text-center py-16 text-slate-600">
                    <FileText className="w-12 h-12 mx-auto mb-3 opacity-30" />
                    <p className="text-lg font-semibold">{search ? 'Sin resultados' : 'No hay contratos firmados aún'}</p>
                    <p className="text-sm mt-1">Los contratos firmados desde el Tracking aparecerán aquí</p>
                </div>
            ) : (
                <div className="space-y-3">
                    {filtrados.map(c => (
                        <div key={c.id} onClick={() => setSelected(c)}
                            className="bg-slate-800/60 border border-slate-700/50 rounded-2xl p-4 cursor-pointer hover:border-blue-500/40 hover:bg-slate-800 transition-all group">
                            <div className="flex items-start justify-between">
                                <div className="flex items-center gap-3">
                                    <div className="p-2 bg-emerald-500/20 rounded-xl border border-emerald-500/30">
                                        <CheckCircle2 className="w-5 h-5 text-emerald-400" />
                                    </div>
                                    <div>
                                        <p className="font-bold text-white">{c.cliente_nombre || 'Cliente'}</p>
                                        <p className="text-sm text-slate-400">
                                            {c.vehiculo_patente && <span className="font-mono mr-2">{c.vehiculo_patente}</span>}
                                            {c.vehiculo_desc}
                                        </p>
                                    </div>
                                </div>
                                <div className="text-right shrink-0">
                                    <p className="text-emerald-400 font-black">
                                        {c.monto_total?.toLocaleString('es-CL', { style: 'currency', currency: 'CLP', maximumFractionDigits: 0 })}
                                    </p>
                                    <div className="flex items-center gap-1 text-xs text-slate-500 mt-0.5 justify-end">
                                        <Clock className="w-3 h-3" />
                                        {new Date(c.firmado_en).toLocaleString('es-CL')}
                                    </div>
                                </div>
                            </div>

                            <div className="flex items-center gap-4 mt-3 pt-3 border-t border-slate-700/50 text-xs text-slate-500">
                                <div className="flex items-center gap-1">
                                    <Shield className="w-3 h-3 text-blue-400" />
                                    Hash: {c.hash_verificacion?.slice(0, 16)}...
                                </div>
                                {(c.geolat && c.geolng) && (
                                    <div className="flex items-center gap-1">
                                        <MapPin className="w-3 h-3 text-emerald-400" />
                                        Geo: {c.geolat.toFixed(3)}, {c.geolng.toFixed(3)}
                                    </div>
                                )}
                                <div>IP: {c.ip_cliente}</div>
                            </div>
                        </div>
                    ))}
                </div>
            )}

            {/* Modal de detalle firmado */}
            {selected && (
                <div className="fixed inset-0 z-50 flex items-center justify-center p-4 bg-black/70 backdrop-blur-sm" onClick={e => e.target === e.currentTarget && setSelected(null)}>
                    <div className="bg-slate-900 border border-slate-700 rounded-3xl w-full max-w-md p-6 space-y-4">
                        <div className="flex items-center justify-between">
                            <h3 className="font-black text-white text-lg">Detalle de Contrato</h3>
                            <button onClick={() => setSelected(null)} className="text-slate-400 hover:text-white">✕</button>
                        </div>

                        <div className="space-y-3 text-sm">
                            <div className="grid grid-cols-2 gap-2">
                                <div className="bg-slate-800 rounded-xl p-3">
                                    <p className="text-xs text-slate-500">Cliente</p>
                                    <p className="font-bold text-white">{selected.cliente_nombre}</p>
                                </div>
                                <div className="bg-slate-800 rounded-xl p-3">
                                    <p className="text-xs text-slate-500">RUT</p>
                                    <p className="font-bold text-white">{selected.cliente_rut}</p>
                                </div>
                                <div className="bg-slate-800 rounded-xl p-3">
                                    <p className="text-xs text-slate-500">Vehículo</p>
                                    <p className="font-mono font-bold text-white">{selected.vehiculo_patente}</p>
                                </div>
                                <div className="bg-slate-800 rounded-xl p-3">
                                    <p className="text-xs text-slate-500">Monto</p>
                                    <p className="font-bold text-emerald-400">
                                        {selected.monto_total?.toLocaleString('es-CL', { style: 'currency', currency: 'CLP', maximumFractionDigits: 0 })}
                                    </p>
                                </div>
                            </div>

                            {selected.firma_base64 && (
                                <div className="bg-white rounded-xl p-3">
                                    <p className="text-xs text-slate-500 mb-2">Firma del Comprador</p>
                                    <img src={selected.firma_base64} alt="Firma" className="max-h-24 mx-auto" />
                                </div>
                            )}

                            <div className="bg-slate-800/50 rounded-xl p-3 space-y-1.5 text-xs">
                                <div className="flex items-center gap-2 text-slate-400">
                                    <Clock className="w-3.5 h-3.5" /> Firmado: {new Date(selected.firmado_en).toLocaleString('es-CL')}
                                </div>
                                {selected.ip_cliente && <div className="flex items-center gap-2 text-slate-400"><Shield className="w-3.5 h-3.5" /> IP: {selected.ip_cliente}</div>}
                                {selected.geolat && <div className="flex items-center gap-2 text-slate-400"><MapPin className="w-3.5 h-3.5" /> Geo: {selected.geolat.toFixed(5)}, {selected.geolng?.toFixed(5)}</div>}
                                <div className="font-mono text-[10px] text-slate-500 break-all">Hash: {selected.hash_verificacion}</div>
                            </div>
                        </div>
                    </div>
                </div>
            )}
        </div>
    );
}

export default function ContratosPage() {
    return (
        <ContratosContent />
    );
}
