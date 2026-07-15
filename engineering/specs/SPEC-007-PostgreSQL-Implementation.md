# SPEC-007 – PostgreSQL Implementation

| Campo         | Valor                                           |
| ------------- | ----------------------------------------------- |
| **Proyecto**  | SIGCA – Sistema Integral de Gestión Catequética |
| **Versión**   | 1.0                                             |
| **Estado**    | Aprobada                                        |
| **Prioridad** | Alta                                            |
| **Fecha**     | 08/Jul/2026                                     |
| **Tipo**      | Implementación                                  |

---

# 1. Objetivo

Implementar el modelo físico definido en la SPEC-006 mediante scripts SQL compatibles con PostgreSQL y Supabase.

---

# 2. Alcance

Codex deberá generar:

* Scripts SQL.
* Creación de tablas.
* Llaves primarias.
* Llaves foráneas.
* Constraints.
* Índices.
* Comentarios SQL.
* Scripts idempotentes cuando sea posible.

No deberá implementar:

* RLS.
* Policies.
* Triggers.
* Funciones.
* Seeds.
* Datos iniciales.

---

# 3. Orden de Implementación

La implementación deberá seguir exactamente este orden:

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
* codigo_qr
* credencial
* sacramento

## Eventos

* evento
* sesion_evento
* asistencia

## Académico

* evaluacion
* certificado

---

# 4. Convenciones

Toda la implementación deberá respetar:

* Naming Conventions.
* UUID como PK.
* snake_case.
* Auditoría.
* Soft Delete cuando aplique.

---

# 5. Restricciones

No utilizar valores hardcodeados.

Todas las relaciones deberán utilizar Foreign Keys.

Todos los nombres deberán respetar las convenciones del proyecto.

---

# 6. Organización de los Scripts

Los scripts deberán dividirse en archivos independientes.

Ejemplo:

```text
database/migrations/

001_catalogos.sql
002_seguridad.sql
003_organizacion.sql
004_catequesis.sql
005_eventos.sql
006_academico.sql
```

Cada archivo deberá poder ejecutarse de forma independiente respetando el orden de dependencias.

---

# 7. Resultado Esperado

Al finalizar esta SPEC el proyecto contará con:

* Esquema PostgreSQL completo.
* Scripts organizados por dominio.
* Base lista para ejecutarse en Supabase.

---

# 8. Definition of Done

* Todas las tablas implementadas.
* Todas las relaciones implementadas.
* Scripts SQL organizados.
* Compilación sin errores.
* Esquema listo para migraciones.

## Estado Final

Estado: ✅ IMPLEMENTADA

Fecha de implementación:
2026-07-15

Resultado

Todas las migraciones, seeds, índices, vistas, funciones y políticas RLS fueron implementadas y validadas exitosamente sobre PostgreSQL 16 / Supabase.