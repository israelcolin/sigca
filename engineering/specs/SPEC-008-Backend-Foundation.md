# SPEC-008
# Backend Foundation & Application Architecture

| Campo | Valor |
|-------|-------|
| **Identificador** | SPEC-008 |
| **Nombre** | Backend Foundation & Application Architecture |
| **Versión** | 1.0 |
| **Estado** | 🟡 En Desarrollo |
| **Prioridad** | Alta |
| **Autor** | Eduardo Sánchez |
| **Arquitectura** | Clean Architecture |
| **Fecha de creación** | 2026-07-16 |
| **Dependencias** | SPEC-001 a SPEC-007 |

---

# 1. Introducción

## 1.1 Propósito

Este documento define la arquitectura técnica y funcional sobre la que será construido el Sistema Integral de Gestión Catequética (SIGCA).

A diferencia de las especificaciones anteriores, cuyo objetivo fue definir el modelo de negocio y la plataforma de datos, esta especificación establece las bases para el desarrollo de la aplicación, incluyendo la organización del código, la experiencia de usuario, la navegación, la estructura del proyecto, los componentes reutilizables y las convenciones que deberán seguirse durante todo el ciclo de vida del sistema.

Este documento se convierte en la referencia principal para cualquier desarrollador que participe en el proyecto y deberá utilizarse como guía obligatoria para la implementación de nuevas funcionalidades.

---

## 1.2 Objetivos

La presente especificación tiene como objetivos:

- Definir una arquitectura robusta, mantenible y escalable.
- Establecer una separación clara entre responsabilidades.
- Garantizar una experiencia de usuario consistente en todos los dispositivos.
- Centralizar la configuración institucional del sistema.
- Definir estándares de desarrollo para Backend y Frontend.
- Reducir deuda técnica desde el inicio del proyecto.
- Facilitar el crecimiento del sistema hacia múltiples parroquias sin modificar la arquitectura base.

---

## 1.3 Alcance

Esta especificación comprende el diseño técnico de toda la aplicación.

Incluye:

- Arquitectura Backend.
- Arquitectura Frontend.
- Organización del proyecto.
- Sistema de configuración.
- Navegación.
- Layout institucional.
- Sistema de componentes.
- Gestión del estado.
- Seguridad.
- Manejo de errores.
- Registro de eventos (Logging).
- Convenciones de desarrollo.
- Estrategia de implementación.

No incluye reglas de negocio específicas de catequesis, las cuales permanecen documentadas en las especificaciones funcionales previas.

---

## 1.4 Objetivos No Funcionales

SIGCA deberá cumplir los siguientes atributos de calidad:

### Escalabilidad

La arquitectura deberá permitir incorporar nuevos módulos sin modificar la estructura existente.

### Mantenibilidad

El código deberá estar organizado por responsabilidades claramente definidas, facilitando futuras modificaciones.

### Disponibilidad

La aplicación deberá mantener su identidad visual y capacidad de comunicación con el usuario incluso cuando los servicios de Base de Datos no estén disponibles.

### Rendimiento

Las operaciones más frecuentes deberán responder de manera ágil utilizando índices, vistas y funciones previamente implementadas en la Base de Datos.

### Seguridad

Toda comunicación con la Base de Datos deberá realizarse mediante autenticación y políticas de seguridad definidas en Supabase.

### Portabilidad

La aplicación deberá funcionar correctamente en equipos de escritorio, tabletas y teléfonos móviles sin requerir versiones independientes.

### Configuración Centralizada

La identidad institucional del sistema (logos, colores, textos, imágenes y parámetros visuales) residirá en archivos de configuración del proyecto y nunca dependerá de la Base de Datos para su funcionamiento.

---

# 2. Visión Arquitectónica

SIGCA será desarrollado bajo una arquitectura en capas, donde cada componente tendrá una responsabilidad única y claramente definida.

La solución se dividirá en cuatro grandes bloques:

