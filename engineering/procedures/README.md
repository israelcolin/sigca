# Engineering Procedures

## Objetivo

Los procedimientos de esta carpeta definen el flujo oficial para implementar cualquier cambio en SIGCA.

Su propósito es garantizar que todas las implementaciones:

- respeten la arquitectura del proyecto;
- sigan las decisiones documentadas (DEC);
- implementen únicamente lo definido en los SPEC;
- mantengan un proceso repetible y auditable.

---

# Flujo oficial

Toda iteración deberá seguir el siguiente orden:

1. Context Review
2. Implementación
3. Pruebas funcionales
4. Code Review
5. Commit
6. Tag
7. Actualización del SPEC (estado de la iteración)

No deberá omitirse ningún paso.

---

# Procedimientos

## CONTEXT_REVIEW.md

Analiza el estado actual del proyecto antes de implementar una iteración.

Su objetivo es comprender la arquitectura existente y detectar restricciones.

---

## IMPLEMENT_SPEC.md

Implementa únicamente el alcance definido por una iteración del SPEC correspondiente.

No permite cambios fuera del alcance.

---

## CODE_REVIEW.md

Valida que la implementación cumple:

- alcance de la iteración;
- arquitectura;
- decisiones de diseño;
- criterios de aceptación.

No propone nuevas funcionalidades ni refactorizaciones.

---

# Principios

Los procedimientos nunca sustituyen a los SPEC.

Los SPEC continúan siendo la fuente oficial de requisitos funcionales.

Los procedimientos únicamente definen cómo ejecutar una implementación.