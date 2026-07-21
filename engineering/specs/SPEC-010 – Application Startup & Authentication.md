# SPEC-010
# Application Startup & Authentication

| Campo | Valor |
|--------|--------|
| Documento | SPEC-010 |
| Estado | Draft |
| Prioridad | Alta |
| Fase | Frontend |
| Dependencias | SPEC-009, DESIGN-001, DESIGN-002 |

---

# 1. Objetivo

Implementar el flujo completo de inicio de la aplicación y autenticación de usuarios utilizando Supabase Auth.

Este SPEC establece el comportamiento desde que el usuario abre SIGCA hasta que accede al Dashboard principal.

No incluye la administración de usuarios ni permisos avanzados, los cuales serán desarrollados en SPEC posteriores.

---

# 2. Alcance

Incluye:

- Inicialización de la aplicación.
- Splash Screen.
- Inicialización de Supabase.
- Recuperación de sesión existente.
- Inicio de sesión.
- Cierre de sesión.
- Recuperación de contraseña.
- Restablecimiento de contraseña.
- Protección de rutas.
- Persistencia de sesión.
- Redirección al Dashboard.

No incluye:

- Gestión de usuarios.
- Administración de roles.
- Perfil del usuario.
- Configuración personal.
- Multi-factor Authentication (MFA).

---

# 3. Referencias

Este SPEC utiliza:

- DESIGN-001 para comportamiento visual.
- DESIGN-002 para componentes reutilizables.
- SPEC-009 para la infraestructura Frontend.

No redefine ninguno de esos documentos.

---

# 4. Flujo General

```text
Inicio de la aplicación

↓

Splash Screen

↓

Inicializar configuración

↓

Inicializar Supabase

↓

Verificar sesión

↓

¿Existe sesión?

├── Sí
│      ↓
│   Dashboard
│
└── No
       ↓
     Login
```

---

# 5. Historias de Usuario

### HU-010-01

Como usuario registrado,

quiero iniciar sesión,

para acceder al sistema.

---

### HU-010-02

Como usuario,

quiero permanecer autenticado,

para no iniciar sesión constantemente.

---

### HU-010-03

Como usuario,

quiero recuperar mi contraseña,

para volver a acceder cuando la olvide.

---

### HU-010-04

Como usuario autenticado,

quiero cerrar sesión,

para proteger mi información.

---

# 6. Pantallas

Este SPEC implementará las siguientes pantallas.

## Splash Screen

Responsabilidad:

Mostrar la identidad institucional mientras la aplicación se inicializa.

---

## Login

Responsabilidad:

Autenticar al usuario.

---

## Forgot Password

Responsabilidad:

Solicitar el envío del correo de recuperación.

---

## Reset Password

Responsabilidad:

Permitir establecer una nueva contraseña.

---

## Dashboard

Responsabilidad:

Convertirse en el punto de entrada del sistema una vez autenticado.

El contenido funcional del Dashboard será desarrollado en el siguiente SPEC.

---

# 7. Reglas Funcionales

RF-010-01

La aplicación deberá validar si existe una sesión activa antes de mostrar el Login.

---

RF-010-02

Si existe una sesión válida, el usuario será redirigido automáticamente al Dashboard.

---

RF-010-03

Si la sesión expiró, deberá eliminarse localmente y mostrarse el Login.

---

RF-010-04

El inicio de sesión utilizará Supabase Auth.

---

RF-010-05

Las credenciales inválidas deberán mostrar un mensaje amigable al usuario.

---

RF-010-06

La sesión deberá persistir después de cerrar y abrir nuevamente la aplicación.

---

RF-010-07

El usuario podrá cerrar sesión desde cualquier pantalla autenticada.

---

RF-010-08

Las rutas protegidas requerirán una sesión válida.

---

RF-010-09

Las rutas públicas permanecerán accesibles sin autenticación.

---

# 8. Rutas

## Públicas

/login

/forgot-password

/reset-password

---

## Protegidas

/

/dashboard

Todas las rutas protegidas deberán validar autenticación antes de renderizar.

---

# 9. Integraciones

## Supabase Auth

Operaciones utilizadas:

- Sign In
- Sign Out
- Get Session
- Reset Password
- Update Password
- Auth State Change

---

# 10. Estados de la Aplicación

## Inicializando

La aplicación está cargando dependencias.

---

## No autenticado

No existe sesión válida.

---

## Autenticado

Existe una sesión activa.

---

## Recuperando contraseña

Se envió el correo de recuperación.

---

## Error

Ocurrió un error durante la autenticación.

---

# 11. Manejo de Errores

