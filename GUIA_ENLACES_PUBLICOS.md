# 🔗 Sistema de Enlaces Públicos - Guía de Uso

## ¿Qué es esto?

Ahora cuando creas una orden, el sistema **genera automáticamente un enlace público** que puedes enviar al cliente por WhatsApp o Email.

---

## 🎯 Flujo Completo

### 1. El Mecánico Crea la Orden

```typescript
import { crearOrden } from '@/lib/supabase-service'

const nuevaOrden = await crearOrden({
  patente_vehiculo: 'ABCD12',
  descripcion_ingreso: 'Cambio de aceite',
  creado_por: userId,
  cliente_nombre: 'Brayan González',
  cliente_telefono: '+56912345678',
  cliente_email: 'brayan@gmail.com',
  vehiculo_marca: 'Toyota',
  vehiculo_modelo: 'Corolla',
  vehiculo_anio: '2015'
})

// La orden ahora incluye el enlace público
console.log(nuevaOrden.enlace_publico)
// "https://fluesize.com/taller/electromecanica-jr/orden/123"
```

### 2. Enviar Notificación al Cliente

**Por WhatsApp** (usando API de WhatsApp Business):
```
Hola Brayan 👋

Tu auto ABCD-12 ingresó a Electromecánica JR.

🔍 Mira el estado y fotos aquí:
https://fluesize.com/taller/electromecanica-jr/orden/123

¡Gracias por confiar en nosotros!
```

**Por Email**:
```html
<h2>Tu auto está en el taller</h2>
<p>Hola Brayan,</p>
<p>Tu vehículo <strong>ABCD-12</strong> ingresó a nuestro taller.</p>
<a href="https://fluesize.com/taller/electromecanica-jr/orden/123">
  Ver estado del vehículo
</a>
```

### 3. El Cliente Abre el Enlace

El cliente hace clic y ve:
- ✅ Logo y nombre del taller
- ✅ Estado actual de su auto (Pendiente, En Progreso, Completada)
- ✅ Barra de progreso visual
- ✅ Información del vehículo (marca, modelo, año, patente)
- ✅ Descripción del servicio
- ✅ Fotos del vehículo (si las subiste)
- ✅ Precio total
- ✅ **Botón "Crear Cuenta Gratis"** → Aquí capturamos al cliente

### 4. El Cliente Crea su Cuenta (El Gancho)

Cuando hace clic en "Crear Cuenta":
- Se registra en Fluesize (no solo en tu taller)
- Ahora puede ver el historial de TODOS sus autos en TODOS los talleres que usen Fluesize
- **Marketplace automático** 🎉

---

## 📱 Ejemplo de Vista Pública

La página pública se ve así:

```
┌─────────────────────────────────────────┐
│  [Logo] Electromecánica JR              │
│  Calle Falsa 123                        │
├─────────────────────────────────────────┤
│                                         │
│  Estado: EN PROGRESO                    │
│  Orden #123 | Toyota Corolla           │
│  ▓▓▓▓▓▓▓▓▓▓░░░░░░░░░░ 50%             │
│                                         │
│  Información del Vehículo               │
│  Patente: ABCD12                        │
│  Marca: Toyota                          │
│  Modelo: Corolla                        │
│  Año: 2015                              │
│                                         │
│  Detalles del Servicio                  │
│  Cambio de aceite y filtro              │
│                                         │
│  Fotos del Vehículo                     │
│  [📷] [📷] [📷]                         │
│                                         │
│  Total: $50.000                         │
│                                         │
│  ┌───────────────────────────────────┐ │
│  │ ¿Quieres historial de tus        │ │
│  │ mantenciones?                     │ │
│  │                                   │ │
│  │ [Crear Cuenta Gratis]            │ │
│  └───────────────────────────────────┘ │
└─────────────────────────────────────────┘
```

---

## 🔧 Funciones Disponibles

