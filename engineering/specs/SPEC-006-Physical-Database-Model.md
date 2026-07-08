# SPEC-006 – Physical Database Model

| Campo         | Valor                                           |
| ------------- | ----------------------------------------------- |
| **Proyecto**  | SIGCA – Sistema Integral de Gestión Catequética |
| **Versión**   | 1.0                                             |
| **Estado**    | Aprobada                                        |
| **Prioridad** | Alta                                            |
| **Fecha**     | 08/Jul/2026                                     |
| **Tipo**      | Diseño Técnico                                  |

---

# 1. Objetivo

Diseñar el modelo físico de la base de datos que será implementado en PostgreSQL mediante Supabase.

Esta SPEC define la estructura definitiva de las entidades, sus relaciones, tipos de datos, reglas de integridad y convenciones necesarias para generar las migraciones SQL.

---

# 2. Alcance

Esta SPEC incluye:

* Definición de todas las tablas del sistema.
* Definición de columnas y tipos de datos.
* Llaves primarias y foráneas.
* Relaciones entre entidades.
* Índices.
* Restricciones.
* Auditoría.
* Soft Delete.
* Catálogos.

No incluye:

* SQL.
* Migraciones.
* Seeds.
* Row Level Security.
* Funciones PostgreSQL.

---

# 3. Dominios

La base de datos queda organizada en los siguientes dominios:

## Catálogos

* cat_roles
* cat_tipos_evento
* cat_estados_evento
* cat_estados_sesion
* cat_estados_asistencia
* cat_estados_inscripcion
* cat_parentescos
* cat_sacramentos
* cat_sexos

## Seguridad

* usuario
* perfil
* usuario_rol

## Organización

* parroquia
* ciclo
* libro
* grupo

## Catequesis

* alumno
* tutor
* inscripcion
* credencial
* codigo_qr
* sacramento

## Eventos

* evento
* sesion_evento
* asistencia

## Académico

* evaluacion
* certificado

---

# 4. Convenciones Generales

Todas las entidades deberán cumplir con las convenciones definidas en:

`docs/database/naming-conventions.md`

En particular:

* UUID como llave primaria.
* snake_case.
* Nombres en singular.
* Auditoría estándar.
* Soft Delete cuando aplique.

---

# 5. Auditoría

Las entidades operativas deberán incluir:

* created_at
* created_by
* updated_at
* updated_by

Las entidades que permitan eliminación lógica incluirán además:

* deleted_at
* deleted_by

---

# 6. Soft Delete

Aplicará a las entidades cuya información deba conservarse por motivos históricos.

Como regla general:

* Catálogos: No.
* Operación: Sí, cuando la eliminación física comprometa la trazabilidad.

---

# 7. Integridad Referencial

* Todas las relaciones utilizarán Foreign Keys.
* No existirán registros huérfanos.
* Las reglas ON DELETE y ON UPDATE se definirán durante la generación del SQL.

---

# 8. Índices

Se crearán índices para:

* CURP.
* Código QR.
* Llaves foráneas.
* Fechas de eventos.
* Búsquedas frecuentes.

Los índices específicos serán definidos durante la implementación SQL.

---

# 9. Entidades

La siguiente lista constituye el modelo físico oficial de SIGCA.

### Catálogos

* cat_roles
* cat_tipos_evento
* cat_estados_evento
* cat_estados_sesion
* cat_estados_asistencia
* cat_estados_inscripcion
* cat_parentescos
* cat_sacramentos
* cat_sexos

### Seguridad

* usuario
* perfil
* usuario_rol

### Organización

* parroquia
* ciclo
* libro
* grupo

### Catequesis

* alumno
* tutor
* inscripcion
* credencial
* codigo_qr
* sacramento

### Eventos

* evento
* sesion_evento
* asistencia

### Académico

* evaluacion
* certificado

---

# 10. Dependencias

Esta SPEC depende de:

* SPEC-005
* BRQ-001
* business-rules.md
* domain-model.md
* entity-relationship-model.md
* entity-relationship-diagram.md
* naming-conventions.md

---

# 11. Habilita

La aprobación de esta SPEC permite iniciar:

* SPEC-007 – PostgreSQL SQL Script.
* SPEC-008 – Supabase Migrations.
* SPEC-009 – Catálogos Base.
* Desarrollo del backend sobre un modelo físico estable.

---

# 12. Criterios de Aceptación

La SPEC se considerará concluida cuando:

* Todas las entidades estén definidas.
* Todas las relaciones estén identificadas.
* Exista una definición física completa de la base de datos.
* El modelo pueda traducirse directamente a SQL sin cambios estructurales.

---

# 13. Definition of Done

* Modelo físico aprobado.
* Arquitectura de datos congelada para el MVP.
* Lista para generar el SQL.