La aplicación deberá manejar al menos los siguientes escenarios:

- Credenciales incorrectas.
- Usuario inexistente.
- Contraseña inválida.
- Token expirado.
- Error de conexión.
- Error inesperado del servidor.

Los mensajes técnicos nunca deberán mostrarse directamente al usuario.

---

# 12. Criterios de Aceptación

El SPEC será considerado terminado cuando:

- El Splash Screen funcione correctamente.
- Supabase se inicialice sin errores.
- El Login autentique usuarios.
- La sesión permanezca activa tras recargar la aplicación.
- El Logout elimine completamente la sesión.
- Las rutas privadas estén protegidas.
- El flujo de recuperación de contraseña funcione correctamente.
- El usuario autenticado sea redirigido al Dashboard.

---

# 13. Entregables

Al finalizar este SPEC deberán existir, como mínimo:

## Páginas

- SplashPage
- LoginPage
- ForgotPasswordPage
- ResetPasswordPage

## Providers

- AuthProvider

## Hooks

- useAuth

## Guards

- ProtectedRoute

## Servicios

- auth.service.ts

## Configuración

- Supabase Client
- React Router Guards

---

---

# Plan de Implementación

El desarrollo de este SPEC se realizará mediante iteraciones incrementales. Cada iteración deberá concluir con:

- Implementación completa.
- Revisión técnica.
- Commit.
- Tag.
- Actualización del CHANGELOG cuando aplique.

No podrá iniciarse la siguiente iteración hasta que la actual se encuentre aprobada.

---

## Iteración 10.1 – Cliente de Supabase

### Objetivo

Reemplazar el cliente temporal (stub) por el cliente oficial de Supabase reutilizando la infraestructura creada en SPEC-004.

### Alcance

- Implementar el cliente oficial utilizando `@supabase/supabase-js`.
- Mantener el patrón Singleton.
- Mantener la API pública existente.
- No modificar la arquitectura del Core.

### Archivos involucrados

- `backend/src/core/database/supabase-client.ts`

### Criterios de aceptación

- Cliente oficial implementado.
- Singleton conservado.
- API pública sin cambios.
- Revisión técnica aprobada.

### Estado

✅ Completada

---

## Iteración 10.2 – Fundación del módulo Auth

### Objetivo

Integrar el módulo `auth` con la arquitectura del backend y dejar preparada la estructura para la autenticación.

### Alcance

- Registrar el módulo dentro de la aplicación.
- Implementar:
  - `auth.routes.ts`
  - `auth.controller.ts`
  - `auth.service.ts`
  - `index.ts`
- Exponer el endpoint:

```
POST /api/v1/auth/login
```

Durante esta iteración el endpoint podrá responder temporalmente:

```json
{
  "success": false,
  "message": "Not implemented"
}
```

El objetivo es validar el flujo completo:

```
HTTP Request
        ↓
Routes
        ↓
Controller
        ↓
Service
        ↓
Respuesta HTTP
```

No deberá implementarse todavía lógica de autenticación.

### Archivos involucrados

```
backend/src/modules/auth/
```

### Criterios de aceptación

- El módulo queda registrado.
- El endpoint responde correctamente.
- Controller y Service están conectados.
- No existe lógica duplicada.
- Se respetan ADR, DEC y SPEC-004.

### Estado

✅ Completada

---

## Iteración 10.3 – Login con Supabase Auth

### Objetivo

Implementar la lógica de autenticación del endpoint `POST /api/v1/auth/login` utilizando Supabase Auth.

El endpoint ya fue registrado durante la Iteración 10.2. Esta iteración implementa únicamente su comportamiento funcional.

### Alcance

- Implementar la autenticación mediante correo electrónico y contraseña.
- Utilizar el cliente centralizado de Supabase proporcionado por el Core.
- Integrar la lógica dentro de `auth.service.ts`.
- Mantener el patrón Routes → Controller → Service.
- Utilizar las respuestas estándar del proyecto.
- Manejar errores de autenticación.

### Ajustes técnicos permitidos

Durante esta iteración podrán realizarse ajustes limitados al contrato público del Core cuando sean estrictamente necesarios para permitir la implementación del login.

Estos ajustes deberán cumplir las siguientes reglas:

- No modificar la arquitectura del proyecto.
- No alterar el comportamiento funcional existente.
- No introducir nuevas responsabilidades en el Core.
- No crear deuda técnica temporal.
- Mantener compatibilidad con el resto del sistema.

Su único propósito será asegurar que el contrato público del Core represente correctamente las capacidades que ya ofrece el cliente oficial de Supabase y que son requeridas por el módulo de autenticación.

