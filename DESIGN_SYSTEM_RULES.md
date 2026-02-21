# FLUSIZE - SISTEMA DE DISEÑO & GUÍA PARA AGENTES (v0/Cursor)

## 🎨 Identidad Visual (La "Vibe" Flusize)
Estilo profesional, oscuro, confiable y tecnológico. No "futurista gamer", sino "herramienta de precisión".

### 🌑 Paleta de Colores
- **Fondo Principal:** `bg-slate-950` (No usar negro puro #000).
- **Paneles/Tarjetas:** `bg-slate-900/50` con borde `border-slate-800`.
- **Acento Principal:** `text-blue-500` / `bg-blue-600` (Botones primarios, enlaces).
- **Acento Secundario:** `text-cyan-400` (Iconos, estados activos).
- **Texto:**
  - Títulos: `text-slate-100`
  - Cuerpo: `text-slate-300`
  - Muted: `text-slate-500`
- **Estados:**
  - Éxito: `text-green-400` / `bg-green-500/10`
  - Error: `text-red-400` / `bg-red-500/10`
  - Alerta: `text-amber-400` / `bg-amber-500/10`

### 🧩 Componentes Base (Shadcn/UI)
Usar siempre componentes de `@/components/ui`:
- `Button`: Variants `default` (blue), `outline`, `ghost`.
- `Card`: Siempre con `border-slate-800 bg-slate-900/50`.
- `Input`: `bg-slate-950 border-slate-800 focus:ring-blue-500`.
- `Badge`: Para estados (Pendiente, Completado).

### 📐 Layout & Espaciado
- **Contenedor:** `max-w-7xl mx-auto p-4 md:p-6`.
- **Grillas:** `grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-6`.
- **Mobile First:** Todo debe ser full width en móvil y ajustarse en desktop.

## 🛠️ Reglas Técnicas para Agentes
1. **Tech Stack:** Next.js 14 (App Router), Tailwind CSS, Lucide React icons.
2. **Supabase:** Usar siempre cliente singleton de `@/lib/supabase`.
3. **Manejo de Errores:** Nunca dejar caer la app. Usar `try/catch` y `toast` para feedback.
4. **Dates:** Usar `date-fns` y locale `es` para fechas.
5. **Iconos:** Importar de `lucide-react`.

## 📦 Estructura de Datos (Core)
Al crear nuevas vistas, respetar estos tipos clave:
- `OrdenDB`: id, patente, estado, precio_total, created_at.
- `VehiculoDB`: patente, marca, modelo, anio.
- `ClienteDB`: nombre, telefono, email.

## 🚀 Performance
- Usar `useQuery` para data fetching.
- Evitar `useEffect` innecesarios.
- Componentes de servidor (RSC) donde sea posible.