```text
                Usuario
                    │
                    ▼
        Frontend (React + MUI)
                    │
             REST API (Express)
                    │
      Services / Business Logic
                    │
         Repositories (Supabase)
                    │
             PostgreSQL / RLS
```

Cada capa conocerá únicamente la inmediatamente inferior, evitando dependencias innecesarias y facilitando las pruebas, el mantenimiento y la evolución del sistema.

---

## 2.1 Filosofía del Proyecto

SIGCA no pretende ser únicamente un sistema administrativo.

Su propósito es convertirse en una plataforma tecnológica que facilite el trabajo pastoral de la catequesis.

Por esta razón, cada decisión técnica deberá contribuir a los siguientes principios:

- Simplicidad para el usuario.
- Consistencia visual.
- Facilidad de aprendizaje.
- Rapidez de operación.
- Confiabilidad.
- Escalabilidad.
- Bajo costo de mantenimiento.

La tecnología deberá ser prácticamente invisible para el usuario final, permitiendo que la atención permanezca en la labor pastoral y no en el uso del sistema.

---

## 2.2 Principios Rectores

Toda implementación realizada a partir de esta especificación deberá respetar los siguientes principios:

### Arquitectura limpia (Clean Architecture)

Las reglas de negocio no dependerán de frameworks ni tecnologías específicas.

---

### Responsabilidad Única

Cada componente deberá tener una única responsabilidad claramente definida.

---

### Reutilización

Antes de crear un nuevo componente deberá verificarse si uno existente puede reutilizarse.

---

### Configuración sobre Programación

Las características institucionales deberán resolverse mediante archivos de configuración y no mediante cambios de código.

---

### Responsive First

Toda pantalla deberá funcionar correctamente en:

- Escritorio.
- Tabletas.
- Teléfonos móviles.

---

### Accesibilidad

Todas las interfaces deberán ser navegables mediante teclado y cumplir las recomendaciones de accesibilidad proporcionadas por Material UI.

---

### Experiencia de Usuario

El usuario deberá poder realizar las tareas más frecuentes con el menor número posible de acciones.

---

### Consistencia

Todos los módulos deberán compartir la misma estructura visual, patrones de navegación y comportamiento.

---

## 2.3 Resultado Esperado

Al finalizar la implementación de esta especificación, SIGCA contará con una plataforma moderna, modular y preparada para crecer durante muchos años sin necesidad de rediseñar su arquitectura principal.

La incorporación de nuevas parroquias, módulos o funcionalidades deberá realizarse mediante extensión de los componentes existentes y nunca mediante la modificación de la arquitectura base.

---

## Estado de Implementación

| Elemento | Estado |
|-----------|--------|
| Documento | 🟡 En Desarrollo |
| Arquitectura | ☐ Pendiente |
| Backend | ☐ Pendiente |
| Frontend | ☐ Pendiente |
| Navegación | ☐ Pendiente |
| Componentes | ☐ Pendiente |
| Configuración | ☐ Pendiente |
| Validación | ☐ Pendiente |

# 3. Stack Tecnológico

## 3.1 Objetivo

Definir oficialmente el conjunto de tecnologías que conformarán la primera versión de SIGCA.

La selección de tecnologías se realizó considerando los siguientes criterios:

- Estabilidad.
- Comunidad activa.
- Curva de aprendizaje.
- Escalabilidad.
- Compatibilidad con Supabase.
- Compatibilidad con TypeScript.
- Mantenimiento a largo plazo.

Las tecnologías definidas en esta sección se consideran parte de la arquitectura base del proyecto y únicamente podrán modificarse mediante una nueva decisión de arquitectura.

---

# 3.2 Arquitectura General

La aplicación estará dividida en cuatro grandes bloques independientes.

