# SPEC-009
# Frontend Foundation

| Campo | Valor |
|-------|-------|
| Identificador | SPEC-009 |
| Nombre | Frontend Foundation |
| Estado | Draft |
| Versión | 2.0.0 |
| Prioridad | Alta |
| Tipo | Foundation Specification |
| Fase | Desarrollo de la Aplicación |
| Dependencias | SPEC-008 – Application Foundation |
| Estándares Relacionados | SPEC_STANDARDS, TYPESCRIPT_STANDARDS, API_STANDARDS, NAMING_CONVENTIONS |
| Responsable | Equipo de Ingeniería SIGCA |

---

# Historial de Versiones

| Versión | Fecha | Autor | Descripción |
|----------|-------|--------|-------------|
| 1.0.0 | 2026-07-16 | Equipo SIGCA | Primera versión del Frontend Foundation |
| 2.0.0 | 2026-07-18 | Equipo SIGCA | Adaptación completa al estándar SPEC_STANDARDS |

---

# 1. Introducción

Una vez finalizada la arquitectura general del sistema (SPEC-008) y concluida la implementación de la plataforma de datos, inicia la etapa de construcción de la aplicación.

Este documento define la infraestructura técnica y visual del Frontend de SIGCA.

Su propósito es establecer una base sólida, consistente y escalable que permita desarrollar todos los módulos funcionales del sistema sin necesidad de replantear la arquitectura en fases posteriores.

El Frontend Foundation constituye el primer entregable visible del sistema y será el punto de partida para el desarrollo del Dashboard, la autenticación y los módulos de negocio.

---

# 2. Definición del Problema

Actualmente SIGCA dispone de:

- Plataforma de Base de Datos.
- Backend.
- Arquitectura Modular.
- Estándares de Ingeniería.
- Convenciones de desarrollo.
- Configuración del proyecto.

Sin embargo, todavía no existe una aplicación Frontend que permita a los usuarios interactuar con el sistema.

La ausencia de una infraestructura visual provoca que cualquier desarrollo funcional deba crear componentes, navegación y estilos de forma aislada, aumentando el riesgo de inconsistencias y duplicación de código.

Es necesario construir una plataforma Frontend que proporcione:

- identidad institucional;
- navegación uniforme;
- componentes reutilizables;
- arquitectura modular;
- experiencia responsive;
- configuración desacoplada de la Base de Datos.

---

# 3. Objetivo

Construir la infraestructura base del Frontend de SIGCA utilizando React, TypeScript, Vite y Materialize CSS, implementando una arquitectura modular alineada con el Backend y proporcionando todos los componentes necesarios para desarrollar las funcionalidades del sistema.

---

# 4. Alcance

Este SPEC comprende exclusivamente la infraestructura del Frontend.

Incluye:

- Configuración del proyecto React.
- Configuración de Vite.
- Configuración de TypeScript.
- Integración de Materialize CSS.
- Arquitectura del Frontend.
- Organización modular.
- Sistema de Layout.
- Navegación.
- Sidebar responsive.
- Header.
- Footer.
- Sistema de rutas.
- Sistema de temas.
- Configuración institucional.
- Componentes reutilizables.
- Página principal.
- Página 404.
- Página de error.
- Página de mantenimiento.

No incluye:

- Login.
- Autenticación.
- Dashboard funcional.
- Consumo de APIs.
- Formularios de negocio.
- Persistencia de información.
- Gestión de usuarios.

---

# 5. Dependencias

## Especificaciones

- SPEC-008 – Application Foundation

---

## Engineering Decisions

- DEC-017 – Preferencia por la Simplicidad Arquitectónica.
- DEC-018 – Arquitectura Modular por Dominios.
- DEC-019 – Arquitectura Base Congelada.

---

## Estándares

- SPEC_STANDARDS
- TYPESCRIPT_STANDARDS
- API_STANDARDS
- NAMING_CONVENTIONS

---

## Tecnologías

- React
- TypeScript
- Vite
- Materialize CSS
- React Router DOM
- Zod

---

# 6. Historias de Usuario

## HU-001

