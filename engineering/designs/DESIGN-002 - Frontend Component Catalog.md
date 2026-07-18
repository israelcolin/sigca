# DESIGN-002
# Frontend Component Catalog
## Parte 1 – Fundamentos

| Campo | Valor |
|--------|--------|
| Documento | DESIGN-002 |
| Nombre | Frontend Component Catalog |
| Estado | Approved |
| Versión | 1.0.0 |
| Proyecto | SIGCA |
| Relacionado | DESIGN-001 |

---

# 1. Objetivo

Definir los componentes reutilizables oficiales del frontend de SIGCA.

Todo elemento visual utilizado en la aplicación deberá derivarse de alguno de los componentes documentados en este catálogo.

El objetivo es garantizar:

- consistencia;
- reutilización;
- mantenibilidad;
- accesibilidad;
- escalabilidad.

---

# 2. Alcance

Este documento aplica a:

- React
- TypeScript
- Materialize CSS
- Aplicación Web
- Aplicaciones futuras

---

# 3. Filosofía

Los componentes representan el lenguaje visual del sistema.

Los desarrolladores construirán pantallas utilizando componentes, no HTML directo.

Ejemplo:

Incorrecto

<button class="btn blue">

Correcto

<AppButton />

---

# 4. Principios

Todo componente deberá cumplir:

- reutilizable;
- configurable;
- tipado;
- accesible;
- documentado;
- probado;
- responsive.

---

# 5. Clasificación

Los componentes se agrupan en:

Foundation

↓

Layout

↓

Navigation

↓

Forms

↓

Data Display

↓

Feedback

↓

Business Components

---

# 6. Organización del Proyecto

frontend/

src/

components/

foundation/

layout/

navigation/

forms/

data/

feedback/

business/

hooks/

theme/

---

# 7. Convenciones

Todos los componentes utilizarán:

PascalCase

Ejemplos

AppButton

AppInput

AppCard

AppDialog

---

# 8. Estructura

Todo componente reutilizable deberá mantener:

Component/

Component.tsx

Component.types.ts

Component.styles.ts

index.ts

Component.test.tsx

README.md (opcional)

---

# 9. Props

Toda propiedad deberá declararse mediante interfaces.

Nunca mediante any.

Ejemplo

interface AppButtonProps

---

# 10. Estados

Todo componente deberá documentar:

Default

Hover

Focus

Active

Disabled

Loading

Error

Success (cuando aplique)

---

# 11. Variantes

Cada componente definirá sus variantes oficiales.

Ejemplo

AppButton

Primary

Secondary

Outlined

Text

Danger

Success

Warning

Icon

---

# 12. Eventos

Todo componente documentará:

onClick

onChange

onBlur

onFocus

onSubmit

según corresponda.

---

# 13. Accesibilidad

Todo componente deberá incluir:

ARIA labels

Focus visible

Keyboard navigation

Roles correctos

Compatibilidad con lectores de pantalla

---

# 14. Responsive

Todo componente deberá documentar su comportamiento en:

Desktop

Tablet

Mobile

---

# 15. Foundation Components

Los siguientes componentes constituyen la base del sistema.

AppButton

AppIcon

AppIconButton

AppText

AppLink

AppDivider

AppBadge

AppChip

AppAvatar

AppLogo

Todos los demás componentes deberán construirse reutilizando estos.

---

# 16. Layout Components

Se documentarán en la Parte 2.

AppLayout

PublicLayout

PrivateLayout

Sidebar

Header

Footer

PageContainer

ContentCard

---

# 17. Formularios

Se documentarán en la Parte 3.

AppInput

AppTextarea

AppPasswordInput

AppEmailInput

AppPhoneInput

AppSelect

AppAutocomplete

AppCheckbox

AppRadio

AppSwitch

AppDatePicker

---

# 18. Data Components

Parte 3.

AppTable

AppCard

AppAccordion

AppTabs

AppPagination

AppStatisticCard

---

# 19. Feedback Components

Parte 3.

AppDialog

AppConfirmDialog

AppSnackbar

AppSpinner

AppSkeleton

AppLoadingOverlay

AppEmptyState

AppErrorState

---

# 20. Business Components

Parte 4.

SplashScreen

LoginForm

ForgotPasswordForm

ResetPasswordForm

DashboardCard

UserAvatar

NotificationBell

SessionExpiredDialog

PermissionGuard

ParishLogo

VersionLabel

---

# 21. Regla General

Si un componente puede reutilizarse en más de un módulo, deberá incorporarse a este catálogo antes de implementarse.