```text
┌────────────────────────────────────────────┐
│                Frontend                    │
│ React + TypeScript + Material UI + Vite    │
└───────────────────────────┬────────────────┘
                            │
                       REST API
                            │
┌───────────────────────────▼────────────────┐
│                 Backend                    │
│ Express + TypeScript + Supabase SDK        │
└───────────────────────────┬────────────────┘
                            │
                    PostgreSQL
                            │
┌───────────────────────────▼────────────────┐
│          Supabase Platform                 │
│ Auth │ Storage │ PostgreSQL │ RLS          │
└────────────────────────────────────────────┘
```

Cada capa tendrá responsabilidades claramente definidas y dependerá únicamente de la capa inmediatamente inferior.

---

# 3.3 Backend

## Tecnologías

| Tecnología | Uso |
|------------|-----|
| Node.js | Runtime |
| Express | Framework HTTP |
| TypeScript | Lenguaje |
| Supabase JS | Acceso a Base de Datos |
| PostgreSQL | Persistencia |
| Zod | Validación |
| Pino | Logging |
| dotenv | Variables de entorno |
| UUID | Identificadores |

---

## Justificación

Express continúa siendo uno de los frameworks más maduros para APIs REST.

Su sencillez permitirá mantener el control total de la arquitectura sin introducir complejidad innecesaria.

El Backend será completamente Stateless.

No almacenará sesiones.

Toda autenticación será delegada a Supabase.

---

## Decisión

No se utilizarán frameworks como:

- NestJS
- Adonis
- Loopback

Aunque ofrecen muchas funcionalidades, para la primera versión incrementarían la complejidad del proyecto sin aportar beneficios proporcionales.

---

# 3.4 Frontend

## Tecnologías

| Tecnología | Uso |
|------------|-----|
| React | Framework UI |
| TypeScript | Lenguaje |
| Vite | Build Tool |
| Material UI | Componentes |
| React Router | Navegación |
| TanStack Query | Gestión de datos remotos |
| React Hook Form | Formularios |
| Zod | Validaciones |

---

## Justificación

React proporciona un ecosistema suficientemente maduro para construir aplicaciones empresariales.

Material UI ofrece:

- excelente accesibilidad;
- componentes consistentes;
- soporte para temas;
- diseño responsive;
- mantenimiento a largo plazo.

La combinación React + Material UI permitirá desarrollar una interfaz moderna, consistente y adaptable a distintos dispositivos.

---

## Decisión

No se utilizarán:

- Bootstrap
- Materialize
- Tailwind como framework principal

Tailwind podrá evaluarse únicamente para componentes muy específicos si existiera una justificación técnica clara.

El diseño institucional de SIGCA estará basado completamente en Material UI.

---

# 3.5 Base de Datos

## Tecnologías

| Tecnología | Uso |
|------------|-----|
| PostgreSQL 16 | Motor de Base de Datos |
| Supabase | Plataforma |
| RLS | Seguridad |
| Views | Consultas |
| Functions | Lógica SQL |
| Seeds | Datos iniciales |

---

## Justificación

Toda la lógica estructural fue implementada durante la Fase 3.

El Backend consumirá las tablas, vistas y funciones existentes sin modificar directamente la estructura de la Base de Datos.

---

# 3.6 Gestión del Código

## Herramientas

| Herramienta | Uso |
|-------------|-----|
| Git | Control de versiones |
| GitHub | Repositorio |
| VSCode | IDE |
| Markdown | Documentación |

---

## Estrategia

Todo cambio deberá seguir el flujo:

```text
SPEC

↓

Implementación

↓

Validación

↓

Documentación

↓

Commit

↓

Tag (cuando aplique)
```

No se implementará código sin una especificación previa aprobada.

---

# 3.7 Filosofía Tecnológica

SIGCA prioriza:

- Simplicidad.
- Mantenibilidad.
- Legibilidad.
- Escalabilidad.

Sobre:

- Modas tecnológicas.
- Frameworks complejos.
- Dependencias innecesarias.

Cada nueva dependencia deberá justificar claramente el beneficio que aporta al proyecto.

---

# 3.8 Decisiones de Arquitectura

## DEC-008.1

### Decisión

Backend basado en Express.

### Justificación

