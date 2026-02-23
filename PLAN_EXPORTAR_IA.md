# 🚀 Guía de Implementación para Exportar (Next.js + Supabase)

**Objetivo General:** Implementar 4 características principales en un proyecto similar basado en Next.js, React, Tailwind CSS y Supabase.

A continuación, se detalla el código y la lógica lista para ser adaptada e integrada por la IA en el nuevo proyecto.

---

## 📅 1. Filtros por Mes y Año en el Dashboard

**Objetivo:** Permitir al administrador visualizar las órdenes filtradas por mes y año, además de mostrar estadísticas actualizadas (totales y montos) para ese período.

### Componente de Filtro (`components/filters/date-range-filter.tsx`)

```tsx
'use client';
import { useState } from 'react';
import { Card, CardContent } from '@/components/ui/card';
import { Button } from '@/components/ui/button';
import { Calendar, X, DollarSign, FileText } from 'lucide-react';

export interface DateFilter {
    year?: number;
    month?: number;
    startDate?: Date;
    endDate?: Date;
}

interface DateRangeFilterProps {
    onFilterChange: (filter: DateFilter | null) => void;
    totalOrders: number;
    totalRevenue: number;
}

const MONTHS = [
    { value: 1, label: 'Enero' }, { value: 2, label: 'Febrero' }, { value: 3, label: 'Marzo' },
    { value: 4, label: 'Abril' }, { value: 5, label: 'Mayo' }, { value: 6, label: 'Junio' },
    { value: 7, label: 'Julio' }, { value: 8, label: 'Agosto' }, { value: 9, label: 'Septiembre' },
    { value: 10, label: 'Octubre' }, { value: 11, label: 'Noviembre' }, { value: 12, label: 'Diciembre' },
];

export function DateRangeFilter({ onFilterChange, totalOrders, totalRevenue }: DateRangeFilterProps) {
    const currentYear = new Date().getFullYear();
    const [selectedYear, setSelectedYear] = useState<number>(currentYear);
    const [selectedMonth, setSelectedMonth] = useState<number | null>(null);

    const handleApplyFilter = () => {
        if (!selectedYear) return;
        const filter: DateFilter = { year: selectedYear, month: selectedMonth || undefined };
        
        if (selectedMonth) {
            filter.startDate = new Date(selectedYear, selectedMonth - 1, 1);
            filter.endDate = new Date(selectedYear, selectedMonth, 0, 23, 59, 59);
        } else {
            filter.startDate = new Date(selectedYear, 0, 1);
            filter.endDate = new Date(selectedYear, 11, 31, 23, 59, 59);
        }
        onFilterChange(filter);
    };

    const handleClearFilter = () => {
        setSelectedYear(currentYear);
        setSelectedMonth(null);
        onFilterChange(null);
    };

    const years = Array.from({ length: 10 }, (_, i) => currentYear - i);

    return (
        <Card className="bg-[#1a1a1a] border-[#333333] mb-6">
            <CardContent className="p-4 space-y-4">
                <div className="flex items-center gap-2">
                    <Calendar className="w-5 h-5 text-[#0066FF]" />
                    <h3 className="text-white font-semibold">Filtrar por Fecha</h3>
                </div>
                <div className="grid grid-cols-1 sm:grid-cols-2 gap-3">
                    <div>
                        <label className="text-xs text-gray-400 mb-1 block">Año</label>
                        <select value={selectedYear} onChange={(e) => setSelectedYear(Number(e.target.value))} className="w-full bg-[#242424] border border-[#333333] rounded-lg px-3 py-2 text-white outline-none">
                            {years.map(year => <option key={year} value={year}>{year}</option>)}
                        </select>
                    </div>
                    <div>
                        <label className="text-xs text-gray-400 mb-1 block">Mes (Opcional)</label>
                        <select value={selectedMonth || ''} onChange={(e) => setSelectedMonth(e.target.value ? Number(e.target.value) : null)} className="w-full bg-[#242424] border border-[#333333] rounded-lg px-3 py-2 text-white outline-none">
                            <option value="">Todos los meses</option>
                            {MONTHS.map(month => <option key={month.value} value={month.value}>{month.label}</option>)}
                        </select>
                    </div>
                </div>
                <div className="flex gap-2">
                    <Button onClick={handleApplyFilter} className="flex-1 bg-[#0066FF] text-white">Aplicar</Button>
                    <Button onClick={handleClearFilter} variant="outline" className="border-[#333333] text-gray-400"><X className="w-4 h-4" /></Button>
                </div>
                <div className="pt-3 border-t border-[#333333] space-y-2">
                    <div className="flex justify-between text-sm text-gray-400"><span>Órdenes: {totalOrders}</span></div>
                    <div className="flex justify-between text-sm font-semibold text-green-400"><span>Ingresos: ${totalRevenue.toLocaleString()}</span></div>
                </div>
            </CardContent>
        </Card>
    );
}
```

### Hook de Filtrado (`hooks/use-date-filter.ts`)

