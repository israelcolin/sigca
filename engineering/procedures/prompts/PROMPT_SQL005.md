Implementa el archivo:

backend/database/migrations/005_create_events.sql

siguiendo estrictamente:

- engineering/specs/SPEC-007-PostgreSQL-Implementation.md
- engineering/procedures/IMPLEMENT_SPEC.md

Utiliza como referencia de estilo y estructura las migraciones:

- 001_create_catalogs.sql
- 002_create_security.sql
- 003_create_organization.sql
- 004_create_catechesis.sql

No cambies el estilo ni las convenciones.

--------------------------------------------------
OBJETIVO
--------------------------------------------------

Implementar el dominio Eventos de SIGCA.

Crear únicamente las siguientes tablas:

- evento
- sesion_evento
- asistencia

--------------------------------------------------
TABLA evento
--------------------------------------------------

Campos

- id UUID PRIMARY KEY DEFAULT gen_random_uuid()
- grupo_id UUID NULL
- tipo_evento_id UUID NOT NULL
- nombre VARCHAR(150) NOT NULL
- descripcion TEXT NULL
- activo BOOLEAN NOT NULL DEFAULT TRUE
- created_at
- updated_at

Relaciones

- grupo_id -> grupo (NULL cuando sea un evento general como una misa)
- tipo_evento_id -> cat_tipos_evento

--------------------------------------------------
TABLA sesion_evento
--------------------------------------------------

Campos

- id UUID PRIMARY KEY DEFAULT gen_random_uuid()
- evento_id UUID NOT NULL
- estado_id UUID NOT NULL
- fecha DATE NOT NULL
- hora_inicio TIME NOT NULL
- hora_fin TIME NOT NULL
- observaciones TEXT NULL
- created_at
- updated_at

Relaciones

- evento_id -> evento
- estado_id -> cat_estados_sesion

Reglas

- CHECK(hora_inicio < hora_fin)

--------------------------------------------------
TABLA asistencia
--------------------------------------------------

Campos

- id UUID PRIMARY KEY DEFAULT gen_random_uuid()
- sesion_evento_id UUID NOT NULL
- alumno_id UUID NOT NULL
- estado_id UUID NOT NULL
- registrado_por_usuario_id UUID NOT NULL
- fecha_registro TIMESTAMPTZ NOT NULL DEFAULT NOW()
- justificacion TEXT NULL
- created_at
- updated_at

Relaciones

- sesion_evento_id -> sesion_evento
- alumno_id -> alumno
- estado_id -> cat_estados_asistencia
- registrado_por_usuario_id -> usuario

Reglas

- UNIQUE(sesion_evento_id, alumno_id)

--------------------------------------------------
REQUISITOS

- PostgreSQL 16 compatible con Supabase.
- BEGIN y COMMIT.
- CREATE TABLE IF NOT EXISTS.
- COMMENT ON para tablas y columnas.
- Crear todas las FOREIGN KEY.
- Crear únicamente las restricciones indicadas.
- No crear RLS.
- No crear TRIGGER.
- No crear FUNCTION.
- No insertar datos.
- No modificar tablas existentes.

Si detectas inconsistencias con la documentación, repórtalas únicamente como comentarios SQL al final del archivo sin modificar el modelo.