# SPEC-005

# Domain Analysis and Conceptual Model

| Campo              | Valor                                           |
| ------------------ | ----------------------------------------------- |
| **Proyecto**       | SIGCA - Sistema Integral de Gestión Catequética |
| **Versión**        | 1.0                                             |
| **Estado**         | Aprobada                                        |
| **Prioridad**      | Alta                                            |
| **Autor**          | Equipo SIGCA                                    |
| **Fecha**          | 07/Jul/2026                                     |
| **Tipo**           | Análisis Funcional                              |
| **Implementación** | No aplica                                       |

---

# 1. Objetivo

Consolidar el análisis del dominio funcional de SIGCA y establecer el modelo conceptual que servirá como fundamento para el diseño físico de la base de datos, el desarrollo del backend y la construcción del frontend.

Esta SPEC no implementa código ni cambios técnicos; su propósito es aprobar formalmente el conocimiento del negocio y las decisiones de modelado derivadas del levantamiento de requerimientos.

---

# 2. Contexto

Durante las primeras iteraciones del proyecto se construyó la infraestructura técnica de SIGCA.

Una vez estabilizada dicha infraestructura, se realizó un proceso de levantamiento de requerimientos con la operación real de la catequesis.

Como resultado, se identificaron nuevas entidades del dominio y se redefinió la estructura conceptual del sistema.

La principal conclusión fue que la entidad central del dominio no es el Alumno, sino la **Inscripción**, ya que representa la participación anual del alumno dentro de un ciclo catequético.

---

# 3. Historias de Usuario

### HU-001

Como Coordinador General,

quiero administrar los ciclos catequéticos,

para conservar el historial anual de formación.

---

### HU-002

Como Catequista,

quiero consultar únicamente los alumnos inscritos en mi grupo,

para registrar asistencias y evaluaciones.

---

### HU-003

Como Administrador,

quiero conservar el historial completo de cada alumno,

para consultar su trayectoria catequética en cualquier momento.

---

### HU-004

Como Voluntario,

quiero registrar asistencias mediante código QR,

para agilizar el acceso durante los eventos parroquiales.

---

# 4. Requerimientos Funcionales

La presente SPEC aprueba los siguientes conceptos funcionales:

* Administración de parroquias.
* Ciclos catequéticos.
* Libros.
* Grupos.
* Catequistas.
* Auxiliares.
* Alumnos.
* Tutores.
* Inscripciones.
* Credenciales.
* Código QR permanente.
* Eventos.
* Asistencias.
* Evaluaciones.
* Certificados.
* Sacramentos.

---

# 5. Requerimientos No Funcionales

El modelo deberá cumplir con los siguientes principios:

* Escalabilidad.
* Conservación histórica.
* Integridad referencial.
* Bajo acoplamiento.
* Separación entre información permanente e información anual.
* Compatibilidad con PostgreSQL y Supabase.
* Preparación para múltiples parroquias.

---

# 6. Alcance

## Incluye

* Validación del dominio.
* Modelo conceptual.
* Reglas de negocio.
* Estrategia de persistencia.
* Relaciones conceptuales.
* Documentación funcional.

## No incluye

* SQL.
* Migraciones.
* APIs.
* Frontend.
* Interfaces.
* Implementación de backend.

---

# 7. Dependencias

Esta SPEC depende de los siguientes documentos:

### Business

* BRQ-001-Catechesis-Requirements.md
* glossary.md
* business-rules.md
* domain-model.md

### Database

* database-strategy.md
* entity-relationship-model.md

### Decisions

* DEC-010 — Inscripción como entidad central.
* DEC-011 — Modelo basado en Eventos.
* DEC-012 — Código QR permanente.

### Architecture

* ADR-002
* ADR-003 (cuando sea aprobada)

---

# 8. Artefactos Relacionados

## Journal

* 2026-07-07.md

## Procedures

* IMPLEMENT_SPEC.md
* VALIDATE_SPEC.md (Pendiente)

## Standards

* Coding Standards
* Documentation Standards

---

# 9. Habilita

La aprobación de esta SPEC permite iniciar:

* SPEC-006 — Physical Database Model.
* SPEC-007 — Supabase Database Implementation.
* SPEC-008 — Authentication and Roles.
* SPEC-009 — Student Module.

---

# 10. Arquitectura

La arquitectura del dominio establece:

* Alumno como entidad permanente.
* Inscripción como entidad operativa.
* Evento como unidad funcional para asistencias.
* Código QR permanente asociado al Alumno.
* Historial completo de todos los ciclos.

---

# 11. Modelo de Datos

El modelo conceptual aprobado establece las siguientes entidades principales:

* Parroquia
* Ciclo
* Libro
* Grupo
* Catequista
* Auxiliar
* Alumno
* Tutor
* Inscripción
* Evento
* Asistencia
* Evaluación
* Certificado
* Sacramento
* Usuario

El detalle completo se encuentra documentado en:

`docs/database/entity-relationship-model.md`

---

# 12. Seguridad

La información del dominio deberá protegerse mediante:

* Supabase Auth.
* Roles propios de SIGCA.
* Row Level Security.
* Auditoría.
* Registro de modificaciones.

---

# 13. Archivos Esperados

Esta SPEC aprueba la existencia de los siguientes documentos:

## Business

* BRQ-001
* glossary.md
* business-rules.md
* domain-model.md

## Database

* database-strategy.md
* entity-relationship-model.md

## Engineering

* SPEC-005

---

# 14. Plan de Implementación

No aplica.

La implementación comenzará en la SPEC-006.

---

# 15. Criterios de Aceptación

La SPEC se considerará aprobada cuando:

* El dominio esté completamente identificado.
* Las entidades principales estén definidas.
* Las relaciones conceptuales estén documentadas.
* Las reglas de negocio hayan sido aprobadas.
* Exista una estrategia de persistencia.
* El equipo apruebe el modelo conceptual.

---

# 16. Definition of Done

* Dominio aprobado.
* Documentación integrada.
* Entidades identificadas.
* Relaciones definidas.
* Reglas de negocio documentadas.
* Base conceptual lista para diseño físico.

---

# 17. Riesgos

* Cambios futuros en la operación parroquial.
* Nuevos procesos sacramentales.
* Cambios organizacionales.

Los riesgos deberán atenderse mediante nuevas DEC y nuevas SPEC.

---

# 18. Notas para Codex

No implementar código.

No generar migraciones.

No crear tablas.

Esta SPEC representa únicamente el análisis funcional aprobado.

---

# 19. Resultado Esperado

Al finalizar esta SPEC el proyecto contará con un modelo conceptual completo del dominio catequético, independiente de cualquier tecnología.

Este modelo servirá como referencia única para el diseño de la base de datos, el desarrollo del backend y la implementación del frontend.

---

# 20. Review Técnico

**Estado:** Aprobada

## Observaciones

* Se identificó correctamente la entidad central del dominio (**Inscripción**).
* Se desacopló la información permanente del Alumno respecto de la operación anual.
* Se definió un modelo basado en Eventos que permite extender el sistema sin modificar la estructura principal.
* La documentación funcional quedó consolidada y preparada para evolucionar mediante futuras DEC y SPEC.

---

# 21. Estado Final

**Resultado:** ✅ APROBADA

La fase de análisis del dominio queda oficialmente concluida.

El proyecto queda autorizado para iniciar el diseño físico de la base de datos en la **SPEC-006**.
