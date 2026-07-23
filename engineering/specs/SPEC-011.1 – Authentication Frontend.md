# Iteración 11.1

## Objetivo

Implementar la interfaz de inicio de sesión de SIGCA utilizando la infraestructura del Frontend establecida en el SPEC-009, proporcionando una experiencia visual consistente con la identidad institucional del sistema.

## Alcance

### Incluye

Crear la pantalla de Login.
Implementar el formulario de autenticación.
Integrar la pantalla con el sistema de rutas existente.
Aplicar el tema institucional definido en el Frontend.
Mostrar validaciones básicas del formulario (campos requeridos y formato de correo).
Preparar la estructura para la integración con el backend en la siguiente iteración.

### No incluye:

Consumo de APIs.
Autenticación real.
Gestión de sesión.
Persistencia de credenciales.
Recuperación de contraseña.
Registro de usuarios.
Protección de rutas.
Archivos involucrados

La implementación deberá limitarse a los componentes relacionados con la interfaz de autenticación.

Ejemplos:

frontend/src/modules/auth/
frontend/src/routes/
frontend/src/shared/components/
frontend/src/layouts/

No deberán modificarse componentes ajenos al módulo de autenticación salvo que sea estrictamente necesario para registrar la nueva ruta.

## Restricciones
Respetar la arquitectura definida en el SPEC-009.
Utilizar únicamente componentes compartidos cuando existan.
No incorporar nuevas dependencias sin un DEC correspondiente.
No implementar lógica de autenticación.
No consumir servicios del backend.
Criterios de aceptación
Existe una ruta pública para el Login.
La pantalla se muestra correctamente utilizando el tema institucional.
El formulario contiene los campos de correo electrónico y contraseña.
El botón Iniciar sesión permanece disponible.
Se muestran mensajes de validación para campos obligatorios.
El proyecto compila sin errores.

## Estado

⏳ Pendiente

# Iteración 11.1.1 – Bootstrap del Frontend

## Objetivo

Implementar la infraestructura mínima ejecutable del Frontend de SIGCA utilizando React, TypeScript y Vite, dejando la aplicación lista para iniciar y servir como base para las siguientes iteraciones.

---

## Alcance

### Incluye

- Configuración de `package.json`.
- Configuración de `tsconfig.json`.
- Configuración de `vite.config.ts`.
- Implementación de `main.tsx`.
- Implementación de `App.tsx`.
- Configuración del punto de entrada de React.
- Preparación de estilos globales.
- Verificación de compilación y ejecución mediante `npm run dev`.

### No incluye

- React Router.
- Layouts.
- Login.
- Componentes compartidos.
- Materialize CSS.
- Consumo de APIs.
- Autenticación.
- Gestión de sesión.

---

## Archivos Esperados

```text
frontend/
├── package.json
├── tsconfig.json
├── vite.config.ts
├── App.tsx
├── main.tsx
└── src/
    └── styles/
        └── index.css (si es necesario)
```

---

## Criterios de Aceptación

- El proyecto instala correctamente todas sus dependencias.
- `npm run dev` inicia sin errores.
- React renderiza correctamente la aplicación.
- TypeScript compila sin errores.
- La aplicación muestra una pantalla base indicando que el Frontend de SIGCA está operativo.
- La infraestructura queda preparada para continuar con la Iteración 11.1.2.

---

## Entregables

- Proyecto Frontend ejecutable.
- Configuración funcional de React + TypeScript + Vite.
- Punto de entrada de la aplicación implementado.
- Componente raíz implementado.
- Base preparada para la incorporación del sistema de rutas en la siguiente iteración.

---

## Estado

✅ Completado

---

## Prompt de Implementación

```text
Ejecuta el procedimiento definido en:

engineering/procedures/IMPLEMENT_SPEC.md

Implementa:

SPEC-011

Iteración:
11.1.1
```
## Trabajo Pendiente

Las siguientes funcionalidades se implementarán en iteraciones posteriores:

- Sistema de rutas.
- Layouts.
- Integración de Materialize CSS.
- Pantalla de Login.
- Componentes compartidos.
- Autenticación.
- Gestión de sesión.

# Iteración 11.1.2 – Sistema de Rutas y Navegación Base

## Objetivo

Implementar la infraestructura de navegación del Frontend de SIGCA mediante React Router, estableciendo el sistema de rutas públicas y la estructura base de navegación sobre la infraestructura creada en la Iteración 11.1.1.

