
## Estado de implementación

| Iteración | Estado | Observaciones |
|-----------|--------|---------------|
| 11.2.3 | ✅ Completada | Login funcional con autenticación real. |
| 11.2.4 | ✅ Completada | Persistencia y restauración mediante JWT y GET /auth/session. |
| 11.2.5 | ✅ Completada | ProtectedRoute, PublicRoute y navegación autenticada. |
| 11.2.6 | ✅ Consolidada | Dashboard Base y Logout implementados durante 11.2.5. |

# 11.2.1 Infraestructura de Autenticación

## Objetivo

Implementar la infraestructura base de autenticación del Frontend que administrará el estado global del usuario autenticado durante todo el ciclo de vida de la aplicación.

Esta iteración establece la arquitectura sobre la cual se implementarán las siguientes fases de autenticación sin realizar todavía comunicación con el Backend.

---

## Alcance

### Incluye

- Creación del contexto global de autenticación.
- Implementación del proveedor de autenticación.
- Definición del estado global de autenticación.
- Definición del modelo del usuario autenticado.
- Implementación del hook de acceso a la autenticación.
- Registro del proveedor dentro de la aplicación.
- Preparación de la infraestructura para Login, Logout y restauración de sesión.

### No Incluye

- Comunicación con el Backend.
- Axios.
- JWT.
- Persistencia de sesión.
- Cookies.
- LocalStorage.
- SessionStorage.
- Login funcional.
- Logout funcional.
- Dashboard.
- Protección de rutas.

---

## Diseño

Esta iteración no modifica el diseño visual aprobado durante la Fase 11.1.

El Login Institucional continúa siendo la única pantalla pública de la aplicación.

No deberán realizarse modificaciones a:

- Layout Público.
- Login Institucional.
- Design System.
- Materialize CSS.
- Paleta de colores.
- Tipografía.
- Componentes visuales.

Toda la infraestructura deberá permanecer transparente para el usuario.

---

## Arquitectura

Se incorporará un módulo dedicado exclusivamente a la autenticación.

```text
frontend/src/

auth/
├── AuthContext.tsx
├── AuthProvider.tsx
├── useAuth.ts
├── types.ts
└── index.ts
```

Toda la administración del estado global de autenticación deberá encapsularse dentro del módulo **auth**.

Los componentes nunca deberán consumir directamente el Context de React.

Toda interacción deberá realizarse mediante el hook:

```ts
useAuth()
```

---

### AuthenticatedUser

Se definirá el contrato mínimo del usuario autenticado.

```ts
export interface AuthenticatedUser {
    id: string;
    nombre: string;
    correo?: string;
    rol: string;
}
```

Este contrato representa únicamente la información necesaria para identificar al usuario autenticado dentro del Frontend.

No deberá duplicar entidades completas del dominio.

---

### AuthState

Se definirá el estado global de autenticación.

```ts
export interface AuthState {
    user: AuthenticatedUser | null;
    isAuthenticated: boolean;
    isLoading: boolean;
}
```

---

### AuthContext

El Context deberá exponer como mínimo:

- user
- isAuthenticated
- isLoading

Además deberá preparar las operaciones que serán implementadas posteriormente.

```ts
setAuthenticatedUser()

clearAuthentication()
```

Estas operaciones podrán contener únicamente implementación temporal.

No deberán comunicarse todavía con el Backend.

---

### AuthProvider

El proveedor será responsable de:

- Inicializar el estado de autenticación.
- Administrar el usuario autenticado.
- Exponer el Context a toda la aplicación.
- Preparar la futura restauración de sesión.

No deberá ejecutar llamadas HTTP.

---

### useAuth

Se implementará el hook:

```ts
useAuth()
```

El hook encapsulará completamente el acceso al Context.

Ningún componente deberá utilizar directamente:

```ts
useContext(AuthContext)
```

---

### Registro Global

El proveedor deberá registrarse desde:

```text
main.tsx
```

Toda la aplicación deberá quedar contenida dentro del AuthProvider.

---

## Criterios de Aceptación

- Existe AuthContext.
- Existe AuthProvider.
- Existe useAuth().
- Existe AuthenticatedUser.
- Existe AuthState.
- AuthProvider envuelve correctamente la aplicación.
- Login continúa funcionando sin modificaciones visuales.
- No existen llamadas HTTP.
- No existen credenciales simuladas.
- No existen datos persistidos.
- npm install finaliza correctamente.
- npm run build finaliza correctamente.
- No existen errores TypeScript.

---

## Archivos Esperados

```text
frontend/src/

auth/
├── AuthContext.tsx
├── AuthProvider.tsx
├── useAuth.ts
├── types.ts
└── index.ts

main.tsx
```

---

## Entregables

- Infraestructura global de autenticación.
- Contexto reutilizable.
- Hook de autenticación.
- Contratos tipados.
- Registro del proveedor.

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
11.2.1

Objetivo:

Implementar la infraestructura global de autenticación del Frontend sin integrar todavía el Backend.

Realizar las siguientes actividades:

- Crear AuthContext.
- Crear AuthProvider.
- Crear useAuth().
- Definir AuthenticatedUser.
- Definir AuthState.
- Registrar AuthProvider en main.tsx.
- Preparar las operaciones:
  - setAuthenticatedUser()
  - clearAuthentication()
- No consumir APIs.
- No instalar Axios.
- No implementar persistencia.
- No implementar Login.
- No implementar Dashboard.
- No implementar ProtectedRoute.
- No modificar el diseño aprobado.

Verificar cumplimiento de:

- DESIGN-001
- DESIGN-002
- DESIGN-003

Al finalizar ejecutar:

npm install

npm run build

Entregar el reporte habitual indicando únicamente:

- Archivos creados.
- Archivos modificados.
- Resumen de implementación.
- Validaciones realizadas.
- Problemas encontrados.
- Riesgos detectados.
```

# 11.2.2 Cliente HTTP y Servicio de Autenticación

## Objetivo

Implementar la infraestructura de comunicación entre el Frontend y el Backend mediante un cliente HTTP centralizado y un servicio especializado para autenticación.

Esta iteración establece la base para todas las comunicaciones futuras con la API de SIGCA, desacoplando completamente la lógica de acceso a datos de los componentes React.

---

## Alcance

### Incluye

- Instalación y configuración de Axios.
- Creación de una instancia centralizada del cliente HTTP.
- Configuración de la URL base mediante variables de entorno.
- Definición del servicio de autenticación.
- Definición de contratos de petición y respuesta.
- Configuración inicial para interceptores.
- Manejo uniforme de errores HTTP.
- Organización de la infraestructura de servicios.

### No Incluye

- Integración del Login.
- Consumo del endpoint desde la interfaz.
- Persistencia de sesión.
- Gestión del JWT.
- Renovación de tokens.
- Dashboard.
- Protección de rutas.
- Logout.

---

## Diseño

Esta iteración no modifica ninguna pantalla del sistema.

No deberán realizarse cambios sobre:

- Login Institucional.
- Layout Público.
- Componentes Materialize.
- Design System.
- Tipografía.
- Colores.
- Responsive.

Toda la implementación corresponde únicamente a la capa de comunicación con el Backend.

---

## Arquitectura

Se incorporará un módulo dedicado a la comunicación HTTP.

```text
frontend/src/

api/
├── client.ts
├── interceptors.ts
├── types.ts
└── index.ts

services/
└── auth/
    ├── auth.service.ts
    ├── auth.types.ts
    └── index.ts
