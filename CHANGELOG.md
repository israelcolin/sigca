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

## [0.2.0] - 2026-07-16

### Added

- Arquitectura modular Backend
- Arquitectura Frontend
- Implementación completa de PostgreSQL
- Migraciones 001-010
- Seed inicial de catálogos
- Índices de optimización
- Vistas SQL
- Funciones SQL
- Row Level Security
- Congelamiento de la arquitectura base
- Inicio de SPEC-008

## [SPEC-010] - Authentication Backend Completed 2026-07-20

### Added

- Login endpoint.
- User registration endpoint.
- Logout endpoint.
- Password recovery endpoint.
- Request authentication middleware.
- Route protection for authenticated endpoints.
- Stateless Supabase client configuration.
- Standard API responses for authentication flows.

### Changed

- Authentication architecture aligned with DEC-021.
- Authentication middleware integrated into protected routes.

### Fixed

- Removed shared authentication state from the Core.
- Authentication now derives exclusively from the HTTP request context.

# 2026-07-22

## SPEC-011

### Autenticación completa

Se concluyó el flujo completo de autenticación.

Incluye:

- Login real.
- Persistencia del JWT.
- Restauración automática.
- Endpoint GET /auth/session.
- ProtectedRoute.
- PublicRoute.
- Dashboard Base.
- Logout.
- Limpieza automática ante 401.
- Protección contra navegación por historial.

# v0.3.0

## Added

- Nuevo AppLayout reutilizable.
- TopBar institucional.
- SideNav responsivo.
- Footer institucional.
- UserAvatar reutilizable.
- Página temporal ComingSoonPage.
- Configuración centralizada de navegación.
- Configuración centralizada de enlaces externos.
- Soporte para `photoUrl` opcional en AuthenticatedUser.

## Changed

- Dashboard adaptado para funcionar dentro de AppLayout.
- Las rutas privadas ahora utilizan una única estructura visual.
- El logout se integra desde TopBar reutilizando AuthContext.
- Se consolida la arquitectura base para módulos futuros.

## Fixed

- Corrección del comportamiento responsivo del menú lateral.
- Corrección del fondo del SideNav en dispositivos móviles.
- Corrección del fallback del avatar para imágenes inexistentes o inválidas.

## Validation

- Build exitoso.
- Validaciones visuales completadas.
- Validación responsive.
- Restauración de sesión verificada.
- Logout verificado.