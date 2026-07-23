# Hoja de ruta

La hoja de ruta expresa resultados, no fechas contractuales. Las prioridades se revisarán con responsables del producto al final de cada fase.

## Fase 0 — Descubrimiento y gobierno

**Objetivo:** acordar el problema, el lenguaje y las obligaciones del sistema.

- Validar procesos catequéticos con parroquias representativas.
- Nombrar responsables de producto, arquitectura y tratamiento de datos.
- Definir alcance del MVP, indicadores de éxito y riesgos.
- Aprobar matriz de roles y permisos.
- Establecer políticas de privacidad, consentimiento y retención.

**Salida:** alcance aprobado, glosario, flujos, permisos y requisitos no funcionales verificables.

## Fase 1 — Fundamentos técnicos

**Objetivo:** disponer de una base segura y automatizada para construir.

- Inicializar frontend, API y configuración por entornos.
- Establecer formato, análisis estático, pruebas e integración continua.
- Diseñar esquema inicial, migraciones y datos de prueba no sensibles.
- Integrar Supabase Auth y autorización parroquial.
- Implementar observabilidad, manejo de errores y auditoría base.

**Salida:** recorrido autenticado mínimo y aislamiento multi-parroquia demostrado mediante pruebas.

## Fase 2 — Operación catequética básica

**Objetivo:** administrar la estructura de un ciclo catequético.

- Parroquias, membresías y roles.
- Ciclos, niveles, comunidades o sedes y grupos.
- Registro de personas, catequistas y responsables.
- Experiencia responsiva y componentes base accesibles.

**Salida:** una parroquia puede configurar su operación y equipo sin intervención técnica cotidiana.

## Fase 3 — MVP operativo

**Objetivo:** completar el recorrido principal de seguimiento.

- Inscripción y asignación de catequizandos.
- Asistencia y seguimiento formativo básico.
- Búsqueda, filtros, paginación y reportes esenciales.
- Pruebas de seguridad, accesibilidad, rendimiento y recuperación.

**Salida:** criterio de éxito del MVP cumplido en una parroquia piloto.

## Fase 4 — Piloto y estabilización

**Objetivo:** validar el producto con uso real controlado.

- Capacitar usuarios piloto y habilitar soporte.
- Medir errores, tiempos de tarea, adopción y calidad de datos.
- Corregir fricciones y fortalecer respaldos, alertas y auditoría.
- Realizar revisión de privacidad y seguridad previa a expansión.

**Salida:** operación estable y decisión informada de despliegue a nuevas parroquias.

## Fase 5 — Expansión

**Objetivo:** escalar organización y capacidades según evidencia.

- Incorporación autoservicio controlada de parroquias.
- Reportes comparativos autorizados y exportaciones.
- Comunicaciones, portal de responsables e integraciones priorizadas.
- Optimización de rendimiento y costos con datos de producción.

**Salida:** plataforma multi-parroquia sostenible, observable y gobernada.

## Condiciones transversales

Cada fase debe preservar aislamiento de datos, accesibilidad, trazabilidad, documentación y pruebas. Ninguna capacidad futura justifica adelantar complejidad sin una necesidad validada.

## SPEC-011

- [x] 11.2.3 Login
- [x] 11.2.4 Restauración
- [x] 11.2.5 Protección de rutas
- [x] 11.2.6 Dashboard Base (consolidada)
- [ ] 11.3 Layout principal