No se permitirán componentes reutilizables fuera de la carpeta components.

---

# Fin de la Parte 1

# DESIGN-002
# Frontend Component Catalog
## Parte 2 – Layout Components

| Campo | Valor |
|--------|--------|
| Documento | DESIGN-002 |
| Sección | Layout Components |
| Estado | Approved |
| Proyecto | SIGCA |

---

# 22. Introducción

Los componentes de Layout constituyen la estructura base de toda pantalla de SIGCA.

Su objetivo es proporcionar una distribución uniforme, consistente y adaptable a cualquier módulo del sistema.

Ninguna página deberá implementar su propia estructura visual.

Toda pantalla deberá construirse reutilizando estos componentes.

---

# 23. AppLayout

## Objetivo

Es el contenedor raíz de todas las páginas autenticadas.

Define la estructura principal de la aplicación.

---

## Responsabilidades

- Mostrar Header.
- Mostrar Sidebar.
- Mostrar Footer.
- Administrar el área de contenido.
- Adaptarse al tamaño de pantalla.
- Mantener el layout consistente.

---

## Estructura

```
<AppLayout>

    <Header />

    <Sidebar />

    <MainContent>

        children

    </MainContent>

    <Footer />

</AppLayout>
```

---

## Props

| Prop | Tipo | Obligatorio | Descripción |
|-------|------|-------------|-------------|
| children | ReactNode | Sí | Contenido de la página |

---

## Reglas

Debe existir un único AppLayout activo.

No podrá anidarse.

---

## Responsive

Desktop

Sidebar visible.

Tablet

Sidebar colapsable.

Mobile

Sidebar oculto por defecto.

---

# 24. Header

## Objetivo

Mostrar la identidad del sistema y las acciones globales.

---

## Contenido

Logo SIGCA

↓

Nombre del sistema

↓

Buscador (futuro)

↓

Notificaciones

↓

Perfil

---

## Elementos

Logo

Nombre

Usuario

Avatar

Notificaciones

Configuración

Cerrar sesión

---

## Reglas

Siempre permanecerá fijo.

Nunca contendrá acciones específicas del módulo.

---

# 25. Sidebar

## Objetivo

Proporcionar navegación principal.

---

## Contenido

Dashboard

Catequizandos

Grupos

Catequistas

Sesiones

Asistencia

Sacramentos

Reportes

Configuración

---

## Características

Menú expandible.

Iconos.

Colapsable.

Responsive.

---

## Estados

Expandido.

Colapsado.

Mobile Overlay.

---

## Reglas

Mostrar únicamente opciones permitidas por permisos.

---

# 26. Footer

## Objetivo

Mostrar información institucional.

---

## Contenido

Versión.

Parroquia.

Copyright.

Ambiente.

---

## Reglas

Altura fija.

Información discreta.

---

# 27. MainContent

## Objetivo

Área principal de trabajo.

---

## Contenido

PageHeader

↓

Toolbar (opcional)

↓

Contenido

↓

Acciones

---

## Reglas

No utilizar márgenes manuales.

Toda separación utilizará Design Tokens.

---

# 28. PageContainer

## Objetivo

Contenedor estándar para cualquier página.

---

## Responsabilidades

Limitar ancho.

Administrar espaciados.

Mantener alineación.

---

## Props

| Prop | Tipo |
|------|------|
| fluid | boolean |
| maxWidth | string |

---

# 29. PageHeader

## Objetivo

Mostrar el contexto de la página.

---

## Contenido

Título

↓

Descripción

↓

Breadcrumb

↓

Acciones

---

## Ejemplo

Catequizandos

Administración de catequizandos registrados.

[ Nuevo ]

---

# 30. Breadcrumb

## Objetivo

Mostrar ubicación del usuario.

---

Ejemplo

Inicio

>

Catequesis

>

Catequizandos

---

## Reglas

No utilizar más de cuatro niveles.

---

# 31. Toolbar

## Objetivo

Agrupar acciones de una página.

---

## Acciones comunes

Nuevo

Exportar

Importar

Filtros

Buscar

Actualizar

---

## Reglas

Las acciones primarias aparecerán al inicio.

Las secundarias al final.

---

# 32. ContentCard

## Objetivo

Contenedor principal de información.

---

## Uso

Formularios.

Tablas.

Estadísticas.

Detalles.

---

## Reglas

Una responsabilidad por Card.

No anidar múltiples Cards.

---

# 33. Section

## Objetivo

Dividir visualmente contenido relacionado.

