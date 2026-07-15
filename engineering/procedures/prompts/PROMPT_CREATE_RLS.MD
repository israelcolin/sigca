Implementa el archivo:

backend/database/migrations/010_create_rls.sql

siguiendo estrictamente:

- engineering/specs/SPEC-007-PostgreSQL-Implementation.md
- engineering/procedures/IMPLEMENT_SPEC.md

Utiliza como referencia todas las migraciones 001–009.

--------------------------------------------------
OBJETIVO
--------------------------------------------------

Configurar Row Level Security (RLS) para todas las tablas de SIGCA.

--------------------------------------------------
REQUISITOS
--------------------------------------------------

- Habilitar RLS en todas las tablas del esquema público creadas por las migraciones.
- Crear políticas de lectura para usuarios autenticados sobre los catálogos.
- Crear políticas básicas para tablas operativas que permitan el acceso únicamente a usuarios autenticados.
- No implementar todavía restricciones específicas por rol de negocio; esas reglas serán aplicadas por el backend en la versión 1.
- No crear tablas.
- No modificar estructuras.
- No crear funciones adicionales.
- No insertar datos.

Utilizar:

- ALTER TABLE ... ENABLE ROW LEVEL SECURITY;
- CREATE POLICY IF NOT EXISTS cuando sea compatible; si no lo es, crear las políticas de forma idempotente utilizando comprobación sobre `pg_policies`.

Compatible con PostgreSQL 16 y Supabase.

BEGIN;
COMMIT;