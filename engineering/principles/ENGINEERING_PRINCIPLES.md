# Engineering Principles
# Sistema Integral de Gestión Catequética (SIGCA)

| Campo | Valor |
|-------|-------|
| Documento | ENGINEERING_PRINCIPLES |
| Versión | 1.0 |
| Estado | Activo |
| Fecha | 2026-07-16 |

---

# Introducción

Este documento define los principios de ingeniería que guían el desarrollo de SIGCA.

No describe funcionalidades del sistema.

No define reglas de negocio.

No sustituye las especificaciones técnicas (SPEC) ni los registros de decisiones arquitectónicas (DEC).

Su propósito es establecer una filosofía común de desarrollo que permita mantener la calidad del proyecto a lo largo del tiempo.

Toda decisión técnica deberá evaluarse considerando estos principios.

---

# Principio 1
## La simplicidad tiene prioridad sobre la sofisticación

Se favorecerán soluciones simples, comprensibles y mantenibles sobre soluciones complejas que aporten beneficios marginales.

La mejor arquitectura no es la más elaborada, sino la que resuelve el problema con la menor complejidad posible.

---

# Principio 2
## La tecnología sirve al proyecto

Las tecnologías utilizadas deberán responder a necesidades reales del sistema.

No se incorporarán frameworks, librerías o herramientas únicamente por tendencias del mercado o popularidad.

Cada nueva dependencia deberá justificar claramente el beneficio que aporta.

---

# Principio 3
## La documentación forma parte del producto

La documentación no es una actividad posterior al desarrollo.

Toda funcionalidad deberá contar con su especificación correspondiente.

Los cambios relevantes deberán reflejarse en:

- SPEC
- DEC
- CHANGELOG
- Journal
- README

cuando corresponda.

---

# Principio 4
## La arquitectura precede a la implementación

Antes de escribir código deberán existir decisiones claras sobre:

- responsabilidades;
- estructura;
- dependencias;
- integración.

El objetivo es reducir retrabajo y evitar soluciones improvisadas.

---

# Principio 5
## Una mejora no debe impedir el avance

Durante el desarrollo surgirán oportunidades de mejora.

Las mejoras que representen una optimización menor deberán documentarse para futuras iteraciones y no deberán retrasar la implementación de funcionalidades comprometidas.

Únicamente las decisiones que reduzcan un riesgo arquitectónico importante justificarán modificar el plan de trabajo.

---

# Principio 6
## La reutilización es preferible a la duplicación

Antes de crear un nuevo componente deberá verificarse si uno existente puede reutilizarse.

La duplicación de código deberá evitarse siempre que no comprometa la claridad de la solución.

---

# Principio 7
## La configuración debe estar desacoplada

La identidad institucional del sistema deberá residir en archivos de configuración.

La aplicación deberá ser capaz de iniciar incluso cuando la Base de Datos no esté disponible.

Logotipos.

Colores.

Textos.

Recursos gráficos.

Parámetros visuales.

No dependerán exclusivamente de PostgreSQL.

---

# Principio 8
## El usuario es el centro del diseño

Las decisiones técnicas deberán favorecer la experiencia del usuario.

El sistema deberá sentirse cercano, sencillo y orientado al trabajo pastoral.

La tecnología nunca deberá convertirse en un obstáculo para el usuario final.

---

# Principio 9
## Consistencia antes que creatividad

Todos los módulos deberán compartir:

- componentes;
- navegación;
- estilos;
- comportamiento.

La consistencia reduce la curva de aprendizaje y facilita el mantenimiento.

---

# Principio 10
## El código debe ser fácil de leer

El código será leído muchas más veces de las que será escrito.

La claridad tendrá prioridad sobre soluciones excesivamente ingeniosas.

---

# Principio 11
## Cada componente tiene una responsabilidad

Cada módulo deberá tener un único propósito claramente definido.

Las responsabilidades deberán permanecer separadas.

Backend.

Frontend.

Base de Datos.

Configuración.

Documentación.

No deberán mezclarse.

---

# Principio 12
## Diseñar para evolucionar

Toda nueva funcionalidad deberá integrarse sobre la arquitectura existente.

El crecimiento del sistema deberá lograrse mediante extensión y no mediante reescritura.

---

# Principio 13
## Calidad incremental

El proyecto evolucionará mediante pequeñas mejoras continuas.

Cada iteración deberá dejar el sistema en un estado igual o mejor que el recibido.

---

# Principio 14
## La Base de Datos es un activo estratégico

El modelo de datos constituye el núcleo del sistema.

Las reglas de negocio relacionadas con persistencia deberán implementarse de manera consistente mediante:

- restricciones;
- vistas;
- funciones;
- políticas de seguridad.

La integridad de la información tendrá prioridad sobre la comodidad de implementación.

---

# Principio 15
## El proyecto debe poder mantenerse durante muchos años

Las decisiones de hoy deberán considerar que SIGCA podrá evolucionar durante muchos años.

Se privilegiarán tecnologías maduras y ampliamente soportadas.

La mantenibilidad tendrá prioridad sobre la innovación innecesaria.

---

# Manifiesto de Ingeniería de SIGCA

Construimos software para servir a las personas.

Valoramos la simplicidad sobre la complejidad.

La claridad sobre la sofisticación.

La documentación sobre la memoria.

La arquitectura sobre la improvisación.

La estabilidad sobre la moda tecnológica.

Creemos que un sistema bien diseñado debe ser fácil de comprender, sencillo de mantener y capaz de evolucionar durante muchos años sin perder coherencia.

Cada línea de código deberá contribuir a ese objetivo.