### 1. `generarEnlaceOrden(ordenId, tallerId)`

Genera el enlace público para compartir.

```typescript
import { generarEnlaceOrden } from '@/lib/public-actions'

const enlace = await generarEnlaceOrden(123, 'uuid-del-taller')
// "https://fluesize.com/taller/electromecanica-jr/orden/123"
```

### 2. `getOrdenPublica(ordenId, tallerSlug)`

Obtiene los datos de la orden para mostrar en la vista pública (sin autenticación).

```typescript
import { getOrdenPublica } from '@/lib/public-actions'

const resultado = await getOrdenPublica(123, 'electromecanica-jr')

console.log(resultado.orden.estado)        // "en_progreso"
console.log(resultado.taller.nombre)       // "Electromecánica JR"
console.log(resultado.orden.vehiculos.marca) // "Toyota"
```

### 3. `getTallerBySlug(slug)`

Obtiene información del taller por su slug (público).

```typescript
import { getTallerBySlug } from '@/lib/public-actions'

const taller = await getTallerBySlug('electromecanica-jr')
console.log(taller.nombre)    // "Electromecánica JR"
console.log(taller.logo_url)  // URL del logo
```

---

## 🚀 Próximos Pasos

### 1. Ejecutar Migración de Slug

```bash
# Ir a Supabase SQL Editor
# Copiar contenido de: supabase/migrations/20260211_add_slug_to_talleres.sql
# Ejecutar
```

### 2. Verificar que el Slug se Generó

```sql
SELECT id, nombre, slug FROM talleres;
```

Deberías ver algo como:
```
id  | nombre               | slug
----|---------------------|--------------------
... | Electromecánica JR  | electromecanica-jr
```

### 3. Probar la Vista Pública

1. Crea una orden nueva en tu dashboard
2. Copia el enlace que aparece en la consola
3. Abre el enlace en una ventana de incógnito (sin login)
4. Deberías ver la vista pública del auto

### 4. Integrar Notificaciones

**Opción A: WhatsApp Business API**
```typescript
// Después de crear la orden
if (nuevaOrden.enlace_publico) {
  await enviarWhatsApp(
    cliente.telefono,
    `Hola ${cliente.nombre}, tu auto ${patente} ingresó al taller. Ver estado: ${nuevaOrden.enlace_publico}`
  )
}
```

**Opción B: Email (usando Resend, SendGrid, etc.)**
```typescript
await enviarEmail({
  to: cliente.email,
  subject: 'Tu auto ingresó al taller',
  html: `<a href="${nuevaOrden.enlace_publico}">Ver estado</a>`
})
```

---

## 🎨 Personalización

### Cambiar Colores

Edita el archivo: `app/taller/[slug]/orden/[id]/page.tsx`

```tsx
// Cambiar color principal (azul → tu color)
className="bg-gradient-to-r from-blue-600 to-blue-700"
// Por ejemplo, a verde:
className="bg-gradient-to-r from-green-600 to-green-700"
```

### Agregar Más Información

Puedes agregar campos adicionales editando la misma página:

```tsx
{orden.kilometraje && (
  <div>
    <p className="text-sm text-gray-600">Kilometraje</p>
    <p className="font-semibold">{orden.kilometraje} km</p>
  </div>
)}
```

---

## 🔐 Seguridad

✅ **La vista pública NO requiere autenticación**  
✅ **Solo muestra información del auto, no datos sensibles del taller**  
✅ **El enlace es único por orden (no se puede adivinar)**  
✅ **RLS verifica que la orden pertenezca al taller correcto**

---

## 📊 Métricas que Puedes Rastrear

- Cuántos clientes abren el enlace
- Cuántos crean cuenta desde ahí
- Tiempo promedio entre envío y apertura
- Tasa de conversión a cuenta Fluesize

---

¡Listo! Ahora tienes el flujo completo de notificaciones al cliente 🎉
