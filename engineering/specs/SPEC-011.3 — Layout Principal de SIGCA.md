# SPEC-011.3 — Layout Principal de SIGCA

## Objetivo

Construir el layout principal reutilizable de SIGCA para todas las rutas privadas de la aplicación.

El layout debe integrar:

- barra superior;
- menú lateral;
- área principal de contenido;
- información del usuario autenticado;
- avatar del usuario con imagen predeterminada;
- cierre de sesión;
- footer con enlaces externos;
- comportamiento responsivo;
- integración con React Router mediante `Outlet`.

Esta iteración no debe implementar todavía módulos funcionales como alumnos, grupos, usuarios o asistencias.

---

## Contexto actual

El proyecto ya cuenta con:

- Login funcional.
- `AuthProvider`.
- Restauración de sesión.
- `ProtectedRoute`.
- `PublicRoute`.
- Dashboard base.
- Logout funcional.
- React Router configurado.
- Usuario autenticado disponible en el contexto.
- MaterializeCSS como framework visual.

La estructura actual debe respetarse.

No reemplazar la arquitectura existente si no es necesario.

---

## Alcance funcional

### 1. AppLayout

Crear un layout principal para todas las rutas privadas.

Ruta sugerida:

```text
frontend/src/layouts/AppLayout.tsx
```

Responsabilidades:

renderizar la barra superior;
renderizar el menú lateral;
renderizar el contenido mediante `Outlet`;
renderizar el footer;
conservar una estructura de altura completa;
permitir que el footer permanezca al fondo sin cubrir contenido.

Estructura conceptual:

```tsx
<div className="app-shell">
  <TopBar />

  <div className="app-body">
    <SideNav />

    <main className="app-content">
      <`Outlet` />
    </main>
  </div>

  <AppFooter />
</div>
```

No usar `position: fixed` para el footer si esto provoca que cubra contenido.

La estructura debe usar flex y `min-height: 100vh`.

### 2. Barra superior

Crear:

```text
frontend/src/components/layout/TopBar.tsx
```

La barra superior debe mostrar:

nombre o logotipo de SIGCA;
botón para abrir el menú lateral en móvil;
avatar del usuario;
nombre del usuario;
rol activo;
acceso al cierre de sesión.

Debe obtener la información del usuario desde el contexto de autenticación existente.

No duplicar el estado del usuario.

La barra debe adaptarse correctamente en pantallas pequeñas.

En dispositivos móviles se puede ocultar el nombre y rol, manteniendo visible el avatar.

### 3. Avatar del usuario

Crear:

```text
frontend/src/components/layout/UserAvatar.tsx
```

Interfaz sugerida:

```ts
interface UserAvatarProps {
  name: string
  `photoUrl`?: string | null
  size?: 'small' | 'medium' | 'large'
}
```

Comportamiento requerido:

Si existe `photoUrl`, intentar mostrar la fotografía.
Si no existe, mostrar una imagen o ícono predeterminado de persona.
Si la URL existe pero falla al cargar, mostrar el avatar predeterminado.
Nunca mostrar el ícono de imagen rota del navegador.
El avatar debe ser circular.
Debe incluir texto alternativo basado en el nombre del usuario.
Debe poder reutilizarse posteriormente en el módulo de perfil.

El fallback puede utilizar Material Icons:

```html
<i class="material-icons">account_circle</i>
```

No depender de una URL externa para la imagen predeterminada.

No implementar todavía carga, edición ni almacenamiento de fotografías.

### 4. Contrato del usuario autenticado

Revisar el tipo actual del usuario autenticado.

Debe permitir opcionalmente:

```ts
interface AuthenticatedUser {
  id: string
  name: string
  role: string
  email?: string
  `photoUrl`?: string | null
}
```

No modificar el Backend únicamente para agregar `photoUrl` si el campo aún no existe.

El frontend debe funcionar correctamente aunque `photoUrl` no sea devuelto.

En ese caso debe mostrarse el avatar predeterminado.

### 5. Menú lateral

Crear:

```text
frontend/src/components/layout/SideNav.tsx
```

Debe incluir inicialmente las siguientes opciones:

Dashboard
Usuarios
Catequistas
Alumnos
Grupos
Asistencias
Reportes
Configuración

En esta iteración solamente Dashboard tendrá una pantalla funcional.

Las demás opciones pueden:

apuntar a rutas placeholder;
mostrarse deshabilitadas;
o llevar a una página temporal de “Próximamente”.