```

El cliente HTTP será la única instancia autorizada para realizar solicitudes hacia el Backend.

Los componentes React nunca deberán utilizar Axios directamente.

Toda comunicación deberá implementarse mediante servicios especializados.

---

### Cliente HTTP

Se implementará una instancia única de Axios.

Responsabilidades:

- Configurar URL base.
- Configurar timeout.
- Configurar encabezados comunes.
- Preparar interceptores.
- Centralizar el tratamiento de errores técnicos.

La URL base deberá obtenerse exclusivamente mediante variables de entorno.

```env
VITE_API_BASE_URL=http://localhost:3000/api/v1
```

No deberán existir URLs codificadas directamente dentro del código fuente.

---

### Interceptors

Se preparará la infraestructura para interceptores.

En esta iteración únicamente deberán registrarse los interceptores necesarios para:

- Solicitudes.
- Respuestas.
- Manejo uniforme de errores.

No deberá incorporarse todavía el JWT.

La incorporación del token se implementará durante la Iteración 11.2.4.

---

### Servicio de Autenticación

Se implementará el primer servicio del Frontend.

```text
services/auth/auth.service.ts
```

Será responsable de encapsular completamente la comunicación relacionada con autenticación.

Como mínimo deberá exponer:

```ts
login(credentials)
```

El servicio únicamente realizará la solicitud HTTP.

No actualizará el estado global.

No almacenará información del usuario.

No persistirá sesiones.

---

### Contratos

Se definirán los contratos utilizados por el servicio.

```text
auth.types.ts
```

Como mínimo:

```ts
LoginRequest

LoginResponse
```

Los contratos deberán representar exactamente la interfaz pública del Backend.

No deberán reutilizar entidades internas del dominio.

---

### Variables de Entorno

La infraestructura deberá depender exclusivamente de:

```env
VITE_API_BASE_URL
```

No deberá utilizarse ninguna otra variable relacionada con autenticación durante esta iteración.

---

### Organización

El módulo API será responsable únicamente de:

- Cliente HTTP.
- Interceptores.
- Configuración.

Los servicios serán responsables únicamente de:

- Consumir endpoints.
- Tipar respuestas.
- Traducir solicitudes.

Los componentes React únicamente consumirán servicios.

---

## Criterios de Aceptación

- Axios instalado.
- Cliente HTTP centralizado.
- Existe una única instancia de Axios.
- URL base obtenida mediante variables de entorno.
- Servicio auth.service implementado.
- Contratos LoginRequest y LoginResponse definidos.
- Interceptores preparados.
- No existen llamadas HTTP desde componentes React.
- No existen URLs codificadas.
- No existen tokens persistidos.
- No existen credenciales simuladas.
- npm install finaliza correctamente.
- npm run build finaliza correctamente.
- No existen errores TypeScript.

---

## Archivos Esperados

```text
frontend/

.env.example

src/

api/
├── client.ts
├── interceptors.ts
├── types.ts
└── index.ts

services/
└── auth/
    ├── auth.service.ts
    ├── auth.types.ts
    └── index.ts
```

---

## Entregables

- Cliente HTTP centralizado.
- Configuración de Axios.
- Interceptores preparados.
- Servicio de autenticación.
- Contratos tipados.
- Variables de entorno documentadas.

---

## Estado

✅ Completado

---

## Prompt de Implementación

```text
Ejecuta el procedimiento definido en:

engineering/procedures/IMPLEMENT_SPEC.md

Implementa:

SPEC-011.2

Iteración:
11.2.2

Objetivo:

Implementar la infraestructura de comunicación HTTP del Frontend.

Realizar las siguientes actividades:

- Instalar Axios.
- Crear una instancia única del cliente HTTP.
- Configurar la URL base mediante VITE_API_BASE_URL.
- Configurar timeout y encabezados comunes.
- Preparar la infraestructura de interceptores.
- Crear el módulo api.
- Crear auth.service.ts.
- Definir LoginRequest.
- Definir LoginResponse.
- Centralizar el manejo de errores HTTP.
- No integrar todavía el Login.
- No almacenar tokens.
- No persistir sesiones.
- No modificar el diseño aprobado.

Verificar cumplimiento de:

- DESIGN-001
- DESIGN-002
- DESIGN-003

Al finalizar ejecutar:

npm install

npm run build

Entregar el reporte habitual indicando únicamente:

- Archivos creados.
- Archivos modificados.
- Resumen de implementación.
- Validaciones realizadas.
- Problemas encontrados.
- Riesgos detectados.
```

# 11.2.3 Integración del Login

## Objetivo

Integrar el formulario de acceso institucional con el servicio de autenticación implementado en la Iteración 11.2.2.

Esta iteración permitirá que el usuario capture sus credenciales, las envíe al Backend y reciba una respuesta de autenticación, actualizando el estado global mediante la infraestructura definida en la Iteración 11.2.1.

---

## Alcance

### Incluye

- Integración del formulario de Login con el servicio de autenticación.
- Captura controlada de usuario o correo.
- Captura controlada de contraseña.
- Validación básica de campos obligatorios.
- Envío de credenciales al Backend.
- Estado visual de carga.
- Prevención de solicitudes duplicadas.
- Manejo de credenciales inválidas.
- Manejo de errores de conectividad.
- Actualización del AuthContext después de una autenticación correcta.
- Redirección posterior a un destino temporal o ruta privada definida.
- Limpieza de mensajes de error al realizar un nuevo intento.

### No Incluye

- Persistencia de sesión.
- Restauración de sesión al recargar.
- Renovación de tokens.
- Protección completa de rutas.
- Dashboard definitivo.
- Recuperación de contraseña.
- Registro de usuarios.
- Autenticación multifactor.
- Administración de permisos.
- Logout funcional.

---

## Diseño

La integración deberá conservar el diseño institucional aprobado durante la Fase 11.1.

No deberán modificarse:

- Logotipos.
- Paleta de colores.
- Tipografía.
- Jerarquía visual.
- Tamaño de la tarjeta.
- Estructura del formulario.
- Layout Público.

Únicamente podrán incorporarse elementos visuales relacionados con el estado del formulario:

- Indicador de carga.
- Mensaje de error.
- Estado deshabilitado del botón.
- Validación de campos obligatorios.

Todos los elementos deberán utilizar los tokens definidos en DESIGN-003.

---

## Arquitectura

El formulario no deberá utilizar Axios directamente.

El flujo deberá ser:

```text
LoginForm
    ↓
auth.service.login()
    ↓
Backend
    ↓
LoginResponse
    ↓
AuthProvider
    ↓
Actualización del estado global
```

La lógica de presentación permanecerá en el formulario.

La lógica de comunicación permanecerá en el servicio.

La lógica de sesión permanecerá en AuthProvider.

---

### Estado del Formulario

El formulario deberá administrar como mínimo:

```ts
username

password

isSubmitting

errorMessage
```

Los nombres concretos podrán ajustarse al contrato real del Backend.

---

### Validación Local

Antes de realizar la solicitud se deberá validar:

- Usuario o correo obligatorio.
- Contraseña obligatoria.
- Eliminación de espacios innecesarios en el identificador.
- No enviar el formulario cuando existan errores obligatorios.

No deberán implementarse reglas adicionales que no estén definidas por el Backend.

---

### Envío

Al enviar credenciales válidas:

1. Limpiar errores anteriores.
2. Activar el estado de carga.
3. Deshabilitar el botón.
4. Invocar `auth.service.login()`.
5. Procesar la respuesta.
6. Actualizar AuthContext.
7. Redirigir al destino configurado.
8. Finalizar el estado de carga.

El estado de carga deberá resolverse tanto en éxito como en error.

---

### Integración con AuthProvider

Después de una respuesta correcta se deberá invocar:

```ts
setAuthenticatedUser()
```

El usuario almacenado deberá construirse a partir de la respuesta real del Backend.

No deberán introducirse datos simulados.

Si la respuesta contiene token, este podrá mantenerse únicamente en memoria durante esta iteración.

La persistencia se implementará en la Iteración 11.2.4.

---

### Manejo de Errores

Los errores técnicos no deberán mostrarse directamente al usuario.

No deberán mostrarse mensajes como:

```text
Request failed with status code 401
```

Se deberán mostrar mensajes comprensibles.

#### Credenciales incorrectas

```text
Usuario o contraseña incorrectos.
```

#### Error de conectividad

```text
No fue posible conectar con el servidor. Intenta nuevamente.
```

#### Error inesperado

```text
Ocurrió un error inesperado. Intenta nuevamente.
```

La traducción concreta deberá basarse en el manejo de errores definido en la capa API.

---

### Estado del Botón

Mientras la solicitud esté activa:

- El botón deberá permanecer deshabilitado.
- No se permitirán envíos repetidos.
- Deberá mostrarse un indicador visual de carga.
- El texto podrá cambiar temporalmente a:

```text
Ingresando...
```

El diseño deberá respetar Materialize y DESIGN-003.

---

### Seguridad

No deberán registrarse en consola:

- Contraseñas.
- Tokens.
- Credenciales completas.
- Respuestas sensibles.
- Encabezados de autenticación.

El campo de contraseña deberá conservar:

```html
type="password"
```

---

## Criterios de Aceptación

- El Login consume el servicio de autenticación.
- El formulario usa campos controlados.
- Los campos obligatorios se validan antes de enviar.
- No se envían solicitudes duplicadas.
- El botón se deshabilita durante la solicitud.
- Existe un indicador visual de carga.
- Las credenciales inválidas muestran un mensaje comprensible.
- Los errores de red muestran un mensaje comprensible.
- No se muestran errores técnicos de Axios.
- Una respuesta correcta actualiza AuthContext.
- No existen credenciales simuladas.
- No se registran contraseñas ni tokens en consola.
- El diseño institucional permanece intacto.
- npm install finaliza correctamente.
- npm run build finaliza correctamente.
- No existen errores TypeScript.

---

## Archivos Esperados

```text
frontend/src/

