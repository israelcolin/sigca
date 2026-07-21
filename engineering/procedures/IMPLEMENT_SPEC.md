# IMPLEMENT_SPEC

## Objetivo

Este documento define el procedimiento estándar para implementar cualquier SPEC del proyecto SIGCA.

Todas las implementaciones deberán seguir estas instrucciones.

## Entradas

- SPEC
- Iteración

## Fuentes de Verdad

Antes de implementar cualquier entregable, se deberá revisar la documentación relacionada.

Orden de prioridad:

1. SPEC correspondiente.
2. ADR relacionadas.
3. DEC relacionadas.
4. Business Rules.
5. Domain Model.
6. Entity Relationship Model.
7. Naming Conventions.
8. PROJECT_DECISIONS.md.
9. PROJECT_ROADMAP.md.

Si existe alguna contradicción entre documentos, no asumir una solución; reportarla al final de la implementación.

---

# Procedimiento

1. Leer completamente la documentación ubicada en la carpeta `docs/`.

2. Leer completamente la SPEC indicada.

3. Comprender el objetivo antes de modificar cualquier archivo.

4. Implementar únicamente lo descrito en la SPEC.

5. Respetar completamente la arquitectura del proyecto.

6. No agregar funcionalidades adicionales.

7. No modificar otras SPEC.

8. No cambiar la arquitectura.

9. No agregar dependencias que no hayan sido solicitadas explícitamente.

10. Mantener el código limpio, documentado y consistente con los estándares del proyecto.

---

## Implementaciones SQL

Cuando la SPEC genere scripts SQL:

- Respetar Naming Conventions.
- Utilizar PostgreSQL compatible con Supabase.
- No inventar tablas ni columnas.
- No modificar el modelo físico.
- Implementar únicamente el alcance de la SPEC.
- Dividir las migraciones según el plan definido.

---

## Implementación de Seeds

Toda migración podrá tener un archivo de seed con la misma numeración y el mismo nombre del dominio.

Ejemplos:

001_create_catalogs.sql
001_seed_catalogs.sql

005_create_events.sql
005_seed_events.sql

Reglas:

- Los seeds contienen únicamente datos requeridos para el funcionamiento inicial del sistema.
- Los seeds nunca deben contener datos de prueba.
- Los datos de prueba deberán almacenarse en la carpeta backend/database/fixtures.
- Un seed sólo se implementará cuando aporte datos obligatorios para una instalación nueva de SIGCA.
- Si una migración no requiere datos iniciales, no se creará un archivo seed.

---

# Durante la implementación

- Mantener el principio de responsabilidad única (SRP).
- Evitar duplicación de código.
- Documentar funciones y clases públicas.
- Utilizar TypeScript siguiendo las reglas del proyecto.
- Mantener nombres claros y consistentes.
- Evitar lógica innecesaria.
- No utilizar valores "hardcodeados" cuando puedan centralizarse.

## Alcance

Implementar únicamente lo definido por la iteración.

No ampliar funcionalidades.

No anticipar trabajo de iteraciones futuras.

---

## Restricciones

- Respetar DEC.
- Respetar ADR.
- Respetar SPEC.
- No modificar arquitectura.
- No introducir deuda técnica.
- No refactorizar módulos ajenos.

---

## Resultado esperado

Una implementación funcional que cumpla exactamente los criterios de aceptación de la iteración.

---

## Al finalizar

Entregar únicamente:

- archivos modificados;
- breve explicación;
- riesgos detectados.