Mayor control de la arquitectura y menor complejidad.

### Consecuencias

Arquitectura ligera y fácil de mantener.

---

## DEC-008.2

### Decisión

Frontend basado en React + Material UI.

### Justificación

Componentes maduros, excelente experiencia responsive y soporte para temas.

### Consecuencias

Consistencia visual y facilidad de evolución.

---

## DEC-008.3

### Decisión

Configuración institucional almacenada en archivos y no en la Base de Datos.

### Justificación

La aplicación debe poder iniciar incluso cuando la Base de Datos no esté disponible.

### Consecuencias

Las pantallas de error, login e identidad visual siempre estarán disponibles.

---

## Checklist

| Elemento | Estado |
|-----------|--------|
| Backend definido | ☐ |
| Frontend definido | ☐ |
| Base de Datos definida | ☑ |
| Herramientas definidas | ☑ |
| Arquitectura aprobada | ☐ |

# 4. Arquitectura del Proyecto

## 4.1 Objetivo

Definir la estructura física del proyecto y la responsabilidad de cada uno de sus componentes.

La organización del código constituye una de las decisiones arquitectónicas más importantes de SIGCA.

Una estructura consistente permitirá:

- Reducir la curva de aprendizaje.
- Facilitar el mantenimiento.
- Evitar dependencias innecesarias.
- Favorecer la reutilización.
- Permitir el crecimiento del sistema sin reorganizar carpetas.

Toda nueva funcionalidad deberá integrarse respetando esta estructura.

---

# 4.2 Arquitectura General

SIGCA estará compuesto por cuatro grandes bloques.

```text
SIGCA
│
├── backend/
│
├── frontend/
│
├── database/
│
└── engineering/
```

Cada bloque representa una responsabilidad claramente definida.

Ningún bloque deberá asumir responsabilidades de otro.

---

# 4.3 Backend

Responsable de:

- API REST
- Reglas de negocio
- Validaciones
- Seguridad
- Integración con Supabase
- Auditoría
- Logging

No contendrá:

- HTML
- CSS
- Componentes gráficos
- Consultas SQL incrustadas (salvo casos excepcionales)

---

## Estructura

```text
backend/

src/

config/

controllers/

services/

repositories/

middlewares/

routes/

validators/

dto/

models/

interfaces/

types/

utils/

errors/

logs/

server.ts

app.ts
```

---

## Responsabilidad de cada carpeta

### config

Configuración del Backend.

Ejemplos:

- variables de entorno
- logger
- rutas
- constantes

---

### controllers

Reciben la petición HTTP.

No contienen lógica de negocio.

Su responsabilidad termina al llamar al Service correspondiente.

---

### services

Aquí vive la lógica del sistema.

Es el núcleo del Backend.

Los Services no conocen Express.

No conocen HTTP.

No conocen la interfaz gráfica.

---

### repositories

Encapsulan el acceso a Supabase.

Toda consulta a Base de Datos deberá pasar por un Repository.

Nunca desde un Controller.

Nunca desde un Service.

---

### middlewares

Responsables de:

- autenticación
- autorización
- logging
- manejo de errores
- validaciones comunes

---

### routes

Definen las rutas REST.

No contienen lógica.

Únicamente conectan Controller con Express.

---

### validators

Validaciones utilizando Zod.

Toda petición será validada antes de llegar al Service.

---

### dto

Data Transfer Objects.

Definen exactamente la estructura permitida para intercambio de información.

---

### models

Representan entidades utilizadas por la aplicación.

No representan tablas.

Representan objetos del dominio.

---

### interfaces

Interfaces TypeScript reutilizables.

---

### types

Tipos compartidos.

Enums.

Aliases.

Constantes tipadas.

---

### utils

Funciones auxiliares reutilizables.

Nunca contendrán lógica de negocio.

---

### errors

Errores personalizados del sistema.

---

### logs

Archivos de registro cuando el ambiente lo requiera.

---

# 4.4 Frontend

Responsable de:

- Experiencia de usuario.
- Navegación.
- Presentación.
- Consumo de la API.

Nunca contendrá reglas de negocio.

---

## Estructura

```text
frontend/

public/

images/

icons/

favicon/

src/

assets/

components/

config/

hooks/

layouts/

pages/

routes/

services/

store/

styles/

theme/

types/

utils/

App.tsx

main.tsx
```

---

## Responsabilidad

### public

Recursos estáticos.

Aquí vivirán:

logo_parroquia.png

logo_catequesis.png

favicon.ico

fondos institucionales

---

### assets

Recursos utilizados por React.

---

### components

Componentes reutilizables.

Todos comenzarán con:

App

Ejemplos

AppButton

AppCard

AppTable

AppToolbar

AppDialog

---

### layouts

Layouts institucionales.

Ejemplo

AppLayout

LoginLayout

ErrorLayout

---

### pages

Pantallas completas.

Dashboard

Alumnos

Grupos

Eventos

Configuración

---

### routes

Configuración de navegación.

---

### services

Clientes HTTP hacia el Backend.

Nunca accederán directamente a Supabase.

---

### hooks

Hooks reutilizables.

---

### config

Configuración institucional.

---

### theme

Tema Material UI.

---

### styles

Estilos globales.

---

### types

Interfaces compartidas.

---

### utils

Funciones auxiliares.

---

# 4.5 Base de Datos

```text
database/

migrations/

seeds/

fixtures/

scripts/

README.md
```

Esta estructura quedó definida durante la Fase 3.

No deberá modificarse salvo decisión arquitectónica.

---

# 4.6 Ingeniería

```text
engineering/

specs/

decisions/

principles/

procedures/

templates/

diagrams/

journal/

roadmap/
```

Toda documentación técnica deberá residir aquí.

---

# 4.7 Dependencias Permitidas

La siguiente imagen representa las únicas dependencias permitidas entre capas.

```text
Frontend

↓

API

↓

Controller

↓

Service

↓

Repository

↓

Supabase

↓

PostgreSQL
```

Está prohibido:

Controller → Base de Datos

Frontend → Supabase

Service → Express

Repository → HTTP

---

# 4.8 Flujo de una Petición

```text
Usuario

↓

Página

↓

Servicio Frontend

↓

API

↓

Controller

↓

Validator

↓

Service

↓

Repository

↓

Supabase

↓

PostgreSQL
```

La respuesta seguirá exactamente el camino inverso.

---

# 4.9 Reglas Arquitectónicas

1.

Nunca acceder directamente a Supabase desde el Frontend.

2.

Nunca colocar SQL dentro de Controllers.

3.

Nunca colocar lógica de negocio en componentes React.

4.

Toda lógica deberá implementarse en Services.

5.

Toda consulta deberá realizarse mediante Repositories.

6.

Toda configuración institucional deberá residir en archivos de configuración.

7.

Toda nueva funcionalidad deberá respetar esta arquitectura.

---

# Decisiones de Arquitectura

## DEC-008.4

### Decisión

Arquitectura basada en capas.

### Justificación

Separación clara de responsabilidades.

### Consecuencias

Mayor mantenibilidad.

---

## DEC-008.5

### Decisión

Frontend desacoplado completamente de Supabase.

### Justificación

Permitir reemplazar el Backend sin afectar la interfaz.

### Consecuencias

Mayor seguridad.

Mayor escalabilidad.

---

## DEC-008.6

### Decisión

Toda comunicación con la Base de Datos será encapsulada mediante Repositories.

### Justificación

Evitar dependencias directas y facilitar pruebas.

### Consecuencias

Mayor reutilización.

Menor acoplamiento.

---

# Checklist

| Elemento | Estado |
|----------|--------|
| Arquitectura Backend | ☐ |
| Arquitectura Frontend | ☐ |
| Base de Datos | ☑ |
| Flujo de peticiones | ☐ |
| Reglas arquitectónicas | ☐ |
| Validación | ☐ |