### Entradas

Request JSON:

```json
{
  "email": "usuario@correo.com",
  "password": "********"
}
```

### Comportamiento esperado

Cuando las credenciales sean válidas:

- Autenticar al usuario mediante Supabase Auth.
- Obtener la sesión generada por Supabase.
- Devolver la información utilizando el formato estándar de respuestas del proyecto.

Cuando las credenciales sean inválidas:

- Devolver una respuesta de autenticación fallida utilizando la infraestructura compartida del proyecto.

Cuando ocurra un error inesperado:

- Delegar el manejo al mecanismo global de errores existente.

### Archivos involucrados

- `backend/src/modules/auth/auth.controller.ts`
- `backend/src/modules/auth/auth.service.ts`

No deberán modificarse otros módulos salvo que sea estrictamente necesario para integrar la funcionalidad.

### Restricciones

No implementar:

- Logout.
- Refresh Token.
- Middleware JWT.
- Protección de rutas.
- Recuperación de contraseña.
- Gestión de roles y permisos.
- No utilizar aserciones de tipo (`as`, `unknown as` o equivalentes) para acceder a capacidades que deban formar parte del contrato público del Core.

No modificar:

- Arquitectura.
- Core.
- Configuración.
- Middleware global.
- Contrato público del endpoint.

### Criterios de aceptación

- El endpoint registrado en la Iteración 10.2 autentica correctamente utilizando Supabase Auth.
- Se reutiliza el cliente centralizado de Supabase.
- El Controller continúa sin contener lógica de negocio.
- El Service concentra toda la lógica de autenticación.
- Se utilizan las respuestas estándar del proyecto.
- Se manejan correctamente los errores de autenticación.
- No existen cambios fuera del alcance de la Iteración 10.3.

### Prerrequisitos técnicos

Antes de implementar la autenticación, el contrato público del cliente de Supabase deberá exponer las capacidades requeridas por el módulo Auth.

No deberán utilizarse aserciones de tipo para acceder a funcionalidades del cliente que formen parte del contrato oficial del Core.

Si durante la implementación se detecta una limitación del contrato del Core, ésta deberá corregirse como parte de la misma iteración antes de implementar la lógica de autenticación.

### Estado

✅ Completada

## Iteración 10.4 – Logout con Supabase Auth

### Objetivo

Preparar la infraestructura del endpoint de logout manteniendo la arquitectura del módulo Auth.

La invalidación efectiva de la sesión del usuario se implementará una vez exista infraestructura de autenticación por solicitud (Iteración 10.7).

### Alcance

- Implementar la lógica del endpoint existente o registrar el endpoint si aún no existe.
- Invalidar la sesión mediante Supabase Auth.
- Mantener la arquitectura Routes → Controller → Service.
- Utilizar el cliente centralizado del Core.
- Utilizar las respuestas estándar del proyecto.
- Delegar errores inesperados al middleware global.

### Entradas

No requiere body.

La autenticación del usuario se basa en la sesión/token recibido.

### Comportamiento esperado

Cuando exista una sesión válida:

- Cerrar la sesión mediante Supabase Auth.
- Devolver una respuesta estándar indicando que el cierre fue exitoso.

Cuando ocurra un error:

- Utilizar el manejo de errores existente.

### Archivos involucrados

- backend/src/modules/auth/auth.routes.ts
- backend/src/modules/auth/auth.controller.ts
- backend/src/modules/auth/auth.service.ts

### Restricciones

No implementar:

- Middleware JWT.
- Protección de rutas.
- Refresh Token.
- Gestión de roles.
- Revocación personalizada de sesiones.

### Criterios de aceptación

- Existe el endpoint POST /api/v1/auth/logout.
- Se mantiene la arquitectura Routes → Controller → Service.
- Se utilizan respuestas estándar.
- No se introduce infraestructura de autenticación fuera del alcance.

### Estado

✅ (Logout preparado; comportamiento definitivo dependerá de la autenticación por solicitud)

---

## Iteración 10.5 – Registro de usuarios con Supabase Auth

### Objetivo

Implementar el registro de usuarios utilizando Supabase Auth, respetando la arquitectura definida para el módulo Auth.

### Alcance

- Implementar el endpoint POST /api/v1/auth/register.
- Registrar nuevos usuarios mediante Supabase Auth.
- Reutilizar el cliente centralizado del Core.
- Mantener la arquitectura Routes → Controller → Service.
- Utilizar respuestas estándar del proyecto.
- Delegar errores inesperados al middleware global.