---

## Alcance

### Incluye

- Integración de React Router DOM.
- Configuración del Router principal de la aplicación.
- Definición de la ruta pública inicial.
- Implementación de la ruta `/login`.
- Organización inicial del sistema de rutas.
- Creación de la estructura base para registrar rutas de módulos.
- Preparación para la incorporación de rutas privadas en iteraciones posteriores.
- Validación de la navegación mediante React Router.

### No incluye

- Layouts.
- Pantalla de Login.
- Componentes visuales.
- Autenticación.
- Gestión de sesión.
- Protección de rutas.
- Consumo de APIs.
- Materialize CSS.
- Componentes compartidos.

---

## Archivos Esperados

```text
frontend/
├── App.tsx
├── main.tsx
└── src/
    ├── routes/
    │   ├── index.tsx
    │   ├── public.routes.tsx
    │   └── index.ts
    └── modules/
        └── auth/
            └── index.ts
```

> La ubicación y nomenclatura de los archivos deberá respetar la arquitectura definida para el proyecto. Durante la implementación podrán crearse archivos adicionales si resultan necesarios para mantener la organización establecida.

---

## Criterios de Aceptación

- React Router DOM se encuentra correctamente integrado.
- La aplicación utiliza un Router único como punto central de navegación.
- Existe una ruta pública `/login`.
- La navegación funciona sin recargar la aplicación.
- La estructura permite registrar nuevas rutas sin modificar la arquitectura existente.
- La aplicación compila sin errores.
- `npm run build` finaliza correctamente.
- `npm run dev` inicia correctamente.

---

## Entregables

- Sistema de rutas implementado.
- Router principal configurado.
- Estructura inicial de rutas públicas.
- Base preparada para incorporar rutas privadas.
- Infraestructura lista para implementar la pantalla de Login en la siguiente iteración.

---

## Trabajo Pendiente

Las siguientes funcionalidades se implementarán en iteraciones posteriores:

- Layout público.
- Componentes compartidos.
- Pantalla de Login.
- Materialize CSS.
- Autenticación.
- Gestión de sesión.
- Protección de rutas.

---

## Estado

✅ Completado

---

## Prompt de Implementación

```text
Ejecuta el procedimiento definido en:

engineering/procedures/IMPLEMENT_SPEC.md

Implementa:

SPEC-011

Iteración:
11.1.2
```
## Trabajo Pendiente

Las siguientes funcionalidades se implementarán en iteraciones posteriores:

- Layout público.
- Pantalla de Login.
- Componentes compartidos.
- Materialize CSS.
- Autenticación.
- Gestión de sesión.
- Protección de rutas.

# Iteración 11.1.3 – Layout Público Base

## Objetivo

Implementar el Layout Público base del Frontend de SIGCA, definiendo la estructura visual común que utilizarán las pantallas públicas del sistema, separando claramente el contenido de la aplicación de la infraestructura de navegación implementada en la Iteración 11.1.2.

---

## Alcance

### Incluye

- Creación del Layout Público base.
- Integración del Layout con React Router.
- Definición de la estructura principal para páginas públicas.
- Configuración del contenedor principal donde se renderizarán las vistas públicas mediante `Outlet`.
- Organización inicial de la carpeta `layouts`.
- Validación de la correcta integración del Layout con la navegación.

### No incluye

- Diseño gráfico institucional.
- Materialize CSS.
- Pantalla de Login.
- Componentes visuales.
- Encabezados (Header).
- Pie de página (Footer).
- Menús.
- Barras de navegación.
- Componentes compartidos.
- Autenticación.
- Gestión de sesión.
- Protección de rutas.
- Consumo de APIs.

---

## Archivos Esperados

```text
frontend/
└── src/
    ├── layouts/
    │   ├── PublicLayout.tsx
    │   └── index.ts
    ├── routes/
    │   ├── router.ts
    │   └── public.routes.tsx
    └── modules/
        └── auth/
            └── index.ts
```

> La ubicación y nomenclatura de los archivos deberá respetar la arquitectura definida para el proyecto. Durante la implementación podrán crearse archivos adicionales si resultan necesarios para mantener la organización establecida.

---

## Criterios de Aceptación

