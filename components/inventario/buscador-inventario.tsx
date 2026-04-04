'use client';

import { useState, useEffect, useRef } from 'react';
import { supabase } from '@/lib/supabase';
import { useAuth } from '@/contexts/auth-context';
import { Search, Trash2, Box, Loader2 } from 'lucide-react';
import { toast } from 'sonner';

export interface ProductoInventario {
    id: string;
    nombre: string;
    codigo: string | null;
    precio_venta: number;
    stock_actual: number;
}

export interface CartItem extends ProductoInventario {
    cantidad: number;
    dbId?: string;
}

interface BuscadorInventarioProps {
    onChange?: (items: CartItem[]) => void;
    initialItems?: CartItem[];
}

export function BuscadorInventario({ onChange, initialItems = [] }: BuscadorInventarioProps) {
    const { user } = useAuth();
    const [query, setQuery] = useState('');
    const [results, setResults] = useState<ProductoInventario[]>([]);
    const [isSearching, setIsSearching] = useState(false);
    const [showDropdown, setShowDropdown] = useState(false);
    const [cart, setCart] = useState<CartItem[]>(initialItems);
    
    const dropdownRef = useRef<HTMLDivElement>(null);

    // Click outside to close dropdown
    useEffect(() => {
        function handleClickOutside(event: MouseEvent) {
            if (dropdownRef.current && !dropdownRef.current.contains(event.target as Node)) {
                setShowDropdown(false);
            }
        }
        document.addEventListener("mousedown", handleClickOutside);
        return () => document.removeEventListener("mousedown", handleClickOutside);
    }, []);

    // Sincronizar si los initialItems cambian asincrónicamente
    useEffect(() => {
        if (initialItems.length > 0 && cart.length === 0) {
            setCart(initialItems);
        }
    }, [initialItems]);

    // Effect to notify parent when cart changes
    useEffect(() => {
        if (onChange) {
            onChange(cart);
        }
    }, [cart, onChange]); // Disable exhaustive deps warning if needed, but this is fine.

    // Debounced search
    useEffect(() => {
        const searchProducts = async () => {
            if (!user?.tallerId) {
                setResults([]);
                return;
            }

            setIsSearching(true);
            try {
                let currentQuery = supabase
                    .from('productos')
                    .select('id, nombre, codigo, precio_venta, stock_actual')
                    .eq('taller_id', user.tallerId);

                if (query.trim()) {
                    const searchPattern = `%${query}%`;
                    currentQuery = currentQuery.or(`nombre.ilike.${searchPattern},codigo.ilike.${searchPattern}`).limit(10);
                } else {
                    currentQuery = currentQuery.order('stock_actual', { ascending: false }).limit(5);
                }

                const { data, error } = await currentQuery;

                if (error) throw error;
                setResults(data || []);
            } catch (error) {
                console.error('Error buscando productos:', error);
            } finally {
                setIsSearching(false);
            }
        };

        const timer = setTimeout(searchProducts, 300);
        return () => clearTimeout(timer);
    }, [query, user?.tallerId]);

    const handleSelectProduct = (product: ProductoInventario) => {
        setShowDropdown(false);
        setQuery('');
        
        if (product.stock_actual <= 0) {
            toast.error("Producto sin stock disponible.");
            return;
        }

        setCart(prev => {
            const existing = prev.find(item => item.id === product.id);
            if (existing) {
                if (existing.cantidad >= product.stock_actual) {
                    toast.warning("Has alcanzado el límite de stock de este producto.");
                    return prev;
                }
                return prev.map(item => 
                    item.id === product.id 
                        ? { ...item, cantidad: item.cantidad + 1 } 
                        : item
                );
            }
            return [...prev, { ...product, cantidad: 1 }];
        });
    };

    const handleUpdateQuantity = (id: string, newQuantity: number) => {
        if (isNaN(newQuantity) || newQuantity < 1) newQuantity = 1;

        setCart(prev => prev.map(item => {
            if (item.id === id) {
                if (newQuantity > item.stock_actual) {
                    toast.warning(`Solo hay ${item.stock_actual} en stock.`);
                    return { ...item, cantidad: item.stock_actual };
                }
                return { ...item, cantidad: newQuantity };
            }
            return item;
        }));
    };

    const handleRemoveItem = (id: string) => {
        setCart(prev => prev.filter(item => item.id !== id));
    };

    const totalCart = cart.reduce((acc, item) => acc + (item.precio_venta * item.cantidad), 0);

    return (
        <div className="w-full space-y-4">
            {/* Buscador Autocomplete */}
            <div className="relative" ref={dropdownRef}>
                <label className="text-xs font-bold text-slate-500 uppercase tracking-widest mb-1.5 block">
                    <Box className="w-3.5 h-3.5 inline mr-1" />
                    Buscador de Repuestos / Materiales
                </label>
                <div className="relative">
                    <Search className="absolute left-3 top-1/2 -translate-y-1/2 w-4 h-4 text-slate-400" />
                    <input
                        type="text"
                        placeholder="Buscar por nombre, SKU o código..."
                        value={query}
                        onFocus={() => setShowDropdown(true)}
                        onChange={(e) => {
                            setQuery(e.target.value);
                            setShowDropdown(true);
                        }}
                        className="w-full h-11 pl-10 pr-4 bg-white border border-slate-200 rounded-xl text-sm focus:ring-2 focus:ring-blue-500/20 focus:border-blue-500 outline-none transition-all placeholder:text-slate-400 text-slate-800"
                    />
                    {isSearching && (
                        <div className="absolute right-3 top-1/2 -translate-y-1/2">
                            <Loader2 className="w-4 h-4 animate-spin text-blue-500" />
                        </div>
                    )}
                </div>

                {showDropdown && (query.trim().length > 0) && (
                    <div className="absolute z-50 w-full mt-1 bg-white border border-slate-200 rounded-xl shadow-xl overflow-hidden max-h-64 overflow-y-auto">
                        {results.length === 0 && !isSearching ? (
                            <div className="p-4 text-center text-sm text-slate-500">
                                No se encontraron productos coincidentes.
                            </div>
                        ) : (
                            results.map(prod => (
                                <button
                                    key={prod.id}
                                    type="button"
                                    onClick={() => handleSelectProduct(prod)}
                                    className="w-full text-left px-4 py-3 hover:bg-slate-50 border-b border-slate-50 last:border-0 transition-colors flex items-center justify-between group"
                                >
                                    <div>
                                        <p className="font-semibold text-sm text-slate-800 group-hover:text-blue-600 transition-colors">
                                            {prod.nombre}
                                        </p>
                                        <div className="flex items-center gap-2 mt-0.5">
                                            {prod.codigo && <span className="text-[10px] font-mono bg-slate-100 text-slate-600 px-1.5 rounded">{prod.codigo}</span>}
                                            <span className="text-xs font-medium text-slate-500">
                                                ${Number(prod.precio_venta).toLocaleString('es-CL')}
                                            </span>
                                        </div>
                                    </div>
                                    <div className="flex flex-col items-end shrink-0">
                                        <div className={`px-2 py-0.5 rounded-full text-[10px] items-center flex gap-1 font-bold ${prod.stock_actual > 0 ? "bg-emerald-50 text-emerald-600 border border-emerald-200/50" : "bg-red-50 text-red-600 border border-red-200/50"}`}>
                                            {prod.stock_actual > 0 ? (
                                                <><span className="w-1.5 h-1.5 rounded-full bg-emerald-500"></span> {prod.stock_actual} disp</>
                                            ) : (
                                                <><span className="w-1.5 h-1.5 rounded-full bg-red-500"></span> Agotado</>
                                            )}
                                        </div>
                                    </div>
                                </button>
                            ))
                        )}
                    </div>
                )}
            </div>

            {/* Carrito Local */}
            {cart.length > 0 && (
                <div className="bg-slate-50 rounded-xl border border-slate-200 overflow-hidden">
                    <div className="px-4 py-2 border-b border-slate-200 bg-slate-100/50 flex items-center justify-between">
                        <h4 className="text-xs font-bold text-slate-600 uppercase tracking-wider">Repuestos a despachar</h4>
                        <span className="text-[10px] font-bold bg-blue-100 text-blue-700 px-2 py-0.5 rounded-full">{cart.length} ÍTEMS</span>
                    </div>
                    <ul className="divide-y divide-slate-100">
                        {cart.map(item => (
                            <li key={item.id} className="p-3 flex items-start md:items-center justify-between bg-white hover:bg-slate-50/50 transition-colors flex-col md:flex-row gap-3">
                                <div className="flex-1 min-w-0 pr-4">
                                    <p className="text-sm font-semibold text-slate-800 truncate">{item.nombre}</p>
                                    <p className="text-xs text-slate-500">${Number(item.precio_venta).toLocaleString('es-CL')} c/u</p>
                                </div>
                                <div className="flex items-center gap-4 w-full md:w-auto justify-between md:justify-end shrink-0">
                                    <div className="flex items-center gap-2">
                                        <label className="text-[10px] font-bold text-slate-400">CANT.</label>
                                        <div className="flex items-center bg-slate-100 rounded-lg p-0.5 border border-slate-200">
                                            <button 
                                                type="button"
                                                onClick={() => handleUpdateQuantity(item.id, item.cantidad - 1)}
                                                className="w-6 h-6 rounded flex items-center justify-center bg-white text-slate-600 hover:text-blue-600 shadow-sm transition-colors active:scale-95"
                                            >-</button>
                                            <input 
                                                type="number"
                                                value={item.cantidad}
                                                onChange={(e) => handleUpdateQuantity(item.id, parseInt(e.target.value))}
                                                min="1"
                                                max={item.stock_actual}
                                                className="w-10 h-6 text-center text-xs font-bold bg-transparent border-none focus:ring-0 outline-none p-0 text-slate-800 [appearance:textfield] [&::-webkit-outer-spin-button]:appearance-none [&::-webkit-inner-spin-button]:appearance-none"
                                            />
                                            <button 
                                                type="button"
                                                onClick={() => handleUpdateQuantity(item.id, item.cantidad + 1)}
                                                className="w-6 h-6 rounded flex items-center justify-center bg-white text-slate-600 hover:text-blue-600 shadow-sm transition-colors active:scale-95"
                                            >+</button>
                                        </div>
                                        <span className="text-[10px] font-medium text-slate-400 shrink-0 w-10 text-right">/ {item.stock_actual}</span>
                                    </div>
                                    <div className="text-right min-w-[70px] hidden md:block">
                                        <p className="text-sm font-bold text-slate-800">${(item.precio_venta * item.cantidad).toLocaleString('es-CL')}</p>
                                    </div>
                                    <button 
                                        type="button"
                                        onClick={() => handleRemoveItem(item.id)}
                                        className="w-8 h-8 rounded-lg flex items-center justify-center text-red-400 hover:text-red-600 hover:bg-red-50 transition-colors"
                                        title="Eliminar repuesto"
                                    >
                                        <Trash2 className="w-4 h-4" />
                                    </button>
                                </div>
                                <div className="text-right w-full flex justify-between items-center md:hidden border-t border-slate-100 pt-2 mt-1">
                                     <span className="text-[10px] font-bold text-slate-400 uppercase tracking-wider">Subtotal</span>
                                     <p className="text-sm font-bold text-slate-800">${(item.precio_venta * item.cantidad).toLocaleString('es-CL')}</p>
                                </div>
                            </li>
                        ))}
                    </ul>
                    <div className="p-4 bg-[url('/noise.png')] bg-slate-800 flex items-center justify-between text-white relative overflow-hidden">
                        <div className="absolute inset-0 bg-gradient-to-r from-blue-600/20 to-transparent"></div>
                        <span className="text-xs uppercase tracking-widest font-bold text-slate-300 relative z-10">Total Repuestos</span>
                        <span className="text-lg font-black tracking-tight relative z-10">${totalCart.toLocaleString('es-CL')}</span>
                    </div>
                </div>
            )}

            {/* Guía de Integración para el Dev (Comentada) */}
            {/* 
                // EJEMPLO DE INTEGRACIÓN EN COMPONENTE PADRE (Ej. Recepción / Detalle Orden):
                
                // 1. Estado Local en Parent
                const [repuestos, setRepuestos] = useState<CartItem[]>([]);

                // 2. Renderizado
                <BuscadorInventario onChange={setRepuestos} />

                // 3. Función Guardar Transacción
                const handleGuardarOrdenConRepuestos = async (ordenId: string) => {
                    if (repuestos.length === 0) return;

                    for (const item of repuestos) {
                        // A) Linkear a la orden (Tabla puente orden_repuestos)
                        await supabase.from('orden_repuestos').insert({
                            orden_id: ordenId,
                            producto_id: item.id,
                            cantidad: item.cantidad,
                            precio_unitario: item.precio_venta,
                            subtotal: item.precio_venta * item.cantidad
                        });

                        // B) Registrar salida en inventario
                        await supabase.from('movimientos_inventario').insert({
                            taller_id: user.tallerId,
                            producto_id: item.id,
                            tipo_movimiento: 'SALIDA',
                            cantidad: item.cantidad,
                            precio_unitario: item.precio_venta,
                            nota: `Despacho para Orden #${ordenId}`,
                            fecha: new Date().toISOString(),
                            usuario_id: user.id
                        });

                        // C) Descontar stock (vía RPC o update normal)
                        // await supabase.rpc('decrementar_stock_producto', { p_id: item.id, qty: item.cantidad });
                        // OR: await supabase.from('productos').update({ stock_actual: item.stock_actual - item.cantidad }).eq('id', item.id);
                    }
                }
            */}
        </div>
    );
}