```typescript
import { useState, useMemo } from 'react';
import type { DateFilter } from '@/components/filters/date-range-filter';

export function useDateFilter(allOrders: any[]) {
    const [dateFilter, setDateFilter] = useState<DateFilter | null>(null);

    const filteredOrders = useMemo(() => {
        if (!dateFilter || !dateFilter.startDate || !dateFilter.endDate) return allOrders;
        
        return allOrders.filter(order => {
            // Asegurarse de usar la fecha de ingreso de la base de datos
            const orderDate = new Date(order.fecha_ingreso || order.created_at);
            return orderDate >= dateFilter.startDate! && orderDate <= dateFilter.endDate!;
        });
    }, [allOrders, dateFilter]);

    return { dateFilter, setDateFilter, filteredOrders };
}
```

---

## 🔒 2. Restricción de Visibilidad: Mecánicos Ven Solo Sus Órdenes

**Objetivo:** Los administradores ven todas las órdenes del sistema. Los mecánicos solo pueden ver las órdenes en las que la columna `asignado_a` coincide con su `user.id`.

### Implementación en el Servicio de Supabase (`lib/supabase-service.ts`)

```typescript
export async function obtenerOrdenesSegunRol(userId: string, userRole: 'admin' | 'mecanico') {
    // Consulta base: Traer órdenes con sus relaciones
    let query = supabase
        .from('ordenes')
        .select(`
            *,
            vehiculos (*, clientes (*)),
            perfiles!asignado_a (nombre_completo)
        `)
        .order('fecha_ingreso', { ascending: false });

    // LÓGICA DE NEGOCIO CRÍTICA:
    // Si es mecánico, filtrar estrictamente para que solo vea las que tiene asignadas
    if (userRole === 'mecanico') {
        query = query.eq('asignado_a', userId);
    }

    const { data, error } = await query;
    if (error) throw error;
    
    return data;
}
```

> **📌 Nota para la IA:** Asegúrate de pasar el `user.id` y `user.rol` desde el contexto global de autenticación (`useAuth()`) hacia las funciones que cargan la tabla de órdenes en la interfaz.

---

## 👥 3. Administrador Agrega Nuevos Usuarios (Mecánicos)

**Objetivo:** Permitir que desde el propio sistema, el administrador cree usuarios en Supabase Auth y además les cree un perfil en la tabla de `perfiles`.

### Interfaz UI: Botón y Modal (`app/(dashboard)/admin/usuarios/page.tsx`)

```tsx
import { useState } from 'react';
import { Button } from '@/components/ui/button';
import { Dialog, DialogContent, DialogHeader, DialogTitle, DialogTrigger } from '@/components/ui/dialog';
import { Input } from '@/components/ui/input';
import { Select, SelectContent, SelectItem, SelectTrigger, SelectValue } from '@/components/ui/select';

// Importa tu función crearUsuario desde supabase-service.ts

// ... Dentro de tu componente de tabla de usuarios:
const [open, setOpen] = useState(false);
const [formData, setFormData] = useState({ email: '', password: '', nombre: '', rol: 'mecanico' });

const handleCreate = async () => {
    // Llama al backend service
    await crearUsuarioSistema(formData);
    setOpen(false);
    // Recargar tabla de usuarios
};

return (
    <Dialog open={open} onOpenChange={setOpen}>
        <DialogTrigger asChild>
            <Button>+ Crear Nuevo Usuario</Button>
        </DialogTrigger>
        <DialogContent>
            <DialogHeader><DialogTitle>Nuevo Usuario</DialogTitle></DialogHeader>
            <div className="space-y-4">
                <Input placeholder="Nombre Completo" onChange={e => setFormData({...formData, nombre: e.target.value})} />
                <Input type="email" placeholder="Email" onChange={e => setFormData({...formData, email: e.target.value})} />
                <Input type="password" placeholder="Contraseña (Mín. 6)" onChange={e => setFormData({...formData, password: e.target.value})} />
                <Select onValueChange={(val) => setFormData({...formData, rol: val})}>
                    <SelectTrigger><SelectValue placeholder="Selecciona Rol" /></SelectTrigger>
                    <SelectContent>
                        <SelectItem value="mecanico">Mecánico</SelectItem>
                        <SelectItem value="admin">Administrador</SelectItem>
                    </SelectContent>
                </Select>
                <Button onClick={handleCreate}>Crear</Button>
            </div>
        </DialogContent>
    </Dialog>
);
```

### Lógica de Backend Completa (`lib/supabase-service.ts`)

```typescript
export async function crearUsuarioSistema(datos: { email, password, nombre, rol }) {
    // 1. Crear usuario en Auth de Supabase
    const { data: authData, error: authError } = await supabase.auth.signUp({
        email: datos.email,
        password: datos.password,
    });
    
    if (authError) throw authError;
    const newUserId = authData.user?.id;
    
    if (!newUserId) throw new Error("No se obtuvo el ID del usuario creado.");

    // 2. Insertar el Perfil en la tabla 'perfiles' (vinculando el UUID)
    const { error: profileError } = await supabase
        .from('perfiles')
        .insert([{
            id: newUserId,
            email: datos.email,
            nombre_completo: datos.nombre,
            rol: datos.rol,
            activo: true
        }]);

    if (profileError) {
        // Rollback opcional si se quiere ser pulcro
        console.error("Error al crear perfil:", profileError);
        throw profileError;
    }
    
    return authData.user;
}
```