auth/
├── AuthProvider.tsx
└── types.ts

modules/
└── auth/
    ├── LoginPage.tsx
    ├── LoginForm.tsx
    └── styles/
        └── login.css

services/
└── auth/
    ├── auth.service.ts
    └── auth.types.ts

router/
└── routes.tsx
```

Los archivos concretos podrán variar según la estructura existente, pero deberán respetar la separación entre presentación, servicios y estado global.

---

## Entregables

- Formulario de Login integrado con el Backend.
- Validación básica de credenciales.
- Estado de carga.
- Manejo de errores.
- Actualización del estado global de autenticación.
- Redirección posterior al acceso correcto.

---

## Estado

✅ Completado

---

## Prompt de Implementación

```text
Ejecuta el procedimiento definido en:

engineering/procedures/IMPLEMENT_SPEC.md

Implementa:

SPEC-011.2

Iteración:
11.2.3

Objetivo:

Integrar el formulario institucional de Login con el servicio de autenticación y el AuthContext.

Realizar las siguientes actividades:

- Convertir los campos del Login en campos controlados si todavía no lo son.
- Capturar usuario o correo.
- Capturar contraseña.
- Validar que ambos campos sean obligatorios.
- Invocar auth.service.login().
- Administrar el estado isSubmitting.
- Deshabilitar el botón durante la solicitud.
- Evitar solicitudes duplicadas.
- Mostrar un indicador visual de carga.
- Traducir errores técnicos a mensajes comprensibles.
- Mostrar mensajes para:
  - credenciales incorrectas;
  - error de conectividad;
  - error inesperado.
- Actualizar AuthContext mediante setAuthenticatedUser() cuando la autenticación sea correcta.
- Redirigir después del Login correcto al destino temporal o privado definido por el router.
- Mantener cualquier token únicamente en memoria durante esta iteración.
- No implementar persistencia.
- No implementar restauración de sesión.
- No implementar todavía protección completa de rutas.
- No modificar el diseño institucional aprobado.
- No registrar credenciales, contraseñas ni tokens en consola.

Verificar cumplimiento de:

- DESIGN-001
- DESIGN-002
- DESIGN-003

Al finalizar ejecutar:

npm install

npm run build

Entregar el reporte habitual indicando únicamente:

- Archivos creados.
- Archivos modificados.
- Resumen de implementación.
- Validaciones realizadas.
- Problemas encontrados.
- Riesgos detectados.
```

# Correccion 11.2.3
Ejecuta el procedimiento definido en:

engineering/procedures/IMPLEMENT_SPEC.md

Corrige:

SPEC-011

Iteración:
11.2.3

Objetivo:

Ajustar el contrato de Login entre Backend y Frontend para garantizar que una autenticación exitosa permita construir siempre un AuthenticatedUser válido.

Problema detectado:

El Backend autentica mediante Supabase, pero no garantiza name y role. Actualmente el Frontend solo puede actualizar AuthContext cuando esos valores existen opcionalmente en los metadatos del usuario.

Realizar las siguientes actividades:

BACKEND

- Revisar el endpoint real de Login.
- Revisar las tablas reales de perfiles y roles.
- Identificar la fuente oficial de:
  - id;
  - name;
  - role.
- Consultar el perfil real después de autenticar al usuario.
- Normalizar la respuesta del Login.
- Garantizar que una respuesta exitosa incluya:
  - id;
  - name;
  - role.
- Mantener los demás campos existentes cuando sean necesarios.
- No depender exclusivamente de user_metadata.
- No inventar datos.
- No responder HTTP 200 cuando el perfil esté incompleto.
- Devolver un error funcional controlado cuando falte perfil o rol.
- Mantener mensajes seguros para credenciales inválidas.
- Actualizar los contratos TypeScript y validaciones correspondientes.

FRONTEND

- Ajustar LoginResponse al contrato real actualizado.
- Eliminar la dependencia de metadatos opcionales de Supabase.
- Construir AuthenticatedUser exclusivamente desde la respuesta normalizada.
- Ejecutar setAuthenticatedUser() después de un Login exitoso.
- Confirmar que isAuthenticated cambie a true.
- Mantener los estados de carga y mensajes de error.
- No implementar persistencia.
- No almacenar el token.
- No implementar rutas privadas.
- No crear una redirección temporal.
- No modificar el diseño institucional.

Validar desde el navegador:

- Credenciales correctas.
- Contraseña incorrecta.
- Usuario inexistente.
- Usuario válido con perfil incompleto.
- Backend detenido.
- Campos vacíos.
- Prevención de solicitudes duplicadas.
- Actualización correcta de AuthContext.

Al finalizar ejecutar en Backend y Frontend:

npm install

npm run build

Entregar el reporte indicando únicamente:

- Archivos creados.
- Archivos modificados.
- Resumen del ajuste del contrato.
- Fuente real utilizada para nombre y rol.
- Estructura final de LoginResponse.
- Validaciones realizadas.
- Resultado de la prueba desde el navegador.
- Problemas encontrados.
- Riesgos detectados.

# 11.2.4 Persistencia y Restauración de Sesión

## Objetivo

Implementar la persistencia y restauración de la sesión autenticada para conservar el acceso del usuario cuando la aplicación se recarga o se abre nuevamente.

Esta iteración deberá integrar el mecanismo de sesión definido por el Backend, restaurar el usuario autenticado al iniciar el Frontend y limpiar de forma segura cualquier sesión inválida o expirada.

---

## Alcance

### Incluye

- Persistencia de la sesión autenticada.
- Restauración automática de sesión al iniciar la aplicación.
- Validación de la sesión vigente contra el Backend.
- Integración del estado inicial de carga en `AuthProvider`.
- Incorporación del token en las solicitudes HTTP cuando el contrato del Backend lo requiera.
- Limpieza de sesiones inválidas o expiradas.
- Manejo uniforme de respuestas HTTP `401`.
- Sincronización entre el cliente HTTP y el estado global de autenticación.
- Prevención del renderizado prematuro durante la restauración.
- Definición de una abstracción centralizada para el almacenamiento de sesión.

### No Incluye

- Renovación automática de tokens.
- Refresh Token, salvo que ya forme parte obligatoria del contrato implementado por el Backend.
- Protección definitiva de rutas.
- Layout privado.
- Dashboard definitivo.
- Logout desde la interfaz.
- Administración de permisos.
- Restricción de módulos por rol.
- Recuperación de contraseña.
- Autenticación multifactor.

---

## Diseño

Esta iteración no deberá modificar el diseño institucional aprobado.

Durante la restauración inicial de sesión podrá mostrarse un estado de carga global mínimo para evitar que la aplicación renderice temporalmente una ruta incorrecta.

El estado de carga deberá:

- Respetar el Design System.
- Evitar parpadeos entre Login y rutas privadas.
- No introducir una nueva pantalla institucional.
- No duplicar loaders existentes.
- No modificar la estructura visual del Login.

No deberán realizarse cambios sobre:

- Logotipos.
- Tipografía.
- Paleta de colores.
- Tarjeta de Login.
- Layout Público.
- Campos de acceso.
- Jerarquía visual.

---

## Arquitectura

La persistencia deberá permanecer encapsulada dentro de la infraestructura de autenticación.

```text
frontend/src/

