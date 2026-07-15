Implementa el archivo:

backend/database/migrations/009_create_functions.sql

siguiendo estrictamente:

- engineering/specs/SPEC-007-PostgreSQL-Implementation.md
- engineering/procedures/IMPLEMENT_SPEC.md

Utiliza como referencia todas las migraciones implementadas (001–008).

--------------------------------------------------
OBJETIVO
--------------------------------------------------

Crear las funciones reutilizables de negocio para SIGCA.

Crear únicamente las siguientes funciones:

- fn_ciclo_activo()
- fn_porcentaje_asistencia(UUID, UUID)
- fn_alumno_aprobado(UUID, UUID)
- fn_puede_recibir_certificado(UUID, UUID)
- fn_qr_valido(TEXT)
- fn_estadisticas_grupo(UUID)

--------------------------------------------------
REQUISITOS

- PostgreSQL 16.
- Compatible con Supabase.
- CREATE OR REPLACE FUNCTION.
- LANGUAGE plpgsql.
- STABLE cuando aplique.
- Comentar cada función.
- No modificar tablas.
- No crear triggers.
- No crear RLS.
- No insertar datos.

Las funciones deberán implementar las reglas del negocio ya definidas para SIGCA.