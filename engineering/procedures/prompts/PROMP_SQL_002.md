Implementa el archivo:

backend/database/migrations/002_create_security.sql

siguiendo estrictamente:

engineering/specs/SPEC-007-PostgreSQL-Implementation.md

y

engineering/procedures/IMPLEMENT_SPEC.md

Utiliza como referencia de estilo y estructura la migración:

backend/database/migrations/001_create_catalogs.sql

No cambies el estilo ni las convenciones.

Objetivo

Implementar el dominio de Seguridad de SIGCA.

Crear únicamente las siguientes tablas:

- usuario
- perfil
- usuario_rol

Modelo

Supabase Auth (auth.users)
        │
        │ 1:1
        ▼
usuario
        │
        │ 1:1
        ▼
perfil

usuario
        │
        └──────< usuario_rol >────── cat_roles

Reglas

Tabla usuario

- id UUID PRIMARY KEY
- El id corresponde exactamente al UUID de auth.users.
- No generar UUID automáticamente.
- No utilizar auth_user_id.
- activo BOOLEAN
- ultimo_acceso TIMESTAMPTZ NULL
- created_at
- updated_at

Tabla perfil

- UUID generado con gen_random_uuid()
- FK usuario_id
- nombre
- apellido_paterno
- apellido_materno
- telefono
- correo_alternativo
- fotografia_url
- fecha_nacimiento
- observaciones
- created_at
- updated_at

Tabla usuario_rol

- UUID generado
- usuario_id FK
- rol_id FK -> cat_roles
- created_at
- updated_at

Requisitos

- PostgreSQL 16.
- Compatible con Supabase.
- BEGIN y COMMIT.
- CREATE TABLE IF NOT EXISTS.
- COMMENT ON para tablas y columnas.
- Crear todas las FOREIGN KEY.
- No crear índices adicionales.
- No crear RLS.
- No crear TRIGGER.
- No crear FUNCTION.
- No insertar datos.

Si detectas inconsistencias con la documentación, repórtalas al final del archivo como comentarios SQL sin modificar el modelo.