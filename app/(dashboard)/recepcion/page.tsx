'use client';

import { useEffect, useMemo, useRef, useState, Suspense } from 'react';
import { useRouter, useSearchParams } from 'next/navigation';
import { useAuth } from '@/contexts/auth-context';
import { normalizePlan, planHasModule } from '@/lib/plan-config';
import { buscarVehiculoPorPatente, crearVehiculo, crearOrden, obtenerOrdenes, obtenerCitas, actualizarCita, subirImagen, obtenerServiciosFrecuentes, registrarUsoServicios, buscarClientePorRut } from '@/lib/storage-adapter';
import { consultarPatenteGetAPI, isGetAPIConfigured } from '@/lib/getapi-service';
import imageCompression from 'browser-image-compression';
import { DebtAlertModal } from '@/components/reception/debt-alert-modal';
import type { OrdenDB, CitaDB } from '@/lib/storage-adapter';
import { useQueryClient } from '@tanstack/react-query';
import {
    Loader2,
    Calendar,
    Wallet,
    CheckCircle2,
    ArrowRight,
    MessageCircle,
    ClipboardCheck,
    ShieldCheck,
    EyeOff
} from 'lucide-react';
import dynamic from 'next/dynamic';
import ChecklistForm from '@/components/ordenes/checklist-form';
import { BuscadorInventario, CartItem as RepuestoSeleccionado } from '@/components/inventario/buscador-inventario';
import { supabase } from '@/lib/supabase';
import { useFlusizeFeatures } from '@/hooks/useFlusizeFeatures';

const MOCK_DB: Record<string, { marca: string; modelo: string; anio: string; motor: string }> = {
    PROFE1: { marca: 'Nissan', modelo: 'V16', anio: '2010', motor: '1.6 Twin Cam' },
    BBBB10: { marca: 'Toyota', modelo: 'Yaris', anio: '2018', motor: '1.5' },
    TEST01: { marca: 'Chevrolet', modelo: 'Sail', anio: '2020', motor: '1.4' },
};

// Eliminamos la constante estática SERVICIOS_FRECUENTES
// Se cargará desde la BD en el componente

type Servicio = { descripcion: string; precio: string };
type FocusTarget = { index: number; field: 'desc' | 'precio' } | null;

function formatMilesConPunto(value: string) {
    const digits = String(value || '').replace(/\D/g, '');
    if (!digits) return '';
    return digits.replace(/\B(?=(\d{3})+(?!\d))/g, '.');
}

function buildKmServiceDescripcion(kmActual: string, kmNuevo: string) {
    const a = kmActual ? `${formatMilesConPunto(kmActual)} KM` : 'KM actual';
    const n = kmNuevo ? `${formatMilesConPunto(kmNuevo)} KM` : 'KM nuevo';
    return `KM: ${a} → ${n}`;
}

function normalizePatente(v: string) {
    return String(v || '')
        .toUpperCase()
        .replace(/[^A-Z0-9]/g, '')
        .slice(0, 6);
}

function parsePrecio(v: string) {
    const cleaned = String(v || '').replace(/[^0-9]/g, '');
    return cleaned ? Number(cleaned) : 0;
}

function moneyCL(n: number) {
    return (Number.isFinite(n) ? n : 0).toLocaleString('es-CL');
}

function nowCL() {
    return new Date().toLocaleString('es-CL', {
        weekday: 'long',
        year: 'numeric',
        month: '2-digit',
        day: '2-digit',
        hour: '2-digit',
        minute: '2-digit',
        second: '2-digit',
    });
}

// Función para comprimir imágenes antes de subir
async function comprimirImagen(file: File): Promise<File> {
    const options = {
        maxSizeMB: 1, // Máximo 1MB
        maxWidthOrHeight: 1920, // Máximo 1920px de ancho/alto
        useWebWorker: true,
        fileType: 'image/jpeg', // Convertir a JPEG para mejor compresión
    };

    try {
        console.log(`📸 Comprimiendo imagen: ${file.name} (${(file.size / 1024 / 1024).toFixed(2)}MB)`);
        const compressedFile = await imageCompression(file, options);
        console.log(`✅ Imagen comprimida: ${compressedFile.name} (${(compressedFile.size / 1024 / 1024).toFixed(2)}MB)`);
        return compressedFile;
    } catch (error) {
        console.error('❌ Error al comprimir imagen:', error);
        // Si falla la compresión, retornar el archivo original
        return file;
    }
}

