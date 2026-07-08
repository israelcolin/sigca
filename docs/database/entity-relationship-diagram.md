# Entity Relationship Diagram (ERD)

**Proyecto:** SIGCA - Sistema Integral de Gestión Catequética

**Versión:** 1.0

**Estado:** Aprobado

**Fecha:** 08/Jul/2026

---

# Objetivo

Representar gráficamente el modelo entidad-relación del dominio de SIGCA.

Este documento complementa el modelo conceptual (`entity-relationship-model.md`) y servirá como base para el diseño físico de PostgreSQL y las migraciones de Supabase.

---

# Diagrama Conceptual

```mermaid
erDiagram

PARROQUIA ||--o{ CICLO : administra
CICLO ||--o{ GRUPO : contiene
LIBRO ||--o{ GRUPO : organiza

GRUPO ||--o{ EVENTO : programa

EVENTO ||--o{ SESION_EVENTO : genera

SESION_EVENTO ||--o{ ASISTENCIA : registra

ALUMNO ||--o{ INSCRIPCION : realiza
TUTOR ||--o{ INSCRIPCION : representa

GRUPO ||--o{ INSCRIPCION : recibe

ALUMNO ||--|| CODIGO_QR : posee

ALUMNO ||--o{ SACRAMENTO : registra

INSCRIPCION ||--|| CREDENCIAL : genera

INSCRIPCION ||--o{ ASISTENCIA : participa

INSCRIPCION ||--o{ EVALUACION : obtiene

INSCRIPCION ||--o{ CERTIFICADO : genera

USUARIO ||--|| PERFIL : posee

USUARIO ||--o{ USUARIO_ROL : tiene

USUARIO ||--o{ ASISTENCIA : captura
```

---

# Diagrama Relacional

```mermaid
erDiagram

PARROQUIA {
  uuid id PK
  string nombre
}

CICLO {
  uuid id PK
  uuid parroquia_id FK
  string nombre
  date fecha_inicio
  date fecha_fin
}

LIBRO {
  uuid id PK
  string nombre
}

GRUPO {
  uuid id PK
  uuid ciclo_id FK
  uuid libro_id FK
  uuid catequista_id FK
  uuid auxiliar_id FK
  string nombre
}

ALUMNO {
  uuid id PK
  string nombre_completo
}

TUTOR {
  uuid id PK
  string nombre
}

INSCRIPCION {
  uuid id PK
  uuid alumno_id FK
  uuid tutor_id FK
  uuid grupo_id FK
  uuid ciclo_id FK
}

EVENTO {
  uuid id PK
  uuid grupo_id FK
  string tipo
  string nombre
}

SESION_EVENTO {
  uuid id PK
  uuid evento_id FK
  date fecha
  string hora_inicio
  string hora_fin
  string estado
}

ASISTENCIA {
  uuid id PK
  uuid sesion_evento_id FK
  uuid inscripcion_id FK
  uuid usuario_id FK
  string estado
}

CODIGO_QR {
  uuid id PK
  uuid alumno_id FK
  string codigo
}

SACRAMENTO {
  uuid id PK
  uuid alumno_id FK
  string tipo
}

EVALUACION {
  uuid id PK
  uuid inscripcion_id FK
}

CERTIFICADO {
  uuid id PK
  uuid inscripcion_id FK
}

USUARIO {
  uuid id PK
  string nombre
  uuid rol_id FK
  uuid perfil_id FK
}

PERFIL {
    uuid if PK
    string nombre
}

USUARIO_ROL {
    uuid id PK
    string nombre
}

PARROQUIA ||--o{ CICLO : administra
CICLO ||--o{ GRUPO : contiene
LIBRO ||--o{ GRUPO : organiza

GRUPO ||--o{ EVENTO : programa
EVENTO ||--o{ SESION_EVENTO : genera

SESION_EVENTO ||--o{ ASISTENCIA : registra

GRUPO ||--o{ INSCRIPCION : recibe
ALUMNO ||--o{ INSCRIPCION : realiza
TUTOR ||--o{ INSCRIPCION : representa

ALUMNO ||--|| CODIGO_QR : posee
ALUMNO ||--o{ SACRAMENTO : registra

INSCRIPCION ||--|| CREDENCIAL : genera
INSCRIPCION ||--o{ EVALUACION : obtiene
INSCRIPCION ||--o{ CERTIFICADO : genera

USUARIO ||--o{ ASISTENCIA : captura
USUARIO ||--|| PERFIL : posee
USUARIO ||--o{ USUARIO_ROL : tiene
```

---

# Flujo Principal del Dominio

```text
Parroquia
      │
      ▼
Ciclo
      │
      ▼
Libro
      │
      ▼
Grupo
      │
      ▼
Inscripción
 ┌────┼──────────────┬──────────────┐
 ▼    ▼              ▼              ▼
Tutor Credencial  Evaluación   Certificado
 │
 ▼
Alumno
 │
 ├─────────────► Código QR
 │
 └─────────────► Sacramentos

Evento
   │
   ▼
Asistencia

                 USUARIO
                    │
        ┌───────────┴────────────┐
        │                        │
        ▼                        ▼
     PERFIL                 USUARIO_ROL
        │
        │
        └───────────────────────────

USUARIO
   │
   ▼
ASISTENCIA
```

---

# Observaciones de Diseño

## 1. La entidad central del modelo es **Inscripción**.

Toda la operación anual del sistema depende de esta entidad.

---

## 2. Alumno representa únicamente a la persona.

Los cambios de grupo, tutor, libro o ciclo no modifican la información permanente del Alumno.

---

## 3. El Código QR pertenece al Alumno.

No pertenece al Grupo, al Ciclo ni a la Credencial.

---

## 4. Toda asistencia pertenece a un Evento.

Una Clase y una Misa son simplemente distintos tipos de Evento.

Esto permite agregar nuevos eventos sin modificar el modelo.

---

## 5. El historial nunca se pierde.

Cada nueva reinscripción genera un nuevo registro, preservando la información histórica.

---

# Evolución Prevista

El modelo fue diseñado para soportar futuras ampliaciones sin romper la estructura principal:

* Múltiples parroquias.
* Nuevas sedes.
* Nuevos sacramentos.
* Más tipos de eventos.
* Portal para padres.
* Aplicación móvil.
* Integraciones con otros sistemas.

---

# Resultado Esperado

Este diagrama constituye la representación oficial del dominio de datos de SIGCA y será la referencia para:

* Diseño físico en PostgreSQL.
* Migraciones de Supabase.
* Repositorios del backend.
* APIs REST.
* Frontend.
* Reportes.
* Auditoría.
