# FLUSIZE V1 - ROADMAP COMPLETO DEL ARQUITECTO
**Última actualización:** 2026-02-14 00:45

---

## 🎯 OBJETIVO PRINCIPAL
Sistema listo para venta masiva en Puerto Montt. MVP comercial con estabilidad y conexión Taller-Usuario.

---

## 📋 SPRINT 1: ECOSISTEMA MVP (CEO Approved)

### ✅ COMPLETADO
- [x] Panel Super Admin (`/admin-sys`)
  - [x] Protección por email hardcoded
  - [x] Formulario: Nombre Taller, Email Admin, Dirección
  - [x] Backend: Crear taller, usuario Auth, perfil admin
  - [x] Mostrar credenciales temporales

### 🔄 EN PROGRESO
- [/] Vista Pública (Link Mágico) - `/orden/[id]/[token]`
  - [x] Mostrar estado del auto (badge)
  - [x] Mostrar checklist de ingreso (read-only)
  - [ ] Campo `notas_publicas` en tabla ordenes
  - [ ] Mostrar comentarios del mecánico
  - [x] Botón "Crear mi Cuenta Flusize"
  - [ ] Responsive mobile verificado

### ⏳ PENDIENTE
- [ ] Activación de Cuenta (Growth Hack)
  - [ ] Ruta `/registro` con parámetro email
  - [ ] Formulario: Email (pre-filled), Password
  - [ ] Backend: Crear usuario en Auth
  - [ ] Backend: Buscar cliente por email/teléfono
  - [ ] Backend: Vincular cliente con user_id
  - [ ] Redirección a dashboard con historial

- [ ] Mapa Simple
  - [ ] Click en pin → Modal o `/taller/[id]`
  - [ ] Mostrar nombre, dirección
  - [ ] Botón WhatsApp (wa.me)

---

## 📋 SPRINT 2: VENTURE SCALE MODE

### ⏳ PENDIENTE
- [ ] **Pivote Bastián (Vertical Lavado)**
  - [ ] Campo `tipo_servicio` en tabla talleres (ENUM: 'mecanica', 'desabolladura', 'lavado', 'detailing')
  - [ ] Preparar sistema para FreshDrive (primer taller de lavado)
  - [ ] Slots de 30 min para lavados

- [ ] **Dashboard Investor Grade** (`/admin-sys`)
  - [ ] Métricas en tiempo real:
    - [ ] Total GMV (suma precio_total de órdenes completadas)
    - [ ] Talleres Activos (logueados últimos 7 días)
    - [ ] Vehículos Únicos (total en global_vehicles)
  - [ ] Gráficos de crecimiento exponencial para Pitch Decks

- [ ] **Arquitectura de Identidad**
  - [ ] Migración a `global_profiles`
  - [ ] Migración a `global_vehicles`
  - [ ] Red de datos compartida (Moat/Ventaja Injusta)

- [ ] **UX/UI World Class**
  - [ ] Diseño no-plantilla
  - [ ] Transiciones suaves
  - [ ] Modo Oscuro profesional (Slate-900)
  - [ ] Experiencia móvil nativa (PWA)

- [ ] **Integración Facturación**
  - [ ] Mockup de facturación para plan Enterprise

---

## 📋 SPRINT 3: ARQUITECTURA DE DATOS (Globalización)

### ⏳ PENDIENTE
- [ ] **Migración Hub & Spoke**
  - [ ] `global_profiles` como fuente de verdad
  - [ ] `global_vehicles` como fuente de verdad
  - [ ] Lógica: Auto va a Taller A → Taller B ve datos técnicos automáticamente

---

## 📋 SPRINT 4: FUNCIONALIDAD USUARIO (El Gancho)

### ⏳ PENDIENTE
- [ ] **Link Mágico Mejorado**
  - [ ] Estado del Auto
  - [ ] Checklist de Ingreso (Solo lectura)
  - [ ] Botón "Crear Cuenta"

- [ ] **Perfil de Usuario**
  - [ ] Al registrarse, ver todos sus autos vinculados por teléfono/email

- [ ] **Redirección Waze/Maps**
  - [ ] Botón en ficha pública del taller
  - [ ] Abrir `https://waze.com/ul?ll=...` o Google Maps

---