- Existe un Layout Público reutilizable.
- El Layout utiliza `Outlet` para renderizar las vistas públicas.
- La ruta `/login` se muestra dentro del Layout Público.
- La navegación continúa funcionando correctamente.
- La estructura permite incorporar nuevas pantallas públicas reutilizando el mismo Layout.
- La aplicación compila sin errores.
- `npm run build` finaliza correctamente.
- `npm run dev` inicia correctamente.

---

## Entregables

- Layout Público implementado.
- Integración del Layout con el sistema de rutas.
- Infraestructura preparada para reutilizar el Layout en futuras pantallas públicas.
- Base lista para implementar la pantalla de Login.

---

## Trabajo Pendiente

Las siguientes funcionalidades se implementarán en iteraciones posteriores:

- Componentes compartidos.
- Materialize CSS.
- Diseño institucional.
- Pantalla de Login.
- Autenticación.
- Gestión de sesión.
- Protección de rutas.
- Layout Privado.

---

## Estado

✅ Completado

---

## Prompt de Implementación

```text
Ejecuta el procedimiento definido en:

engineering/procedures/IMPLEMENT_SPEC.md

Implementa:

SPEC-011

Iteración:
11.1.3
```

## Trabajo Pendiente

- Incorporar el diseño institucional del Layout Público.
- Integrar Materialize CSS.
- Implementar componentes visuales comunes.

## Resultado de la Iteración

Se implementó correctamente el Layout Público base del Frontend de SIGCA.

La infraestructura de navegación ahora permite renderizar las vistas públicas dentro de un contenedor reutilizable mediante `Outlet`, estableciendo una separación clara entre la navegación y la presentación.

La aplicación fue validada mediante:

- npm run build
- npm run dev

La infraestructura quedó preparada para implementar componentes compartidos y la pantalla de Login en las siguientes iteraciones.

# Iteración 11.1.4 – Componentes Compartidos Base

## Objetivo

Implementar la infraestructura inicial de componentes compartidos del Frontend de SIGCA, estableciendo una organización centralizada para componentes reutilizables que serán utilizados por los distintos módulos de la aplicación, sin incorporar aún diseño institucional ni lógica de negocio.

---

## Alcance

### Incluye

- Creación de la estructura base para componentes compartidos.
- Organización de la carpeta `shared/components`.
- Implementación de componentes reutilizables de infraestructura.
- Definición del mecanismo de exportación mediante archivos `index.ts`.
- Integración de los componentes compartidos con el Layout Público cuando sea necesario para validar su funcionamiento.
- Validación de la compilación y ejecución del proyecto.

### No incluye

- Diseño visual institucional.
- Materialize CSS.
- Componentes específicos del Login.
- Componentes de negocio.
- Formularios.
- Validaciones.
- Iconografía institucional.
- Gestión de estado.
- Autenticación.
- Consumo de APIs.
- Componentes exclusivos de módulos funcionales.

---

## Archivos Esperados

```text
frontend/
└── src/
    ├── shared/
    │   ├── components/
    │   │   ├── index.ts
    │   │   └── ...
    │   └── index.ts
    ├── layouts/
    │   └── PublicLayout.tsx
    └── modules/
        └── auth/
            └── index.ts
```

> La ubicación y nomenclatura de los archivos deberá respetar la arquitectura definida para el proyecto. Durante la implementación podrán crearse componentes adicionales si resultan necesarios para mantener una organización consistente y reutilizable.

---

## Criterios de Aceptación

- Existe una carpeta centralizada para componentes compartidos.
- Los componentes pueden importarse mediante archivos `index.ts`.
- La estructura permite reutilizar componentes desde cualquier módulo del sistema.
- No existen dependencias con módulos de negocio.
- El Layout Público continúa funcionando correctamente.
- La aplicación compila sin errores.
- `npm run build` finaliza correctamente.
- `npm run dev` inicia correctamente.

---

## Entregables

- Infraestructura inicial de componentes compartidos.
- Organización del directorio `shared/components`.
- Sistema de exportación centralizado mediante archivos `index.ts`.
- Base preparada para reutilizar componentes en todos los módulos del Frontend.
- Infraestructura lista para implementar la pantalla de Login en la siguiente iteración.

---

## Trabajo Pendiente

Las siguientes funcionalidades se implementarán en iteraciones posteriores:

- Materialize CSS.
- Diseño institucional.
- Componentes específicos del Login.
- Formularios.
- Validaciones.
- Autenticación.
- Gestión de sesión.
- Protección de rutas.
- Componentes específicos de los módulos funcionales.

