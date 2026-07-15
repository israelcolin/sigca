# Changelog

Todos los cambios importantes del proyecto SIGCA serán registrados en este documento.

El formato está inspirado en *Keep a Changelog* y el proyecto utiliza Versionado Semántico.

---

## [0.1.0-alpha] - 2026-07-07

### Ingeniería

* Se creó la arquitectura base del proyecto.
* Se definió la metodología de desarrollo basada en SPEC, ADR, DEC y BRQ.
* Se estructuró el repositorio para soportar documentación técnica y funcional.
* Se configuró el backend con TypeScript y Express.

### Infraestructura

* Integración inicial con Supabase.
* Configuración centralizada mediante variables de entorno.
* Cliente único de Supabase.
* Health Check operativo.

### Documentación Funcional

* Levantamiento inicial de requerimientos (BRQ-001).
* Glosario oficial del dominio.
* Reglas de negocio.
* Modelo del dominio.
* Estrategia de base de datos.
* Modelo entidad-relación conceptual.

### Arquitectura

* Se definió la entidad **Inscripción** como núcleo del dominio.
* Se adoptó un modelo basado en **Eventos** para el registro de asistencias.
* Se estableció el Código QR permanente asociado al Alumno.
* Se definió la separación entre información permanente e información anual.

### Estado del Proyecto

Concluida la fase de Ingeniería y Análisis del Dominio.

El proyecto queda listo para iniciar el diseño físico de la base de datos y el desarrollo de los primeros módulos funcionales.

## [Unreleased]

## 2026-07-08

### Added
- Se completó el modelo físico de la base de datos de SIGCA.
- Implementadas las migraciones:
  - 003_create_organization.sql
  - 004_create_catechesis.sql
  - 005_create_events.sql
  - 006_create_academic.sql
- Se creó la estructura `backend/database/seeds/`.
- Se implementó `001_seed_catalogs.sql` con los catálogos base del sistema.

### Changed
- Se estandarizó la estrategia de Seeds y Fixtures.
- Se actualizó `IMPLEMENT_SPEC.md` con las reglas para implementación de Seeds.
- Se congeló el modelo de dominio para iniciar la fase de desarrollo.

## [0.4.0] - 2026-07-15

### Added

#### Database
- Se completó la plataforma de datos de SIGCA.
- Implementadas las migraciones:
  - 007_create_indexes.sql
  - 008_create_views.sql
  - 009_create_functions.sql
  - 010_create_rls.sql

#### Seeds
- Implementado 001_seed_catalogs.sql con los catálogos base del sistema.

#### Security
- Se habilitó Row Level Security (RLS) para las tablas del sistema.
- Se implementaron las políticas iniciales compatibles con Supabase.

### Changed

- Se formalizó la estructura:
  - migrations/
  - seeds/
  - fixtures/

- Se actualizó IMPLEMENT_SPEC.md para soportar Seeds.

### Completed

- Plataforma de Base de Datos concluida.
- Modelo de dominio congelado.
- Inicio de preparación para Backend.