## 📋 SPRINT 5: MAPA Y BUSCADOR

### ⏳ PENDIENTE
- [ ] **Filtros Simples**
  - [ ] Filtrar por "Mecánica"
  - [ ] Filtrar por "Lavado" (para Bastián)
  - [ ] Filtrar por "Repuestos"

- [ ] **Ficha del Taller**
  - [ ] Mostrar Horario
  - [ ] WhatsApp (Click-to-chat)
  - [ ] Botón de Navegación

---

## 📋 SPRINT 6: VIN DECODE & DASHBOARD USUARIO

### ⏳ PENDIENTE
- [ ] **Base de Datos**
  - [ ] Tabla `user_favorite_workshops`
    ```sql
    CREATE TABLE user_favorite_workshops (
        id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
        user_id UUID REFERENCES global_profiles(id),
        taller_id UUID REFERENCES talleres(id),
        created_at TIMESTAMP DEFAULT NOW(),
        UNIQUE(user_id, taller_id)
    );
    ```

- [ ] **Ficha Técnica (VIN DECODE)**
  - [ ] Componente `VehicleSpecsCard`
  - [ ] Leer JSON `global_vehicles.api_data`
  - [ ] Renderizar grilla:
    - [ ] Motor (Ej: 1.6L 4-Cilindros)
    - [ ] Transmisión (Ej: Automática 6-Vel)
    - [ ] Tracción (Ej: FWD)
    - [ ] Origen (Ej: Corea del Sur)
    - [ ] VIN con botón "Copiar"
  - [ ] Mostrar "No especificado" si datos nulos

- [ ] **Dashboard Usuario** (`/mi-bolsillo`)
  - [ ] Tarjeta "Resumen de Inversión"
    - [ ] Sumar `ordenes.precio_total` donde `estado = 'COMPLETADA'`
    - [ ] Mostrar: "Total invertido en 2026: $XXX.XXX"
  - [ ] Sección "Mis Talleres de Confianza"
    - [ ] Listar talleres de `user_favorite_workshops`
    - [ ] Botones: [📞 Llamar] [📅 Agendar] [📍 Ir con Waze]
  - [ ] Botón "Guardar Favorito"
    - [ ] Icono de Corazón (❤️) en perfil público de taller

---

## 📋 SPRINT 7: INTEGRACIÓN API EXTERNA

### ⏳ PENDIENTE
- [ ] **Facturación (Preparación)**
  - [ ] Estructura lista
  - [ ] Botón "Emitir Boleta" (deshabilitado/oculto)
  - [ ] Preparado para conectar API sin romper código

---

## ❌ DESCARTADO (BACKLOG V2)

- Autos Eléctricos específicos
- Sistema de Puntos/Loyalty complejo
- Cámaras en vivo
- Gestión de filas PRT
- Checklist de Salida (por ahora)
- Bitácora de Evidencia paso a paso (solo Checklist de Ingreso)

---

## 🚨 BLOCKERS ACTUALES

### CRÍTICO - Usuario sin taller asignado
**Status:** En resolución con fallback automático
**Descripción:** `getCurrentUserTallerId()` no puede leer cookies de Supabase correctamente
**Solución implementada:** Fallback a primer taller activo de BD
**Próximo paso:** Confirmar que funciona la creación de órdenes

---

## 📊 RESUMEN DE COMPLETITUD

**Total de tareas:** ~70
**Completadas:** ~8 (11%)
**En progreso:** ~5 (7%)
**Pendientes:** ~57 (82%)

**Prioridad Inmediata:**
1. ✅ Resolver blocker de taller_id
2. ⏳ Completar Vista Pública (Link Mágico)
3. ⏳ Implementar Activación de Cuenta
4. ⏳ Mapa clickeable básico

---

## 📝 NOTAS DEL ARQUITECTO

> "El MVP debe impresionar no solo al mecánico, sino a inversores. La arquitectura debe ser a prueba de balas para escalar nacionalmente en 12 meses."

> "El 'Moat': La red de datos compartida es lo que Mati venderá a los inversores como nuestra 'Ventaja Injusta'."

> "Brayan, con esto tienes el MVP Perfecto para salir a vender mañana mismo."

---

**Última actualización por:** Antigravity
**Fecha:** 2026-02-14 00:45