---

## Estado

✅ Completado

---

## Prompt de Implementación

```text
Ejecuta el procedimiento definido en:

engineering/procedures/IMPLEMENT_SPEC.md

Implementa:

SPEC-011

Iteración:
11.1.4
```

## Resultado de la Iteración

Se implementó correctamente la infraestructura inicial de componentes compartidos del Frontend de SIGCA.

La aplicación dispone ahora de una organización centralizada para componentes reutilizables, con exportaciones unificadas mediante archivos `index.ts`. Se incorporó el componente `PageContainer`, reutilizado por el `PublicLayout`, validando la arquitectura propuesta para el resto del sistema.

La aplicación fue validada mediante:

- npm run build

La infraestructura quedó preparada para implementar la primera pantalla funcional del sistema en la siguiente iteración.

# Iteración 11.1.5 – Integración de Materialize CSS y Pantalla de Login

## Objetivo

Implementar la primera pantalla funcional del Frontend de SIGCA integrando Materialize CSS como framework de interfaz de usuario, desarrollando una pantalla de Login institucional que utilice la identidad visual definida para el proyecto y la infraestructura implementada en las iteraciones anteriores.

---

## Alcance

### Incluye

- Integración de Materialize CSS al Frontend.
- Configuración global de Materialize.
- Integración de Material Icons.
- Implementación de la pantalla de Login.
- Aplicación de la paleta de colores institucional definida en la documentación de diseño.
- Uso de los logotipos institucionales:
  - `frontend/public/logo-parroquia.png`
  - `frontend/public/logo-catequesis.png`
- Diseño responsive para escritorio, tablet y dispositivos móviles.
- Integración del Login dentro del PublicLayout.
- Preparación del formulario para futuras validaciones y autenticación.
- Validación de compilación y ejecución del proyecto.

### No incluye

- Autenticación.
- Consumo de APIs.
- Integración con Backend.
- Gestión de sesión.
- JWT.
- Protección de rutas.
- Validaciones funcionales.
- Recuperación de contraseña.
- Recordar sesión.
- Internacionalización.

---

## Archivos Esperados

```text
frontend/
├── package.json
└── src/
    ├── layouts/
    │   └── PublicLayout.tsx
    ├── modules/
    │   └── auth/
    │       ├── LoginPage.tsx
    │       ├── LoginForm.tsx
    │       ├── index.ts
    │       └── styles/
    │           └── login.css
    ├── styles/
    │   └── global.css
    └── theme/
        └── materialize.ts
```

> La implementación podrá crear archivos adicionales cuando sean necesarios para mantener la organización modular definida para el proyecto.

---

## Criterios de Aceptación

- Materialize CSS se encuentra correctamente integrado.
- Material Icons se encuentran disponibles.
- La pantalla de Login utiliza el PublicLayout.
- Se muestran correctamente los logotipos institucionales.
- Se aplica la paleta de colores institucional definida para SIGCA.
- El formulario presenta los campos:
  - Usuario
  - Contraseña
- Existe un botón principal "Iniciar Sesión".
- El diseño es responsive.
- No existe lógica de autenticación.
- No existen llamadas al Backend.
- La aplicación compila sin errores.
- `npm run build` finaliza correctamente.
- `npm run dev` inicia correctamente.

---

## Diseño Esperado

La pantalla deberá mantener una apariencia institucional, moderna y limpia.

Elementos mínimos:

- Logo de la Parroquia en la parte superior.
- Logo de Catequesis / SIGCA.
- Nombre del sistema:
  - Sistema Integral de Gestión Catequética
  - SIGCA
- Tarjeta central de acceso.
- Campos de Usuario y Contraseña.
- Botón principal "Iniciar Sesión".
- Pie de página con el nombre de la parroquia y la versión del sistema.

El diseño deberá seguir la guía de identidad visual definida en la documentación de Design del proyecto.

---

## Entregables

- Materialize CSS integrado.
- Material Icons configuradas.
- Pantalla institucional de Login.
- Formulario preparado para la futura integración con autenticación.
- Infraestructura visual lista para iniciar la Iteración 11.2.

---

## Trabajo Pendiente

Las siguientes funcionalidades se implementarán en iteraciones posteriores:

- Validación de credenciales.
- Integración con Backend.
- Supabase Auth.
- JWT.
- Gestión de sesión.
- Recuperación de contraseña.
- Protección de rutas.
- Layout Privado.

---

## Estado

⏳ Pendiente

---

## Prompt de Implementación

```text
Ejecuta el procedimiento definido en:

engineering/procedures/IMPLEMENT_SPEC.md

Implementa:

SPEC-011

Iteración:
11.1.5
```

## Pendientes de Diseño

Confirmar oficialmente la paleta institucional (colores primario, secundario y de apoyo) para garantizar consistencia visual en todo el Frontend.

# Iteración 11.1.6 – Pantalla de Login Institucional

## Objetivo

Implementar la primera pantalla funcional del Frontend de SIGCA, correspondiente al acceso al sistema, utilizando la infraestructura creada en las iteraciones anteriores y respetando la identidad visual definida en los documentos de diseño.

---

## Alcance

### Incluye

- Implementación del diseño institucional de la pantalla de Login.
- Uso del `PublicLayout`.
- Uso de Materialize CSS.
- Uso del tema institucional.
- Uso de los logotipos:

  - `frontend/public/logo-parroquia.png`
  - `frontend/public/logo-catequesis.png`

- Diseño responsive.
- Tarjeta central de autenticación.
- Formulario visual de acceso.
- Integración de componentes reutilizables cuando existan.
- Pie institucional.

---

### No incluye

- Autenticación.
- Consumo de APIs.
- Backend.
- Supabase.
- JWT.
- Gestión de sesión.
- Recuperación de contraseña.
- Protección de rutas.
- Validaciones funcionales.

---

## Diseño Esperado

La pantalla deberá transmitir una imagen moderna, limpia e institucional.

### Encabezado

- Logo de la Parroquia.
- Logo de Catequesis.
- Nombre de la parroquia.
- Nombre del sistema.

### Contenido

Tarjeta centrada con:

- Usuario
- Contraseña
- Botón **Iniciar Sesión**

### Pie

Mostrar:

- Nombre del sistema.
- Versión.
- Nombre de la Parroquia.

---

## Criterios de Aceptación

- El Login utiliza el `PublicLayout`.
- Se visualizan correctamente ambos logotipos institucionales.
- El formulario se encuentra centrado.
- El diseño es completamente responsive.
- Materialize CSS se utiliza como base visual.
- La pantalla no contiene lógica de autenticación.
- La aplicación compila correctamente.
- `npm run build` finaliza sin errores.
- `npm run dev` inicia correctamente.

---

## Archivos Esperados

```text
frontend/
└── src/
    └── modules/
        └── auth/
            ├── LoginPage.tsx
            ├── LoginForm.tsx
            ├── styles/
            │   └── login.css
            └── index.ts
```

---

## Entregables

- Pantalla institucional de Login.
- Diseño responsive.
- Integración con PublicLayout.
- Uso del tema institucional.
- Uso de Materialize CSS.
- Preparación para integrar autenticación en la Iteración 11.2.

---

## Trabajo Pendiente

Las siguientes funcionalidades se implementarán en iteraciones posteriores:

- Validación de credenciales.
- Integración con Backend.
- Supabase Auth.
- JWT.
- Gestión de sesión.
- Protección de rutas.
- Recuperación de contraseña.

---

## Estado

⏳ Pendiente

---

## Prompt de Implementación

```text
Ejecuta el procedimiento definido en:

engineering/procedures/IMPLEMENT_SPEC.md

Implementa:

SPEC-011

Iteración:
11.1.6
```

## Reporte de Implementación

La sección "Riesgos detectados" únicamente deberá incluir riesgos reales derivados de la implementación realizada.

No deberán reportarse como riesgos:

- decisiones de diseño previamente aprobadas;
- configuración del entorno local de desarrollo;
- procesos activos de Vite;
- vulnerabilidades conocidas de dependencias que no afecten la funcionalidad implementada;
- elementos ya definidos en los documentos oficiales del proyecto (DESIGN, ADR, DEC, SPEC).

Si no existen riesgos relevantes, deberá indicarse:

Riesgos detectados:
Ninguno.

# Iteración 11.1.7 – Hardening del Frontend

## Objetivo

Realizar una revisión técnica final del Frontend para eliminar código innecesario, completar la integración de Materialize CSS y dejar la infraestructura preparada para iniciar la implementación de la autenticación.