### Entradas

Request Body

{
  "email": "usuario@correo.com",
  "password": "********"
}

### Comportamiento esperado

Cuando la información sea válida:

- Registrar el usuario mediante Supabase Auth.
- Devolver respuesta estándar indicando que el registro fue exitoso.

Cuando el correo ya exista:

- Devolver una respuesta estándar indicando que el usuario ya está registrado.

Cuando exista un error inesperado:

- Delegar el manejo al middleware global.

### Archivos involucrados

- backend/src/modules/auth/auth.routes.ts
- backend/src/modules/auth/auth.controller.ts
- backend/src/modules/auth/auth.service.ts

### Restricciones

No implementar lógica específica para confirmación de correo electrónico.

Si el proyecto de Supabase tiene habilitada la confirmación de correo, el comportamiento nativo de Supabase se considera parte de la plataforma y no deberá ser modificado ni reemplazado por código de SIGCA.

### Criterios de aceptación

- Existe POST /api/v1/auth/register.
- El registro utiliza Supabase Auth.
- Se mantiene la arquitectura del módulo.
- Se utilizan respuestas estándar.
- No existen cambios fuera del alcance.

### Estado

✅ (validada tras el ajuste de infraestructura)

### Observaciones

Durante la implementación se detectó que auth.signUp() puede mantener estado de autenticación cuando se utiliza sobre el cliente Singleton del Core.

La corrección de infraestructura se realizará en la Iteración 10.6 para cumplir DEC-021.

---

## Iteración 10.6 – Ajuste de infraestructura de autenticación

### Objetivo

Alinear la infraestructura del Core con DEC-021 para garantizar que el cliente compartido de Supabase no mantenga estado de autenticación entre solicitudes.

### Justificación

Durante la implementación de las iteraciones 10.4 y 10.5 se identificó que el uso de un SupabaseClient Singleton con la configuración por defecto puede conservar estado de autenticación del usuario.

Este comportamiento contradice DEC-021.

Antes de continuar con nuevas funcionalidades de autenticación es necesario corregir esta infraestructura.

### Alcance

- Revisar la configuración del cliente del Core.
- Eliminar persistencia de sesión en el cliente compartido.
- Desactivar mecanismos de autenticación que no correspondan a un backend stateless.
- Validar compatibilidad con Login, Logout y Registro.
- No modificar la arquitectura modular.

### Restricciones

No implementar:

- Middleware JWT.
- Cliente por solicitud.
- Protección de rutas.
- Roles.
- Refresh Token.
- Nuevas funcionalidades.

### Criterios de aceptación

- El cliente compartido del Core no conserva estado de autenticación.
- Login continúa funcionando.
- Registro continúa funcionando.
- Logout mantiene el comportamiento definido en la Iteración 10.4.
- DEC-021 queda completamente satisfecha.
- El cliente compartido del Core se configura explícitamente para no persistir estado de autenticación de usuarios.

### Estado

✅ Completada

### Observaciones
La configuración del cliente compartido elimina la persistencia de sesión y el refresco automático de tokens.

La asociación entre identidad del usuario y cada solicitud HTTP será implementada en la iteración dedicada a la infraestructura de autenticación por solicitud.

## Iteración 10.7 – Middleware de autenticación por solicitud

### Objetivo

Implementar un middleware de autenticación que obtenga la identidad del usuario desde cada solicitud HTTP utilizando Supabase Auth, respetando DEC-021.

### Alcance

- Implementar middleware de autenticación.
- Extraer el token desde el encabezado Authorization.
- Validar el usuario mediante Supabase.
- Asociar el usuario autenticado al contexto de la solicitud.
- Permitir que los módulos posteriores consuman dicha identidad.
- No modificar la arquitectura existente.

### Archivos involucrados

- backend/src/middleware/auth.middleware.ts (nuevo)
- backend/src/app.ts
- backend/src/core/database/supabase-client.ts (solo si fuera estrictamente necesario)
- backend/src/types (si es necesario extender Request)

### Restricciones

No implementar:

- Autorización por roles.
- Permisos.
- Protección de rutas específicas (Iteración 10.8).
- Funcionalidades fuera del alcance.

### Criterios de aceptación

- El middleware obtiene el token desde Authorization.
- La identidad proviene exclusivamente del contexto de la solicitud.
- No se utiliza el cliente Singleton como representación del usuario autenticado.
- La arquitectura del proyecto permanece sin cambios.

### Estado

✅ Completado

### Observaciones 
La infraestructura de autenticación por solicitud quedó implementada mediante un middleware que crea un cliente de Supabase asociado al contexto de cada petición.

