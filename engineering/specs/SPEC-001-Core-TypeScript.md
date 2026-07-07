# SPEC-001 - Core Type Script

## Estado

En desarrollo

---

## Objetivo

Reorganizar la estructura del backend de SIGCA para seguir el estándar arquitectónico del proyecto basado en Node.js, Express y TypeScript.

Esta tarea únicamente reorganiza archivos y configuración.

No implementa ninguna funcionalidad de negocio.

---

## Contexto

Actualmente el backend fue generado con una estructura inicial.

Antes de comenzar el desarrollo funcional es necesario adoptar una estructura estándar que facilite el crecimiento del proyecto.

---

## Alcance

### Incluye

- Crear la carpeta `src`.
- Mover `app.ts` y `server.ts` a `src`.
- Mover todas las carpetas técnicas dentro de `src`.
- Ajustar las rutas necesarias.
- Actualizar la configuración de TypeScript si es necesario.
- Mantener el proyecto compilando correctamente.

### No incluye

- Endpoints.
- CRUD.
- Supabase.
- Login.
- Middleware personalizado.
- Lógica de negocio.

---

## Arquitectura esperada

backend/

src/

config/

constants/

controllers/

interfaces/

middlewares/

repositories/

routes/

services/

tests/

types/

utils/

validators/

app.ts

server.ts

dist/

---

## Archivos involucrados

- package.json
- tsconfig.json
- backend/src/app.ts
- backend/src/server.ts

---

## Dependencias

No agregar nuevas dependencias.

---

## Criterios de aceptación

- [ ] Existe la carpeta `src`.
- [ ] Todo el código TypeScript se encuentra dentro de `src`.
- [ ] La compilación continúa funcionando.
- [ ] No existen cambios funcionales.
- [ ] No existen errores de importación.

---

## Restricciones

No modificar la arquitectura definida en la documentación.

No implementar funcionalidades adicionales.

No agregar dependencias.

---

## Resultado esperado

El backend queda preparado para comenzar el desarrollo de módulos funcionales.

---

## Estado Final

Pendiente de implementación.