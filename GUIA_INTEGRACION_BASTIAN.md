# 📚 Guía de Integración para Bastián - API Multi-Tenant

## Resumen

Estas son las **3 funciones mágicas** que puedes usar en el frontend para consumir datos del taller. Todas están **filtradas automáticamente** por taller, así que no tienes que preocuparte por eso.

---

## 1. `getTallerInfo(id)` - Información del Taller

### ¿Para qué sirve?
Obtener los datos del taller (nombre, logo, dirección, teléfono) para mostrar en la landing page o header.

### Uso

```typescript
import { getTallerInfo } from '@/lib/taller-actions'

// En tu componente
const taller = await getTallerInfo('uuid-del-taller')

console.log(taller.nombre)      // "Electromecánica JR"
console.log(taller.logo_url)    // URL del logo
console.log(taller.direccion)   // "Calle Falsa 123"
console.log(taller.telefono)    // "+56912345678"
```

### Ejemplo en React

```tsx
'use client'

import { getTallerInfo } from '@/lib/taller-actions'
import { useEffect, useState } from 'react'

export default function TallerHeader() {
  const [taller, setTaller] = useState(null)

  useEffect(() => {
    getTallerInfo('00000000-0000-0000-0000-000000000001')
      .then(setTaller)
  }, [])

  if (!taller) return <div>Cargando...</div>

  return (
    <header>
      <img src={taller.logo_url} alt={taller.nombre} />
      <h1>{taller.nombre}</h1>
      <p>{taller.direccion}</p>
      <p>{taller.telefono}</p>
    </header>
  )
}
```

---

## 2. `getAutoByPatente(patente)` - Buscar Auto

### ¿Para qué sirve?
Buscar un vehículo por patente y obtener:
- Datos del auto (marca, modelo, año, color)
- Datos del dueño (nombre, teléfono)
- Órdenes activas (estado, descripción, precio)

### Uso

```typescript
import { getAutoByPatente } from '@/lib/taller-actions'

// Buscar auto
const auto = await getAutoByPatente('ABC123')

if (auto) {
  console.log(auto.marca)                        // "Toyota"
  console.log(auto.modelo)                       // "Corolla"
  console.log(auto.clientes.nombre_completo)     // "Juan Pérez"
  console.log(auto.ordenes.length)               // 2 órdenes activas
  console.log(auto.ordenes[0].estado)            // "en_progreso"
  console.log(auto.ordenes[0].precio_total)      // 150000
} else {
  console.log('Auto no encontrado en este taller')
}
```

### Ejemplo: Página de Búsqueda para Cliente

```tsx
'use client'

import { getAutoByPatente } from '@/lib/taller-actions'
import { useState } from 'react'

export default function BuscarAutoPage() {
  const [patente, setPatente] = useState('')
  const [auto, setAuto] = useState(null)
  const [loading, setLoading] = useState(false)

  const buscar = async () => {
    setLoading(true)
    const resultado = await getAutoByPatente(patente)
    setAuto(resultado)
    setLoading(false)
  }

  return (
    <div className="container">
      <h1>Busca tu Auto</h1>
      
      <input
        type="text"
        placeholder="Ingresa tu patente (ej: ABC123)"
        value={patente}
        onChange={(e) => setPatente(e.target.value.toUpperCase())}
      />
      
      <button onClick={buscar} disabled={loading}>
        {loading ? 'Buscando...' : 'Buscar'}
      </button>

      {auto && (
        <div className="resultado">
          <h2>{auto.marca} {auto.modelo} ({auto.anio})</h2>
          <p>Dueño: {auto.clientes.nombre_completo}</p>
          <p>Teléfono: {auto.clientes.telefono}</p>
          
          <h3>Órdenes Activas</h3>
          {auto.ordenes.map((orden) => (
            <div key={orden.id} className="orden-card">
              <p><strong>Estado:</strong> {orden.estado}</p>
              <p><strong>Descripción:</strong> {orden.descripcion_ingreso}</p>
              <p><strong>Precio:</strong> ${orden.precio_total.toLocaleString()}</p>
              
              {/* Barra de progreso según estado */}
              <div className="progress-bar">
                {orden.estado === 'pendiente' && <div className="progress" style={{width: '25%'}} />}
                {orden.estado === 'en_progreso' && <div className="progress" style={{width: '50%'}} />}
                {orden.estado === 'completada' && <div className="progress" style={{width: '100%'}} />}
              </div>
            </div>
          ))}
        </div>
      )}

      {auto === null && !loading && (
        <p>No se encontró el vehículo. Verifica la patente.</p>
      )}
    </div>
  )
}
```