function RecepcionContent() {
    const router = useRouter();
    const searchParams = useSearchParams();
    const { user, isLoading: isLoadingAuth } = useAuth();
    const { tieneModulo } = useFlusizeFeatures();
    const planStr = normalizePlan(user?.plan);
    const hasInventario = planHasModule(planStr, 'inventario');
    const hasChecklist = planHasModule(planStr, 'checklist');
    const hasMiniCrm = tieneModulo('clientes.mini_crm');
    const queryClient = useQueryClient();

    const [fechaHora, setFechaHora] = useState(nowCL());
    const [mecanico, setMecanico] = useState('Técnico en Turno');
    const [loading, setLoading] = useState(false); // Por defecto false, se activa si hay citaId

    // Form states - Consolidated
    const [patente, setPatente] = useState('');
    const [marca, setMarca] = useState('');
    const [modelo, setModelo] = useState('');
    const [anio, setAnio] = useState('');
    const [motor, setMotor] = useState('');
    const [vehiculoColor, setVehiculoColor] = useState('');
    const [kilometrajeIngreso, setKilometrajeIngreso] = useState('');

    const [kmEnabled, setKmEnabled] = useState(false);
    const [kmActual, setKmActual] = useState('');
    const [kmNuevo, setKmNuevo] = useState('');
    const [kmServiceIndex, setKmServiceIndex] = useState<number | null>(null);
    const [showAllServices, setShowAllServices] = useState(false);

    const [vehiculoLocked, setVehiculoLocked] = useState(false);
    const [estadoBusqueda, setEstadoBusqueda] = useState('');
    const [isBuscando, setIsBuscando] = useState(false);

    const [clienteNombre, setClienteNombre] = useState('');
    const [clienteWhatsapp, setClienteWhatsapp] = useState('');
    const [clienteRut, setClienteRut] = useState('');
    const [email, setEmail] = useState('');

    const [detallesVehiculo, setDetallesVehiculo] = useState('');
    const [fotos, setFotos] = useState<string[]>([]);
    const [isUploading, setIsUploading] = useState(false);

    const [formaPago, setFormaPago] = useState('efectivo');
    const [repuestosOrden, setRepuestosOrden] = useState<RepuestoSeleccionado[]>([]);

    // Servicios Frecuentes V3
    const [serviciosFrecuentesDB, setServiciosFrecuentesDB] = useState<{ descripcion: string, precio_base: number }[]>([]);
    const [kmHabilitadoPorTaller, setKmHabilitadoPorTaller] = useState(false);

    const [servicios, setServicios] = useState<Servicio[]>([
        { descripcion: '', precio: '' },
    ]);
    const [focusTarget, setFocusTarget] = useState<FocusTarget>(null);

    const [isSubmitting, setIsSubmitting] = useState(false);
    const [isGuardando, setIsGuardando] = useState(false); // New state for saving
    const [successMsg, setSuccessMsg] = useState<string | null>(null);

    // Multi-step State
    const [step, setStep] = useState<'form' | 'checklist' | 'success'>('form');
    const [createdOrderId, setCreatedOrderId] = useState<string | null>(null);
    const [createdOrderDetails, setCreatedOrderDetails] = useState<{ ordenId: string; patente: string; vehiculo: string; } | null>(null);

    // Validation errors
    const [validationErrors, setValidationErrors] = useState<Record<string, boolean>>({});

    // Skip Checklist Modal
    const [showSkipModal, setShowSkipModal] = useState(false);
    const [skipPassword, setSkipPassword] = useState('');
    const [showSkipPassword, setShowSkipPassword] = useState(false);
    const [isVerifyingPassword, setIsVerifyingPassword] = useState(false);

    // Debt alert modal state
    const [isDebtModalOpen, setIsDebtModalOpen] = useState(false);
    const [debtData, setDebtData] = useState<{
        totalDebt: number;
        debtOrders: OrdenDB[];
        lastVisit?: { date: string; service: string };
    } | null>(null);

    // Mini-CRM: client alert banner
    const [clienteAlerta, setClienteAlerta] = useState<{
        nivel: 'AMARILLO' | 'ROJO';
        alias: string;
        notas_internas: string;
    } | null>(null);

    // Efecto para procesar params de URL (redirección desde Clientes)
    useEffect(() => {
        const patenteParam = searchParams.get('patente');
        const rutParam = searchParams.get('rut');

        if (patenteParam && !patente) {
            setPatente(patenteParam);
            // Pequeño delay para asegurar que el estado se actualice
            setTimeout(() => buscarPatente(patenteParam), 100);
        } else if (rutParam && !clienteRut) {
            setClienteRut(rutParam);
            setTimeout(() => buscarPorRut(rutParam), 100);
        }
    }, [searchParams]);

    // Load configuration on mount
    useEffect(() => {
        const storedMecanico = localStorage.getItem('mecanico_nombre');
        if (storedMecanico) setMecanico(storedMecanico);

        // Fetch Frequent Services from DB
        const fetchServicios = async () => {
            const data = await obtenerServiciosFrecuentes();
            if (data && data.length > 0) {
                setServiciosFrecuentesDB(data);
            } else {
                // Fallback defaults if DB is empty
                setServiciosFrecuentesDB([
                    { descripcion: 'DPF Electrónico', precio_base: 0 },
                    { descripcion: 'DPF Físico', precio_base: 0 },
                    { descripcion: 'Scanner', precio_base: 0 },
                    { descripcion: 'AdBlue OFF', precio_base: 0 },
                    { descripcion: 'Regeneración', precio_base: 0 },
                ]);
            }

            // Leer flag km_recepcion del taller para mostrar/ocultar botón KM
            if (user?.tallerId) {
                try {
                    const { supabase: sb } = await import('@/lib/supabase');
                    const { data: taller } = await sb.from('talleres').select('modulos_activos').eq('id', user.tallerId).single();
                    const modulos: string[] = taller?.modulos_activos || [];
                    setKmHabilitadoPorTaller(modulos.includes('km_recepcion'));
                } catch { /* sin bloquear */ }
            }
        };
        fetchServicios();
    }, []);
    useEffect(() => {
        // Si aún está cargando la sesión, esperamos
        if (isLoadingAuth) return;

        const citaId = searchParams.get('citaId');

        // Si NO hay citaId, nos aseguramos de apagar cualquier loading residual
        if (!citaId) {
            setLoading(false);
            return;
        }

        // Si hay citaId pero no tallerId (y ya cargó auth), algo anda mal o no es admin
        if (!user?.tallerId) {
            console.warn("⚠️ Cita detectada pero usuario sin tallerId listo.");
            setLoading(false);
            return;
        }

        async function loadCita() {
            try {
                setLoading(true);
                console.log("🔍 Iniciando carga de cita por ID:", citaId, "para taller:", user?.tallerId);

                const citas = await obtenerCitas(user?.tallerId);
                const cita = citas.find(c => String(c.id) === String(citaId));

                if (cita) {
                    const p = cita.patente_vehiculo || '';
                    setPatente(p);
                    setClienteNombre(cita.clientes?.nombre_completo || '');
                    setClienteWhatsapp(cita.clientes?.telefono || '');
                    setClienteRut(cita.clientes?.rut_dni || '');
                    setEmail(cita.clientes?.email || '');

                    if (cita.vehiculos) {
                        setMarca(cita.vehiculos.marca || '');
                        setModelo(cita.vehiculos.modelo || '');
                        setAnio(cita.vehiculos.anio || '');
                        setMotor(cita.vehiculos.motor || '');
                    }

                    const serviceDesc = cita.notas || cita.titulo || '';
                    if (serviceDesc) {
                        // Limpieza de metadatos (regex para "Servicios Solicitados:" y prefijos de vehículo)
                        let cleanText = serviceDesc;

                        // Si contiene el marcador específico "Servicios Solicitados:", extraemos lo que sigue
                        if (cleanText.includes("Servicios Solicitados:")) {
                            cleanText = cleanText.split("Servicios Solicitados:")[1].trim();
                        }
                        // Si no lo tiene pero tiene metadatos entre corchetes, los removemos
                        else if (cleanText.includes("]")) {
                            cleanText = cleanText.split("]").pop()?.trim() || cleanText;
                        }

                        const serviceParts = cleanText.split(',').map(s => s.trim());
                        const mappedServices = serviceParts.map(desc => ({ descripcion: desc, precio: '' }));
                        setServicios(mappedServices);
                    }

                    if (p) {
                        setTimeout(() => buscarPatente(p), 300);
                    }
                } else {
                    console.warn("⚠️ Cita no encontrada con ID:", citaId);
                }
            } catch (error) {
                console.error("🔥 Error CRÍTICO cargando Recepción:", error);
            } finally {
                setLoading(false);
            }
        }
        loadCita();
    }, [searchParams, user?.tallerId, isLoadingAuth]);




    // Ref para auto-focus en KM Actual
    const kmActualInputRef = useRef<HTMLInputElement>(null);

    const descRefs = useRef<Array<HTMLInputElement | null>>([]);
    const precioRefs = useRef<Array<HTMLInputElement | null>>([]);

    const total = useMemo(() => {
        const totalServicios = servicios.reduce((acc, s) => acc + parsePrecio(s.precio), 0);
        const totalRepuestos = repuestosOrden.reduce((acc, r) => acc + (r.precio_venta * r.cantidad), 0);
        return totalServicios + totalRepuestos;
    }, [servicios, repuestosOrden]);

    useEffect(() => {
        const id = window.setInterval(() => setFechaHora(nowCL()), 1000);
        return () => window.clearInterval(id);
    }, []);

    useEffect(() => {
        const raw = localStorage.getItem('usuario_actual');
        if (!raw) return;
        try {
            const u = JSON.parse(raw);
            setMecanico(u?.nombre_completo || u?.nombre || u?.email || 'Técnico en Turno');
        } catch {
            setMecanico(raw);
        }
    }, []);

    useEffect(() => {
        if (user?.name) {
            setMecanico(user.name);
        }
    }, [user?.name]);

    useEffect(() => {
        if (!focusTarget) return;
        const { index, field } = focusTarget;
        const el = field === 'precio' ? precioRefs.current[index] : descRefs.current[index];
        if (el) {
            el.focus();
            if (field === 'precio') el.select();
        }
        setFocusTarget(null);
    }, [focusTarget, servicios.length]);

    // Check for debts when phone number changes (after typing complete phone)
    useEffect(() => {
        const cleanPhone = clienteWhatsapp.replace(/\D/g, '');
        // Solo verificar si tiene al menos 8 dígitos
        if (cleanPhone.length >= 8 && user?.tallerId) {
            const timer = setTimeout(() => {
                checkForDebts(undefined, cleanPhone);
            }, 300);

            return () => clearTimeout(timer);
        }
    }, [clienteWhatsapp, user?.tallerId]);


    const handleRutKeyDown = (e: React.KeyboardEvent<HTMLInputElement>) => {
        if (e.key === 'Enter') {
            e.preventDefault();
            buscarPorRut();
        }
    };

    const buscarPorRut = async (rutOverride?: string) => {
        const r = (rutOverride || clienteRut).trim();
        if (!r) return;

        setIsBuscando(true);
        setEstadoBusqueda('🔍 Buscando cliente por RUT...');

        try {
            const cliente = await buscarClientePorRut(r);
            if (cliente) {
                setClienteNombre(cliente.nombre_completo);
                setClienteWhatsapp(cliente.telefono || '');
                setEmail(cliente.email || '');
                setClienteRut(cliente.rut_dni || '');
                if (cliente.nivel_alerta === 'AMARILLO' || cliente.nivel_alerta === 'ROJO') {
                    setClienteAlerta({ nivel: cliente.nivel_alerta, alias: cliente.alias || '', notas_internas: cliente.notas_internas || '' });
                } else {
                    setClienteAlerta(null);
                }
                setEstadoBusqueda(`✅ Cliente encontrado: ${cliente.nombre_completo}`);
            } else {
                setClienteAlerta(null);
                setEstadoBusqueda('⚠️ Cliente no encontrado. Completa los datos.');
            }
        } catch (error) {
            console.error('Error buscando cliente:', error);
            setEstadoBusqueda('❌ Error al buscar cliente.');
        } finally {
            setIsBuscando(false);
        }
    };

    const buscarPatente = async (patenteOverride?: string) => {
        const pInput = patenteOverride || patente;
        const p = normalizePatente(pInput);

        if (!patenteOverride) setPatente(p);

        if (!p) {
            setEstadoBusqueda('');
            setMarca('');
            setModelo('');
            setAnio('');
            setMotor('');
            setVehiculoLocked(false);
            return;
        }

        setIsBuscando(true);
        setEstadoBusqueda('🔍 Buscando patente...');

        try {
            // 1. Primero buscar en localStorage
            console.log(`[Búsqueda] Paso 1: Buscando ${p} en localStorage...`);
            // Pass user.tallerId explicitly to bypass server-side cookie check
            const vehiculoLocal = await buscarVehiculoPorPatente(p, user?.tallerId);
            if (vehiculoLocal) {
                console.log(`[Búsqueda] ✅ Encontrado en BD:`, vehiculoLocal);

                // Solo sobrescribir si los datos de la BD son válidos (no "Por definir")
                const marcaValida = vehiculoLocal.marca && vehiculoLocal.marca !== 'Por definir';
                const modeloValido = vehiculoLocal.modelo && vehiculoLocal.modelo !== 'Por definir';

                if (marcaValida) setMarca(vehiculoLocal.marca);
                if (modeloValido) setModelo(vehiculoLocal.modelo);
                if (vehiculoLocal.anio && vehiculoLocal.anio !== '2026') setAnio(vehiculoLocal.anio);
                if (vehiculoLocal.motor) setMotor(vehiculoLocal.motor);

                setVehiculoLocked(false);

                if (marcaValida && modeloValido) {
                    setEstadoBusqueda(`✅ Vehículo encontrado: ${vehiculoLocal.marca} ${vehiculoLocal.modelo} (${vehiculoLocal.anio})`);

                    // V3: Auto-fill client data + Mini-CRM alert
                    if (vehiculoLocal.clientes) {
                        const c = vehiculoLocal.clientes;
                        setClienteNombre(c.nombre_completo || '');
                        setClienteWhatsapp(c.telefono || '');
                        setEmail(c.email || '');
                        setClienteRut(c.rut_dni || '');
                        if (c.nivel_alerta === 'AMARILLO' || c.nivel_alerta === 'ROJO') {
                            setClienteAlerta({ nivel: c.nivel_alerta, alias: c.alias || '', notas_internas: c.notas_internas || '' });
                        } else {
                            setClienteAlerta(null);
                        }
                        console.log('👤 Datos de cliente auto-completados:', c.nombre_completo);
                    }

                    // Check for debts
                    checkForDebts(p);
                } else {
                    setEstadoBusqueda(`⚠️ Vehículo encontrado pero sin datos completos. Completa manualmente.`);
                }

                setIsBuscando(false);
                return;
            }
            console.log(`[Búsqueda] ❌ No encontrado en localStorage`);

            // 2. Si no está en localStorage, consultar GetAPI
            console.log(`[Búsqueda] Paso 2: Verificando configuración de GetAPI...`);
            const apiConfigured = isGetAPIConfigured();
            console.log(`[Búsqueda] GetAPI configurada: ${apiConfigured}`);

            if (apiConfigured) {
                try {
                    console.log(`[Búsqueda] Consultando GetAPI para patente ${p}...`);
                    const vehiculoAPI = await consultarPatenteGetAPI(p);
                    if (vehiculoAPI) {
                        console.log(`[Búsqueda] ✅ Encontrado en GetAPI:`, vehiculoAPI);
                        setMarca(vehiculoAPI.marca);
                        setModelo(vehiculoAPI.modelo);
                        setAnio(vehiculoAPI.anio);
                        setMotor(vehiculoAPI.motor || '');
                        setVehiculoLocked(false);
                        setEstadoBusqueda(`✅ Vehículo encontrado en GetAPI: ${vehiculoAPI.marca} ${vehiculoAPI.modelo} (${vehiculoAPI.anio})`);

                        // Check for debts
                        checkForDebts(p);

                        setIsBuscando(false);
                        return;
                    }
                    console.log(`[Búsqueda] ❌ No encontrado en GetAPI`);
                } catch (error) {
                    // Si hay error de API (límite, key inválida, etc), mostrar mensaje pero continuar con fallback
                    console.error(`[Búsqueda] ⚠️ Error en GetAPI:`, error);
                    if (error instanceof Error) {
                        setEstadoBusqueda(`⚠️ GetAPI no disponible. Completa los datos manualmente.`);
                    }
                }
            } else {
                console.warn(`[Búsqueda] ⚠️ GetAPI no configurada.`);
                setEstadoBusqueda(`⚠️ GetAPI no configurada. Completa los datos manualmente.`);
            }

            // 3. Fallback a datos mock (para testing)
            const found = MOCK_DB[p];
            if (found) {
                setMarca(found.marca);
                setModelo(found.modelo);
                setAnio(found.anio);
                setMotor(found.motor);
                setVehiculoLocked(false);
                setEstadoBusqueda(`✅ Vehículo encontrado (datos de prueba): ${found.marca} ${found.modelo} (${found.anio})`);

                // Check for debts
                checkForDebts(p);
            } else {
                // 4. No encontrado en ningún lado
                setMarca('');
                setModelo('');
                setAnio('');
                setMotor('');
                setVehiculoLocked(false);
                setEstadoBusqueda('❌ Patente no encontrada. Completa los datos manualmente.');
            }
        } finally {
            setIsBuscando(false);
        }
    };

    // Check for debts after finding vehicle or entering phone
    const checkForDebts = async (patente?: string, phone?: string) => {
        if (!user?.tallerId) return;
        try {
            console.log(`[Debt Check] Checking debts for patente: ${patente}, phone: ${phone}`);
            // Pasamos user.tallerId aquí también
            const allOrders = await obtenerOrdenes(undefined, undefined, user.tallerId);

            // Filter orders for this patente OR phone
            const vehicleOrders = allOrders.filter(order => {
                const matchesPatente = patente && order.patente_vehiculo?.toUpperCase() === patente.toUpperCase();
                const matchesPhone = phone && order.cliente_telefono &&
                    order.cliente_telefono.replace(/\D/g, '') === phone.replace(/\D/g, '');
                return matchesPatente || matchesPhone;
            });

            // V3 Debt check
            const ordersWithDebt = vehicleOrders.filter(order => {
                // Check if 'debe' is in metodo_pago (string) or implied
                // Cast to any to avoid strict type mismatch if using legacy types locally
                const o = order as any;
                if (o.metodo_pago === 'debe') return true;
                if (o.metodos_pago && Array.isArray(o.metodos_pago)) {
                    return o.metodos_pago.some((mp: any) => mp.metodo === 'debe');
                }
                return false;
            });

            const totalDebt = ordersWithDebt.reduce((sum, order) => {
                const o = order as any;
                if (o.metodo_pago === 'debe') return sum + (o.precio_total || 0);
                // Legacy support
                if (o.metodos_pago) {
                    return sum + (o.metodos_pago.filter((mp: any) => mp.metodo === 'debe').reduce((a: number, b: any) => a + b.monto, 0) || 0);
                }
                return sum;
            }, 0);

            // Find last visit (most recent order)
            let lastVisit;
            if (vehicleOrders.length > 0) {
                const sorted = [...vehicleOrders].sort((a, b) =>
                    new Date(b.fecha_ingreso).getTime() - new Date(a.fecha_ingreso).getTime()
                );
                const lastOrder = sorted[0];
                lastVisit = {
                    date: lastOrder.fecha_ingreso,
                    service: lastOrder.detalle_trabajos || lastOrder.descripcion_ingreso || 'Servicio no especificado'
                };
            }

            console.log(`[Debt Check] Found ${ordersWithDebt.length} orders with debt, total: $${totalDebt}`);

            // Show modal if there's debt or visit history
            if (totalDebt > 0 || lastVisit) {
                setDebtData({
                    totalDebt,
                    debtOrders: ordersWithDebt,
                    lastVisit
                });
                setIsDebtModalOpen(true);
            }
        } catch (error) {
            console.error('[Debt Check] Error checking debts:', error);
        }
    };


    const agregarFila = (prefill?: { descripcion?: string }) => {
        setServicios((prev) => {
            const next = [...prev, { descripcion: prefill?.descripcion || '', precio: '' }];
            const idx = next.length - 1;
            setFocusTarget({ index: idx, field: prefill?.descripcion ? 'precio' : 'desc' });
            return next;
        });
    };

    const activarServicioKm = () => {
        setKmEnabled(true);
        setServicios((prev) => {
            const emptyIndex = prev.findIndex((s) => {
                const d = s.descripcion.trim();
                const p = parsePrecio(s.precio);
                return !d && p === 0;
            });

            const kmDesc = buildKmServiceDescripcion(kmActual, kmNuevo);

            if (emptyIndex >= 0) {
                const next = prev.map((s, i) => (i === emptyIndex ? { ...s, descripcion: kmDesc } : s));
                setKmServiceIndex(emptyIndex);
                return next;
            }

            const next = [...prev, { descripcion: kmDesc, precio: '' }];
            const idx = next.length - 1;
            setKmServiceIndex(idx);
            return next;
        });

        // Auto-focus en KM Actual después de que el DOM se actualice
        setTimeout(() => {
            if (kmActualInputRef.current) {
                kmActualInputRef.current.scrollIntoView({ behavior: 'smooth', block: 'center' });
                kmActualInputRef.current.focus();
            }
        }, 100);
    };

    const desactivarServicioKm = () => {
        setKmEnabled(false);
        setKmActual('');
        setKmNuevo('');
        setServicios((prev) => {
            if (kmServiceIndex === null) return prev;
            const next = prev.filter((_, i) => i !== kmServiceIndex);
            return next.length ? next : [{ descripcion: '', precio: '' }];
        });
        setKmServiceIndex(null);
    };

    useEffect(() => {
        if (!kmEnabled) return;
        if (kmServiceIndex === null) return;

        setServicios((prev) => {
            if (kmServiceIndex < 0 || kmServiceIndex >= prev.length) return prev;
            const desired = buildKmServiceDescripcion(kmActual, kmNuevo);
            const current = prev[kmServiceIndex]?.descripcion || '';
            if (current === desired) return prev;
            return prev.map((s, i) => (i === kmServiceIndex ? { ...s, descripcion: desired } : s));
        });
    }, [kmEnabled, kmServiceIndex, kmActual, kmNuevo]);

    const agregarServicioFrecuente = (descripcion: string) => {
        const desc = descripcion.trim();
        if (!desc) return;

        setServicios((prev) => {
            const emptyIndex = prev.findIndex((s) => {
                const d = s.descripcion.trim();
                const p = parsePrecio(s.precio);
                return !d && p === 0;
            });

            if (emptyIndex >= 0) {
                const next = prev.map((s, i) => (i === emptyIndex ? { ...s, descripcion: desc } : s));
                setFocusTarget({ index: emptyIndex, field: 'precio' });
                return next;
            }

            const next = [...prev, { descripcion: desc, precio: '' }];
            setFocusTarget({ index: next.length - 1, field: 'precio' });
            return next;
        });
    };

    const eliminarFila = (index: number) => {
        setServicios((prev) => {
            const next = prev.filter((_, i) => i !== index);
            return next.length ? next : [{ descripcion: '', precio: '' }];
        });

        if (kmServiceIndex !== null) {
            if (index === kmServiceIndex) {
                setKmEnabled(false);
                setKmActual('');
                setKmNuevo('');
                setKmServiceIndex(null);
            } else if (index < kmServiceIndex) {
                setKmServiceIndex(kmServiceIndex - 1);
            }
        }
    };

    const updateServicio = (index: number, patch: Partial<Servicio>) => {
        setServicios((prev) => prev.map((s, i) => (i === index ? { ...s, ...patch } : s)));
    };

    // ─── Shared order creation logic ──────────────────────────────────────
    const buildOrdenPayload = () => {
        const p = normalizePatente(patente);
        const serviciosForOrder = servicios
            .map((s) => ({ descripcion: s.descripcion.trim(), precio: parsePrecio(s.precio) }))
            .filter((s) => s.descripcion || s.precio);

        const shortDescription = serviciosForOrder
            .map((s) => {
                const d = (s.descripcion || '').toUpperCase();
                if (d.includes('KM') || d.includes('KILOMETRAJE')) return 'KM';
                if (d.includes('DPF')) return 'DPF';
                if (d.includes('SCANNER')) return 'Scanner';
                if (d.includes('ADBLUE')) return 'AdBlue';
                if (d.includes('EGR')) return 'EGR';
                if (d.includes('REGENERACION') || d.includes('REGENERACIÓN')) return 'Regeneración';
                return s.descripcion;
            })
            .filter((value, index, self) => self.indexOf(value) === index)
            .join(', ');

        const detalleServicios = serviciosForOrder
            .map((s) => `- ${s.descripcion || 'Servicio'}: $${moneyCL(s.precio)}`)
            .join('\n');

        const whatsappCompleto = clienteWhatsapp ? `+569${clienteWhatsapp}` : undefined;

        return { p, serviciosForOrder, shortDescription, detalleServicios, whatsappCompleto };
    };

    const validateForm = (): boolean => {
        const p = normalizePatente(patente);
        const errors: Record<string, boolean> = {};
        const missing: string[] = [];

        if (!p) { errors['patente'] = true; missing.push('Patente del vehículo'); }
        if (!marca || marca === 'Por definir') { errors['marca'] = true; missing.push('Marca'); }
        if (!modelo || modelo === 'Por definir') { errors['modelo'] = true; missing.push('Modelo'); }
        if (!anio) { errors['anio'] = true; missing.push('Año'); }

        if (!clienteWhatsapp || clienteWhatsapp.length < 9) {
            errors['whatsapp'] = true;
            missing.push('Número de WhatsApp (9 dígitos)');
        }

        if (kmEnabled) {
            if (!kmActual || parsePrecio(kmActual) <= 0) { errors['kmActual'] = true; missing.push('KM Actual'); }
            if (!kmNuevo || parsePrecio(kmNuevo) <= 0) { errors['kmNuevo'] = true; missing.push('KM Nuevo'); }
        }

        const serviciosValidos = servicios.filter(s => s.descripcion.trim() || parsePrecio(s.precio) > 0);
        if (serviciosValidos.length === 0) { errors['servicios'] = true; missing.push('Al menos un servicio'); }

        setValidationErrors(errors);

        if (missing.length > 0) {
            const { toast } = require('sonner');
            toast.error(`Faltan campos obligatorios: ${missing.join(', ')}.`, { duration: 4000 });
            return false;
        }
        return true;
    };

    const ejecutarCreacionOrden = async (): Promise<{ orderId: string } | null> => {
        const { p, serviciosForOrder, shortDescription, detalleServicios, whatsappCompleto } = buildOrdenPayload();
        try {
            const orden = await crearOrden({
                patente_vehiculo: p,
                descripcion_ingreso: shortDescription,
                detalle_trabajos: detalleServicios,
                creado_por: user!.id,
                estado: 'pendiente',
                asignado_a: user!.id,
                cliente_nombre: clienteNombre || undefined,
                cliente_telefono: whatsappCompleto,
                cliente_email: email || undefined,
                cliente_rut: clienteRut || undefined,
                vehiculo_marca: String(marca).trim(),
                vehiculo_modelo: String(modelo).trim(),
                vehiculo_anio: String(anio).trim(),
                vehiculo_motor: motor ? String(motor).trim() : undefined,
                vehiculo_color: vehiculoColor ? String(vehiculoColor).trim() : '-',
                precio_total: total || undefined,
                fotos: fotos.length ? fotos : undefined,
                detalles_vehiculo: (kilometrajeIngreso ? `[KM: ${kilometrajeIngreso}]\n` : '') + detallesVehiculo.trim() || undefined,
            } as any, user?.tallerId);

            if (!orden) return null;

            // --- PROCESAMIENTO DE INVENTARIO ---
            if (repuestosOrden.length > 0 && user?.tallerId) {
                try {
                    // 1. Tabla puente
                    const repuestosPayload = repuestosOrden.map(r => ({
                        orden_id: orden.id,
                        producto_id: r.id,   // campo principal (lectura en ordenes/page.tsx)
                        repuesto_id: r.id,   // alias (compatibilidad con clean/page.tsx)
                        cantidad: r.cantidad,
                        precio_unitario: r.precio_venta
                    }));
                    await supabase.from('orden_repuestos').insert(repuestosPayload);

                    // 2. Histórico de Movimientos y Descuento de Stock
                    for (const r of repuestosOrden) {
                        await supabase.from('movimientos_inventario').insert({
                            producto_id: r.id,
                            taller_id: user.tallerId,
                            tipo_movimiento: 'SALIDA',
                            cantidad: r.cantidad,
                            nota: `Uso en Orden #${orden.id}`,
                            usuario_id: user.id
                        });

                        const { data: prod } = await supabase.from('productos').select('stock_actual').eq('id', r.id).single();
                        if (prod) {
                            await supabase.from('productos').update({ stock_actual: Math.max(0, (prod.stock_actual || 0) - r.cantidad) }).eq('id', r.id);
                        }
                    }
                } catch (inventarioErr) {
                    console.error('Error procesando inventario:', inventarioErr);
                }
            }

            // Update appointment if came from one
            const currentCitaId = searchParams.get('citaId');
            if (currentCitaId) {
                await actualizarCita(Number(currentCitaId), { estado: 'confirmada' }).catch(console.error);
            }

            // Register frequent services usage asynchronously
            registrarUsoServicios(serviciosForOrder, user?.tallerId).catch(err =>
                console.error('Error registrando uso de servicios:', err)
            );

            // Inject into React Query cache
            queryClient.setQueryData(['orders', 'infinite'], (oldData: any) => {
                if (!oldData || !oldData.pages) return oldData;
                const newPages = [...oldData.pages];
                if (newPages.length > 0) {
                    newPages[0] = { ...newPages[0], orders: [orden, ...newPages[0].orders] };
                }
                return { ...oldData, pages: newPages };
            });
            queryClient.invalidateQueries({ queryKey: ['orders'], exact: false });
            queryClient.invalidateQueries({ queryKey: ['dashboard_orders'], exact: false });
            queryClient.invalidateQueries({ queryKey: ['appointments'], exact: false });

            // Store details for success screen
            setCreatedOrderDetails({
                ordenId: orden.id.toString(),
                patente: p,
                vehiculo: `${marca} ${modelo} (${anio})`,
            });

            return { orderId: orden.id.toString() };
        } catch (error) {
            console.error('Error al crear orden:', error);
            return null;
        }
    };

    const handleNextStep = async () => {
        if (!user) {
            const { toast } = require('sonner');
            toast.error('Sesión no encontrada. Inicia sesión nuevamente.');
            return;
        }
        if (!validateForm()) return;

        setIsGuardando(true);
        try {
            const result = await ejecutarCreacionOrden();
            if (!result) {
                const { toast } = require('sonner');
                toast.error('No se pudo crear la orden. Intenta nuevamente.');
                return;
            }
            setCreatedOrderId(result.orderId);
            setStep('checklist');
            window.scrollTo(0, 0);
        } finally {
            setIsGuardando(false);
        }
    };

    // Skip checklist: verify user password via Supabase then create order directly
    const handleSkipChecklist = async () => {
        if (!user?.email || !skipPassword) {
            const { toast } = require('sonner');
            toast.error('Ingresa tu contraseña para confirmar.');
            return;
        }

        setIsVerifyingPassword(true);
        try {
            const { error } = await supabase.auth.signInWithPassword({
                email: user.email,
                password: skipPassword,
            });

            if (error) {
                const { toast } = require('sonner');
                toast.error('Contraseña incorrecta. No se puede omitir el checklist.');
                setSkipPassword('');
                return;
            }

            // Password OK → close modal and create order
            setShowSkipModal(false);
            setSkipPassword('');
            setIsGuardando(true);

            const result = await ejecutarCreacionOrden();
            if (!result) {
                const { toast } = require('sonner');
                toast.error('No se pudo crear la orden. Intenta nuevamente.');
                return;
            }
            setCreatedOrderId(result.orderId);
            setStep('success'); // ← skip checklist, go to success screen
            window.scrollTo(0, 0);
        } finally {
            setIsVerifyingPassword(false);
            setIsGuardando(false);
        }
    };

    const limpiar = () => {
        setPatente('');
        setMarca('');
        setModelo('');
        setAnio('');
        setMotor('');
        setVehiculoColor('');
        setKmEnabled(false);
        setKmActual('');
        setKmNuevo('');
        setKmServiceIndex(null);
        setVehiculoLocked(true);
        setEstadoBusqueda('');
        setClienteNombre('');
        setClienteWhatsapp('');
        setClienteRut('');
        setEmail('');
        setDetallesVehiculo('');
        setFotos([]);
        setServicios([{ descripcion: '', precio: '' }]);
        setClienteAlerta(null);
        setStep('form');
        setCreatedOrderId(null);
        setCreatedOrderDetails(null);
        setValidationErrors({});
    };




    // Paso 1: Destruye el bloqueo condicional (Render)
    if (loading) {
        return (
            <div className="min-h-screen bg-[#0B1121]">
                <SkeletonRecepcion />
            </div>
        );
    }

    // ── Success Screen ────────────────────────────────────────────────────
    if (step === 'success' && createdOrderDetails) {
        const whatsappMsg = encodeURIComponent(
            `Hola ${clienteNombre || 'cliente'} 👋, tu vehículo *${createdOrderDetails.vehiculo}* (patente *${createdOrderDetails.patente}*) ha sido recibido en nuestro taller. Te mantendremos informado del progreso. Si tienes dudas, escríbenos aquí mismo.`
        );
        const whatsappUrl = clienteWhatsapp
            ? `https://wa.me/569${clienteWhatsapp}?text=${whatsappMsg}`
            : null;

        return (
            <div className="mx-auto max-w-lg px-4 py-10 flex flex-col items-center">
                {/* Success card */}
                <div className="w-full rounded-3xl bg-slate-900 border border-slate-700 shadow-2xl px-6 py-8 flex flex-col items-center text-center">

                    {/* Icon */}
                    <div className="w-20 h-20 bg-green-500/20 border-2 border-green-500 rounded-full flex items-center justify-center mb-5">
                        <CheckCircle2 className="w-10 h-10 text-green-400" />
                    </div>

                    <h1 className="text-3xl font-black text-white mb-1">¡Orden Registrada!</h1>
                    <p className="text-slate-300 font-semibold text-base mb-1">{createdOrderDetails.vehiculo}</p>
                    <p className="text-2xl font-black text-blue-400 tracking-widest mb-6">{createdOrderDetails.patente}</p>

                    {/* Tracking value proposition */}
                    <div className="w-full rounded-2xl bg-slate-800 border border-slate-700 px-5 py-4 mb-5 text-left">
                        <p className="text-xs font-black tracking-widest text-green-400 uppercase mb-2">✨ Servicio Premium del Taller</p>
                        <p className="text-sm text-slate-200 font-semibold leading-relaxed">
                            Envíale al cliente el <span className="text-white font-black">tracking en vivo</span> de su reparación. Sabrá exactamente en qué etapa está su auto, sin necesidad de llamar.
                        </p>
                        <p className="text-xs text-slate-400 mt-2">
                            Más transparencia = más confianza = más clientes que vuelven.
                        </p>
                    </div>

                    {/* WhatsApp CTA */}
                    {whatsappUrl ? (
                        <a
                            href={whatsappUrl}
                            target="_blank"
                            rel="noopener noreferrer"
                            className="w-full flex items-center justify-center gap-3 rounded-2xl bg-green-500 hover:bg-green-400 active:scale-95 transition-all px-6 py-5 text-lg font-black text-white shadow-lg shadow-green-900/40 mb-2"
                        >
                            <MessageCircle className="w-6 h-6" />
                            Compartir Tracking con el Cliente
                        </a>
                    ) : (
                        <div className="w-full rounded-2xl bg-slate-700 border border-slate-600 px-6 py-4 text-slate-300 text-sm mb-2 text-center">
                            Sin número de WhatsApp — no se puede enviar el tracking.
                        </div>
                    )}

                    {whatsappUrl && (
                        <p className="text-xs text-slate-400 mb-6">
                            Evita llamadas preguntando por el auto.{' '}
                            <span className="text-green-400 font-semibold">Envíale el seguimiento ahora.</span>
                        </p>
                    )}

                    {/* Secondary actions */}
                    <div className="w-full flex flex-col sm:flex-row gap-3">
                        <button
                            onClick={() => router.push('/admin/ordenes')}
                            className="flex-1 flex items-center justify-center gap-2 rounded-xl bg-slate-700 border border-slate-600 px-4 py-3 font-semibold text-slate-200 hover:bg-slate-600 transition-colors"
                        >
                            <ClipboardCheck className="w-4 h-4" />
                            Ir a Órdenes
                        </button>
                        <button
                            onClick={limpiar}
                            className="flex-1 flex items-center justify-center gap-2 rounded-xl bg-blue-600 px-4 py-3 font-bold text-white hover:bg-blue-500 transition-colors"
                        >
                            Nueva Recepción
                        </button>
                    </div>
                </div>
            </div>
        );
    }


    // Renderizado del Checklist (solo si el módulo está activo)
    if (step === 'checklist' && createdOrderId) {
        // Si el taller no tiene el módulo checklist activo, saltamos directo al éxito
        if (!hasChecklist) {
            return (
                <div className="mx-auto max-w-lg px-4 py-10 flex flex-col items-center">
                    <div className="w-full rounded-3xl bg-slate-900 border border-slate-700 shadow-2xl px-6 py-8 flex flex-col items-center text-center">
                        <div className="w-16 h-16 bg-green-500/20 border-2 border-green-500 rounded-full flex items-center justify-center mb-4">
                            <CheckCircle2 className="w-8 h-8 text-green-400" />
                        </div>
                        <h2 className="text-2xl font-black text-white mb-2">¡Orden registrada con éxito!</h2>
                        <p className="text-slate-400 text-sm mb-6">El vehículo fue recibido. El checklist no está habilitado para este taller.</p>
                        <button
                            onClick={limpiar}
                            className="w-full rounded-xl bg-blue-600 px-4 py-3 font-bold text-white hover:bg-blue-500 transition-colors"
                        >
                            Nueva Recepción
                        </button>
                    </div>
                </div>
            );
        }

        return (
            <div className="mx-auto max-w-2xl px-4 py-8">
                <div className="mb-6 bg-white p-6 rounded-2xl shadow-sm border border-slate-200">
                    <h2 className="text-2xl font-black text-slate-900 mb-2">Checklist de Ingreso 📝</h2>
                    <p className="text-slate-600 font-medium">Completa la inspección visual del vehículo.</p>
                </div>

                <div className="bg-slate-900/50 rounded-2xl border border-slate-800 p-6">
                    <ChecklistForm
                        orderId={createdOrderId}
                        onClose={async () => {
                            queryClient.invalidateQueries({ queryKey: ['orders'] });
                            queryClient.invalidateQueries({ queryKey: ['dashboard_orders'] });
                            setStep('success');
                            window.scrollTo(0, 0);
                        }}
                    />
                </div>
            </div>
        );
    }


    // Renderizado original (Formulario)
    return (
        <div className="mx-auto max-w-5xl space-y-6 px-4 md:px-0">
            {successMsg ? (
                <div className="fixed top-20 left-4 right-4 md:left-1/2 md:-translate-x-1/2 md:w-auto z-50">
                    <div className="bg-gradient-to-r from-green-500 to-emerald-600 text-white px-6 py-3 rounded-xl shadow-xl flex items-center gap-2">
                        <span className="font-semibold">{successMsg}</span>
                    </div>
                </div>
            ) : null}

            <div className="rounded-2xl bg-gradient-to-br from-blue-700 to-blue-900 px-4 py-4 md:px-6 md:py-5 shadow">
                <div className="text-lg md:text-xl font-bold text-white">Nueva Orden de Trabajo</div>
                <div className="mt-1 text-xs md:text-sm text-blue-100">{fechaHora}</div>
            </div>

            <div className="rounded-2xl border border-slate-200 bg-white p-5 shadow-sm">
                <div className="mb-4 text-xs font-semibold tracking-widest text-slate-500">RESPONSABLES</div>
                <label className="text-sm font-semibold text-slate-700">Mecánico Responsable</label>
                <input
                    value={mecanico}
                    readOnly
                    className="mt-2 w-full rounded-xl border border-slate-300 bg-slate-50 px-4 py-3 text-slate-900"
                />
                <div className="mt-2 text-xs text-slate-500">Se completa automáticamente con el usuario actual (si existe).</div>
            </div>

            <div className="rounded-2xl border border-slate-200 bg-white p-5 shadow-sm">
                <div className="mb-4 text-xs font-semibold tracking-widest text-slate-500">VEHÍCULO</div>

                <div className="grid gap-3 md:grid-cols-[1fr_auto] md:items-end">
                    <div>
                        <label className="text-sm font-semibold text-slate-700">Patente</label>
                        <input
                            value={patente}
                            onChange={(e) => { setPatente(normalizePatente(e.target.value)); setValidationErrors(p => ({...p, patente: false})); }}
                            onKeyDown={(e) => {
                                if (e.key === 'Enter') {
                                    e.preventDefault();
                                    buscarPatente();
                                }
                            }}
                            placeholder="AA-BB-11"
                            className={`mt-2 w-full rounded-xl border bg-slate-50 px-4 py-3 md:py-4 text-center font-mono text-xl md:text-2xl font-bold uppercase tracking-widest text-slate-900 placeholder:text-slate-400 ${
                                validationErrors['patente'] ? 'border-red-500 ring-1 ring-red-500' : 'border-slate-300'
                            }`}
                            maxLength={6}
                        />
                        <div className="mt-2 text-xs text-slate-500">Ejemplos: PROFE1, BBBB10, TEST01</div>
                    </div>

                    <button
                        type="button"
                        onClick={() => buscarPatente()}
                        disabled={isBuscando}
                        className="h-[50px] md:h-[54px] rounded-xl bg-blue-600 px-6 md:px-8 font-semibold text-white hover:bg-blue-700 disabled:opacity-50 disabled:cursor-not-allowed whitespace-nowrap"
                    >
                        {isBuscando ? '🔄 Buscando...' : '🔍 Buscar'}
                    </button>
                </div>

                {estadoBusqueda ? (
                    <div className={`mt-3 p-3 rounded-xl border text-sm font-medium ${estadoBusqueda.includes('❌') ? 'bg-red-500/10 border-red-500/30 text-red-400' :
                        estadoBusqueda.includes('✅') ? 'bg-green-500/10 border-green-500/30 text-green-400' :
                            'bg-blue-500/10 border-blue-500/30 text-blue-400'
                        }`}>
                        {estadoBusqueda}
                    </div>
                ) : null}

                <div className="mt-5 grid gap-4 md:grid-cols-2">
                    <div>
                        <label className="text-sm font-semibold text-slate-700">Marca</label>
                        <input
                            value={marca}
                            onChange={(e) => { setMarca(e.target.value); setValidationErrors(p => ({...p, marca: false})); }}
                            placeholder="Ej: Toyota, Chevrolet"
                            className={`mt-2 w-full rounded-xl border bg-slate-50 px-4 py-3 text-slate-900 placeholder:text-slate-400 ${
                                validationErrors['marca'] ? 'border-red-500 ring-1 ring-red-500' : 'border-slate-300'
                            }`}
                        />
                    </div>
                    <div>
                        <label className="text-sm font-semibold text-slate-700">Modelo</label>
                        <input
                            value={modelo}
                            onChange={(e) => { setModelo(e.target.value); setValidationErrors(p => ({...p, modelo: false})); }}
                            placeholder="Ej: Corolla, Sail"
                            className={`mt-2 w-full rounded-xl border bg-slate-50 px-4 py-3 text-slate-900 placeholder:text-slate-400 ${
                                validationErrors['modelo'] ? 'border-red-500 ring-1 ring-red-500' : 'border-slate-300'
                            }`}
                        />
                    </div>
                    <div>
                        <label className="text-sm font-semibold text-slate-700">Año</label>
                        <input
                            value={anio}
                            onChange={(e) => { setAnio(e.target.value); setValidationErrors(p => ({...p, anio: false})); }}
                            placeholder="Ej: 2020"
                            className={`mt-2 w-full rounded-xl border bg-slate-50 px-4 py-3 text-slate-900 placeholder:text-slate-400 ${
                                validationErrors['anio'] ? 'border-red-500 ring-1 ring-red-500' : 'border-slate-300'
                            }`}
                        />
                    </div>
                    <div>
                        <label className="text-sm font-semibold text-slate-700">Motor</label>
                        <input
                            value={motor}
                            onChange={(e) => setMotor(e.target.value)}
                            placeholder="Ej: 1.4, 1.6 Twin Cam"
                            className="mt-2 w-full rounded-xl border border-slate-300 bg-slate-50 px-4 py-3 text-slate-900 placeholder:text-slate-400 focus:border-blue-500 focus:ring-1 focus:ring-blue-500 outline-none transition-all"
                        />
                    </div>
                    <div>
                        <label className="text-sm font-semibold text-slate-700">Color</label>
                        <input
                            value={vehiculoColor}
                            onChange={(e) => setVehiculoColor(e.target.value)}
                            placeholder="Ej: Rojo, Blanco, Gris"
                            className="mt-2 w-full rounded-xl border border-slate-300 bg-slate-50 px-4 py-3 text-slate-900 placeholder:text-slate-400 focus:border-blue-500 focus:ring-1 focus:ring-blue-500 outline-none transition-all"
                        />
                    </div>
                    <div>
                        <label className="text-sm font-semibold text-slate-700">Kilometraje de Ingreso</label>
                        <input
                            value={kilometrajeIngreso}
                            onChange={(e) => setKilometrajeIngreso(e.target.value)}
                            placeholder="Ej: 120.500 km"
                            className="mt-2 w-full rounded-xl border border-slate-300 bg-slate-50 px-4 py-3 text-slate-900 placeholder:text-slate-400 focus:border-blue-500 focus:ring-1 focus:ring-blue-500 outline-none transition-all"
                        />
                    </div>
                </div>
            </div>

            <div className="rounded-2xl border border-slate-200 bg-white p-5 shadow-sm">
                <div className="mb-4 text-xs font-semibold tracking-widest text-slate-500">CLIENTE</div>


                {/* ── Mini-CRM Alert Banner (requires clientes.mini_crm flag) ── */}
                {hasMiniCrm && clienteAlerta && (
                    <div className={`mb-4 flex items-start gap-3 rounded-xl border-2 p-4 ${
                        clienteAlerta.nivel === 'ROJO'
                            ? 'border-red-500 bg-red-500/10'
                            : 'border-amber-400 bg-amber-400/10'
                    }`}>
                        <span className="text-2xl mt-0.5 shrink-0">{clienteAlerta.nivel === 'ROJO' ? '🚨' : '⚠️'}</span>
                        <div className="flex-1 min-w-0">
                            <div className={`font-black text-sm uppercase tracking-wider mb-0.5 ${
                                clienteAlerta.nivel === 'ROJO' ? 'text-red-400' : 'text-amber-400'
                            }`}>
                                {clienteAlerta.nivel === 'ROJO' ? 'Cliente con Alerta Roja' : 'Cliente con Precaución'}
                                {clienteAlerta.alias && (
                                    <span className="ml-2 normal-case font-semibold opacity-80">— «{clienteAlerta.alias}»</span>
                                )}
                            </div>
                            {clienteAlerta.notas_internas && (
                                <p className="text-sm text-slate-300 leading-snug">{clienteAlerta.notas_internas}</p>
                            )}
                        </div>
                    </div>
                )}

                <div className="grid gap-4 md:grid-cols-2">
                    <div>
                        <label className="text-sm font-semibold text-slate-700">Receptor (Nombre)</label>
                        <input
                            value={clienteNombre}
                            onChange={(e) => setClienteNombre(e.target.value)}
                            placeholder="Nombre del cliente"
                            className="mt-2 w-full rounded-xl border border-slate-700 bg-slate-50 px-4 py-3 text-slate-900 placeholder:text-slate-400"
                        />
                    </div>
                    <div>
                        <label className="text-sm font-semibold text-slate-700">RUT / DNI</label>
                        <input
                            value={clienteRut}
                            onChange={(e) => setClienteRut(e.target.value)}
                            onKeyDown={handleRutKeyDown}
                            onBlur={() => buscarPorRut()}
                            className="mt-2 w-full rounded-xl border border-slate-700 bg-slate-50 px-4 py-3 text-slate-900 placeholder:text-slate-400"
                            placeholder="12.345.678-9"
                        />
                        <div className="mt-1 text-xs text-slate-500 text-right">Presiona Enter para buscar</div>
                    </div>
                    <div>
                        <label className="text-sm font-semibold text-slate-700">WhatsApp <span className="text-red-400">*</span></label>
                        <div className="relative mt-2">
                            <div className="pointer-events-none absolute inset-y-0 left-0 flex items-center pl-4">
                                <span className="text-slate-400">+56</span>
                            </div>
                            <input
                                value={clienteWhatsapp}
                                onChange={(e) => {
                                    let numeros = e.target.value.replace(/[^0-9]/g, '');
                                    if (numeros.startsWith('56')) {
                                        numeros = numeros.slice(2);
                                    }
                                    setClienteWhatsapp(numeros.slice(0, 9));
                                    setValidationErrors(p => ({...p, whatsapp: false}));
                                }}
                                inputMode="numeric"
                                placeholder="912345678"
                                className={`w-full rounded-xl border bg-slate-50 py-3 pl-12 pr-4 text-slate-900 placeholder:text-slate-400 ${
                                    validationErrors['whatsapp'] ? 'border-red-500 ring-1 ring-red-500' : 'border-slate-300'
                                }`}
                            />
                        </div>
                        <div className="mt-2 text-xs text-slate-500">Obligatorio para enviar el tracking al cliente.</div>
                    </div>
                    <div>
                        <label className="text-sm font-semibold text-slate-700">Email (Opcional)</label>
                        <input
                            value={email}
                            onChange={(e) => setEmail(e.target.value)}
                            placeholder="cliente@email.com"
                            type="email"
                            className="mt-2 w-full rounded-xl border border-slate-700 bg-slate-50 px-4 py-3 text-slate-900 placeholder:text-slate-400"
                        />
                    </div>
                </div>
            </div>

            <div className="rounded-2xl border border-slate-200 bg-white p-5 shadow-sm">
                <div className="mb-4 text-xs font-semibold tracking-widest text-slate-500">SERVICIOS</div>

                <div className="mb-4 flex flex-wrap gap-2">
                    {/* Botón KM: solo visible si el admin habilitó km_recepcion en Perfil Taller */}
                    {kmHabilitadoPorTaller && (
                        <button
                            type="button"
                            onClick={() => (kmEnabled ? desactivarServicioKm() : activarServicioKm())}
                            className={
                                kmEnabled
                                    ? 'rounded-full border border-blue-500 bg-blue-600/30 px-3 py-2 text-sm font-semibold text-blue-100'
                                    : 'rounded-full border border-slate-700 bg-slate-800/70 px-3 py-2 text-sm font-semibold text-slate-700 hover:bg-slate-700'
                            }
                        >
                            🔘 KM
                        </button>
                    )}
                    {serviciosFrecuentesDB.slice(0, showAllServices ? undefined : 8).map((s) => (
                        <button
                            key={s.descripcion}
                            type="button"
                            onClick={() => agregarServicioFrecuente(s.descripcion)}
                            className="rounded-full border border-slate-700 bg-slate-800/70 px-3 py-2 text-sm font-semibold text-slate-700 hover:bg-slate-700 transition-colors"
                        >
                            🔘 {s.descripcion}
                        </button>
                    ))}
                    {serviciosFrecuentesDB.length > 8 && (
                        <button
                            type="button"
                            onClick={() => setShowAllServices(!showAllServices)}
                            className="rounded-full border border-dashed border-slate-500 bg-slate-800/60 px-3 py-2 text-sm font-semibold text-white hover:bg-slate-700 hover:border-slate-400 transition-colors"
                        >
                            {showAllServices ? 'Ver menos' : `+${serviciosFrecuentesDB.length - 8} más`}
                        </button>
                    )}
                </div>

                {kmEnabled ? (
                    <div className="mb-4 grid gap-4 rounded-xl border border-slate-700 bg-slate-800/30 p-4 md:grid-cols-2">
                        <div>
                            <label className="text-sm font-semibold text-slate-700">KM actual</label>
                            <input
                                ref={kmActualInputRef}
                                value={formatMilesConPunto(kmActual)}
                                onChange={(e) => setKmActual(e.target.value.replace(/[^0-9]/g, '').slice(0, 7))}
                                inputMode="numeric"
                                placeholder="Ej: 200.000"
                                className="mt-2 w-full rounded-xl border border-slate-700 bg-slate-800/50 px-4 py-3 text-2xl font-bold font-mono tracking-wide text-white"
                            />
                        </div>
                        <div>
                            <label className="text-sm font-semibold text-slate-700">KM nuevo</label>
                            <input
                                value={formatMilesConPunto(kmNuevo)}
                                onChange={(e) => setKmNuevo(e.target.value.replace(/[^0-9]/g, '').slice(0, 7))}
                                inputMode="numeric"
                                placeholder="Ej: 120.000"
                                className="mt-2 w-full rounded-xl border border-slate-700 bg-slate-800/50 px-4 py-3 text-2xl font-bold font-mono tracking-wide text-white"
                            />
                        </div>
                        <div className="md:col-span-2 text-xs text-slate-400">
                            Se agrega como servicio cobrable. Define el precio en la fila de KM.
                        </div>
                    </div>
                ) : null}

                <div className="overflow-hidden rounded-xl border border-slate-700">
                    <table className="w-full">
                        <thead className="bg-slate-800/70">
                            <tr>
                                <th className="px-3 py-3 text-left text-xs font-semibold tracking-widest text-slate-300">DESCRIPCIÓN</th>
                                <th className="px-3 py-3 text-left text-xs font-semibold tracking-widest text-slate-300">PRECIO ($)</th>
                                <th className="px-3 py-3 text-right text-xs font-semibold tracking-widest text-slate-300">ACCIÓN</th>
                            </tr>
                        </thead>
                        <tbody className="divide-y divide-slate-700">
                            {servicios.map((s, idx) => (
                                <tr key={idx} className="bg-slate-900/40">
                                    <td className="px-3 py-3">
                                        <input
                                            ref={(r) => {
                                                descRefs.current[idx] = r;
                                            }}
                                            value={s.descripcion}
                                            onChange={(e) => updateServicio(idx, { descripcion: e.target.value })}
                                            placeholder="Ej: Scanner"
                                            className="w-full rounded-xl border border-slate-700 bg-slate-800/50 px-3 py-3 text-white"
                                        />
                                    </td>
                                    <td className="px-3 py-3">
                                        <input
                                            ref={(r) => {
                                                precioRefs.current[idx] = r;
                                            }}
                                            value={s.precio}
                                            onChange={(e) => updateServicio(idx, { precio: e.target.value.replace(/[^0-9]/g, '').slice(0, 9) })}
                                            inputMode="numeric"
                                            placeholder="0"
                                            className="w-full rounded-xl border border-slate-700 bg-slate-800/50 px-3 py-3 text-white"
                                        />
                                    </td>
                                    <td className="px-3 py-3 text-right">
                                        <button
                                            type="button"
                                            onClick={() => eliminarFila(idx)}
                                            className="rounded-xl bg-red-600 px-3 py-3 text-sm font-semibold text-white hover:bg-red-700"
                                        >
                                            Eliminar
                                        </button>
                                    </td>
                                </tr>
                            ))}
                        </tbody>
                    </table>
                </div>

                <div className="mt-4 flex flex-col gap-3 rounded-xl border border-dashed border-slate-700 bg-slate-800/30 p-4 md:flex-row md:items-center md:justify-between">
                    <div>
                        <div className="text-xs font-semibold tracking-widest text-slate-300">TOTAL</div>
                        <div className="text-2xl font-extrabold text-white">${moneyCL(total)}</div>
                    </div>
                    <button
                        type="button"
                        onClick={() => agregarFila()}
                        className="rounded-xl bg-blue-600 px-4 py-3 font-semibold text-white hover:bg-blue-700"
                    >
                        + Agregar Servicio
                    </button>
                </div>
            </div>

            {hasInventario && (
                <div className="rounded-2xl border border-slate-200 bg-white p-5 shadow-sm">
                    <div className="mb-4 text-xs font-semibold tracking-widest text-slate-500">📦 MATERIALES Y REPUESTOS (Opcional)</div>
                    <BuscadorInventario onChange={setRepuestosOrden} />
                </div>
            )}

            <div className="rounded-2xl border border-slate-200 bg-white p-5 shadow-sm">
                <div className="mb-4 text-xs font-semibold tracking-widest text-slate-500">DETALLES DEL VEHÍCULO</div>
                <label className="text-sm font-semibold text-slate-700">Descripción general</label>
                <textarea
                    value={detallesVehiculo}
                    onChange={(e) => setDetallesVehiculo(e.target.value)}
                    placeholder="Ej: ruido al encender, vibración, luces de tablero, etc."
                    className="mt-2 min-h-[120px] w-full rounded-xl border border-slate-300 bg-slate-50 px-4 py-3 text-slate-900"
                />

                <div className="mt-5">
                    <label className="text-sm font-semibold text-slate-700 block mb-2">Imágenes</label>
                    <input
                        type="file"
                        id="file-upload"
                        accept="image/*"
                        multiple
                        onChange={async (e) => {
                            const files = Array.from(e.target.files || []);
                            if (!files.length) return;
                            setIsUploading(true);
                            try {
                                // Comprimir imágenes antes de subir
                                const compressedFiles = await Promise.all(files.map(comprimirImagen));
                                const uploads = await Promise.all(compressedFiles.map((f) => subirImagen(f, 'ordenes')));
                                const ok = uploads.filter(Boolean) as string[];
                                setFotos((prev) => [...prev, ...ok]);
                            } finally {
                                setIsUploading(false);
                                e.target.value = '';
                            }
                        }}
                        className="hidden"
                    />
                    <input
                        type="file"
                        id="camera-capture"
                        accept="image/*"
                        capture="environment"
                        onChange={async (e) => {
                            const files = Array.from(e.target.files || []);
                            if (!files.length) return;
                            setIsUploading(true);
                            try {
                                // Comprimir imágenes antes de subir
                                const compressedFiles = await Promise.all(files.map(comprimirImagen));
                                const uploads = await Promise.all(compressedFiles.map((f) => subirImagen(f, 'ordenes')));
                                const ok = uploads.filter(Boolean) as string[];
                                setFotos((prev) => [...prev, ...ok]);
                            } finally {
                                setIsUploading(false);
                                e.target.value = '';
                            }
                        }}
                        className="hidden"
                    />
                    <div className="flex flex-col sm:flex-row gap-3">
                        <label
                            htmlFor="file-upload"
                            className="flex-1 inline-flex items-center justify-center gap-2 rounded-xl border-2 border-dashed border-slate-600 bg-slate-800/50 px-6 py-4 font-semibold text-slate-200 hover:bg-slate-700/50 hover:border-slate-500 cursor-pointer transition-all"
                        >
                            <svg className="w-5 h-5" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                                <path strokeLinecap="round" strokeLinejoin="round" strokeWidth={2} d="M4 16l4.586-4.586a2 2 0 012.828 0L16 16m-2-2l1.586-1.586a2 2 0 012.828 0L20 14m-6-6h.01M6 20h12a2 2 0 002-2V6a2 2 0 00-2-2H6a2 2 0 00-2 2v12a2 2 0 002 2z" />
                            </svg>
                            <span>Seleccionar imágenes</span>
                        </label>
                        <label
                            htmlFor="camera-capture"
                            className="flex-1 inline-flex items-center justify-center gap-2 rounded-xl border-2 border-dashed border-blue-600 bg-blue-800/30 px-6 py-4 font-semibold text-blue-200 hover:bg-blue-700/50 hover:border-blue-500 cursor-pointer transition-all"
                        >
                            <svg className="w-5 h-5" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                                <path strokeLinecap="round" strokeLinejoin="round" strokeWidth={2} d="M3 9a2 2 0 012-2h.93a2 2 0 001.664-.89l.812-1.22A2 2 0 0110.07 4h3.86a2 2 0 011.664.89l.812 1.22A2 2 0 0018.07 7H19a2 2 0 012 2v9a2 2 0 01-2 2H5a2 2 0 01-2-2V9z" />
                                <path strokeLinecap="round" strokeLinejoin="round" strokeWidth={2} d="M15 13a3 3 0 11-6 0 3 3 0 016 0z" />
                            </svg>
                            <span>Tomar foto</span>
                        </label>
                    </div>
                    {isUploading ? <div className="mt-2 text-xs text-slate-500">Subiendo imágenes...</div> : null}

                    {fotos.length ? (
                        <div className="mt-4 grid grid-cols-2 gap-3 md:grid-cols-4">
                            {fotos.map((src, idx) => (
                                <div key={idx} className="rounded-xl border border-slate-700 bg-slate-800/30 p-2">
                                    <img src={src} alt={`foto-${idx}`} className="h-28 w-full rounded-lg object-cover" />
                                    <button
                                        type="button"
                                        onClick={() => setFotos((prev) => prev.filter((_, i) => i !== idx))}
                                        className="mt-2 w-full rounded-lg bg-red-600 px-2 py-2 text-xs font-semibold text-white hover:bg-red-700"
                                    >
                                        Quitar
                                    </button>
                                </div>
                            ))}
                        </div>
                    ) : null}
                </div>
            </div>

            {/* ── Action buttons ── */}
            <div className="flex flex-col gap-3 pb-10">
                {/* Primary CTA */}
                <button
                    type="button"
                    onClick={handleNextStep}
                    disabled={isGuardando}
                    className="w-full flex items-center justify-center gap-2 rounded-2xl bg-blue-600 px-5 py-4 text-lg font-bold text-white hover:bg-blue-500 active:scale-95 transition-all disabled:opacity-60"
                >
                    {isGuardando ? (
                        <><Loader2 className="h-5 w-5 animate-spin" />Procesando...</>
                    ) : (
                        <>Siguiente: Checklist <ArrowRight className="w-5 h-5" /></>
                    )}
                </button>

                {/* Skip Checklist shortcut */}
                <button
                    type="button"
                    onClick={() => {
                        if (!validateForm()) return;
                        setShowSkipModal(true);
                    }}
                    disabled={isGuardando}
                    className="w-full flex items-center justify-center gap-2 rounded-2xl bg-amber-500 hover:bg-amber-400 active:scale-95 transition-all px-5 py-4 text-base font-black text-slate-900 shadow-md shadow-amber-900/30 disabled:opacity-60"
                >
                    <ShieldCheck className="w-5 h-5" />
                    ⚡ Crear orden sin Checklist
                </button>

                {/* Clear */}
                <button
                    type="button"
                    onClick={limpiar}
                    className="text-center text-xs text-slate-500 hover:text-slate-300 py-1 transition-colors"
                >
                    🗑️ Limpiar formulario
                </button>
            </div>

            {/* Debt Alert Modal */}
            {debtData && (
                <DebtAlertModal
                    isOpen={isDebtModalOpen}
                    onClose={() => setIsDebtModalOpen(false)}
                    onProceed={() => {
                        console.log('[Debt Modal] User chose to proceed anyway');
                    }}
                    patente={patente}
                    totalDebt={debtData.totalDebt}
                    debtOrders={debtData.debtOrders}
                    lastVisit={debtData.lastVisit}
                />
            )}

            {/* Skip Checklist Modal */}
            {showSkipModal && (
                <div className="fixed inset-0 z-50 flex items-center justify-center bg-black/70 px-4 backdrop-blur-sm">
                    <div className="w-full max-w-sm rounded-2xl border border-slate-700 bg-slate-900 p-6 shadow-2xl">
                        <div className="flex items-center gap-3 mb-4">
                            <div className="w-10 h-10 rounded-xl bg-amber-500/20 flex items-center justify-center">
                                <ShieldCheck className="w-5 h-5 text-amber-400" />
                            </div>
                            <div>
                                <h3 className="text-base font-black text-white">Confirmar identidad</h3>
                                <p className="text-xs text-slate-400">Ingresa tu contraseña para omitir el checklist</p>
                            </div>
                        </div>

                        <p className="text-sm text-slate-400 mb-4 bg-amber-500/10 border border-amber-500/30 rounded-xl px-4 py-3">
                            ⚠️ Esto quedará registrado. Solo omite si el cliente no puede esperar la inspección.
                        </p>

                        <div className="relative mb-4">
                            <input
                                type={showSkipPassword ? 'text' : 'password'}
                                value={skipPassword}
                                onChange={(e) => setSkipPassword(e.target.value)}
                                onKeyDown={(e) => e.key === 'Enter' && handleSkipChecklist()}
                                placeholder="Tu contraseña personal"
                                className="w-full rounded-xl border border-slate-600 bg-slate-800 px-4 py-3 pr-12 text-white placeholder:text-slate-500 focus:border-amber-500 outline-none"
                                autoFocus
                            />
                            <button
                                type="button"
                                onClick={() => setShowSkipPassword(v => !v)}
                                className="absolute right-3 top-1/2 -translate-y-1/2 text-slate-400 hover:text-white"
                            >
                                <EyeOff className="w-4 h-4" />
                            </button>
                        </div>

                        <div className="flex gap-3">
                            <button
                                type="button"
                                onClick={() => { setShowSkipModal(false); setSkipPassword(''); }}
                                className="flex-1 rounded-xl border border-slate-600 bg-slate-800 px-4 py-3 font-semibold text-slate-300 hover:bg-slate-700 transition-colors"
                            >
                                Cancelar
                            </button>
                            <button
                                type="button"
                                onClick={handleSkipChecklist}
                                disabled={isVerifyingPassword || !skipPassword}
                                className="flex-1 rounded-xl bg-amber-500 px-4 py-3 font-bold text-slate-900 hover:bg-amber-400 disabled:opacity-50 transition-colors"
                            >
                                {isVerifyingPassword ? (
                                    <Loader2 className="w-4 h-4 animate-spin mx-auto" />
                                ) : 'Confirmar y Crear'}
                            </button>
                        </div>
                    </div>
                </div>
            )}
        </div>
    );
}

const SkeletonRecepcion = () => (
    <div className="max-w-4xl mx-auto p-6 space-y-6 animate-pulse">
        <div className="flex justify-between items-center mb-8">
            <div className="h-8 w-48 bg-slate-700/50 rounded-lg" />
            <div className="h-8 w-32 bg-slate-700/50 rounded-lg" />
        </div>
        <div className="grid grid-cols-1 md:grid-cols-2 gap-6">
            <div className="space-y-4">
                <div className="h-20 bg-slate-800/50 rounded-2xl" />
                <div className="h-20 bg-slate-800/50 rounded-2xl" />
                <div className="h-20 bg-slate-800/50 rounded-2xl" />
            </div>
            <div className="space-y-4">
                <div className="h-64 bg-slate-800/50 rounded-2xl" />
            </div>
        </div>
    </div>
);

export default function RecepcionPage() {
    return (
        <Suspense fallback={<SkeletonRecepcion />}>
            <RecepcionContent />
        </Suspense>
    );
}

