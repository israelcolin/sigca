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