**Como** usuario del sistema

**Quiero** visualizar una interfaz uniforme

**Para** navegar fácilmente entre todas las funcionalidades.

---

## HU-002

**Como** catequista

**Quiero** acceder desde cualquier dispositivo

**Para** utilizar SIGCA desde computadora, tablet o teléfono móvil.

---

## HU-003

**Como** administrador

**Quiero** que toda la aplicación mantenga la misma identidad visual

**Para** transmitir una imagen institucional consistente.

---

## HU-004

**Como** desarrollador

**Quiero** una arquitectura modular

**Para** desarrollar nuevos módulos sin afectar los existentes.

---

## HU-005

**Como** desarrollador

**Quiero** componentes reutilizables

**Para** evitar duplicación de código.

---

## HU-006

**Como** usuario

**Quiero** una navegación intuitiva

**Para** localizar rápidamente cualquier módulo del sistema.

---

## HU-007

**Como** administrador del sistema

**Quiero** modificar la identidad institucional desde archivos de configuración

**Para** evitar dependencias con la Base de Datos durante el arranque.

---

# 7. Objetivos de la Implementación

Al concluir este SPEC deberá existir una aplicación capaz de:

- iniciar correctamente;
- mostrar la identidad institucional;
- cargar la configuración desde archivos;
- navegar entre pantallas;
- responder correctamente en dispositivos móviles;
- utilizar una arquitectura modular;
- servir como base para todos los módulos posteriores.

No deberá existir todavía lógica de negocio.

La finalidad de este SPEC consiste exclusivamente en proporcionar la infraestructura necesaria para comenzar el desarrollo funcional del sistema.

---

# Estado Esperado al Finalizar el SPEC

Al finalizar esta especificación el usuario deberá poder abrir la aplicación y visualizar un Frontend completamente operativo desde el punto de vista estructural.

La aplicación deberá mostrar:

- Header institucional.
- Sidebar responsive.
- Layout principal.
- Sistema de navegación.
- Tema institucional.
- Componentes base.
- Páginas iniciales.
- Configuración desacoplada.

A partir de este momento todos los nuevos módulos utilizarán esta infraestructura como base para su desarrollo.

---

# 8. Requisitos Funcionales

Los siguientes requisitos describen el comportamiento esperado de la infraestructura del Frontend.

| ID | Requisito |
|----|-----------|
| RF-001 | El sistema deberá iniciar correctamente mediante Vite. |
| RF-002 | El sistema deberá utilizar React con TypeScript como tecnología principal. |
| RF-003 | El sistema deberá implementar una arquitectura modular alineada con el Backend. |
| RF-004 | El sistema deberá disponer de un Layout principal reutilizable. |
| RF-005 | El sistema deberá incluir un Header institucional. |
| RF-006 | El sistema deberá incluir un Sidebar responsive. |
| RF-007 | El sistema deberá incluir un Footer reutilizable. |
| RF-008 | El sistema deberá implementar navegación mediante React Router. |
| RF-009 | El sistema deberá disponer de una página inicial. |
| RF-010 | El sistema deberá disponer de una página 404. |
| RF-011 | El sistema deberá disponer de una página de error general. |
| RF-012 | El sistema deberá disponer de una página de mantenimiento. |
| RF-013 | El sistema deberá permitir registrar nuevas rutas sin modificar la arquitectura existente. |
| RF-014 | El sistema deberá utilizar componentes reutilizables. |
| RF-015 | El sistema deberá separar claramente Layouts, Pages y Components. |
| RF-016 | El sistema deberá cargar la configuración institucional desde archivos de configuración. |
| RF-017 | El sistema deberá soportar múltiples módulos funcionales sin modificar el núcleo del Frontend. |
| RF-018 | El sistema deberá centralizar la navegación mediante un único sistema de rutas. |

---

# 9. Requisitos No Funcionales

