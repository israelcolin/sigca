# Tareas iniciales

Este documento es el inventario previo a la implementación. Las casillas no implican prioridad definitiva; cada tarea debe convertirse en una unidad con responsable y criterios de aceptación.

## Producto y dominio

- [ ] Designar responsable de producto y partes interesadas.
- [ ] Entrevistar a coordinadores y catequistas de distintas parroquias.
- [ ] Documentar flujo actual, problemas y excepciones.
- [ ] Crear glosario unificado del dominio catequético.
- [ ] Confirmar alcance y exclusiones del MVP.
- [ ] Definir indicadores de éxito y volumen esperado.
- [ ] Acordar criterios para inscripción, asistencia y seguimiento.

## Identidad, permisos y privacidad

- [ ] Definir matriz de roles, acciones y alcance parroquial.
- [ ] Diseñar ciclo de alta, invitación, suspensión y baja de usuarios.
- [ ] Definir cambio de parroquia activa para usuarios con varias membresías.
- [ ] Identificar datos personales y categorías sensibles.
- [ ] Validar bases legales, consentimiento y tratamiento de datos de menores.
- [ ] Establecer retención, corrección, exportación y eliminación.
- [ ] Elaborar modelo de amenazas inicial.

## Experiencia y accesibilidad

- [ ] Mapear recorridos críticos y arquitectura de información.
- [ ] Crear bocetos *mobile first* de los recorridos del MVP.
- [ ] Definir sistema visual y componentes reutilizables con MaterializeCSS.
- [ ] Fijar criterios de accesibilidad y dispositivos objetivo.
- [ ] Validar prototipos con usuarios representativos.

## Arquitectura y datos

- [ ] Revisar y aprobar el enfoque de monolito modular por capas.
- [ ] Elaborar modelo conceptual y diccionario de datos.
- [ ] Definir claves, restricciones, auditoría y estrategia de migraciones.
- [ ] Diseñar membresía y aislamiento multi-parroquia.
- [ ] Diseñar y revisar políticas RLS.
- [ ] Definir contratos iniciales de la API y formato de errores.
- [ ] Establecer estrategia de transacciones, paginación y concurrencia.
- [ ] Registrar decisiones relevantes mediante ADR.

## Plataforma y operación

- [ ] Elegir versión soportada de Node.js y gestor de paquetes.
- [ ] Definir entornos de desarrollo, pruebas, preproducción y producción.
- [ ] Diseñar gestión de secretos y variables de entorno.
- [ ] Seleccionar alojamiento para frontend y API.
- [ ] Configurar estrategia de integración y despliegue continuo.
- [ ] Definir logs, métricas, alertas y correlación.
- [ ] Establecer respaldos, restauración y recuperación ante desastres.
- [ ] Definir presupuestos iniciales de rendimiento, disponibilidad y costo.

## Calidad

- [ ] Elegir herramientas de formato, análisis y pruebas.
- [ ] Acordar pirámide de pruebas y datos de prueba seguros.
- [ ] Definir pruebas obligatorias de acceso cruzado entre parroquias.
- [ ] Preparar lista de verificación de seguridad y accesibilidad.
- [ ] Definir proceso de revisión, ramas, commits y entregas.
- [ ] Aprobar la definición de terminado.

## Puerta de entrada a implementación

No comenzar el código del MVP hasta aprobar, como mínimo: alcance, glosario, recorridos críticos, roles y permisos, obligaciones de privacidad, modelo conceptual de datos, estrategia multi-parroquia y criterios de aceptación de la primera iteración.