La aplicación del middleware sobre rutas protegidas se realizará en la Iteración 10.8.

---

## Iteración 10.8 – Protección de rutas autenticadas

### Objetivo

Aplicar el middleware de autenticación implementado en la Iteración 10.7 a las rutas que requieran un usuario autenticado, garantizando que únicamente las solicitudes con una identidad válida puedan acceder a los recursos protegidos.

### Alcance

- Integrar el middleware de autenticación en las rutas privadas.
- Mantener las rutas públicas sin protección.
- Garantizar que únicamente las solicitudes autenticadas lleguen a los controladores protegidos.
- Reutilizar el middleware existente sin modificar su comportamiento.
- Mantener la arquitectura modular del proyecto.

### Archivos involucrados

- backend/src/modules/auth/auth.routes.ts
- backend/src/app.ts (solo si es necesario registrar middleware global o agrupar rutas)
- backend/src/middleware/auth.middleware.ts (solo integración, sin cambios funcionales)

### Restricciones

No implementar:

- Autorización basada en roles.
- Permisos por recurso.
- Validaciones de negocio.
- Cambios al middleware desarrollado en la Iteración 10.7.
- Cambios en el Core o en la infraestructura de Supabase.

### Criterios de aceptación

- Las rutas protegidas utilizan el middleware de autenticación.
- Las rutas públicas continúan siendo accesibles sin autenticación.
- Una solicitud sin token recibe respuesta HTTP 401.
- Una solicitud con token inválido recibe respuesta HTTP 401.
- Una solicitud autenticada accede correctamente a la ruta protegida.
- No se modifica la arquitectura existente.

### Estado

✅ Completada


### Observaciones

Se integró el middleware de autenticación implementado en la Iteración 10.7 sobre la ruta protegida de cierre de sesión.

Las rutas de inicio de sesión, registro y recuperación de contraseña permanecen públicas de acuerdo con el alcance definido para este SPEC.

La protección de rutas pertenecientes a módulos funcionales será implementada en los SPEC correspondientes.

## Iteración 10.9 – Recuperación de contraseña

### Objetivo

Implementar el flujo de recuperación de contraseña utilizando las capacidades de Supabase Auth, permitiendo que un usuario solicite el restablecimiento de su contraseña mediante correo electrónico.

### Alcance

- Implementar el endpoint para solicitar recuperación de contraseña.
- Delegar el envío del correo electrónico a Supabase Auth.
- Utilizar las respuestas estándar del proyecto.
- Integrar la funcionalidad dentro del módulo Auth existente.
- Mantener la arquitectura definida para el proyecto.

### Archivos involucrados

- backend/src/modules/auth/auth.routes.ts
- backend/src/modules/auth/auth.controller.ts
- backend/src/modules/auth/auth.service.ts

### Restricciones

No implementar:

- Pantallas de recuperación de contraseña (SPEC-011).
- Cambio de contraseña desde la interfaz de usuario.
- Personalización de correos electrónicos.
- Gestión de tokens de recuperación.
- Funcionalidades fuera del alcance de Supabase Auth.

### Criterios de aceptación

- Existe un endpoint para solicitar recuperación de contraseña.
- El endpoint delega la operación a Supabase Auth.
- Se utilizan respuestas estándar del proyecto.
- Los errores se delegan al middleware global.
- No se almacena estado relacionado con la recuperación de contraseña.
- La implementación respeta DEC-021 y la arquitectura definida.

### Estado

✅ Completado

### Observaciones

Esta iteración implementa únicamente la operación backend para solicitar el restablecimiento de contraseña. La experiencia de usuario correspondiente será desarrollada en el SPEC-011.

La URL utilizada por Supabase para el enlace de recuperación será configurada durante la implementación del frontend (SPEC-011) y la configuración del proyecto en Supabase.    

## Resultados del SPEC

Se implementó la infraestructura completa de autenticación del backend utilizando Supabase Auth, incluyendo:

- Inicio de sesión.
- Registro de usuarios.
- Cierre de sesión.
- Recuperación de contraseña.
- Middleware de autenticación por solicitud.
- Protección de rutas autenticadas.
- Configuración stateless del cliente compartido de Supabase.
- Integración con respuestas estándar del proyecto.
- Compatibilidad con la arquitectura modular definida para SIGCA.

Todas las iteraciones fueron aprobadas mediante el flujo:

CONTEXT_REVIEW → IMPLEMENT_SPEC → CODE_REVIEW

La implementación cumple con DEC-021 y ADR-001.

# Fin del SPEC-010