| ID | Requisito |
|----|-----------|
| RNF-001 | La aplicación deberá seguir una estrategia Mobile First. |
| RNF-002 | La aplicación deberá ser completamente responsive. |
| RNF-003 | El código deberá desarrollarse utilizando TypeScript estricto. |
| RNF-004 | Todos los componentes deberán ser reutilizables. |
| RNF-005 | No deberá existir duplicación de componentes visuales. |
| RNF-006 | El tiempo de inicio local deberá ser inferior a 2 segundos en condiciones normales. |
| RNF-007 | Toda la navegación deberá mantenerse sin recarga completa del navegador. |
| RNF-008 | Los estilos deberán centralizarse para mantener consistencia visual. |
| RNF-009 | La arquitectura deberá facilitar el crecimiento del sistema durante varios años. |
| RNF-010 | El Frontend deberá mantenerse desacoplado del Backend mediante APIs REST. |

---

# 10. Arquitectura del Frontend

La arquitectura del Frontend seguirá los mismos principios establecidos para el Backend: modularidad, separación de responsabilidades y escalabilidad.

## Principios

- Modularidad.
- Componentes reutilizables.
- Separación entre presentación y lógica.
- Configuración centralizada.
- Bajo acoplamiento.
- Alta cohesión.
- Escalabilidad.

## Arquitectura General

```text
Frontend

│

├── Core
│     ├── App
│     ├── Layout
│     ├── Router
│     └── Theme
│
├── Shared
│     ├── Components
│     ├── Hooks
│     ├── Utils
│     ├── Types
│     └── Services
│
└── Modules
      ├── Dashboard
      ├── Students
      ├── Tutors
      ├── Groups
      ├── Attendance
      ├── Sacraments
      └── ...
```

Cada módulo será autónomo y contendrá únicamente la lógica relacionada con su dominio funcional.

---

# 11. Organización del Proyecto

La estructura inicial del Frontend será la siguiente:

```text
frontend/

├── public/
│
├── src/
│
├── assets/
│
├── config/
│
├── core/
│   ├── layouts/
│   ├── router/
│   ├── theme/
│   └── providers/
│
├── modules/
│
├── shared/
│   ├── components/
│   ├── hooks/
│   ├── services/
│   ├── utils/
│   ├── constants/
│   ├── interfaces/
│   └── types/
│
├── App.tsx
└── main.tsx
```

## Responsabilidad de cada carpeta

### assets

Recursos gráficos de la aplicación.

Ejemplos:

- imágenes;
- logotipos;
- iconos personalizados;
- tipografías locales.

### config

Archivos de configuración institucional.

Ejemplos:

- nombre de la parroquia;
- logotipo;
- colores;
- configuración general.

### core

Infraestructura principal del Frontend.

Incluye:

- Layouts;
- Router;
- Theme;
- Providers;
- configuración global.

### modules

Cada funcionalidad del sistema se desarrollará como un módulo independiente.

Ejemplos:

- Students
- Tutors
- Attendance
- Dashboard
- Events

### shared

Elementos reutilizables por cualquier módulo.

Nunca contendrá lógica específica de negocio.

---

# 12. Stack Tecnológico

## Framework

- React

## Lenguaje

- TypeScript

## Build Tool

- Vite

## Estilos

- Materialize CSS

## Navegación

- React Router DOM

## Validaciones

- Zod

## Consumo de APIs

- Fetch API

## Manejo de Fechas

- Day.js (si se requiere en módulos posteriores)

La incorporación de nuevas librerías deberá justificarse mediante un DEC (Decision Record) cuando impacte la arquitectura del proyecto.

---

# 13. Configuración Institucional

Toda la configuración institucional deberá mantenerse fuera de la Base de Datos durante el arranque inicial de la aplicación.

La configuración se almacenará en archivos dedicados.

Ejemplos de información configurable:

- Nombre del sistema.
- Nombre de la parroquia.
- Diócesis.
- Colores institucionales.
- Logotipo.
- Favicon.
- Datos de contacto.
- Redes sociales.
- Configuración regional.
- Idioma por defecto.
- Zona horaria.

## Objetivos

- Evitar consultas innecesarias durante el inicio.
- Facilitar despliegues en diferentes parroquias.
- Reducir dependencias con el Backend.
- Permitir personalización sin recompilar el sistema.