auth/
├── AuthContext.tsx
├── AuthProvider.tsx
├── types.ts
└── useAuth.ts

api/
├── client.ts
├── interceptors.ts
└── types.ts

services/
└── auth/
    ├── auth.service.ts
    ├── auth.types.ts
    └── session.service.ts

storage/
├── session.storage.ts
└── index.ts
```

Los componentes React no deberán:

- Leer directamente tokens.
- Escribir directamente en el almacenamiento.
- Configurar encabezados HTTP.
- Validar manualmente la sesión.
- Interpretar respuestas `401`.

Estas responsabilidades deberán permanecer en:

- `AuthProvider`.
- Cliente HTTP.
- Servicio de autenticación.
- Abstracción de almacenamiento.

---

## Estrategia de Persistencia

La estrategia concreta deberá respetar el mecanismo real implementado por el Backend.

### Sesión mediante cookies

Cuando el Backend utilice cookies seguras:

- Axios deberá configurarse con `withCredentials`.
- El Frontend no deberá acceder directamente a la cookie.
- La restauración deberá realizarse mediante un endpoint de sesión.
- No deberá almacenarse el token en `localStorage`.
- La sesión deberá validarse contra el Backend al iniciar.

Configuración esperada:

```ts
withCredentials: true
```

### Sesión mediante token

Cuando el Backend entregue un token administrado por el Frontend:

- El acceso al almacenamiento deberá centralizarse.
- Ningún componente deberá utilizar directamente `localStorage`.
- El token deberá incorporarse mediante un interceptor de solicitudes.
- El token deberá eliminarse cuando la sesión sea inválida.
- No deberán persistirse datos sensibles adicionales.

La decisión deberá basarse exclusivamente en el contrato real del Backend.

No deberán implementarse simultáneamente estrategias incompatibles.

---

## Almacenamiento de Sesión

Cuando sea necesario almacenar un token en el Frontend, deberá utilizarse una abstracción dedicada.

```text
storage/session.storage.ts
```

Como mínimo deberá exponer:

```ts
getSessionToken()

setSessionToken(token)

clearSessionToken()
```

La clave de almacenamiento deberá definirse en un único lugar.

No deberán existir lecturas o escrituras distribuidas en la aplicación.

No deberán almacenarse:

- Contraseñas.
- Credenciales.
- Respuestas completas del Login.
- Información sensible innecesaria.
- Objetos completos del dominio.

---

## Restauración de Sesión

Al iniciar la aplicación, `AuthProvider` deberá ejecutar el siguiente flujo:

```text
Inicio de la aplicación
        ↓
isLoading = true
        ↓
Detectar sesión disponible
        ↓
Validar sesión con el Backend
        ↓
Sesión válida
        ↓
Actualizar usuario autenticado
        ↓
isAuthenticated = true
        ↓
isLoading = false
```

Cuando la sesión no exista:

```text
Inicio de la aplicación
        ↓
isLoading = true
        ↓
No existe sesión
        ↓
Mantener usuario en null
        ↓
isAuthenticated = false
        ↓
isLoading = false
```

Cuando la sesión sea inválida o haya expirado:

```text
Validar sesión
        ↓
Backend responde 401
        ↓
Limpiar almacenamiento
        ↓
Limpiar AuthContext
        ↓
isAuthenticated = false
        ↓
isLoading = false
```

---

## Endpoint de Sesión

El servicio de autenticación deberá incorporar una operación para recuperar al usuario autenticado.

El nombre concreto deberá respetar el contrato del Backend.

Ejemplos aceptables:

```ts
getCurrentUser()
```

```ts
getSession()
```

```ts
validateSession()
```

No deberán crearse endpoints ficticios.

La operación deberá devolver la información mínima requerida para construir:

```ts
AuthenticatedUser
```

---

## Integración con el Login

Después de una autenticación correcta:

1. Recibir la respuesta del Backend.
2. Persistir el mecanismo de sesión cuando corresponda.
3. Actualizar el estado global.
4. Marcar al usuario como autenticado.
5. Continuar con la redirección definida.

La persistencia deberá ocurrir antes de completar la navegación.

No deberá almacenarse el token directamente desde `LoginPage` o `LoginForm`.

La operación deberá delegarse al módulo de autenticación o a la abstracción de sesión.

---

## Interceptor de Solicitudes

Cuando la estrategia utilice token, el interceptor deberá:

1. Consultar el token mediante `session.storage`.
2. Incorporarlo en el encabezado correspondiente.
3. Mantener intactas las solicitudes públicas.
4. Evitar encabezados duplicados.
5. No registrar el token en consola.

Encabezado esperado cuando el Backend utilice Bearer Token:

```text
Authorization: Bearer <token>
```

La implementación deberá adaptarse al contrato real del Backend.

---

## Interceptor de Respuestas

El interceptor deberá detectar respuestas HTTP `401`.

Ante una sesión inválida deberá:

- Limpiar el mecanismo de sesión.
- Evitar conservar un usuario autenticado inválido.
- Permitir que `AuthProvider` sincronice el estado.
- Evitar ciclos infinitos de solicitudes.
- Evitar múltiples limpiezas simultáneas.
- No mostrar mensajes técnicos al usuario.

El interceptor no deberá navegar directamente mediante APIs del router.

La decisión de navegación deberá permanecer en la capa de rutas o autenticación.

---

## Sincronización del Estado

La limpieza de sesión deberá afectar de forma coherente:

```text
Almacenamiento
+
Cliente HTTP
+
AuthContext
```

No deberá existir un estado donde:

- El token haya expirado, pero el usuario continúe autenticado.
- El usuario se haya limpiado, pero el token permanezca almacenado.
- El interceptor conserve un encabezado obsoleto.
- La aplicación muestre una ruta privada antes de restaurar la sesión.

---

## Estado de Carga Inicial

El valor inicial de autenticación deberá representar que la sesión aún está siendo evaluada.

```ts
const initialState: AuthState = {
    user: null,
    isAuthenticated: false,
    isLoading: true,
}
```

`isLoading` deberá cambiar a `false` únicamente después de finalizar el intento de restauración.

No deberá asumirse que un usuario está desconectado antes de completar esta operación.

---

## Manejo de Errores

### Sesión inexistente

No deberá mostrarse un error.

La aplicación continuará como usuario no autenticado.

### Sesión expirada

La sesión deberá limpiarse y el usuario deberá quedar como no autenticado.

No deberá mostrarse el error técnico del Backend.

### Error de conectividad durante la restauración

La aplicación deberá finalizar el estado de carga.

No deberá permanecer bloqueada indefinidamente.

El tratamiento final deberá distinguir entre:

- Sesión inválida.
- Backend temporalmente inaccesible.

No deberá eliminarse una sesión válida únicamente por un error genérico de red, salvo que el contrato del sistema determine lo contrario.

---

## Seguridad

No deberán registrarse en consola:

- Tokens.
- Cookies.
- Encabezados de autorización.
- Credenciales.
- Respuestas completas de autenticación.
- Datos sensibles del usuario.

No deberá almacenarse la contraseña bajo ninguna circunstancia.

La persistencia deberá contener únicamente la información indispensable.

La lógica de seguridad no deberá distribuirse entre componentes visuales.

---

## Criterios de Aceptación

- La sesión se conserva después de recargar la aplicación.
- `AuthProvider` restaura la sesión al iniciar.
- `isLoading` permanece activo durante la restauración.
- La aplicación no muestra temporalmente rutas incorrectas.
- Una sesión válida restaura al usuario autenticado.
- Una sesión inexistente mantiene al usuario como no autenticado.
- Una sesión expirada limpia correctamente el estado.
- Las respuestas `401` se manejan de forma centralizada.
- El cliente HTTP incorpora la sesión cuando corresponde.
- La estrategia de persistencia respeta el contrato real del Backend.
- No existen lecturas directas del almacenamiento desde componentes.
- No existen escrituras directas del almacenamiento desde componentes.
- No se almacenan contraseñas.
- No se registran tokens ni credenciales en consola.
- No existen endpoints simulados.
- No se implementan simultáneamente mecanismos incompatibles de sesión.
- El Login conserva su diseño aprobado.
- `npm install` finaliza correctamente.
- `npm run build` finaliza correctamente.
- No existen errores TypeScript.

---

## Archivos Esperados

```text
frontend/src/