> **📌 Nota para la IA:** Recuerda que la tabla `perfiles` en PostgreSQL debe tener un campo `id` UUID PRIMARY KEY referenciando a `auth.users(id)`. Si tu base de datos tiene RLS (Row Level Security) activado de forma estricta, la creación del auth puede requerir el `SUPABASE_SERVICE_ROLE_KEY` en un entorno seguro de Server Action o Route Handler (App Router de Next.js), en lugar de ejecutarse del lado del cliente.

---

## 🛡️ 4. Sistema de Permisos de 3 Niveles (Super Admin, Admin, Mecánico)

**Objetivo:** Establecer una jerarquía de 3 niveles donde Juan (dueño) tiene control total absoluto, Rodrigo (coordinador/admin) puede gestionar el taller y flujo pero con algunas restricciones, y los mecánicos solo ven sus propios trabajos.

### Resumen de Permisos para la IA

*   **superadmin (El dueño / Juan)**:
    *   Puede ver TODO el sistema.
    *   Es el ÚNICO que puede crear/eliminar/editar a otros administradores o superadmins.
    *   Acceso a ajustes críticos o facturación.
*   **admin (Coordinador / Rodrigo)**:
    *   Puede ver todas las órdenes.
    *   Puede asignar órdenes a los mecánicos.
    *   Puede crear nuevos usuarios, pero únicamente con rol `mecanico`.
    *   NO puede eliminar ni editar a otros administradores ni al superadmin.
*   **mecanico (Ej: Francisco, Javier, Benjamín, Charlie)**:
    *   Solo pueden ver y editar las órdenes que les han sido asignadas.
    *   NO pueden acceder a la creación/gestión de usuarios.

### Implementación Técnica Sugerida

#### 1. Modificación en la Base de Datos (Supabase SQL)
Añade el nuevo rol al CHECK constraint de la tabla `perfiles`.

```sql
-- Si la tabla ya existe, alterar el constraint:
ALTER TABLE public.perfiles DROP CONSTRAINT IF EXISTS perfiles_rol_check;
ALTER TABLE public.perfiles ADD CONSTRAINT perfiles_rol_check CHECK (rol IN ('superadmin', 'admin', 'mecanico'));
```

#### 2. Restricción en el Componente de Creación de Usuarios (UI)
Actualizar el selector de roles para que las opciones dependan de quién está creando al usuario.

```tsx
// Dentro del formulario de creación de usuario en page.tsx
// Usando el contexto de Auth para saber quién está logueado:
const { user } = useAuth(); // asumiendo que user.rol está disponible

<Select onValueChange={(val) => setFormData({...formData, rol: val})}>
    <SelectTrigger><SelectValue placeholder="Selecciona Rol" /></SelectTrigger>
    <SelectContent>
        <SelectItem value="mecanico">Mecánico</SelectItem>
        
        {/* Solo el SuperAdmin puede crear a otros administradores */}
        {user?.rol === 'superadmin' && (
            <SelectItem value="admin">Administrador (Coordinador)</SelectItem>
        )}
        
        {/* Opcional: Solo si se requiere que hayan más SuperAdmins */}
        {user?.rol === 'superadmin' && (
            <SelectItem value="superadmin">Dueño (Super Admin)</SelectItem>
        )}
    </SelectContent>
</Select>
```

#### 3. Restricción a Nivel de Rutas (Middleware o Componente ProtectedRoute)

```tsx
const ProtectedRoute = ({ children, allowedRoles }: { children: React.ReactNode, allowedRoles: ('superadmin'|'admin'|'mecanico')[] }) => {
    const { user, loading } = useAuth();
    
    if (loading) return <Loading />;
    if (!user) return <Redirect to="/login" />;
    
    // Si el rol del usuario no está en la lista permitida para esta vista
    if (!allowedRoles.includes(user.rol)) {
        return <Redirect to="/unauthorized" />;
    }
    
    return <>{children}</>;
};

// Uso en la página de lista de todos los usuarios:
// Solo superadmin y admin pueden acceder a esta sección
<ProtectedRoute allowedRoles={['superadmin', 'admin']}>
    <UsuariosPage />
</ProtectedRoute>
```

#### 4. Restricción de Visibilidad de Menús (Navegación)

```tsx
{/* Menú visible para TODOS */}
<Link href="/mis-ordenes">Mis Órdenes</Link>

{/* Menú visible para Admins y SuperAdmins */}
{(user?.rol === 'admin' || user?.rol === 'superadmin') && (
    <>
        <Link href="/dashboard-general">Dashboard General</Link>
        <Link href="/gestion-usuarios">Gestión de Personal</Link>
    </>
)}

{/* Menú visible ÚNICAMENTE para el SuperAdmin (Dueño) */}
{user?.rol === 'superadmin' && (
    <Link href="/ajustes-empresa">Ajustes Críticos de la Empresa</Link>
)}
```