---

## 3. `createCita(datos)` - Crear Cita

### ¿Para qué sirve?
Permitir que un cliente agende una cita desde la landing page.

### Uso

```typescript
import { createCita } from '@/lib/taller-actions'

// Crear cita
await createCita({
  titulo: 'Revisión técnica',
  fecha_inicio: '2026-02-15T10:00:00',
  fecha_fin: '2026-02-15T11:00:00',
  cliente_nombre: 'Juan Pérez',
  cliente_telefono: '+56912345678',
  patente_vehiculo: 'ABC123',
  notas: 'Cliente prefiere mañana'
})
```

### Ejemplo: Formulario de Agendamiento

```tsx
'use client'

import { createCita } from '@/lib/taller-actions'
import { useState } from 'react'

export default function AgendarCitaPage() {
  const [form, setForm] = useState({
    nombre: '',
    telefono: '',
    patente: '',
    fecha: '',
    hora: '',
    servicio: ''
  })
  const [success, setSuccess] = useState(false)

  const handleSubmit = async (e) => {
    e.preventDefault()
    
    try {
      await createCita({
        titulo: form.servicio,
        fecha_inicio: `${form.fecha}T${form.hora}:00`,
        fecha_fin: `${form.fecha}T${form.hora}:00`, // Ajustar según duración
        cliente_nombre: form.nombre,
        cliente_telefono: form.telefono,
        patente_vehiculo: form.patente,
        notas: `Servicio solicitado: ${form.servicio}`
      })
      
      setSuccess(true)
      setForm({ nombre: '', telefono: '', patente: '', fecha: '', hora: '', servicio: '' })
    } catch (error) {
      alert('Error al agendar cita: ' + error.message)
    }
  }

  return (
    <div className="container">
      <h1>Agenda tu Cita</h1>
      
      {success && (
        <div className="alert alert-success">
          ✅ Cita agendada exitosamente. Te contactaremos pronto.
        </div>
      )}

      <form onSubmit={handleSubmit}>
        <input
          type="text"
          placeholder="Tu nombre"
          value={form.nombre}
          onChange={(e) => setForm({...form, nombre: e.target.value})}
          required
        />
        
        <input
          type="tel"
          placeholder="Tu teléfono (+56912345678)"
          value={form.telefono}
          onChange={(e) => setForm({...form, telefono: e.target.value})}
          required
        />
        
        <input
          type="text"
          placeholder="Patente de tu vehículo"
          value={form.patente}
          onChange={(e) => setForm({...form, patente: e.target.value.toUpperCase()})}
          required
        />
        
        <select
          value={form.servicio}
          onChange={(e) => setForm({...form, servicio: e.target.value})}
          required
        >
          <option value="">Selecciona un servicio</option>
          <option value="Revisión técnica">Revisión técnica</option>
          <option value="Cambio de aceite">Cambio de aceite</option>
          <option value="Alineación y balanceo">Alineación y balanceo</option>
          <option value="Diagnóstico general">Diagnóstico general</option>
        </select>
        
        <input
          type="date"
          value={form.fecha}
          onChange={(e) => setForm({...form, fecha: e.target.value})}
          required
        />
        
        <input
          type="time"
          value={form.hora}
          onChange={(e) => setForm({...form, hora: e.target.value})}
          required
        />
        
        <button type="submit">Agendar Cita</button>
      </form>
    </div>
  )
}
```

---

## Tipos TypeScript

```typescript
// Tipos disponibles (ya están en lib/supabase.ts)
import type { TallerDB, VehiculoDB, ClienteDB, OrdenDB, CitaDB } from '@/lib/supabase'

// Ejemplo de uso
const taller: TallerDB = await getTallerInfo('uuid')
const auto: VehiculoDB | null = await getAutoByPatente('ABC123')
```

---

## Notas Importantes

1. **Todas las funciones filtran automáticamente por taller** - No necesitas pasar `taller_id` manualmente
2. **Las funciones son Server Actions** - Usan `'use server'` internamente
3. **Manejo de errores** - Siempre usa `try/catch` para capturar errores
4. **Patentes** - Se normalizan automáticamente (mayúsculas, sin espacios)

---

## Preguntas Frecuentes

### ¿Cómo obtengo el UUID del taller?
Ejecuta en Supabase SQL Editor:
```sql
SELECT id, nombre FROM talleres;
```

### ¿Qué pasa si busco un auto que no existe?
`getAutoByPatente` retorna `null`

### ¿Puedo ver autos de otros talleres?
No, las funciones filtran automáticamente por el taller del usuario autenticado

---

¡Listo para integrar! 🚀
