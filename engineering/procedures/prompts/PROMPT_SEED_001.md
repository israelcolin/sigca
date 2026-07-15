Implementa el archivo:

backend/database/seeds/001_seed_catalogs.sql

siguiendo estrictamente:

- engineering/specs/SPEC-007-PostgreSQL-Implementation.md
- engineering/procedures/IMPLEMENT_SPEC.md

Utiliza como referencia:

- backend/database/migrations/001_create_catalogs.sql

No modificar ninguna migración.

--------------------------------------------------
OBJETIVO
--------------------------------------------------

Insertar los catálogos base requeridos para el funcionamiento inicial de SIGCA.

No crear tablas.

No modificar estructuras.

Únicamente insertar datos.

--------------------------------------------------
CATÁLOGO cat_roles
--------------------------------------------------

Insertar exactamente los siguientes registros:

| codigo | nombre | orden |
|--------|---------|------:|
| ADMIN | Administrador | 1 |
| COORD_GENERAL | Coordinador General | 2 |
| CATEQUISTA | Catequista | 3 |
| AUXILIAR | Auxiliar | 4 |
| VOLUNTARIO | Voluntario | 5 |
| CONSULTA | Consulta | 6 |

Cada registro debe incluir:

- descripcion
- activo = TRUE

--------------------------------------------------
CATÁLOGO cat_tipos_evento
--------------------------------------------------

CURSO
MISA
RETIRO
PLATICA
CONFESION
OTRO

Con:

- codigo
- nombre
- descripcion
- orden
- activo

--------------------------------------------------
CATÁLOGO cat_estados_evento
--------------------------------------------------

PROGRAMADO
EN_CURSO
FINALIZADO
CANCELADO

--------------------------------------------------
CATÁLOGO cat_estados_sesion
--------------------------------------------------

PROGRAMADA
ABIERTA
CERRADA
CANCELADA

--------------------------------------------------
CATÁLOGO cat_estados_asistencia
--------------------------------------------------

ASISTIO
JUSTIFICADA

NOTA:

No insertar un estado FALTA.

La ausencia de un registro representa una falta de asistencia y será una regla del negocio implementada por la aplicación.

--------------------------------------------------
CATÁLOGO cat_estados_inscripcion
--------------------------------------------------

INSCRITO
BAJA
CONCLUIDO

--------------------------------------------------
CATÁLOGO cat_parentescos
--------------------------------------------------

PADRE
MADRE
ABUELO
ABUELA
TUTOR
HERMANO
OTRO

--------------------------------------------------
CATÁLOGO cat_sacramentos
--------------------------------------------------

BAUTISMO
PRIMERA_COMUNION
CONFIRMACION

--------------------------------------------------
CATÁLOGO cat_sexos
--------------------------------------------------

MASCULINO
FEMENINO

--------------------------------------------------
REQUISITOS

- PostgreSQL 16 compatible con Supabase.
- BEGIN y COMMIT.
- Utilizar INSERT.
- Utilizar ON CONFLICT DO NOTHING para permitir múltiples ejecuciones.
- Insertar codigo.
- Insertar nombre.
- Insertar descripcion.
- Insertar orden.
- Insertar activo.
- No utilizar UUID fijos.
- No modificar registros existentes.
- No insertar información de prueba.
- No crear funciones.
- No crear triggers.
- No crear vistas.
- No crear índices.
- El archivo debe ser completamente idempotente.