Preferir rutas placeholder para validar navegación.

No implementar lógica de negocio.

El elemento activo debe distinguirse visualmente.

El menú debe usar una configuración separada.

Crear:

```text
frontend/src/config/navigation.ts
```

Ejemplo conceptual:

```ts
export interface NavigationItem {
  label: string
  icon: string
  path: string
  enabled: boolean
}

export const navigationItems: NavigationItem[] = [
  {
    label: 'Dashboard',
    icon: 'dashboard',
    path: '/dashboard',
    enabled: true,
  },
]
```

No escribir las opciones directamente dentro del JSX si pueden manejarse como configuración.

### 6. Navegación móvil

En escritorio:

el menú lateral debe permanecer visible.

En móvil:

debe poder abrirse mediante un botón en la barra superior;
debe cerrarse al seleccionar una opción;
no debe cubrir permanentemente el contenido;
debe poder cerrarse tocando fuera del menú o mediante un botón.

Puede utilizarse el componente Sidenav de MaterializeCSS si ya está correctamente integrado.

Si se usa Materialize JavaScript:

inicializarlo en useEffect;
destruir la instancia al desmontar el componente;
evitar inicializaciones duplicadas;
evitar manipulación global innecesaria.

### 7. Footer

Crear:

```text
frontend/src/components/layout/AppFooter.tsx
```

Debe permanecer al fondo cuando el contenido sea corto.

Cuando el contenido sea largo:

debe aparecer después del contenido;
no debe cubrir elementos;
debe respetar el scroll normal.

Debe permitir enlaces a:

redes sociales;
sitios de interés;
sitio de la parroquia;
aviso de privacidad;
información de SIGCA.

Los enlaces deben definirse en:

```text
frontend/src/config/externalLinks.ts
```

Interfaz sugerida:

```ts
export interface ExternalLink {
  label: string
  url: string
  icon?: string
}
```

No inventar URLs oficiales.

Si todavía no se proporcionan URLs reales:

usar una lista vacía;
o dejar valores claramente identificados como configuración pendiente;
no renderizar enlaces con URL vacía;
no usar # como destino.

Los enlaces externos válidos deben abrir con:

```html
target="_blank"
rel="noopener noreferrer"
```

El footer también puede mostrar:

SIGCA
Sistema Integral de Gestión Catequética
Versión actual

La versión debe obtenerse de una fuente existente si el proyecto ya tiene configuración para ello.

No duplicar manualmente la versión en varios archivos.

### 8. UserMenu

Crear opcionalmente:

```text
frontend/src/components/layout/UserMenu.tsx
```

Responsabilidades:

mostrar nombre;
mostrar rol;
mostrar avatar;
ofrecer “Cerrar sesión”.

El botón de Logout debe usar el método existente del `AuthContext`.

No duplicar el flujo de cierre de sesión.

No llamar directamente a `sessionStorage` desde el componente.

El logout debe seguir garantizando:

POST /auth/logout
↓
limpieza local en finally
↓
redirección a /login

### 9. Integración de rutas

Actualizar la configuración de React Router para que las rutas privadas usen el layout.

Estructura conceptual:

```tsx
<Route element={<`ProtectedRoute` />}>
  <Route element={<AppLayout />}>
    <Route path="/dashboard" element={<DashboardPage />} />
    <Route path="/usuarios" element={<`ComingSoonPage` />} />
    <Route path="/catequistas" element={<`ComingSoonPage` />} />
    <Route path="/alumnos" element={<`ComingSoonPage` />} />
    <Route path="/grupos" element={<`ComingSoonPage` />} />
    <Route path="/asistencias" element={<`ComingSoonPage` />} />
    <Route path="/reportes" element={<`ComingSoonPage` />} />
    <Route path="/configuracion" element={<`ComingSoonPage` />} />
  </Route>
</Route>
```

No colocar `ProtectedRoute` individualmente en cada página si todas pueden compartir el mismo grupo protegido.

Verificar que `ProtectedRoute` renderice `Outlet` correctamente.

### 10. Dashboard

Mover o adaptar el Dashboard actual para que funcione dentro de AppLayout.

El Dashboard no debe volver a renderizar:

barra superior;
botón global de logout;
información duplicada del usuario;
footer.

El Dashboard debe representar únicamente el contenido central.

Contenido mínimo sugerido:

Bienvenido, {nombre}

Rol activo: {rol}

Puede conservar cualquier información útil ya existente.