auth/
├── AuthContext.tsx
├── AuthProvider.tsx
├── types.ts
└── useAuth.ts

api/
├── client.ts
├── interceptors.ts
└── types.ts

services/
└── auth/
    ├── auth.service.ts
    ├── auth.types.ts
    ├── session.service.ts
    └── index.ts

storage/
├── session.storage.ts
└── index.ts

modules/
└── auth/
    ├── LoginPage.tsx
    └── LoginForm.tsx
```

Los archivos concretos podrán variar según la estructura real existente, pero deberán conservar la separación entre:

- Estado global.
- Comunicación HTTP.
- Servicios.
- Persistencia.
- Presentación.

---

## Entregables

- Persistencia de la sesión autenticada.
- Restauración automática al iniciar.
- Validación de sesión contra el Backend.
- Integración de sesión con el cliente HTTP.
- Manejo centralizado de respuestas `401`.
- Limpieza segura de sesiones inválidas.
- Estado inicial de carga correctamente administrado.
- Abstracción centralizada del almacenamiento.

---

## Estado

✅ Completado

---

## Prompt de Implementación

```text
Ejecuta el procedimiento definido en:

engineering/procedures/IMPLEMENT_SPEC.md

Corrige e implementa:

SPEC-011
Iteración 11.2.4
Persistencia y Restauración de Sesión

Conclusión arquitectónica confirmada:

- El Backend utiliza JWT Bearer.
- authMiddleware valida Authorization: Bearer <token>.
- No existen cookies de sesión.
- El Frontend administra el token.
- Actualmente no existe un endpoint para restaurar la identidad normalizada.

El endpoint de sesión forma parte del alcance de esta iteración y debe implementarse. No debe considerarse un contrato arbitrario, porque es necesario para validar remotamente la sesión y devolver el mismo usuario normalizado del Login.

BACKEND

1. Implementar:

GET /api/v1/auth/session

2. Protegerlo con el authMiddleware existente.

3. Obtener el identificador autenticado exclusivamente desde el token validado por el middleware.

4. Consultar las fuentes reales ya utilizadas por Login:
   - usuario;
   - perfil;
   - usuario_rol;
   - cat_roles.

5. Reutilizar o extraer la lógica compartida que construye:

{
  id: string;
  name: string;
  role: string;
  email?: string;
}

6. Mantener las mismas reglas del Login:
   - perfil faltante: error controlado;
   - ningún rol activo: error controlado;
   - más de un rol activo: error controlado;
   - token inválido o vencido: 401.

7. No duplicar consultas innecesariamente entre Login y Session.

8. No devolver tokens, contraseñas, secretos ni objetos internos de Supabase en el endpoint de sesión.

9. Mantener el formato estándar de respuesta del Backend.

FRONTEND

1. Corregir primero la sintaxis de:

frontend/src/vite-env.d.ts

2. Crear una abstracción de almacenamiento de sesión para el access token.

3. Utilizar sessionStorage con una clave centralizada, por ejemplo:

sigca.access_token

4. No almacenar:
   - contraseña;
   - perfil como fuente de verdad;
   - objeto Session completo;
   - service role;
   - datos sensibles innecesarios.

5. Después de un Login exitoso:
   - extraer el access token del contrato real;
   - persistirlo mediante la abstracción;
   - configurar las solicitudes posteriores con Authorization Bearer;
   - actualizar AuthContext con el usuario normalizado.

6. Agregar al servicio de autenticación una operación para consultar:

GET /auth/session

7. Al iniciar AuthProvider:
   - establecer estado de restauración;
   - recuperar el token;
   - si no existe, finalizar como no autenticado;
   - si existe, invocar authService.getSession();
   - si responde correctamente, establecer AuthenticatedUser;
   - si responde 401, eliminar el token y limpiar AuthContext;
   - finalizar siempre el estado de restauración.

8. Incorporar un interceptor de request que agregue:

Authorization: Bearer <token>

cuando el token exista.

9. Incorporar un interceptor de response que, ante 401:
   - elimine el token;
   - notifique al estado global de autenticación mediante una solución sin dependencias circulares;
   - no produzca loops;
   - no intercepte incorrectamente el 401 esperado del propio Login.

10. Evitar restauraciones duplicadas bajo React StrictMode.

11. No implementar todavía:
   - ProtectedRoute;
   - PublicRoute;
   - Dashboard;
   - navegación posterior;
   - permisos por rol;
   - logout visual.

FLUJO ESPERADO

Login exitoso
    ↓
Guardar access token
    ↓
Actualizar AuthContext
    ↓
Recargar navegador
    ↓
AuthProvider recupera token
    ↓
GET /auth/session con Bearer token
    ↓
Backend valida token y consulta perfil vigente
    ↓
AuthenticatedUser restaurado
    ↓
isAuthenticated = true

CRITERIOS DE ACEPTACIÓN

- Login sigue funcionando.
- El token se conserva al recargar la página.
- El usuario no se restaura desde información local obsoleta.
- GET /auth/session valida remotamente el token.
- La respuesta de sesión contiene el usuario normalizado.
- AuthProvider cuenta con estado de restauración inicial.
- Una sesión válida restaura isAuthenticated = true.
- Un token inválido o vencido se elimina.
- Un 401 deja el contexto como no autenticado.
- No hay solicitudes repetitivas.
- No hay ciclos del interceptor.
- No se almacena la contraseña.
- No se almacena el objeto Session completo.
- No se implementan rutas protegidas ni Dashboard.
- npm run build finaliza correctamente en Frontend.
- Los archivos modificados del módulo Auth del Backend no presentan errores TypeScript propios.

VALIDACIONES DESDE EL NAVEGADOR

1. Iniciar sesión con credenciales válidas.
2. Confirmar respuesta HTTP 200.
3. Confirmar que sessionStorage contiene únicamente el access token esperado.
4. Recargar el navegador.
5. Confirmar petición GET /api/v1/auth/session.
6. Confirmar respuesta HTTP 200.
7. Confirmar restauración de isAuthenticated.
8. Alterar manualmente el token.
9. Recargar.
10. Confirmar HTTP 401.
11. Confirmar eliminación del token.
12. Confirmar ausencia de loops.
13. Confirmar que las credenciales inválidas del Login siguen mostrando mensaje seguro.
14. Confirmar que cerrar la pestaña elimina la sesión almacenada en sessionStorage.

Al finalizar entregar únicamente:

- Archivos creados.
- Archivos modificados.
- Endpoint implementado.
- Estructura final de la respuesta de sesión.
- Estrategia de persistencia.
- Resumen de implementación.
- Flujo de restauración.
- Manejo de 401.
- Validaciones realizadas.
- Resultado de pruebas desde el navegador.
- Problemas encontrados.
- Riesgos detectados.
```

# 11.2.5 Protección de Rutas

## Objetivo

Implementar la protección de rutas privadas del Frontend utilizando el estado global de autenticación definido en las iteraciones anteriores.

Esta iteración permitirá restringir el acceso a las funcionalidades del sistema únicamente a usuarios autenticados, garantizando una navegación consistente y evitando el acceso directo a módulos protegidos.

---

## Alcance

### Incluye

- Implementación del componente `ProtectedRoute`.
- Creación del Layout Privado.
- Protección de todas las rutas autenticadas.
- Redirección automática al Login cuando el usuario no tenga una sesión válida.
- Redirección automática al Dashboard cuando un usuario autenticado intente acceder nuevamente al Login.
- Integración con React Router.
- Manejo del estado de carga durante la validación inicial de sesión.
- Preparación para autorización basada en roles.

### No Incluye

- Restricciones por permisos.
- Restricciones por roles.
- Dashboard definitivo.
- Menús finales.
- Breadcrumbs.
- Logout.
- Renovación automática de sesión.
- Control granular de acceso por módulo.
- Auditoría de navegación.

---

## Diseño

Esta iteración no modifica el diseño institucional existente.

El Login Institucional permanecerá exactamente igual.

El Layout Privado actuará únicamente como contenedor de las vistas autenticadas.

Durante la validación inicial de sesión no deberá producirse ningún cambio visual perceptible entre el Login y las rutas privadas.

No deberán producirse:

- Parpadeos.
- Renderizados temporales del Login.
- Navegaciones visibles entre pantallas.
- Redirecciones múltiples.

---

## Arquitectura

Se incorporará la infraestructura de navegación protegida.

```text
frontend/src/

router/
├── AppRouter.tsx
├── ProtectedRoute.tsx
├── PublicRoute.tsx
└── routes.ts

layouts/
├── PublicLayout.tsx
└── PrivateLayout.tsx
```

Toda la lógica de autorización deberá permanecer dentro del módulo de enrutamiento.

Los componentes de negocio no deberán validar manualmente la autenticación.

---

## ProtectedRoute

El componente será responsable de proteger todas las rutas privadas.

Flujo esperado:

```text
Usuario navega
        ↓
ProtectedRoute
        ↓
AuthProvider
        ↓
¿isLoading?
```

Si la sesión aún se encuentra en validación:

```text
isLoading = true
        ↓
Esperar
```

No deberá renderizarse ninguna ruta hasta concluir la validación.

---

Cuando:

```text
isAuthenticated = true
```

```text
ProtectedRoute
        ↓
Renderizar contenido privado
```

---

Cuando:

```text
isAuthenticated = false
```

```text
ProtectedRoute
        ↓
Redireccionar a /login
```

La redirección deberá preservar el destino solicitado cuando el router lo permita.

---

## PublicRoute

Las rutas públicas también deberán controlar el estado de autenticación.

Cuando:

```text
Usuario autenticado
        ↓
/login
```

La aplicación deberá redirigir automáticamente al Dashboard.

No deberá permitirse que un usuario autenticado permanezca en la pantalla de Login.

---

## PrivateLayout

El Layout Privado será el contenedor común para todos los módulos autenticados.

En esta iteración podrá contener únicamente:

```text
<Outlet />
```

No deberán implementarse todavía:

- Sidebar.
- Navbar definitiva.
- Menú.
- Avatar.
- Perfil.
- Breadcrumbs.
- Footer.

Su finalidad será preparar la estructura para las siguientes fases.

---

## Organización de Rutas

La estructura deberá separar claramente las rutas públicas y privadas.

Ejemplo:

```text
/

PublicLayout
    /login

PrivateLayout
    /dashboard
```

La estructura concreta podrá adaptarse a la organización definitiva del proyecto.

---

## Flujo de Navegación

### Usuario sin sesión

```text
Solicitud
        ↓
Ruta privada
        ↓
ProtectedRoute
        ↓
No autenticado
        ↓
/login
```

---

### Usuario autenticado

```text
Solicitud
        ↓
Ruta privada
        ↓
ProtectedRoute
        ↓
Dashboard
```

---

### Usuario autenticado accede a Login

```text
/login
        ↓
PublicRoute
        ↓
Dashboard
```

---

### Inicio de la aplicación

```text
Aplicación
        ↓
AuthProvider
        ↓
Restaurar sesión
        ↓
isLoading
        ↓
ProtectedRoute
        ↓
Resolver navegación
```

No deberán existir redirecciones antes de finalizar la restauración.

---

## Preparación para Roles

Aunque la autorización por roles no forma parte de esta iteración, `ProtectedRoute` deberá diseñarse para admitir posteriormente parámetros como:

```ts
roles?: string[]
```

Sin implementar todavía ninguna validación.

---

## Manejo de Errores

Cuando una sesión expire durante la navegación:

```text
401
        ↓
Interceptor
        ↓
Limpiar sesión
        ↓
ProtectedRoute
        ↓
/login
```

No deberán mostrarse mensajes técnicos.

La navegación deberá mantenerse consistente.

---

## Seguridad

Las rutas privadas no deberán renderizar contenido antes de validar la autenticación.

Los módulos protegidos no deberán confiar únicamente en la ocultación de enlaces de navegación.

Toda protección deberá realizarse mediante el router y el estado global de autenticación.

No deberán existir rutas privadas accesibles directamente mediante URL cuando el usuario no esté autenticado.

---

## Criterios de Aceptación

- Existe ProtectedRoute.
- Existe PublicRoute.
- Existe PrivateLayout.
- Todas las rutas privadas utilizan ProtectedRoute.
- Todas las rutas públicas utilizan PublicRoute cuando corresponda.
- Un usuario sin sesión es redirigido al Login.
- Un usuario autenticado no puede acceder nuevamente al Login.
- No existen parpadeos durante la restauración de sesión.
- No existen múltiples redirecciones consecutivas.
- El Layout Privado funciona como contenedor común.
- La estructura queda preparada para autorización por roles.
- No existen validaciones duplicadas dentro de componentes.
- El diseño institucional permanece intacto.
- `npm install` finaliza correctamente.
- `npm run build` finaliza correctamente.
- No existen errores TypeScript.

---

## Archivos Esperados

```text
frontend/src/

router/
├── AppRouter.tsx
├── ProtectedRoute.tsx
├── PublicRoute.tsx
└── routes.ts

layouts/
├── PublicLayout.tsx
└── PrivateLayout.tsx

auth/
├── AuthProvider.tsx
└── useAuth.ts
```

---

## Entregables

- Protección centralizada de rutas.
- Layout Privado.
- ProtectedRoute.
- PublicRoute.
- Integración con React Router.
- Redirección automática según el estado de autenticación.
- Preparación para autorización por roles.

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
11.2.5

Objetivo:

Implementar la protección de rutas del Frontend utilizando el estado global de autenticación.

Realizar las siguientes actividades:

- Crear ProtectedRoute.
- Crear PublicRoute.
- Crear PrivateLayout.
- Integrar ProtectedRoute con AuthProvider.
- Integrar PublicRoute con AuthProvider.
- Configurar React Router para separar rutas públicas y privadas.
- Redirigir automáticamente al Login cuando no exista una sesión válida.
- Redirigir automáticamente al Dashboard cuando un usuario autenticado acceda al Login.
- Esperar la finalización de la restauración de sesión antes de renderizar cualquier ruta protegida.
- Evitar redirecciones múltiples.
- Evitar parpadeos durante la navegación.
- Preparar ProtectedRoute para futuras restricciones por roles sin implementarlas todavía.
- No modificar el diseño institucional aprobado.
- No implementar todavía el Dashboard definitivo.
- No implementar todavía menús, navegación o permisos por rol.

Validar los siguientes escenarios:

- Usuario sin sesión accede a una ruta privada.
- Usuario autenticado accede a una ruta privada.
- Usuario autenticado intenta acceder al Login.
- Inicio de la aplicación con sesión restaurada.
- Inicio de la aplicación sin sesión.
- Sesión expirada durante la navegación.

Verificar cumplimiento de:

- DESIGN-001
- DESIGN-002
- DESIGN-003

Al finalizar ejecutar:

npm install

npm run build

Entregar el reporte habitual indicando únicamente:

- Archivos creados.
- Archivos modificados.
- Resumen de implementación.
- Validaciones realizadas.
- Problemas encontrados.
- Riesgos detectados.
```

# 11.2.6 Dashboard Base y Cierre de Sesión

## Objetivo

Implementar la primera vista privada funcional de SIGCA mediante un Dashboard base y completar el ciclo inicial de autenticación con la operación de cierre de sesión.