Toda modificación institucional deberá realizarse mediante los archivos de configuración definidos para este propósito.

---

# 14. Integración con el Backend

El Frontend no accederá directamente a la Base de Datos.

Toda interacción con la información del sistema deberá realizarse mediante las APIs definidas por el Backend.

## Principios

- El Frontend desconocerá la estructura interna de la Base de Datos.
- Ningún componente realizará consultas SQL.
- Toda comunicación será mediante HTTP sobre APIs REST.
- Cada módulo consumirá únicamente los endpoints correspondientes a su dominio.
- El Frontend deberá ser reemplazable sin afectar la lógica del Backend.

## Flujo General

```text
Usuario

↓

Frontend

↓

Router

↓

Módulo

↓

Service

↓

API REST

↓

Backend

↓

Base de Datos
```

## Servicios

Cada módulo contará con una carpeta `services` encargada exclusivamente de la comunicación con las APIs.

Ejemplo:

```text
modules/

students/

services/

students.service.ts
```

Las funciones de servicio deberán:

- construir la solicitud;
- validar parámetros;
- interpretar respuestas;
- manejar errores;
- devolver objetos tipados.

---

# 15. Diseño del Frontend

El Frontend seguirá una arquitectura basada en Layouts reutilizables.

## Layout Principal

Toda pantalla funcional utilizará el mismo Layout.

```text
┌──────────────────────────────────────────────┐
│ Header                                       │
├──────────────┬───────────────────────────────┤
│              │                               │
│ Sidebar      │           Content             │
│              │                               │
│              │                               │
├──────────────┴───────────────────────────────┤
│ Footer                                       │
└──────────────────────────────────────────────┘
```

## Header

El Header contendrá:

- Logotipo institucional.
- Nombre del sistema.
- Buscador global (futuro).
- Notificaciones.
- Usuario autenticado.
- Menú de perfil.

## Sidebar

El Sidebar contendrá la navegación principal.

Características:

- colapsable;
- responsive;
- iconografía consistente;
- agrupación por módulos;
- soporte para permisos en futuras versiones.

## Área de Contenido

El contenido será completamente dinámico y dependerá de la ruta activa.

El Layout nunca contendrá lógica de negocio.

## Footer

Mostrará información institucional.

Ejemplo:

- versión;
- copyright;
- nombre de la parroquia;
- enlaces institucionales.

---

# 16. Sistema de Navegación

Toda la navegación utilizará React Router.

## Objetivos

- Navegación rápida.
- Sin recarga de página.
- Escalable.
- Modular.

## Organización

```text
Router

↓

Public Routes

↓

Private Routes

↓

Module Routes
```

Cada módulo será responsable únicamente de registrar sus propias rutas.

## Convenciones

Ejemplos:

```text
/

/dashboard

/students

/students/new

/students/:id

/tutors

/groups

/events
```

Las rutas deberán mantenerse consistentes durante todo el proyecto.

---

# 17. Componentes Compartidos

Todos los componentes reutilizables deberán ubicarse dentro de:

```text
shared/components
```

## Componentes Base

### Navegación

- AppSidebar
- AppHeader
- AppFooter
- AppBreadcrumb

### Botones

- AppButton
- IconButton
- FloatingButton

### Contenedores

- AppCard
- AppPanel
- AppContainer

### Formularios

- AppInput
- AppSelect
- AppCheckbox
- AppTextarea
- AppDatePicker

### Tablas

- AppTable
- AppPagination
- AppSearchBar

### Retroalimentación

- Loader
- EmptyState
- ErrorState
- SuccessMessage

### Ventanas

- AppDialog
- ConfirmDialog

### Utilitarios

- Avatar
- Badge
- Chip
- Tooltip

Todos los componentes deberán:

- ser reutilizables;
- aceptar propiedades tipadas;
- documentar sus props;
- mantener consistencia visual.

---

# 18. Sistema de Diseño (Design System)

El objetivo del Design System consiste en garantizar uniformidad visual en toda la aplicación.

## Colores

Los colores oficiales se obtendrán desde la configuración institucional.