---

## Contenido

Título

↓

Descripción

↓

Contenido

---

# 34. EmptyContainer

## Objetivo

Mostrar estados vacíos de una sección.

---

Ejemplo

"No existen registros."

↓

Botón

Crear Registro

---

# 35. PageActions

## Objetivo

Agrupar acciones principales de la pantalla.

---

Ejemplos

Guardar

Cancelar

Eliminar

Exportar

---

## Posición

Parte superior derecha.

O parte inferior del formulario.

Nunca ambas simultáneamente.

---

# 36. Reglas Generales

Todos los componentes de Layout deberán:

✓ ser responsive;

✓ utilizar Design Tokens;

✓ no contener lógica de negocio;

✓ ser reutilizables;

✓ aceptar children cuando corresponda;

✓ documentar props;

✓ documentar eventos;

✓ ser accesibles;

✓ ser compatibles con teclado.

---

# 37. Componentes Relacionados

Los componentes Layout podrán utilizar únicamente componentes de:

Foundation

Navigation

Feedback

Nunca dependerán de componentes específicos del negocio.

---

# Fin de la Parte 2

# DESIGN-002
# Frontend Component Catalog
## Parte 3 – UI Components

| Campo | Valor |
|--------|--------|
| Documento | DESIGN-002 |
| Sección | UI Components |
| Estado | Approved |
| Proyecto | SIGCA |

---

# 38. Objetivo

Los componentes de UI representan los elementos reutilizables con los que se construirán todas las pantallas de SIGCA.

Estos componentes encapsulan:

- apariencia;
- comportamiento;
- accesibilidad;
- integración con Materialize CSS;
- consistencia visual.

Ninguna página deberá utilizar directamente componentes HTML nativos cuando exista un componente oficial equivalente.

---

# 39. AppButton

## Objetivo

Representar acciones del usuario de forma consistente.

---

## Variantes

Primary

Secondary

Outlined

Text

Success

Warning

Danger

Icon

Loading

---

## Props

| Prop | Tipo | Descripción |
|-------|------|-------------|
| variant | ButtonVariant | Variante visual |
| size | sm \| md \| lg | Tamaño |
| icon | ReactNode | Icono opcional |
| loading | boolean | Estado de carga |
| disabled | boolean | Estado deshabilitado |
| fullWidth | boolean | Ocupar ancho disponible |
| onClick | function | Acción |

---

## Estados

Default

Hover

Focus

Disabled

Loading

Active

---

## Reglas

Debe mostrar spinner durante loading.

Nunca podrá dispararse dos veces mientras loading sea true.

---

# 40. AppIconButton

## Objetivo

Mostrar acciones representadas únicamente mediante un icono.

---

## Uso

Editar

Eliminar

Descargar

Actualizar

Ver

---

## Reglas

Siempre deberá incluir:

aria-label

Tooltip

---

# 41. AppInput

## Objetivo

Capturar texto.

---

## Props

label

placeholder

helperText

error

required

disabled

maxLength

value

onChange

---

## Validaciones

Error visual.

Mensaje contextual.

Indicador de obligatorio.

---

## Estados

Default

Focus

Error

Disabled

Success

---

# 42. AppPasswordInput

Especialización de AppInput.

Incluye:

Mostrar contraseña.

Ocultar contraseña.

Indicador de seguridad (opcional).

---

# 43. AppTextarea

Captura texto extenso.

AutoResize opcional.

Contador de caracteres.

---

# 44. AppSelect

Lista desplegable.

Soporta:

Single Select

Multi Select

Búsqueda

Placeholder

---

# 45. AppCheckbox

Selección booleana.

Compatible con teclado.

---

# 46. AppRadioGroup

Selección única.

---

# 47. AppSwitch

Activación inmediata.

Ejemplo:

Activo

Inactivo

---

# 48. AppDatePicker

Selección de fechas.

Preparado para localización.

Formato configurable.

---

# 49. AppCard

## Objetivo

Contenedor estándar.

---

## Variantes

Default

Elevated

Outlined

Flat

---

## Uso

Formularios

Estadísticas

Reportes

Detalles

---

# 50. AppTable

## Objetivo

Mostrar colecciones de datos.

---

## Funcionalidades

Ordenamiento.

Paginación.

Búsqueda.

Columnas configurables.

Acciones.

Estado vacío.

Loading.

---

## Responsive

Ocultar columnas secundarias.

Scroll horizontal cuando sea necesario.

---

# 51. AppStatisticCard

Mostrar indicadores.

