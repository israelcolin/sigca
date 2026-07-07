# SPEC-003 - SIGCA Core Foundation

**Proyecto:** SIGCA - Sistema Integral de Gestión Catequética

**Versión:** M1

**Estado:** Aprobada

**Prioridad:** Alta

**Autor:** Technical Lead

**Fecha:** 06/Jul/2026

---

# 1. Objetivo

Construir la infraestructura base del backend (Core) que será utilizada por todos los módulos del sistema.

Esta especificación NO implementa reglas de negocio.

Esta especificación NO implementa autenticación.

Esta especificación NO implementa acceso a Base de Datos.

Su único objetivo es construir el núcleo reutilizable de SIGCA.

---

# 2. Contexto

Todos los módulos del sistema dependerán del Core.

Por este motivo el Core debe mantenerse:

- pequeño
- reutilizable
- desacoplado
- altamente documentado

El Core nunca deberá contener lógica específica de un módulo.

---

# 3. Alcance

## Incluye

- Configuración centralizada
- Variables de entorno
- Logger
- Manejo global de errores
- Respuesta estándar de API
- Endpoint Health Check
- Información de versión
- Middleware global de errores

## No Incluye

- Login
- Usuarios
- Roles
- Supabase
- CRUD
- Base de datos
- JWT
- QR
- Reportes

---

# 4. Arquitectura

backend/

src/

core/

config/

logger/

middleware/

responses/


version/

shared/

modules/
modules/health/

app.ts

server.ts

---

# 5. Componentes

## Config

Responsabilidad:

Centralizar toda la lectura de variables de entorno.

Debe existir un único punto donde se consulte process.env.

Ningún otro módulo podrá acceder directamente a process.env.

---

## Logger

Responsabilidad:

Registrar mensajes del sistema.

Debe exponer al menos:

- info()
- warn()
- error()

No utilizar librerías externas.

Utilizar únicamente console como implementación inicial.

Debe ser fácilmente reemplazable por Winston o Pino en el futuro.

---

## ApiResponse

Responsabilidad:

Estandarizar todas las respuestas de la API.

Formato obligatorio:

Éxito

{
  success,
  message,
  data,
  meta
}

Error

{
  success,
  message,
  errors,
  meta
}

Ningún controlador podrá devolver un JSON diferente.

---

## Error Handler

Responsabilidad:

Capturar errores no controlados.

Registrar el error mediante Logger.

Responder utilizando ApiResponse.

---

## Health

Crear el endpoint:

GET /api/v1/health

Debe responder:

- nombre del sistema
- versión
- ambiente
- hora del servidor
- estado

No consultar Base de Datos.

No consultar Supabase.

---

## Version

Debe existir un único lugar donde se defina:

- versión
- nombre del sistema

No duplicar esta información.

---

# 6. Restricciones

No agregar dependencias.

No implementar autenticación.

No implementar base de datos.

No implementar Supabase.

No implementar JWT.

No agregar funcionalidades adicionales.

No modificar la arquitectura del proyecto.

---

# 7. Archivos esperados

backend/src/

core/

config/

config.ts

logger/

logger.ts

responses/

api-response.ts

middleware/

error-handler.ts

modules/health/

health.controller.ts

health.routes.ts

health.service.ts

index.ts

version/

version.ts

---

# 8. Endpoint

GET

/api/v1/health

Respuesta esperada

HTTP 200

{
    "success": true,
    "message": "SIGCA operativo",
    "data": {
        "system": "SIGCA",
        "version": "0.1.0",
        "environment": "development",
        "serverTime": "ISO8601",
        "status": "healthy"
    },
    "meta": {}
}

---

# 9. Criterios de aceptación

El proyecto compila.

Existe el endpoint Health.

El endpoint responde HTTP 200.

Existe Logger.

Existe Config.

Existe ApiResponse.

Existe ErrorHandler.

No existen dependencias nuevas.

No existe lógica de negocio.

Toda la implementación está documentada.

---

# 10. Definition of Done

- Core implementado
- Compilación correcta
- Endpoint Health funcionando
- Logger reutilizable
- Configuración centralizada
- Middleware global registrado
- Código documentado
- Sin errores TypeScript

---

# 11. Riesgos

Evitar que el Core conozca módulos funcionales.

Evitar duplicación de utilidades.

Evitar acoplamiento entre componentes.

---

# 12. Resultado esperado

Al finalizar esta SPEC el proyecto contará con un Core completamente funcional.

Todos los módulos futuros reutilizarán esta infraestructura.

Esta SPEC constituye el primer componente reutilizable del sistema.