No deberán utilizarse colores codificados directamente en los componentes.

## Tipografía

Se definirá una única familia tipográfica para toda la aplicación.

Los tamaños deberán seguir una escala consistente.

## Espaciados

Todo margen y separación deberá seguir una escala común.

Ejemplo:

- xs
- sm
- md
- lg
- xl

No deberán utilizarse valores arbitrarios.

## Iconografía

Toda la aplicación utilizará una única biblioteca de iconos.

No deberán mezclarse diferentes estilos gráficos.

## Botones

Todos los botones deberán compartir:

- altura;
- radios;
- sombras;
- comportamiento;
- estados.

## Tarjetas

Las tarjetas deberán mantener:

- separación uniforme;
- sombras consistentes;
- encabezados homogéneos.

## Tablas

Las tablas deberán compartir:

- paginación;
- búsqueda;
- ordenamiento;
- selección.

## Formularios

Todos los formularios deberán compartir:

- validaciones;
- mensajes;
- estilos;
- comportamiento.

## Responsive Design

Toda pantalla deberá funcionar correctamente en:

- teléfonos;
- tabletas;
- laptops;
- monitores de escritorio.

El desarrollo seguirá una estrategia **Mobile First**.

---

# Estado Esperado al Finalizar esta Etapa

Al concluir esta fase del SPEC, la arquitectura visual del Frontend deberá encontrarse completamente definida.

Deberán existir lineamientos claros para:

- integración con el Backend;
- estructura del Layout;
- navegación;
- organización de componentes;
- sistema de diseño;
- reutilización de elementos visuales.

A partir de este punto, cualquier módulo funcional (Dashboard, Estudiantes, Catequistas, Sacramentos, etc.) deberá implementarse respetando estas directrices para garantizar una experiencia uniforme y una arquitectura consistente en todo SIGCA.

---

# 19. Seguridad

Aunque este SPEC no implementa autenticación ni autorización, el Frontend deberá prepararse para integrarlas en especificaciones posteriores.

## Lineamientos

- Ningún secreto deberá almacenarse en el código fuente.
- Las variables de entorno deberán administrarse mediante los mecanismos definidos para Vite.
- No deberán existir credenciales embebidas en componentes o servicios.
- El acceso a recursos protegidos dependerá exclusivamente del Backend.
- Las validaciones del Frontend nunca sustituirán las validaciones del servidor.

---

# 20. Rendimiento

El Frontend deberá diseñarse considerando el crecimiento del sistema.

## Objetivos

- Reducir tiempos de carga.
- Minimizar renderizados innecesarios.
- Favorecer la reutilización de componentes.
- Mantener una navegación fluida.

## Lineamientos

- Utilizar Lazy Loading para módulos.
- Dividir el código mediante Code Splitting cuando sea necesario.
- Evitar dependencias innecesarias.
- Mantener componentes pequeños y especializados.
- Optimizar imágenes y recursos estáticos.

---

# 21. Accesibilidad

La aplicación deberá seguir principios básicos de accesibilidad.

## Requisitos

- Navegación mediante teclado.
- Contraste adecuado.
- Etiquetas descriptivas.
- Elementos interactivos identificables.
- Uso correcto de HTML semántico.

La accesibilidad deberá considerarse desde el inicio del desarrollo y no como una etapa posterior.

---

# 22. Estrategia de Pruebas

La infraestructura del Frontend deberá validarse antes de comenzar el desarrollo funcional.

## Pruebas de Infraestructura

| ID | Descripción |
|----|-------------|
| PT-001 | El proyecto inicia correctamente. |
| PT-002 | El Router funciona. |
| PT-003 | El Layout principal se visualiza correctamente. |
| PT-004 | El Sidebar responde a diferentes tamaños de pantalla. |
| PT-005 | El Header muestra la identidad institucional. |
| PT-006 | El Footer permanece consistente en todas las páginas. |
| PT-007 | La navegación no provoca recargas completas. |
| PT-008 | La página 404 funciona correctamente. |

---

# 23. Entregables

