# SIGCA

## Sistema Integral de Gestión Catequética

SIGCA es una plataforma para la administración integral de procesos catequéticos parroquiales.

Su objetivo es gestionar la operación completa de la catequesis, incluyendo alumnos, tutores, ciclos, grupos, catequistas, asistencias, eventos, evaluaciones, credenciales y certificaciones.

---

## Estado del Proyecto

**Versión actual:** `v0.1.0-alpha`

**Estado:** En desarrollo activo.

### Fases completadas

* Ingeniería del proyecto.
* Arquitectura base.
* Backend inicial.
* Integración con Supabase.
* Análisis funcional del dominio.
* Modelo conceptual de datos.
### Base de datos

✅ Modelo de dominio finalizado.

✅ Migraciones implementadas (001–006).

✅ Catálogos iniciales implementados mediante Seeds.

⏳ Pendiente:
- Índices
- Vistas
- Funciones
- Row Level Security (RLS)


### Próxima fase

Implementación del Backend (API REST).

---

## Tecnologías

### Backend

 ✅ Health Check
- ✅ Welcome Endpoint
- ✅ Authentication
  - Login
  - Register
  - Logout
  - Forgot Password
- ✅ Request Authentication Middleware
- ✅ Protected Routes
- ✅ Supabase Authentication Integration

### Base de Datos

* PostgreSQL
* Supabase

### Frontend (Planeado)

* Materialize CSS

---

## Arquitectura

El proyecto utiliza una arquitectura **Feature First**, complementada con documentación basada en:

* ADR (Architecture Decision Records)
* DEC (Design Decisions)
* SPEC (Implementation Specifications)
* BRQ (Business Requirements Questionnaire)

---

## Documentación

La documentación del proyecto se encuentra organizada de la siguiente manera:

```text
docs/
├── architecture/
├── business/
├── database/
└── decisions/

engineering/
├── decisions/
├── journal/
├── procedures/
├── specs/
└── standards/
```

---

## Principios de Diseño

* El dominio guía el desarrollo.
* Conservación completa del historial.
* Separación entre información permanente y operación anual.
* Escalabilidad para múltiples parroquias.
* Auditoría de operaciones.
* Código desacoplado y documentado.

---

## Estado Actual

El análisis funcional y el modelo conceptual del dominio se encuentran aprobados.

El siguiente hito será el diseño físico de la base de datos y la implementación del esquema inicial en Supabase.

SIGCA prioriza la claridad, la estabilidad y la mantenibilidad por encima de la novedad tecnológica.

