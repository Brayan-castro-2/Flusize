# 🔄 RESET COMPLETO DE LA BASE DE DATOS

## ⚠️ ADVERTENCIA
Esto borrará **TODOS** los datos de tu base de datos. Solo hazlo si estás seguro.

---

## Paso 1: Ejecutar el Reset en Supabase

1. Ve a [Supabase SQL Editor](https://supabase.com)
2. Abre el proyecto
3. Click en **SQL Editor**
4. Copia y pega el contenido de `supabase/migrations/RESET_DATABASE.sql`
5. Click en **Run** (Ctrl+Enter)

Deberías ver: `"Base de datos reseteada exitosamente..."`

---

## Paso 2: Crear Usuarios en Supabase Auth

1. Ve a **Authentication** → **Users** en Supabase
2. Click en **Add user** → **Create new user**

### Usuario Admin
- **Email:** `admin@taller.demo`
- **Password:** `1234` (o la que prefieras)
- **Auto Confirm User:** ✅ (activado)

### Usuario Mecánico
- **Email:** `mecanico@taller.demo`
- **Password:** `1234` (o la que prefieras)
- **Auto Confirm User:** ✅ (activado)

3. **Copia los UUIDs** de los usuarios que acabas de crear

---

## Paso 3: Crear Perfiles de Usuarios

Ejecuta este SQL en Supabase, **reemplazando los UUIDs** con los que copiaste:

```sql
-- Crear perfil para admin@taller.demo
INSERT INTO perfiles (id, email, nombre_completo, rol, activo, taller_id)
VALUES (
  'REEMPLAZA-CON-UUID-DEL-ADMIN',  -- ⚠️ Reemplaza esto
  'admin@taller.demo',
  'Administrador',
  'admin',
  true,
  '00000000-0000-0000-0000-000000000001'
);

-- Crear perfil para mecanico@taller.demo
INSERT INTO perfiles (id, email, nombre_completo, rol, activo, taller_id)
VALUES (
  'REEMPLAZA-CON-UUID-DEL-MECANICO',  -- ⚠️ Reemplaza esto
  'mecanico@taller.demo',
  'Mecánico Juan',
  'mecanico',
  true,
  '00000000-0000-0000-0000-000000000001'
);
```

---

## Paso 4: Verificar

```sql
-- Ver talleres
SELECT * FROM talleres;

-- Ver perfiles
SELECT email, nombre_completo, rol, taller_id FROM perfiles;
```

Deberías ver:
- ✅ 1 taller: "Taller Demo"
- ✅ 2 perfiles: admin y mecanico, ambos con `taller_id` asignado

---

## Paso 5: Probar Login

1. Ve a `http://localhost:3000/login`
2. Ingresa:
   - **Email:** `admin@taller.demo`
   - **Password:** `1234`
3. Deberías entrar al dashboard ✅

---

## Si algo falla

1. Revisa la consola del navegador (F12)
2. Revisa los logs del servidor (`npm run dev`)
3. Verifica que los UUIDs en `perfiles` coincidan con los de Supabase Auth

---

¡Listo! Ahora tienes una base de datos limpia y funcional 🎉