### 11. Página temporal

Crear:

```text
frontend/src/pages/`ComingSoonPage`.tsx
```

Debe utilizarse para los módulos todavía no implementados.

Contenido sugerido:

Módulo en construcción
Esta sección estará disponible en una próxima iteración.

Debe poder recibir el nombre del módulo por props o por configuración de ruta.

No crear una página diferente para cada módulo si todas tendrán el mismo contenido.

## Estructura sugerida
```text
frontend/src/
├── components/
│   └── layout/
│       ├── AppFooter.tsx
│       ├── SideNav.tsx
│       ├── TopBar.tsx
│       ├── UserAvatar.tsx
│       └── UserMenu.tsx
│
├── config/
│   ├── externalLinks.ts
│   └── navigation.ts
│
├── layouts/
│   └── AppLayout.tsx
│
├── pages/
│   ├── DashboardPage.tsx
│   └── `ComingSoonPage`.tsx
│
└── styles/
    └── app-layout.css
```

Adaptar los nombres y rutas si el proyecto ya utiliza otra convención.

No duplicar carpetas existentes.

## Estilos

Crear estilos específicos para el layout.

El layout debe cumplir:

```css
.app-shell {
  `min-height: 100vh`;
  display: flex;
  flex-direction: column;
}

.app-body {
  display: flex;
  flex: 1;
  min-height: 0;
}

.app-content {
  flex: 1;
  min-width: 0;
}

.app-footer {
  margin-top: auto;
}
```

Requisitos visuales:

evitar scroll horizontal;
mantener área central legible;
conservar separación entre menú y contenido;
asegurar que el footer no cubra contenido;
avatar circular;
menú activo visible;
topbar estable;
diseño usable en móvil.

No introducir otro framework CSS.

Usar MaterializeCSS y CSS propio donde sea necesario.

## Accesibilidad

Incluir:

alt en fotografía del usuario;
aria-label en botones que solo tengan ícono;
navegación mediante teclado;
contraste legible;
foco visible;
texto descriptivo en logout;
enlaces externos identificables.

El botón del menú móvil debe tener:

aria-label="Abrir menú de navegación"

El botón de logout debe tener texto visible o aria-label.

## Restricciones

No realizar en esta iteración:

CRUD de usuarios;
carga de fotografías;
Supabase Storage;
permisos dinámicos por rol;
edición de perfil;
módulos de alumnos;
módulos de grupos;
módulos de asistencias;
dashboard estadístico;
consumo de nuevas APIs de negocio;
rediseño del sistema de autenticación;
reemplazo de React Router;
reemplazo de MaterializeCSS.
## Manejo de errores

El layout no debe fallar si:

authenticatedUser tarda en restaurarse;
`photoUrl` no existe;
`photoUrl` falla;
no existen enlaces externos;
el rol está vacío por un error inesperado.

Usar valores seguros para representación visual.

No ocultar errores reales del flujo de autenticación.

## Validación técnica

Ejecutar:

```bash
cd frontend
`npm run build`
```

Corregir:

errores TypeScript;
imports no utilizados;
dependencias incorrectas;
rutas inválidas;
warnings relevantes.

No declarar la iteración completada si el build no pasa.

## Pruebas manuales requeridas
### Caso 1 — Login
Abrir /login
↓
Iniciar sesión
↓
Redirección a /dashboard
↓
Dashboard dentro de AppLayout

Resultado esperado:

barra superior visible;
menú lateral visible;
contenido visible;
footer visible;
nombre y rol visibles.
### Caso 2 — Restauración
Usuario autenticado
↓
F5
↓
GET /auth/session
↓
AppLayout restaurado

Resultado esperado:

no parpadea Login de forma incorrecta;
no se pierde el usuario;
no se duplica el layout.
### Caso 3 — Avatar sin foto
`photoUrl` undefined o null

Resultado esperado:

aparece avatar predeterminado;
no aparece imagen rota.
### Caso 4 — Avatar con URL inválida
`photoUrl` con URL inexistente

Resultado esperado:

se activa fallback;
no aparece imagen rota;
no falla el layout.
### Caso 5 — Logout
Dashboard
↓
Cerrar sesión
↓
/login

Después:

Abrir /dashboard manualmente

Resultado esperado:

redirección a /login.
### Caso 6 — Footer con contenido corto

Resultado esperado:

footer al fondo de la ventana;
no queda flotando a mitad de pantalla.
### Caso 7 — Footer con contenido largo