Ejemplo

Catequizandos

256

↑12%

---

# 52. AppAccordion

Mostrar información expandible.

---

# 53. AppTabs

Navegación entre secciones relacionadas.

---

# 54. AppDialog

Diálogo modal.

---

## Variantes

Información.

Confirmación.

Advertencia.

Error.

---

## Botones

Aceptar.

Cancelar.

Cerrar.

---

# 55. AppConfirmDialog

Especialización de AppDialog.

Utilizado para:

Eliminar.

Cancelar.

Cerrar ciclo.

---

# 56. AppSnackbar

Mensajes temporales.

---

## Tipos

Success

Info

Warning

Error

---

## Duración

3 segundos por defecto.

---

# 57. AppSpinner

Indicador de carga.

---

## Tamaños

Small

Medium

Large

---

# 58. AppSkeleton

Placeholder durante carga.

---

## Variantes

Texto

Avatar

Tabla

Card

Formulario

---

# 59. AppLoadingOverlay

Bloquea interacción durante procesos críticos.

---

# 60. AppEmptyState

Mostrar ausencia de información.

---

## Elementos

Icono

Título

Descripción

Acción sugerida

---

# 61. AppErrorState

Mostrar errores recuperables.

---

## Contenido

Mensaje.

Descripción.

Botón Reintentar.

---

# 62. Reglas Generales

Todos los componentes deberán:

✓ aceptar className.

✓ aceptar style únicamente cuando sea estrictamente necesario.

✓ exponer ref cuando aplique.

✓ soportar dark mode en futuras versiones.

✓ respetar Design Tokens.

✓ ser completamente tipados.

✓ ser accesibles.

✓ documentar ejemplos de uso.

---

# 63. Integración con Materialize

Los componentes encapsularán Materialize CSS.

Las páginas nunca dependerán directamente de clases del framework.

Si en el futuro se reemplaza Materialize por otro framework, el impacto deberá limitarse a la capa de componentes.

---

# 64. Compatibilidad

Todos los componentes deberán ser compatibles con:

React 19+

TypeScript

Vite

Supabase Auth

React Router

React Hook Form

Zod

---

# Fin de la Parte 3

# DESIGN-002
# Frontend Component Catalog
## Parte 4 – Estándares de Implementación y Gobernanza

| Campo | Valor |
|--------|--------|
| Documento | DESIGN-002 |
| Sección | Component Standards |
| Estado | Approved |
| Proyecto | SIGCA |

---

# 65. Objetivo

Definir las reglas obligatorias para la creación, mantenimiento y evolución de los componentes reutilizables del frontend.

Estas reglas garantizan que la biblioteca de componentes permanezca consistente durante todo el ciclo de vida del proyecto.

---

# 66. Principios Generales

Todo componente deberá cumplir los siguientes principios:

- Responsabilidad única.
- Alta reutilización.
- Bajo acoplamiento.
- Alta cohesión.
- Configuración mediante propiedades.
- Sin lógica de negocio.
- Independencia del módulo que lo utiliza.

---

# 67. Responsabilidad Única

Cada componente deberá resolver una sola necesidad.

## Correcto

AppButton

↓

Representa una acción.

## Incorrecto

AppButton

↓

Realiza llamadas a la API.

↓

Valida permisos.

↓

Abre diálogos.

---

# 68. Composición sobre Herencia

Los componentes complejos deberán construirse reutilizando componentes existentes.

Ejemplo:

```
PageTemplate
    ├── PageHeader
    ├── Toolbar
    ├── ContentCard
    └── Footer
```

No deberán duplicar funcionalidad.

---

# 69. Dependencias

Los componentes no deberán depender entre sí de forma circular.

Dependencias permitidas:

Foundation

↓

Layout

↓

Navigation

↓

Forms

↓

Data Display

↓

Feedback

Las dependencias deberán fluir únicamente en esa dirección.

---

# 70. Props

Las propiedades deberán cumplir las siguientes reglas:

- Tipadas con TypeScript.
- Valores por defecto cuando aplique.
- Documentadas.
- Sin uso de `any`.
- Nombres descriptivos.

---

# 71. Eventos

Todos los eventos deberán comenzar con el prefijo `on`.

Ejemplos:

onClick

onChange

onSubmit

onClose

onConfirm

onCancel

---

# 72. Estados

Cada componente deberá documentar explícitamente sus estados visuales.

Ejemplo:

Default

Hover

Focus

Active

Disabled

Loading

Error

Success

No deberán existir estados implícitos.

---