Al concluir este SPEC deberán existir, al menos, los siguientes elementos:

## Infraestructura

- Proyecto React inicializado.
- Configuración de TypeScript.
- Configuración de Vite.
- Materialize CSS integrado.
- React Router configurado.

## Arquitectura

- Estructura de carpetas.
- Layout principal.
- Router principal.
- Sistema de temas.
- Configuración institucional.

## Componentes

- Header.
- Sidebar.
- Footer.
- Componentes base.
- Página inicial.
- Página 404.
- Página de mantenimiento.
- Página de error.

---

# 24. Criterios de Aceptación

El SPEC se considerará implementado cuando se cumplan todos los siguientes criterios:

- Todos los requisitos funcionales estén implementados.
- Todos los requisitos no funcionales se encuentren satisfechos.
- La aplicación inicie correctamente.
- El Layout principal funcione.
- La navegación sea completamente operativa.
- El proyecto compile sin errores.
- TypeScript no presente errores de compilación.
- La estructura del proyecto coincida con la arquitectura definida.
- Todos los componentes reutilizables estén disponibles para módulos futuros.

---

# 25. Checklist de Implementación

| ID | Actividad | Relacionado |
|----|-----------|-------------|
| S009-001 | Crear proyecto React con Vite | RF-001 |
| S009-002 | Configurar TypeScript | RF-002 |
| S009-003 | Integrar Materialize CSS | RF-002 |
| S009-004 | Configurar React Router | RF-008 |
| S009-005 | Crear estructura de carpetas | RF-003 |
| S009-006 | Implementar Layout principal | RF-004 |
| S009-007 | Implementar Header | RF-005 |
| S009-008 | Implementar Sidebar | RF-006 |
| S009-009 | Implementar Footer | RF-007 |
| S009-010 | Crear página Home | RF-009 |
| S009-011 | Crear página 404 | RF-010 |
| S009-012 | Crear página de Error | RF-011 |
| S009-013 | Crear página de Mantenimiento | RF-012 |
| S009-014 | Configurar Theme | RF-016 |
| S009-015 | Crear configuración institucional | RF-016 |
| S009-016 | Crear componentes compartidos iniciales | RF-014 |
| S009-017 | Configurar navegación modular | RF-018 |
| S009-018 | Validar arquitectura completa | Todos |

## Estado Inicial

- [ ] S009-001
- [ ] S009-002
- [ ] S009-003
- [ ] S009-004
- [ ] S009-005
- [ ] S009-006
- [ ] S009-007
- [ ] S009-008
- [ ] S009-009
- [ ] S009-010
- [ ] S009-011
- [ ] S009-012
- [ ] S009-013
- [ ] S009-014
- [ ] S009-015
- [ ] S009-016
- [ ] S009-017
- [ ] S009-018

---

# 26. Referencias

## Especificaciones

- SPEC-008 – Application Foundation
- SPEC_STANDARDS

## Engineering Decisions

- DEC-017
- DEC-018
- DEC-019

## Estándares

- TYPESCRIPT_STANDARDS
- API_STANDARDS
- NAMING_CONVENTIONS

## Tecnologías

- React
- Vite
- TypeScript
- Materialize CSS
- React Router DOM
- Zod

---

# Definición de Terminado (Definition of Done)

La implementación de este SPEC se considerará finalizada cuando:

1. Todos los criterios de aceptación hayan sido cumplidos.
2. El checklist de implementación esté completo.
3. La aplicación compile sin errores.
4. Las pruebas de infraestructura hayan sido aprobadas.
5. La arquitectura implementada coincida con la arquitectura documentada.
6. El Frontend se encuentre listo para iniciar el desarrollo de funcionalidades de negocio.

---

# Próxima Especificación

Una vez concluido este documento, el siguiente paso del proyecto será:

**SPEC-010 – Authentication**

Esta especificación implementará:

- Autenticación mediante Supabase Auth.
- Gestión de sesiones.
- Protección de rutas.
- Contexto de autenticación.
- Flujo de inicio y cierre de sesión.
- Recuperación de contraseña.
- Base para autorización por roles.