Resultado esperado:

footer después del contenido;
no cubre botones ni texto;
scroll normal.
### Caso 8 — Navegación lateral

Probar todas las opciones.

Resultado esperado:

Dashboard carga correctamente;
módulos pendientes muestran `ComingSoonPage`;
opción activa se distingue;
no hay recarga completa del navegador.
### Caso 9 — Responsive

Probar al menos:

1440 px
1024 px
768 px
375 px

Resultado esperado:

escritorio con menú lateral;
móvil con menú desplegable;
topbar sin desbordamiento;
avatar visible;
footer legible;
sin scroll horizontal.
## Criterios de aceptación

La SPEC-011.3 se considera terminada cuando:

[ ] Existe AppLayout reutilizable.
[ ] Las rutas privadas utilizan AppLayout.
[ ] El contenido se renderiza mediante `Outlet`.
[ ] La TopBar muestra usuario y rol.
[ ] El avatar usa `photoUrl` cuando existe.
[ ] El avatar usa fallback cuando no existe.
[ ] El avatar usa fallback cuando la imagen falla.
[ ] El menú lateral funciona en escritorio.
[ ] El menú lateral funciona en móvil.
[ ] Dashboard está integrado en el layout.
[ ] Los módulos futuros muestran una página temporal.
[ ] Logout sigue funcionando.
[ ] Footer permanece al fondo con contenido corto.
[ ] Footer no cubre contenido largo.
[ ] Los enlaces externos son configurables.
[ ] No se inventaron URLs oficiales.
[ ] El build del frontend pasa.
[ ] Las pruebas manuales fueron ejecutadas.
## Entregable

Al terminar, proporcionar:

Resumen de implementación.
Lista de archivos creados.
Lista de archivos modificados.
Decisiones tomadas.
Resultado de `npm run build`.
Resultado de cada prueba manual.
Limitaciones pendientes.
Confirmación de que no se implementaron módulos fuera de alcance.

No realizar commit ni push automáticamente.


## Orden recomendado

Hoy seguiría este flujo:

```text
1. Entregar este prompt a Codex.
2. Revisar su reporte de implementación.
3. Corregir cualquier desviación de alcance.
4. Ejecutar el build.
5. Probar en navegador.
6. Revisar visualmente escritorio y móvil.
7. Actualizar los Markdown.
8. Hacer commit y push.
```

---

# SPEC-011.3 — Layout Principal

## Estado

**COMPLETADA** ✅

## Objetivo

Implementar el layout principal reutilizable de SIGCA para todas las rutas privadas de la aplicación, proporcionando una estructura visual consistente sobre la cual se construirán los módulos funcionales del sistema.

## Funcionalidad implementada

Se desarrolló un `AppLayout` reutilizable que integra:

- Barra superior (TopBar).
- Menú lateral responsivo (SideNav).
- Área principal mediante `React Router Outlet`.
- Footer institucional.
- Avatar reutilizable con soporte para fotografía de usuario.
- Cierre de sesión reutilizando el `AuthContext`.
- Navegación centralizada mediante configuración.
- Página temporal (`ComingSoonPage`) para módulos aún no implementados.

## Componentes creados

- AppLayout
- TopBar
- SideNav
- UserAvatar
- AppFooter
- ComingSoonPage

## Configuración

Se incorporó una configuración centralizada para:

- navegación de módulos;
- enlaces externos del footer.

## Arquitectura

El flujo de navegación privada queda definido como:

ProtectedRoute
↓
AppLayout
├── TopBar
├── SideNav
├── Outlet
└── AppFooter

## Cambios relevantes

- Dashboard adaptado para utilizar AppLayout.
- AuthenticatedUser extendido con `photoUrl` opcional.
- Avatar con fallback seguro cuando no existe fotografía o la imagen no puede cargarse.
- Footer preparado para enlaces configurables.
- Navegación preparada para crecimiento futuro del sistema.

## Validaciones realizadas

### Técnicas

- npm install
- npm run build
- TypeScript sin errores
- Vite Build exitoso
- git diff --check sin errores

### Funcionales

- Restauración de sesión
- Logout
- Navegación protegida
- Responsive
- Avatar con imagen
- Avatar sin imagen
- Avatar con imagen inválida
- Footer adaptable
- Navegación de módulos
- Console sin errores
- Network sin errores

## Resultado

La infraestructura visual de SIGCA queda concluida y lista para iniciar el desarrollo de los módulos funcionales.