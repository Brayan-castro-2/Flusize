# 🚀 Instrucciones para Ejecutar la Migración Multi-Tenant

## Paso 1: Acceder a Supabase

1. Ve a [https://supabase.com](https://supabase.com)
2. Inicia sesión en tu proyecto
3. Ve a **SQL Editor** en el menú lateral

## Paso 2: Ejecutar la Migración

1. Abre el archivo `supabase/migrations/20260211_add_multi_tenant.sql`
2. **Copia TODO el contenido** del archivo
3. Pégalo en el SQL Editor de Supabase
4. Haz clic en **Run** (Ejecutar)

## Paso 3: Verificar que Funcionó

Ejecuta este query para verificar:

```sql
-- Verificar que la tabla talleres existe
SELECT * FROM talleres;

-- Verificar que las columnas taller_id se agregaron
SELECT column_name, data_type 
FROM information_schema.columns 
WHERE table_name = 'perfiles' AND column_name = 'taller_id';
```

Deberías ver:
- ✅ Una tabla `talleres` con un registro "Electromecánica JR"
- ✅ La columna `taller_id` en las tablas `perfiles`, `clientes`, `vehiculos`, `ordenes`, `citas`

## Paso 4: Asignar Taller a Usuarios Existentes

Si tienes usuarios que no tienen `taller_id` asignado, ejecútalos:

```sql
-- Ver usuarios sin taller
SELECT id, email, nombre_completo, taller_id FROM perfiles WHERE taller_id IS NULL;

-- Asignar taller por defecto a usuarios sin taller
UPDATE perfiles 
SET taller_id = '00000000-0000-0000-0000-000000000001' 
WHERE taller_id IS NULL;
```

## ⚠️ Importante

- **Haz un backup** de tu base de datos antes de ejecutar la migración
- La migración asigna todos los datos existentes al taller "Electromecánica JR"
- Si algo sale mal, puedes revertir con:

```sql
-- SOLO SI NECESITAS REVERTIR (¡CUIDADO!)
DROP TABLE IF EXISTS talleres CASCADE;
ALTER TABLE perfiles DROP COLUMN IF EXISTS taller_id;
ALTER TABLE clientes DROP COLUMN IF EXISTS taller_id;
ALTER TABLE vehiculos DROP COLUMN IF EXISTS taller_id;
ALTER TABLE ordenes DROP COLUMN IF EXISTS taller_id;
ALTER TABLE citas DROP COLUMN IF EXISTS taller_id;
```

## Próximos Pasos

Después de ejecutar la migración:

1. ✅ Reinicia tu aplicación local (`npm run dev`)
2. ✅ Prueba crear una orden nueva
3. ✅ Verifica que solo veas datos de tu taller
4. ✅ Pásale las funciones a Bastián para que las integre

## Funciones Listas para Bastián

```typescript
import { getTallerInfo, getAutoByPatente, createCita } from '@/lib/taller-actions'

// 1. Obtener info del taller
const taller = await getTallerInfo('uuid-del-taller')

// 2. Buscar auto por patente
const auto = await getAutoByPatente('ABC123')

// 3. Crear cita
await createCita({
  titulo: 'Revisión técnica',
  fecha_inicio: '2026-02-15T10:00:00',
  fecha_fin: '2026-02-15T11:00:00',
  cliente_nombre: 'Juan Pérez',
  cliente_telefono: '+56912345678'
})
```

¡Listo! 🎉
