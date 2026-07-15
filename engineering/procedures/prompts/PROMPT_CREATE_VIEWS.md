Implementa el archivo:

backend/database/migrations/008_create_views.sql

siguiendo estrictamente:

- engineering/specs/SPEC-007-PostgreSQL-Implementation.md
- engineering/procedures/IMPLEMENT_SPEC.md

Utiliza como referencia todas las migraciones 001–006.

No modificar tablas.

No modificar índices.

No modificar funciones.

--------------------------------------------------
OBJETIVO
--------------------------------------------------

Crear vistas de consulta para el backend de SIGCA.

Crear únicamente las siguientes vistas:

- vw_alumnos
- vw_asistencia_alumno
- vw_asistencia_grupo
- vw_eventos
- vw_certificados
- vw_estadisticas_grupo

--------------------------------------------------
vw_alumnos

Debe incluir:

Alumno

Tutor

Grupo

Libro

Ciclo

Sexo

QR vigente

--------------------------------------------------
vw_asistencia_alumno

Debe incluir:

Alumno

Sesión

Evento

Fecha

Estado asistencia

Registrado por

--------------------------------------------------
vw_asistencia_grupo

Debe incluir:

Grupo

Alumno

Fecha

Estado

--------------------------------------------------
vw_eventos

Debe incluir:

Evento

Tipo de evento

Grupo

Libro

Ciclo

--------------------------------------------------
vw_certificados

Debe incluir:

Alumno

Libro

Ciclo

Fecha emisión

Porcentaje asistencia

Aprobado

--------------------------------------------------
vw_estadisticas_grupo

Debe calcular:

Total alumnos

Asistencias

Justificadas

Porcentaje asistencia

Agrupado por grupo.

--------------------------------------------------
REQUISITOS

BEGIN

COMMIT

CREATE OR REPLACE VIEW

No crear tablas.

No crear funciones.

No crear triggers.

No crear RLS.

No modificar estructuras existentes.

Todas las vistas deberán tener comentarios descriptivos mediante COMMENT ON VIEW.