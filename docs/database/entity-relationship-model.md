# Entity Relationship Model

**Proyecto:** SIGCA - Sistema Integral de Gestión Catequética (SIGCA)

**Versión:** 1.0

**Estado:** Aprobado

**Fecha:** 07/Jul/2026

---

# Objetivo

Definir el modelo entidad-relación conceptual del sistema SIGCA.

Este documento describe las entidades del negocio, sus relaciones, cardinalidades y responsabilidades antes de realizar el diseño físico de la base de datos.

No representa todavía la estructura SQL definitiva.

---

# Principios del Modelo

El modelo se basa en los siguientes principios:

* Separación entre información permanente e información anual.
* Conservación total del historial.
* Integridad referencial.
* Escalabilidad.
* Simplicidad del dominio.
* Bajo acoplamiento.

La entidad central del modelo es **Inscripción**.

---

# Vista General del Modelo

```text
Parroquia
    │ 1
    │
    └───────────────< N Ciclos

Ciclo
    │
    ├───────────────< N Grupos
    │
    └───────────────< N Inscripciones

Libro
    │
    └───────────────< N Grupos

Grupo
    │
    ├─────────────── 1 Catequista
    ├─────────────── 1 Auxiliar
    └───────────────< N Inscripciones

Alumno
    │
    ├─────────────── 1 Código QR
    ├───────────────< N Sacramentos
    └───────────────< N Inscripciones

Tutor
    │
    └───────────────< N Inscripciones

Inscripción
    │
    ├─────────────── 1 Grupo
    ├─────────────── 1 Tutor
    ├─────────────── 1 Credencial
    ├───────────────< N Asistencias
    ├───────────────< N Evaluaciones
    └───────────────< N Certificados

Evento
    │
    └───────< N SesionEvento

SesionEvento
    │
    └───────< N Asistencia

Usuario
    │
    ├───────────────< N Eventos registrados
    └───────────────< N Modificaciones

Usuario
    │
    ├───────────────< 1 Rol
    └───────────────< 1 Perfil

```

---

# Entidades

## Parroquia

Responsabilidad:

Representa la organización propietaria del sistema.

Relaciones:

* 1 Parroquia → N Ciclos

---

## Ciclo

Responsabilidad:

Representa un periodo anual de formación.

Relaciones:

* Pertenece a una Parroquia.
* Contiene muchos Grupos.
* Contiene muchas Inscripciones.

Restricción:

Solo un ciclo puede encontrarse en estado Activo.

---

## Libro

Responsabilidad:

Representa el nivel de formación catequética.

Relaciones:

* Un Libro puede existir durante muchos Ciclos.
* Un Libro puede tener muchos Grupos.

---

## Grupo

Responsabilidad:

Organizar alumnos durante un Ciclo.

Relaciones:

* Pertenece a un Libro.
* Pertenece a un Ciclo.
* Tiene un Catequista.
* Tiene un Auxiliar.
* Contiene muchas Inscripciones.

---

## Catequista

Responsabilidad:

Impartir la formación.

Relaciones:

* Atiende un Grupo activo.

---

## Auxiliar

Responsabilidad:

Apoyar al Catequista.

Relaciones:

* Apoya un Grupo activo.

---

## Alumno

Responsabilidad:

Representa a la persona.

Relaciones:

* Tiene un Código QR permanente.
* Tiene muchos Sacramentos.
* Tiene muchas Inscripciones.

---

## Tutor

Responsabilidad:

Representar al responsable legal o familiar durante un Ciclo.

Relaciones:

* Puede tener muchas Inscripciones.

---

## Inscripción

Responsabilidad:

Representar la participación anual del Alumno.

Relaciones:

* Pertenece a un Alumno.
* Pertenece a un Ciclo.
* Pertenece a un Grupo.
* Pertenece a un Tutor.
* Genera una Credencial.
* Registra Asistencias.
* Registra Evaluaciones.
* Genera Certificados.

Reglas:

* Una inscripción por alumno y ciclo.
* Nunca se elimina.

---

## Código QR

Responsabilidad:

Identificar permanentemente al Alumno.

Relaciones:

* Un Alumno tiene un único Código QR.
* El Código QR nunca cambia.

---

## Credencial

Responsabilidad:

Identificar visualmente la Inscripción activa.

Relaciones:

* Una Credencial pertenece a una Inscripción.

---

## Evento

Responsabilidad:

Representar cualquier actividad que requiera control de asistencia.

Tipos iniciales:

* Clase
* Misa
* Retiro
* Confesión
* Plática
* Actividad Especial

Relaciones:

* Un Evento tiene muchas Asistencias.

---

## Asistencia

Responsabilidad:

Registrar la participación de una Inscripción en un Evento.

Relaciones:

* Pertenece a una Inscripción.
* Pertenece a un Evento.
* Registra el Usuario que capturó la asistencia.

---

## Evaluación

Responsabilidad:

Registrar el resultado académico de una Inscripción.

Relaciones:

* Pertenece a una Inscripción.

---

## Certificado

Responsabilidad:

Registrar la conclusión del Libro.

Relaciones:

* Pertenece a una Inscripción.

---

## Sacramento

Responsabilidad:

Registrar el historial sacramental del Alumno.

Relaciones:

* Pertenece a un Alumno.

---

## Usuario

Responsabilidad:

Representar a cualquier persona con acceso a SIGCA.

Roles previstos:

* Administrador
* Coordinador General
* Catequista
* Auxiliar
* Voluntario de Registro
* Consulta

Relaciones:

* Registra asistencias.
* Realiza modificaciones.
* Ejecuta procesos administrativos.

---

# Cardinalidades

| Relación                  | Cardinalidad |
| ------------------------- | ------------ |
| Parroquia → Ciclo         | 1 : N        |
| Ciclo → Grupo             | 1 : N        |
| Libro → Grupo             | 1 : N        |
| Grupo → Inscripción       | 1 : N        |
| Alumno → Inscripción      | 1 : N        |
| Tutor → Inscripción       | 1 : N        |
| Alumno → Sacramento       | 1 : N        |
| Alumno → Código QR        | 1 : 1        |
| Inscripción → Credencial  | 1 : 1        |
| Evento → Asistencia       | 1 : N        |
| Inscripción → Asistencia  | 1 : N        |
| Inscripción → Evaluación  | 1 : N        |
| Inscripción → Certificado | 1 : N        |

---

# Restricciones de Integridad

* No pueden existir Inscripciones sin Alumno.
* No pueden existir Grupos sin Ciclo.
* No pueden existir Grupos sin Libro.
* No pueden existir Asistencias sin Evento.
* No pueden existir Asistencias sin Inscripción.
* No puede existir más de una Inscripción activa para el mismo Alumno en el mismo Ciclo.
* El Código QR debe ser único.
* La CURP debe ser única cuando exista.
* Toda Credencial debe estar asociada a una Inscripción.

---

# Decisiones de Diseño

1. La entidad central es **Inscripción**.
2. El historial nunca se sobrescribe.
3. Los datos permanentes pertenecen al Alumno.
4. Los datos operativos pertenecen a la Inscripción.
5. Las asistencias se registran sobre Eventos.
6. El Código QR identifica únicamente al Alumno.
7. El modelo privilegia trazabilidad e historial sobre simplicidad aparente.

---

# Próximo Paso

Este modelo conceptual servirá como base para:

* Diseño físico de PostgreSQL.
* Migraciones de Supabase.
* Políticas RLS.
* Repositorios del backend.
* APIs REST.
* Frontend.
* Reportes y estadísticas.
