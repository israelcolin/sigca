# Instrucciones para asistentes de programación

## Contexto

SIGCA es un sistema web *mobile first* para gestionar procesos catequéticos en múltiples parroquias. La documentación en `docs/` constituye la fuente de verdad funcional y técnica.

## Reglas obligatorias

- Comunicarse, documentar y nombrar conceptos del dominio en español; conservar en inglés sólo términos técnicos ampliamente aceptados.
- No inventar requisitos. Ante ambigüedades funcionales o de seguridad, solicitar una definición.
- Respetar la arquitectura por capas y la dirección de dependencias descrita en `docs/ARCHITECTURE.md`.
- Aplicar SOLID sin introducir abstracciones prematuras.
- Favorecer componentes y servicios pequeños, cohesivos, reutilizables y comprobables.
- Mantener la interfaz *mobile first*, semántica y accesible.
- Usar JavaScript ES6, Node.js, Express, PostgreSQL/Supabase y Supabase Auth.
- Validar datos en los límites del sistema. Nunca confiar en datos del cliente.
- Exigir autenticación y autorización de forma independiente.
- Asegurar el aislamiento por parroquia en consultas, servicios y políticas RLS; nunca aceptar un identificador de parroquia del cliente sin verificar la membresía.
- No exponer secretos, claves de servicio, tokens, datos personales ni mensajes internos de error.
- Evitar lógica de negocio en rutas, controladores, vistas o consultas SQL improvisadas.
- No duplicar reglas de negocio; centralizarlas en la capa correspondiente.
- Acompañar cambios con pruebas proporcionales al riesgo.
- Actualizar documentación, tareas y ADR cuando cambien alcance, arquitectura o decisiones relevantes.

## Antes de proponer cambios

1. Consultar `docs/PROJECT_CONTEXT.md` y `docs/ARCHITECTURE.md`.
2. Revisar `docs/CODING_STANDARDS.md`.
3. Confirmar que el cambio pertenece al alcance vigente en `docs/ROADMAP.md` y `docs/TASKS.md`.
4. Señalar supuestos y riesgos, especialmente los relacionados con datos personales y multi-tenencia.

## Restricciones actuales

El repositorio se encuentra en fase documental. No generar código de aplicación, dependencias, migraciones ni configuración de infraestructura hasta que se apruebe formalmente el inicio de implementación.
