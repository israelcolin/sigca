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

⏳ Pendiente

---

## Iteración 10.3 – Login

### Objetivo

Implementar el inicio de sesión utilizando Supabase Auth.

### Alcance

- Validación de credenciales.
- Integración con Supabase Auth.
- Manejo de errores.
- Respuesta estándar.

### Estado

⏳ Pendiente

---

## Iteración 10.4 – Logout

### Objetivo

Implementar el cierre de sesión.

### Estado

⏳ Pendiente

---

## Iteración 10.5 – Recuperación de contraseña

### Objetivo

Implementar el envío del correo de recuperación de contraseña.

### Estado

⏳ Pendiente

---

## Iteración 10.6 – Restablecimiento de contraseña

### Objetivo

Implementar el cambio de contraseña mediante el flujo de recuperación.

### Estado

⏳ Pendiente

---

## Iteración 10.7 – Middleware de autenticación

### Objetivo

Implementar el middleware encargado de validar JWT y proteger las rutas privadas.

### Estado

⏳ Pendiente

---

## Iteración 10.8 – Cierre del SPEC

### Objetivo

Completar el flujo de autenticación.

### Alcance

- Protección de rutas.
- Persistencia de sesión.
- Pruebas finales.
- Validación funcional.
- Cierre del SPEC.

### Estado

⏳ Pendiente


# Fin del SPEC-010