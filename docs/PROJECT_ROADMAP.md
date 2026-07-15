# PROJECT ROADMAP

**Proyecto:** SIGCA - Sistema Integral de Gestión Catequética

**Versión del Documento:** 1.0

**Última actualización:** 07/Jul/2026

---

# Objetivo

Definir la hoja de ruta oficial del proyecto SIGCA.

Este documento muestra la evolución prevista del sistema mediante fases, hitos (Milestones), versiones y entregables.

El Roadmap constituye la planificación de alto nivel del proyecto y sirve como referencia para priorizar el desarrollo.

---

# Estado General

**Versión actual**

v0.1.0-alpha

**Fase actual**

Fase 2 - Descubrimiento del Dominio

**Estado**

Finalizando

---

# Roadmap General

```text
FASE 1
Ingeniería del Proyecto
██████████
100%

↓

FASE 2
Descubrimiento del Dominio
██████████
100%

↓

FASE 3
Diseño Técnico
░░░░░░░░░░
0%

↓

FASE 4
Desarrollo del Backend
░░░░░░░░░░
0%

↓

FASE 5
Frontend
░░░░░░░░░░
0%

↓

FASE 6
Calidad y Producción
░░░░░░░░░░
0%
```

---

# Milestone M1

## Fundación del Proyecto

**Estado**

Completado

**Versión**

v0.1.0-alpha

### Objetivos

* Arquitectura.
* Backend inicial.
* TypeScript.
* Express.
* Supabase Core.
* Ingeniería del proyecto.

### SPEC

* SPEC-001
* SPEC-002
* SPEC-003
* SPEC-004

---

# Milestone M2

## Descubrimiento del Dominio

**Estado**

Completado

### Objetivos

* Levantamiento de requerimientos.
* Modelo del dominio.
* Reglas de negocio.
* Estrategia de base de datos.
* Modelo conceptual.

### Artefactos

Business

* BRQ-001
* glossary.md
* business-rules.md
* domain-model.md

Database

* database-strategy.md
* entity-relationship-model.md

Engineering

* SPEC-005

Decisions

* DEC-010
* DEC-011
* DEC-012

---

# Milestone M3

## Diseño Técnico de la Base de Datos

**Estado**

Pendiente

### Objetivos

* Diagrama ER.
* Convenciones.
* Modelo físico.
* Catálogos.
* Migraciones.
* Índices.
* Constraints.
* RLS.

### SPEC previstas

* SPEC-006
* SPEC-007

---

# Milestone M4

## Seguridad

Objetivos

* Supabase Auth.
* Roles.
* Permisos.
* Sesiones.
* Auditoría.

SPEC previstas

* SPEC-008

---

# Milestone M5

## Catálogos

Objetivos

* Libros.
* Ciclos.
* Roles.
* Estados.
* Tipos de Evento.
* Sacramentos.

---

# Milestone M6

## Administración de Alumnos

Objetivos

* CRUD.
* Fotografía.
* Tutor.
* Historial.
* QR.

---

# Milestone M7

## Inscripciones

Objetivos

* Inscripción.
* Reinscripción.
* Cambio de Grupo.
* Credenciales.

---

# Milestone M8

## Eventos y Asistencias

Objetivos

* Eventos.
* Misas.
* Clases.
* QR.
* Justificaciones.

---

# Milestone M9

## Evaluaciones

Objetivos

* Exámenes.
* Resultados.
* Asistencia mínima.

---

# Milestone M10

## Certificados

Objetivos

* Emisión.
* Historial.
* Reimpresión.

---

# Milestone M11

## Dashboard

Objetivos

* Indicadores.
* Estadísticas.
* KPIs.

---

# Milestone M12

## Reportes

Objetivos

* PDF.
* Excel.
* Estadísticas.

---

# Milestone M13

## Frontend

Objetivos

* Materialize CSS.
* Responsive.
* Móvil.
* PWA (evaluación futura).

---

# Milestone M14

## Producción

Objetivos

* Optimización.
* Pruebas.
* Despliegue.
* Documentación final.

---

# Versiones Previstas

| Versión      | Objetivo                                      |
| ------------ | --------------------------------------------- |
| v0.1.0-alpha | Fundación del proyecto y análisis del dominio |
| v0.2.0-alpha | Modelo físico de base de datos                |
| v0.3.0-alpha | Seguridad y autenticación                     |
| v0.4.0-alpha | Primer módulo funcional (Catálogos)           |
| v0.5.0-alpha | Gestión de alumnos e inscripciones            |
| v0.6.0-alpha | Eventos y asistencias                         |
| v0.7.0-alpha | Evaluaciones y certificados                   |
| v0.8.0-beta  | Dashboard y reportes                          |
| v0.9.0-rc    | Pruebas integrales                            |
| v1.0.0       | Primera versión estable                       |

---

# Principios de Planificación

* Cada Milestone podrá contener una o más SPEC.
* Ningún Milestone iniciará sin que el anterior haya sido aprobado.
* Toda funcionalidad deberá contar con documentación previa.
* Cada Milestone finalizará con:

  * Revisión técnica.
  * Commit.
  * Actualización del Journal.
  * Actualización del CHANGELOG.
  * Creación de un Tag de Git.

---

# Estado Actual

**Milestone completados**

* M1 - Fundación del Proyecto.
* M2 - Descubrimiento del Dominio.

**Próximo Milestone**

M3 - Diseño Técnico de la Base de Datos.

Este Milestone marcará el inicio del diseño físico de PostgreSQL y preparará el proyecto para la implementación de los primeros módulos funcionales.

## Fase 3 - Plataforma de Datos

Estado: ✅ COMPLETADA

Entregables

- Modelo lógico
- Modelo físico
- Migraciones
- Seeds
- Índices
- Views
- Functions
- RLS

Resultado

Base de datos lista para iniciar el desarrollo del Backend.