# SPEC-003.1 - Developer Experience (DX)

## Estado

Aprobada

---

# Objetivo

Mejorar la experiencia del desarrollador durante la ejecución local del backend.

Esta SPEC no implementa funcionalidades del negocio.

Su único propósito es facilitar el desarrollo diario.

---

# Alcance

## Incluye

- Ruta GET /
- Mensaje de bienvenida
- Mejorar el mensaje mostrado al iniciar el servidor
- Mostrar URLs disponibles
- Mostrar versión
- Mostrar ambiente
- Mostrar fecha y hora de inicio

## No incluye

- Base de datos
- Supabase
- Login
- Usuarios
- CRUD
- Dashboard

---

# Endpoint

GET /

Debe responder HTTP 200.

Puede responder HTML o texto plano.

Debe mostrar:

SIGCA

Sistema Integral de Gestión Catequética

Servidor funcionando correctamente.

Versión

Ambiente

Fecha y hora del servidor

Ruta Health

/api/v1/health

---

# Consola

Al iniciar el servidor deberá mostrarse un bloque similar a:

========================================================

SIGCA
Sistema Integral de Gestión Catequética

Versión:
0.1.0

Ambiente:
development

Servidor:
Operativo

Puerto:
3000

URL:
http://localhost:3000

Health:
http://localhost:3000/api/v1/health

Inicio:
2026-07-06 18:30:00

========================================================

---

# Restricciones

No agregar dependencias.

No modificar la arquitectura.

No implementar funcionalidades adicionales.

---

# Criterios de aceptación

- Existe GET /
- El navegador responde correctamente.
- La consola muestra el resumen de inicio.
- La información es clara.
- No existen errores TypeScript.

---

# Definition of Done

Backend listo para desarrollo diario.