Esta iteración no incorpora nuevas funcionalidades de negocio.

---

## Alcance

### Incluye

- Integración completa de Materialize JavaScript.
- Inicialización controlada de Materialize únicamente donde sea requerida.
- Eliminación de archivos CSS sin uso.
- Limpieza de imports no utilizados.
- Eliminación de código muerto.
- Revisión de la organización del tema visual.
- Validación de que todos los estilos provengan del Design System.
- Revisión de la estructura del Login.
- Normalización de la visualización de logotipos (sin modificar los recursos gráficos originales).
- Validación final del Frontend.

---

### No incluye

- Autenticación.
- Backend.
- Supabase.
- JWT.
- Contexto de autenticación.
- Guards.
- Consumo de APIs.
- Dashboard.
- Nuevos componentes de negocio.

---

## Criterios de Aceptación

### Materialize

- Materialize CSS permanece correctamente integrado.
- Materialize JavaScript queda integrado.
- No utilizar `M.AutoInit()` de forma global.
- Utilizar inicialización específica únicamente cuando un componente la requiera.
- `M.updateTextFields()` deberá ejecutarse cuando sea necesario para garantizar el comportamiento correcto de los campos de formulario.
- La infraestructura deberá quedar preparada para futuros componentes como:
  - Modal
  - Select
  - DatePicker
  - Dropdown
  - Tabs
  - Tooltip
  - Sidenav

---

### Código

- No existen archivos CSS sin uso.
- No existen imports sin utilizar.
- No existen estilos duplicados.
- No existe código muerto.
- No existen colores codificados directamente.
- No existen tamaños tipográficos codificados fuera del tema.

---

### Login

- Mantiene el diseño institucional aprobado.
- Los logotipos permanecen alineados.
- Se conserva la jerarquía tipográfica definida en DESIGN-003.
- La pantalla continúa siendo completamente responsive.

---

### Arquitectura

Verificar cumplimiento de:

- DESIGN-001
- DESIGN-002
- DESIGN-003

No deberán existir desviaciones arquitectónicas.

---

### Calidad

Validar:

- npm install
- npm run dev
- npm run build

Sin errores.

TypeScript deberá permanecer libre de errores.

---

## Archivos Esperados

Los archivos dependerán del resultado de la revisión.

Se espera únicamente modificar aquellos estrictamente necesarios.

Como referencia podrían verse afectados:

```text
frontend/
├── src/
│   ├── main.tsx
│   ├── theme/
│   │   └── materialize.ts
│   ├── styles/
│   │   └── global.css
│   └── modules/
│       └── auth/
│           ├── LoginPage.tsx
│           └── styles/
│               └── login.css
└── styles.css (eliminación si no está en uso)
```

---

## Entregables

- Materialize correctamente preparado para componentes interactivos.
- Eliminación de archivos y código sin uso.
- Limpieza de imports.
- Validación completa del Frontend.
- Infraestructura lista para iniciar la autenticación.

---

## Trabajo Pendiente

La Iteración 11.2 iniciará la infraestructura de autenticación mediante:

- AuthContext
- AuthProvider
- Cliente HTTP
- Integración con Backend
- Gestión de sesión
- Protección de rutas

---

## Estado

⏳ Pendiente

---

## Prompt de Implementación

```text
Ejecuta el procedimiento definido en:

engineering/procedures/IMPLEMENT_SPEC.md

Implementa:

SPEC-011

Iteración:
11.1.7

Observaciones:

Esta iteración corresponde al hardening del Frontend.

No deberán agregarse nuevas funcionalidades.

El objetivo es realizar una limpieza técnica de la infraestructura existente.

Realizar las siguientes actividades:

- Integrar correctamente Materialize JavaScript.
- Preparar la inicialización controlada de Materialize evitando el uso de M.AutoInit() global.
- Utilizar inicialización específica únicamente cuando sea requerida.
- Garantizar el correcto comportamiento de los campos del Login.
- Eliminar archivos CSS sin uso.
- Eliminar imports innecesarios.
- Eliminar código muerto.
- Validar que todos los estilos provengan del Design System.
- Verificar que la implementación continúe respetando DESIGN-001, DESIGN-002 y DESIGN-003.

Al finalizar ejecutar:

- npm install
- npm run build

y entregar el reporte habitual indicando únicamente los archivos realmente modificados.
```