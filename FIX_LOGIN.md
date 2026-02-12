# 🚨 FIX URGENTE: Login No Funciona

## Problema

Después de ejecutar la migración multi-tenant, **el login no funciona** porque los usuarios existentes no tienen `taller_id` asignado.

## Solución Rápida (5 minutos)

### Paso 1: Ir a Supabase SQL Editor

1. Abre [https://supabase.com](https://supabase.com)
2. Ve a tu proyecto
3. Click en **SQL Editor**

### Paso 2: Ejecutar este SQL

```sql
-- Asignar el taller por defecto a TODOS los usuarios sin taller
UPDATE perfiles 
SET taller_id = (SELECT id FROM talleres WHERE nombre = 'Electromecánica JR' LIMIT 1)
WHERE taller_id IS NULL;
```

### Paso 3: Verificar

```sql
-- Ver que todos tienen taller asignado
SELECT email, nombre_completo, taller_id FROM perfiles;
```

Deberías ver algo como:

```
email              | nombre_completo | taller_id
-------------------|-----------------|------------------------------------
admin@taller.com   | Admin           | 00000000-0000-0000-0000-000000000001
charlie@taller.com | Charlie         | 00000000-0000-0000-0000-000000000001
```

### Paso 4: Probar Login

Ahora intenta hacer login de nuevo. Debería funcionar ✅

---

## ¿Por qué pasó esto?

La migración creó la columna `taller_id` en la tabla `perfiles`, pero **no asignó valores a los usuarios existentes**. 

Cuando intentas hacer login, el código busca el `taller_id` del usuario y como es `NULL`, falla.

---

## Solución Permanente

Para evitar esto en el futuro, la migración ya incluye este código (pero necesitas ejecutarlo manualmente si ya corriste la migración):

```sql
-- Esto ya está en: supabase/migrations/20260211_add_multi_tenant.sql
UPDATE perfiles 
SET taller_id = (SELECT id FROM talleres LIMIT 1) 
WHERE taller_id IS NULL;
```

---

## Si el problema persiste

1. **Verifica en Supabase** que el usuario tiene `taller_id`:
   ```sql
   SELECT * FROM perfiles WHERE email = 'admin@taller.com';
   ```

2. **Verifica que el taller existe**:
   ```sql
   SELECT * FROM talleres;
   ```

3. **Revisa los logs del servidor** (en la terminal donde corre `npm run dev`)

---

¡Listo! El login debería funcionar ahora 🎉