Esta iteración permitirá validar de extremo a extremo el flujo de autenticación:

```text
Login
    ↓
Creación de sesión
    ↓
Restauración de sesión
    ↓
Acceso a ruta privada
    ↓
Dashboard
    ↓
Cierre de sesión
    ↓
Login
```

El Dashboard implementado en esta etapa será únicamente una base estructural para comprobar la autenticación y preparar la incorporación posterior de la navegación y los módulos funcionales del sistema.

---

## Alcance

### Incluye

- Implementación de una vista base de Dashboard.
- Registro de `/dashboard` como ruta privada inicial.
- Visualización de la identidad del usuario autenticado.
- Visualización del rol activo del usuario.
- Visualización de la parroquia o sede cuando la sesión proporcione esa información.
- Implementación del cierre de sesión.
- Comunicación con el endpoint de Logout cuando exista en el Backend.
- Limpieza del estado global de autenticación.
- Limpieza del mecanismo de persistencia.
- Redirección al Login después de cerrar sesión.
- Prevención de acceso al Dashboard después del Logout.
- Manejo del estado de carga durante el cierre de sesión.
- Manejo comprensible de errores de cierre de sesión.
- Integración del Dashboard con `PrivateLayout`.

### No Incluye

- Dashboard funcional definitivo.
- Métricas del sistema.
- Gráficas.
- Indicadores de asistencia.
- Estadísticas por ciclo.
- Menú lateral definitivo.
- Navbar definitiva.
- Navegación por módulos.
- Gestión de permisos.
- Autorización por roles.
- Perfil de usuario.
- Cambio de contraseña.
- Administración de usuarios.
- Notificaciones.
- Breadcrumbs definitivos.
- Configuración de la cuenta.
- Módulos de alumnos, grupos, ciclos, eventos o asistencias.

---

## Diseño

El Dashboard deberá utilizar la identidad visual aprobada durante la Fase 11.1.

La vista deberá ser sencilla y funcional.

No deberá intentar anticipar el Dashboard definitivo.

Deberá mostrar únicamente:

- Identidad de SIGCA.
- Mensaje de bienvenida.
- Nombre del usuario.
- Rol del usuario.
- Parroquia o sede cuando esté disponible.
- Botón o acción para cerrar sesión.

La vista deberá respetar:

- Paleta institucional.
- Tipografía definida.
- Espaciado del Design System.
- Componentes Materialize.
- Comportamiento responsive.
- Jerarquía visual aprobada.

No deberán introducirse colores, tamaños o estilos fuera de los tokens existentes.

---

## Arquitectura

Se incorporará un módulo inicial para el Dashboard.

```text
frontend/src/

modules/
└── dashboard/
    ├── DashboardPage.tsx
    ├── DashboardHeader.tsx
    ├── dashboard.css
    └── index.ts

layouts/
└── PrivateLayout.tsx

services/
└── auth/
    ├── auth.service.ts
    ├── auth.types.ts
    └── session.service.ts

auth/
├── AuthProvider.tsx
├── AuthContext.tsx
├── useAuth.ts
└── types.ts

router/
├── AppRouter.tsx
└── routes.ts
```

Los nombres concretos podrán adaptarse a la estructura existente, conservando la separación entre:

- Presentación.
- Estado de autenticación.
- Servicios.
- Persistencia.
- Enrutamiento.

---

## Ruta del Dashboard

La ruta privada inicial será:

```text
/dashboard
```

Deberá encontrarse dentro de:

```text
ProtectedRoute
    ↓
PrivateLayout
    ↓
DashboardPage
```

La ruta raíz podrá redirigir a `/dashboard` cuando el usuario esté autenticado.

No deberán existir rutas privadas fuera de `ProtectedRoute`.

---

## DashboardPage

`DashboardPage` deberá obtener la información del usuario exclusivamente mediante:

```ts
useAuth()
```

No deberá:

- Consultar directamente el almacenamiento.
- Leer tokens.
- Realizar solicitudes HTTP para reconstruir manualmente al usuario.
- Consumir directamente `AuthContext`.
- Utilizar datos simulados.

La información mostrada deberá provenir del usuario autenticado restaurado por `AuthProvider`.

---

## Información del Usuario

La vista deberá mostrar como mínimo:

```text
Bienvenido, {nombre}
```

También deberá presentar:

```text
Rol: {rol}
```

Cuando la respuesta de autenticación incluya parroquia o sede:

```text
Parroquia: {parroquia}
```

Cuando esa información no forme parte todavía del contrato, no deberá inventarse ni mostrarse un valor simulado.

---

## PrivateLayout

En esta iteración, `PrivateLayout` podrá incorporar una estructura mínima compuesta por:

```text
Encabezado privado
Contenido principal
```

El encabezado podrá mostrar:

- Nombre del sistema.
- Nombre del usuario.
- Acción de cierre de sesión.

No deberá incorporar todavía:

- Sidebar.
- Menú de módulos.
- Navegación jerárquica.
- Perfil desplegable.
- Notificaciones.
- Búsqueda.
- Selector de parroquia.
- Selector de ciclo.

El contenido de las rutas privadas deberá renderizarse mediante:

```tsx
<Outlet />
```

---

## Cierre de Sesión

La infraestructura de autenticación deberá exponer una operación pública:

```ts
logout()
```

Los componentes no deberán ejecutar manualmente las tareas internas del cierre de sesión.

`logout()` deberá centralizar:

1. Invocación del servicio de Logout cuando corresponda.
2. Invalidación de la sesión en el Backend.
3. Limpieza del almacenamiento local cuando corresponda.
4. Limpieza del usuario autenticado.
5. Actualización de `isAuthenticated`.
6. Redirección posterior al Login mediante la capa correspondiente.

---

## Servicio de Logout

El servicio de autenticación deberá incorporar:

```ts
logout()
```

El endpoint concreto deberá respetar el contrato real del Backend.

No deberá inventarse una ruta.

Cuando el Backend utilice cookies, el servicio deberá permitir que el servidor invalide la sesión.

Cuando utilice token, deberá invalidarlo en el Backend si existe un endpoint para ello.

El servicio no deberá actualizar componentes React directamente.

---

## Flujo de Logout Correcto

```text
Usuario selecciona Cerrar sesión
        ↓
Deshabilitar acción
        ↓
AuthProvider.logout()
        ↓
auth.service.logout()
        ↓
Backend invalida sesión
        ↓
Limpiar almacenamiento
        ↓
Limpiar usuario
        ↓
isAuthenticated = false
        ↓
ProtectedRoute
        ↓
/login
```

---

## Limpieza Local

La sesión local deberá limpiarse aun cuando el Backend no disponga de un endpoint explícito de Logout.

La limpieza deberá incluir, según la estrategia implementada:

- Token almacenado.
- Usuario autenticado.
- Estado global.
- Información temporal de la sesión.
- Encabezados en memoria cuando aplique.

No deberá eliminarse información no relacionada con autenticación.

No deberá ejecutarse:

```ts
localStorage.clear()
```

La limpieza deberá limitarse a las claves administradas por SIGCA.

---

## Error Durante el Logout

Cuando la invalidación remota falle por un error de conectividad:

- La aplicación deberá limpiar la sesión local.
- El usuario deberá quedar desconectado en el Frontend.
- No deberá permanecer dentro del Dashboard.
- No deberá mostrarse un error técnico de Axios.
- Podrá mostrarse un mensaje informativo mediante el mecanismo visual existente.

Mensaje esperado:

```text
La sesión se cerró en este dispositivo, pero no fue posible contactar al servidor.
```

Cuando el Backend rechace la sesión porque ya expiró, el resultado deberá tratarse como un cierre correcto.

---

## Estado de Carga

Durante el cierre de sesión:

- La acción deberá permanecer deshabilitada.
- No deberán enviarse solicitudes duplicadas.
- Deberá mostrarse un indicador visual.
- La interfaz no deberá bloquearse indefinidamente.
- El estado deberá restablecerse tanto en éxito como en error.

La operación podrá utilizar:

```ts
isLoggingOut
```

Este estado podrá residir en:

- `AuthProvider`; o
- El componente que presenta la acción.

No deberá duplicarse innecesariamente.

---

## Navegación Posterior

Después de limpiar la autenticación, la aplicación deberá redirigir a:

```text
/login
```

La redirección deberá originarse por el cambio del estado global y la protección de rutas.

No deberá utilizarse:

```ts
window.location.href
```

salvo que exista una justificación técnica documentada.

La navegación deberá realizarse mediante React Router.

---

## Prevención de Regreso al Dashboard

Después del Logout:

- El botón Atrás del navegador no deberá restaurar contenido privado funcional.
- Una recarga de `/dashboard` deberá redirigir al Login.
- El usuario no deberá permanecer en memoria.
- El almacenamiento no deberá contener una sesión válida.
- Las solicitudes posteriores no deberán incorporar credenciales obsoletas.

El Backend continuará siendo responsable de la autorización real de los endpoints.

---

## Integración con AuthContext

El contrato de autenticación deberá quedar preparado para exponer:

```ts
interface AuthContextValue extends AuthState {
    login: (credentials: LoginRequest) => Promise<void>;
    logout: () => Promise<void>;
}
```

La firma concreta podrá adaptarse a la implementación existente.

La operación `logout()` deberá permanecer encapsulada dentro del módulo de autenticación.

---

## Seguridad

No deberán registrarse en consola:

- Tokens.
- Cookies.
- Credenciales.
- Encabezados de autorización.
- Respuestas completas de Login o Logout.
- Información sensible de la sesión.

El Dashboard no deberá mostrar identificadores técnicos innecesarios.

No deberán exponerse:

- UUID internos.
- Tokens.
- Identificadores de sesión.
- Claims completos.
- Datos privados que no sean necesarios para la interfaz.

---

## Responsive

El Dashboard base deberá funcionar correctamente en:

- Teléfonos.
- Tabletas.
- Escritorio.

En pantallas pequeñas:

- La información deberá mantenerse legible.
- La acción de cierre de sesión deberá permanecer accesible.
- No deberá existir desplazamiento horizontal.
- El encabezado deberá adaptarse sin superposición.

No deberá implementarse todavía un patrón móvil para el menú principal.

---

## Accesibilidad

La acción de cierre de sesión deberá:

- Ser accesible mediante teclado.
- Tener texto visible o nombre accesible.
- Mostrar claramente el estado deshabilitado.
- Mantener contraste suficiente.
- No depender únicamente de un ícono.

Los encabezados deberán conservar una jerarquía semántica correcta.

---

## Criterios de Aceptación

- Existe una ruta privada `/dashboard`.
- `/dashboard` utiliza `ProtectedRoute`.
- `DashboardPage` se renderiza dentro de `PrivateLayout`.
- El Dashboard obtiene al usuario mediante `useAuth()`.
- Se muestra el nombre real del usuario autenticado.
- Se muestra el rol real del usuario.
- Se muestra la parroquia o sede únicamente cuando existe en la sesión.
- No existen datos simulados.
- Existe una operación centralizada `logout()`.
- El servicio de autenticación consume el endpoint real de Logout cuando existe.
- La sesión local se limpia después del Logout.
- AuthContext queda sin usuario después del Logout.
- El usuario es redirigido al Login.
- Una recarga de `/dashboard` después del Logout redirige al Login.
- El botón Atrás no restaura una sesión autenticada.
- El cierre de sesión evita solicitudes duplicadas.
- Existe un estado visual de carga durante el Logout.
- Un error de red no impide limpiar la sesión local.
- Una sesión previamente expirada se trata como Logout correcto.
- No se utiliza `localStorage.clear()`.
- No se registran tokens ni credenciales en consola.
- El Dashboard es responsive.
- El diseño respeta DESIGN-001, DESIGN-002 y DESIGN-003.
- `npm install` finaliza correctamente.
- `npm run build` finaliza correctamente.
- No existen errores TypeScript.

---

## Archivos Esperados

```text
frontend/src/

modules/
└── dashboard/
    ├── DashboardPage.tsx
    ├── DashboardHeader.tsx
    ├── dashboard.css
    └── index.ts

layouts/
└── PrivateLayout.tsx

auth/
├── AuthContext.tsx
├── AuthProvider.tsx
├── useAuth.ts
└── types.ts

services/
└── auth/
    ├── auth.service.ts
    ├── auth.types.ts
    ├── session.service.ts
    └── index.ts

router/
├── AppRouter.tsx
└── routes.ts
```

Los archivos concretos podrán variar según la estructura real del Frontend.

No deberán duplicarse componentes o servicios existentes.

---

## Entregables

- Dashboard base privado.
- Ruta `/dashboard`.
- Integración con `PrivateLayout`.
- Visualización del usuario autenticado.
- Operación centralizada de Logout.
- Invalidación remota de sesión cuando corresponda.
- Limpieza local de autenticación.
- Redirección segura al Login.
- Validación completa del ciclo inicial de autenticación.

---

## Estado

✅ Completada por consolidación durante la implementación de la SPEC-011.2.5.

---

## Prompt de Implementación

```text
Ejecuta el procedimiento definido en:

engineering/procedures/IMPLEMENT_SPEC.md

Implementa:

SPEC-011

Iteración:
11.2.6

Objetivo:

Implementar el Dashboard base privado y completar el flujo inicial de autenticación mediante el cierre de sesión.

Antes de implementar:

- Revisar la estructura real del Frontend.
- Revisar el contrato real de autenticación del Backend.
- Identificar si existe un endpoint de Logout.
- No inventar endpoints, campos ni respuestas.
- Reutilizar la infraestructura creada en las iteraciones 11.2.1 a 11.2.5.
- No duplicar servicios, contextos, layouts o rutas existentes.

Realizar las siguientes actividades:

- Crear DashboardPage.
- Registrar /dashboard como ruta privada.
- Renderizar DashboardPage dentro de PrivateLayout.
- Obtener al usuario exclusivamente mediante useAuth().
- Mostrar:
  - nombre del usuario;
  - rol;
  - parroquia o sede únicamente cuando exista.
- No utilizar datos simulados.
- Incorporar una acción visible para cerrar sesión.
- Exponer logout() desde la infraestructura de autenticación.
- Incorporar logout() en auth.service cuando exista un endpoint real.
- Invalidar la sesión en el Backend cuando corresponda.
- Limpiar el almacenamiento administrado por SIGCA.
- Limpiar el usuario del AuthContext.
- Actualizar isAuthenticated.
- Redirigir al Login mediante React Router.
- No utilizar window.location.href.
- No utilizar localStorage.clear().
- Administrar un estado de carga durante el Logout.
- Deshabilitar la acción mientras el cierre esté en proceso.
- Evitar solicitudes duplicadas.
- Limpiar la sesión local aunque falle la comunicación con el Backend.
- Tratar una sesión ya expirada como cierre correcto.
- Mantener el diseño institucional aprobado.
- Implementar comportamiento responsive.
- No implementar todavía:
  - Dashboard definitivo;
  - métricas;
  - gráficas;
  - sidebar;
  - menú de módulos;
  - permisos por rol;
  - perfil;
  - notificaciones.

Validar los siguientes escenarios:

- Login correcto y acceso a /dashboard.
- Recarga del Dashboard con sesión válida.
- Visualización del nombre y rol reales.
- Logout correcto.
- Logout con sesión ya expirada.
- Logout con Backend inaccesible.
- Acceso directo a /dashboard después del Logout.
- Uso del botón Atrás después del Logout.
- Intento de ejecutar Logout múltiples veces.
- Visualización en teléfono, tableta y escritorio.

Verificar cumplimiento de:

- DESIGN-001
- DESIGN-002
- DESIGN-003

Al finalizar ejecutar:

npm install

npm run build

Entregar el reporte habitual indicando únicamente:

- Archivos creados.
- Archivos modificados.
- Resumen de implementación.
- Endpoint de Logout detectado.
- Estrategia de limpieza aplicada.
- Validaciones realizadas.
- Problemas encontrados.
- Riesgos detectados.
```