# 73. Estilos

Los componentes no deberán contener estilos embebidos salvo casos excepcionales.

Se utilizarán:

- Design Tokens.
- Variables del tema.
- Clases reutilizables.

---

# 74. Manejo de Errores

Los componentes deberán fallar de manera segura.

Cuando una propiedad obligatoria no exista, el componente deberá:

- registrar el error en desarrollo;
- evitar romper la interfaz;
- mostrar un comportamiento controlado cuando sea posible.

---

# 75. Rendimiento

Todo componente deberá minimizar renderizados innecesarios.

Buenas prácticas recomendadas:

- React.memo cuando aporte valor.
- useMemo para cálculos costosos.
- useCallback para callbacks compartidos.

No deberán aplicarse optimizaciones prematuras.

---

# 76. Internacionalización

Todo texto visible deberá provenir del sistema de traducciones.

Incorrecto:

```
<AppButton>
Guardar
</AppButton>
```

Correcto:

```
<AppButton>
{t("common.save")}
</AppButton>
```

Ningún componente reutilizable contendrá textos fijos.

---

# 77. Accesibilidad

Todos los componentes deberán cumplir WCAG AA.

Requisitos mínimos:

- Navegación por teclado.
- Focus visible.
- Roles ARIA correctos.
- Etiquetas accesibles.
- Contraste adecuado.

---

# 78. Testing

Todo componente reutilizable deberá contar con pruebas cuando su complejidad lo justifique.

Como mínimo deberán verificarse:

- Renderizado.
- Props.
- Eventos.
- Estados.
- Accesibilidad básica.

---

# 79. Versionado

Los cambios en componentes seguirán versionado semántico.

MAJOR

Cambios incompatibles.

MINOR

Nuevas capacidades.

PATCH

Correcciones.

---

# 80. Deprecación

Cuando un componente deje de recomendarse:

- deberá marcarse como Deprecated;
- deberá documentarse su reemplazo;
- no se eliminará hasta completar la migración.

---

# 81. Proceso para Crear un Nuevo Componente

Todo nuevo componente deberá seguir el siguiente flujo:

1. Identificar la necesidad.
2. Verificar que no exista uno equivalente.
3. Diseñar la interfaz pública (Props).
4. Documentar en DESIGN-002.
5. Implementar.
6. Probar.
7. Revisar.
8. Aprobar.

No podrán incorporarse componentes directamente al proyecto sin este proceso.

---

# 82. Checklist de Revisión

Antes de aprobar un componente deberá verificarse:

□ Cumple una única responsabilidad.

□ Es reutilizable.

□ Está completamente tipado.

□ Utiliza Design Tokens.

□ No contiene lógica de negocio.

□ Es responsive.

□ Es accesible.

□ Tiene documentación.

□ Tiene ejemplos de uso.

□ Tiene pruebas (cuando aplica).

---

# 83. Relación con los SPEC

DESIGN-002 define los componentes.

Los SPEC definen cómo se utilizan esos componentes para construir funcionalidades.

Ejemplo:

SPEC-010 utilizará:

- AppLayout
- PageTemplate
- AppInput
- AppPasswordInput
- AppButton
- AppSnackbar
- AppDialog

sin redefinir su comportamiento.

---

# 84. Componentes Base de SIGCA

La primera versión oficial de la biblioteca estará conformada por:

## Layout

- AppLayout
- PageTemplate
- Header
- Sidebar
- Footer
- PageContainer
- PageHeader
- Toolbar
- ContentCard

## Navegación

- Breadcrumb
- Tabs
- Pagination

## Formularios

- AppButton
- AppIconButton
- AppInput
- AppPasswordInput
- AppTextarea
- AppSelect
- AppCheckbox
- AppRadioGroup
- AppSwitch
- AppDatePicker

## Visualización de Datos

- AppCard
- AppTable
- AppStatisticCard
- AppAccordion

## Retroalimentación

- AppDialog
- AppConfirmDialog
- AppSnackbar
- AppSpinner
- AppSkeleton
- AppLoadingOverlay
- AppEmptyState
- AppErrorState

---

# 85. Criterio de Aceptación

Un componente será considerado oficial cuando:

✓ Esté documentado en DESIGN-002.

✓ Cumpla DESIGN-001.

✓ Sea reutilizable.

✓ Esté implementado.

✓ Pase las pruebas correspondientes.

---

# Fin del Documento

Con la aprobación de DESIGN-002 queda establecida la biblioteca oficial de componentes reutilizables del frontend de SIGCA.