# PROJECT_DECISIONS

**Proyecto:** SIGCA - Sistema Integral de Gestión Catequética

**Versión:** 1.0

**Última actualización:** 07/Jul/2026

---

# Objetivo

Mantener un índice centralizado de todas las decisiones de arquitectura (ADR) y de diseño del dominio (DEC) tomadas durante la evolución del proyecto.

Este documento funciona como una guía rápida de navegación y no sustituye los documentos originales.

---

# Estado del Proyecto

Versión actual:

**v0.1.0-alpha**

Fase actual:

**Fase 2 - Descubrimiento del Dominio (Cierre)**

---

# Architecture Decision Records (ADR)

| ADR     | Nombre                              | Estado                       |
| ------- | ----------------------------------- | ---------------------------- |
| ADR-001 | Arquitectura Inicial del Proyecto   | ✅ Aprobada                   |
| ADR-002 | Arquitectura Backend Feature First  | ✅ Aprobada                   |
| ADR-003 | Documentación Guiada por el Dominio | ⏳ Pendiente de formalización |

---

# Design Decisions (DEC)

| DEC     | Nombre                                           | Estado |
| ------- | ------------------------------------------------ | ------ |
| DEC-003 | *(Documento existente)*                          | ✅      |
| DEC-004 | *(Documento existente)*                          | ✅      |
| DEC-005 | *(Documento existente)*                          | ✅      |
| DEC-006 | *(Documento existente)*                          | ✅      |
| DEC-007 | *(Documento existente)*                          | ✅      |
| DEC-008 | *(Documento existente)*                          | ✅      |
| DEC-009 | *(Documento existente)*                          | ✅      |
| DEC-010 | La Inscripción es la entidad central del dominio | ✅      |
| DEC-011 | Modelo basado en Eventos                         | ✅      |
| DEC-012 | El Código QR identifica al Alumno                | ✅      |
| DEC-013 | Pragmatismo sobre burocracia                     | ✅      |
| DEC-014 | Separación entre Evento y Sesión de Evento       | ✅      |


---

# Resumen de las Decisiones Actuales

## Arquitectura

* Arquitectura Feature First.
* Backend desacoplado.
* Separación entre Core e Interfaces.
* Configuración centralizada.
* Cliente único de Supabase.

## Dominio

* La Inscripción representa la operación anual del Alumno.
* El Alumno conserva su identidad e historial permanente.
* El Código QR identifica únicamente al Alumno.
* Toda asistencia pertenece a un Evento.
* El historial nunca se elimina.

## Persistencia

* PostgreSQL como motor de base de datos.
* UUID como identificador principal.
* Auditoría en entidades principales.
* Conservación histórica.
* Soft Delete cuando aplique.
* Migraciones versionadas.

---

# Relación entre Artefactos

```text
BRQ
 │
 ▼
Business Rules
 │
 ▼
Domain Model
 │
 ▼
DEC
 │
 ▼
ADR
 │
 ▼
SPEC
 │
 ▼
Implementación
```

---

# Próximas Decisiones Previstas

Las siguientes decisiones podrán formalizarse conforme avance el proyecto:

* Estrategia de autenticación.
* Gestión de permisos.
* Estrategia de almacenamiento de fotografías.
* Integración con Supabase Storage.
* Estrategia de impresión de credenciales.
* Estrategia de respaldos.
* Estrategia de notificaciones.
* Arquitectura del frontend.
* Arquitectura de reportes.

---

# Mantenimiento

Toda decisión nueva deberá:

1. Tener un identificador único.
2. Documentarse en su archivo correspondiente.
3. Registrarse en este índice.
4. Referenciarse desde las SPEC que dependan de ella.

Este documento es el punto de entrada para comprender la evolución arquitectónica y funcional de SIGCA.
