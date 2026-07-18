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

# Fin del SPEC-010