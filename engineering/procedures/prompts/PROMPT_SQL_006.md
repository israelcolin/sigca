Implementa el archivo:

backend/database/migrations/006_create_academic.sql

siguiendo estrictamente:

- engineering/specs/SPEC-007-PostgreSQL-Implementation.md
- engineering/procedures/IMPLEMENT_SPEC.md

Utiliza como referencia de estilo y estructura las migraciones:

- 001_create_catalogs.sql
- 002_create_security.sql
- 003_create_organization.sql
- 004_create_catechesis.sql
- 005_create_events.sql

No cambies el estilo ni las convenciones.

--------------------------------------------------
OBJETIVO
--------------------------------------------------

Implementar el dominio Académico de SIGCA.

Crear únicamente las siguientes tablas:

- evaluacion
- resultado_evaluacion
- certificado

No crear ninguna otra tabla.

--------------------------------------------------
TABLA evaluacion
--------------------------------------------------

Campos

- id UUID PRIMARY KEY DEFAULT gen_random_uuid()
- grupo_id UUID NOT NULL
- nombre VARCHAR(150) NOT NULL
- descripcion TEXT NULL
- fecha DATE NOT NULL
- ponderacion NUMERIC(5,2) NULL
- activa BOOLEAN NOT NULL DEFAULT TRUE
- created_at TIMESTAMPTZ NOT NULL DEFAULT NOW()
- updated_at TIMESTAMPTZ NOT NULL DEFAULT NOW()

Relaciones

- grupo_id -> grupo

Reglas

- Una evaluación pertenece a un grupo.
- CHECK (ponderacion IS NULL OR (ponderacion >= 0 AND ponderacion <= 100))

--------------------------------------------------
TABLA resultado_evaluacion
--------------------------------------------------

Campos

- id UUID PRIMARY KEY DEFAULT gen_random_uuid()
- evaluacion_id UUID NOT NULL
- alumno_id UUID NOT NULL
- calificacion NUMERIC(5,2) NULL
- aprobado BOOLEAN NOT NULL DEFAULT FALSE
- observaciones TEXT NULL
- created_at TIMESTAMPTZ NOT NULL DEFAULT NOW()
- updated_at TIMESTAMPTZ NOT NULL DEFAULT NOW()

Relaciones

- evaluacion_id -> evaluacion
- alumno_id -> alumno

Reglas

- UNIQUE(evaluacion_id, alumno_id)
- CHECK (calificacion IS NULL OR (calificacion >= 0 AND calificacion <= 100))

--------------------------------------------------
TABLA certificado
--------------------------------------------------

Campos

- id UUID PRIMARY KEY DEFAULT gen_random_uuid()
- alumno_id UUID NOT NULL
- ciclo_id UUID NOT NULL
- libro_id UUID NOT NULL
- fecha_emision DATE NOT NULL
- porcentaje_asistencia NUMERIC(5,2) NOT NULL
- aprobado BOOLEAN NOT NULL
- observaciones TEXT NULL
- created_at TIMESTAMPTZ NOT NULL DEFAULT NOW()
- updated_at TIMESTAMPTZ NOT NULL DEFAULT NOW()

Relaciones

- alumno_id -> alumno
- ciclo_id -> ciclo
- libro_id -> libro

Reglas

- UNIQUE(alumno_id, ciclo_id, libro_id)
- CHECK (porcentaje_asistencia >= 0 AND porcentaje_asistencia <= 100)

--------------------------------------------------
REQUISITOS

- PostgreSQL 16 compatible con Supabase.
- BEGIN y COMMIT.
- CREATE TABLE IF NOT EXISTS.
- COMMENT ON para todas las tablas y todas las columnas.
- Crear todas las FOREIGN KEY.
- Crear únicamente las restricciones indicadas.
- No crear índices adicionales.
- No crear RLS.
- No crear TRIGGER.
- No crear FUNCTION.
- No insertar datos.
- No modificar tablas existentes.
- No reasignar atributos entre entidades.

Si detectas inconsistencias con la documentación, repórtalas únicamente como comentarios SQL al final del archivo sin modificar el modelo.