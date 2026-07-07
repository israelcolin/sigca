# SPEC-004 - Supabase Core

## Proyecto

SIGCA - Sistema Integral de Gestión Catequética

---

## Estado

Aprobada

---

## Objetivo

Integrar la infraestructura base de Supabase dentro del Core de SIGCA.

Esta implementación deberá proporcionar una única instancia reutilizable del cliente de Supabase, centralizar la configuración mediante variables de entorno y validar que el entorno esté correctamente configurado antes de iniciar el servidor.

No deberá implementar autenticación ni lógica de negocio.

---

## Contexto

SIGCA utilizará Supabase como plataforma principal para:

- PostgreSQL
- Authentication
- Storage
- Row Level Security

Para mantener el desacoplamiento del sistema, ningún módulo podrá acceder directamente al SDK de Supabase ni consultar `process.env`.

Todo acceso deberá realizarse a través del Core.

---

## Alcance

### Incluye

- Instalación del SDK oficial `@supabase/supabase-js`.
- Configuración mediante variables de entorno.
- Validación de variables obligatorias.
- Cliente único reutilizable.
- Exportación centralizada.
- Documentación.

### No incluye

- Login.
- Logout.
- Usuarios.
- Roles.
- Consultas SQL.
- CRUD.
- Storage.
- Edge Functions.
- Service Role Key.

---

## Arquitectura

backend/src/

core/

config/

env.ts

database/

client.ts

supabase-client.ts

index.ts

---

## Variables de entorno

Obligatorias:

- APP_NAME
- APP_VERSION
- NODE_ENV
- PORT
- SUPABASE_URL
- SUPABASE_ANON_KEY

---

## Responsabilidades

### env.ts

- Centralizar toda lectura de `process.env`.
- Validar variables obligatorias.
- Exponer un único objeto `env`.

Ejemplo conceptual:

env.app.name

env.app.version

env.server.port

env.supabase.url

env.supabase.anonKey

---

### client.ts

Definir el contrato de acceso a la base de datos.

No contendrá lógica de negocio.

---

### supabase-client.ts

Crear una única instancia del cliente de Supabase.

No realizar consultas.

No autenticar usuarios.

---

### index.ts

Exportar el cliente para reutilizarlo en el resto del sistema.

---

## Seguridad

No utilizar la Service Role Key.

No registrar llaves en consola.

No almacenar credenciales dentro del código.

Las variables sensibles deberán residir únicamente en archivos `.env`.

---

## Restricciones

No crear tablas.

No realizar consultas.

No crear autenticación.

No implementar repositorios.

No modificar otros módulos.

No agregar dependencias adicionales aparte del SDK oficial.

---

## Archivos esperados

backend/src/core/config/env.ts

backend/src/core/database/client.ts

backend/src/core/database/supabase-client.ts

backend/src/core/database/index.ts

backend/.env.example

backend/.env.development (local)

---

## Criterios de aceptación

- SDK instalado.
- Variables validadas.
- Cliente único reutilizable.
- El servidor continúa iniciando correctamente.
- No existen errores TypeScript.
- No existen consultas a Supabase.
- No existen cambios funcionales.

---

## Definition of Done

- Configuración centralizada.
- Cliente reutilizable.
- Variables protegidas.
- Documentación actualizada.
- Implementación aprobada por revisión técnica.

---

## Riesgos

Evitar el acceso directo a `process.env`.

Evitar múltiples instancias del cliente de Supabase.

Evitar exponer credenciales en el repositorio.

---

## Resultado esperado

El backend contará con una infraestructura desacoplada para utilizar Supabase en futuras SPEC.

A partir de este momento, todos los módulos utilizarán el cliente centralizado proporcionado por el Core.

## Depende de

- SPEC-003 Core Foundation

## Habilita

- SPEC-005 Supabase Auth
- SPEC-006 Modelo de Datos